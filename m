From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 22 May 2014 17:37:00 -0300
Subject: [Buildroot] [PATCH] gcc: bump 4.8.x series to version 4.8.3
Message-ID: <1400791020-28571-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update 900-musl-support.patch with upstreamed chunks.

Now upstreamed hence dropped:
840-PR57717.patch (in another way).
842-gcc-4.8.2-Fix-PR-target-58854.patch
843-gcc-4.8.2-Fix-PR-target-58595.patch
850-xtensa-libgcc-linker-script.patch

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcc/4.8.2/840-PR57717.patch                |  23 --
 .../4.8.2/842-gcc-4.8.2-Fix-PR-target-58854.patch  |  32 --
 .../4.8.2/843-gcc-4.8.2-Fix-PR-target-58595.patch  | 101 -------
 .../4.8.2/850-xtensa-libgcc-linker-script.patch    |  29 --
 package/gcc/{4.8.2 => 4.8.3}/100-uclibc-conf.patch |   0
 .../{4.8.2 => 4.8.3}/301-missing-execinfo_h.patch  |   0
 .../gcc/{4.8.2 => 4.8.3}/302-c99-snprintf.patch    |   0
 .../305-libmudflap-susv3-legacy.patch              |   0
 .../810-arm-softfloat-libgcc.patch                 |   0
 .../{4.8.2 => 4.8.3}/830-arm_unbreak_armv4t.patch  |   0
 .../gcc/{4.8.2 => 4.8.3}/841-PR57717-E500v2.patch  |  10 +-
 .../gcc/{4.8.2 => 4.8.3}/900-musl-support.patch    | 328 ++++++++-------------
 .../powerpc-link-with-math-lib.patch.conditional   |   0
 package/gcc/Config.in.host                         |   2 +-
 14 files changed, 134 insertions(+), 391 deletions(-)
 delete mode 100644 package/gcc/4.8.2/840-PR57717.patch
 delete mode 100644 package/gcc/4.8.2/842-gcc-4.8.2-Fix-PR-target-58854.patch
 delete mode 100644 package/gcc/4.8.2/843-gcc-4.8.2-Fix-PR-target-58595.patch
 delete mode 100644 package/gcc/4.8.2/850-xtensa-libgcc-linker-script.patch
 rename package/gcc/{4.8.2 => 4.8.3}/100-uclibc-conf.patch (100%)
 rename package/gcc/{4.8.2 => 4.8.3}/301-missing-execinfo_h.patch (100%)
 rename package/gcc/{4.8.2 => 4.8.3}/302-c99-snprintf.patch (100%)
 rename package/gcc/{4.8.2 => 4.8.3}/305-libmudflap-susv3-legacy.patch (100%)
 rename package/gcc/{4.8.2 => 4.8.3}/810-arm-softfloat-libgcc.patch (100%)
 rename package/gcc/{4.8.2 => 4.8.3}/830-arm_unbreak_armv4t.patch (100%)
 rename package/gcc/{4.8.2 => 4.8.3}/841-PR57717-E500v2.patch (62%)
 rename package/gcc/{4.8.2 => 4.8.3}/900-musl-support.patch (77%)
 rename package/gcc/{4.8.2 => 4.8.3}/powerpc-link-with-math-lib.patch.conditional (100%)

