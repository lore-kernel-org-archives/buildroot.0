From: Gleb Mazovetskiy <glex.spb@gmail.com>
Date: Sun,  3 Jan 2021 17:01:50 +0000
Subject: [Buildroot] [PATCH v4 1/1] Makefile: Parallelize glibc locale
 generation
Message-ID: <20210103170150.2247979-1-glex.spb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Parallelizes locale generation based on `BR2_JLEVEL` setting.

Locale generation always runs during the finalize stage and can consume
a significant amount of time. Parallelizing it greatly reduces that time
on multi-core machines.

To parallelize it, we first invoke `localedef` for every locale in
parallel with the `--no-archive` option. This creates the intermediate
locale data instead of writing to the finally archive directly.

Then, we invoke `localedef` again once to create the archive from the
intermediate compiled locale data files.

We have to do it this way because `localedef` does not do any locking
when writing to the archive file, so calling it without `--no-archive`
concurrently could result in a corrupt archive file or an archive file
that is missing some locales.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
---
 Makefile                          | 29 +++++++---------------
 support/misc/gen-glibc-locales.mk | 41 +++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+), 20 deletions(-)
 create mode 100644 support/misc/gen-glibc-locales.mk

diff --git a/Makefile b/Makefile
index 4d334adcd6..dbeabf9e61 100644
--- a/Makefile
+++ b/Makefile
@@ -661,32 +661,21 @@ endef
 TARGET_FINALIZE_HOOKS += TOOLCHAIN_ECLIPSE_REGISTER
 endif
 
-# Generate locale data. Basically, we call the localedef program
-# (built by the host-localedef package) for each locale. The input
-# data comes preferably from the toolchain, or if the toolchain does
-# not have them (Linaro toolchains), we use the ones available on the
-# host machine.
+# Generate locale data.
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 GLIBC_GENERATE_LOCALES = $(call qstrip,$(BR2_GENERATE_LOCALE))
 ifneq ($(GLIBC_GENERATE_LOCALES),)
 PACKAGES += host-localedef
 
 define GENERATE_GLIBC_LOCALES
-	$(Q)mkdir -p $(TARGET_DIR)/usr/lib/locale/
-	$(Q)for locale in $(GLIBC_GENERATE_LOCALES) ; do \
-		inputfile=`echo $${locale} | cut -f1 -d'.'` ; \
-		charmap=`echo $${locale} | cut -f2 -d'.' -s` ; \
-		if test -z "$${charmap}" ; then \
-			charmap="UTF-8" ; \
-		fi ; \
-		echo "Generating locale $${inputfile}.$${charmap}" ; \
-		I18NPATH=$(STAGING_DIR)/usr/share/i18n:/usr/share/i18n \
-		$(HOST_DIR)/bin/localedef \
-			--prefix=$(TARGET_DIR) \
-			--$(call LOWERCASE,$(BR2_ENDIAN))-endian \
-			-i $${inputfile} -f $${charmap} \
-			$${locale} ; \
-	done
+	$(TARGET_CONFIGURE_OPTS) \
+	$(MAKE) -j$(PARALLEL_JOBS) -f support/misc/gen-glibc-locales.mk \
+		HOST_DIR=$(HOST_DIR) \
+		TARGET_DIR=$(TARGET_DIR) \
+		STAGING_DIR=$(STAGING_DIR) \
+		ENDIAN=$(call LOWERCASE,$(BR2_ENDIAN)) \
+		LOCALES="$(GLIBC_GENERATE_LOCALES)" \
+		Q=$(Q)
 endef
 TARGET_FINALIZE_HOOKS += GENERATE_GLIBC_LOCALES
 endif
diff --git a/support/misc/gen-glibc-locales.mk b/support/misc/gen-glibc-locales.mk
new file mode 100644
index 0000000000..e74f81b0af
--- /dev/null
+++ b/support/misc/gen-glibc-locales.mk
@@ -0,0 +1,41 @@
+# Generates glibc locale data for target.
+
+inputfile = $(firstword $(subst ., ,$(1)))
+charmap = $(or $(word 2,$(subst ., ,$(1))),UTF-8)
+
+# Packages all the generated locale data into the final archive.
+#
+# We sort the file names to produce consistent output regardless of
+# the `find` outputs order.
+$(TARGET_DIR)/usr/lib/locale/locale-archive: $(LOCALES)
+	$(Q)find $(TARGET_DIR)/usr/lib/locale/ -maxdepth 1 -mindepth 1 -type d -print0 \
+	| sort -z \
+	| xargs -x -0 \
+		$(HOST_DIR)/bin/localedef \
+			--prefix=$(TARGET_DIR) \
+			--$(ENDIAN)-endian \
+			--replace \
+			--add-to-archive
+
+# Generates locale data for each locale.
+#
+# The input data comes preferably from the toolchain, or if the toolchain
+# does not have them (Linaro toolchains), we use the ones available on the
+# host machine.
+#
+# Uses `localedef`, which is built by the `host-localedef` package.
+$(LOCALES): | $(TARGET_DIR)/usr/lib/locale/
+	$(Q)echo "Generating locale $(@)"
+	$(Q)I18NPATH=$(STAGING_DIR)/usr/share/i18n:/usr/share/i18n \
+	$(HOST_DIR)/bin/localedef \
+		--prefix=$(TARGET_DIR) \
+		--$(ENDIAN)-endian \
+		--no-archive \
+		-i $(call inputfile,$(@)) \
+		-f $(call charmap,$(@)) \
+		$(@)
+
+.PHONY: $(LOCALES)
+
+$(TARGET_DIR)/usr/lib/locale/:
+	$(Q)mkdir -p $(TARGET_DIR)/usr/lib/locale/
-- 
2.27.0
