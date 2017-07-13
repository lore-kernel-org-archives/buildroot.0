From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 13 Jul 2017 21:39:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/pcre: bump version to 8.41
Message-ID: <20170713193928.13746-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patches 0003 & 0004, applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pcre/0003-CVE-2017-6004.patch | 21 ------------
 package/pcre/0004-CVE-2017-7186.patch | 60 -----------------------------------
 package/pcre/pcre.hash                |  2 +-
 package/pcre/pcre.mk                  |  2 +-
 4 files changed, 2 insertions(+), 83 deletions(-)
 delete mode 100644 package/pcre/0003-CVE-2017-6004.patch
 delete mode 100644 package/pcre/0004-CVE-2017-7186.patch

diff --git a/package/pcre/0003-CVE-2017-6004.patch b/package/pcre/0003-CVE-2017-6004.patch
deleted file mode 100644
index d0b6d51ba..000000000
--- a/package/pcre/0003-CVE-2017-6004.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Description: CVE-2017-6004: crafted regular expression may cause denial of service
-Origin: upstream, https://vcs.pcre.org/pcre/code/trunk/pcre_jit_compile.c?r1=1676&r2=1680&view=patch
-Bug: https://bugs.exim.org/show_bug.cgi?id=2035
-Bug-Debian: https://bugs.debian.org/855405
-Forwarded: not-needed
-Author: Salvatore Bonaccorso <carnil@debian.org>
-Last-Update: 2017-02-17
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-
---- a/pcre_jit_compile.c
-+++ b/pcre_jit_compile.c
-@@ -8111,7 +8111,7 @@ if (opcode == OP_COND || opcode == OP_SC
- 
-     if (*matchingpath == OP_FAIL)
-       stacksize = 0;
--    if (*matchingpath == OP_RREF)
-+    else if (*matchingpath == OP_RREF)
-       {
-       stacksize = GET2(matchingpath, 1);
-       if (common->currententry == NULL)
diff --git a/package/pcre/0004-CVE-2017-7186.patch b/package/pcre/0004-CVE-2017-7186.patch
deleted file mode 100644
index 980923ae4..000000000
--- a/package/pcre/0004-CVE-2017-7186.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-Description: Upstream fix for CVE-2017-7186 (Upstream rev 1688)
- Fix Unicode property crash for 32-bit characters greater than 0x10ffff.
-Author: Matthew Vernon <matthew@debian.org>
-X-Dgit-Generated: 2:8.39-3 c4c2c7c4f74d53b263af2471d8e11db88096bd13
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-
---- pcre3-8.39.orig/pcre_internal.h
-+++ pcre3-8.39/pcre_internal.h
-@@ -2772,6 +2772,9 @@ extern const pcre_uint8  PRIV(ucd_stage1
- extern const pcre_uint16 PRIV(ucd_stage2)[];
- extern const pcre_uint32 PRIV(ucp_gentype)[];
- extern const pcre_uint32 PRIV(ucp_gbtable)[];
-+#ifdef COMPILE_PCRE32
-+extern const ucd_record  PRIV(dummy_ucd_record)[];
-+#endif
- #ifdef SUPPORT_JIT
- extern const int         PRIV(ucp_typerange)[];
- #endif
-@@ -2780,9 +2783,15 @@ extern const int         PRIV(ucp_typera
- /* UCD access macros */
- 
- #define UCD_BLOCK_SIZE 128
--#define GET_UCD(ch) (PRIV(ucd_records) + \
-+#define REAL_GET_UCD(ch) (PRIV(ucd_records) + \
-         PRIV(ucd_stage2)[PRIV(ucd_stage1)[(int)(ch) / UCD_BLOCK_SIZE] * \
-         UCD_BLOCK_SIZE + (int)(ch) % UCD_BLOCK_SIZE])
-+        
-+#ifdef COMPILE_PCRE32
-+#define GET_UCD(ch) ((ch > 0x10ffff)? PRIV(dummy_ucd_record) : REAL_GET_UCD(ch))
-+#else
-+#define GET_UCD(ch) REAL_GET_UCD(ch)
-+#endif 
- 
- #define UCD_CHARTYPE(ch)    GET_UCD(ch)->chartype
- #define UCD_SCRIPT(ch)      GET_UCD(ch)->script
---- pcre3-8.39.orig/pcre_ucd.c
-+++ pcre3-8.39/pcre_ucd.c
-@@ -38,6 +38,20 @@ const pcre_uint16 PRIV(ucd_stage2)[] = {
- const pcre_uint32 PRIV(ucd_caseless_sets)[] = {0};
- #else
- 
-+/* If the 32-bit library is run in non-32-bit mode, character values
-+greater than 0x10ffff may be encountered. For these we set up a
-+special record. */
-+
-+#ifdef COMPILE_PCRE32
-+const ucd_record PRIV(dummy_ucd_record)[] = {{
-+  ucp_Common,    /* script */
-+  ucp_Cn,        /* type unassigned */
-+  ucp_gbOther,   /* grapheme break property */
-+  0,             /* case set */
-+  0,             /* other case */
-+  }};
-+#endif
-+
- /* When recompiling tables with a new Unicode version, please check the
- types in this structure definition from pcre_internal.h (the actual
- field names will be different):
diff --git a/package/pcre/pcre.hash b/package/pcre/pcre.hash
index 4c3c6c32e..b36e13017 100644
--- a/package/pcre/pcre.hash
+++ b/package/pcre/pcre.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	00e27a29ead4267e3de8111fcaa59b132d0533cdfdbdddf4b0604279acbcf4f4	pcre-8.40.tar.bz2
+sha256 e62c7eac5ae7c0e7286db61ff82912e1c0b7a0c13706616e94a7dd729321b530  pcre-8.41.tar.bz2
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index 0c145a9f8..b12b00dd6 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE_VERSION = 8.40
+PCRE_VERSION = 8.41
 PCRE_SITE = https://ftp.pcre.org/pub/pcre
 PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
 PCRE_LICENSE = BSD-3-Clause
-- 
2.11.0
