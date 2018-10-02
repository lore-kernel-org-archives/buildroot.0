From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  2 Oct 2018 21:16:32 +0200
Subject: [Buildroot] [PATCH 1/1] minizip: needs __register_atfork
Message-ID: <20181002191632.9615-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following error is raised:

[100%] Linking C executable minizip
/home/peko/autobuild/instance-0/output/host/m68k-buildroot-uclinux-uclibc/sysroot/usr/lib/libbsd.a(arc4random.o): In function `_rs_init.part.1':
arc4random.c:(.text+0xaa): undefined reference to `__register_atfork'
collect2: error: ld returned 1 exit status

As specified in openssl/Config.in, uClibc on noMMU doesn't provide
__register_atfork() so add this dependency on minizip

It should be noted that technically, this dependency comes from libbsd.
Indeed _ARC4_ATFORK is defined to be __register_atfork if __GLIBC__ is
defined and to pthread_atfork otherwise (see src/arc4random_linux.h)

So perhaps this dependency should be added to libbsd and to hcitop from
bluez-alsa (netcat-openbsd depends on glibc)

Fixes:
 - http://autobuild.buildroot.org/results/df2dcbdceaa01a2ae37bf09140e4dbef0a5b9489

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minizip/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/minizip/Config.in b/package/minizip/Config.in
index 68fa1d7118..ed54e3b651 100644
--- a/package/minizip/Config.in
+++ b/package/minizip/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_MINIZIP
 	bool "minizip"
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
+	# uClibc on noMMU doesn't provide __register_atfork()
+	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libbsd
 	depends on BR2_USE_WCHAR # libbsd
 	select BR2_PACKAGE_LIBBSD
-- 
2.17.1
