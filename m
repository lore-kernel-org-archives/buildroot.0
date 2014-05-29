From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 May 2014 22:15:00 +0200
Subject: [Buildroot] [git commit branch/next] libffi: back-port support for
	ARC
Message-ID: <20140529201927.D39CD9CE1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=34c2afeb750fbbe92e4c00eaa374303bcf5e2584
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Support for ARC CPUs was added in libffi after 3.0.13 vesion was cut and up
until now no new release has been done. So to enale libffi on ARC we need this
set of patches.

These are corrsponding commits in libffi:
 * b082e15091961373c03d10ed0251f619ebb6ed76 - Add ARC support
 * 0f8690a84c874ec09a090c8c6adfb93c594acac6 - Rebuild for ARC additions
 * d918d47809c174d62283306b282749f8db93661f - arc: Fix build error

The first patch was modified a bit (cut changelog part) to accomodate
changes not related to ARC between 3.0.14 and changes in question.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Misca Jonker <mjonker@synopsys.com>

Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libffi/libffi-arc-01-Add-ARC-support.patch |  560 ++++++++++++++++++++
 .../libffi-arc-02-Rebuild-for-ARC-additions.patch  |  262 +++++++++
 .../libffi/libffi-arc-03-arc-Fix-build-error.patch |   43 ++
 3 files changed, 865 insertions(+), 0 deletions(-)

