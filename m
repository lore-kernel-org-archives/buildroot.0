From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 29 Apr 2014 17:32:34 +0200
Subject: [Buildroot] [PATCH v2] Makefile: target-purgelocales: fix top-level
	parallel make support
Message-ID: <1398785554-6797-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The "target-purgelocales" target must be executed after all the other
targets and before the "target-finalize" target, so create a
TARGET_PURGE_LOCALES variable containing the commands of the target
"target-purgelocales" and add it at the beginning of the
"target-finalize" target.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
---
v2:
  - rewrite the patch following Arnout suggestion

 Makefile | 40 +++++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/Makefile b/Makefile
index eff408b..00e9798 100644
--- a/Makefile
+++ b/Makefile
@@ -391,10 +391,6 @@ include system/system.mk
 
 include $(BR2_EXTERNAL)/external.mk
 
-ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
-TARGETS += target-purgelocales
-endif
-
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 ifneq ($(GENERATE_LOCALE),)
 TARGETS += target-generatelocales
@@ -509,9 +505,28 @@ endif
 STRIP_FIND_CMD += -type f \( -perm /111 -o -name '*.so*' \)
 STRIP_FIND_CMD += -not \( $(call findfileclauses,libpthread*.so* $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print
 
+ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
+LOCALE_WHITELIST = $(BUILD_DIR)/locales.nopurge
+LOCALE_NOPURGE = $(call qstrip,$(BR2_ENABLE_LOCALE_WHITELIST))
+
+define TARGET_PURGE_LOCALES
+	rm -f $(LOCALE_WHITELIST)
+	for i in $(LOCALE_NOPURGE); do echo $$i >> $(LOCALE_WHITELIST); done
+
+	for dir in $(wildcard $(addprefix $(TARGET_DIR),/usr/share/locale /usr/share/X11/locale /usr/man /usr/share/man /usr/lib/locale)); \
+	do \
+		for lang in $$(cd $$dir; ls .|grep -v man); \
+		do \
+			grep -qx $$lang $(LOCALE_WHITELIST) || rm -rf $$dir/$$lang; \
+		done; \
+	done
+endef
+endif
+
 $(TARGETS_ROOTFS): target-finalize
 
 target-finalize: $(TARGETS)
+	$(TARGET_PURGE_LOCALES)
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
 		$(TARGET_DIR)/usr/lib/cmake $(TARGET_DIR)/usr/share/cmake
@@ -575,23 +590,6 @@ endif
 		$(call MESSAGE,"Executing post-build script $(s)"); \
 		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
-ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
-LOCALE_WHITELIST = $(BUILD_DIR)/locales.nopurge
-LOCALE_NOPURGE = $(call qstrip,$(BR2_ENABLE_LOCALE_WHITELIST))
-
-target-purgelocales:
-	rm -f $(LOCALE_WHITELIST)
-	for i in $(LOCALE_NOPURGE); do echo $$i >> $(LOCALE_WHITELIST); done
-
-	for dir in $(wildcard $(addprefix $(TARGET_DIR),/usr/share/locale /usr/share/X11/locale /usr/man /usr/share/man /usr/lib/locale)); \
-	do \
-		for lang in $$(cd $$dir; ls .|grep -v man); \
-		do \
-			grep -qx $$lang $(LOCALE_WHITELIST) || rm -rf $$dir/$$lang; \
-		done; \
-	done
-endif
-
 ifneq ($(GENERATE_LOCALE),)
 # Generate locale data. Basically, we call the localedef program
 # (built by the host-localedef package) for each locale. The input
-- 
1.8.3.2
