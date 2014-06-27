From: Fabio Porcedda <fabio.porcedda@telit.com>
Date: Fri, 27 Jun 2014 14:15:58 +0200
Subject: [Buildroot] [PATCH v3 4/5] Makefile: convert
	"target-generatelocales" to a hook
In-Reply-To: <1403871359-18849-1-git-send-email-fabio.porcedda@telit.com>
References: <1403871359-18849-1-git-send-email-fabio.porcedda@telit.com>
Message-ID: <1403871359-18849-5-git-send-email-fabio.porcedda@telit.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For consinstency sake convert the "target-generatelocales" rule to a
TARGET_FINALIZE_HOOKS hook.

Signed-off-by: Fabio Porcedda <fabio.porcedda@telit.com>
---

Notes:
    v3:
     - add this patch (Arnout)

 Makefile | 64 +++++++++++++++++++++++++++++++---------------------------------
 1 file changed, 31 insertions(+), 33 deletions(-)

diff --git a/Makefile b/Makefile
index c790f7a..95ad1f4 100644
--- a/Makefile
+++ b/Makefile
@@ -324,9 +324,6 @@ HOST_DIR := $(call qstrip,$(BR2_HOST_DIR))
 # Quotes are needed for spaces and all in the original PATH content.
 BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin:$(PATH)"
 
-# locales to generate
-GENERATE_LOCALE = $(call qstrip,$(BR2_GENERATE_LOCALE))
-
 TARGET_SKELETON = $(TOPDIR)/system/skeleton
 
 # Location of a file giving a big fat warning that output/target
@@ -390,12 +387,6 @@ include fs/common.mk
 
 include $(BR2_EXTERNAL)/external.mk
 
-ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
-ifneq ($(GENERATE_LOCALE),)
-TARGETS += target-generatelocales
-endif
-endif
-
 TARGETS_SOURCE := $(patsubst %,%-source,$(TARGETS))
 TARGETS_DIRCLEAN := $(patsubst %,%-dirclean,$(TARGETS))
 
@@ -513,6 +504,37 @@ endef
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
@@ -603,30 +625,6 @@ endif
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
-- 
2.0.0