diff --git a/package/gcc/4.8.2/840-PR57717.patch b/package/gcc/4.8.2/840-PR57717.patch
deleted file mode 100644
index f983f70..0000000
--- a/package/gcc/4.8.2/840-PR57717.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-This backports fix from http://gcc.gnu.org/bugzilla/show_bug.cgi?id=57717
-
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: gcc-4.8.1/gcc/config/rs6000/rs6000.c
-===================================================================
---- gcc-4.8.1.orig/gcc/config/rs6000/rs6000.c	2013-05-09 18:54:06.000000000 -0700
-+++ gcc-4.8.1/gcc/config/rs6000/rs6000.c	2013-06-27 08:22:40.459021366 -0700
-@@ -5431,11 +5431,12 @@
- 
-     case TFmode:
-     case TDmode:
--    case TImode:
-       if (TARGET_E500_DOUBLE)
- 	return (SPE_CONST_OFFSET_OK (offset)
- 		&& SPE_CONST_OFFSET_OK (offset + 8));
-+        /* Fall through.  */
- 
-+    case TImode:
-       extra = 8;
-       if (!worst_case)
- 	break;
diff --git a/package/gcc/4.8.2/842-gcc-4.8.2-Fix-PR-target-58854.patch b/package/gcc/4.8.2/842-gcc-4.8.2-Fix-PR-target-58854.patch
deleted file mode 100644
index 4927930..0000000
--- a/package/gcc/4.8.2/842-gcc-4.8.2-Fix-PR-target-58854.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 9a228f68817f79bbd1d295b8e6fcaed25c47ee8f Mon Sep 17 00:00:00 2001
-From: ramana <ramana@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Wed, 30 Oct 2013 10:54:04 +0000
-Subject: [PATCH] Fix PR target/58854
-
-2013-10-30  Ramana Radhakrishnan  <ramana.radhakrishnan@arm.com>
-
-	PR target/58854
-	* config/arm/arm.c (arm_expand_epilogue_apcs_frame): Emit blockage.
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 204203 138bc75d-0d04-0410-961f-82ee72b054a4
----
- (omitted from this patch) gcc/ChangeLog        |    5 +++++
- gcc/config/arm/arm.c |    1 +
- 2 files changed, 6 insertions(+), 0 deletions(-)
-
-diff --git a/gcc/config/arm/arm.c b/gcc/config/arm/arm.c
-index 212a4bc..23dfc0e 100644
---- a/gcc/config/arm/arm.c
-+++ b/gcc/config/arm/arm.c
-@@ -26547,6 +26547,7 @@ arm_expand_epilogue_apcs_frame (bool really_return)
-   num_regs = bit_count (saved_regs_mask);
-   if ((offsets->outgoing_args != (1 + num_regs)) || cfun->calls_alloca)
-     {
-+      emit_insn (gen_blockage ());
-       /* Unwind the stack to just below the saved registers.  */
-       emit_insn (gen_addsi3 (stack_pointer_rtx,
-                              hard_frame_pointer_rtx,
--- 
-1.7.1
-
diff --git a/package/gcc/4.8.2/843-gcc-4.8.2-Fix-PR-target-58595.patch b/package/gcc/4.8.2/843-gcc-4.8.2-Fix-PR-target-58595.patch
deleted file mode 100644
index 62a3994..0000000
--- a/package/gcc/4.8.2/843-gcc-4.8.2-Fix-PR-target-58595.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-Backport fix for PR target/58595
-
-From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Thu, 6 Mar 2014 12:07:07 +0000
-Subject: [PATCH] 	PR target/58595 	* config/arm/arm.c
- (arm_tls_symbol_p): Remove. 	(arm_legitimize_address): Call
- legitimize_tls_address for any 	arm_tls_referenced_p expression,
- handle constant addend.  Call it 	before testing for !TARGET_ARM. 
- (thumb_legitimize_address): Don't handle arm_tls_symbol_p here.
-
-	* gcc.dg/tls/pr58595.c: New test.
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 208380 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Index: gcc-4.8.2/gcc/config/arm/arm.c
-===================================================================
---- gcc-4.8.2.orig/gcc/config/arm/arm.c
-+++ gcc-4.8.2/gcc/config/arm/arm.c
-@@ -230,7 +230,6 @@ static tree arm_gimplify_va_arg_expr (tr
- static void arm_option_override (void);
- static unsigned HOST_WIDE_INT arm_shift_truncation_mask (enum machine_mode);
- static bool arm_cannot_copy_insn_p (rtx);
--static bool arm_tls_symbol_p (rtx x);
- static int arm_issue_rate (void);
- static void arm_output_dwarf_dtprel (FILE *, int, rtx) ATTRIBUTE_UNUSED;
- static bool arm_output_addr_const_extra (FILE *, rtx);
-@@ -6573,6 +6572,32 @@ legitimize_tls_address (rtx x, rtx reg)
- rtx
- arm_legitimize_address (rtx x, rtx orig_x, enum machine_mode mode)
- {
-+  if (arm_tls_referenced_p (x))
-+    {
-+      rtx addend = NULL;
-+
-+      if (GET_CODE (x) == CONST && GET_CODE (XEXP (x, 0)) == PLUS)
-+	{
-+	  addend = XEXP (XEXP (x, 0), 1);
-+	  x = XEXP (XEXP (x, 0), 0);
-+	}
-+
-+      if (GET_CODE (x) != SYMBOL_REF)
-+	return x;
-+
-+      gcc_assert (SYMBOL_REF_TLS_MODEL (x) != 0);
-+
-+      x = legitimize_tls_address (x, NULL_RTX);
-+
-+      if (addend)
-+	{
-+	  x = gen_rtx_PLUS (SImode, x, addend);
-+	  orig_x = x;
-+	}
-+      else
-+	return x;
-+    }
-+
-   if (!TARGET_ARM)
-     {
-       /* TODO: legitimize_address for Thumb2.  */
-@@ -6581,9 +6606,6 @@ arm_legitimize_address (rtx x, rtx orig_
-       return thumb_legitimize_address (x, orig_x, mode);
-     }
- 
--  if (arm_tls_symbol_p (x))
--    return legitimize_tls_address (x, NULL_RTX);
--
-   if (GET_CODE (x) == PLUS)
-     {
-       rtx xop0 = XEXP (x, 0);
-@@ -6695,9 +6717,6 @@ arm_legitimize_address (rtx x, rtx orig_
- rtx
- thumb_legitimize_address (rtx x, rtx orig_x, enum machine_mode mode)
- {
--  if (arm_tls_symbol_p (x))
--    return legitimize_tls_address (x, NULL_RTX);
--
-   if (GET_CODE (x) == PLUS
-       && CONST_INT_P (XEXP (x, 1))
-       && (INTVAL (XEXP (x, 1)) >= 32 * GET_MODE_SIZE (mode)
-@@ -6988,20 +7007,6 @@ thumb_legitimize_reload_address (rtx *x_
- 
- /* Test for various thread-local symbols.  */
- 
--/* Return TRUE if X is a thread-local symbol.  */
--
--static bool
--arm_tls_symbol_p (rtx x)
--{
--  if (! TARGET_HAVE_TLS)
--    return false;
--
--  if (GET_CODE (x) != SYMBOL_REF)
--    return false;
--
--  return SYMBOL_REF_TLS_MODEL (x) != 0;
--}
--
- /* Helper for arm_tls_referenced_p.  */
- 
- static int
diff --git a/package/gcc/4.8.2/850-xtensa-libgcc-linker-script.patch b/package/gcc/4.8.2/850-xtensa-libgcc-linker-script.patch
deleted file mode 100644
index 378445d..0000000
--- a/package/gcc/4.8.2/850-xtensa-libgcc-linker-script.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 7c722c07a0781e4279f643650bc528422c80ce5e Mon Sep 17 00:00:00 2001
-Message-Id: <7c722c07a0781e4279f643650bc528422c80ce5e.1392126765.git.baruch@tkos.co.il>
-From: sterling <sterling@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Tue, 21 Jan 2014 19:50:02 +0000
-Subject: [PATCH] 2014-01-21  Baruch Siach <barch@tkos.co.il>
-
-	* config.host (tmake_file): add t-slibgcc-libgcc for xtensa*-*-linux*.
-
-Patch status: upstream (4.8 branch commit r206905)
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-
-diff --git a/libgcc/config.host b/libgcc/config.host
-index ee16d60e34a6..302aa6135211 100644
---- a/libgcc/config.host
-+++ b/libgcc/config.host
-@@ -1102,7 +1102,7 @@ xtensa*-*-elf*)
- 	extra_parts="$extra_parts crti.o crtn.o"
- 	;;
- xtensa*-*-linux*)
--	tmake_file="$tmake_file xtensa/t-xtensa xtensa/t-linux"
-+	tmake_file="$tmake_file xtensa/t-xtensa xtensa/t-linux t-slibgcc-libgcc"
- 	md_unwind_header=xtensa/linux-unwind.h
- 	;;
- am33_2.0-*-linux*)
--- 
-1.8.5.3
-
diff --git a/package/gcc/4.8.2/100-uclibc-conf.patch b/package/gcc/4.8.3/100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/4.8.2/100-uclibc-conf.patch
rename to package/gcc/4.8.3/100-uclibc-conf.patch
diff --git a/package/gcc/4.8.2/301-missing-execinfo_h.patch b/package/gcc/4.8.3/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/4.8.2/301-missing-execinfo_h.patch
rename to package/gcc/4.8.3/301-missing-execinfo_h.patch
diff --git a/package/gcc/4.8.2/302-c99-snprintf.patch b/package/gcc/4.8.3/302-c99-snprintf.patch
similarity index 100%
rename from package/gcc/4.8.2/302-c99-snprintf.patch
rename to package/gcc/4.8.3/302-c99-snprintf.patch
diff --git a/package/gcc/4.8.2/305-libmudflap-susv3-legacy.patch b/package/gcc/4.8.3/305-libmudflap-susv3-legacy.patch
similarity index 100%
rename from package/gcc/4.8.2/305-libmudflap-susv3-legacy.patch
rename to package/gcc/4.8.3/305-libmudflap-susv3-legacy.patch
diff --git a/package/gcc/4.8.2/810-arm-softfloat-libgcc.patch b/package/gcc/4.8.3/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from package/gcc/4.8.2/810-arm-softfloat-libgcc.patch
rename to package/gcc/4.8.3/810-arm-softfloat-libgcc.patch
diff --git a/package/gcc/4.8.2/830-arm_unbreak_armv4t.patch b/package/gcc/4.8.3/830-arm_unbreak_armv4t.patch
similarity index 100%
rename from package/gcc/4.8.2/830-arm_unbreak_armv4t.patch
rename to package/gcc/4.8.3/830-arm_unbreak_armv4t.patch
diff --git a/package/gcc/4.8.2/841-PR57717-E500v2.patch b/package/gcc/4.8.3/841-PR57717-E500v2.patch
similarity index 62%
rename from package/gcc/4.8.2/841-PR57717-E500v2.patch
rename to package/gcc/4.8.3/841-PR57717-E500v2.patch
index 96fa1da..a011e24 100644
--- a/package/gcc/4.8.2/841-PR57717-E500v2.patch
+++ b/package/gcc/4.8.3/841-PR57717-E500v2.patch
@@ -2,13 +2,15 @@ This backports fix from http://gcc.gnu.org/bugzilla/show_bug.cgi?id=57717
 
 Upstream-Status: Backport
 Signed-off-by: Julian Brown <Julian_Brown@mentor.com>
+[Gustavo: Update for gcc 4.8.3]
 
 fix for PR57717 (PowerPC E500v2)
 http://gcc.gnu.org/ml/gcc-patches/2013-08/msg00668.html
 
---- a/gcc/config/rs6000/rs6000.c	2013-05-09 20:54:06.000000000 -0500
-+++ b/gcc/config/rs6000/rs6000.c	2013-08-28 01:25:24.865218744 -0500
-@@ -6337,9 +6337,7 @@
+diff -Nura gcc-4.8.3/gcc/config/rs6000/rs6000.c gcc-4.8.3-pr57717/gcc/config/rs6000/rs6000.c
+--- gcc-4.8.3/gcc/config/rs6000/rs6000.c	2014-05-04 23:18:35.000000000 -0300
++++ gcc-4.8.3-pr57717/gcc/config/rs6000/rs6000.c	2014-05-22 15:20:12.554270919 -0300
+@@ -7343,9 +7343,7 @@
        && GET_CODE (XEXP (x, 1)) == CONST_INT
        && reg_offset_p
        && !SPE_VECTOR_MODE (mode)
@@ -16,6 +18,6 @@ http://gcc.gnu.org/ml/gcc-patches/2013-08/msg00668.html
 -				  || mode == DDmode || mode == TDmode
 -				  || mode == DImode))
 +      && !(TARGET_E500_DOUBLE && GET_MODE_SIZE (mode) > UNITS_PER_WORD)
-       && VECTOR_MEM_NONE_P (mode))
+       && (!VECTOR_MODE_P (mode) || VECTOR_MEM_NONE_P (mode)))
      {
        HOST_WIDE_INT val = INTVAL (XEXP (x, 1));
diff --git a/package/gcc/4.8.2/900-musl-support.patch b/package/gcc/4.8.3/900-musl-support.patch
similarity index 77%
rename from package/gcc/4.8.2/900-musl-support.patch
rename to package/gcc/4.8.3/900-musl-support.patch
index ec60c6e..55b0144 100644
--- a/package/gcc/4.8.2/900-musl-support.patch
+++ b/package/gcc/4.8.3/900-musl-support.patch
@@ -14,12 +14,11 @@ https://bitbucket.org/GregorR/musl-cross/src. Compared to the upstream version:
    https://bitbucket.org/GregorR/musl-gcc-patches/issue/4/musl-gcc-patches-break-the-build-on.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
+[Gustavo: Update for gcc 4.8.3]
 
-Index: b/fixincludes/mkfixinc.sh
-===================================================================
---- a/fixincludes/mkfixinc.sh
-+++ b/fixincludes/mkfixinc.sh
+diff -Nura gcc-4.8.3/fixincludes/mkfixinc.sh gcc-4.8.3-musl/fixincludes/mkfixinc.sh
+--- gcc-4.8.3/fixincludes/mkfixinc.sh	2012-10-28 18:42:48.000000000 -0300
++++ gcc-4.8.3-musl/fixincludes/mkfixinc.sh	2014-05-22 15:07:17.966799753 -0300
 @@ -19,7 +19,8 @@
      powerpc-*-eabi*    | \
      powerpc-*-rtems*   | \
@@ -30,44 +29,9 @@ Index: b/fixincludes/mkfixinc.sh
  	#  IF there is no include fixing,
  	#  THEN create a no-op fixer and exit
  	(echo "#! /bin/sh" ; echo "exit 0" ) > ${target}
-Index: b/gcc/config.gcc
-===================================================================
---- a/gcc/config.gcc
-+++ b/gcc/config.gcc
-@@ -550,7 +550,7 @@
- esac
- 
- # Common C libraries.
--tm_defines="$tm_defines LIBC_GLIBC=1 LIBC_UCLIBC=2 LIBC_BIONIC=3"
-+tm_defines="$tm_defines LIBC_GLIBC=1 LIBC_UCLIBC=2 LIBC_BIONIC=3 LIBC_MUSL=4"
- 
- # Common parts for widely ported systems.
- case ${target} in
-@@ -653,6 +653,9 @@
-     *-*-*uclibc*)
-       tm_defines="$tm_defines DEFAULT_LIBC=LIBC_UCLIBC"
-       ;;
-+    *-*-*musl*)
-+      tm_defines="$tm_defines DEFAULT_LIBC=LIBC_MUSL"
-+      ;;
-     *)
-       tm_defines="$tm_defines DEFAULT_LIBC=LIBC_GLIBC"
-       ;;
-@@ -2114,6 +2117,10 @@
- 	    powerpc*-*-linux*paired*)
- 		tm_file="${tm_file} rs6000/750cl.h" ;;
- 	esac
-+        case ${target} in
-+            *-linux*-musl*)
-+                enable_secureplt=yes ;;
-+        esac
- 	if test x${enable_secureplt} = xyes; then
- 		tm_file="rs6000/secureplt.h ${tm_file}"
- 	fi
-Index: b/gcc/config/aarch64/aarch64-linux.h
-===================================================================
---- a/gcc/config/aarch64/aarch64-linux.h
-+++ b/gcc/config/aarch64/aarch64-linux.h
+diff -Nura gcc-4.8.3/gcc/config/aarch64/aarch64-linux.h gcc-4.8.3-musl/gcc/config/aarch64/aarch64-linux.h
+--- gcc-4.8.3/gcc/config/aarch64/aarch64-linux.h	2013-08-13 10:22:18.000000000 -0300
++++ gcc-4.8.3-musl/gcc/config/aarch64/aarch64-linux.h	2014-05-22 15:07:17.967799807 -0300
 @@ -21,7 +21,12 @@
  #ifndef GCC_AARCH64_LINUX_H
  #define GCC_AARCH64_LINUX_H
@@ -81,10 +45,9 @@ Index: b/gcc/config/aarch64/aarch64-linux.h
  
  #define CPP_SPEC "%{pthread:-D_REENTRANT}"
  
-Index: b/gcc/config/arm/linux-eabi.h
-===================================================================
---- a/gcc/config/arm/linux-eabi.h
-+++ b/gcc/config/arm/linux-eabi.h
+diff -Nura gcc-4.8.3/gcc/config/arm/linux-eabi.h gcc-4.8.3-musl/gcc/config/arm/linux-eabi.h
+--- gcc-4.8.3/gcc/config/arm/linux-eabi.h	2013-01-10 17:38:27.000000000 -0300
++++ gcc-4.8.3-musl/gcc/config/arm/linux-eabi.h	2014-05-22 15:07:17.968799848 -0300
 @@ -77,6 +77,23 @@
      %{mfloat-abi=soft*:" GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "} \
      %{!mfloat-abi=*:" GLIBC_DYNAMIC_LINKER_DEFAULT "}"
@@ -109,20 +72,9 @@ Index: b/gcc/config/arm/linux-eabi.h
  /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
     use the GNU/Linux version, not the generic BPABI version.  */
  #undef  LINK_SPEC
-Index: b/gcc/config/i386/linux.h
-===================================================================
---- a/gcc/config/i386/linux.h
-+++ b/gcc/config/i386/linux.h
-@@ -21,3 +21,5 @@
- 
- #define GNU_USER_LINK_EMULATION "elf_i386"
- #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
-+#undef MUSL_DYNAMIC_LINKER
-+#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
-Index: b/gcc/config/i386/linux64.h
-===================================================================
---- a/gcc/config/i386/linux64.h
-+++ b/gcc/config/i386/linux64.h
+diff -Nura gcc-4.8.3/gcc/config/i386/linux64.h gcc-4.8.3-musl/gcc/config/i386/linux64.h
+--- gcc-4.8.3/gcc/config/i386/linux64.h	2013-01-10 17:38:27.000000000 -0300
++++ gcc-4.8.3-musl/gcc/config/i386/linux64.h	2014-05-22 15:07:17.968799848 -0300
 @@ -30,3 +30,10 @@
  #define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
  #define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
@@ -134,10 +86,18 @@ Index: b/gcc/config/i386/linux64.h
 +#define MUSL_DYNAMIC_LINKER64 "/lib/ld-musl-x86_64.so.1"
 +#undef MUSL_DYNAMIC_LINKERX32
 +#define MUSL_DYNAMIC_LINKERX32 "/lib/ld-musl-x32.so.1"
-Index: b/gcc/config/linux.h
-===================================================================
---- a/gcc/config/linux.h
-+++ b/gcc/config/linux.h
+diff -Nura gcc-4.8.3/gcc/config/i386/linux.h gcc-4.8.3-musl/gcc/config/i386/linux.h
+--- gcc-4.8.3/gcc/config/i386/linux.h	2013-01-10 17:38:27.000000000 -0300
++++ gcc-4.8.3-musl/gcc/config/i386/linux.h	2014-05-22 15:07:17.968799848 -0300
+@@ -21,3 +21,5 @@
+ 
+ #define GNU_USER_LINK_EMULATION "elf_i386"
+ #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
++#undef MUSL_DYNAMIC_LINKER
++#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
+diff -Nura gcc-4.8.3/gcc/config/linux.h gcc-4.8.3-musl/gcc/config/linux.h
+--- gcc-4.8.3/gcc/config/linux.h	2013-01-10 17:38:27.000000000 -0300
++++ gcc-4.8.3-musl/gcc/config/linux.h	2014-05-22 15:07:17.968799848 -0300
 @@ -32,10 +32,12 @@
  #define OPTION_GLIBC  (DEFAULT_LIBC == LIBC_GLIBC)
  #define OPTION_UCLIBC (DEFAULT_LIBC == LIBC_UCLIBC)
@@ -294,10 +254,9 @@ Index: b/gcc/config/linux.h
 +    { 0, 0, 0, 0, 0, 0 }				\
 +  }
 +#endif
