From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Feb 2020 20:17:57 +0100
Subject: [Buildroot] [git commit] package/skeleton-init-sysv: conditionally
 enable swapon/swapoff in inittab
Message-ID: <20200208190924.6D1E18D4D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbe18eb246375af9d8c9421045ba315573049c43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default inittab files added by busybox and sysvinit runs 'swapon -a'
during init and 'swapoff -a' during shutdown, but those programs are not
guaranteed to be available, so the boot log may become polluted by error
messages like this:

    swapon: not found

Add a target-finalize hook to skeleton-init-sysv that enables or disables
the swapon/swapoff lines in /etc/inittab, depending on the existence of
$(TARGET_DIR)/sbin/swap{on,off}.

Based on a previous patch sent by Thomas De Schampheleire.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/skeleton-init-sysv/skeleton-init-sysv.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/skeleton-init-sysv/skeleton-init-sysv.mk b/package/skeleton-init-sysv/skeleton-init-sysv.mk
index c89c2dc1fd..009dc100ea 100644
--- a/package/skeleton-init-sysv/skeleton-init-sysv.mk
+++ b/package/skeleton-init-sysv/skeleton-init-sysv.mk
@@ -19,4 +19,15 @@ define SKELETON_INIT_SYSV_INSTALL_TARGET_CMDS
 	$(call SYSTEM_RSYNC,$(SKELETON_INIT_SYSV_PKGDIR)/skeleton,$(TARGET_DIR))
 endef
 
+# enable/disable swapon/off calls depending on availability of the commands
+define SKELETON_INIT_SYSV_SWAPON_SWAPOFF_INITTAB
+	if [ -x $(TARGET_DIR)/sbin/swapon -a -x $(TARGET_DIR)/sbin/swapoff ]; then \
+		$(SED) '/^#.*\/sbin\/swap/s/^#\+[[:blank:]]*//' $(TARGET_DIR)/etc/inittab; \
+	else \
+		$(SED) '/^[^#].*\/sbin\/swap/s/^/#/' $(TARGET_DIR)/etc/inittab; \
+	fi
+endef
+
+SKELETON_INIT_SYSV_TARGET_FINALIZE_HOOKS += SKELETON_INIT_SYSV_SWAPON_SWAPOFF_INITTAB
+
 $(eval $(generic-package))