diff --git a/package/libffi/libffi-arc-01-Add-ARC-support.patch b/package/libffi/libffi-arc-01-Add-ARC-support.patch
new file mode 100644
index 0000000..c39a3e7
--- /dev/null
+++ b/package/libffi/libffi-arc-01-Add-ARC-support.patch
@@ -0,0 +1,560 @@
+From 5a2352c476b501ecbd3c7ef3ef3e02c24ce5a449 Mon Sep 17 00:00:00 2001
+From: Mischa Jonker <mjonker@synopsys.com>
+Date: Mon, 10 Jun 2013 16:19:33 +0200
+Subject: [PATCH 1/3] Add ARC support
+
+This adds support for the ARC architecture to libffi. DesignWare ARC
+is a family of processors from Synopsys, Inc.
+
+This patch has been tested on a little-endian system and passes
+the testsuite.
+
+Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
+---
+ Makefile.am         |   6 +-
+ README              |   1 +
+ configure.ac        |   5 +
+ src/arc/arcompact.S | 135 ++++++++++++++++++++++++++
+ src/arc/ffi.c       | 268 ++++++++++++++++++++++++++++++++++++++++++++++++++++
+ src/arc/ffitarget.h |  53 +++++++++++
+ 6 files changed, 467 insertions(+), 1 deletion(-)
+ create mode 100644 src/arc/arcompact.S
+ create mode 100644 src/arc/ffi.c
+ create mode 100644 src/arc/ffitarget.h
+
+diff --git a/Makefile.am b/Makefile.am
+index bf0156f..b57b2a8 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -9,7 +9,8 @@ SUBDIRS = include testsuite man
+ EXTRA_DIST = LICENSE ChangeLog.v1 ChangeLog.libgcj configure.host	\
+ 	 src/aarch64/ffi.c src/aarch64/ffitarget.h src/aarch64/sysv.S	\
+ 	 build-ios.sh src/alpha/ffi.c src/alpha/osf.S			\
+-	 src/alpha/ffitarget.h src/arm/ffi.c src/arm/sysv.S		\
++	 src/alpha/ffitarget.h src/arc/ffi.c src/arc/arcompact.S	\
++	 src/arc/ffitarget.h src/arm/ffi.c src/arm/sysv.S		\
+ 	 src/arm/ffitarget.h src/avr32/ffi.c src/avr32/sysv.S		\
+ 	 src/avr32/ffitarget.h src/cris/ffi.c src/cris/sysv.S		\
+ 	 src/cris/ffitarget.h src/ia64/ffi.c src/ia64/ffitarget.h	\
+@@ -170,6 +171,9 @@ endif
+ if AARCH64
+ nodist_libffi_la_SOURCES += src/aarch64/sysv.S src/aarch64/ffi.c
+ endif
++if ARC
++nodist_libffi_la_SOURCES += src/arc/sysv.S src/arc/ffi.c
++endif
+ if ARM
+ nodist_libffi_la_SOURCES += src/arm/sysv.S src/arm/ffi.c
+ if FFI_EXEC_TRAMPOLINE_TABLE
+diff --git a/README b/README
+index 19156fe..d8e4e9e 100644
+--- a/README
++++ b/README
+@@ -54,6 +54,7 @@ tested:
+ | AArch64         | Linux            | GCC                     |
+ | Alpha           | Linux            | GCC                     |
+ | Alpha           | Tru64            | GCC                     |
++| ARC             | Linux            | GCC                     |
+ | ARM             | Linux            | GCC                     |
+ | ARM             | iOS              | GCC                     |
+ | AVR32           | Linux            | GCC                     |
+diff --git a/configure.ac b/configure.ac
+index 0dc0675..a26cb46 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -77,6 +77,10 @@ case "$host" in
+ 	HAVE_LONG_DOUBLE='defined(__LONG_DOUBLE_128__)'
+ 	;;
+ 
++  arc*-*-*)
++	TARGET=ARC; TARGETDIR=arc
++	;;
++
+   arm*-*-*)
+ 	TARGET=ARM; TARGETDIR=arm
+ 	;;
+@@ -289,6 +293,7 @@ AM_CONDITIONAL(POWERPC_AIX, test x$TARGET = xPOWERPC_AIX)
+ AM_CONDITIONAL(POWERPC_DARWIN, test x$TARGET = xPOWERPC_DARWIN)
+ AM_CONDITIONAL(POWERPC_FREEBSD, test x$TARGET = xPOWERPC_FREEBSD)
+ AM_CONDITIONAL(AARCH64, test x$TARGET = xAARCH64)
++AM_CONDITIONAL(ARC, test x$TARGET = xARC)
+ AM_CONDITIONAL(ARM, test x$TARGET = xARM)
+ AM_CONDITIONAL(AVR32, test x$TARGET = xAVR32)
+ AM_CONDITIONAL(LIBFFI_CRIS, test x$TARGET = xLIBFFI_CRIS)
+diff --git a/src/arc/arcompact.S b/src/arc/arcompact.S
+new file mode 100644
+index 0000000..03715fd
+--- /dev/null
++++ b/src/arc/arcompact.S
+@@ -0,0 +1,135 @@
++/* -----------------------------------------------------------------------
++   arcompact.S - Copyright (c) 2013 Synposys, Inc. (www.synopsys.com)
++   
++   ARCompact Foreign Function Interface 
++
++   Permission is hereby granted, free of charge, to any person obtaining
++   a copy of this software and associated documentation files (the
++   ``Software''), to deal in the Software without restriction, including
++   without limitation the rights to use, copy, modify, merge, publish,
++   distribute, sublicense, and/or sell copies of the Software, and to
++   permit persons to whom the Software is furnished to do so, subject to
++   the following conditions:
++
++   The above copyright notice and this permission notice shall be included
++   in all copies or substantial portions of the Software.
++
++   THE SOFTWARE IS PROVIDED ``AS IS'', WITHOUT WARRANTY OF ANY KIND, EXPRESS
++   OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++   IN NO EVENT SHALL RENESAS TECHNOLOGY BE LIABLE FOR ANY CLAIM, DAMAGES OR
++   OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
++   ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
++   OTHER DEALINGS IN THE SOFTWARE.
++   ----------------------------------------------------------------------- */
++
++#define LIBFFI_ASM
++#include <fficonfig.h>
++#include <ffi.h>
++#ifdef HAVE_MACHINE_ASM_H
++#include <machine/asm.h>
++#else
++#define CNAME(x) x
++#define ENTRY(x) .globl CNAME(x)` .type CNAME(x),%function` CNAME(x):
++#endif
++
++.text
++
++        /* R0:   ffi_prep_args */
++        /* R1:   &ecif */
++        /* R2:   cif->bytes */
++        /* R3:   fig->flags */
++        /* R4:   ecif.rvalue */
++        /* R5:   fn */
++ENTRY(ffi_call_ARCompact)
++        /* Save registers.  */
++        st.a       fp, [sp, -4]        /* fp + 20, fp */
++        push_s     blink               /* fp + 16, blink */
++        st.a       r4, [sp, -4]        /* fp + 12, ecif.rvalue */
++        push_s     r3                  /* fp +  8, fig->flags */
++        st.a       r5, [sp, -4]        /* fp +  4, fn */
++        push_s     r2                  /* fp +  0, cif->bytes */
++        mov        fp, sp
++
++        /* Make room for all of the new args.  */
++        sub        sp, sp, r2
++
++        /* Place all of the ffi_prep_args in position.  */
++        /* ffi_prep_args(char *stack, extended_cif *ecif) */
++        /* R1 already set.  */
++
++        /* And call.  */
++        jl_s.d     [r0]
++        mov_s      r0, sp
++
++        ld.ab      r12, [fp, 4]        /* cif->bytes */
++        ld.ab      r11, [fp, 4]        /* fn */
++
++        /* Move first 8 parameters in registers...  */
++        ld_s       r0, [sp]
++        ld_s       r1, [sp, 4]
++        ld_s       r2, [sp, 8]
++        ld_s       r3, [sp, 12]
++        ld         r4, [sp, 16]
++        ld         r5, [sp, 20]
++        ld         r6, [sp, 24]
++        ld         r7, [sp, 28]
++
++        /* ...and adjust the stack.  */
++        min        r12, r12, 32
++
++        /* Call the function.  */
++        jl.d       [r11]
++        add        sp, sp, r12 
++
++        mov        sp, fp        
++        pop_s      r3        /* fig->flags, return type */
++        pop_s      r2        /* ecif.rvalue, pointer for return value */
++
++        /* If the return value pointer is NULL, assume no return value.  */
++        breq.d     r2, 0, epilogue
++        pop_s      blink
++
++        /* Return INT.  */
++        brne       r3, FFI_TYPE_INT, return_double
++        b.d        epilogue
++        st_s       r0, [r2]        
++
++return_double:
++        brne       r3, FFI_TYPE_DOUBLE, epilogue
++        st_s       r0, [r2]        
++        st_s       r1, [r2,4]
++
++epilogue:
++        j_s.d      [blink]
++        ld.ab      fp, [sp, 4]
++
++ENTRY(ffi_closure_ARCompact)
++        st.a       r0, [sp, -32]
++        st_s       r1, [sp, 4]
++        st_s       r2, [sp, 8]
++        st_s       r3, [sp, 12]
++        st         r4, [sp, 16]
++        st         r5, [sp, 20]
++        st         r6, [sp, 24]
++        st         r7, [sp, 28]
++
++        /* pointer to arguments */
++        mov_s      r2, sp
++
++        /* return value goes here */
++        sub        sp, sp, 8
++        mov_s      r1, sp
++
++        push_s     blink
++        
++        bl.d       ffi_closure_inner_ARCompact
++        mov_s      r0, r8                /* codeloc, set by trampoline */
++
++        pop_s      blink
++
++        /* set return value to r1:r0 */
++        pop_s      r0
++        pop_s      r1
++        j_s.d      [blink]
++        add_s      sp, sp, 32
+diff --git a/src/arc/ffi.c b/src/arc/ffi.c
+new file mode 100644
+index 0000000..32f82a7
+--- /dev/null
++++ b/src/arc/ffi.c
+@@ -0,0 +1,268 @@
++/* -----------------------------------------------------------------------
++   ffi.c - Copyright (c) 2013  Synopsys, Inc. (www.synopsys.com)
++   
++   ARC Foreign Function Interface 
++
++   Permission is hereby granted, free of charge, to any person obtaining
++   a copy of this software and associated documentation files (the
++   ``Software''), to deal in the Software without restriction, including
++   without limitation the rights to use, copy, modify, merge, publish,
++   distribute, sublicense, and/or sell copies of the Software, and to
++   permit persons to whom the Software is furnished to do so, subject to
++   the following conditions:
++
++   The above copyright notice and this permission notice shall be included
++   in all copies or substantial portions of the Software.
++
++   THE SOFTWARE IS PROVIDED ``AS IS'', WITHOUT WARRANTY OF ANY KIND, EXPRESS
++   OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++   IN NO EVENT SHALL RENESAS TECHNOLOGY BE LIABLE FOR ANY CLAIM, DAMAGES OR
++   OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
++   ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
++   OTHER DEALINGS IN THE SOFTWARE.
++   ----------------------------------------------------------------------- */
++
++#include <ffi.h>
++#include <ffi_common.h>
++
++#include <stdlib.h>
++#include <stdint.h>
++
++#include <sys/cachectl.h>
++
++/* for little endian ARC, the code is in fact stored as mixed endian for
++   performance reasons */
++#if __BIG_ENDIAN__
++#define CODE_ENDIAN(x) (x)
++#else
++#define CODE_ENDIAN(x) ( (((uint32_t) (x)) << 16) | (((uint32_t) (x)) >> 16))
++#endif
++
++/* ffi_prep_args is called by the assembly routine once stack
++   space has been allocated for the function's arguments.  */
++
++void
++ffi_prep_args (char *stack, extended_cif * ecif)
++{
++  unsigned int i;
++  int tmp;
++  void **p_argv;
++  char *argp;
++  ffi_type **p_arg;
++
++  tmp = 0;
++  argp = stack;
++
++  if (ecif->cif->rtype->type == FFI_TYPE_STRUCT)
++    {
++      *(void **) argp = ecif->rvalue;
++      argp += 4;
++    }
++
++  p_argv = ecif->avalue;
++
++  for (i = ecif->cif->nargs, p_arg = ecif->cif->arg_types;
++       (i != 0); i--, p_arg++)
++    {
++      size_t z;
++      int alignment;
++
++      /* align alignment to 4 */
++      alignment = (((*p_arg)->alignment - 1) | 3) + 1;
++
++      /* Align if necessary.  */
++      if ((alignment - 1) & (unsigned) argp)
++	argp = (char *) ALIGN (argp, alignment);
++
++      z = (*p_arg)->size;
++      if (z < sizeof (int))
++	{
++	  z = sizeof (int);
++
++	  switch ((*p_arg)->type)
++	    {
++	    case FFI_TYPE_SINT8:
++	      *(signed int *) argp = (signed int) *(SINT8 *) (*p_argv);
++	      break;
++
++	    case FFI_TYPE_UINT8:
++	      *(unsigned int *) argp = (unsigned int) *(UINT8 *) (*p_argv);
++	      break;
++
++	    case FFI_TYPE_SINT16:
++	      *(signed int *) argp = (signed int) *(SINT16 *) (*p_argv);
++	      break;
++
++	    case FFI_TYPE_UINT16:
++	      *(unsigned int *) argp = (unsigned int) *(UINT16 *) (*p_argv);
++	      break;
++
++	    case FFI_TYPE_STRUCT:
++	      memcpy (argp, *p_argv, (*p_arg)->size);
++	      break;
++
++	    default:
++	      FFI_ASSERT (0);
++	    }
++	}
++      else if (z == sizeof (int))
++	{
++	  *(unsigned int *) argp = (unsigned int) *(UINT32 *) (*p_argv);
++	}
++      else
++	{
++	  if ((*p_arg)->type == FFI_TYPE_STRUCT)
++	    {
++	      memcpy (argp, *p_argv, z);
++	    }
++	  else
++	    {
++	      /* Double or long long 64bit.  */
++	      memcpy (argp, *p_argv, z);
++	    }
++	}
++      p_argv++;
++      argp += z;
++    }
++
++  return;
++}
++
++/* Perform machine dependent cif processing.  */
++ffi_status
++ffi_prep_cif_machdep (ffi_cif * cif)
++{
++  /* Set the return type flag.  */
++  switch (cif->rtype->type)
++    {
++    case FFI_TYPE_VOID:
++      cif->flags = (unsigned) cif->rtype->type;
++      break;
++
++    case FFI_TYPE_STRUCT:
++      cif->flags = (unsigned) cif->rtype->type;
++      break;
++
++    case FFI_TYPE_SINT64:
++    case FFI_TYPE_UINT64:
++    case FFI_TYPE_DOUBLE:
++      cif->flags = FFI_TYPE_DOUBLE;
++      break;
++
++    case FFI_TYPE_FLOAT:
++    default:
++      cif->flags = FFI_TYPE_INT;
++      break;
++    }
++
++  return FFI_OK;
++}
++
++extern void ffi_call_ARCompact (void (*)(char *, extended_cif *),
++				extended_cif *, unsigned, unsigned,
++				unsigned *, void (*fn) (void));
++
++void
++ffi_call (ffi_cif * cif, void (*fn) (void), void *rvalue, void **avalue)
++{
++  extended_cif ecif;
++
++  ecif.cif = cif;
++  ecif.avalue = avalue;
++
++  /* If the return value is a struct and we don't have
++     a return value address then we need to make one.  */
++  if ((rvalue == NULL) && (cif->rtype->type == FFI_TYPE_STRUCT))
++    {
++      ecif.rvalue = alloca (cif->rtype->size);
++    }
++  else
++    ecif.rvalue = rvalue;
++
++  switch (cif->abi)
++    {
++    case FFI_ARCOMPACT:
++      ffi_call_ARCompact (ffi_prep_args, &ecif, cif->bytes,
++			  cif->flags, ecif.rvalue, fn);
++      break;
++
++    default:
++      FFI_ASSERT (0);
++      break;
++    }
++}
++
++int
++ffi_closure_inner_ARCompact (ffi_closure * closure, void *rvalue,
++			     ffi_arg * args)
++{
++  void **arg_area, **p_argv;
++  ffi_cif *cif = closure->cif;
++  char *argp = (char *) args;
++  ffi_type **p_argt;
++  int i;
++
++  arg_area = (void **) alloca (cif->nargs * sizeof (void *));
++
++  /* handle hidden argument */
++  if (cif->flags == FFI_TYPE_STRUCT)
++    {
++      rvalue = *(void **) argp;
++      argp += 4;
++    }
++
++  p_argv = arg_area;
++
++  for (i = 0, p_argt = cif->arg_types; i < cif->nargs;
++       i++, p_argt++, p_argv++)
++    {
++      size_t z;
++      int alignment;
++
++      /* align alignment to 4 */
++      alignment = (((*p_argt)->alignment - 1) | 3) + 1;
++
++      /* Align if necessary.  */
++      if ((alignment - 1) & (unsigned) argp)
++	argp = (char *) ALIGN (argp, alignment);
++
++      z = (*p_argt)->size;
++      *p_argv = (void *) argp;
++      argp += z;
++    }
++
++  (closure->fun) (cif, rvalue, arg_area, closure->user_data);
++
++  return cif->flags;
++}
++
++extern void ffi_closure_ARCompact (void);
++
++ffi_status
++ffi_prep_closure_loc (ffi_closure * closure, ffi_cif * cif,
++		      void (*fun) (ffi_cif *, void *, void **, void *),
++		      void *user_data, void *codeloc)
++{
++  uint32_t *tramp = (uint32_t *) & (closure->tramp[0]);
++
++  switch (cif->abi)
++    {
++    case FFI_ARCOMPACT:
++      FFI_ASSERT (tramp == codeloc);
++      tramp[0] = CODE_ENDIAN (0x200a1fc0);	/* mov r8, pcl  */
++      tramp[1] = CODE_ENDIAN (0x20200f80);	/* j [long imm] */
++      tramp[2] = CODE_ENDIAN (ffi_closure_ARCompact);
++      break;
++
++    default:
++      return FFI_BAD_ABI;
++    }
++
++  closure->cif = cif;
++  closure->fun = fun;
++  closure->user_data = user_data;
++  cacheflush (codeloc, FFI_TRAMPOLINE_SIZE, BCACHE);
++
++  return FFI_OK;
++}
+diff --git a/src/arc/ffitarget.h b/src/arc/ffitarget.h
+new file mode 100644
+index 0000000..bf8311b
+--- /dev/null
++++ b/src/arc/ffitarget.h
+@@ -0,0 +1,53 @@
++/* -----------------------------------------------------------------------
++   ffitarget.h - Copyright (c) 2012  Anthony Green
++                 Copyright (c) 2013  Synopsys, Inc. (www.synopsys.com)
++   Target configuration macros for ARC.
++
++   Permission is hereby granted, free of charge, to any person obtaining
++   a copy of this software and associated documentation files (the
++   ``Software''), to deal in the Software without restriction, including
++   without limitation the rights to use, copy, modify, merge, publish,
++   distribute, sublicense, and/or sell copies of the Software, and to
++   permit persons to whom the Software is furnished to do so, subject to
++   the following conditions:
++
++   The above copyright notice and this permission notice shall be included
++   in all copies or substantial portions of the Software.
++
++   THE SOFTWARE IS PROVIDED ``AS IS'', WITHOUT WARRANTY OF ANY KIND, EXPRESS
++   OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++   IN NO EVENT SHALL RENESAS TECHNOLOGY BE LIABLE FOR ANY CLAIM, DAMAGES OR
++   OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
++   ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
++   OTHER DEALINGS IN THE SOFTWARE.
++
++   ----------------------------------------------------------------------- */
++
++#ifndef LIBFFI_TARGET_H
++#define LIBFFI_TARGET_H
++
++#ifndef LIBFFI_H
++#error "Please do not include ffitarget.h directly into your source.  Use ffi.h instead."
++#endif
++
++/* ---- Generic type definitions ----------------------------------------- */
++
++#ifndef LIBFFI_ASM
++typedef unsigned long ffi_arg;
++typedef signed long ffi_sarg;
++
++typedef enum ffi_abi
++{
++  FFI_FIRST_ABI = 0,
++  FFI_ARCOMPACT,
++  FFI_LAST_ABI,
++  FFI_DEFAULT_ABI = FFI_ARCOMPACT
++} ffi_abi;
++#endif
++
++#define FFI_CLOSURES 		1
++#define FFI_TRAMPOLINE_SIZE	12
++#define FFI_NATIVE_RAW_API 	0
++
++#endif
+-- 
+1.9.0
+
diff --git a/package/libffi/libffi-arc-02-Rebuild-for-ARC-additions.patch b/package/libffi/libffi-arc-02-Rebuild-for-ARC-additions.patch
new file mode 100644
index 0000000..a8b1dec
--- /dev/null
+++ b/package/libffi/libffi-arc-02-Rebuild-for-ARC-additions.patch
@@ -0,0 +1,262 @@
+From 234414f2c9d32e9fd94d15f94871837210dbab04 Mon Sep 17 00:00:00 2001
+From: Anthony Green <green@moxielogic.com>
+Date: Tue, 2 Jul 2013 15:54:40 -0400
+Subject: [PATCH 2/3] Rebuild for ARC additions
+
+---
+ Makefile.in | 96 +++++++++++++++++++++++++++++++++++++------------------------
+ configure   | 18 ++++++++++++
+ 2 files changed, 76 insertions(+), 38 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 4b6abe5..be425d8 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -72,20 +72,21 @@ target_triplet = @target@
+ @POWERPC_DARWIN_TRUE at am__append_18 = src/powerpc/ffi_darwin.c src/powerpc/darwin.S src/powerpc/darwin_closure.S
+ @POWERPC_FREEBSD_TRUE at am__append_19 = src/powerpc/ffi.c src/powerpc/sysv.S src/powerpc/ppc_closure.S
+ @AARCH64_TRUE at am__append_20 = src/aarch64/sysv.S src/aarch64/ffi.c
+- at ARM_TRUE@am__append_21 = src/arm/sysv.S src/arm/ffi.c
+- at ARM_TRUE@@FFI_EXEC_TRAMPOLINE_TABLE_TRUE at am__append_22 = src/arm/trampoline.S
+- at AVR32_TRUE@am__append_23 = src/avr32/sysv.S src/avr32/ffi.c
+- at LIBFFI_CRIS_TRUE@am__append_24 = src/cris/sysv.S src/cris/ffi.c
+- at FRV_TRUE@am__append_25 = src/frv/eabi.S src/frv/ffi.c
+- at S390_TRUE@am__append_26 = src/s390/sysv.S src/s390/ffi.c
+- at X86_64_TRUE@am__append_27 = src/x86/ffi64.c src/x86/unix64.S src/x86/ffi.c src/x86/sysv.S
+- at SH_TRUE@am__append_28 = src/sh/sysv.S src/sh/ffi.c
+- at SH64_TRUE@am__append_29 = src/sh64/sysv.S src/sh64/ffi.c
+- at PA_LINUX_TRUE@am__append_30 = src/pa/linux.S src/pa/ffi.c
+- at PA_HPUX_TRUE@am__append_31 = src/pa/hpux32.S src/pa/ffi.c
+- at TILE_TRUE@am__append_32 = src/tile/tile.S src/tile/ffi.c
+- at XTENSA_TRUE@am__append_33 = src/xtensa/sysv.S src/xtensa/ffi.c
+- at METAG_TRUE@am__append_34 = src/metag/sysv.S src/metag/ffi.c
++ at ARC_TRUE@am__append_21 = src/arc/sysv.S src/arc/ffi.c
++ at ARM_TRUE@am__append_22 = src/arm/sysv.S src/arm/ffi.c
++ at ARM_TRUE@@FFI_EXEC_TRAMPOLINE_TABLE_TRUE at am__append_23 = src/arm/trampoline.S
++ at AVR32_TRUE@am__append_24 = src/avr32/sysv.S src/avr32/ffi.c
++ at LIBFFI_CRIS_TRUE@am__append_25 = src/cris/sysv.S src/cris/ffi.c
++ at FRV_TRUE@am__append_26 = src/frv/eabi.S src/frv/ffi.c
++ at S390_TRUE@am__append_27 = src/s390/sysv.S src/s390/ffi.c
++ at X86_64_TRUE@am__append_28 = src/x86/ffi64.c src/x86/unix64.S src/x86/ffi.c src/x86/sysv.S
++ at SH_TRUE@am__append_29 = src/sh/sysv.S src/sh/ffi.c
++ at SH64_TRUE@am__append_30 = src/sh64/sysv.S src/sh64/ffi.c
++ at PA_LINUX_TRUE@am__append_31 = src/pa/linux.S src/pa/ffi.c
++ at PA_HPUX_TRUE@am__append_32 = src/pa/hpux32.S src/pa/ffi.c
++ at TILE_TRUE@am__append_33 = src/tile/tile.S src/tile/ffi.c
++ at XTENSA_TRUE@am__append_34 = src/xtensa/sysv.S src/xtensa/ffi.c
++ at METAG_TRUE@am__append_35 = src/metag/sysv.S src/metag/ffi.c
+ subdir = .
+ DIST_COMMON = README $(am__configure_deps) $(srcdir)/Makefile.am \
+ 	$(srcdir)/Makefile.in $(srcdir)/doc/stamp-vti \
+@@ -183,21 +184,22 @@ am_libffi_la_OBJECTS = src/prep_cif.lo src/types.lo src/raw_api.lo \
+ @POWERPC_FREEBSD_TRUE@	src/powerpc/sysv.lo \
+ @POWERPC_FREEBSD_TRUE@	src/powerpc/ppc_closure.lo
+ @AARCH64_TRUE at am__objects_20 = src/aarch64/sysv.lo src/aarch64/ffi.lo
+- at ARM_TRUE@am__objects_21 = src/arm/sysv.lo src/arm/ffi.lo
+- at ARM_TRUE@@FFI_EXEC_TRAMPOLINE_TABLE_TRUE at am__objects_22 = src/arm/trampoline.lo
+- at AVR32_TRUE@am__objects_23 = src/avr32/sysv.lo src/avr32/ffi.lo
+- at LIBFFI_CRIS_TRUE@am__objects_24 = src/cris/sysv.lo src/cris/ffi.lo
+- at FRV_TRUE@am__objects_25 = src/frv/eabi.lo src/frv/ffi.lo
+- at S390_TRUE@am__objects_26 = src/s390/sysv.lo src/s390/ffi.lo
+- at X86_64_TRUE@am__objects_27 = src/x86/ffi64.lo src/x86/unix64.lo \
++ at ARC_TRUE@am__objects_21 = src/arc/sysv.lo src/arc/ffi.lo
++ at ARM_TRUE@am__objects_22 = src/arm/sysv.lo src/arm/ffi.lo
++ at ARM_TRUE@@FFI_EXEC_TRAMPOLINE_TABLE_TRUE at am__objects_23 = src/arm/trampoline.lo
++ at AVR32_TRUE@am__objects_24 = src/avr32/sysv.lo src/avr32/ffi.lo
++ at LIBFFI_CRIS_TRUE@am__objects_25 = src/cris/sysv.lo src/cris/ffi.lo
++ at FRV_TRUE@am__objects_26 = src/frv/eabi.lo src/frv/ffi.lo
++ at S390_TRUE@am__objects_27 = src/s390/sysv.lo src/s390/ffi.lo
++ at X86_64_TRUE@am__objects_28 = src/x86/ffi64.lo src/x86/unix64.lo \
+ @X86_64_TRUE@	src/x86/ffi.lo src/x86/sysv.lo
+- at SH_TRUE@am__objects_28 = src/sh/sysv.lo src/sh/ffi.lo
+- at SH64_TRUE@am__objects_29 = src/sh64/sysv.lo src/sh64/ffi.lo
+- at PA_LINUX_TRUE@am__objects_30 = src/pa/linux.lo src/pa/ffi.lo
+- at PA_HPUX_TRUE@am__objects_31 = src/pa/hpux32.lo src/pa/ffi.lo
+- at TILE_TRUE@am__objects_32 = src/tile/tile.lo src/tile/ffi.lo
+- at XTENSA_TRUE@am__objects_33 = src/xtensa/sysv.lo src/xtensa/ffi.lo
+- at METAG_TRUE@am__objects_34 = src/metag/sysv.lo src/metag/ffi.lo
++ at SH_TRUE@am__objects_29 = src/sh/sysv.lo src/sh/ffi.lo
++ at SH64_TRUE@am__objects_30 = src/sh64/sysv.lo src/sh64/ffi.lo
++ at PA_LINUX_TRUE@am__objects_31 = src/pa/linux.lo src/pa/ffi.lo
++ at PA_HPUX_TRUE@am__objects_32 = src/pa/hpux32.lo src/pa/ffi.lo
++ at TILE_TRUE@am__objects_33 = src/tile/tile.lo src/tile/ffi.lo
++ at XTENSA_TRUE@am__objects_34 = src/xtensa/sysv.lo src/xtensa/ffi.lo
++ at METAG_TRUE@am__objects_35 = src/metag/sysv.lo src/metag/ffi.lo
+ nodist_libffi_la_OBJECTS = $(am__objects_1) $(am__objects_2) \
+ 	$(am__objects_3) $(am__objects_4) $(am__objects_5) \
+ 	$(am__objects_6) $(am__objects_7) $(am__objects_8) \
+@@ -209,17 +211,17 @@ nodist_libffi_la_OBJECTS = $(am__objects_1) $(am__objects_2) \
+ 	$(am__objects_24) $(am__objects_25) $(am__objects_26) \
+ 	$(am__objects_27) $(am__objects_28) $(am__objects_29) \
+ 	$(am__objects_30) $(am__objects_31) $(am__objects_32) \
+-	$(am__objects_33) $(am__objects_34)
++	$(am__objects_33) $(am__objects_34) $(am__objects_35)
+ libffi_la_OBJECTS = $(am_libffi_la_OBJECTS) \
+ 	$(nodist_libffi_la_OBJECTS)
+ libffi_la_LINK = $(LIBTOOL) --tag=CC $(AM_LIBTOOLFLAGS) \
+ 	$(LIBTOOLFLAGS) --mode=link $(CCLD) $(AM_CFLAGS) $(CFLAGS) \
+ 	$(libffi_la_LDFLAGS) $(LDFLAGS) -o $@
+ libffi_convenience_la_LIBADD =
+-am__objects_35 = src/prep_cif.lo src/types.lo src/raw_api.lo \
++am__objects_36 = src/prep_cif.lo src/types.lo src/raw_api.lo \
+ 	src/java_raw_api.lo src/closures.lo
+-am_libffi_convenience_la_OBJECTS = $(am__objects_35)
+-am__objects_36 = $(am__objects_1) $(am__objects_2) $(am__objects_3) \
++am_libffi_convenience_la_OBJECTS = $(am__objects_36)
++am__objects_37 = $(am__objects_1) $(am__objects_2) $(am__objects_3) \
+ 	$(am__objects_4) $(am__objects_5) $(am__objects_6) \
+ 	$(am__objects_7) $(am__objects_8) $(am__objects_9) \
+ 	$(am__objects_10) $(am__objects_11) $(am__objects_12) \
+@@ -230,8 +232,8 @@ am__objects_36 = $(am__objects_1) $(am__objects_2) $(am__objects_3) \
+ 	$(am__objects_25) $(am__objects_26) $(am__objects_27) \
+ 	$(am__objects_28) $(am__objects_29) $(am__objects_30) \
+ 	$(am__objects_31) $(am__objects_32) $(am__objects_33) \
+-	$(am__objects_34)
+-nodist_libffi_convenience_la_OBJECTS = $(am__objects_36)
++	$(am__objects_34) $(am__objects_35)
++nodist_libffi_convenience_la_OBJECTS = $(am__objects_37)
+ libffi_convenience_la_OBJECTS = $(am_libffi_convenience_la_OBJECTS) \
+ 	$(nodist_libffi_convenience_la_OBJECTS)
+ DEFAULT_INCLUDES = -I. at am__isrc@
+@@ -471,7 +473,8 @@ SUBDIRS = include testsuite man
+ EXTRA_DIST = LICENSE ChangeLog.v1 ChangeLog.libgcj configure.host	\
+ 	 src/aarch64/ffi.c src/aarch64/ffitarget.h src/aarch64/sysv.S	\
+ 	 build-ios.sh src/alpha/ffi.c src/alpha/osf.S			\
+-	 src/alpha/ffitarget.h src/arm/ffi.c src/arm/sysv.S		\
++	 src/alpha/ffitarget.h src/arc/ffi.c src/arc/arcompact.S	\
++	 src/arc/ffitarget.h src/arm/ffi.c src/arm/sysv.S		\
+ 	 src/arm/ffitarget.h src/avr32/ffi.c src/avr32/sysv.S		\
+ 	 src/avr32/ffitarget.h src/cris/ffi.c src/cris/sysv.S		\
+ 	 src/cris/ffitarget.h src/ia64/ffi.c src/ia64/ffitarget.h	\
+@@ -571,7 +574,7 @@ nodist_libffi_la_SOURCES = $(am__append_1) $(am__append_2) \
+ 	$(am__append_24) $(am__append_25) $(am__append_26) \
+ 	$(am__append_27) $(am__append_28) $(am__append_29) \
+ 	$(am__append_30) $(am__append_31) $(am__append_32) \
+-	$(am__append_33) $(am__append_34)
++	$(am__append_33) $(am__append_34) $(am__append_35)
+ libffi_convenience_la_SOURCES = $(libffi_la_SOURCES)
+ nodist_libffi_convenience_la_SOURCES = $(nodist_libffi_la_SOURCES)
+ LTLDFLAGS = $(shell $(SHELL) $(top_srcdir)/libtool-ldflags $(LDFLAGS))
+@@ -843,6 +846,16 @@ src/aarch64/sysv.lo: src/aarch64/$(am__dirstamp) \
+ 	src/aarch64/$(DEPDIR)/$(am__dirstamp)
+ src/aarch64/ffi.lo: src/aarch64/$(am__dirstamp) \
+ 	src/aarch64/$(DEPDIR)/$(am__dirstamp)
++src/arc/$(am__dirstamp):
++	@$(MKDIR_P) src/arc
++	@: > src/arc/$(am__dirstamp)
++src/arc/$(DEPDIR)/$(am__dirstamp):
++	@$(MKDIR_P) src/arc/$(DEPDIR)
++	@: > src/arc/$(DEPDIR)/$(am__dirstamp)
++src/arc/sysv.lo: src/arc/$(am__dirstamp) \
++	src/arc/$(DEPDIR)/$(am__dirstamp)
++src/arc/ffi.lo: src/arc/$(am__dirstamp) \
++	src/arc/$(DEPDIR)/$(am__dirstamp)
+ src/arm/$(am__dirstamp):
+ 	@$(MKDIR_P) src/arm
+ 	@: > src/arm/$(am__dirstamp)
+@@ -970,6 +983,8 @@ mostlyclean-compile:
+ 	-rm -f src/aarch64/*.lo
+ 	-rm -f src/alpha/*.$(OBJEXT)
+ 	-rm -f src/alpha/*.lo
++	-rm -f src/arc/*.$(OBJEXT)
++	-rm -f src/arc/*.lo
+ 	-rm -f src/arm/*.$(OBJEXT)
+ 	-rm -f src/arm/*.lo
+ 	-rm -f src/avr32/*.$(OBJEXT)
+@@ -1026,6 +1041,8 @@ distclean-compile:
+ @AMDEP_TRUE@@am__include@ @am__quote at src/aarch64/$(DEPDIR)/sysv.Plo at am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote at src/alpha/$(DEPDIR)/ffi.Plo at am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote at src/alpha/$(DEPDIR)/osf.Plo at am__quote@
++ at AMDEP_TRUE@@am__include@ @am__quote at src/arc/$(DEPDIR)/ffi.Plo at am__quote@
++ at AMDEP_TRUE@@am__include@ @am__quote at src/arc/$(DEPDIR)/sysv.Plo at am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote at src/arm/$(DEPDIR)/ffi.Plo at am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote at src/arm/$(DEPDIR)/sysv.Plo at am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote at src/arm/$(DEPDIR)/trampoline.Plo at am__quote@
+@@ -1144,6 +1161,7 @@ clean-libtool:
+ 	-rm -rf src/.libs src/_libs
+ 	-rm -rf src/aarch64/.libs src/aarch64/_libs
+ 	-rm -rf src/alpha/.libs src/alpha/_libs
++	-rm -rf src/arc/.libs src/arc/_libs
+ 	-rm -rf src/arm/.libs src/arm/_libs
+ 	-rm -rf src/avr32/.libs src/avr32/_libs
+ 	-rm -rf src/bfin/.libs src/bfin/_libs
+@@ -1714,6 +1732,8 @@ distclean-generic:
+ 	-rm -f src/aarch64/$(am__dirstamp)
+ 	-rm -f src/alpha/$(DEPDIR)/$(am__dirstamp)
+ 	-rm -f src/alpha/$(am__dirstamp)
++	-rm -f src/arc/$(DEPDIR)/$(am__dirstamp)
++	-rm -f src/arc/$(am__dirstamp)
+ 	-rm -f src/arm/$(DEPDIR)/$(am__dirstamp)
+ 	-rm -f src/arm/$(am__dirstamp)
+ 	-rm -f src/avr32/$(DEPDIR)/$(am__dirstamp)
+@@ -1768,7 +1788,7 @@ clean-am: clean-aminfo clean-generic clean-libtool \
+ 
+ distclean: distclean-recursive
+ 	-rm -f $(am__CONFIG_DISTCLEAN_FILES)
+-	-rm -rf src/$(DEPDIR) src/aarch64/$(DEPDIR) src/alpha/$(DEPDIR) src/arm/$(DEPDIR) src/avr32/$(DEPDIR) src/bfin/$(DEPDIR) src/cris/$(DEPDIR) src/frv/$(DEPDIR) src/ia64/$(DEPDIR) src/m32r/$(DEPDIR) src/m68k/$(DEPDIR) src/metag/$(DEPDIR) src/microblaze/$(DEPDIR) src/mips/$(DEPDIR) src/moxie/$(DEPDIR) src/pa/$(DEPDIR) src/powerpc/$(DEPDIR) src/s390/$(DEPDIR) src/sh/$(DEPDIR) src/sh64/$(DEPDIR) src/sparc/$(DEPDIR) src/tile/$(DEPDIR) src/x86/$(DEPDIR) src/xtensa/$(DEPDIR)
++	-rm -rf src/$(DEPDIR) src/aarch64/$(DEPDIR) src/alpha/$(DEPDIR) src/arc/$(DEPDIR) src/arm/$(DEPDIR) src/avr32/$(DEPDIR) src/bfin/$(DEPDIR) src/cris/$(DEPDIR) src/frv/$(DEPDIR) src/ia64/$(DEPDIR) src/m32r/$(DEPDIR) src/m68k/$(DEPDIR) src/metag/$(DEPDIR) src/microblaze/$(DEPDIR) src/mips/$(DEPDIR) src/moxie/$(DEPDIR) src/pa/$(DEPDIR) src/powerpc/$(DEPDIR) src/s390/$(DEPDIR) src/sh/$(DEPDIR) src/sh64/$(DEPDIR) src/sparc/$(DEPDIR) src/tile/$(DEPDIR) src/x86/$(DEPDIR) src/xtensa/$(DEPDIR)
+ 	-rm -f Makefile
+ distclean-am: clean-am distclean-compile distclean-generic \
+ 	distclean-hdr distclean-libtool distclean-tags
+@@ -1907,7 +1927,7 @@ installcheck-am:
+ maintainer-clean: maintainer-clean-recursive
+ 	-rm -f $(am__CONFIG_DISTCLEAN_FILES)
+ 	-rm -rf $(top_srcdir)/autom4te.cache
+-	-rm -rf src/$(DEPDIR) src/aarch64/$(DEPDIR) src/alpha/$(DEPDIR) src/arm/$(DEPDIR) src/avr32/$(DEPDIR) src/bfin/$(DEPDIR) src/cris/$(DEPDIR) src/frv/$(DEPDIR) src/ia64/$(DEPDIR) src/m32r/$(DEPDIR) src/m68k/$(DEPDIR) src/metag/$(DEPDIR) src/microblaze/$(DEPDIR) src/mips/$(DEPDIR) src/moxie/$(DEPDIR) src/pa/$(DEPDIR) src/powerpc/$(DEPDIR) src/s390/$(DEPDIR) src/sh/$(DEPDIR) src/sh64/$(DEPDIR) src/sparc/$(DEPDIR) src/tile/$(DEPDIR) src/x86/$(DEPDIR) src/xtensa/$(DEPDIR)
++	-rm -rf src/$(DEPDIR) src/aarch64/$(DEPDIR) src/alpha/$(DEPDIR) src/arc/$(DEPDIR) src/arm/$(DEPDIR) src/avr32/$(DEPDIR) src/bfin/$(DEPDIR) src/cris/$(DEPDIR) src/frv/$(DEPDIR) src/ia64/$(DEPDIR) src/m32r/$(DEPDIR) src/m68k/$(DEPDIR) src/metag/$(DEPDIR) src/microblaze/$(DEPDIR) src/mips/$(DEPDIR) src/moxie/$(DEPDIR) src/pa/$(DEPDIR) src/powerpc/$(DEPDIR) src/s390/$(DEPDIR) src/sh/$(DEPDIR) src/sh64/$(DEPDIR) src/sparc/$(DEPDIR) src/tile/$(DEPDIR) src/x86/$(DEPDIR) src/xtensa/$(DEPDIR)
+ 	-rm -f Makefile
+ maintainer-clean-am: distclean-am maintainer-clean-aminfo \
+ 	maintainer-clean-generic maintainer-clean-vti
+diff --git a/configure b/configure
+index 4b04db7..495389d 100755
+--- a/configure
++++ b/configure
+@@ -673,6 +673,8 @@ AVR32_FALSE
+ AVR32_TRUE
+ ARM_FALSE
+ ARM_TRUE
++ARC_FALSE
++ARC_TRUE
+ AARCH64_FALSE
+ AARCH64_TRUE
+ POWERPC_FREEBSD_FALSE
+@@ -13299,6 +13301,10 @@ case "$host" in
+ 	HAVE_LONG_DOUBLE='defined(__LONG_DOUBLE_128__)'
+ 	;;
+ 
++  arc*-*-*)
++	TARGET=ARC; TARGETDIR=arc
++	;;
++
+   arm*-*-*)
+ 	TARGET=ARM; TARGETDIR=arm
+ 	;;
+@@ -13651,6 +13657,14 @@ else
+   AARCH64_FALSE=
+ fi
+ 
++ if test x$TARGET = xARC; then
++  ARC_TRUE=
++  ARC_FALSE='#'
++else
++  ARC_TRUE='#'
++  ARC_FALSE=
++fi
++
+  if test x$TARGET = xARM; then
+   ARM_TRUE=
+   ARM_FALSE='#'
+@@ -15087,6 +15101,10 @@ if test -z "${AARCH64_TRUE}" && test -z "${AARCH64_FALSE}"; then
+   as_fn_error $? "conditional \"AARCH64\" was never defined.
+ Usually this means the macro was only invoked conditionally." "$LINENO" 5
+ fi
++if test -z "${ARC_TRUE}" && test -z "${ARC_FALSE}"; then
++  as_fn_error $? "conditional \"ARC\" was never defined.
++Usually this means the macro was only invoked conditionally." "$LINENO" 5
++fi
+ if test -z "${ARM_TRUE}" && test -z "${ARM_FALSE}"; then
+   as_fn_error $? "conditional \"ARM\" was never defined.
+ Usually this means the macro was only invoked conditionally." "$LINENO" 5
+-- 
+1.9.0
+
diff --git a/package/libffi/libffi-arc-03-arc-Fix-build-error.patch b/package/libffi/libffi-arc-03-arc-Fix-build-error.patch
new file mode 100644
index 0000000..081fc1e
--- /dev/null
+++ b/package/libffi/libffi-arc-03-arc-Fix-build-error.patch
@@ -0,0 +1,43 @@
+From 5a1bbc8511464f073cb2e79d5aa9ea0395139541 Mon Sep 17 00:00:00 2001
+From: Mischa Jonker <mjonker@synopsys.com>
+Date: Mon, 8 Jul 2013 15:51:36 +0200
+Subject: [PATCH 3/3] arc: Fix build error
+
+One part of the patch for ARC support was missing in the upstreamed
+version.
+
+Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
+---
+ Makefile.am | 2 +-
+ Makefile.in | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index b57b2a8..19ead77 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -172,7 +172,7 @@ if AARCH64
+ nodist_libffi_la_SOURCES += src/aarch64/sysv.S src/aarch64/ffi.c
+ endif
+ if ARC
+-nodist_libffi_la_SOURCES += src/arc/sysv.S src/arc/ffi.c
++nodist_libffi_la_SOURCES += src/arc/arcompact.S src/arc/ffi.c
+ endif
+ if ARM
+ nodist_libffi_la_SOURCES += src/arm/sysv.S src/arm/ffi.c
+diff --git a/Makefile.in b/Makefile.in
+index be425d8..44c2551 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -852,7 +852,7 @@ src/arc/$(am__dirstamp):
+ src/arc/$(DEPDIR)/$(am__dirstamp):
+ 	@$(MKDIR_P) src/arc/$(DEPDIR)
+ 	@: > src/arc/$(DEPDIR)/$(am__dirstamp)
+-src/arc/sysv.lo: src/arc/$(am__dirstamp) \
++src/arc/arcompact.lo: src/arc/$(am__dirstamp) \
+ 	src/arc/$(DEPDIR)/$(am__dirstamp)
+ src/arc/ffi.lo: src/arc/$(am__dirstamp) \
+ 	src/arc/$(DEPDIR)/$(am__dirstamp)
+-- 
+1.9.0
+
