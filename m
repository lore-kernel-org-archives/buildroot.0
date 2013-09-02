From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Sep 2013 23:22:14 +0200
Subject: [Buildroot] [git commit] kmod: does not support static builds
Message-ID: <20130902213322.2EABB9B6B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7c0041c31754a5679eb0a3e4bcf41f80d473ae2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since kmod 14, the support for building a static library has been
removed completely from kmod. Therefore, we mark kmod as
!BR2_PREFER_STATIC_LIB, as well as all its reverse dependencies, which
includes the option to use the "udev" /dev management method.

[Peter: show comment for udev when BR2_PREFER_STATIC_LIB is enabled]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kmod/Config.in |    1 +
 package/udev/Config.in |    1 +
 system/Config.in       |    4 ++++
 3 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/kmod/Config.in b/package/kmod/Config.in
index 4965237..bd44316 100644
--- a/package/kmod/Config.in
+++ b/package/kmod/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KMOD
 	bool "kmod"
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  handle kernel modules
 
diff --git a/package/udev/Config.in b/package/udev/Config.in
index dd5ad7b..d4d97c1 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_UDEV
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
+	depends on !BR2_PREFER_STATIC_LIB # kmod
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_KMOD
diff --git a/system/Config.in b/system/Config.in
index d41f184..401285b 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -84,11 +84,15 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	bool "Dynamic using udev"
 	depends on BR2_LARGEFILE # udev
 	depends on BR2_USE_WCHAR # udev
+	depends on !BR2_PREFER_STATIC_LIB # udev -> kmod
 	select BR2_PACKAGE_UDEV
 
 comment "udev requires a toolchain with LARGEFILE + WCHAR support"
 	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
 
+comment "udev doesn't work with 'prefer static libraries'"
+	depends on BR2_PREFER_STATIC_LIB
+
 endchoice
 
 choice
