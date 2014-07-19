From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Jul 2014 15:56:12 +0200
Subject: [Buildroot] [PATCH 05/20 v3] package/eudev: remove the prompt
In-Reply-To: <cover.1405777634.git.yann.morin.1998@free.fr>
References: <cover.1405777634.git.yann.morin.1998@free.fr>
Message-ID: <a7fb21df6dc2294f325c4f86dedd413f1e726baf.1405777634.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package eudev depends on DEVICE_CREATION_DYNAMIC_EUDEV, and
is also selected by DEVICE_CREATION_DYNAMIC_EUDEV.

This means that:
  - eudev is not visible when DEVICE_CREATION_DYNAMIC_EUDEV is not set
  - eudev is visible but forced when DEVICE_CREATION_DYNAMIC_EUDEV is set

As a consequence, eudev is never user-selectable.

Since the user already made the decision to use eudev in the /dev
management choice, there is no point in showing the eudev package at all
in the menuconfig.

Just remove the prompt.

Also remove the comments, since anyway the user can't do anything about it.

Although not strictly required, we anyway keep the dependencies expressed
in eudev, to explain where they come from (fork, util-linux...), so it is
explicit their duplication in the .dev management choice entry comes from
eudev itself. So, update the comments there.

Also, move the help text to the /dev macnagement choice, so the user has
a chance to look at it! ;-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/eudev/Config.in | 30 +++++++++---------------------
 system/Config.in        | 21 ++++++++++++++++-----
 2 files changed, 25 insertions(+), 26 deletions(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 40ff721..b204a90 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -1,7 +1,13 @@
+# Note: being prompt-less, and selected in the /dev management choice,
+# it is not needed to have dependencies on this symbol, since the
+# choice entry already have those dependencies.
+# However, it seems more logical to have the dependencies listed here,
+# so it is easier to uderstand why we have those, and duplicate them in
+# the choice entry.
+
 config BR2_PACKAGE_EUDEV
-	bool "eudev"
+	bool
 	depends on !BR2_avr32 # no epoll_create1
-	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	depends on BR2_USE_MMU # uses fork()
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
@@ -10,14 +16,6 @@ config BR2_PACKAGE_EUDEV
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_KMOD
-	help
-	  Userspace device daemon. This is a standalone version,
-	  independent of systemd. It is a fork maintained by Gentoo.
-
-	  eudev requires a Linux kernel >= 2.6.34: it relies on devtmpfs
-	  and inotify.
-
-	  http://github.com/gentoo/eudev/
 
 if BR2_PACKAGE_EUDEV
 
@@ -25,18 +23,8 @@ config BR2_PACKAGE_PROVIDES_UDEV
 	default "eudev"
 
 config BR2_PACKAGE_EUDEV_RULES_GEN
-	bool "enable rules generator"
+	bool "eudev rules generator"
 	help
 	  Enable persistent rules generator
 
 endif
-
-comment "eudev needs eudev /dev management"
-	depends on !BR2_avr32
-	depends on BR2_USE_MMU
-	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
-
-comment "eudev needs a toolchain w/ largefile, wchar, dynamic library"
-	depends on !BR2_avr32
-	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
diff --git a/system/Config.in b/system/Config.in
index 1be7e5d..89ae46e 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -124,12 +124,23 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
 
 config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	bool "Dynamic using eudev"
-	depends on !BR2_avr32 # eudev
-	depends on BR2_LARGEFILE
-	depends on BR2_USE_WCHAR
-	depends on !BR2_PREFER_STATIC_LIB
-	depends on BR2_USE_MMU # eudev
+	depends on !BR2_avr32 # eudev (no epoll_create1)
+	depends on BR2_USE_MMU # eudev (fork)
+	depends on BR2_LARGEFILE # eudev (util-linux)
+	depends on BR2_USE_WCHAR # eudev (util-linux)
+	depends on !BR2_PREFER_STATIC_LIB # eudev
 	select BR2_PACKAGE_EUDEV
+	help
+	  Userspace device daemon. This is a standalone version,
+	  independent of systemd. It is a fork maintained by Gentoo.
+
+	  eudev requires a Linux kernel >= 2.6.34: it relies on devtmpfs
+	  and inotify.
+
+	  You can further configure systemd in:
+	    Target packages --> Hardware handling
+
+	  http://github.com/gentoo/eudev/
 
 comment "eudev needs a toolchain w/ largefile, wchar, dynamic library"
 	depends on !BR2_avr32 # eudev
-- 
1.9.1
