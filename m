From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 15:43:35 +0200
Subject: [Buildroot] [git commit] package/libselinux: enable kernel selinux
 support for erofs images
Message-ID: <20200904133609.0086086F35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2be469e3b944e79029ca3d0b97fd7f027b1b5de5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If BR2_TARGET_ROOTFS_EROFS is selected, enable the following kernel options:
  - CONFIG_EROFS_FS_XATTR
  - CONFIG_EROFS_FS_SECURITY

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libselinux/libselinux.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 521dbaaba8..b8f9c3b55a 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -112,6 +112,9 @@ define LIBSELINUX_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_NETWORK)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_SELINUX)
 	$(call KCONFIG_SET_OPT,CONFIG_LSM,"selinux")
+	$(if $(BR2_TARGET_ROOTFS_EROFS),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_EROFS_FS_XATTR)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_EROFS_FS_SECURITY))
 endef
 
 $(eval $(generic-package))
