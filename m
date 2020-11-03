From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Nov 2020 20:55:04 +0100
Subject: [Buildroot] [git commit] package/pcre2: fix build on mips r6
Message-ID: <20201103194417.AF8068718B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c599d699028bb313384daf51b0a21bb220a60c67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build of pcre2 10.35 on mips r6:
https://bugs.exim.org/show_bug.cgi?id=2667

Fixes:
 - http://autobuild.buildroot.org/results/eab208c050867c9bd12bd80dca33cbe0199b0a7d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...d-code-path-of-sljit_emit_cmov-on-mips-r6.patch | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/package/pcre2/0001-Use-the-standard-code-path-of-sljit_emit_cmov-on-mips-r6.patch b/package/pcre2/0001-Use-the-standard-code-path-of-sljit_emit_cmov-on-mips-r6.patch
new file mode 100644
index 0000000000..9d8e44a3af
--- /dev/null
+++ b/package/pcre2/0001-Use-the-standard-code-path-of-sljit_emit_cmov-on-mips-r6.patch
@@ -0,0 +1,59 @@
+From 5d7f6573c1eef30a9720edd31a92c1a4b99b7d86 Mon Sep 17 00:00:00 2001
+From: Zoltan Herczeg <zherczeg.u-szeged@partner.samsung.com>
+Date: Tue, 3 Nov 2020 14:12:01 +0100
+Subject: [PATCH] Use the standard code path of sljit_emit_cmov on mips r6.
+ (#97)
+
+[Retrieved (and updated to fix paths) from:
+https://github.com/zherczeg/sljit/commit/5d7f6573c1eef30a9720edd31a92c1a4b99b7d86
+SVN commit: https://vcs.pcre.org/pcre2?view=revision&revision=1281]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ sljit_src/sljitLir.c               | 2 +-
+ sljit_src/sljitNativeMIPS_common.c | 8 ++++----
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/sljit/sljitLir.c b/src/sljit/sljitLir.c
+index 4078613..d817c90 100644
+--- a/src/sljit/sljitLir.c
++++ b/src/sljit/sljitLir.c
+@@ -2043,7 +2043,7 @@ static SLJIT_INLINE sljit_s32 emit_mov_before_return(struct sljit_compiler *comp
+ #if (defined SLJIT_CONFIG_X86 && SLJIT_CONFIG_X86) \
+ 		|| (defined SLJIT_CONFIG_PPC && SLJIT_CONFIG_PPC) \
+ 		|| (defined SLJIT_CONFIG_SPARC_32 && SLJIT_CONFIG_SPARC_32) \
+-		|| ((defined SLJIT_CONFIG_MIPS && SLJIT_CONFIG_MIPS) && !(defined SLJIT_MIPS_REV && SLJIT_MIPS_REV >= 1))
++		|| ((defined SLJIT_CONFIG_MIPS && SLJIT_CONFIG_MIPS) && !(defined SLJIT_MIPS_REV && SLJIT_MIPS_REV >= 1 && SLJIT_MIPS_REV < 6))
+ 
+ static SLJIT_INLINE sljit_s32 sljit_emit_cmov_generic(struct sljit_compiler *compiler, sljit_s32 type,
+ 	sljit_s32 dst_reg,
+diff --git a/src/sljit/sljitNativeMIPS_common.c b/src/sljit/sljitNativeMIPS_common.c
+index 8b8c12a..ecf4dac 100644
+--- a/src/sljit/sljitNativeMIPS_common.c
++++ b/src/sljit/sljitNativeMIPS_common.c
+@@ -2186,14 +2186,14 @@ SLJIT_API_FUNC_ATTRIBUTE sljit_s32 sljit_emit_cmov(struct sljit_compiler *compil
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
+@@ -2250,7 +2250,7 @@ SLJIT_API_FUNC_ATTRIBUTE sljit_s32 sljit_emit_cmov(struct sljit_compiler *compil
+ 
+ 	return push_inst(compiler, ins | S(src) | D(dst_reg), DR(dst_reg));
+ 
+-#else /* SLJIT_MIPS_REV < 1 */
++#else /* SLJIT_MIPS_REV < 1 || SLJIT_MIPS_REV >= 6 */
+ 	return sljit_emit_cmov_generic(compiler, type, dst_reg, src, srcw);
+ #endif /* SLJIT_MIPS_REV >= 1 */
+ }
