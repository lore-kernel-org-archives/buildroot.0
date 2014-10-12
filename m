From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 09:39:42 +0200
Subject: [Buildroot] [git commit] rt-tests: enable on MIPS uClibc again
Message-ID: <20141012080244.41B7AB2214@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=398e590e2d55668e9ef7420cc274f0afdd174684
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We have fixes in the internal toolchain; an external toolchain is most
likely a buildroot-built toolchain anyway, so it will also have the
fix. But we still keep a comment to warn the user for potentially-broken
external toolchains.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rt-tests/Config.in |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index 28a4a11..81e5d06 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_RT_TESTS
 	bool "rt-tests"
 	# no _tid field in 'struct sigevent'
-	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && (BR2_mips || BR2_mipsel || \
-		BR2_mips64 || BR2_mips64el))
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	help
 	  Set of utilities for testing the real-time behaviour of a
@@ -23,9 +21,10 @@ config BR2_PACKAGE_RT_TESTS
 	  http://rt.wiki.kernel.org
 
 
-comment "rt-tests needs an (e)glibc toolchain"
-	depends on BR2_TOOLCHAIN_USES_UCLIBC && (BR2_mips || BR2_mipsel || \
-		BR2_mips64 || BR2_mips64el)
+comment "rt-tests may not work on MIPS with an external uClibc toolchain"
+	depends on BR2_PACKAGE_RT_TESTS
+	depends on BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 
 comment "rt-tests needs a toolchain w/ NPTL"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
