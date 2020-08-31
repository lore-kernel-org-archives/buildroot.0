From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 31 Aug 2020 22:15:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/ibm-sw-tpm2: fix build with gcc 10
Message-ID: <20200831201539.2192014-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/8533d202fb29bf2a1677de37fc71f1a0fbd54722

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...iable-to-fix-compilation-with-GCC-10.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/ibm-sw-tpm2/0002-Remove-unused-global-variable-to-fix-compilation-with-GCC-10.patch

diff --git a/package/ibm-sw-tpm2/0002-Remove-unused-global-variable-to-fix-compilation-with-GCC-10.patch b/package/ibm-sw-tpm2/0002-Remove-unused-global-variable-to-fix-compilation-with-GCC-10.patch
new file mode 100644
index 0000000000..ff82a1806a
--- /dev/null
+++ b/package/ibm-sw-tpm2/0002-Remove-unused-global-variable-to-fix-compilation-with-GCC-10.patch
@@ -0,0 +1,30 @@
+From 9bd2926c0f359f143141c32c2b261ca100d804c8 Mon Sep 17 00:00:00 2001
+From: Jonas Witschel <diabonas@archlinux.org>
+Date: Wed, 13 May 2020 10:56:03 +0200
+Subject: [PATCH] Remove unused global variable to fix compilation with GCC 10
+
+GCC defaults to -fno-common, resulting in a compilation error:
+
+CryptSym.h:84: multiple definition of `tpmCryptKeySchedule'
+
+Since the global variable is not used anywhere, it can be removed.
+[Retrieved from:
+https://github.com/kgoldman/ibmswtpm2/pull/3/commits/9bd2926c0f359f143141c32c2b261ca100d804c8]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/CryptSym.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/CryptSym.h b/src/CryptSym.h
+index 7b58e41..9a33b13 100644
+--- a/src/CryptSym.h
++++ b/src/CryptSym.h
+@@ -81,7 +81,7 @@ union tpmCryptKeySchedule_t {
+ #else
+     uint32_t            alignment;
+ #endif
+-} tpmCryptKeySchedule;
++};
+ /* Each block cipher within a library is expected to conform to the same calling conventions with
+    three parameters (keySchedule, in, and out) in the same order. That means that all algorithms
+    would use the same order of the same parameters. The code is written assuming the (keySchedule,
-- 
2.28.0
