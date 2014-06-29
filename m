From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 16:43:06 +0200
Subject: [Buildroot] [git commit] Makefile: convert
	"toolchain-eclipse-register" to a hook
Message-ID: <20140629145327.D1B719CFC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=28685d5f6cc0ace6c8d47ee590aa768d693ac0e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For consinstency sake convert the "toolchain-eclipse-register" to a
TARGET_FINALIZE_HOOKS hook.

Signed-off-by: Fabio Porcedda <fabio.porcedda@telit.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |   15 ++++++++-------
 1 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index c106c71..7eeef23 100644
--- a/Makefile
+++ b/Makefile
@@ -397,10 +397,6 @@ TARGETS += target-generatelocales
 endif
 endif
 
-ifeq ($(BR2_ECLIPSE_REGISTER),y)
-TARGETS += toolchain-eclipse-register
-endif
-
 TARGETS_SOURCE := $(patsubst %,%-source,$(TARGETS))
 TARGETS_DIRCLEAN := $(patsubst %,%-dirclean,$(TARGETS))
 
@@ -510,6 +506,14 @@ STRIP_FIND_CMD += -type f \( -perm /111 -o -name '*.so*' \)
 #   done for kernel modules with incorrect permissions.
 STRIP_FIND_CMD += -not \( $(call findfileclauses,libpthread*.so* *.ko $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print
 
+ifeq ($(BR2_ECLIPSE_REGISTER),y)
+define TOOLCHAIN_ECLIPSE_REGISTER
+	./support/scripts/eclipse-register-toolchain `readlink -f $(O)` \
+		$(notdir $(TARGET_CROSS)) $(BR2_ARCH)
+endef
+TARGET_FINALIZE_HOOKS += TOOLCHAIN_ECLIPSE_REGISTER
+endif
+
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 LOCALE_WHITELIST = $(BUILD_DIR)/locales.nopurge
 LOCALE_NOPURGE = $(call qstrip,$(BR2_ENABLE_LOCALE_WHITELIST))
@@ -629,9 +633,6 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize
 		$(call MESSAGE,"Executing post-image script $(s)"); \
 		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
-toolchain-eclipse-register: toolchain
-	./support/scripts/eclipse-register-toolchain `readlink -f $(O)` $(notdir $(TARGET_CROSS)) $(BR2_ARCH)
-
 source: $(TARGETS_SOURCE) $(HOST_SOURCE)
 
 external-deps:
