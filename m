From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 28 May 2016 20:33:00 +0200
Subject: [Buildroot] [PATCH] libsigsegv: disable for sparc and uClibc
	toolchain
Message-ID: <20160528183300.GA32037@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The context function support is not available for uClibc and
sparc. It will be introduced in uClibc-ng 1.0.15, and
then the patch can be reverted.

Fixes following autobuild failures:
http://autobuild.buildroot.net/results/f1aa74992a77da325b3c6d74f9f88624bad094e9/
http://autobuild.buildroot.net/results/69bf0dbb0be3d4e4783ee332b3e95ca31f18d3bf/
http://autobuild.buildroot.net/results/f5bc9921c1b9f839e5536c19348efebd6826123d/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/libsigsegv/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsigsegv/Config.in b/package/libsigsegv/Config.in
index e5224da..e96ba5f 100644
--- a/package/libsigsegv/Config.in
+++ b/package/libsigsegv/Config.in
@@ -3,12 +3,12 @@ config BR2_PACKAGE_LIBSIGSEGV
 	depends on !BR2_xtensa
 	depends on !BR2_arc # no ucontext_i.sym file
 	depends on !BR2_microblaze
-	# No ucontext support in uclibc for powerpc and superh
-	depends on !((BR2_powerpc || BR2_sh) && BR2_TOOLCHAIN_USES_UCLIBC)
+	# No ucontext support in uclibc for powerpc, sparc and superh
+	depends on !((BR2_powerpc || BR2_sh || BR2_sparc ) && BR2_TOOLCHAIN_USES_UCLIBC)
 	help
 	  Library for handling page faults in user mode.
 
 	  http://libsigsegv.sourceforge.net/
 
 comment "libsigsegv needs an (e)glibc toolchain"
-	depends on (BR2_powerpc || BR2_sh) && BR2_TOOLCHAIN_USES_UCLIBC
+	depends on (BR2_powerpc || BR2_sh || BR2_sparc) && BR2_TOOLCHAIN_USES_UCLIBC
-- 
2.1.4
