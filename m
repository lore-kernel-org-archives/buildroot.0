From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Mar 2016 15:37:23 +0100
Subject: [Buildroot] [git commit] fio: disable on SuperH
Message-ID: <20160310144157.A70357FE10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0c04616174737dd0b8ff27e73769fc4ea39320c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fio doesn't build on SuperH due to arch_flags being undefined while
building the test programs. Since the fix isn't immediate, the bug was
reported upstream, and this commit disables fio on SuperH until it
gets fixed upstream.

Fixes:

  http://autobuild.buildroot.net/results/578/578ae9da10d017ee9e2c15d37014f31a1114ef3a/build-end.log

Fixes #8751.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fio/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/fio/Config.in b/package/fio/Config.in
index 89f54f9..bdfb8ff 100644
--- a/package/fio/Config.in
+++ b/package/fio/Config.in
@@ -13,6 +13,9 @@ config BR2_PACKAGE_FIO
 	# fio uses fallocate() which becomes fallocate64() while compiling with
 	# largefile support, but fallocate64() is not available on nios2
 	depends on !BR2_nios2
+	# does not build on SuperH, issue reported upstream:
+	# https://github.com/axboe/fio/issues/154
+	depends on !BR2_sh
 	help
 	  fio is an I/O tool meant to be used both for benchmark
 	  and stress/hardware verification.
@@ -22,5 +25,5 @@ config BR2_PACKAGE_FIO
 comment "fio needs a toolchain w/ dynamic library, threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_nios2
+	depends on !BR2_nios2 && !BR2_sh
 	depends on BR2_USE_MMU
