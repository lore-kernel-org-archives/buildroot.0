From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2020 21:10:29 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/lvm2: install
 udev rules
Message-ID: <20200110200050.3FD22888BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=402c16687f99e42d334ee45305e0231ad0aff6bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Without the device-mapper udev rules, dm devices will not get a proper
symlink like /dev/disk/by-label/LABEL, which in turn causes fstab
LABEL= mounts to fails.

And by extension causes shenanigans with systemd, where it will
unmount a manually mounted disk because it can't resolve the label.

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 51ec0f48eee4115b4eee745902151e2583b01016)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lvm2/lvm2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 14575668a5..3da713fe83 100644
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
