From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Nov 2018 21:35:38 +0100
Subject: [Buildroot] [git commit] libbsd: needs __register_atfork
Message-ID: <20181129203540.028FA88F7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e13855c48f21eaee07a81f8b02678839be274a45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The following error is raised by minizip:

[100%] Linking C executable minizip
/home/peko/autobuild/instance-0/output/host/m68k-buildroot-uclinux-uclibc/sysroot/usr/lib/libbsd.a(arc4random.o):
In function `_rs_init.part.1':
arc4random.c:(.text+0xaa): undefined reference to `__register_atfork'
collect2: error: ld returned 1 exit status

As specified in openssl/Config.in, uClibc on noMMU doesn't provide
__register_atfork() so add a dependency on
!(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU) on libbsd and minizip

Don't add this dependency to netcat-opensd as it already depends on
glibc
Don't add this dependency to BR2_PACKAGE_BLUEZ_ALSA_HCITOP because
bluez-alsa already depends on BR2_USE_MMU
Concerning fwts, just update comment on BR2_USE_MMU

Fixes:
 - http://autobuild.buildroot.org/results/df2dcbdceaa01a2ae37bf09140e4dbef0a5b9489

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fwts/Config.in    | 2 +-
 package/libbsd/Config.in  | 3 +++
 package/minizip/Config.in | 2 ++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/fwts/Config.in b/package/fwts/Config.in
index 269f065fd5..94ac606366 100644
--- a/package/fwts/Config.in
+++ b/package/fwts/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_FWTS
 	depends on BR2_i386 || BR2_x86_64 || BR2_aarch64
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS # libbsd
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
-	depends on BR2_USE_MMU # libglib2
+	depends on BR2_USE_MMU # libglib2, libbsd
 	depends on BR2_USE_WCHAR # libglib2, libbsd
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libbsd
 	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h
diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
index a163ce9b6f..ba5e5cbcfa 100644
--- a/package/libbsd/Config.in
+++ b/package/libbsd/Config.in
@@ -9,6 +9,8 @@ config BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
 config BR2_PACKAGE_LIBBSD
 	bool "libbsd"
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
+	# uClibc on noMMU doesn't provide __register_atfork()
+	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	help
@@ -22,4 +24,5 @@ config BR2_PACKAGE_LIBBSD
 
 comment "libbsd needs a toolchain w/ threads, wchar"
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/minizip/Config.in b/package/minizip/Config.in
index 68fa1d7118..4bc12a0d7e 100644
--- a/package/minizip/Config.in
+++ b/package/minizip/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MINIZIP
 	bool "minizip"
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
+	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU) # libbsd
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libbsd
 	depends on BR2_USE_WCHAR # libbsd
 	select BR2_PACKAGE_LIBBSD
@@ -19,4 +20,5 @@ config BR2_PACKAGE_MINIZIP_DEMOS
 
 comment "minizip needs a toolchain w/ threads, wchar"
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
