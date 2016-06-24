From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 24 Jun 2016 15:35:32 +0100
Subject: [Buildroot] [PATCH] flannel: disable for MIPS64
Message-ID: <1466778932-8908-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

flannel performs a CGO linking which is not currently supported on
MIPS64 platforms. The failure looks like this:

/tmp/go-build396590679/runtime/cgo/_obj/gcc_util.o: In function
`x_cgo_thread_start':
../../host/usr/lib/go/src/runtime/cgo/gcc_util.c:48: undefined reference
to `_cgo_sys_thread_start'

Relevant GitHub issue: https://github.com/karalabe/xgo/issues/46

This has been already fixed in go1.7beta2, so we can revert this commit
after the next version bump of the go package.

Fixes:

  http://autobuild.buildroot.net/results/c92a2e142ad66b765577a62fd69fffc0c301b88d/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/flannel/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/flannel/Config.in b/package/flannel/Config.in
index cfdb909..3e871b5 100644
--- a/package/flannel/Config.in
+++ b/package/flannel/Config.in
@@ -1,11 +1,16 @@
 comment "flannel needs a toolchain w/ threads"
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_mips64 && !BR2_mips64el
 
 config BR2_PACKAGE_FLANNEL
 	bool "flannel"
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# flannel performs a CGO linking which is not currently
+	# supported on MIPS64 platforms. See:
+	# https://github.com/karalabe/xgo/issues/46
+	depends on !BR2_mips64 && !BR2_mips64el
 	help
 	  Flannel is a virtual network that gives a subnet to each
 	  host for use with container runtimes.
-- 
2.7.3
