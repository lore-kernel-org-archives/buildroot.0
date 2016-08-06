From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Aug 2016 00:11:14 +0200
Subject: [Buildroot] [PATCH 2/2] blktrace: disable on PowerPC
In-Reply-To: <1470521474-16710-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470521474-16710-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1470521474-16710-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package has been failing to build on PowerPC since March 2016, with
nobody taking care of the problem, so let's disable this package on
PowerPC for the time being. PowerPC is the only architecture on which
blktrace fails to build currently.

Fixes:

  http://autobuild.buildroot.net/results/5a673c692aeb957cd8beb2c2c10ce5fd882ba4b5/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/blktrace/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/blktrace/Config.in b/package/blktrace/Config.in
index c17de80..1b8212d 100644
--- a/package/blktrace/Config.in
+++ b/package/blktrace/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_BLKTRACE
 	# Uses posix_spawn()
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
+	# issue: hidden symbol `_rest32gpr_30_x` is referenced by DSO
+	depends on !BR2_powerpc
 	select BR2_PACKAGE_LIBAIO
 	help
 	  blktrace is a block layer IO tracing mechanism which provides
@@ -13,4 +15,5 @@ config BR2_PACKAGE_BLKTRACE
 
 comment "blktrace needs a glibc or musl toolchain"
 	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
+	depends on !BR2_powerpc
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
-- 
2.7.4
