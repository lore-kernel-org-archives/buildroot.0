From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 16:08:09 +0200
Subject: [Buildroot] [PATCH] wayland: fix build on Blackfin
Message-ID: <1464271689-3879-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a patch to Wayland that allows the Blackfin
architecture to build this package properly. The problem is due to the
usual __USER_LABEL_PREFIX__ issue on Blackfin.

Fixes:

  http://autobuild.buildroot.org/results/e418b97766c943bf41fc80815c3e625e6a68b12d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...hitectures-with-non-empty-__USER_LABEL_PR.patch | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/wayland/0001-Support-architectures-with-non-empty-__USER_LABEL_PR.patch

diff --git a/package/wayland/0001-Support-architectures-with-non-empty-__USER_LABEL_PR.patch b/package/wayland/0001-Support-architectures-with-non-empty-__USER_LABEL_PR.patch
new file mode 100644
index 0000000..abefcff
--- /dev/null
+++ b/package/wayland/0001-Support-architectures-with-non-empty-__USER_LABEL_PR.patch
@@ -0,0 +1,57 @@
+From 0a337328411d5b3f37b169a83b6fee3f1726130f Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 26 May 2016 15:57:33 +0200
+Subject: [PATCH] Support architectures with non-empty __USER_LABEL_PREFIX__
+
+On some architectures (like Blackfin), a C symbol does not directly
+match with assembly symbols. The C symbol references are in fact all
+prefixed by a so-called "user label prefix". So when a symbol defined
+in an assembly file needs to be referenced from C, this symbol should
+be prefixed by the "user label prefix".
+
+This commit updates dtddata.S to take into account
+__USER_LABEL_PREFIX__ when it exists.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/dtddata.S | 19 +++++++++++++------
+ 1 file changed, 13 insertions(+), 6 deletions(-)
+
+diff --git a/src/dtddata.S b/src/dtddata.S
+index ce51133..ad2a4db 100644
+--- a/src/dtddata.S
++++ b/src/dtddata.S
+@@ -30,17 +30,24 @@
+ 
+ /* from: http://www.linuxjournal.com/content/embedding-file-executable-aka-hello-world-version-5967#comment-348129 */
+ 
++#ifdef __USER_LABEL_PREFIX__
++#define CONCAT1(a, b) CONCAT2(a, b)
++#define CONCAT2(a, b) a ## b
++#define SYM(x) CONCAT1 (__USER_LABEL_PREFIX__, x)
++#else
++#endif
++
+ .macro binfile name file
+ 	.p2align 2
+-	.globl \name\()_begin
+-\name\()_begin:
++	.globl SYM(\name\()_begin)
++SYM(\name\()_begin):
+ 	.incbin "\file"
+-\name\()_end:
++SYM(\name\()_end):
+ 	.byte 0
+ 	.p2align 2
+-	.globl \name\()_len
+-\name\()_len:
+-	.int (\name\()_end - \name\()_begin)
++	.globl SYM(\name\()_len)
++SYM(\name\()_len):
++	.int (SYM(\name\()_end) - SYM(\name\()_begin))
+ .endm
+ 
+ .section .rodata
+-- 
+2.7.4
+
-- 
2.7.4
