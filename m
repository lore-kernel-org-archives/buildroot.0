From: y at mail.free-electrons.com <y@mail.free-electrons.com>
Date: Tue,  3 Jan 2012 11:13:57 +0100
Subject: [Buildroot] [PATCH 2/3] Convert busybox to the device declaration
	method
In-Reply-To: <cover.1325583983.git.maxime.ripard@free-electrons.com>
References: <y>
 <cover.1325583983.git.maxime.ripard@free-electrons.com>
Message-ID: <c1055e169e7afbccc34cef89141fa3ed5af57089.1325583983.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Ripard <maxime.ripard@free-electrons.com>

Busybox used to declare and create files even if the package was not
enabled through the device table. Remove the entries for busybox in the
device table and move them to the package declaration.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
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
-- 
1.7.4.1
