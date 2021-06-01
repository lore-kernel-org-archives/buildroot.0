From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 1 Jun 2021 22:32:10 +0200
Subject: [Buildroot] [git commit] package/unscd: disable on riscv32
Message-ID: <20210601200549.38FDA801E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34173da168f300b58957abb53c8f5fcaf8d8e605
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

unscd unconditionally uses __NR_clock_gettime which will raise the
following build failure on riscv32:

nscd-0.54.c:339:14: error: '__NR_clock_gettime' undeclared (first use in this function); did you mean 'clock_gettime'?
  339 |  if (syscall(__NR_clock_gettime, CLOCK_MONOTONIC, &ts))
      |              ^~~~~~~~~~~~~~~~~~
      |              clock_gettime

Fixes:
 - http://autobuild.buildroot.org/results/eb77b18f268d8e59c407f757662117a33d3f9ee3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
