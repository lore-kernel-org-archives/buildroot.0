From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  5 Apr 2018 21:50:36 +0200
Subject: [Buildroot] [PATCH 22/23] wayland: remove Blackfin patch
In-Reply-To: <20180405195037.32641-1-thomas.petazzoni@bootlin.com>
References: <20180405195037.32641-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180405195037.32641-23-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And renumber remaining patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...hitectures-with-non-empty-__USER_LABEL_PR.patch | 57 ----------------------
 ...01-configure-add-option-to-disable-tests.patch} |  0
 2 files changed, 57 deletions(-)
 delete mode 100644 package/wayland/0001-Support-architectures-with-non-empty-__USER_LABEL_PR.patch
 rename package/wayland/{0002-configure-add-option-to-disable-tests.patch => 0001-configure-add-option-to-disable-tests.patch} (100%)

diff --git a/package/wayland/0001-Support-architectures-with-non-empty-__USER_LABEL_PR.patch b/package/wayland/0001-Support-architectures-with-non-empty-__USER_LABEL_PR.patch
deleted file mode 100644
index abefcff274..0000000000
--- a/package/wayland/0001-Support-architectures-with-non-empty-__USER_LABEL_PR.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 0a337328411d5b3f37b169a83b6fee3f1726130f Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Thu, 26 May 2016 15:57:33 +0200
-Subject: [PATCH] Support architectures with non-empty __USER_LABEL_PREFIX__
-
-On some architectures (like Blackfin), a C symbol does not directly
-match with assembly symbols. The C symbol references are in fact all
-prefixed by a so-called "user label prefix". So when a symbol defined
-in an assembly file needs to be referenced from C, this symbol should
-be prefixed by the "user label prefix".
-
-This commit updates dtddata.S to take into account
-__USER_LABEL_PREFIX__ when it exists.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/dtddata.S | 19 +++++++++++++------
- 1 file changed, 13 insertions(+), 6 deletions(-)
-
-diff --git a/src/dtddata.S b/src/dtddata.S
-index ce51133..ad2a4db 100644
---- a/src/dtddata.S
-+++ b/src/dtddata.S
-@@ -30,17 +30,24 @@
- 
- /* from: http://www.linuxjournal.com/content/embedding-file-executable-aka-hello-world-version-5967#comment-348129 */
- 
-+#ifdef __USER_LABEL_PREFIX__
-+#define CONCAT1(a, b) CONCAT2(a, b)
-+#define CONCAT2(a, b) a ## b
-+#define SYM(x) CONCAT1 (__USER_LABEL_PREFIX__, x)
-+#else
-+#endif
-+
- .macro binfile name file
- 	.p2align 2
--	.globl \name\()_begin
--\name\()_begin:
-+	.globl SYM(\name\()_begin)
-+SYM(\name\()_begin):
- 	.incbin "\file"
--\name\()_end:
-+SYM(\name\()_end):
- 	.byte 0
- 	.p2align 2
--	.globl \name\()_len
--\name\()_len:
--	.int (\name\()_end - \name\()_begin)
-+	.globl SYM(\name\()_len)
-+SYM(\name\()_len):
-+	.int (SYM(\name\()_end) - SYM(\name\()_begin))
- .endm
- 
- .section .rodata
--- 
-2.7.4
-
diff --git a/package/wayland/0002-configure-add-option-to-disable-tests.patch b/package/wayland/0001-configure-add-option-to-disable-tests.patch
similarity index 100%
rename from package/wayland/0002-configure-add-option-to-disable-tests.patch
rename to package/wayland/0001-configure-add-option-to-disable-tests.patch
-- 
2.14.3
