From: unixmania at gmail.com <unixmania@gmail.com>
Date: Fri,  7 Feb 2020 19:33:22 -0300
Subject: [Buildroot] [PATCH v2 2/2] package/skeleton-init-sysv:
 conditionally enable swapon/swapoff in inittab
In-Reply-To: <20200207223322.7182-1-unixmania@gmail.com>
References: <20200207223322.7182-1-unixmania@gmail.com>
Message-ID: <20200207223322.7182-3-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

The default inittab files added by busybox and sysvinit run 'swapon -a'
during init and 'swapoff -a' during shutdown but those programs are not
guaranteed to be available, so the boot log may become polluted by error
messages like this:

    swapon: not found

Add a targe-finalize to skeleton-init-sysv that enables or disables the
swapon/swapoff lines in /etc/inittab, depending on the existence of
$(TARGET_DIR)/sbin/swap{on,off}.

Based on a previous patch sent by Thomas De Schampheleire.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
CC: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
CC: Peter Korsgaard <peter@korsgaard.com>
---
 package/skeleton-init-sysv/skeleton-init-sysv.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/skeleton-init-sysv/skeleton-init-sysv.mk b/package/skeleton-init-sysv/skeleton-init-sysv.mk
index c89c2dc1fd..6c9c2e80fb 100644
--- a/package/skeleton-init-sysv/skeleton-init-sysv.mk
+++ b/package/skeleton-init-sysv/skeleton-init-sysv.mk
@@ -19,4 +19,14 @@ define SKELETON_INIT_SYSV_INSTALL_TARGET_CMDS
 	$(call SYSTEM_RSYNC,$(SKELETON_INIT_SYSV_PKGDIR)/skeleton,$(TARGET_DIR))
 endef
 
+define SKELETON_INIT_SYSV_SWAPON_SWAPOFF_INITTAB
+	if [ -x $(TARGET_DIR)/sbin/swapon -a -x $(TARGET_DIR)/sbin/swapoff ]; then \
+		$(SED) '/^#.*\/sbin\/swap/s/^#\+[[:blank:]]*//' $(TARGET_DIR)/etc/inittab;\
+	else \
+		$(SED) '/^[^#].*\/sbin\/swap/s/^/#/' $(TARGET_DIR)/etc/inittab; \
+	fi
+endef
+
+SKELETON_INIT_SYSV_TARGET_FINALIZE_HOOKS += SKELETON_INIT_SYSV_SWAPON_SWAPOFF_INITTAB
+
 $(eval $(generic-package))
-- 
2.18.2
