From: Fabio Porcedda <fabio.porcedda@telit.com>
Date: Fri, 27 Jun 2014 14:15:57 +0200
Subject: [Buildroot] [PATCH v3 3/5] Makefile: convert
	"toolchain-eclipse-register" to a hook
In-Reply-To: <1403871359-18849-1-git-send-email-fabio.porcedda@telit.com>
References: <1403871359-18849-1-git-send-email-fabio.porcedda@telit.com>
Message-ID: <1403871359-18849-4-git-send-email-fabio.porcedda@telit.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For consinstency sake convert the "toolchain-eclipse-register" to a
TARGET_FINALIZE_HOOKS hook.

Signed-off-by: Fabio Porcedda <fabio.porcedda@telit.com>
---

Notes:
    v3:
     - add this patch (Arnout)

 Makefile | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 3e845f6..c790f7a 100644
--- a/Makefile
+++ b/Makefile
@@ -396,10 +396,6 @@ TARGETS += target-generatelocales
 endif
 endif
 
-ifeq ($(BR2_ECLIPSE_REGISTER),y)
-TARGETS += toolchain-eclipse-register
-endif
-
 TARGETS_SOURCE := $(patsubst %,%-source,$(TARGETS))
 TARGETS_DIRCLEAN := $(patsubst %,%-dirclean,$(TARGETS))
 
@@ -509,6 +505,14 @@ STRIP_FIND_CMD += -type f \( -perm /111 -o -name '*.so*' \)
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
@@ -628,9 +632,6 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize
 		$(call MESSAGE,"Executing post-image script $(s)"); \
 		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
-toolchain-eclipse-register: toolchain
-	./support/scripts/eclipse-register-toolchain `readlink -f $(O)` $(notdir $(TARGET_CROSS)) $(BR2_ARCH)
-
 source: $(TARGETS_SOURCE) $(HOST_SOURCE)
 
 external-deps:
-- 
2.0.0
