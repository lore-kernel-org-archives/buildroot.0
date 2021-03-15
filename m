From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 15 Mar 2021 21:48:45 +0100
Subject: [Buildroot] [PATCH v1] package/pcre2: bump version to 10.36
Message-ID: <20210315204845.11464-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- removed 0001-Use-the-standard-code-path-of-sljit_emit_cmov-on-mips-r6.patch
  (upstream [1])

- license file hash update (email update for Philip Hazel)

[1] https://vcs.pcre.org/pcre2?view=revision&revision=1281

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...e-path-of-sljit_emit_cmov-on-mips-r6.patch | 59 -------------------
 package/pcre2/pcre2.hash                      |  7 ++-
 package/pcre2/pcre2.mk                        |  2 +-
 3 files changed, 5 insertions(+), 63 deletions(-)
 delete mode 100644 package/pcre2/0001-Use-the-standard-code-path-of-sljit_emit_cmov-on-mips-r6.patch

diff --git a/package/pcre2/0001-Use-the-standard-code-path-of-sljit_emit_cmov-on-mips-r6.patch b/package/pcre2/0001-Use-the-standard-code-path-of-sljit_emit_cmov-on-mips-r6.patch
deleted file mode 100644
index 9d8e44a3af..0000000000
--- a/package/pcre2/0001-Use-the-standard-code-path-of-sljit_emit_cmov-on-mips-r6.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 5d7f6573c1eef30a9720edd31a92c1a4b99b7d86 Mon Sep 17 00:00:00 2001
-From: Zoltan Herczeg <zherczeg.u-szeged@partner.samsung.com>
-Date: Tue, 3 Nov 2020 14:12:01 +0100
-Subject: [PATCH] Use the standard code path of sljit_emit_cmov on mips r6.
- (#97)
-
-[Retrieved (and updated to fix paths) from:
-https://github.com/zherczeg/sljit/commit/5d7f6573c1eef30a9720edd31a92c1a4b99b7d86
-SVN commit: https://vcs.pcre.org/pcre2?view=revision&revision=1281]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- sljit_src/sljitLir.c               | 2 +-
- sljit_src/sljitNativeMIPS_common.c | 8 ++++----
- 2 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/sljit/sljitLir.c b/src/sljit/sljitLir.c
-index 4078613..d817c90 100644
---- a/src/sljit/sljitLir.c
-+++ b/src/sljit/sljitLir.c
-@@ -2043,7 +2043,7 @@ static SLJIT_INLINE sljit_s32 emit_mov_before_return(struct sljit_compiler *comp
- #if (defined SLJIT_CONFIG_X86 && SLJIT_CONFIG_X86) \
- 		|| (defined SLJIT_CONFIG_PPC && SLJIT_CONFIG_PPC) \
- 		|| (defined SLJIT_CONFIG_SPARC_32 && SLJIT_CONFIG_SPARC_32) \
--		|| ((defined SLJIT_CONFIG_MIPS && SLJIT_CONFIG_MIPS) && !(defined SLJIT_MIPS_REV && SLJIT_MIPS_REV >= 1))
-+		|| ((defined SLJIT_CONFIG_MIPS && SLJIT_CONFIG_MIPS) && !(defined SLJIT_MIPS_REV && SLJIT_MIPS_REV >= 1 && SLJIT_MIPS_REV < 6))
- 
- static SLJIT_INLINE sljit_s32 sljit_emit_cmov_generic(struct sljit_compiler *compiler, sljit_s32 type,
- 	sljit_s32 dst_reg,
-diff --git a/src/sljit/sljitNativeMIPS_common.c b/src/sljit/sljitNativeMIPS_common.c
-index 8b8c12a..ecf4dac 100644
---- a/src/sljit/sljitNativeMIPS_common.c
-+++ b/src/sljit/sljitNativeMIPS_common.c
-@@ -2186,14 +2186,14 @@ SLJIT_API_FUNC_ATTRIBUTE sljit_s32 sljit_emit_cmov(struct sljit_compiler *compil
- 	sljit_s32 dst_reg,
- 	sljit_s32 src, sljit_sw srcw)
- {
--#if (defined SLJIT_MIPS_REV && SLJIT_MIPS_REV >= 1)
-+#if (defined SLJIT_MIPS_REV && SLJIT_MIPS_REV >= 1 && SLJIT_MIPS_REV < 6)
- 	sljit_ins ins;
--#endif /* SLJIT_MIPS_REV >= 1 */
-+#endif /* SLJIT_MIPS_REV >= 1 && SLJIT_MIPS_REV < 6 */
- 
- 	CHECK_ERROR();
- 	CHECK(check_sljit_emit_cmov(compiler, type, dst_reg, src, srcw));
- 
--#if (defined SLJIT_MIPS_REV && SLJIT_MIPS_REV >= 1)
-+#if (defined SLJIT_MIPS_REV && SLJIT_MIPS_REV >= 1 && SLJIT_MIPS_REV < 6)
- 
- 	if (SLJIT_UNLIKELY(src & SLJIT_IMM)) {
- #if (defined SLJIT_CONFIG_MIPS_64 && SLJIT_CONFIG_MIPS_64)
-@@ -2250,7 +2250,7 @@ SLJIT_API_FUNC_ATTRIBUTE sljit_s32 sljit_emit_cmov(struct sljit_compiler *compil
- 
- 	return push_inst(compiler, ins | S(src) | D(dst_reg), DR(dst_reg));
- 
--#else /* SLJIT_MIPS_REV < 1 */
-+#else /* SLJIT_MIPS_REV < 1 || SLJIT_MIPS_REV >= 6 */
- 	return sljit_emit_cmov_generic(compiler, type, dst_reg, src, srcw);
- #endif /* SLJIT_MIPS_REV >= 1 */
- }
diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index 81313039f0..b30a290968 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,4 +1,5 @@
-# Locally calculated after checking pgp signature at https://ftp.pcre.org/pub/pcre/pcre2-10.35.tar.bz2.sig
-sha256  9ccba8e02b0ce78046cdfb52e5c177f0f445e421059e43becca4359c669d4613  pcre2-10.35.tar.bz2
+# Locally calculated after checking pgp signature
+# https://ftp.pcre.org/pub/pcre/pcre2-10.36.tar.bz2.sig
+sha256  a9ef39278113542968c7c73a31cfcb81aca1faa64690f400b907e8ab6b4a665c  pcre2-10.36.tar.bz2
 # Locally computed
-sha256  9cb35e4fe442e49d1fbe9c7e07d9601ac959774b24e1884665a3e2f88b7f0831  LICENCE
+sha256  8937734bbb1ba65d9f8ac7a7c8fc9016759a09aa2fb37d2175c06c9e7a856a24  LICENCE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index ddb53280f2..858ef59703 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.35
+PCRE2_VERSION = 10.36
 PCRE2_SITE = https://ftp.pcre.org/pub/pcre
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
-- 
2.30.1
