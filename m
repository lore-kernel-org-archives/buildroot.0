From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 17 Mar 2014 18:46:53 -0300
Subject: [Buildroot] [PATCH] lvm2: needs threads
Message-ID: <1395092813-1988-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lvm2 needs threads because of commit
35d3713bdc20a3ac22537ca04b0c1c6deab625cc
Fixes:
http://autobuild.buildroot.net/results/b4d/b4dcd9e98c4ea61f81b28675c0f87cfb2341f091/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cryptsetup/Config.in | 6 ++++--
 package/dmraid/Config.in     | 6 ++++--
 package/lvm2/Config.in       | 6 ++++--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 8405963..3545794 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_CRYPTSETUP
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	depends on BR2_LARGEFILE # lvm2, util-linux
+	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2, e2fsprogs
 	depends on !BR2_PREFER_STATIC_LIB # lvm2
 	depends on BR2_USE_WCHAR # util-linux
@@ -15,6 +16,7 @@ config BR2_PACKAGE_CRYPTSETUP
 
 	  https://code.google.com/p/cryptsetup/
 
-comment "cryptsetup needs a toolchain w/ largefile, wchar, dynamic library"
+comment "cryptsetup needs a toolchain w/ largefile, wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR  || BR2_PREFER_STATIC_LIB
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || \
+		BR2_PREFER_STATIC_LIB || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index fc370bd..2e3a3fa 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DMRAID
 	bool "dmraid"
 	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_PREFER_STATIC_LIB # lvm2
 	select BR2_PACKAGE_LVM2
@@ -11,6 +12,7 @@ config BR2_PACKAGE_DMRAID
 	  dmraid uses the Linux device-mapper to create devices with
 	  respective mappings for the ATARAID sets discovered.
 
-comment "dmraid needs a toolchain w/ largefile, dynamic library"
+comment "dmraid needs a toolchain w/ largefile, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || BR2_PREFER_STATIC_LIB
+	depends on !BR2_LARGEFILE || BR2_PREFER_STATIC_LIB || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index 3f8a52d..1251fae 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LVM2
 	bool "lvm2 & device mapper"
 	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # needs fork()
 	depends on !BR2_PREFER_STATIC_LIB # It fails to build statically
 	help
@@ -34,6 +35,7 @@ config BR2_PACKAGE_LVM2_APP_LIBRARY
 
 endif
 
-comment "lvm2 needs a toolchain w/ largefile, dynamic library"
+comment "lvm2 needs a toolchain w/ largefile, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || BR2_PREFER_STATIC_LIB
+	depends on !BR2_LARGEFILE || BR2_PREFER_STATIC_LIB || \
+		!BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.3.2