-Index: b/gcc/config/linux.opt
-===================================================================
---- a/gcc/config/linux.opt
-+++ b/gcc/config/linux.opt
+diff -Nura gcc-4.8.3/gcc/config/linux.opt gcc-4.8.3-musl/gcc/config/linux.opt
+--- gcc-4.8.3/gcc/config/linux.opt	2013-01-10 17:38:27.000000000 -0300
++++ gcc-4.8.3-musl/gcc/config/linux.opt	2014-05-22 15:07:17.969799879 -0300
 @@ -30,3 +30,7 @@
  muclibc
  Target Report RejectNegative Var(linux_libc,LIBC_UCLIBC) Negative(mbionic)
@@ -306,10 +265,9 @@ Index: b/gcc/config/linux.opt
 +mmusl
 +Target Report RejectNegative Var(linux_libc,LIBC_MUSL) Negative(mglibc)
 +Use musl C library
-Index: b/gcc/config/microblaze/linux.h
-===================================================================
---- a/gcc/config/microblaze/linux.h
-+++ b/gcc/config/microblaze/linux.h
+diff -Nura gcc-4.8.3/gcc/config/microblaze/linux.h gcc-4.8.3-musl/gcc/config/microblaze/linux.h
+--- gcc-4.8.3/gcc/config/microblaze/linux.h	2013-03-14 12:43:23.000000000 -0300
++++ gcc-4.8.3-musl/gcc/config/microblaze/linux.h	2014-05-22 15:07:17.969799879 -0300
 @@ -25,7 +25,23 @@
  #undef TLS_NEEDS_GOT
  #define TLS_NEEDS_GOT 1
