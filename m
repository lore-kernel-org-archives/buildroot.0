From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  9 May 2019 15:45:41 +0300
Subject: [Buildroot] [PATCH] package/strace: disable build for m68k
Message-ID: <73b636ac421a851535f158350343bc82a25db097.1557405941.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mismatch in struct bpf_prog_info fields offset between kernel headers
and strace local definition causes build failure. Disable strace for
m68k until upstream (either strace or the kernel) find a solution.

https://lists.strace.io/pipermail/strace-devel/2019-May/thread.html#8750

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/strace/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/strace/Config.in b/package/strace/Config.in
index 38b4ebe32a4b..286a061a80ba 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -3,6 +3,9 @@ config BR2_PACKAGE_STRACE
 	# needs at least kernel headers 4.0 on nios2
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0 || !BR2_nios2
 	depends on !BR2_nds32
+	# struct bpf_prog_info fields offset mismatch
+	# https://lists.strace.io/pipermail/strace-devel/2019-May/thread.html#8750
+	depends on !BR2_m68k
 	help
 	  A useful diagnostic, instructional, and debugging tool.
 	  Allows you to track what system calls a program makes
-- 
2.20.1
