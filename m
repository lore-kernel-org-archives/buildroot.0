From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Thu,  2 Jan 2020 16:26:45 +0100
Subject: [Buildroot] [PATCH] package/lvm2: install udev rules
Message-ID: <20200102152645.9994-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without the device-mapper udev rules, dm devices will not get a proper
symlink like /dev/disk/by-label/LABEL, which in turn causes fstab
LABEL= mounts to fails.

And by extension causes shenanigans with systemd, where it will
unmount a manually mounted disk because it can't resolve the label.

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/lvm2/lvm2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 1457566..3da713f 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -31,6 +31,10 @@ LVM2_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
 # package/readline is GPL-3.0+, so not license compatible
 LVM2_CONF_OPTS += --disable-readline
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+LVM2_CONF_OPTS += --enable-udev_rules
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 LVM2_CONF_OPTS += --enable-selinux
 LVM2_DEPENDENCIES += libselinux
-- 
2.7.4