@@ -335,27 +293,18 @@ Index: b/gcc/config/microblaze/linux.h
  #undef  SUBTARGET_EXTRA_SPECS
  #define SUBTARGET_EXTRA_SPECS \
    { "dynamic_linker", DYNAMIC_LINKER }
-Index: b/gcc/config/microblaze/microblaze.h
-===================================================================
---- a/gcc/config/microblaze/microblaze.h
-+++ b/gcc/config/microblaze/microblaze.h
-@@ -213,6 +213,12 @@
- #define STRICT_ALIGNMENT        1
- #define PCC_BITFIELD_TYPE_MATTERS 1
- 
-+#undef SIZE_TYPE
-+#define SIZE_TYPE "unsigned int"
-+
-+#undef PTRDIFF_TYPE
-+#define PTRDIFF_TYPE "int"
-+
- #define CONSTANT_ALIGNMENT(EXP, ALIGN)					\
-   ((TREE_CODE (EXP) == STRING_CST  || TREE_CODE (EXP) == CONSTRUCTOR)	\
-    && (ALIGN) < BITS_PER_WORD						\
-Index: b/gcc/config/mips/linux.h
-===================================================================
---- a/gcc/config/mips/linux.h
-+++ b/gcc/config/mips/linux.h
+diff -Nura gcc-4.8.3/gcc/config/mips/linux64.h gcc-4.8.3-musl/gcc/config/mips/linux64.h
+--- gcc-4.8.3/gcc/config/mips/linux64.h	2013-01-10 17:38:27.000000000 -0300
++++ gcc-4.8.3-musl/gcc/config/mips/linux64.h	2014-05-22 15:07:52.473979031 -0300
+@@ -29,4 +29,4 @@
+ #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
+ #define GNU_USER_DYNAMIC_LINKERN32 \
+   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKERN32, UCLIBC_DYNAMIC_LINKERN32, \
+-			 BIONIC_DYNAMIC_LINKERN32)
++			 BIONIC_DYNAMIC_LINKERN32, MUSL_DYNAMIC_LINKER)
+diff -Nura gcc-4.8.3/gcc/config/mips/linux.h gcc-4.8.3-musl/gcc/config/mips/linux.h
+--- gcc-4.8.3/gcc/config/mips/linux.h	2013-01-10 17:38:27.000000000 -0300
++++ gcc-4.8.3-musl/gcc/config/mips/linux.h	2014-05-22 15:07:52.455978418 -0300
 @@ -18,3 +18,11 @@
  <http://www.gnu.org/licenses/>.  */
  
