From: Joel Stanley <joel@jms.id.au>
Date: Mon, 11 Dec 2017 21:22:30 +1030
Subject: [Buildroot] [PATCH] pdbg: Bump version
Message-ID: <20171211105230.11117-1-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Contains the upstreamed build fix for Blackfin and various other bug
fixes.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Thanks again Thomas for your work! I reworked your patch a bit and got
it applied upstream.

 ...fix-to-build-on-architecture-with-non-emp.patch | 63 ----------------------
 package/pdbg/pdbg.hash                             |  2 +-
 package/pdbg/pdbg.mk                               |  2 +-
 3 files changed, 2 insertions(+), 65 deletions(-)
 delete mode 100644 package/pdbg/0001-template.S-fix-to-build-on-architecture-with-non-emp.patch

diff --git a/package/pdbg/0001-template.S-fix-to-build-on-architecture-with-non-emp.patch b/package/pdbg/0001-template.S-fix-to-build-on-architecture-with-non-emp.patch
deleted file mode 100644
index 15c0eef61140..000000000000
--- a/package/pdbg/0001-template.S-fix-to-build-on-architecture-with-non-emp.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 50ae93273376ede704012030009c29bd58d6a569 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 26 Nov 2017 16:22:25 +0100
-Subject: [PATCH] template.S: fix to build on architecture with non-empty
- __USER_LABEL_PREFIX__
-
-Blackfin has a non-empty __USER_LABEL_PREFIX__, which means that a
-symbol called "foo" in C must be named "_foo" in assembler.
-
-Interestingly, it seems like "$(CC) -xassembler - -c" doesn't pass the
-input source file through the C preprocessor, so we do this
-explicitly.
-
-Submitted-upstream: https://github.com/open-power/pdbg/pull/26
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile.am |  2 +-
- template.S  | 22 +++++++++++++++-------
- 2 files changed, 16 insertions(+), 8 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 9d34bff..82e0856 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -62,4 +62,4 @@ p9z-fsi.dtb.o: p9z-fsi.dts p9-fsi.dtsi
- %.dtb.o: %.dts
- 	dtc -i$(dir $@) -I dts $< -O dtb > $@.tmp
- 	symbol_prefix=`echo $@ | tr '.-' '_'` ; \
--	sed "s%SYMBOL_PREFIX%$${symbol_prefix}%g; s%FILENAME%$@.tmp%g" $(top_srcdir)/template.S | $(CC) -xassembler - -c -o $@
-+	sed "s%SYMBOL_PREFIX%$${symbol_prefix}%g; s%FILENAME%$@.tmp%g" $(top_srcdir)/template.S | $(CPP) - | $(CC) -xassembler - -c -o $@
-diff --git a/template.S b/template.S
-index 2e6cbdb..1407a7c 100644
---- a/template.S
-+++ b/template.S
-@@ -1,10 +1,18 @@
-+#ifdef __USER_LABEL_PREFIX__
-+#define CONCAT1(a, b) CONCAT2(a, b)
-+#define CONCAT2(a, b) a ## b
-+#define SYM(x) CONCAT1 (__USER_LABEL_PREFIX__, x)
-+#else
-+#define SYM(x) x
-+#endif
-+
- .section .data
--_binary_SYMBOL_PREFIX_start:
-+SYM(_binary_SYMBOL_PREFIX_start):
- .incbin "FILENAME"
- .align 4
--_binary_SYMBOL_PREFIX_end:
--_binary_SYMBOL_PREFIX_size:
--	.long	_binary_SYMBOL_PREFIX_end - _binary_SYMBOL_PREFIX_start
--.globl _binary_SYMBOL_PREFIX_start
--.globl _binary_SYMBOL_PREFIX_end
--.globl _binary_SYMBOL_PREFIX_size
-+SYM(_binary_SYMBOL_PREFIX_end):
-+SYM(_binary_SYMBOL_PREFIX_size):
-+	.long	SYM(_binary_SYMBOL_PREFIX_end) - SYM(_binary_SYMBOL_PREFIX_start)
-+.globl SYM(_binary_SYMBOL_PREFIX_start)
-+.globl SYM(_binary_SYMBOL_PREFIX_end)
-+.globl SYM(_binary_SYMBOL_PREFIX_size)
--- 
-2.13.6
-
diff --git a/package/pdbg/pdbg.hash b/package/pdbg/pdbg.hash
index 6fef1280847a..39aa33e12ce8 100644
--- a/package/pdbg/pdbg.hash
+++ b/package/pdbg/pdbg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 e9143607b0d15693ace9f50b27f931020127a9d605c45f8609f1fe8608be7949  pdbg-527fe54e1c95e031efd3db008c3f4e096cb3ea58.tar.gz
+sha256 2d6174d30b12cb46d24c260ecc0714a757c2cb899be3f5106c148d4c359bd319 pdbg-139ba071c222a5b0c20075f7c2265029ddd59449.tar.gz
diff --git a/package/pdbg/pdbg.mk b/package/pdbg/pdbg.mk
index f16a392aa6b1..ba9aa15d026e 100644
--- a/package/pdbg/pdbg.mk
+++ b/package/pdbg/pdbg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PDBG_VERSION = 527fe54e1c95e031efd3db008c3f4e096cb3ea58
+PDBG_VERSION = 139ba071c222a5b0c20075f7c2265029ddd59449
 PDBG_SITE = $(call github,open-power,pdbg,$(PDBG_VERSION))
 PDBG_LICENSE = Apache-2.0
 PDBG_LICENSE_FILES = COPYING
-- 
2.14.1
