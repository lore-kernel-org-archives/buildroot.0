From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 27 May 2021 22:19:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/unscd: disable on riscv32
Message-ID: <20210527201904.478811-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

unscd unconditionally uses __NR_clock_gettime which will raise the
following build failure on riscv32:

nscd-0.54.c:339:14: error: '__NR_clock_gettime' undeclared (first use in this function); did you mean 'clock_gettime'?
  339 |  if (syscall(__NR_clock_gettime, CLOCK_MONOTONIC, &ts))
      |              ^~~~~~~~~~~~~~~~~~
      |              clock_gettime

Fixes:
 - http://autobuild.buildroot.org/results/eb77b18f268d8e59c407f757662117a33d3f9ee3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/unscd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/unscd/Config.in b/package/unscd/Config.in
index 23cc5a4fcb..88f1062103 100644
--- a/package/unscd/Config.in
+++ b/package/unscd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_UNSCD
 	bool "unscd"
+	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Micro Name Service Caching Daemon
@@ -22,4 +23,5 @@ config BR2_PACKAGE_UNSCD
 	  http://busybox.net/~vda/unscd
 
 comment "unscd needs a glibc toolchain"
+	depends on !BR2_RISCV_32
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
-- 
2.30.2