@@ -368,12 +317,11 @@ Index: b/gcc/config/mips/linux.h
 +#endif
 +#undef MUSL_DYNAMIC_LINKER
 +#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-mips" MUSL_DYNAMIC_LINKER_E ".so.1"
-Index: b/gcc/config/rs6000/linux64.h
-===================================================================
---- a/gcc/config/rs6000/linux64.h
-+++ b/gcc/config/rs6000/linux64.h
-@@ -354,17 +354,23 @@
- #define GLIBC_DYNAMIC_LINKER64 "/lib64/ld64.so.1"
+diff -Nura gcc-4.8.3/gcc/config/rs6000/linux64.h gcc-4.8.3-musl/gcc/config/rs6000/linux64.h
+--- gcc-4.8.3/gcc/config/rs6000/linux64.h	2014-04-04 12:10:24.000000000 -0300
++++ gcc-4.8.3-musl/gcc/config/rs6000/linux64.h	2014-05-22 15:07:52.455978418 -0300
+@@ -374,17 +374,23 @@
+ #endif
  #define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
  #define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
 +#undef MUSL_DYNAMIC_LINKER32
@@ -400,20 +348,18 @@ Index: b/gcc/config/rs6000/linux64.h
  
  #undef  DEFAULT_ASM_ENDIAN
  #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
