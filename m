From: Chris Zankel <chris@zankel.net>
Date: Tue, 22 Jan 2013 12:35:28 -0800
Subject: [Buildroot] [PATCH] xtensa: support Xtensa architecture in libffi
	3.0.11
Message-ID: <50fefab4.c9e7440a.328e.342c@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is a 'backport' of a change to the mainline repository of
LibFFI that added support for the Xtensa architecture to LibFFI.

Signed-off-by: Chris Zankel <chris@zankel.net>
---
 ...ibffi-3.0.11-xtensa-support-from-upstream.patch | 1135 ++++++++++++++++++++
 1 file changed, 1135 insertions(+)
 create mode 100644 package/libffi/libffi-3.0.11-xtensa-support-from-upstream.patch

diff --git a/package/libffi/libffi-3.0.11-xtensa-support-from-upstream.patch b/package/libffi/libffi-3.0.11-xtensa-support-from-upstream.patch
new file mode 100644
index 0000000..d3f9cef
--- /dev/null
+++ b/package/libffi/libffi-3.0.11-xtensa-support-from-upstream.patch
@@ -0,0 +1,1135 @@
+diff -Nurd libffi-3.0.11/ChangeLog libffi-3.0.11-xtensa/ChangeLog
+--- libffi-3.0.11/ChangeLog	2012-04-11 19:47:00.000000000 -0700
++++ libffi-3.0.11-xtensa/ChangeLog	2013-01-21 13:15:05.066514825 -0800
+@@ -1,3 +1,16 @@
+++2013-01-21  Chris Zankel   <chris@zankel.net>
++
++	* README: Add Xtensa support.
++	* Makefile.am: Likewise.
++	* configure.ac: Likewise.
++	* Makefile.in Regenerate.
++	* configure: Likewise.
++	* src/prep_cif.c: Handle Xtensa.
++	* src/xtensa: New directory.
++	* src/xtensa/ffi.c: New file.
++	* src/xtensa/ffitarget.h: Ditto.
++	* src/xtensa/sysv.S: Ditto.
++
+ 2012-04-11  Anthony Green  <green@moxielogic.com>
+ 
+ 	* Makefile.am (EXTRA_DIST): Add new script.
+diff -Nurd libffi-3.0.11/configure.ac libffi-3.0.11-xtensa/configure.ac
+--- libffi-3.0.11/configure.ac	2012-04-11 20:10:51.000000000 -0700
++++ libffi-3.0.11-xtensa/configure.ac	2013-01-21 13:19:34.650521452 -0800
+@@ -203,6 +203,11 @@
+   x86_64-*-*)
+ 	TARGET=X86_64; TARGETDIR=x86
+ 	;;
++
++  xtensa*-*)
++	TARGET=XTENSA; TARGETDIR=xtensa
++	;;
++
+ esac
+ 
+ AC_SUBST(AM_RUNTESTFLAGS)
+@@ -239,6 +244,7 @@
+ AM_CONDITIONAL(PA_LINUX, test x$TARGET = xPA_LINUX)
+ AM_CONDITIONAL(PA_HPUX, test x$TARGET = xPA_HPUX)
+ AM_CONDITIONAL(PA64_HPUX, test x$TARGET = xPA64_HPUX)
++AM_CONDITIONAL(XTENSA, test x$TARGET = xXTENSA)
+ 
+ AC_HEADER_STDC
+ AC_CHECK_FUNCS(memcpy)
+diff -Nurd libffi-3.0.11/Makefile.am libffi-3.0.11-xtensa/Makefile.am
+--- libffi-3.0.11/Makefile.am	2012-04-11 19:46:40.000000000 -0700
++++ libffi-3.0.11-xtensa/Makefile.am	2013-01-21 13:13:32.602512557 -0800
+@@ -29,6 +29,7 @@
+ 	src/pa/ffi.c src/pa/linux.S src/pa/hpux32.S src/frv/ffi.c \
+ 	src/frv/eabi.S src/frv/ffitarget.h src/dlmalloc.c \
+ 	src/moxie/ffi.c src/moxie/eabi.S libtool-version \
++	src/xtensa/ffitarget.h src/xtensa/ffi.c src/xtensa/sysv.S \
+ 	ChangeLog.libffi m4/libtool.m4 m4/lt~obsolete.m4 \
+ 	m4/ltoptions.m4 m4/ltsugar.m4 m4/ltversion.m4 \
+ 	m4/ltversion.m4 src/arm/gentramp.sh src/debug.c \
+@@ -193,6 +194,9 @@
+ # MSVC, it can link against the debug CRT.
+ AM_CFLAGS += -DFFI_DEBUG
+ endif
++if XTENSA
++nodist_libffi_la_SOURCES += src/xtensa/sysv.S src/xtensa/ffi.c
++endif
+ 
+ libffi_la_LDFLAGS = -version-info `grep -v '^\#' $(srcdir)/libtool-version` $(LTLDFLAGS) $(AM_LTLDFLAGS)
+ 
+diff -Nurd libffi-3.0.11/README libffi-3.0.11-xtensa/README
+--- libffi-3.0.11/README	2012-04-11 20:15:42.000000000 -0700
++++ libffi-3.0.11-xtensa/README	2013-01-21 13:14:37.362514147 -0800
+@@ -90,6 +90,7 @@
+ | X86-64       | Linux/x32        |
+ | X86-64       | OpenBSD          |
+ | X86-64       | Windows/MingW    |
++| Xtensa       | Linux            |
+ |--------------+------------------|
+ 
+ Please send additional platform test results to
+@@ -335,6 +336,7 @@
+ sparc		Anthony Green, Gordon Irlam
+ x86		Anthony Green, Jon Beniston
+ x86-64		Bo Thorsen
++xtensa		Chris Zankel
+ 
+ Jesper Skov and Andrew Haley both did more than their fair share of
+ stepping through the code and tracking down bugs.
+diff -Nurd libffi-3.0.11/src/prep_cif.c libffi-3.0.11-xtensa/src/prep_cif.c
+--- libffi-3.0.11/src/prep_cif.c	2012-04-11 19:46:06.000000000 -0700
++++ libffi-3.0.11-xtensa/src/prep_cif.c	2013-01-21 13:12:37.218511194 -0800
+@@ -140,6 +140,10 @@
+ #ifdef SPARC
+       && (cif->abi != FFI_V9 || cif->rtype->size > 32)
+ #endif
++#ifdef XTENSA
++      && (cif->rtype->size > 16)
++#endif
++
+      )
+     bytes = STACK_ARG_SIZE(sizeof(void*));
+ #endif
+@@ -181,6 +185,10 @@
+   if (isvariadic)
+ 	return ffi_prep_cif_machdep_var(cif, nfixedargs, ntotalargs);
+ #endif
++#ifdef XTENSA
++	  if (bytes <= 6*4 && bytes + STACK_ARG_SIZE((*ptr)->size) > 6*4)
++	    bytes = 6*4;
++#endif
+ 
+   return ffi_prep_cif_machdep(cif);
+ }
+diff -Nurd libffi-3.0.11/src/prep_cif.c.orig libffi-3.0.11-xtensa/src/prep_cif.c.orig
+--- libffi-3.0.11/src/prep_cif.c.orig	1969-12-31 16:00:00.000000000 -0800
++++ libffi-3.0.11-xtensa/src/prep_cif.c.orig	2012-04-11 19:46:06.000000000 -0700
+@@ -0,0 +1,216 @@
++/* -----------------------------------------------------------------------
++   prep_cif.c - Copyright (c) 2011, 2012  Anthony Green
++                Copyright (c) 1996, 1998, 2007  Red Hat, Inc.
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
++   THE SOFTWARE IS PROVIDED ``AS IS'', WITHOUT WARRANTY OF ANY KIND,
++   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
++   NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
++   HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
++   WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
++   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
++   DEALINGS IN THE SOFTWARE.
++   ----------------------------------------------------------------------- */
++
++#include <ffi.h>
++#include <ffi_common.h>
++#include <stdlib.h>
++
++/* Round up to FFI_SIZEOF_ARG. */
++
++#define STACK_ARG_SIZE(x) ALIGN(x, FFI_SIZEOF_ARG)
++
++/* Perform machine independent initialization of aggregate type
++   specifications. */
++
++static ffi_status initialize_aggregate(ffi_type *arg)
++{
++  ffi_type **ptr;
++
++  if (UNLIKELY(arg == NULL || arg->elements == NULL))
++    return FFI_BAD_TYPEDEF;
++
++  arg->size = 0;
++  arg->alignment = 0;
++
++  ptr = &(arg->elements[0]);
++
++  if (UNLIKELY(ptr == 0))
++    return FFI_BAD_TYPEDEF;
++
++  while ((*ptr) != NULL)
++    {
++      if (UNLIKELY(((*ptr)->size == 0)
++		    && (initialize_aggregate((*ptr)) != FFI_OK)))
++	return FFI_BAD_TYPEDEF;
++
++      /* Perform a sanity check on the argument type */
++      FFI_ASSERT_VALID_TYPE(*ptr);
++
++      arg->size = ALIGN(arg->size, (*ptr)->alignment);
++      arg->size += (*ptr)->size;
++
++      arg->alignment = (arg->alignment > (*ptr)->alignment) ?
++	arg->alignment : (*ptr)->alignment;
++
++      ptr++;
++    }
++
++  /* Structure size includes tail padding.  This is important for
++     structures that fit in one register on ABIs like the PowerPC64
++     Linux ABI that right justify small structs in a register.
++     It's also needed for nested structure layout, for example
++     struct A { long a; char b; }; struct B { struct A x; char y; };
++     should find y at an offset of 2*sizeof(long) and result in a
++     total size of 3*sizeof(long).  */
++  arg->size = ALIGN (arg->size, arg->alignment);
++
++  if (arg->size == 0)
++    return FFI_BAD_TYPEDEF;
++  else
++    return FFI_OK;
++}
++
++#ifndef __CRIS__
++/* The CRIS ABI specifies structure elements to have byte
++   alignment only, so it completely overrides this functions,
++   which assumes "natural" alignment and padding.  */
++
++/* Perform machine independent ffi_cif preparation, then call
++   machine dependent routine. */
++
++/* For non variadic functions isvariadic should be 0 and
++   nfixedargs==ntotalargs.
++
++   For variadic calls, isvariadic should be 1 and nfixedargs
++   and ntotalargs set as appropriate. nfixedargs must always be >=1 */
++
++
++ffi_status FFI_HIDDEN ffi_prep_cif_core(ffi_cif *cif, ffi_abi abi,
++			     unsigned int isvariadic,
++                             unsigned int nfixedargs,
++                             unsigned int ntotalargs,
++			     ffi_type *rtype, ffi_type **atypes)
++{
++  unsigned bytes = 0;
++  unsigned int i;
++  ffi_type **ptr;
++
++  FFI_ASSERT(cif != NULL);
++  FFI_ASSERT((!isvariadic) || (nfixedargs >= 1));
++  FFI_ASSERT(nfixedargs <= ntotalargs);
++
++#ifndef X86_WIN32
++  if (! (abi > FFI_FIRST_ABI && abi < FFI_LAST_ABI))
++    return FFI_BAD_ABI;
++#else
++  if (! (abi > FFI_FIRST_ABI && abi < FFI_LAST_ABI || abi == FFI_THISCALL))
++    return FFI_BAD_ABI;
++#endif
++
++  cif->abi = abi;
++  cif->arg_types = atypes;
++  cif->nargs = ntotalargs;
++  cif->rtype = rtype;
++
++  cif->flags = 0;
++
++  /* Initialize the return type if necessary */
++  if ((cif->rtype->size == 0) && (initialize_aggregate(cif->rtype) != FFI_OK))
++    return FFI_BAD_TYPEDEF;
++
++  /* Perform a sanity check on the return type */
++  FFI_ASSERT_VALID_TYPE(cif->rtype);
++
++  /* x86, x86-64 and s390 stack space allocation is handled in prep_machdep. */
++#if !defined M68K && !defined X86_ANY && !defined S390 && !defined PA
++  /* Make space for the return structure pointer */
++  if (cif->rtype->type == FFI_TYPE_STRUCT
++#ifdef SPARC
++      && (cif->abi != FFI_V9 || cif->rtype->size > 32)
++#endif
++     )
++    bytes = STACK_ARG_SIZE(sizeof(void*));
++#endif
++
++  for (ptr = cif->arg_types, i = cif->nargs; i > 0; i--, ptr++)
++    {
++
++      /* Initialize any uninitialized aggregate type definitions */
++      if (((*ptr)->size == 0) && (initialize_aggregate((*ptr)) != FFI_OK))
++	return FFI_BAD_TYPEDEF;
++
++      /* Perform a sanity check on the argument type, do this
++	 check after the initialization.  */
++      FFI_ASSERT_VALID_TYPE(*ptr);
++
++#if !defined X86_ANY && !defined S390 && !defined PA
++#ifdef SPARC
++      if (((*ptr)->type == FFI_TYPE_STRUCT
++	   && ((*ptr)->size > 16 || cif->abi != FFI_V9))
++	  || ((*ptr)->type == FFI_TYPE_LONGDOUBLE
++	      && cif->abi != FFI_V9))
++	bytes += sizeof(void*);
++      else
++#endif
++	{
++	  /* Add any padding if necessary */
++	  if (((*ptr)->alignment - 1) & bytes)
++	    bytes = ALIGN(bytes, (*ptr)->alignment);
++
++	  bytes += STACK_ARG_SIZE((*ptr)->size);
++	}
++#endif
++    }
++
++  cif->bytes = bytes;
++
++  /* Perform machine dependent cif processing */
++#ifdef FFI_TARGET_SPECIFIC_VARIADIC
++  if (isvariadic)
++	return ffi_prep_cif_machdep_var(cif, nfixedargs, ntotalargs);
++#endif
++
++  return ffi_prep_cif_machdep(cif);
++}
++#endif /* not __CRIS__ */
++
++ffi_status ffi_prep_cif(ffi_cif *cif, ffi_abi abi, unsigned int nargs,
++			     ffi_type *rtype, ffi_type **atypes)
++{
++  return ffi_prep_cif_core(cif, abi, 0, nargs, nargs, rtype, atypes);
++}
++
++ffi_status ffi_prep_cif_var(ffi_cif *cif,
++                            ffi_abi abi,
++                            unsigned int nfixedargs,
++                            unsigned int ntotalargs,
++                            ffi_type *rtype,
++                            ffi_type **atypes)
++{
++  return ffi_prep_cif_core(cif, abi, 1, nfixedargs, ntotalargs, rtype, atypes);
++}
++
++#if FFI_CLOSURES
++
++ffi_status
++ffi_prep_closure (ffi_closure* closure,
++		  ffi_cif* cif,
++		  void (*fun)(ffi_cif*,void*,void**,void*),
++		  void *user_data)
++{
++  return ffi_prep_closure_loc (closure, cif, fun, user_data, closure);
++}
++
++#endif
+diff -Nurd libffi-3.0.11/src/xtensa/ffi.c libffi-3.0.11-xtensa/src/xtensa/ffi.c
+--- libffi-3.0.11/src/xtensa/ffi.c	1969-12-31 16:00:00.000000000 -0800
++++ libffi-3.0.11-xtensa/src/xtensa/ffi.c	2013-01-21 13:12:37.218511194 -0800
+@@ -0,0 +1,298 @@
++/* -----------------------------------------------------------------------
++   ffi.c - Copyright (c) 2013 Tensilica, Inc.
++
++   XTENSA Foreign Function Interface
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
++   THE SOFTWARE IS PROVIDED ``AS IS'', WITHOUT WARRANTY OF ANY KIND,
++   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
++   NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
++   HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
++   WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
++   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
++   DEALINGS IN THE SOFTWARE.
++   ----------------------------------------------------------------------- */
++
++#include <ffi.h>
++#include <ffi_common.h>
++
++/*
++                                 |----------------------------------------|
++                                 |                                        |
++    on entry to ffi_call ---->   |----------------------------------------|
++                                 | caller stack frame for registers a0-a3 |
++                                 |----------------------------------------|
++                                 |                                        |
++                                 |         additional arguments           |
++    entry of the function --->   |----------------------------------------|
++                                 |    copy of function arguments a2-a7    |
++                                 | -  -  -  -  -  -  -  -  -  -  -  -  -  |
++                                 |                                        |
++
++    The area below the entry line becomes the new stack frame for the function.
++
++*/
++
++
++#define FFI_TYPE_STRUCT_REGS FFI_TYPE_LAST
++
++
++extern void ffi_call_SYSV(void *rvalue, unsigned rsize, unsigned flags,
++			  void(*fn)(void), unsigned nbytes, extended_cif*);
++extern void ffi_closure_SYSV(void) FFI_HIDDEN;
++
++ffi_status ffi_prep_cif_machdep(ffi_cif *cif)
++{
++  switch(cif->rtype->type) {
++    case FFI_TYPE_SINT8:
++    case FFI_TYPE_UINT8:
++    case FFI_TYPE_SINT16:
++    case FFI_TYPE_UINT16:
++      cif->flags = cif->rtype->type;
++      break;
++    case FFI_TYPE_VOID:
++    case FFI_TYPE_FLOAT:
++      cif->flags = FFI_TYPE_UINT32;
++      break;
++    case FFI_TYPE_DOUBLE:
++    case FFI_TYPE_UINT64:
++    case FFI_TYPE_SINT64:
++      cif->flags = FFI_TYPE_UINT64; // cif->rtype->type;
++      break;
++    case FFI_TYPE_STRUCT:
++      cif->flags = FFI_TYPE_STRUCT; //_REGS;
++      /* Up to 16 bytes are returned in registers */
++      if (cif->rtype->size > 4 * 4) {
++        /* returned structure is referenced by a register; use 8 bytes
++           (including 4 bytes for potential additional alignment) */
++        cif->flags = FFI_TYPE_STRUCT;	
++        cif->bytes += 8;
++      }
++      break;
++
++    default:
++      cif->flags = FFI_TYPE_UINT32;
++      break;
++  }
++
++  /* Round the stack up to a full 4 register frame, just in case
++     (we use this size in movsp). This way, it's also a  multiple of
++     8 bytes for 64-bit arguments.  */
++  cif->bytes = ALIGN(cif->bytes, 16);
++
++  return FFI_OK;
++}
++
++void ffi_prep_args(extended_cif *ecif, unsigned char* stack)
++{
++  unsigned int i;
++  unsigned long *addr;
++  ffi_type **ptr;
++
++  union {
++    void **v;
++    char **c;
++    signed char **sc;
++    unsigned char **uc;
++    signed short **ss;
++    unsigned short **us;
++    unsigned int **i;
++    long long **ll;
++    float **f;
++    double **d;
++  } p_argv;
++
++  /* Verify that everything is aligned up properly */
++  FFI_ASSERT (((unsigned long) stack & 0x7) == 0);
++
++  p_argv.v = ecif->avalue;
++  addr = (unsigned long*)stack;
++
++  /* structures with a size greater than 16 bytes are passed in memory */
++  if (ecif->cif->rtype->type == FFI_TYPE_STRUCT && ecif->cif->rtype->size > 16)
++  {
++    *addr++ = (unsigned long)ecif->rvalue;
++  }
++
++  for (i = ecif->cif->nargs, ptr = ecif->cif->arg_types;
++       i > 0;
++       i--, ptr++, p_argv.v++)
++  {
++    switch ((*ptr)->type)
++    {
++      case FFI_TYPE_SINT8:
++        *addr++ = **p_argv.sc;
++        break;
++      case FFI_TYPE_UINT8:
++        *addr++ = **p_argv.uc;
++        break;
++      case FFI_TYPE_SINT16:
++        *addr++ = **p_argv.ss;
++        break;
++      case FFI_TYPE_UINT16:
++        *addr++ = **p_argv.us;
++        break;
++      case FFI_TYPE_FLOAT:
++      case FFI_TYPE_INT:
++      case FFI_TYPE_UINT32:
++      case FFI_TYPE_SINT32:
++      case FFI_TYPE_POINTER:
++        *addr++ = **p_argv.i;
++        break;
++      case FFI_TYPE_DOUBLE:
++      case FFI_TYPE_UINT64:
++      case FFI_TYPE_SINT64:
++        if (((unsigned long)addr & 4) != 0)
++          addr++;
++        *(unsigned long long*)addr = **p_argv.ll;
++	addr += sizeof(unsigned long long) / sizeof (addr);
++        break;
++
++      case FFI_TYPE_STRUCT:
++      {
++        unsigned long offs;
++        unsigned long size;
++
++        if (((unsigned long)addr & 4) != 0 && (*ptr)->alignment > 4)
++          addr++;
++
++        offs = (unsigned long) addr - (unsigned long) stack;
++        size = (*ptr)->size;
++
++        /* Entire structure must fit the argument registers or referenced */
++        if (offs < FFI_REGISTER_NARGS * 4
++            && offs + size > FFI_REGISTER_NARGS * 4)
++          addr = (unsigned long*) (stack + FFI_REGISTER_NARGS * 4);
++
++        memcpy((char*) addr, *p_argv.c, size);
++        addr += (size + 3) / 4;
++        break;
++      }
++
++      default:
++        FFI_ASSERT(0);
++    }
++  }
++}
++
++
++void ffi_call(ffi_cif* cif, void(*fn)(void), void *rvalue, void **avalue)
++{
++  extended_cif ecif;
++  unsigned long rsize = cif->rtype->size;
++  int flags = cif->flags;
++  void *alloc = NULL;
++
++  ecif.cif = cif;
++  ecif.avalue = avalue;
++
++  /* Note that for structures that are returned in registers (size <= 16 bytes)
++     we allocate a temporary buffer and use memcpy to copy it to the final 
++     destination. The reason is that the target address might be misaligned or
++     the length not a multiple of 4 bytes. Handling all those cases would be
++     very complex.  */
++
++  if (flags == FFI_TYPE_STRUCT && (rsize <= 16 || rvalue == NULL))
++  {
++    alloc = alloca(ALIGN(rsize, 4));
++    ecif.rvalue = alloc;
++  }
++  else
++  {
++    ecif.rvalue = rvalue;
++  }
++
++  if (cif->abi != FFI_SYSV)
++    FFI_ASSERT(0);
++
++  ffi_call_SYSV (ecif.rvalue, rsize, cif->flags, fn, cif->bytes, &ecif);
++
++  if (alloc != NULL && rvalue != NULL)
++    memcpy(rvalue, alloc, rsize);
++}
++
++extern void ffi_trampoline();
++extern void ffi_cacheflush(void* start, void* end);
++
++ffi_status
++ffi_prep_closure_loc (ffi_closure* closure,
++                      ffi_cif* cif,
++                      void (*fun)(ffi_cif*, void*, void**, void*),
++                      void *user_data,
++                      void *codeloc)
++{
++  /* copye trampoline to stack and patch 'ffi_closure_SYSV' pointer */
++  memcpy(closure->tramp, ffi_trampoline, FFI_TRAMPOLINE_SIZE);
++  *(unsigned int*)(&closure->tramp[8]) = (unsigned int)ffi_closure_SYSV;
++
++  // Do we have this function?
++  // __builtin___clear_cache(closer->tramp, closer->tramp + FFI_TRAMPOLINE_SIZE)
++  ffi_cacheflush(closure->tramp, closure->tramp + FFI_TRAMPOLINE_SIZE);
++
++  closure->cif = cif;
++  closure->fun = fun;
++  closure->user_data = user_data;
++  return FFI_OK; 
++}
++
++
++long FFI_HIDDEN
++ffi_closure_SYSV_inner(ffi_closure *closure, void **values, void *rvalue)
++{
++  ffi_cif *cif;
++  ffi_type **arg_types;
++  void **avalue;
++  int i, areg;
++
++  cif = closure->cif;
++  if (cif->abi != FFI_SYSV)
++    return FFI_BAD_ABI;
++
++  areg = 0;
++
++  int rtype = cif->rtype->type;
++  if (rtype == FFI_TYPE_STRUCT && cif->rtype->size > 4 * 4)
++  {
++    rvalue = *values;
++    areg++;
++  }
++
++  cif = closure->cif; 
++  arg_types = cif->arg_types;
++  avalue = alloca(cif->nargs * sizeof(void *));
++
++  for (i = 0; i < cif->nargs; i++)
++  {
++    if (arg_types[i]->alignment == 8 && (areg & 1) != 0)
++      areg++;
++
++    // skip the entry 16,a1 framework, add 16 bytes (4 registers)
++    if (areg == FFI_REGISTER_NARGS)
++      areg += 4;
++
++    if (arg_types[i]->type == FFI_TYPE_STRUCT)
++    {
++      int numregs = ((arg_types[i]->size + 3) & ~3) / 4;
++      if (areg < FFI_REGISTER_NARGS && areg + numregs > FFI_REGISTER_NARGS)
++        areg = FFI_REGISTER_NARGS + 4;
++    }
++
++    avalue[i] = &values[areg];
++    areg += (arg_types[i]->size + 3) / 4;
++  }
++
++  (closure->fun)(cif, rvalue, avalue, closure->user_data);
++
++  return rtype;
++}
+diff -Nurd libffi-3.0.11/src/xtensa/ffitarget.h libffi-3.0.11-xtensa/src/xtensa/ffitarget.h
+--- libffi-3.0.11/src/xtensa/ffitarget.h	1969-12-31 16:00:00.000000000 -0800
++++ libffi-3.0.11-xtensa/src/xtensa/ffitarget.h	2013-01-21 13:12:37.218511194 -0800
+@@ -0,0 +1,53 @@
++/* -----------------------------------------------------------------*-C-*-
++   ffitarget.h - Copyright (c) 2013 Tensilica, Inc.
++   Target configuration macros for XTENSA.
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
++   THE SOFTWARE IS PROVIDED ``AS IS'', WITHOUT WARRANTY OF ANY KIND,
++   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
++   NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
++   HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
++   WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
++   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
++   DEALINGS IN THE SOFTWARE.
++   ----------------------------------------------------------------------- */
++
++#ifndef LIBFFI_TARGET_H
++#define LIBFFI_TARGET_H
++
++#ifndef LIBFFI_H
++#error "Please do not include ffitarget.h directly into your source.  Use ffi.h instead."
++#endif
++
++#ifndef LIBFFI_ASM
++typedef unsigned long	ffi_arg;
++typedef signed long	ffi_sarg;
++
++typedef enum ffi_abi {
++  FFI_FIRST_ABI = 0,
++  FFI_SYSV,
++  FFI_LAST_ABI,
++  FFI_DEFAULT_ABI = FFI_SYSV
++} ffi_abi;
++#endif
++
++#define FFI_REGISTER_NARGS	6
++
++/* ---- Definitions for closures ----------------------------------------- */
++
++#define FFI_CLOSURES 1
++#define FFI_NATIVE_RAW_API 0
++#define FFI_TRAMPOLINE_SIZE 24
++
++#endif
+diff -Nurd libffi-3.0.11/src/xtensa/sysv.S libffi-3.0.11-xtensa/src/xtensa/sysv.S
+--- libffi-3.0.11/src/xtensa/sysv.S	1969-12-31 16:00:00.000000000 -0800
++++ libffi-3.0.11-xtensa/src/xtensa/sysv.S	2013-01-21 13:12:37.218511194 -0800
+@@ -0,0 +1,253 @@
++/* -----------------------------------------------------------------------
++   sysv.S - Copyright (c) 2013 Tensilica, Inc.
++   
++   XTENSA Foreign Function Interface 
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
++   THE SOFTWARE IS PROVIDED ``AS IS'', WITHOUT WARRANTY OF ANY KIND,
++   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
++   NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
++   HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
++   WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
++   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
++   DEALINGS IN THE SOFTWARE.
++   ----------------------------------------------------------------------- */
++
++#define LIBFFI_ASM
++#include <fficonfig.h>
++#include <ffi.h>
++
++#define ENTRY(name) .text; .globl name; .type  name, at function; .align 4; name:
++#define END(name) .size name , . - name
++
++/* Assert that the table below is in sync with ffi.h.  */
++
++#if	   FFI_TYPE_UINT8 != 5          \
++        || FFI_TYPE_SINT8 != 6          \
++        || FFI_TYPE_UINT16 != 7         \
++        || FFI_TYPE_SINT16 != 8         \
++        || FFI_TYPE_UINT32 != 9         \
++        || FFI_TYPE_SINT32 != 10        \
++        || FFI_TYPE_UINT64 != 11
++#error "xtensa/sysv.S out of sync with ffi.h"
++#endif
++
++
++/* ffi_call_SYSV (rvalue, rbytes, flags, (*fnaddr)(), bytes, ecif)
++      void *rvalue;            a2
++      unsigned long rbytes;    a3
++      unsigned flags;          a4
++      void (*fnaddr)();        a5
++      unsigned long bytes;     a6
++      extended_cif* ecif)      a7
++*/
++
++ENTRY(ffi_call_SYSV)
++
++	entry	a1, 32              # 32 byte frame for using call8 below
++
++	mov	a10, a7             # a10(->arg0): ecif
++	sub	a11, a1, a6         # a11(->arg1): stack pointer
++	mov	a7, a1              # fp
++	movsp	a1, a11             # set new sp = old_sp - bytes
++
++	movi	a8, ffi_prep_args
++	callx8	a8                  # ffi_prep_args(ecif, stack)
++
++	# prepare to move stack pointer back up to 6 arguments
++	# note that 'bytes' is already aligned
++
++	movi	a10, 6*4 
++	sub	a11, a6, a10
++	movgez	a6, a10, a11
++	add	a6, a1, a6
++
++	
++	# we can pass up to 6 arguments in registers
++	# for simplicity, just load 6 arguments
++	# (the stack size is at least 32 bytes, so no risk to cross boundaries)
++
++	l32i	a10, a1, 0
++	l32i	a11, a1, 4
++	l32i	a12, a1, 8
++	l32i	a13, a1, 12
++	l32i	a14, a1, 16
++	l32i	a15, a1, 20
++
++	# move stack pointer
++
++	movsp	a1, a6
++
++	callx8	a5                  # (*fn)(args...)
++
++	# Handle return value(s)
++
++	beqz	a2, .Lexit
++
++	movi	a5, FFI_TYPE_STRUCT
++	bne	a4, a5, .Lstore
++	movi	a5, 16
++	blt	a5, a3, .Lexit
++
++	s32i	a10, a2, 0
++	blti	a3, 5, .Lexit
++	addi	a3, a3, -1
++	s32i	a11, a2, 4
++	blti	a3, 8, .Lexit
++	s32i	a12, a2, 8
++	blti	a3, 12, .Lexit
++	s32i	a13, a2, 12
++
++.Lexit:	retw
++
++.Lstore:
++	addi	a4, a4, -FFI_TYPE_UINT8
++	bgei	a4, 7, .Lexit	# should never happen
++	movi	a6, store_calls
++	add	a4, a4, a4
++	addx4	a6, a4, a6	# store_table + idx * 8
++	jx	a6
++
++	.align	8
++store_calls:
++	# UINT8
++	s8i	a10, a2, 0
++	retw
++
++	# SINT8
++	.align	8
++	s8i	a10, a2, 0
++	retw
++
++	# UINT16
++	.align	8
++	s16i	a10, a2, 0
++	retw
++
++	# SINT16
++	.align	8
++	s16i	a10, a2, 0
++	retw
++
++	# UINT32
++	.align	8
++	s32i	a10, a2, 0
++	retw
++
++	# SINT32
++	.align	8
++	s32i	a10, a2, 0
++	retw
++
++	# UINT64
++	.align	8
++	s32i	a10, a2, 0
++	s32i	a11, a2, 4
++	retw
++
++END(ffi_call_SYSV)
++
++
++/*
++ * void ffi_cacheflush (unsigned long start, unsigned long end)
++ */
++
++#define EXTRA_ARGS_SIZE	24
++
++ENTRY(ffi_cacheflush)
++
++	entry	a1, 16
++
++1:	dhwbi	a2, 0
++	ihi	a2, 0
++	addi	a2, a2, 4
++	blt	a2, a3, 1b
++
++	retw
++
++END(ffi_cacheflush)
++
++/* ffi_trampoline is copied to the stack */
++
++ENTRY(ffi_trampoline)
++
++	entry	a1, 16 + (FFI_REGISTER_NARGS * 4) + (4 * 4)   # [ 0]
++	j	2f                                # [ 3]
++	.align	4                                 # [ 6]
++1:	.long	0                                 # [ 8]
++2:	l32r	a15, 1b                           # [12]
++	_mov 	a14, a0                           # [15]
++	callx0	a15                               # [18]
++                                                  # [21]
++END(ffi_trampoline)
++
++/*
++ * ffi_closure()
++ *
++ * a0:  closure + 21
++ * a14: return address (a0)
++ */
++
++ENTRY(ffi_closure_SYSV)
++
++	/* intentionally omitting entry here */
++
++	# restore return address (a0) and move pointer to closure to a10
++	addi	a10, a0, -21
++	mov	a0, a14
++
++	# allow up to 4 arguments as return values
++	addi	a11, a1, 4 * 4
++
++	# save up to 6 arguments to stack (allocated by entry below)
++	s32i	a2, a11,  0
++	s32i	a3, a11,  4
++	s32i	a4, a11,  8
++	s32i	a5, a11, 12
++	s32i	a6, a11, 16
++	s32i	a7, a11, 20
++
++	movi	a8, ffi_closure_SYSV_inner
++	mov	a12, a1
++	callx8	a8			# .._inner(*closure, **avalue, *rvalue)
++
++	# load up to four return arguments
++	l32i	a2, a1,  0
++	l32i	a3, a1,  4
++	l32i	a4, a1,  8
++	l32i	a5, a1, 12
++
++	# (sign-)extend return value
++	movi	a11, FFI_TYPE_UINT8
++	bne	a10, a11, 1f
++	extui	a2, a2, 0, 8
++	retw
++
++1:	movi	a11, FFI_TYPE_SINT8
++	bne	a10, a11, 1f
++	sext	a2, a2, 7
++	retw
++
++1:	movi	a11, FFI_TYPE_UINT16
++	bne	a10, a11, 1f
++	extui	a2, a2, 0, 16
++	retw
++
++1:	movi	a11, FFI_TYPE_SINT16
++	bne	a10, a11, 1f
++	sext	a2, a2, 15
++
++1:	retw
++
++END(ffi_closure_SYSV)
+diff -Nurd libffi-3.0.11.orig/configure libffi-3.0.11/configure
+--- libffi-3.0.11.orig/configure	2012-04-11 20:13:17.000000000 -0700
++++ libffi-3.0.11/configure	2013-01-21 17:18:22.386873532 -0800
+@@ -627,6 +627,8 @@
+ sys_symbol_underscore
+ HAVE_LONG_DOUBLE
+ ALLOCA
++XTENSA_FALSE
++XTENSA_TRUE
+ PA64_HPUX_FALSE
+ PA64_HPUX_TRUE
+ PA_HPUX_FALSE
+@@ -13278,6 +13280,11 @@
+   x86_64-*-*)
+ 	TARGET=X86_64; TARGETDIR=x86
+ 	;;
++
++  xtensa*-*)
++	TARGET=XTENSA; TARGETDIR=xtensa
++	;;
++
+ esac
+ 
+ 
+@@ -13503,6 +13510,14 @@
+   PA64_HPUX_FALSE=
+ fi
+ 
++ if test x$TARGET = xXTENSA; then
++  XTENSA_TRUE=
++  XTENSA_FALSE='#'
++else
++  XTENSA_TRUE='#'
++  XTENSA_FALSE=
++fi
++
+ 
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking for ANSI C header files" >&5
+ $as_echo_n "checking for ANSI C header files... " >&6; }
+@@ -14843,6 +14858,10 @@
+   as_fn_error $? "conditional \"PA64_HPUX\" was never defined.
+ Usually this means the macro was only invoked conditionally." "$LINENO" 5
+ fi
++if test -z "${XTENSA_TRUE}" && test -z "${XTENSA_FALSE}"; then
++  as_fn_error $? "conditional \"XTENSA\" was never defined.
++Usually this means the macro was only invoked conditionally." "$LINENO" 5
++fi
+ 
+ if test -z "${FFI_EXEC_TRAMPOLINE_TABLE_TRUE}" && test -z "${FFI_EXEC_TRAMPOLINE_TABLE_FALSE}"; then
+   as_fn_error $? "conditional \"FFI_EXEC_TRAMPOLINE_TABLE\" was never defined.
+diff -Nurd libffi-3.0.11.orig/Makefile.in libffi-3.0.11/Makefile.in
+--- libffi-3.0.11.orig/Makefile.in	2012-04-11 19:47:17.000000000 -0700
++++ libffi-3.0.11/Makefile.in	2013-01-21 17:18:56.342874366 -0800
+@@ -67,6 +67,7 @@
+ # Build debug. Define FFI_DEBUG on the commandline so that, when building with
+ # MSVC, it can link against the debug CRT.
+ @FFI_DEBUG_TRUE at am__append_29 = -DFFI_DEBUG
++ at XTENSA_TRUE@am__append_30 = src/xtensa/sysv.S src/xtensa/ffi.c
+ subdir = .
+ DIST_COMMON = README $(am__configure_deps) $(srcdir)/Makefile.am \
+ 	$(srcdir)/Makefile.in $(srcdir)/doc/stamp-vti \
+@@ -164,6 +165,7 @@
+ @SH64_TRUE at am__objects_26 = src/sh64/sysv.lo src/sh64/ffi.lo
+ @PA_LINUX_TRUE at am__objects_27 = src/pa/linux.lo src/pa/ffi.lo
+ @PA_HPUX_TRUE at am__objects_28 = src/pa/hpux32.lo src/pa/ffi.lo
++ at XTENSA_TRUE@am__objects_29 = src/xtensa/sysv.lo src/xtensa/ffi.lo
+ nodist_libffi_la_OBJECTS = $(am__objects_1) $(am__objects_2) \
+ 	$(am__objects_3) $(am__objects_4) $(am__objects_5) \
+ 	$(am__objects_6) $(am__objects_7) $(am__objects_8) \
+@@ -173,17 +175,17 @@
+ 	$(am__objects_18) $(am__objects_19) $(am__objects_20) \
+ 	$(am__objects_21) $(am__objects_22) $(am__objects_23) \
+ 	$(am__objects_24) $(am__objects_25) $(am__objects_26) \
+-	$(am__objects_27) $(am__objects_28)
++	$(am__objects_27) $(am__objects_28) $(am__objects_29)
+ libffi_la_OBJECTS = $(am_libffi_la_OBJECTS) \
+ 	$(nodist_libffi_la_OBJECTS)
+ libffi_la_LINK = $(LIBTOOL) --tag=CC $(AM_LIBTOOLFLAGS) \
+ 	$(LIBTOOLFLAGS) --mode=link $(CCLD) $(AM_CFLAGS) $(CFLAGS) \
+ 	$(libffi_la_LDFLAGS) $(LDFLAGS) -o $@
+ libffi_convenience_la_LIBADD =
+-am__objects_29 = src/prep_cif.lo src/types.lo src/raw_api.lo \
++am__objects_30 = src/prep_cif.lo src/types.lo src/raw_api.lo \
+ 	src/java_raw_api.lo src/closures.lo
+-am_libffi_convenience_la_OBJECTS = $(am__objects_29)
+-am__objects_30 = $(am__objects_1) $(am__objects_2) $(am__objects_3) \
++am_libffi_convenience_la_OBJECTS = $(am__objects_30)
++am__objects_31 = $(am__objects_1) $(am__objects_2) $(am__objects_3) \
+ 	$(am__objects_4) $(am__objects_5) $(am__objects_6) \
+ 	$(am__objects_7) $(am__objects_8) $(am__objects_9) \
+ 	$(am__objects_10) $(am__objects_11) $(am__objects_12) \
+@@ -192,8 +194,8 @@
+ 	$(am__objects_19) $(am__objects_20) $(am__objects_21) \
+ 	$(am__objects_22) $(am__objects_23) $(am__objects_24) \
+ 	$(am__objects_25) $(am__objects_26) $(am__objects_27) \
+-	$(am__objects_28)
+-nodist_libffi_convenience_la_OBJECTS = $(am__objects_30)
++	$(am__objects_28) $(am__objects_29)
++nodist_libffi_convenience_la_OBJECTS = $(am__objects_31)
+ libffi_convenience_la_OBJECTS = $(am_libffi_convenience_la_OBJECTS) \
+ 	$(nodist_libffi_convenience_la_OBJECTS)
+ DEFAULT_INCLUDES = -I. at am__isrc@
+@@ -442,6 +444,7 @@
+ 	src/pa/ffi.c src/pa/linux.S src/pa/hpux32.S src/frv/ffi.c \
+ 	src/frv/eabi.S src/frv/ffitarget.h src/dlmalloc.c \
+ 	src/moxie/ffi.c src/moxie/eabi.S libtool-version \
++	src/xtensa/ffitarget.h src/xtensa/ffi.c src/xtensa/sysv.S \
+ 	ChangeLog.libffi m4/libtool.m4 m4/lt~obsolete.m4 \
+ 	m4/ltoptions.m4 m4/ltsugar.m4 m4/ltversion.m4 \
+ 	m4/ltversion.m4 src/arm/gentramp.sh src/debug.c \
+@@ -508,7 +511,7 @@
+ 	$(am__append_18) $(am__append_19) $(am__append_20) \
+ 	$(am__append_21) $(am__append_22) $(am__append_23) \
+ 	$(am__append_24) $(am__append_25) $(am__append_26) \
+-	$(am__append_27) $(am__append_28)
++	$(am__append_27) $(am__append_28) $(am__append_30)
+ libffi_convenience_la_SOURCES = $(libffi_la_SOURCES)
+ nodist_libffi_convenience_la_SOURCES = $(nodist_libffi_la_SOURCES)
+ AM_CFLAGS = -g $(am__append_29)
+@@ -831,6 +834,16 @@
+ src/pa/ffi.lo: src/pa/$(am__dirstamp) src/pa/$(DEPDIR)/$(am__dirstamp)
+ src/pa/hpux32.lo: src/pa/$(am__dirstamp) \
+ 	src/pa/$(DEPDIR)/$(am__dirstamp)
++src/xtensa/$(am__dirstamp):
++	@$(MKDIR_P) src/xtensa
++	@: > src/xtensa/$(am__dirstamp)
++src/xtensa/$(DEPDIR)/$(am__dirstamp):
++	@$(MKDIR_P) src/xtensa/$(DEPDIR)
++	@: > src/xtensa/$(DEPDIR)/$(am__dirstamp)
++src/xtensa/sysv.lo: src/xtensa/$(am__dirstamp) \
++	src/xtensa/$(DEPDIR)/$(am__dirstamp)
++src/xtensa/ffi.lo: src/xtensa/$(am__dirstamp) \
++	src/xtensa/$(DEPDIR)/$(am__dirstamp)
+ libffi.la: $(libffi_la_OBJECTS) $(libffi_la_DEPENDENCIES) 
+ 	$(libffi_la_LINK) -rpath $(libdir) $(libffi_la_OBJECTS) $(libffi_la_LIBADD) $(LIBS)
+ libffi_convenience.la: $(libffi_convenience_la_OBJECTS) $(libffi_convenience_la_DEPENDENCIES) 
+@@ -956,6 +969,10 @@
+ 	-rm -f src/x86/win32.lo
+ 	-rm -f src/x86/win64.$(OBJEXT)
+ 	-rm -f src/x86/win64.lo
++	-rm -f src/xtensa/ffi.$(OBJEXT)
++	-rm -f src/xtensa/ffi.lo
++	-rm -f src/xtensa/sysv.$(OBJEXT)
++	-rm -f src/xtensa/sysv.lo
+ 
+ distclean-compile:
+ 	-rm -f *.tab.c
+@@ -1019,6 +1036,8 @@
+ @AMDEP_TRUE@@am__include@ @am__quote at src/x86/$(DEPDIR)/unix64.Plo at am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote at src/x86/$(DEPDIR)/win32.Plo at am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote at src/x86/$(DEPDIR)/win64.Plo at am__quote@
++ at AMDEP_TRUE@@am__include@ @am__quote at src/xtensa/$(DEPDIR)/ffi.Plo at am__quote@
++ at AMDEP_TRUE@@am__include@ @am__quote at src/xtensa/$(DEPDIR)/sysv.Plo at am__quote@
+ 
+ .S.o:
+ @am__fastdepCCAS_TRUE@	depbase=`echo $@ | sed 's|[^/]*$$|$(DEPDIR)/&|;s|\.o$$||'`;\
+@@ -1091,6 +1110,7 @@
+ 	-rm -rf src/sh64/.libs src/sh64/_libs
+ 	-rm -rf src/sparc/.libs src/sparc/_libs
+ 	-rm -rf src/x86/.libs src/x86/_libs
++	-rm -rf src/xtensa/.libs src/xtensa/_libs
+ 
+ distclean-libtool:
+ 	-rm -f libtool config.lt
+@@ -1659,6 +1679,8 @@
+ 	-rm -f src/sparc/$(am__dirstamp)
+ 	-rm -f src/x86/$(DEPDIR)/$(am__dirstamp)
+ 	-rm -f src/x86/$(am__dirstamp)
++	-rm -f src/xtensa/$(DEPDIR)/$(am__dirstamp)
++	-rm -f src/xtensa/$(am__dirstamp)
+ 
+ maintainer-clean-generic:
+ 	@echo "This command is intended for maintainers to use"
+@@ -1670,7 +1692,7 @@
+ 
+ distclean: distclean-recursive
+ 	-rm -f $(am__CONFIG_DISTCLEAN_FILES)
+-	-rm -rf src/$(DEPDIR) src/alpha/$(DEPDIR) src/arm/$(DEPDIR) src/avr32/$(DEPDIR) src/cris/$(DEPDIR) src/frv/$(DEPDIR) src/ia64/$(DEPDIR) src/m32r/$(DEPDIR) src/m68k/$(DEPDIR) src/mips/$(DEPDIR) src/moxie/$(DEPDIR) src/pa/$(DEPDIR) src/powerpc/$(DEPDIR) src/s390/$(DEPDIR) src/sh/$(DEPDIR) src/sh64/$(DEPDIR) src/sparc/$(DEPDIR) src/x86/$(DEPDIR)
++	-rm -rf src/$(DEPDIR) src/alpha/$(DEPDIR) src/arm/$(DEPDIR) src/avr32/$(DEPDIR) src/cris/$(DEPDIR) src/frv/$(DEPDIR) src/ia64/$(DEPDIR) src/m32r/$(DEPDIR) src/m68k/$(DEPDIR) src/mips/$(DEPDIR) src/moxie/$(DEPDIR) src/pa/$(DEPDIR) src/powerpc/$(DEPDIR) src/s390/$(DEPDIR) src/sh/$(DEPDIR) src/sh64/$(DEPDIR) src/sparc/$(DEPDIR) src/x86/$(DEPDIR) src/xtensa/$(DEPDIR)
+ 	-rm -f Makefile
+ distclean-am: clean-am distclean-compile distclean-generic \
+ 	distclean-hdr distclean-libtool distclean-tags
+@@ -1790,7 +1812,7 @@
+ maintainer-clean: maintainer-clean-recursive
+ 	-rm -f $(am__CONFIG_DISTCLEAN_FILES)
+ 	-rm -rf $(top_srcdir)/autom4te.cache
+-	-rm -rf src/$(DEPDIR) src/alpha/$(DEPDIR) src/arm/$(DEPDIR) src/avr32/$(DEPDIR) src/cris/$(DEPDIR) src/frv/$(DEPDIR) src/ia64/$(DEPDIR) src/m32r/$(DEPDIR) src/m68k/$(DEPDIR) src/mips/$(DEPDIR) src/moxie/$(DEPDIR) src/pa/$(DEPDIR) src/powerpc/$(DEPDIR) src/s390/$(DEPDIR) src/sh/$(DEPDIR) src/sh64/$(DEPDIR) src/sparc/$(DEPDIR) src/x86/$(DEPDIR)
++	-rm -rf src/$(DEPDIR) src/alpha/$(DEPDIR) src/arm/$(DEPDIR) src/avr32/$(DEPDIR) src/cris/$(DEPDIR) src/frv/$(DEPDIR) src/ia64/$(DEPDIR) src/m32r/$(DEPDIR) src/m68k/$(DEPDIR) src/mips/$(DEPDIR) src/moxie/$(DEPDIR) src/pa/$(DEPDIR) src/powerpc/$(DEPDIR) src/s390/$(DEPDIR) src/sh/$(DEPDIR) src/sh64/$(DEPDIR) src/sparc/$(DEPDIR) src/x86/$(DEPDIR) src/xtensa/$(DEPDIR)
+ 	-rm -f Makefile
+ maintainer-clean-am: distclean-am maintainer-clean-aminfo \
+ 	maintainer-clean-generic maintainer-clean-vti
-- 
1.7.10.4
