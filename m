From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 9 Feb 2014 22:50:50 +0100
Subject: [Buildroot] [git commit] linux: don't automatically set
	uevent_helper with mdev /dev management
Message-ID: <20140209215320.B81FD9C93A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=05e2e35715d104e9dd67b4013d9b16a47b8eb3c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When mdev /dev management is chosen in the buildroot configuration, the
Linux configuration is updated automatically to set option
CONFIG_UEVENT_HELPER_PATH to "/sbin/mdev". However, the help text of this
option explicitly recommends not setting this option due to large
performance impact during boot (experienced first hand by the reporter ??nd
author).

The mdev startup script S10mdev already sets the helper during userspace
boot, which will make sure mdev is working correctly.

Fixes bug #6596: https://bugs.busybox.net/show_bug.cgi?id=6596

Reported-by: Andreas Koop <andreas.koop@zf.com>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 1a81f77..6038467 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -186,8 +186,6 @@ define LINUX_CONFIGURE_CMDS
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC),,
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
-	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
-		$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config))
 	$(if $(BR2_PACKAGE_KTAP),
