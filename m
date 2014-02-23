From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Feb 2014 18:52:04 +0100
Subject: [Buildroot] [git commit] rt-tests: fix mips+uclibc check
Message-ID: <20140223175404.BAA579B92A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=088ed8dcbb061bf573a0ed5c98fff22bac6138c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The conditional (suggested by me) introduced in 108952 (rt-tests: disable
for uclibc mips) isn't actually valid kconfig syntax, causing menuconfig to
error out.

Rewrite it to use proper syntax.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rt-tests/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index ff4284e..8940668 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -6,8 +6,8 @@ config BR2_PACKAGE_RT_TESTS
 	# no NPTL for these archs
 	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc && !BR2_bfin
 	# no _tid field in 'struct sigevent'
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC if (BR2_mips || BR2_mipsel || \
-		BR2_mips64 || BR2_mips64el)
+	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && (BR2_mips || BR2_mipsel || \
+		BR2_mips64 || BR2_mips64el))
 	help
 	  Set of utilities for testing the real-time behaviour of a
 	  Linux system.
@@ -32,5 +32,5 @@ comment "rt-tests needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "rt-tests needs an (e)glibc toolchain"
-	depends on BR2_TOOLCHAIN_USES_UCLIBC if (BR2_mips || BR2_mipsel || \
+	depends on BR2_TOOLCHAIN_USES_UCLIBC && (BR2_mips || BR2_mipsel || \
 		BR2_mips64 || BR2_mips64el)
