From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  1 Aug 2016 18:30:21 +0200
Subject: [Buildroot] [PATCH 3/3] package/xenomai: disable for musl toolchains
In-Reply-To: <1470069021-24233-1-git-send-email-romain.naour@gmail.com>
References: <1470069021-24233-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1470069021-24233-3-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After fixing the <bits/local_lim.h> issue by using <limits.h>, the
build still fail with udefined __WORDSIZE.

Adding <sys/user.h> to define __WORDSIZE reveal that xenomai use
<error.h> which is not provided by musl.

The discussion on the musl mailing list [1] about glibc error reporting
functions concluded to not add this support in the C library.

For now, disable Xenomai user space support for musl toolchains since
it require several patches to build correctly and needs to remove each
glibc error reporting functions.

Users interested in musl support for Xenomai can work with upstream to
fix these issues and revert this patch.

[1] http://www.openwall.com/lists/musl/2014/06/29/8

Fixes:
http://autobuild.buildroot.net/results/e36/e36a21c1df33bdd3fbc61d516a3e8f7c5f7c41af

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/xenomai/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 3de7bde..32c5124 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -4,14 +4,16 @@ config BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS
 	depends on BR2_i386 || BR2_x86_64 || (BR2_arm && !BR2_ARM_CPU_ARMV7M) || \
 		BR2_bfin || BR2_powerpc || BR2_sh4
 
-comment "xenomai needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "xenomai needs an glibc or uClibc toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS
 
 config BR2_PACKAGE_XENOMAI
 	bool "Xenomai Userspace"
 	depends on BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# uses <error.h>, __WORDSIZE and bits/local_lim.h
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
 	  Real-Time Framework for Linux
 	  http://www.xenomai.org
-- 
2.5.5