-Index: b/gcc/config/rs6000/secureplt.h
-===================================================================
---- a/gcc/config/rs6000/secureplt.h
-+++ b/gcc/config/rs6000/secureplt.h
+diff -Nura gcc-4.8.3/gcc/config/rs6000/secureplt.h gcc-4.8.3-musl/gcc/config/rs6000/secureplt.h
+--- gcc-4.8.3/gcc/config/rs6000/secureplt.h	2013-01-10 17:38:27.000000000 -0300
++++ gcc-4.8.3-musl/gcc/config/rs6000/secureplt.h	2014-05-22 15:07:52.455978418 -0300
 @@ -18,3 +18,4 @@
  <http://www.gnu.org/licenses/>.  */
  
  #define CC1_SECURE_PLT_DEFAULT_SPEC "-msecure-plt"
 +#define LINK_SECURE_PLT_DEFAULT_SPEC "--secure-plt"
-Index: b/gcc/config/rs6000/sysv4.h
-===================================================================
---- a/gcc/config/rs6000/sysv4.h
-+++ b/gcc/config/rs6000/sysv4.h
-@@ -550,6 +550,9 @@
+diff -Nura gcc-4.8.3/gcc/config/rs6000/sysv4.h gcc-4.8.3-musl/gcc/config/rs6000/sysv4.h
+--- gcc-4.8.3/gcc/config/rs6000/sysv4.h	2014-04-04 11:50:31.000000000 -0300
++++ gcc-4.8.3-musl/gcc/config/rs6000/sysv4.h	2014-05-22 15:07:52.456978446 -0300
+@@ -537,6 +537,9 @@
  #ifndef CC1_SECURE_PLT_DEFAULT_SPEC
  #define CC1_SECURE_PLT_DEFAULT_SPEC ""
  #endif
@@ -421,9 +367,9 @@ Index: b/gcc/config/rs6000/sysv4.h
 +#define LINK_SECURE_PLT_DEFAULT_SPEC ""
 +#endif
  
- /* Pass -G xxx to the compiler and set correct endian mode.  */
+ /* Pass -G xxx to the compiler.  */
  #define	CC1_SPEC "%{G*} %(cc1_cpu)" \
-@@ -600,7 +603,8 @@
+@@ -585,7 +588,8 @@
  
  /* Override the default target of the linker.  */
  #define	LINK_TARGET_SPEC \
@@ -433,7 +379,7 @@ Index: b/gcc/config/rs6000/sysv4.h
  
  /* Any specific OS flags.  */
  #define LINK_OS_SPEC "\
-@@ -778,15 +782,18 @@
+@@ -763,15 +767,18 @@
  
  #define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
  #define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
@@ -455,18 +401,17 @@ Index: b/gcc/config/rs6000/sysv4.h
  
  #define LINK_OS_LINUX_SPEC "-m elf32ppclinux %{!shared: %{!static: \
    %{rdynamic:-export-dynamic} \
-@@ -912,6 +919,7 @@
-   { "cc1_endian_little",	CC1_ENDIAN_LITTLE_SPEC },		\
-   { "cc1_endian_default",	CC1_ENDIAN_DEFAULT_SPEC },		\
+@@ -894,6 +901,7 @@
+   { "link_os_openbsd",		LINK_OS_OPENBSD_SPEC },			\
+   { "link_os_default",		LINK_OS_DEFAULT_SPEC },			\
    { "cc1_secure_plt_default",	CC1_SECURE_PLT_DEFAULT_SPEC },		\
 +  { "link_secure_plt_default",	LINK_SECURE_PLT_DEFAULT_SPEC },		\
    { "cpp_os_ads",		CPP_OS_ADS_SPEC },			\
    { "cpp_os_yellowknife",	CPP_OS_YELLOWKNIFE_SPEC },		\
    { "cpp_os_mvme",		CPP_OS_MVME_SPEC },			\
-Index: b/gcc/config/sh/linux.h
-===================================================================
---- a/gcc/config/sh/linux.h
-+++ b/gcc/config/sh/linux.h
+diff -Nura gcc-4.8.3/gcc/config/sh/linux.h gcc-4.8.3-musl/gcc/config/sh/linux.h
+--- gcc-4.8.3/gcc/config/sh/linux.h	2013-03-14 00:01:53.000000000 -0300
++++ gcc-4.8.3-musl/gcc/config/sh/linux.h	2014-05-22 15:07:52.456978446 -0300
 @@ -43,7 +43,15 @@
  
  #define TARGET_ASM_FILE_END file_end_indicate_exec_stack
@@ -483,45 +428,43 @@ Index: b/gcc/config/sh/linux.h
  
  #undef SUBTARGET_LINK_EMUL_SUFFIX
  #define SUBTARGET_LINK_EMUL_SUFFIX "_linux"
