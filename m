From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Dec 2020 11:44:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/php: fix build on mips r6
Message-ID: <20201227104442.889130-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/4a5/4a582af6b66c59a61b75a7047d8530202972ebdd/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...the-standard-code-path-of-sljit-emit.patch | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 package/php/0005-Use-the-standard-code-path-of-sljit-emit.patch

diff --git a/package/php/0005-Use-the-standard-code-path-of-sljit-emit.patch b/package/php/0005-Use-the-standard-code-path-of-sljit-emit.patch
new file mode 100644
index 0000000000..d8961ee1b6
--- /dev/null
+++ b/package/php/0005-Use-the-standard-code-path-of-sljit-emit.patch
@@ -0,0 +1,61 @@
+From 5d7f6573c1eef30a9720edd31a92c1a4b99b7d86 Mon Sep 17 00:00:00 2001
+From: Zoltan Herczeg <zherczeg.u-szeged@partner.samsung.com>
+Date: Tue, 3 Nov 2020 14:12:01 +0100
+Subject: [PATCH] Use the standard code path of sljit_emit_cmov on mips r6.
+ (#97)
+
+Downloaded from upstream commit
+https://github.com/zherczeg/sljit/commit/5d7f6573c1eef30a9720edd31a92c1a4b99b7d86
+SVN commit: https://vcs.pcre.org/pcre2?view=revision&revision=1281
+
+[Bernd: ported to php-7.4.13]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ ext/pcre/pcre2lib/sljit/sljitLir.c               | 2 +-
+ ext/pcre/pcre2lib/sljit/sljitNativeMIPS_common.c | 8 ++++----
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/ext/pcre/pcre2lib/sljit/sljitLir.c b/ext/pcre/pcre2lib/sljit/sljitLir.c
+index 4078613..d817c90 100644
+--- a/ext/pcre/pcre2lib/sljit/sljitLir.c
++++ b/ext/pcre/pcre2lib/sljit/sljitLir.c
+@@ -2034,7 +2034,7 @@ static SLJIT_INLINE sljit_s32 emit_mov_before_return(struct sljit_compiler *comp
+ #if (defined SLJIT_CONFIG_X86 && SLJIT_CONFIG_X86) \
+ 		|| (defined SLJIT_CONFIG_PPC && SLJIT_CONFIG_PPC) \
+ 		|| (defined SLJIT_CONFIG_SPARC_32 && SLJIT_CONFIG_SPARC_32) \
+-		|| ((defined SLJIT_CONFIG_MIPS && SLJIT_CONFIG_MIPS) && !(defined SLJIT_MIPS_REV && SLJIT_MIPS_REV >= 1))
++		|| ((defined SLJIT_CONFIG_MIPS && SLJIT_CONFIG_MIPS) && !(defined SLJIT_MIPS_REV && SLJIT_MIPS_REV >= 1 && SLJIT_MIPS_REV < 6))
+ 
+ static SLJIT_INLINE sljit_s32 sljit_emit_cmov_generic(struct sljit_compiler *compiler, sljit_s32 type,
+ 	sljit_s32 dst_reg,
+diff --git a/ext/pcre/pcre2lib/sljit/sljitNativeMIPS_common.c b/ext/pcre/pcre2lib/sljit/sljitNativeMIPS_common.c
+index 8b8c12a..ecf4dac 100644
+--- a/ext/pcre/pcre2lib/sljit/sljitNativeMIPS_common.c
++++ b/ext/pcre/pcre2lib/sljit/sljitNativeMIPS_common.c
+@@ -2185,14 +2185,14 @@ SLJIT_API_FUNC_ATTRIBUTE sljit_s32 sljit_emit_cmov(struct sljit_compiler *compil
+ 	sljit_s32 dst_reg,
+ 	sljit_s32 src, sljit_sw srcw)
+ {
+-#if (defined SLJIT_MIPS_REV && SLJIT_MIPS_REV >= 1)
++#if (defined SLJIT_MIPS_REV && SLJIT_MIPS_REV >= 1 && SLJIT_MIPS_REV < 6)
+ 	sljit_ins ins;
+-#endif /* SLJIT_MIPS_REV >= 1 */
++#endif /* SLJIT_MIPS_REV >= 1 && SLJIT_MIPS_REV < 6 */
+ 
+ 	CHECK_ERROR();
+ 	CHECK(check_sljit_emit_cmov(compiler, type, dst_reg, src, srcw));
+ 
+-#if (defined SLJIT_MIPS_REV && SLJIT_MIPS_REV >= 1)
++#if (defined SLJIT_MIPS_REV && SLJIT_MIPS_REV >= 1 && SLJIT_MIPS_REV < 6)
+ 
+ 	if (SLJIT_UNLIKELY(src & SLJIT_IMM)) {
+ #if (defined SLJIT_CONFIG_MIPS_64 && SLJIT_CONFIG_MIPS_64)
+@@ -2249,7 +2249,7 @@ SLJIT_API_FUNC_ATTRIBUTE sljit_s32 sljit_emit_cmov(struct sljit_compiler *compil
+ 
+ 	return push_inst(compiler, ins | S(src) | D(dst_reg), DR(dst_reg));
+ 
+-#else /* SLJIT_MIPS_REV < 1 */
++#else /* SLJIT_MIPS_REV < 1 || SLJIT_MIPS_REV >= 6 */
+ 	return sljit_emit_cmov_generic(compiler, type, dst_reg, src, srcw);
+ #endif /* SLJIT_MIPS_REV >= 1 */
+ }
-- 
2.29.2
