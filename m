From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 12:35:17 +0200
Subject: [Buildroot] [git commit] blktrace: add dependency on NPTL
Message-ID: <20160917103535.E152A81E7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08b9e24eaa4e43cf2e808bb79cb4c44f27fc7f59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

blkiomon.c assumes that clock_nanosleep() is always available. But it
is only available with NPTL. Since it unconditionally uses it, we add
dependency on NPTL.

Fixes:
  http://autobuild.buildroot.net/results/c87/c87cd4a7b0bed938506bcf7e88d4cda60e28e6e5/

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/blktrace/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/blktrace/Config.in b/package/blktrace/Config.in
index 38c0947..684157c 100644
--- a/package/blktrace/Config.in
+++ b/package/blktrace/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_BLKTRACE
 	bool "blktrace"
 	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
 	select BR2_PACKAGE_LIBAIO
 	help
 	  blktrace is a block layer IO tracing mechanism which provides
@@ -8,3 +9,7 @@ config BR2_PACKAGE_BLKTRACE
 	  up to user space.
 
 	  http://git.kernel.dk/?p=blktrace.git;a=summary
+
+comment "blktrace needs a toolchain w/ NPTL"
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