-Index: b/gcc/config/sh/sh.c
-===================================================================
---- a/gcc/config/sh/sh.c
-+++ b/gcc/config/sh/sh.c
-@@ -22,8 +22,17 @@
- /* FIXME: This is a temporary hack, so that we can include <algorithm>
-    below.  <algorithm> will try to include <cstdlib> which will reference
-    malloc & co, which are poisoned by "system.h".  The proper solution is
--   to include <cstdlib> in "system.h" instead of <stdlib.h>.  */
-+   to include <cstdlib> in "system.h" instead of <stdlib.h>.
-+   It's also a temporary hack as the inclusion of sstream will cause inclusion
-+   of libc's pthread.h (istream->ios->ios_base->atomicity->gth->gthr-default)
-+   which in turn includes sched.h, which defines the CPU_ALLOC, which uses
-+   the poisoned calloc. the proper fix would be to shield the poison pragmas
-+   with some define that is only set when gcc developers do testing.
-+*/
- #include <cstdlib>
-+#include <sstream>
-+#include <vector>
-+#include <algorithm>
- 
- #include "config.h"
- #include "system.h"
-@@ -60,10 +69,6 @@
- #include "tm-constrs.h"
- #include "opts.h"
- 
--#include <sstream>
--#include <vector>
--#include <algorithm>
--
- int code_for_indirect_jump_scratch = CODE_FOR_indirect_jump_scratch;
- 
- #define MSW (TARGET_LITTLE_ENDIAN ? 1 : 0)
-Index: b/gcc/configure
-===================================================================
---- a/gcc/configure
-+++ b/gcc/configure
-@@ -26739,6 +26739,9 @@
+diff -Nura gcc-4.8.3/gcc/config.gcc gcc-4.8.3-musl/gcc/config.gcc
+--- gcc-4.8.3/gcc/config.gcc	2014-05-06 12:29:04.000000000 -0300
++++ gcc-4.8.3-musl/gcc/config.gcc	2014-05-22 15:07:17.967799807 -0300
+@@ -550,7 +550,7 @@
+ esac
+ 
+ # Common C libraries.
+-tm_defines="$tm_defines LIBC_GLIBC=1 LIBC_UCLIBC=2 LIBC_BIONIC=3"
++tm_defines="$tm_defines LIBC_GLIBC=1 LIBC_UCLIBC=2 LIBC_BIONIC=3 LIBC_MUSL=4"
+ 
+ # Common parts for widely ported systems.
+ case ${target} in
+@@ -653,6 +653,9 @@
+     *-*-*uclibc*)
+       tm_defines="$tm_defines DEFAULT_LIBC=LIBC_UCLIBC"
+       ;;
++    *-*-*musl*)
++      tm_defines="$tm_defines DEFAULT_LIBC=LIBC_MUSL"
++      ;;
+     *)
+       tm_defines="$tm_defines DEFAULT_LIBC=LIBC_GLIBC"
+       ;;
+@@ -2135,6 +2138,10 @@
+ 	    powerpc*-*-linux*paired*)
+ 		tm_file="${tm_file} rs6000/750cl.h" ;;
+ 	esac
++        case ${target} in
++            *-linux*-musl*)
++                enable_secureplt=yes ;;
++        esac
+ 	if test x${enable_secureplt} = xyes; then
+ 		tm_file="rs6000/secureplt.h ${tm_file}"
+ 	fi
+diff -Nura gcc-4.8.3/gcc/configure gcc-4.8.3-musl/gcc/configure
+--- gcc-4.8.3/gcc/configure	2014-04-28 07:05:29.000000000 -0300
++++ gcc-4.8.3-musl/gcc/configure	2014-05-22 15:07:52.469978896 -0300
+@@ -26821,6 +26821,9 @@
  else
    gcc_cv_libc_provides_ssp=no
      case "$target" in
@@ -531,7 +474,7 @@ Index: b/gcc/configure
         *-*-linux* | *-*-kfreebsd*-gnu | *-*-knetbsd*-gnu)
        # glibc 2.4 and later provides __stack_chk_fail and
        # either __stack_chk_guard, or TLS access to stack guard canary.
-@@ -26772,6 +26775,7 @@
+@@ -26854,6 +26857,7 @@
  	 # <http://gcc.gnu.org/ml/gcc/2008-10/msg00130.html>) and for now
  	 # simply assert that glibc does provide this, which is true for all
  	 # realistically usable GNU/Hurd configurations.
@@ -539,7 +482,7 @@ Index: b/gcc/configure
  	 gcc_cv_libc_provides_ssp=yes;;
         *-*-darwin* | *-*-freebsd*)
  	 ac_fn_c_check_func "$LINENO" "__stack_chk_fail" "ac_cv_func___stack_chk_fail"
-@@ -26854,6 +26858,9 @@
+@@ -26936,6 +26940,9 @@
        gcc_cv_target_dl_iterate_phdr=no
      fi
      ;;
@@ -549,11 +492,10 @@ Index: b/gcc/configure
  esac
  
  if test x$gcc_cv_target_dl_iterate_phdr = xyes; then
