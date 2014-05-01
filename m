From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 May 2014 23:38:27 +0200
Subject: [Buildroot] [git commit] Makefile: target-purgelocales: fix
	top-level parallel make support
Message-ID: <20140501214016.78C369CAAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58d82dda1a3df4bfe00bc0c2c4257840030fff95
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |   40 +++++++++++++++++++---------------------
 1 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/Makefile b/Makefile
index 30b2271..2f18aab 100644
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
@@ -516,9 +512,28 @@ STRIP_FIND_CMD += -type f \( -perm /111 -o -name '*.so*' \)
 #   done for kernel modules with incorrect permissions.
 STRIP_FIND_CMD += -not \( $(call findfileclauses,libpthread*.so* *.ko $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print
 
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
@@ -582,23 +597,6 @@ endif
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
