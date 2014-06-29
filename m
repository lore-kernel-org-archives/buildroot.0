From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 16:43:46 +0200
Subject: [Buildroot] [git commit] Makefile: convert "target-generatelocales"
	to a hook
Message-ID: <20140629145327.D8A639CFC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=33de7401701e5242196a86b0695ee4ae9a4c4082
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For consinstency sake convert the "target-generatelocales" rule to a
TARGET_FINALIZE_HOOKS hook.

Signed-off-by: Fabio Porcedda <fabio.porcedda@telit.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |   64 ++++++++++++++++++++++++++++++-------------------------------
 1 files changed, 31 insertions(+), 33 deletions(-)

diff --git a/Makefile b/Makefile
index 7eeef23..9203012 100644
--- a/Makefile
+++ b/Makefile
@@ -325,9 +325,6 @@ HOST_DIR := $(call qstrip,$(BR2_HOST_DIR))
 # Quotes are needed for spaces and all in the original PATH content.
 BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin:$(PATH)"
 
-# locales to generate
-GENERATE_LOCALE = $(call qstrip,$(BR2_GENERATE_LOCALE))
-
 TARGET_SKELETON = $(TOPDIR)/system/skeleton
 
 # Location of a file giving a big fat warning that output/target
@@ -391,12 +388,6 @@ include fs/common.mk
 
 include $(BR2_EXTERNAL)/external.mk
 
-ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
-ifneq ($(GENERATE_LOCALE),)
-TARGETS += target-generatelocales
-endif
-endif
-
 TARGETS_SOURCE := $(patsubst %,%-source,$(TARGETS))
 TARGETS_DIRCLEAN := $(patsubst %,%-dirclean,$(TARGETS))
 
@@ -514,6 +505,37 @@ endef
 TARGET_FINALIZE_HOOKS += TOOLCHAIN_ECLIPSE_REGISTER
 endif
 
+# Generate locale data. Basically, we call the localedef program
+# (built by the host-localedef package) for each locale. The input
+# data comes preferably from the toolchain, or if the toolchain does
+# not have them (Linaro toolchains), we use the ones available on the
+# host machine.
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
+GENERATE_LOCALE = $(call qstrip,$(BR2_GENERATE_LOCALE))
+ifneq ($(GENERATE_LOCALE),)
+TARGETS += host-localedef
+
+define GENERATE_LOCALES
+	$(Q)mkdir -p $(TARGET_DIR)/usr/lib/locale/
+	$(Q)for locale in $(GENERATE_LOCALE) ; do \
+		inputfile=`echo $${locale} | cut -f1 -d'.'` ; \
+		charmap=`echo $${locale} | cut -f2 -d'.' -s` ; \
+		if test -z "$${charmap}" ; then \
+			charmap="UTF-8" ; \
+		fi ; \
+		echo "Generating locale $${inputfile}.$${charmap}" ; \
+		I18NPATH=$(STAGING_DIR)/usr/share/i18n:/usr/share/i18n \
+		$(HOST_DIR)/usr/bin/localedef \
+			--prefix=$(TARGET_DIR) \
+			--$(call LOWERCASE,$(BR2_ENDIAN))-endian \
+			-i $${inputfile} -f $${charmap} \
+			$${locale} ; \
+	done
+endef
+TARGET_FINALIZE_HOOKS += GENERATE_LOCALES
+endif
+endif
+
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 LOCALE_WHITELIST = $(BUILD_DIR)/locales.nopurge
 LOCALE_NOPURGE = $(call qstrip,$(BR2_ENABLE_LOCALE_WHITELIST))
@@ -604,30 +626,6 @@ endif
 		$(call MESSAGE,"Executing post-build script $(s)"); \
 		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
-ifneq ($(GENERATE_LOCALE),)
-# Generate locale data. Basically, we call the localedef program
-# (built by the host-localedef package) for each locale. The input
-# data comes preferably from the toolchain, or if the toolchain does
-# not have them (Linaro toolchains), we use the ones available on the
-# host machine.
-target-generatelocales: host-localedef toolchain
-	$(Q)mkdir -p $(TARGET_DIR)/usr/lib/locale/
-	$(Q)for locale in $(GENERATE_LOCALE) ; do \
-		inputfile=`echo $${locale} | cut -f1 -d'.'` ; \
-		charmap=`echo $${locale} | cut -f2 -d'.' -s` ; \
-		if test -z "$${charmap}" ; then \
-			charmap="UTF-8" ; \
-		fi ; \
-		echo "Generating locale $${inputfile}.$${charmap}" ; \
-		I18NPATH=$(STAGING_DIR)/usr/share/i18n:/usr/share/i18n \
-		$(HOST_DIR)/usr/bin/localedef \
-			--prefix=$(TARGET_DIR) \
-			--$(call LOWERCASE,$(BR2_ENDIAN))-endian \
-			-i $${inputfile} -f $${charmap} \
-			$${locale} ; \
-	done
-endif
-
 target-post-image: $(TARGETS_ROOTFS) target-finalize
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
