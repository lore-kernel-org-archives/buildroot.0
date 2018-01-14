From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 14 Jan 2018 22:03:29 +0100
Subject: [Buildroot] [PATCH 1/7] package/skeleton-init-common: add /bin/sh
 to /etc/shells
In-Reply-To: <1515963815-5843-1-git-send-email-romain.naour@smile.fr>
References: <1515963815-5843-1-git-send-email-romain.naour@smile.fr>
Message-ID: <1515963815-5843-2-git-send-email-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the default shell /bin/sh to /etc/shells only if BR2_SYSTEM_BIN_SH_NONE
is not selected.

Add an empty /etc/shells in the rootfs skeleton.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/skeleton-init-common/skeleton-init-common.mk | 7 +++++++
 system/skeleton/etc/shells                           | 1 +
 2 files changed, 8 insertions(+)
 create mode 100644 system/skeleton/etc/shells

diff --git a/package/skeleton-init-common/skeleton-init-common.mk b/package/skeleton-init-common/skeleton-init-common.mk
index 8228a81..707f1aa 100644
--- a/package/skeleton-init-common/skeleton-init-common.mk
+++ b/package/skeleton-init-common/skeleton-init-common.mk
@@ -79,6 +79,12 @@ define SKELETON_INIT_COMMON_SET_BIN_SH
 	rm -f $(TARGET_DIR)/bin/sh
 endef
 else
+# Add /bin/sh to /etc/shells otherwise some login tools like dropbear
+# can reject the user connexion. See man shells.
+define SKELETON_INIT_COMMON_ADD_SH_TO_SHELLS
+	grep -qsE '^/bin/sh' $(TARGET_DIR)/etc/shells \
+		|| echo "/bin/sh" >> $(TARGET_DIR)/etc/shells
+endef
 ifneq ($(SKELETON_INIT_COMMON_BIN_SH),)
 define SKELETON_INIT_COMMON_SET_BIN_SH
 	ln -sf $(SKELETON_INIT_COMMON_BIN_SH) $(TARGET_DIR)/bin/sh
@@ -86,5 +92,6 @@ endef
 endif
 endif
 SKELETON_INIT_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_INIT_COMMON_SET_BIN_SH
+SKELETON_INIT_COMMON_POST_INSTALL_TARGET_HOOKS += SKELETON_INIT_COMMON_ADD_SH_TO_SHELLS
 
 $(eval $(generic-package))
diff --git a/system/skeleton/etc/shells b/system/skeleton/etc/shells
new file mode 100644
index 0000000..b5fd584
--- /dev/null
+++ b/system/skeleton/etc/shells
@@ -0,0 +1 @@
+# /etc/shells: valid login shells
-- 
2.7.4
