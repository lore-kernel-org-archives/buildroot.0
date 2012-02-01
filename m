From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 1 Feb 2012 23:04:49 +0100
Subject: [Buildroot] [git commit] Convert busybox to the device declaration
	method
Message-ID: <20120201221424.9684490979@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c7746857d102e69e54202763eeb785a45755845d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Busybox used to declare and create files even if the package was not
enabled through the device table. Remove the entries for busybox in the
device table and move them to the package declaration.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox.mk      |    5 +++++
 target/generic/device_table.txt |    2 --
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index d18b6d0..59448d5 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -28,6 +28,11 @@ ifndef BUSYBOX_CONFIG_FILE
 	BUSYBOX_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
 endif
 
+define BUSYBOX_PERMISSIONS
+/bin/busybox			 f 4755	0 0 - - - - -
+/usr/share/udhcpc/default.script f 755  0 0 - - - - -
+endef
+
 # If mdev will be used for device creation enable it and copy S10mdev to /etc/init.d
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
 define BUSYBOX_INSTALL_MDEV_SCRIPT
diff --git a/target/generic/device_table.txt b/target/generic/device_table.txt
index 12f35b2..d3e394b 100644
--- a/target/generic/device_table.txt
+++ b/target/generic/device_table.txt
@@ -10,13 +10,11 @@
 /tmp					d	1777	0	0	-	-	-	-	-
 /etc					d	755	0	0	-	-	-	-	-
 /home/default				d	2755	1000	1000	-	-	-	-	-
-/bin/busybox				f	4755	0	0	-	-	-	-	-
 /etc/shadow				f	600	0	0	-	-	-	-	-
 /etc/passwd				f	644	0	0	-	-	-	-	-
 /etc/network/if-up.d			d	755	0	0	-	-	-	-	-
 /etc/network/if-pre-up.d		d	755	0	0	-	-	-	-	-
 /etc/network/if-down.d			d	755	0	0	-	-	-	-	-
 /etc/network/if-post-down.d		d	755	0	0	-	-	-	-	-
-/usr/share/udhcpc/default.script	f	755	0	0	-	-	-	-	-
 # uncomment this to allow starting x as non-root
 #/usr/X11R6/bin/Xfbdev		     	f	4755	0	0	-	-	-	-	-