-Index: b/gcc/configure.ac
-===================================================================
---- a/gcc/configure.ac
-+++ b/gcc/configure.ac
-@@ -4722,6 +4722,9 @@
+diff -Nura gcc-4.8.3/gcc/configure.ac gcc-4.8.3-musl/gcc/configure.ac
+--- gcc-4.8.3/gcc/configure.ac	2014-04-28 07:05:29.000000000 -0300
++++ gcc-4.8.3-musl/gcc/configure.ac	2014-05-22 15:07:52.471978964 -0300
+@@ -4750,6 +4750,9 @@
        gcc_cv_libc_provides_ssp,
        [gcc_cv_libc_provides_ssp=no
      case "$target" in
@@ -563,7 +505,7 @@ Index: b/gcc/configure.ac
         *-*-linux* | *-*-kfreebsd*-gnu | *-*-knetbsd*-gnu)
        [# glibc 2.4 and later provides __stack_chk_fail and
        # either __stack_chk_guard, or TLS access to stack guard canary.
-@@ -4755,6 +4758,7 @@
+@@ -4783,6 +4786,7 @@
  	 # <http://gcc.gnu.org/ml/gcc/2008-10/msg00130.html>) and for now
  	 # simply assert that glibc does provide this, which is true for all
  	 # realistically usable GNU/Hurd configurations.
@@ -571,7 +513,7 @@ Index: b/gcc/configure.ac
  	 gcc_cv_libc_provides_ssp=yes;;
         *-*-darwin* | *-*-freebsd*)
  	 AC_CHECK_FUNC(__stack_chk_fail,[gcc_cv_libc_provides_ssp=yes],
-@@ -4820,6 +4824,9 @@
+@@ -4848,6 +4852,9 @@
        gcc_cv_target_dl_iterate_phdr=no
      fi
      ;;
@@ -581,10 +523,9 @@ Index: b/gcc/configure.ac
  esac
  GCC_TARGET_TEMPLATE([TARGET_DL_ITERATE_PHDR])
  if test x$gcc_cv_target_dl_iterate_phdr = xyes; then
-Index: b/gcc/ginclude/stddef.h
-===================================================================
---- a/gcc/ginclude/stddef.h
-+++ b/gcc/ginclude/stddef.h
+diff -Nura gcc-4.8.3/gcc/ginclude/stddef.h gcc-4.8.3-musl/gcc/ginclude/stddef.h
+--- gcc-4.8.3/gcc/ginclude/stddef.h	2013-01-10 17:38:27.000000000 -0300
++++ gcc-4.8.3-musl/gcc/ginclude/stddef.h	2014-05-22 15:07:52.472978998 -0300
 @@ -181,6 +181,7 @@
  #ifndef _GCC_SIZE_T
  #ifndef _SIZET_
@@ -609,10 +550,9 @@ Index: b/gcc/ginclude/stddef.h
  #endif /* __size_t */
  #endif /* _SIZET_ */
  #endif /* _GCC_SIZE_T */
-Index: b/libgcc/unwind-dw2-fde-dip.c
-===================================================================
---- a/libgcc/unwind-dw2-fde-dip.c
-+++ b/libgcc/unwind-dw2-fde-dip.c
+diff -Nura gcc-4.8.3/libgcc/unwind-dw2-fde-dip.c gcc-4.8.3-musl/libgcc/unwind-dw2-fde-dip.c
+--- gcc-4.8.3/libgcc/unwind-dw2-fde-dip.c	2013-02-04 16:06:20.000000000 -0300
++++ gcc-4.8.3-musl/libgcc/unwind-dw2-fde-dip.c	2014-05-22 15:07:52.472978998 -0300
 @@ -46,33 +46,13 @@
  #include "unwind-compat.h"
  #include "gthr.h"
@@ -653,10 +593,9 @@ Index: b/libgcc/unwind-dw2-fde-dip.c
  #endif
  
  #if defined(USE_PT_GNU_EH_FRAME)
-Index: b/libgomp/config/posix/time.c
-===================================================================
---- a/libgomp/config/posix/time.c
-+++ b/libgomp/config/posix/time.c
+diff -Nura gcc-4.8.3/libgomp/config/posix/time.c gcc-4.8.3-musl/libgomp/config/posix/time.c
+--- gcc-4.8.3/libgomp/config/posix/time.c	2013-01-14 15:18:49.000000000 -0300
++++ gcc-4.8.3-musl/libgomp/config/posix/time.c	2014-05-22 15:07:52.472978998 -0300
 @@ -28,6 +28,8 @@
     The following implementation uses the most simple POSIX routines.
     If present, POSIX 4 clocks should be used instead.  */
@@ -666,10 +605,9 @@ Index: b/libgomp/config/posix/time.c
  #include "libgomp.h"
  #include <unistd.h>
  #if TIME_WITH_SYS_TIME
-Index: b/libitm/config/arm/hwcap.cc
-===================================================================
---- a/libitm/config/arm/hwcap.cc
-+++ b/libitm/config/arm/hwcap.cc
+diff -Nura gcc-4.8.3/libitm/config/arm/hwcap.cc gcc-4.8.3-musl/libitm/config/arm/hwcap.cc
+--- gcc-4.8.3/libitm/config/arm/hwcap.cc	2013-02-03 14:46:11.000000000 -0300
++++ gcc-4.8.3-musl/libitm/config/arm/hwcap.cc	2014-05-22 15:07:52.473979031 -0300
 @@ -40,7 +40,11 @@
  
  #ifdef __linux__
@@ -682,10 +620,9 @@ Index: b/libitm/config/arm/hwcap.cc
  #include <elf.h>
  
  static void __attribute__((constructor))
-Index: b/libitm/config/linux/x86/tls.h
-===================================================================
---- a/libitm/config/linux/x86/tls.h
-+++ b/libitm/config/linux/x86/tls.h
+diff -Nura gcc-4.8.3/libitm/config/linux/x86/tls.h gcc-4.8.3-musl/libitm/config/linux/x86/tls.h
+--- gcc-4.8.3/libitm/config/linux/x86/tls.h	2013-02-03 14:46:11.000000000 -0300
++++ gcc-4.8.3-musl/libitm/config/linux/x86/tls.h	2014-05-22 15:07:52.473979031 -0300
 @@ -25,16 +25,19 @@
  #ifndef LIBITM_X86_TLS_H
  #define LIBITM_X86_TLS_H 1
@@ -715,10 +652,9 @@ Index: b/libitm/config/linux/x86/tls.h
 +#endif
  
  #endif // LIBITM_X86_TLS_H
-Index: b/libstdc++-v3/configure.host
-===================================================================
---- a/libstdc++-v3/configure.host
-+++ b/libstdc++-v3/configure.host
+diff -Nura gcc-4.8.3/libstdc++-v3/configure.host gcc-4.8.3-musl/libstdc++-v3/configure.host
+--- gcc-4.8.3/libstdc++-v3/configure.host	2013-06-18 22:18:38.000000000 -0300
++++ gcc-4.8.3-musl/libstdc++-v3/configure.host	2014-05-22 15:07:52.473979031 -0300
 @@ -264,6 +264,13 @@
      os_include_dir="os/bsd/freebsd"
      ;;
@@ -743,13 +679,3 @@ Index: b/libstdc++-v3/configure.host
    hpux*)
      os_include_dir="os/hpux"
      ;;
-Index: b/gcc/config/mips/linux64.h
-===================================================================
---- a/gcc/config/mips/linux64.h
-+++ b/gcc/config/mips/linux64.h
-@@ -29,4 +29,4 @@
- #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
- #define GNU_USER_DYNAMIC_LINKERN32 \
-   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKERN32, UCLIBC_DYNAMIC_LINKERN32, \
--			 BIONIC_DYNAMIC_LINKERN32)
-+			 BIONIC_DYNAMIC_LINKERN32, MUSL_DYNAMIC_LINKER)
diff --git a/package/gcc/4.8.2/powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.8.3/powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from package/gcc/4.8.2/powerpc-link-with-math-lib.patch.conditional
rename to package/gcc/4.8.3/powerpc-link-with-math-lib.patch.conditional
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index d0aa699..9feb452 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -106,7 +106,7 @@ config BR2_GCC_VERSION
 	default "4.5.4"     if BR2_GCC_VERSION_4_5_X
 	default "4.6.4"     if BR2_GCC_VERSION_4_6_X
 	default "4.7.3"     if BR2_GCC_VERSION_4_7_X
-	default "4.8.2"     if BR2_GCC_VERSION_4_8_X
+	default "4.8.3"     if BR2_GCC_VERSION_4_8_X
 	default "4.9.0"     if BR2_GCC_VERSION_4_9_X
 	default "arc-4.8-R3" if BR2_GCC_VERSION_4_8_ARC
 	default BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
-- 
1.8.5.5
