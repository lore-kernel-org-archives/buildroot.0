From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Sat, 17 Sep 2016 00:28:46 +0530
Subject: [Buildroot] [PATCH 1/2] blktrace: add dependency on NPTL
Message-ID: <1474052327-16663-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

blkiomon.c assumes that clock_nanosleep() is always available. But it
is only available with NPTL. Since it unconditionally uses it, we add
dependency on NPTL.

Fixes:
  http://autobuild.buildroot.net/results/c87/c87cd4a7b0bed938506bcf7e88d4cda60e28e6e5/

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
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
-- 
2.6.2
