From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2014 18:29:47 +0100
Subject: [Buildroot] [PATCH] package/rt-tests: fix Kconfig syntax
Message-ID: <1393176587-27407-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Fixes:
    $ make menuconfig
    [...]
    package/rt-tests/Config.in:10: syntax error
    package/rt-tests/Config.in:9: invalid option
    package/rt-tests/Config.in:36: syntax error
    package/rt-tests/Config.in:35: invalid option
    make[1]: *** [oldconfig] Error 1
    make: *** [_all] Error 2

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/rt-tests/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index ff4284e..605635c 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -6,8 +6,8 @@ config BR2_PACKAGE_RT_TESTS
 	# no NPTL for these archs
 	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc && !BR2_bfin
 	# no _tid field in 'struct sigevent'
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC if (BR2_mips || BR2_mipsel || \
-		BR2_mips64 || BR2_mips64el)
+	depends on ! ( BR2_TOOLCHAIN_USES_UCLIBC && (BR2_mips || BR2_mipsel || \
+		BR2_mips64 || BR2_mips64el) )
 	help
 	  Set of utilities for testing the real-time behaviour of a
 	  Linux system.
@@ -32,5 +32,5 @@ comment "rt-tests needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "rt-tests needs an (e)glibc toolchain"
-	depends on BR2_TOOLCHAIN_USES_UCLIBC if (BR2_mips || BR2_mipsel || \
+	depends on BR2_TOOLCHAIN_USES_UCLIBC && (BR2_mips || BR2_mipsel || \
 		BR2_mips64 || BR2_mips64el)
-- 
1.8.3.2
