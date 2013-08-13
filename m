From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 Aug 2013 14:25:51 -0300
Subject: [Buildroot] [PATCH] elf2flt: upgrade to latest version
Message-ID: <1376414751-3447-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upgrade to the latest uclinux CVS snapshot, gives us blackfin support.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/elf2flt/Config.in.host     |    2 +-
 package/elf2flt/src/Makefile.in    |   77 +-
 package/elf2flt/src/README         |    2 +-
 package/elf2flt/src/compress.c     |  198 ++
 package/elf2flt/src/compress.h     |   44 +
 package/elf2flt/src/config.sub     |    8 +-
 package/elf2flt/src/configure      | 5934 +++++++++++++++++++++++-------------
 package/elf2flt/src/configure.in   |  112 +-
 package/elf2flt/src/elf2flt.c      |  699 ++---
 package/elf2flt/src/elf2flt.ld     |  179 --
 package/elf2flt/src/elf2flt.ld.in  |  210 ++
 package/elf2flt/src/flat.h         |    2 +
 package/elf2flt/src/flthdr.c       |  304 +-
 package/elf2flt/src/ld-elf2flt.c   |  580 ++++
 package/elf2flt/src/ld-elf2flt.in  |   38 +-
 package/elf2flt/src/maketarball.sh |   12 -
 package/elf2flt/src/stubs.c        |  129 +-
 package/elf2flt/src/stubs.h        |   75 +
 18 files changed, 5568 insertions(+), 3037 deletions(-)
 create mode 100644 package/elf2flt/src/compress.c
 create mode 100644 package/elf2flt/src/compress.h
 delete mode 100644 package/elf2flt/src/elf2flt.ld
 create mode 100644 package/elf2flt/src/elf2flt.ld.in
 create mode 100644 package/elf2flt/src/ld-elf2flt.c
 delete mode 100755 package/elf2flt/src/maketarball.sh
 create mode 100644 package/elf2flt/src/stubs.h

diff --git a/package/elf2flt/Config.in.host b/package/elf2flt/Config.in.host
index 31a6c7f..dad48d8 100644
--- a/package/elf2flt/Config.in.host
+++ b/package/elf2flt/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_ELF2FLT
 	bool "Enable elf2flt support?"
-	depends on BR2_arm || BR2_sh || BR2_sparc
+	depends on BR2_arm || BR2_bfin || BR2_sh || BR2_sparc
 	help
 	  uCLinux uses a Binary Flat format commonly known as BFLT. It
 	  is a relatively simple and lightweight executable format
diff --git a/package/elf2flt/src/Makefile.in b/package/elf2flt/src/Makefile.in
index acead9f..81e1afc 100644
--- a/package/elf2flt/src/Makefile.in
+++ b/package/elf2flt/src/Makefile.in
@@ -10,33 +10,41 @@ includedir = @includedir@
 CC = @CC@
 CPU = @target_cpu@
 TARGET = @target_alias@
+SYMBOL_PREFIX = @SYMBOL_PREFIX@
 CFLAGS = @CFLAGS@
-INCLUDES = @bfd_include_dir@ @binutils_include_dir@
-CPPFLAGS = @CPPFLAGS@
+INCLUDES = -I$(srcdir) @bfd_include_dir@ @binutils_include_dir@ @zlib_include_dir@
+CPPFLAGS = @CPPFLAGS@ $(DEFS) $(INCLUDES)
 LDFLAGS = @LDFLAGS@
-LIBS = @LIBS@
+LDLIBS = @LIBS@
 INSTALL = @INSTALL@
-DEFS = @DEFS@ -DTARGET_$(CPU)
+DEFS = @DEFS@ \
+	-DTARGET_$(CPU) \
+	-DTARGET_CPU=\"$(CPU)\" \
+	-DSYMBOL_PREFIX=\"$(SYMBOL_PREFIX)\" \
+	-DBINUTILS_LDSCRIPTDIR=\"@binutils_ldscript_dir@\" \
+	-DTARGET_ALIAS=\"$(TARGET)\" \
+	-DNO_GOT_CHECK=@got_check@ \
+	-DUSE_EMIT_RELOCS=@emit_relocs@ \
+	-DEMIT_CTOR_DTOR=@emit_ctor_dtor@ \
+	-DALWAYS_RELOC_TEXT=@always_reloc_text@
 EXEEXT = @EXEEXT@
 OBJEXT = @OBJEXT@
 
 HOST = @host_alias@
 
 ifneq (,$(findstring mingw32,$(HOST)))
-   LIBS := $(LIBS) -lws2_32
+   LDLIBS += -lws2_32
 endif
 
 # force link order under cygwin to avoid getopts / libiberty clash
 ifneq ($(strip $(shell gcc -v 2>&1 | grep "cygwin")),)
-   LIBS := -lcygwin $(LIBS)
+   LDLIBS := -lcygwin $(LDLIBS)
 endif
 
-CCFLAGS = $(CFLAGS) $(DEFS) $(INCLUDES)
-
 LDFILE= elf2flt.ld
 ifeq ($(strip $(CPU)),e1)
-SRC_LDFILE= $(CPU)-elf2flt.ld
-else
+SRC_LDFILE= $(srcdir)/$(CPU)-elf2flt.ld
+else 
 SRC_LDFILE= elf2flt.ld
 endif
 
@@ -44,20 +52,43 @@ target_bindir = $(prefix)/$(TARGET)/bin
 target_libdir = $(prefix)/$(TARGET)/lib
 
 
-PROG_ELF2FLT = elf2flt$(EXEEXT)
-PROG_FLTHDR = flthdr$(EXEEXT)
-PROGS = $(PROG_ELF2FLT) $(PROG_FLTHDR)
+PROG_ELF2FLT       = elf2flt$(EXEEXT)
+PROG_FLTHDR        = flthdr$(EXEEXT)
+PROG_LD_ELF2FLT_C  = ld-elf2flt$(EXEEXT)
+PROG_LD_ELF2FLT_SH = ld-elf2flt.sh
+
+ifeq (@use_ld_elf2flt_binary@,yes)
+PROG_LD_ELF2FLT    = $(PROG_LD_ELF2FLT_C)
+else
+PROG_LD_ELF2FLT    = $(PROG_LD_ELF2FLT_SH)
+endif
+
+PROGS = $(PROG_ELF2FLT) $(PROG_FLTHDR) $(PROG_LD_ELF2FLT_C) $(PROG_LD_ELF2FLT_SH)
 
 all: $(PROGS)
 
-$(PROG_ELF2FLT): elf2flt.c stubs.c Makefile
-	$(CC) $(CCFLAGS) $(LDFLAGS) -o $@ $(srcdir)/elf2flt.c $(srcdir)/stubs.c $(LIBS)
+# We need to declare the link explicitly because make only provides
+# implicit rules when EXEEXT is set to nothing
+link = $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LDLIBS)
 
-$(PROG_FLTHDR): flthdr.c Makefile
-	$(CC) $(CCFLAGS) $(LDFLAGS) -o $@ $(srcdir)/flthdr.c $(LIBS)
+$(PROG_ELF2FLT): elf2flt.o compress.o stubs.o
+	$(link)
+
+$(PROG_FLTHDR): flthdr.o compress.o stubs.o
+	$(link)
+
+ld-elf2flt$(EXEEXT): ld-elf2flt.o stubs.o
+	$(link)
+
+ld-elf2flt.sh: $(srcdir)/ld-elf2flt.in
+	./config.status $@
+	chmod 755 $@
+
+Makefile: $(srcdir)/Makefile.in
+	./config.status $@
 
 clean:
-	-rm -f $(PROGS) *.$(OBJEXT)
+	-rm -f $(PROGS) *.$(OBJEXT) .deps
 
 distclean: clean
 	-rm -f Makefile config.log config.status config.cache ld-elf2flt
@@ -74,8 +105,10 @@ install:
 		mv $(bindir)/$(TARGET)-ld$(EXEEXT) $(bindir)/$(TARGET)-ld.real$(EXEEXT)
 	[ -f $(target_bindir)/ld.real$(EXEEXT) ] || \
 		mv $(target_bindir)/ld$(EXEEXT) $(target_bindir)/ld.real$(EXEEXT)
-	$(INSTALL) -m 755 ld-elf2flt $(bindir)/$(TARGET)-ld
-	$(INSTALL) -m 755 ld-elf2flt $(target_bindir)/ld
-	$(INSTALL) -m 644 $(srcdir)/$(SRC_LDFILE) $(target_libdir)/$(LDFILE)
-
+	$(INSTALL) -m 755 $(PROG_LD_ELF2FLT) $(bindir)/$(TARGET)-ld$(EXEEXT)
+	$(INSTALL) -m 755 $(PROG_LD_ELF2FLT) $(target_bindir)/ld$(EXEEXT)
+	$(INSTALL) -m 644 $(SRC_LDFILE) $(target_libdir)/$(LDFILE)
 
+sinclude .deps
+.deps:
+	$(CC) -MM $(CPPFLAGS) $(srcdir)/*.c > .deps
diff --git a/package/elf2flt/src/README b/package/elf2flt/src/README
index 6e8a687..592d07a 100644
--- a/package/elf2flt/src/README
+++ b/package/elf2flt/src/README
@@ -11,7 +11,7 @@ LICENSE.TXT for more details.
 
 Elf2flt with PIC, ZFLAT and full reloc support. Currently supported
 targets include: m68k/ColdFire, ARM, Sparc, NEC v850, MicroBlaze, 
-h8300 and SuperH.
+h8300, SuperH, and Blackfin.
 
 COMPILING:
 
diff --git a/package/elf2flt/src/compress.c b/package/elf2flt/src/compress.c
new file mode 100644
index 0000000..144c96f
--- /dev/null
+++ b/package/elf2flt/src/compress.c
@@ -0,0 +1,198 @@
+/*
+ * Helper functions to handle compression via zlib
+ *
+ * Copyright (C) 2007-2008 Julian Brown
+ * Copyright (C) 2008 Mike Frysinger
+ *
+ * Licensed under the GPL-2 or later.
+ */
+
+#include <assert.h>
+#include <stdio.h>
+#include <stdlib.h>
+
+#include <zlib.h>
+#include "compress.h"
+#include "stubs.h"
+
+/* Open an (uncompressed) file as a stream.  Return 0 on success, 1 on
+   error.
+   NOTE: The MODE argument must remain valid for the lifetime of the stream,
+   because it is referred to by reopen_stream_compressed() if it is called.
+   String constants work fine.  */
+
+int
+fopen_stream_u(stream *fp, const char *path, const char *mode)
+{
+	fp->u.filep = fopen(path, mode);
+	fp->type = (fp->u.filep) ? UNCOMPRESSED : INVALID;
+	fp->mode = mode;
+	return (fp->u.filep) ? 0 : 1;
+}
+
+/* Read from stream.  Return number of elements read.  */
+
+size_t
+fread_stream(void *ptr, size_t size, size_t nmemb, stream *str)
+{
+	size_t read;
+
+	switch (str->type) {
+		case UNCOMPRESSED:
+		read = fread(ptr, size, nmemb, str->u.filep);
+		break;
+
+		case COMPRESSED:
+		read = gzread(str->u.gzfilep, ptr, size * nmemb) / size;
+		break;
+
+		default:
+		abort();
+	}
+
+	return read;
+}
+
+/* Write to stream.  Return number of elements written.  */
+
+size_t
+fwrite_stream(const void *ptr, size_t size, size_t nmemb, stream *str)
+{
+	size_t written;
+
+	switch (str->type) {
+		case UNCOMPRESSED:
+		written = fwrite(ptr, size, nmemb, str->u.filep);
+		break;
+
+		case COMPRESSED:
+		written = gzwrite(str->u.gzfilep, ptr, size * nmemb) / size;
+		break;
+
+		default:
+		abort();
+	}
+
+	return written;
+}
+
+/* Close stream.  */
+
+int
+fclose_stream(stream *str)
+{
+	switch (str->type) {
+		case UNCOMPRESSED:
+		return fclose(str->u.filep);
+
+		case COMPRESSED:
+		return gzclose(str->u.gzfilep);
+
+		default:
+		abort();
+	}
+
+	return 0;
+}
+
+int
+ferror_stream(stream *str)
+{
+	switch (str->type) {
+		case UNCOMPRESSED:
+		return ferror(str->u.filep);
+
+		case COMPRESSED:
+		{
+			const char *err;
+			int errno;
+
+			err = gzerror(str->u.gzfilep, &errno);
+			if (errno == Z_OK || errno == Z_STREAM_END)
+				return 0;
+			else if (errno == Z_ERRNO)
+				return 1;
+			else {
+				fprintf(stderr, "%s\n", err);
+				return 1;
+			}
+		}
+		break;
+
+		default:
+		abort();
+	}
+
+	return 0;
+}
+
+int
+fseek_stream(stream *str, long offset, int whence)
+{
+	switch (str->type) {
+		case UNCOMPRESSED:
+		return fseek(str->u.filep, offset, whence);
+
+		case COMPRESSED:
+		return gzseek(str->u.gzfilep, offset, whence);
+
+		default:
+		abort();
+	}
+}
+
+/* Reopen a stream at the current file position.  */
+
+void
+reopen_stream_compressed(stream *str)
+{
+	int fd;
+	long offset, roffset;
+
+	/* Already a compressed stream, return immediately  */
+	if (str->type == COMPRESSED)
+		return;
+
+	if (str->type == INVALID)
+		abort();
+
+	fd = fileno(str->u.filep);
+	/* Get current (buffered) file position.  */
+	offset = ftell(str->u.filep);
+
+	/* Make sure there's nothing left in buffers.  */
+	fflush(str->u.filep);
+
+	/* Reposition underlying FD.  (Might be unnecessary?)  */
+	roffset = lseek(fd, offset, SEEK_SET);
+
+	assert(roffset == offset);
+
+	/* Reopen as compressed stream.  */
+	str->u.gzfilep = gzdopen(fd, str->mode);
+	gzsetparams(str->u.gzfilep, 9, Z_DEFAULT_STRATEGY);
+	str->type = COMPRESSED;
+}
+
+void
+transfer(stream *ifp, stream *ofp, int count)
+{
+	char cmd[1024];
+	int n, num;
+
+	while (count == -1 || count > 0) {
+		if (count == -1 || count > sizeof(cmd))
+			num = sizeof(cmd);
+		else
+			num = count;
+		n = fread_stream(cmd, 1, num, ifp);
+		if (n == 0)
+			break;
+		if (fwrite_stream(cmd, n, 1, ofp) != 1)
+			fatal_perror("Write failed :-(\n");
+		if (count != -1)
+			count -= n;
+	}
+	if (count > 0)
+		fatal("Failed to transfer %d bytes\n", count);
+}
diff --git a/package/elf2flt/src/compress.h b/package/elf2flt/src/compress.h
new file mode 100644
index 0000000..d4b90e1
--- /dev/null
+++ b/package/elf2flt/src/compress.h
@@ -0,0 +1,44 @@
+/*
+ * Helper functions to handle compression via zlib
+ *
+ * Copyright (C) 2007-2008 Julian Brown
+ * Copyright (C) 2008 Mike Frysinger
+ *
+ * Licensed under the GPL-2 or later.
+ */
+
+#ifndef __ELF2FLT_COMPRESS_H__
+#define __ELF2FLT_COMPRESS_H__
+
+#include <zlib.h>
+
+typedef enum
+{
+  INVALID,
+  UNCOMPRESSED,
+  COMPRESSED
+} stream_type;
+
+/* Tagged union holding either a regular FILE* handle or a zlib gzFile
+   handle.  */
+typedef struct
+{
+  stream_type type;
+  const char *mode;
+  union
+    {
+      FILE *filep;
+      gzFile gzfilep;
+    } u;
+} stream;
+
+int fopen_stream_u(stream *fp, const char *path, const char *mode);
+size_t fread_stream(void *ptr, size_t size, size_t nmemb, stream *str);
+size_t fwrite_stream(const void *ptr, size_t size, size_t nmemb, stream *str);
+int fclose_stream(stream *str);
+int ferror_stream(stream *str);
+int fseek_stream(stream *str, long offset, int whence);
+void reopen_stream_compressed(stream *str);
+void transfer(stream *ifp, stream *ofp, int count);
+
+#endif
diff --git a/package/elf2flt/src/config.sub b/package/elf2flt/src/config.sub
index 2072457..4279c84 100755
--- a/package/elf2flt/src/config.sub
+++ b/package/elf2flt/src/config.sub
@@ -262,7 +262,7 @@ case $basic_machine in
 	| pdp10 | pdp11 | pj | pjl \
 	| powerpc | powerpc64 | powerpc64le | powerpcle | ppcbe \
 	| pyramid \
-	| sh | sh[1234] | sh[24]a | sh[24]aeb | sh[23]e | sh[34]eb | sheb | shbe | shle | sh[1234]le | sh3ele \
+	| sh | sh[1234] | sh[23]e | sh[34]eb | shbe | shle | sh[1234]le | sh3ele \
 	| sh64 | sh64le \
 	| sparc | sparc64 | sparc64b | sparc86x | sparclet | sparclite \
 	| sparcv8 | sparcv9 | sparcv9b \
@@ -342,8 +342,8 @@ case $basic_machine in
 	| powerpc-* | powerpc64-* | powerpc64le-* | powerpcle-* | ppcbe-* \
 	| pyramid-* \
 	| romp-* | rs6000-* \
-	| sh-* | sh[1234]-* | sh[24]a-* | sh[24]aeb-* | sh[23]e-* | sh[34]eb-* \
-	| sheb-* | shbe-* | shle-* | sh[1234]le-* | sh3ele-* | sh64-* | sh64le-* \
+	| sh-* | sh[1234]-* | sh[23]e-* | sh[34]eb-* | shbe-* \
+	| shle-* | sh[1234]le-* | sh3ele-* | sh64-* | sh64le-* \
 	| sparc-* | sparc64-* | sparc64b-* | sparc86x-* | sparclet-* \
 	| sparclite-* \
 	| sparcv8-* | sparcv9-* | sparcv9b-* | strongarm-* | sv1-* | sx?-* \
@@ -1097,7 +1097,7 @@ case $basic_machine in
 	we32k)
 		basic_machine=we32k-att
 		;;
-	sh | sh[1234] | sh[24]a | sh[24]aeb | sh[23]e | sh[34]eb | sheb | shbe | shle | sh[1234]le | sh3ele)
+	sh3 | sh4 | sh[34]eb | sh[1234]le | sh[23]ele)
 		basic_machine=sh-unknown
 		;;
 	sh64)
diff --git a/package/elf2flt/src/configure b/package/elf2flt/src/configure
index d672662..2dcbc48 100755
--- a/package/elf2flt/src/configure
+++ b/package/elf2flt/src/configure
@@ -1,25 +1,82 @@
 #! /bin/sh
 # Guess values for system-dependent variables and create Makefiles.
-# Generated by GNU Autoconf 2.59.
+# Generated by GNU Autoconf 2.63.
 #
-# Copyright (C) 2003 Free Software Foundation, Inc.
+# Copyright (C) 1992, 1993, 1994, 1995, 1996, 1998, 1999, 2000, 2001,
+# 2002, 2003, 2004, 2005, 2006, 2007, 2008 Free Software Foundation, Inc.
 # This configure script is free software; the Free Software Foundation
 # gives unlimited permission to copy, distribute and modify it.
 ## --------------------- ##
 ## M4sh Initialization.  ##
 ## --------------------- ##
 
-# Be Bourne compatible
+# Be more Bourne compatible
+DUALCASE=1; export DUALCASE # for MKS sh
 if test -n "${ZSH_VERSION+set}" && (emulate sh) >/dev/null 2>&1; then
   emulate sh
   NULLCMD=:
-  # Zsh 3.x and 4.x performs word splitting on ${1+"$@"}, which
+  # Pre-4.2 versions of Zsh do word splitting on ${1+"$@"}, which
   # is contrary to our usage.  Disable this feature.
   alias -g '${1+"$@"}'='"$@"'
-elif test -n "${BASH_VERSION+set}" && (set -o posix) >/dev/null 2>&1; then
-  set -o posix
+  setopt NO_GLOB_SUBST
+else
+  case `(set -o) 2>/dev/null` in
+  *posix*) set -o posix ;;
+esac
+
+fi
+
+
+
+
+# PATH needs CR
+# Avoid depending upon Character Ranges.
+as_cr_letters='abcdefghijklmnopqrstuvwxyz'
+as_cr_LETTERS='ABCDEFGHIJKLMNOPQRSTUVWXYZ'
+as_cr_Letters=$as_cr_letters$as_cr_LETTERS
+as_cr_digits='0123456789'
+as_cr_alnum=$as_cr_Letters$as_cr_digits
+
+as_nl='
+'
+export as_nl
+# Printing a long string crashes Solaris 7 /usr/bin/printf.
+as_echo='\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'
+as_echo=$as_echo$as_echo$as_echo$as_echo$as_echo
+as_echo=$as_echo$as_echo$as_echo$as_echo$as_echo$as_echo
+if (test "X`printf %s $as_echo`" = "X$as_echo") 2>/dev/null; then
+  as_echo='printf %s\n'
+  as_echo_n='printf %s'
+else
+  if test "X`(/usr/ucb/echo -n -n $as_echo) 2>/dev/null`" = "X-n $as_echo"; then
+    as_echo_body='eval /usr/ucb/echo -n "$1$as_nl"'
+    as_echo_n='/usr/ucb/echo -n'
+  else
+    as_echo_body='eval expr "X$1" : "X\\(.*\\)"'
+    as_echo_n_body='eval
+      arg=$1;
+      case $arg in
+      *"$as_nl"*)
+	expr "X$arg" : "X\\(.*\\)$as_nl";
+	arg=`expr "X$arg" : ".*$as_nl\\(.*\\)"`;;
+      esac;
+      expr "X$arg" : "X\\(.*\\)" | tr -d "$as_nl"
+    '
+    export as_echo_n_body
+    as_echo_n='sh -c $as_echo_n_body as_echo'
+  fi
+  export as_echo_body
+  as_echo='sh -c $as_echo_body as_echo'
+fi
+
+# The user is always right.
+if test "${PATH_SEPARATOR+set}" != set; then
+  PATH_SEPARATOR=:
+  (PATH='/bin;/bin'; FPATH=$PATH; sh -c :) >/dev/null 2>&1 && {
+    (PATH='/bin:/bin'; FPATH=$PATH; sh -c :) >/dev/null 2>&1 ||
+      PATH_SEPARATOR=';'
+  }
 fi
-DUALCASE=1; export DUALCASE # for MKS sh
 
 # Support unset when possible.
 if ( (MAIL=60; unset MAIL) || exit) >/dev/null 2>&1; then
@@ -29,33 +86,60 @@ else
 fi
 
 
+# IFS
+# We need space, tab and new line, in precisely that order.  Quoting is
+# there to prevent editors from complaining about space-tab.
+# (If _AS_PATH_WALK were called with IFS unset, it would disable word
+# splitting by setting IFS to empty value.)
+IFS=" ""	$as_nl"
+
+# Find who we are.  Look in the path if we contain no directory separator.
+case $0 in
+  *[\\/]* ) as_myself=$0 ;;
+  *) as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
+for as_dir in $PATH
+do
+  IFS=$as_save_IFS
+  test -z "$as_dir" && as_dir=.
+  test -r "$as_dir/$0" && as_myself=$as_dir/$0 && break
+done
+IFS=$as_save_IFS
+
+     ;;
+esac
+# We did not find ourselves, most probably we were run as `sh COMMAND'
+# in which case we are not to be found in the path.
+if test "x$as_myself" = x; then
+  as_myself=$0
+fi
+if test ! -f "$as_myself"; then
+  $as_echo "$as_myself: error: cannot find myself; rerun with an absolute file name" >&2
+  { (exit 1); exit 1; }
+fi
+
 # Work around bugs in pre-3.0 UWIN ksh.
-$as_unset ENV MAIL MAILPATH
+for as_var in ENV MAIL MAILPATH
+do ($as_unset $as_var) >/dev/null 2>&1 && $as_unset $as_var
+done
 PS1='$ '
 PS2='> '
 PS4='+ '
 
 # NLS nuisances.
-for as_var in \
-  LANG LANGUAGE LC_ADDRESS LC_ALL LC_COLLATE LC_CTYPE LC_IDENTIFICATION \
-  LC_MEASUREMENT LC_MESSAGES LC_MONETARY LC_NAME LC_NUMERIC LC_PAPER \
-  LC_TELEPHONE LC_TIME
-do
-  if (set +x; test -z "`(eval $as_var=C; export $as_var) 2>&1`"); then
-    eval $as_var=C; export $as_var
-  else
-    $as_unset $as_var
-  fi
-done
+LC_ALL=C
+export LC_ALL
+LANGUAGE=C
+export LANGUAGE
 
 # Required to use basename.
-if expr a : '\(a\)' >/dev/null 2>&1; then
+if expr a : '\(a\)' >/dev/null 2>&1 &&
+   test "X`expr 00001 : '.*\(...\)'`" = X001; then
   as_expr=expr
 else
   as_expr=false
 fi
 
-if (basename /) >/dev/null 2>&1 && test "X`basename / 2>&1`" = "X/"; then
+if (basename -- /) >/dev/null 2>&1 && test "X`basename -- / 2>&1`" = "X/"; then
   as_basename=basename
 else
   as_basename=false
@@ -63,157 +147,391 @@ fi
 
 
 # Name of the executable.
-as_me=`$as_basename "$0" ||
+as_me=`$as_basename -- "$0" ||
 $as_expr X/"$0" : '.*/\([^/][^/]*\)/*$' \| \
 	 X"$0" : 'X\(//\)$' \| \
-	 X"$0" : 'X\(/\)$' \| \
-	 .     : '\(.\)' 2>/dev/null ||
-echo X/"$0" |
-    sed '/^.*\/\([^/][^/]*\)\/*$/{ s//\1/; q; }
-  	  /^X\/\(\/\/\)$/{ s//\1/; q; }
-  	  /^X\/\(\/\).*/{ s//\1/; q; }
-  	  s/.*/./; q'`
+	 X"$0" : 'X\(/\)' \| . 2>/dev/null ||
+$as_echo X/"$0" |
+    sed '/^.*\/\([^/][^/]*\)\/*$/{
+	    s//\1/
+	    q
+	  }
+	  /^X\/\(\/\/\)$/{
+	    s//\1/
+	    q
+	  }
+	  /^X\/\(\/\).*/{
+	    s//\1/
+	    q
+	  }
+	  s/.*/./; q'`
 
+# CDPATH.
+$as_unset CDPATH
 
-# PATH needs CR, and LINENO needs CR and PATH.
-# Avoid depending upon Character Ranges.
-as_cr_letters='abcdefghijklmnopqrstuvwxyz'
-as_cr_LETTERS='ABCDEFGHIJKLMNOPQRSTUVWXYZ'
-as_cr_Letters=$as_cr_letters$as_cr_LETTERS
-as_cr_digits='0123456789'
-as_cr_alnum=$as_cr_Letters$as_cr_digits
 
-# The user is always right.
-if test "${PATH_SEPARATOR+set}" != set; then
-  echo "#! /bin/sh" >conf$$.sh
-  echo  "exit 0"   >>conf$$.sh
-  chmod +x conf$$.sh
-  if (PATH="/nonexistent;."; conf$$.sh) >/dev/null 2>&1; then
-    PATH_SEPARATOR=';'
-  else
-    PATH_SEPARATOR=:
-  fi
-  rm -f conf$$.sh
+if test "x$CONFIG_SHELL" = x; then
+  if (eval ":") 2>/dev/null; then
+  as_have_required=yes
+else
+  as_have_required=no
 fi
 
+  if test $as_have_required = yes &&	 (eval ":
+(as_func_return () {
+  (exit \$1)
+}
+as_func_success () {
+  as_func_return 0
+}
+as_func_failure () {
+  as_func_return 1
+}
+as_func_ret_success () {
+  return 0
+}
+as_func_ret_failure () {
+  return 1
+}
 
-  as_lineno_1=$LINENO
-  as_lineno_2=$LINENO
-  as_lineno_3=`(expr $as_lineno_1 + 1) 2>/dev/null`
-  test "x$as_lineno_1" != "x$as_lineno_2" &&
-  test "x$as_lineno_3"  = "x$as_lineno_2"  || {
-  # Find who we are.  Look in the path if we contain no path at all
-  # relative or not.
-  case $0 in
-    *[\\/]* ) as_myself=$0 ;;
-    *) as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
-for as_dir in $PATH
-do
-  IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
-  test -r "$as_dir/$0" && as_myself=$as_dir/$0 && break
-done
+exitcode=0
+if as_func_success; then
+  :
+else
+  exitcode=1
+  echo as_func_success failed.
+fi
 
-       ;;
-  esac
-  # We did not find ourselves, most probably we were run as `sh COMMAND'
-  # in which case we are not to be found in the path.
-  if test "x$as_myself" = x; then
-    as_myself=$0
-  fi
-  if test ! -f "$as_myself"; then
-    { echo "$as_me: error: cannot find myself; rerun with an absolute path" >&2
-   { (exit 1); exit 1; }; }
-  fi
-  case $CONFIG_SHELL in
-  '')
+if as_func_failure; then
+  exitcode=1
+  echo as_func_failure succeeded.
+fi
+
+if as_func_ret_success; then
+  :
+else
+  exitcode=1
+  echo as_func_ret_success failed.
+fi
+
+if as_func_ret_failure; then
+  exitcode=1
+  echo as_func_ret_failure succeeded.
+fi
+
+if ( set x; as_func_ret_success y && test x = \"\$1\" ); then
+  :
+else
+  exitcode=1
+  echo positional parameters were not saved.
+fi
+
+test \$exitcode = 0) || { (exit 1); exit 1; }
+
+(
+  as_lineno_1=\$LINENO
+  as_lineno_2=\$LINENO
+  test \"x\$as_lineno_1\" != \"x\$as_lineno_2\" &&
+  test \"x\`expr \$as_lineno_1 + 1\`\" = \"x\$as_lineno_2\") || { (exit 1); exit 1; }
+") 2> /dev/null; then
+  :
+else
+  as_candidate_shells=
     as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in /bin$PATH_SEPARATOR/usr/bin$PATH_SEPARATOR$PATH
 do
   IFS=$as_save_IFS
   test -z "$as_dir" && as_dir=.
-  for as_base in sh bash ksh sh5; do
-	 case $as_dir in
+  case $as_dir in
 	 /*)
-	   if ("$as_dir/$as_base" -c '
+	   for as_base in sh bash ksh sh5; do
+	     as_candidate_shells="$as_candidate_shells $as_dir/$as_base"
+	   done;;
+       esac
+done
+IFS=$as_save_IFS
+
+
+      for as_shell in $as_candidate_shells $SHELL; do
+	 # Try only shells that exist, to save several forks.
+	 if { test -f "$as_shell" || test -f "$as_shell.exe"; } &&
+		{ ("$as_shell") 2> /dev/null <<\_ASEOF
+if test -n "${ZSH_VERSION+set}" && (emulate sh) >/dev/null 2>&1; then
+  emulate sh
+  NULLCMD=:
+  # Pre-4.2 versions of Zsh do word splitting on ${1+"$@"}, which
+  # is contrary to our usage.  Disable this feature.
+  alias -g '${1+"$@"}'='"$@"'
+  setopt NO_GLOB_SUBST
+else
+  case `(set -o) 2>/dev/null` in
+  *posix*) set -o posix ;;
+esac
+
+fi
+
+
+:
+_ASEOF
+}; then
+  CONFIG_SHELL=$as_shell
+	       as_have_required=yes
+	       if { "$as_shell" 2> /dev/null <<\_ASEOF
+if test -n "${ZSH_VERSION+set}" && (emulate sh) >/dev/null 2>&1; then
+  emulate sh
+  NULLCMD=:
+  # Pre-4.2 versions of Zsh do word splitting on ${1+"$@"}, which
+  # is contrary to our usage.  Disable this feature.
+  alias -g '${1+"$@"}'='"$@"'
+  setopt NO_GLOB_SUBST
+else
+  case `(set -o) 2>/dev/null` in
+  *posix*) set -o posix ;;
+esac
+
+fi
+
+
+:
+(as_func_return () {
+  (exit $1)
+}
+as_func_success () {
+  as_func_return 0
+}
+as_func_failure () {
+  as_func_return 1
+}
+as_func_ret_success () {
+  return 0
+}
+as_func_ret_failure () {
+  return 1
+}
+
+exitcode=0
+if as_func_success; then
+  :
+else
+  exitcode=1
+  echo as_func_success failed.
+fi
+
+if as_func_failure; then
+  exitcode=1
+  echo as_func_failure succeeded.
+fi
+
+if as_func_ret_success; then
+  :
+else
+  exitcode=1
+  echo as_func_ret_success failed.
+fi
+
+if as_func_ret_failure; then
+  exitcode=1
+  echo as_func_ret_failure succeeded.
+fi
+
+if ( set x; as_func_ret_success y && test x = "$1" ); then
+  :
+else
+  exitcode=1
+  echo positional parameters were not saved.
+fi
+
+test $exitcode = 0) || { (exit 1); exit 1; }
+
+(
   as_lineno_1=$LINENO
   as_lineno_2=$LINENO
-  as_lineno_3=`(expr $as_lineno_1 + 1) 2>/dev/null`
   test "x$as_lineno_1" != "x$as_lineno_2" &&
-  test "x$as_lineno_3"  = "x$as_lineno_2" ') 2>/dev/null; then
-	     $as_unset BASH_ENV || test "${BASH_ENV+set}" != set || { BASH_ENV=; export BASH_ENV; }
-	     $as_unset ENV || test "${ENV+set}" != set || { ENV=; export ENV; }
-	     CONFIG_SHELL=$as_dir/$as_base
-	     export CONFIG_SHELL
-	     exec "$CONFIG_SHELL" "$0" ${1+"$@"}
-	   fi;;
-	 esac
-       done
-done
-;;
-  esac
+  test "x`expr $as_lineno_1 + 1`" = "x$as_lineno_2") || { (exit 1); exit 1; }
+
+_ASEOF
+}; then
+  break
+fi
+
+fi
+
+      done
+
+      if test "x$CONFIG_SHELL" != x; then
+  for as_var in BASH_ENV ENV
+	do ($as_unset $as_var) >/dev/null 2>&1 && $as_unset $as_var
+	done
+	export CONFIG_SHELL
+	exec "$CONFIG_SHELL" "$as_myself" ${1+"$@"}
+fi
+
+
+    if test $as_have_required = no; then
+  echo This script requires a shell more modern than all the
+      echo shells that I found on your system.  Please install a
+      echo modern shell, or manually run the script under such a
+      echo shell if you do have one.
+      { (exit 1); exit 1; }
+fi
+
+
+fi
+
+fi
+
+
+
+(eval "as_func_return () {
+  (exit \$1)
+}
+as_func_success () {
+  as_func_return 0
+}
+as_func_failure () {
+  as_func_return 1
+}
+as_func_ret_success () {
+  return 0
+}
+as_func_ret_failure () {
+  return 1
+}
+
+exitcode=0
+if as_func_success; then
+  :
+else
+  exitcode=1
+  echo as_func_success failed.
+fi
+
+if as_func_failure; then
+  exitcode=1
+  echo as_func_failure succeeded.
+fi
+
+if as_func_ret_success; then
+  :
+else
+  exitcode=1
+  echo as_func_ret_success failed.
+fi
+
+if as_func_ret_failure; then
+  exitcode=1
+  echo as_func_ret_failure succeeded.
+fi
+
+if ( set x; as_func_ret_success y && test x = \"\$1\" ); then
+  :
+else
+  exitcode=1
+  echo positional parameters were not saved.
+fi
+
+test \$exitcode = 0") || {
+  echo No shell found that supports shell functions.
+  echo Please tell bug-autoconf at gnu.org about your system,
+  echo including any error possibly output before this message.
+  echo This can help us improve future autoconf versions.
+  echo Configuration will now proceed without shell functions.
+}
+
+
+
+  as_lineno_1=$LINENO
+  as_lineno_2=$LINENO
+  test "x$as_lineno_1" != "x$as_lineno_2" &&
+  test "x`expr $as_lineno_1 + 1`" = "x$as_lineno_2" || {
 
   # Create $as_me.lineno as a copy of $as_myself, but with $LINENO
   # uniformly replaced by the line number.  The first 'sed' inserts a
-  # line-number line before each line; the second 'sed' does the real
-  # work.  The second script uses 'N' to pair each line-number line
-  # with the numbered line, and appends trailing '-' during
-  # substitution so that $LINENO is not a special case at line end.
+  # line-number line after each line using $LINENO; the second 'sed'
+  # does the real work.  The second script uses 'N' to pair each
+  # line-number line with the line containing $LINENO, and appends
+  # trailing '-' during substitution so that $LINENO is not a special
+  # case at line end.
   # (Raja R Harinath suggested sed '=', and Paul Eggert wrote the
-  # second 'sed' script.  Blame Lee E. McMahon for sed's syntax.  :-)
-  sed '=' <$as_myself |
+  # scripts with optimization help from Paolo Bonzini.  Blame Lee
+  # E. McMahon (1931-1989) for sed's syntax.  :-)
+  sed -n '
+    p
+    /[$]LINENO/=
+  ' <$as_myself |
     sed '
+      s/[$]LINENO.*/&-/
+      t lineno
+      b
+      :lineno
       N
-      s,$,-,
-      : loop
-      s,^\(['$as_cr_digits']*\)\(.*\)[$]LINENO\([^'$as_cr_alnum'_]\),\1\2\1\3,
+      :loop
+      s/[$]LINENO\([^'$as_cr_alnum'_].*\n\)\(.*\)/\2\1\2/
       t loop
-      s,-$,,
-      s,^['$as_cr_digits']*\n,,
+      s/-\n.*//
     ' >$as_me.lineno &&
-  chmod +x $as_me.lineno ||
-    { echo "$as_me: error: cannot create $as_me.lineno; rerun with a POSIX shell" >&2
+  chmod +x "$as_me.lineno" ||
+    { $as_echo "$as_me: error: cannot create $as_me.lineno; rerun with a POSIX shell" >&2
    { (exit 1); exit 1; }; }
 
   # Don't try to exec as it changes $[0], causing all sort of problems
   # (the dirname of $[0] is not the place where we might find the
-  # original and so on.  Autoconf is especially sensible to this).
-  . ./$as_me.lineno
+  # original and so on.  Autoconf is especially sensitive to this).
+  . "./$as_me.lineno"
   # Exit status is that of the last command.
   exit
 }
 
 
-case `echo "testing\c"; echo 1,2,3`,`echo -n testing; echo 1,2,3` in
-  *c*,-n*) ECHO_N= ECHO_C='
-' ECHO_T='	' ;;
-  *c*,*  ) ECHO_N=-n ECHO_C= ECHO_T= ;;
-  *)       ECHO_N= ECHO_C='\c' ECHO_T= ;;
-esac
+if (as_dir=`dirname -- /` && test "X$as_dir" = X/) >/dev/null 2>&1; then
+  as_dirname=dirname
+else
+  as_dirname=false
+fi
 
-if expr a : '\(a\)' >/dev/null 2>&1; then
+ECHO_C= ECHO_N= ECHO_T=
+case `echo -n x` in
+-n*)
+  case `echo 'x\c'` in
+  *c*) ECHO_T='	';;	# ECHO_T is single tab character.
+  *)   ECHO_C='\c';;
+  esac;;
+*)
+  ECHO_N='-n';;
+esac
+if expr a : '\(a\)' >/dev/null 2>&1 &&
+   test "X`expr 00001 : '.*\(...\)'`" = X001; then
   as_expr=expr
 else
   as_expr=false
 fi
 
 rm -f conf$$ conf$$.exe conf$$.file
-echo >conf$$.file
-if ln -s conf$$.file conf$$ 2>/dev/null; then
-  # We could just check for DJGPP; but this test a) works b) is more generic
-  # and c) will remain valid once DJGPP supports symlinks (DJGPP 2.04).
-  if test -f conf$$.exe; then
-    # Don't use ln at all; we don't have any links
-    as_ln_s='cp -p'
-  else
+if test -d conf$$.dir; then
+  rm -f conf$$.dir/conf$$.file
+else
+  rm -f conf$$.dir
+  mkdir conf$$.dir 2>/dev/null
+fi
+if (echo >conf$$.file) 2>/dev/null; then
+  if ln -s conf$$.file conf$$ 2>/dev/null; then
     as_ln_s='ln -s'
+    # ... but there are two gotchas:
+    # 1) On MSYS, both `ln -s file dir' and `ln file dir' fail.
+    # 2) DJGPP < 2.04 has no symlinks; `ln -s' creates a wrapper executable.
+    # In both cases, we have to default to `cp -p'.
+    ln -s conf$$.file conf$$.dir 2>/dev/null && test ! -f conf$$.exe ||
+      as_ln_s='cp -p'
+  elif ln conf$$.file conf$$ 2>/dev/null; then
+    as_ln_s=ln
+  else
+    as_ln_s='cp -p'
   fi
-elif ln conf$$.file conf$$ 2>/dev/null; then
-  as_ln_s=ln
 else
   as_ln_s='cp -p'
 fi
-rm -f conf$$ conf$$.exe conf$$.file
+rm -f conf$$ conf$$.exe conf$$.dir/conf$$.file conf$$.file
+rmdir conf$$.dir 2>/dev/null
 
 if mkdir -p . 2>/dev/null; then
   as_mkdir_p=:
@@ -222,7 +540,28 @@ else
   as_mkdir_p=false
 fi
 
-as_executable_p="test -f"
+if test -x / >/dev/null 2>&1; then
+  as_test_x='test -x'
+else
+  if ls -dL / >/dev/null 2>&1; then
+    as_ls_L_option=L
+  else
+    as_ls_L_option=
+  fi
+  as_test_x='
+    eval sh -c '\''
+      if test -d "$1"; then
+	test -d "$1/.";
+      else
+	case $1 in
+	-*)set "./$1";;
+	esac;
+	case `ls -ld'$as_ls_L_option' "$1" 2>/dev/null` in
+	???[sx]*):;;*)false;;esac;fi
+    '\'' sh
+  '
+fi
+as_executable_p=$as_test_x
 
 # Sed expression to map a string onto a valid CPP name.
 as_tr_cpp="eval sed 'y%*$as_cr_letters%P$as_cr_LETTERS%;s%[^_$as_cr_alnum]%_%g'"
@@ -231,39 +570,27 @@ as_tr_cpp="eval sed 'y%*$as_cr_letters%P$as_cr_LETTERS%;s%[^_$as_cr_alnum]%_%g'"
 as_tr_sh="eval sed 'y%*+%pp%;s%[^_$as_cr_alnum]%_%g'"
 
 
-# IFS
-# We need space, tab and new line, in precisely that order.
-as_nl='
-'
-IFS=" 	$as_nl"
-
-# CDPATH.
-$as_unset CDPATH
 
+exec 7<&0 </dev/null 6>&1
 
 # Name of the host.
 # hostname on some systems (SVR3.2, Linux) returns a bogus exit status,
 # so uname gets run too.
 ac_hostname=`(hostname || uname -n) 2>/dev/null | sed 1q`
 
-exec 6>&1
-
 #
 # Initializations.
 #
 ac_default_prefix=/usr/local
+ac_clean_files=
 ac_config_libobj_dir=.
+LIBOBJS=
 cross_compiling=no
 subdirs=
 MFLAGS=
 MAKEFLAGS=
 SHELL=${CONFIG_SHELL-/bin/sh}
 
-# Maximum number of lines to put in a shell here document.
-# This variable seems obsolete.  It should probably be removed, and
-# only ac_max_sed_lines should be used.
-: ${ac_max_here_lines=38}
-
 # Identity of this package.
 PACKAGE_NAME=
 PACKAGE_TARNAME=
@@ -275,46 +602,145 @@ ac_unique_file="elf2flt.c"
 # Factoring default headers for most tests.
 ac_includes_default="\
 #include <stdio.h>
-#if HAVE_SYS_TYPES_H
+#ifdef HAVE_SYS_TYPES_H
 # include <sys/types.h>
 #endif
-#if HAVE_SYS_STAT_H
+#ifdef HAVE_SYS_STAT_H
 # include <sys/stat.h>
 #endif
-#if STDC_HEADERS
+#ifdef STDC_HEADERS
 # include <stdlib.h>
 # include <stddef.h>
 #else
-# if HAVE_STDLIB_H
+# ifdef HAVE_STDLIB_H
 #  include <stdlib.h>
 # endif
 #endif
-#if HAVE_STRING_H
-# if !STDC_HEADERS && HAVE_MEMORY_H
+#ifdef HAVE_STRING_H
+# if !defined STDC_HEADERS && defined HAVE_MEMORY_H
 #  include <memory.h>
 # endif
 # include <string.h>
 #endif
-#if HAVE_STRINGS_H
+#ifdef HAVE_STRINGS_H
 # include <strings.h>
 #endif
-#if HAVE_INTTYPES_H
+#ifdef HAVE_INTTYPES_H
 # include <inttypes.h>
-#else
-# if HAVE_STDINT_H
-#  include <stdint.h>
-# endif
 #endif
-#if HAVE_UNISTD_H
+#ifdef HAVE_STDINT_H
+# include <stdint.h>
+#endif
+#ifdef HAVE_UNISTD_H
 # include <unistd.h>
 #endif"
 
-ac_subst_vars='SHELL PATH_SEPARATOR PACKAGE_NAME PACKAGE_TARNAME PACKAGE_VERSION PACKAGE_STRING PACKAGE_BUGREPORT exec_prefix prefix program_transform_name bindir sbindir libexecdir datadir sysconfdir sharedstatedir localstatedir libdir includedir oldincludedir infodir mandir build_alias host_alias target_alias DEFS ECHO_C ECHO_N ECHO_T LIBS build build_cpu build_vendor build_os host host_cpu host_vendor host_os target target_cpu target_vendor target_os CC CFLAGS LDFLAGS CPPFLAGS ac_ct_CC EXEEXT OBJEXT INSTALL_PROGRAM INSTALL_SCRIPT INSTALL_DATA CPP EGREP bfd_include_dir binutils_include_dir binutils_ldscript_dir got_check emit_relocs LIBOBJS LTLIBOBJS'
+ac_subst_vars='LTLIBOBJS
+LIBOBJS
+SYMBOL_PREFIX
+always_reloc_text
+emit_ctor_dtor
+emit_relocs
+got_check
+use_ld_elf2flt_binary
+binutils_ldscript_dir
+zlib_include_dir
+binutils_include_dir
+bfd_include_dir
+INSTALL_DATA
+INSTALL_SCRIPT
+INSTALL_PROGRAM
+EGREP
+GREP
+CPP
+OBJEXT
+EXEEXT
+ac_ct_CC
+CPPFLAGS
+LDFLAGS
+CFLAGS
+CC
+target_os
+target_vendor
+target_cpu
+target
+host_os
+host_vendor
+host_cpu
+host
+build_os
+build_vendor
+build_cpu
+build
+target_alias
+host_alias
+build_alias
+LIBS
+ECHO_T
+ECHO_N
+ECHO_C
+DEFS
+mandir
+localedir
+libdir
+psdir
+pdfdir
+dvidir
+htmldir
+infodir
+docdir
+oldincludedir
+includedir
+localstatedir
+sharedstatedir
+sysconfdir
+datadir
+datarootdir
+libexecdir
+sbindir
+bindir
+program_transform_name
+prefix
+exec_prefix
+PACKAGE_BUGREPORT
+PACKAGE_STRING
+PACKAGE_VERSION
+PACKAGE_TARNAME
+PACKAGE_NAME
+PATH_SEPARATOR
+SHELL'
 ac_subst_files=''
+ac_user_opts='
+enable_option_checking
+with_zlib_prefix
+with_libbfd
+with_libiberty
+with_bfd_include_dir
+with_binutils_include_dir
+with_binutils_ldscript_dir
+with_binutils_build_dir
+enable_ld_elf2flt_binary
+enable_got_check
+enable_emit_relocs
+enable_emit_ctor_dtor
+enable_always_reloc_text
+'
+      ac_precious_vars='build_alias
+host_alias
+target_alias
+CC
+CFLAGS
+LDFLAGS
+LIBS
+CPPFLAGS
+CPP'
+
 
 # Initialize some variables set by options.
 ac_init_help=
 ac_init_version=false
+ac_unrecognized_opts=
+ac_unrecognized_sep=
 # The variables have the same names as the options, with
 # dashes changed to underlines.
 cache_file=/dev/null
@@ -337,34 +763,48 @@ x_libraries=NONE
 # and all the variables that are supposed to be based on exec_prefix
 # by default will actually change.
 # Use braces instead of parens because sh, perl, etc. also accept them.
+# (The list follows the same order as the GNU Coding Standards.)
 bindir='${exec_prefix}/bin'
 sbindir='${exec_prefix}/sbin'
 libexecdir='${exec_prefix}/libexec'
-datadir='${prefix}/share'
+datarootdir='${prefix}/share'
+datadir='${datarootdir}'
 sysconfdir='${prefix}/etc'
 sharedstatedir='${prefix}/com'
 localstatedir='${prefix}/var'
-libdir='${exec_prefix}/lib'
 includedir='${prefix}/include'
 oldincludedir='/usr/include'
-infodir='${prefix}/info'
-mandir='${prefix}/man'
+docdir='${datarootdir}/doc/${PACKAGE}'
+infodir='${datarootdir}/info'
+htmldir='${docdir}'
+dvidir='${docdir}'
+pdfdir='${docdir}'
+psdir='${docdir}'
+libdir='${exec_prefix}/lib'
+localedir='${datarootdir}/locale'
+mandir='${datarootdir}/man'
 
 ac_prev=
+ac_dashdash=
 for ac_option
 do
   # If the previous option needs an argument, assign it.
   if test -n "$ac_prev"; then
-    eval "$ac_prev=\$ac_option"
+    eval $ac_prev=\$ac_option
     ac_prev=
     continue
   fi
 
-  ac_optarg=`expr "x$ac_option" : 'x[^=]*=\(.*\)'`
+  case $ac_option in
+  *=*)	ac_optarg=`expr "X$ac_option" : '[^=]*=\(.*\)'` ;;
+  *)	ac_optarg=yes ;;
+  esac
 
   # Accept the important Cygnus configure options, so we can diagnose typos.
 
-  case $ac_option in
+  case $ac_dashdash$ac_option in
+  --)
+    ac_dashdash=yes ;;
 
   -bindir | --bindir | --bindi | --bind | --bin | --bi)
     ac_prev=bindir ;;
@@ -386,33 +826,61 @@ do
   --config-cache | -C)
     cache_file=config.cache ;;
 
-  -datadir | --datadir | --datadi | --datad | --data | --dat | --da)
+  -datadir | --datadir | --datadi | --datad)
     ac_prev=datadir ;;
-  -datadir=* | --datadir=* | --datadi=* | --datad=* | --data=* | --dat=* \
-  | --da=*)
+  -datadir=* | --datadir=* | --datadi=* | --datad=*)
     datadir=$ac_optarg ;;
 
+  -datarootdir | --datarootdir | --datarootdi | --datarootd | --dataroot \
+  | --dataroo | --dataro | --datar)
+    ac_prev=datarootdir ;;
+  -datarootdir=* | --datarootdir=* | --datarootdi=* | --datarootd=* \
+  | --dataroot=* | --dataroo=* | --dataro=* | --datar=*)
+    datarootdir=$ac_optarg ;;
+
   -disable-* | --disable-*)
-    ac_feature=`expr "x$ac_option" : 'x-*disable-\(.*\)'`
+    ac_useropt=`expr "x$ac_option" : 'x-*disable-\(.*\)'`
     # Reject names that are not valid shell variable names.
-    expr "x$ac_feature" : ".*[^-_$as_cr_alnum]" >/dev/null &&
-      { echo "$as_me: error: invalid feature name: $ac_feature" >&2
+    expr "x$ac_useropt" : ".*[^-+._$as_cr_alnum]" >/dev/null &&
+      { $as_echo "$as_me: error: invalid feature name: $ac_useropt" >&2
    { (exit 1); exit 1; }; }
-    ac_feature=`echo $ac_feature | sed 's/-/_/g'`
-    eval "enable_$ac_feature=no" ;;
+    ac_useropt_orig=$ac_useropt
+    ac_useropt=`$as_echo "$ac_useropt" | sed 's/[-+.]/_/g'`
+    case $ac_user_opts in
+      *"
+"enable_$ac_useropt"
+"*) ;;
+      *) ac_unrecognized_opts="$ac_unrecognized_opts$ac_unrecognized_sep--disable-$ac_useropt_orig"
+	 ac_unrecognized_sep=', ';;
+    esac
+    eval enable_$ac_useropt=no ;;
+
+  -docdir | --docdir | --docdi | --doc | --do)
+    ac_prev=docdir ;;
+  -docdir=* | --docdir=* | --docdi=* | --doc=* | --do=*)
+    docdir=$ac_optarg ;;
+
+  -dvidir | --dvidir | --dvidi | --dvid | --dvi | --dv)
+    ac_prev=dvidir ;;
+  -dvidir=* | --dvidir=* | --dvidi=* | --dvid=* | --dvi=* | --dv=*)
+    dvidir=$ac_optarg ;;
 
   -enable-* | --enable-*)
-    ac_feature=`expr "x$ac_option" : 'x-*enable-\([^=]*\)'`
+    ac_useropt=`expr "x$ac_option" : 'x-*enable-\([^=]*\)'`
     # Reject names that are not valid shell variable names.
-    expr "x$ac_feature" : ".*[^-_$as_cr_alnum]" >/dev/null &&
-      { echo "$as_me: error: invalid feature name: $ac_feature" >&2
+    expr "x$ac_useropt" : ".*[^-+._$as_cr_alnum]" >/dev/null &&
+      { $as_echo "$as_me: error: invalid feature name: $ac_useropt" >&2
    { (exit 1); exit 1; }; }
-    ac_feature=`echo $ac_feature | sed 's/-/_/g'`
-    case $ac_option in
-      *=*) ac_optarg=`echo "$ac_optarg" | sed "s/'/'\\\\\\\\''/g"`;;
-      *) ac_optarg=yes ;;
+    ac_useropt_orig=$ac_useropt
+    ac_useropt=`$as_echo "$ac_useropt" | sed 's/[-+.]/_/g'`
+    case $ac_user_opts in
+      *"
+"enable_$ac_useropt"
+"*) ;;
+      *) ac_unrecognized_opts="$ac_unrecognized_opts$ac_unrecognized_sep--enable-$ac_useropt_orig"
+	 ac_unrecognized_sep=', ';;
     esac
-    eval "enable_$ac_feature='$ac_optarg'" ;;
+    eval enable_$ac_useropt=\$ac_optarg ;;
 
   -exec-prefix | --exec_prefix | --exec-prefix | --exec-prefi \
   | --exec-pref | --exec-pre | --exec-pr | --exec-p | --exec- \
@@ -439,6 +907,12 @@ do
   -host=* | --host=* | --hos=* | --ho=*)
     host_alias=$ac_optarg ;;
 
+  -htmldir | --htmldir | --htmldi | --htmld | --html | --htm | --ht)
+    ac_prev=htmldir ;;
+  -htmldir=* | --htmldir=* | --htmldi=* | --htmld=* | --html=* | --htm=* \
+  | --ht=*)
+    htmldir=$ac_optarg ;;
+
   -includedir | --includedir | --includedi | --included | --include \
   | --includ | --inclu | --incl | --inc)
     ac_prev=includedir ;;
@@ -463,13 +937,16 @@ do
   | --libexe=* | --libex=* | --libe=*)
     libexecdir=$ac_optarg ;;
 
+  -localedir | --localedir | --localedi | --localed | --locale)
+    ac_prev=localedir ;;
+  -localedir=* | --localedir=* | --localedi=* | --localed=* | --locale=*)
+    localedir=$ac_optarg ;;
+
   -localstatedir | --localstatedir | --localstatedi | --localstated \
-  | --localstate | --localstat | --localsta | --localst \
-  | --locals | --local | --loca | --loc | --lo)
+  | --localstate | --localstat | --localsta | --localst | --locals)
     ac_prev=localstatedir ;;
   -localstatedir=* | --localstatedir=* | --localstatedi=* | --localstated=* \
-  | --localstate=* | --localstat=* | --localsta=* | --localst=* \
-  | --locals=* | --local=* | --loca=* | --loc=* | --lo=*)
+  | --localstate=* | --localstat=* | --localsta=* | --localst=* | --locals=*)
     localstatedir=$ac_optarg ;;
 
   -mandir | --mandir | --mandi | --mand | --man | --ma | --m)
@@ -534,6 +1011,16 @@ do
   | --progr-tra=* | --program-tr=* | --program-t=*)
     program_transform_name=$ac_optarg ;;
 
+  -pdfdir | --pdfdir | --pdfdi | --pdfd | --pdf | --pd)
+    ac_prev=pdfdir ;;
+  -pdfdir=* | --pdfdir=* | --pdfdi=* | --pdfd=* | --pdf=* | --pd=*)
+    pdfdir=$ac_optarg ;;
+
+  -psdir | --psdir | --psdi | --psd | --ps)
+    ac_prev=psdir ;;
+  -psdir=* | --psdir=* | --psdi=* | --psd=* | --ps=*)
+    psdir=$ac_optarg ;;
+
   -q | -quiet | --quiet | --quie | --qui | --qu | --q \
   | -silent | --silent | --silen | --sile | --sil)
     silent=yes ;;
@@ -584,26 +1071,38 @@ do
     ac_init_version=: ;;
 
   -with-* | --with-*)
-    ac_package=`expr "x$ac_option" : 'x-*with-\([^=]*\)'`
+    ac_useropt=`expr "x$ac_option" : 'x-*with-\([^=]*\)'`
     # Reject names that are not valid shell variable names.
-    expr "x$ac_package" : ".*[^-_$as_cr_alnum]" >/dev/null &&
-      { echo "$as_me: error: invalid package name: $ac_package" >&2
+    expr "x$ac_useropt" : ".*[^-+._$as_cr_alnum]" >/dev/null &&
+      { $as_echo "$as_me: error: invalid package name: $ac_useropt" >&2
    { (exit 1); exit 1; }; }
-    ac_package=`echo $ac_package| sed 's/-/_/g'`
-    case $ac_option in
-      *=*) ac_optarg=`echo "$ac_optarg" | sed "s/'/'\\\\\\\\''/g"`;;
-      *) ac_optarg=yes ;;
+    ac_useropt_orig=$ac_useropt
+    ac_useropt=`$as_echo "$ac_useropt" | sed 's/[-+.]/_/g'`
+    case $ac_user_opts in
+      *"
+"with_$ac_useropt"
+"*) ;;
+      *) ac_unrecognized_opts="$ac_unrecognized_opts$ac_unrecognized_sep--with-$ac_useropt_orig"
+	 ac_unrecognized_sep=', ';;
     esac
-    eval "with_$ac_package='$ac_optarg'" ;;
+    eval with_$ac_useropt=\$ac_optarg ;;
 
   -without-* | --without-*)
-    ac_package=`expr "x$ac_option" : 'x-*without-\(.*\)'`
+    ac_useropt=`expr "x$ac_option" : 'x-*without-\(.*\)'`
     # Reject names that are not valid shell variable names.
-    expr "x$ac_package" : ".*[^-_$as_cr_alnum]" >/dev/null &&
-      { echo "$as_me: error: invalid package name: $ac_package" >&2
+    expr "x$ac_useropt" : ".*[^-+._$as_cr_alnum]" >/dev/null &&
+      { $as_echo "$as_me: error: invalid package name: $ac_useropt" >&2
    { (exit 1); exit 1; }; }
-    ac_package=`echo $ac_package | sed 's/-/_/g'`
-    eval "with_$ac_package=no" ;;
+    ac_useropt_orig=$ac_useropt
+    ac_useropt=`$as_echo "$ac_useropt" | sed 's/[-+.]/_/g'`
+    case $ac_user_opts in
+      *"
+"with_$ac_useropt"
+"*) ;;
+      *) ac_unrecognized_opts="$ac_unrecognized_opts$ac_unrecognized_sep--without-$ac_useropt_orig"
+	 ac_unrecognized_sep=', ';;
+    esac
+    eval with_$ac_useropt=no ;;
 
   --x)
     # Obsolete; use --with-x.
@@ -623,7 +1122,7 @@ do
   | --x-librar=* | --x-libra=* | --x-libr=* | --x-lib=* | --x-li=* | --x-l=*)
     x_libraries=$ac_optarg ;;
 
-  -*) { echo "$as_me: error: unrecognized option: $ac_option
+  -*) { $as_echo "$as_me: error: unrecognized option: $ac_option
 Try \`$0 --help' for more information." >&2
    { (exit 1); exit 1; }; }
     ;;
@@ -632,17 +1131,16 @@ Try \`$0 --help' for more information." >&2
     ac_envvar=`expr "x$ac_option" : 'x\([^=]*\)='`
     # Reject names that are not valid shell variable names.
     expr "x$ac_envvar" : ".*[^_$as_cr_alnum]" >/dev/null &&
-      { echo "$as_me: error: invalid variable name: $ac_envvar" >&2
+      { $as_echo "$as_me: error: invalid variable name: $ac_envvar" >&2
    { (exit 1); exit 1; }; }
-    ac_optarg=`echo "$ac_optarg" | sed "s/'/'\\\\\\\\''/g"`
-    eval "$ac_envvar='$ac_optarg'"
+    eval $ac_envvar=\$ac_optarg
     export $ac_envvar ;;
 
   *)
     # FIXME: should be removed in autoconf 3.0.
-    echo "$as_me: WARNING: you should use --build, --host, --target" >&2
+    $as_echo "$as_me: WARNING: you should use --build, --host, --target" >&2
     expr "x$ac_option" : ".*[^-._$as_cr_alnum]" >/dev/null &&
-      echo "$as_me: WARNING: invalid host type: $ac_option" >&2
+      $as_echo "$as_me: WARNING: invalid host type: $ac_option" >&2
     : ${build_alias=$ac_option} ${host_alias=$ac_option} ${target_alias=$ac_option}
     ;;
 
@@ -651,31 +1149,39 @@ done
 
 if test -n "$ac_prev"; then
   ac_option=--`echo $ac_prev | sed 's/_/-/g'`
-  { echo "$as_me: error: missing argument to $ac_option" >&2
+  { $as_echo "$as_me: error: missing argument to $ac_option" >&2
    { (exit 1); exit 1; }; }
 fi
 
-# Be sure to have absolute paths.
-for ac_var in exec_prefix prefix
-do
-  eval ac_val=$`echo $ac_var`
-  case $ac_val in
-    [\\/$]* | ?:[\\/]* | NONE | '' ) ;;
-    *)  { echo "$as_me: error: expected an absolute directory name for --$ac_var: $ac_val" >&2
-   { (exit 1); exit 1; }; };;
+if test -n "$ac_unrecognized_opts"; then
+  case $enable_option_checking in
+    no) ;;
+    fatal) { $as_echo "$as_me: error: unrecognized options: $ac_unrecognized_opts" >&2
+   { (exit 1); exit 1; }; } ;;
+    *)     $as_echo "$as_me: WARNING: unrecognized options: $ac_unrecognized_opts" >&2 ;;
   esac
-done
+fi
 
-# Be sure to have absolute paths.
-for ac_var in bindir sbindir libexecdir datadir sysconfdir sharedstatedir \
-	      localstatedir libdir includedir oldincludedir infodir mandir
+# Check all directory arguments for consistency.
+for ac_var in	exec_prefix prefix bindir sbindir libexecdir datarootdir \
+		datadir sysconfdir sharedstatedir localstatedir includedir \
+		oldincludedir docdir infodir htmldir dvidir pdfdir psdir \
+		libdir localedir mandir
 do
-  eval ac_val=$`echo $ac_var`
+  eval ac_val=\$$ac_var
+  # Remove trailing slashes.
   case $ac_val in
-    [\\/$]* | ?:[\\/]* ) ;;
-    *)  { echo "$as_me: error: expected an absolute directory name for --$ac_var: $ac_val" >&2
-   { (exit 1); exit 1; }; };;
+    */ )
+      ac_val=`expr "X$ac_val" : 'X\(.*[^/]\)' \| "X$ac_val" : 'X\(.*\)'`
+      eval $ac_var=\$ac_val;;
+  esac
+  # Be sure to have absolute directory names.
+  case $ac_val in
+    [\\/$]* | ?:[\\/]* )  continue;;
+    NONE | '' ) case $ac_var in *prefix ) continue;; esac;;
   esac
+  { $as_echo "$as_me: error: expected an absolute directory name for --$ac_var: $ac_val" >&2
+   { (exit 1); exit 1; }; }
 done
 
 # There might be people who depend on the old broken behavior: `$host'
@@ -689,7 +1195,7 @@ target=$target_alias
 if test "x$host_alias" != x; then
   if test "x$build_alias" = x; then
     cross_compiling=maybe
-    echo "$as_me: WARNING: If you wanted to set the --build type, don't use --host.
+    $as_echo "$as_me: WARNING: If you wanted to set the --build type, don't use --host.
     If a cross compiler is detected then cross compile mode will be used." >&2
   elif test "x$build_alias" != "x$host_alias"; then
     cross_compiling=yes
@@ -702,74 +1208,76 @@ test -n "$host_alias" && ac_tool_prefix=$host_alias-
 test "$silent" = yes && exec 6>/dev/null
 
 
+ac_pwd=`pwd` && test -n "$ac_pwd" &&
+ac_ls_di=`ls -di .` &&
+ac_pwd_ls_di=`cd "$ac_pwd" && ls -di .` ||
+  { $as_echo "$as_me: error: working directory cannot be determined" >&2
+   { (exit 1); exit 1; }; }
+test "X$ac_ls_di" = "X$ac_pwd_ls_di" ||
+  { $as_echo "$as_me: error: pwd does not report name of working directory" >&2
+   { (exit 1); exit 1; }; }
+
+
 # Find the source files, if location was not specified.
 if test -z "$srcdir"; then
   ac_srcdir_defaulted=yes
-  # Try the directory containing this script, then its parent.
-  ac_confdir=`(dirname "$0") 2>/dev/null ||
-$as_expr X"$0" : 'X\(.*[^/]\)//*[^/][^/]*/*$' \| \
-	 X"$0" : 'X\(//\)[^/]' \| \
-	 X"$0" : 'X\(//\)$' \| \
-	 X"$0" : 'X\(/\)' \| \
-	 .     : '\(.\)' 2>/dev/null ||
-echo X"$0" |
-    sed '/^X\(.*[^/]\)\/\/*[^/][^/]*\/*$/{ s//\1/; q; }
-  	  /^X\(\/\/\)[^/].*/{ s//\1/; q; }
-  	  /^X\(\/\/\)$/{ s//\1/; q; }
-  	  /^X\(\/\).*/{ s//\1/; q; }
-  	  s/.*/./; q'`
+  # Try the directory containing this script, then the parent directory.
+  ac_confdir=`$as_dirname -- "$as_myself" ||
+$as_expr X"$as_myself" : 'X\(.*[^/]\)//*[^/][^/]*/*$' \| \
+	 X"$as_myself" : 'X\(//\)[^/]' \| \
+	 X"$as_myself" : 'X\(//\)$' \| \
+	 X"$as_myself" : 'X\(/\)' \| . 2>/dev/null ||
+$as_echo X"$as_myself" |
+    sed '/^X\(.*[^/]\)\/\/*[^/][^/]*\/*$/{
+	    s//\1/
+	    q
+	  }
+	  /^X\(\/\/\)[^/].*/{
+	    s//\1/
+	    q
+	  }
+	  /^X\(\/\/\)$/{
+	    s//\1/
+	    q
+	  }
+	  /^X\(\/\).*/{
+	    s//\1/
+	    q
+	  }
+	  s/.*/./; q'`
   srcdir=$ac_confdir
-  if test ! -r $srcdir/$ac_unique_file; then
+  if test ! -r "$srcdir/$ac_unique_file"; then
     srcdir=..
   fi
 else
   ac_srcdir_defaulted=no
 fi
-if test ! -r $srcdir/$ac_unique_file; then
-  if test "$ac_srcdir_defaulted" = yes; then
-    { echo "$as_me: error: cannot find sources ($ac_unique_file) in $ac_confdir or .." >&2
-   { (exit 1); exit 1; }; }
-  else
-    { echo "$as_me: error: cannot find sources ($ac_unique_file) in $srcdir" >&2
+if test ! -r "$srcdir/$ac_unique_file"; then
+  test "$ac_srcdir_defaulted" = yes && srcdir="$ac_confdir or .."
+  { $as_echo "$as_me: error: cannot find sources ($ac_unique_file) in $srcdir" >&2
    { (exit 1); exit 1; }; }
-  fi
 fi
-(cd $srcdir && test -r ./$ac_unique_file) 2>/dev/null ||
-  { echo "$as_me: error: sources are in $srcdir, but \`cd $srcdir' does not work" >&2
+ac_msg="sources are in $srcdir, but \`cd $srcdir' does not work"
+ac_abs_confdir=`(
+	cd "$srcdir" && test -r "./$ac_unique_file" || { $as_echo "$as_me: error: $ac_msg" >&2
    { (exit 1); exit 1; }; }
-srcdir=`echo "$srcdir" | sed 's%\([^\\/]\)[\\/]*$%\1%'`
-ac_env_build_alias_set=${build_alias+set}
-ac_env_build_alias_value=$build_alias
-ac_cv_env_build_alias_set=${build_alias+set}
-ac_cv_env_build_alias_value=$build_alias
-ac_env_host_alias_set=${host_alias+set}
-ac_env_host_alias_value=$host_alias
-ac_cv_env_host_alias_set=${host_alias+set}
-ac_cv_env_host_alias_value=$host_alias
-ac_env_target_alias_set=${target_alias+set}
-ac_env_target_alias_value=$target_alias
-ac_cv_env_target_alias_set=${target_alias+set}
-ac_cv_env_target_alias_value=$target_alias
-ac_env_CC_set=${CC+set}
-ac_env_CC_value=$CC
-ac_cv_env_CC_set=${CC+set}
-ac_cv_env_CC_value=$CC
-ac_env_CFLAGS_set=${CFLAGS+set}
-ac_env_CFLAGS_value=$CFLAGS
-ac_cv_env_CFLAGS_set=${CFLAGS+set}
-ac_cv_env_CFLAGS_value=$CFLAGS
-ac_env_LDFLAGS_set=${LDFLAGS+set}
-ac_env_LDFLAGS_value=$LDFLAGS
-ac_cv_env_LDFLAGS_set=${LDFLAGS+set}
-ac_cv_env_LDFLAGS_value=$LDFLAGS
-ac_env_CPPFLAGS_set=${CPPFLAGS+set}
-ac_env_CPPFLAGS_value=$CPPFLAGS
-ac_cv_env_CPPFLAGS_set=${CPPFLAGS+set}
-ac_cv_env_CPPFLAGS_value=$CPPFLAGS
-ac_env_CPP_set=${CPP+set}
-ac_env_CPP_value=$CPP
-ac_cv_env_CPP_set=${CPP+set}
-ac_cv_env_CPP_value=$CPP
+	pwd)`
+# When building in place, set srcdir=.
+if test "$ac_abs_confdir" = "$ac_pwd"; then
+  srcdir=.
+fi
+# Remove unnecessary trailing slashes from srcdir.
+# Double slashes in file names in object file debugging info
+# mess up M-x gdb in Emacs.
+case $srcdir in
+*/) srcdir=`expr "X$srcdir" : 'X\(.*[^/]\)' \| "X$srcdir" : 'X\(.*\)'`;;
+esac
+for ac_var in $ac_precious_vars; do
+  eval ac_env_${ac_var}_set=\${${ac_var}+set}
+  eval ac_env_${ac_var}_value=\$${ac_var}
+  eval ac_cv_env_${ac_var}_set=\${${ac_var}+set}
+  eval ac_cv_env_${ac_var}_value=\$${ac_var}
+done
 
 #
 # Report the --help message.
@@ -798,14 +1306,11 @@ Configuration:
   -n, --no-create         do not create output files
       --srcdir=DIR        find the sources in DIR [configure dir or \`..']
 
-_ACEOF
-
-  cat <<_ACEOF
 Installation directories:
   --prefix=PREFIX         install architecture-independent files in PREFIX
-			  [$ac_default_prefix]
+                          [$ac_default_prefix]
   --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX
-			  [PREFIX]
+                          [PREFIX]
 
 By default, \`make install' will install all the files in
 \`$ac_default_prefix/bin', \`$ac_default_prefix/lib' etc.  You can specify
@@ -815,18 +1320,25 @@ for instance \`--prefix=\$HOME'.
 For better control, use the options below.
 
 Fine tuning of the installation directories:
-  --bindir=DIR           user executables [EPREFIX/bin]
-  --sbindir=DIR          system admin executables [EPREFIX/sbin]
-  --libexecdir=DIR       program executables [EPREFIX/libexec]
-  --datadir=DIR          read-only architecture-independent data [PREFIX/share]
-  --sysconfdir=DIR       read-only single-machine data [PREFIX/etc]
-  --sharedstatedir=DIR   modifiable architecture-independent data [PREFIX/com]
-  --localstatedir=DIR    modifiable single-machine data [PREFIX/var]
-  --libdir=DIR           object code libraries [EPREFIX/lib]
-  --includedir=DIR       C header files [PREFIX/include]
-  --oldincludedir=DIR    C header files for non-gcc [/usr/include]
-  --infodir=DIR          info documentation [PREFIX/info]
-  --mandir=DIR           man documentation [PREFIX/man]
+  --bindir=DIR            user executables [EPREFIX/bin]
+  --sbindir=DIR           system admin executables [EPREFIX/sbin]
+  --libexecdir=DIR        program executables [EPREFIX/libexec]
+  --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
+  --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
+  --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
+  --libdir=DIR            object code libraries [EPREFIX/lib]
+  --includedir=DIR        C header files [PREFIX/include]
+  --oldincludedir=DIR     C header files for non-gcc [/usr/include]
+  --datarootdir=DIR       read-only arch.-independent data root [PREFIX/share]
+  --datadir=DIR           read-only architecture-independent data [DATAROOTDIR]
+  --infodir=DIR           info documentation [DATAROOTDIR/info]
+  --localedir=DIR         locale-dependent data [DATAROOTDIR/locale]
+  --mandir=DIR            man documentation [DATAROOTDIR/man]
+  --docdir=DIR            documentation root [DATAROOTDIR/doc/PACKAGE]
+  --htmldir=DIR           html documentation [DOCDIR]
+  --dvidir=DIR            dvi documentation [DOCDIR]
+  --pdfdir=DIR            pdf documentation [DOCDIR]
+  --psdir=DIR             ps documentation [DOCDIR]
 _ACEOF
 
   cat <<\_ACEOF
@@ -843,145 +1355,130 @@ if test -n "$ac_init_help"; then
   cat <<\_ACEOF
 
 Optional Features:
+  --disable-option-checking  ignore unrecognized --enable/--with options
   --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
   --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
- --disable-got-check - disable check for GOT (needed on H8)
- --disable-emit-relocs - don't use the --emit-relocs (-q) linker option
+  --disable-ld-elf2flt-binary
+                          use ld-elf2flt shell script
+  --disable-got-check     disable check for GOT (needed on H8)
+  --disable-emit-relocs   don't use the --emit-relocs (-q) linker option
+  --enable-emit-ctor-dtor manually create ctor/dtor list
+  --enable-always-reloc-text
+                          always process text relocs ignoring pic/got (needed
+                          on Blackfin)
 
 Optional Packages:
   --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
   --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
- --with-libbfd=<file>  path to libbfd.a library to use
- --with-libiberty=<file>  path to libiberty.a library to use
- --with-bfd-include-dir=<dir>  include path for correct bfd.h
- --with-binutils-include-dir=<dir>  include path for binutils headers
- --with-binutils-ldscript-dir=<dir>  path to install elf2flt.ld
+  --with-zlib-prefix=<dir>
+                          path to installed zlib
+  --with-libbfd=<file>    path to libbfd.a library to use
+  --with-libiberty=<file> path to libiberty.a library to use
+  --with-bfd-include-dir=<dir>
+                          include path for correct bfd.h
+  --with-binutils-include-dir=<dir>
+                          include path for binutils headers
+  --with-binutils-ldscript-dir=<dir>
+                          path to install elf2flt.ld
+  --with-binutils-build-dir=<dir>
+                          path to compiled binutils tree
 
 Some influential environment variables:
   CC          C compiler command
   CFLAGS      C compiler flags
   LDFLAGS     linker flags, e.g. -L<lib dir> if you have libraries in a
               nonstandard directory <lib dir>
-  CPPFLAGS    C/C++ preprocessor flags, e.g. -I<include dir> if you have
-              headers in a nonstandard directory <include dir>
+  LIBS        libraries to pass to the linker, e.g. -l<library>
+  CPPFLAGS    C/C++/Objective C preprocessor flags, e.g. -I<include dir> if
+              you have headers in a nonstandard directory <include dir>
   CPP         C preprocessor
 
 Use these variables to override the choices made by `configure' or to help
 it to find libraries and programs with nonstandard names/locations.
 
 _ACEOF
+ac_status=$?
 fi
 
 if test "$ac_init_help" = "recursive"; then
   # If there are subdirs, report their specific --help.
-  ac_popdir=`pwd`
   for ac_dir in : $ac_subdirs_all; do test "x$ac_dir" = x: && continue
-    test -d $ac_dir || continue
+    test -d "$ac_dir" ||
+      { cd "$srcdir" && ac_pwd=`pwd` && srcdir=. && test -d "$ac_dir"; } ||
+      continue
     ac_builddir=.
 
-if test "$ac_dir" != .; then
-  ac_dir_suffix=/`echo "$ac_dir" | sed 's,^\.[\\/],,'`
-  # A "../" for each directory in $ac_dir_suffix.
-  ac_top_builddir=`echo "$ac_dir_suffix" | sed 's,/[^\\/]*,../,g'`
-else
-  ac_dir_suffix= ac_top_builddir=
-fi
+case "$ac_dir" in
+.) ac_dir_suffix= ac_top_builddir_sub=. ac_top_build_prefix= ;;
+*)
+  ac_dir_suffix=/`$as_echo "$ac_dir" | sed 's|^\.[\\/]||'`
+  # A ".." for each directory in $ac_dir_suffix.
+  ac_top_builddir_sub=`$as_echo "$ac_dir_suffix" | sed 's|/[^\\/]*|/..|g;s|/||'`
+  case $ac_top_builddir_sub in
+  "") ac_top_builddir_sub=. ac_top_build_prefix= ;;
+  *)  ac_top_build_prefix=$ac_top_builddir_sub/ ;;
+  esac ;;
+esac
+ac_abs_top_builddir=$ac_pwd
+ac_abs_builddir=$ac_pwd$ac_dir_suffix
+# for backward compatibility:
+ac_top_builddir=$ac_top_build_prefix
 
 case $srcdir in
-  .)  # No --srcdir option.  We are building in place.
+  .)  # We are building in place.
     ac_srcdir=.
-    if test -z "$ac_top_builddir"; then
-       ac_top_srcdir=.
-    else
-       ac_top_srcdir=`echo $ac_top_builddir | sed 's,/$,,'`
-    fi ;;
-  [\\/]* | ?:[\\/]* )  # Absolute path.
+    ac_top_srcdir=$ac_top_builddir_sub
+    ac_abs_top_srcdir=$ac_pwd ;;
+  [\\/]* | ?:[\\/]* )  # Absolute name.
     ac_srcdir=$srcdir$ac_dir_suffix;
-    ac_top_srcdir=$srcdir ;;
-  *) # Relative path.
-    ac_srcdir=$ac_top_builddir$srcdir$ac_dir_suffix
-    ac_top_srcdir=$ac_top_builddir$srcdir ;;
-esac
-
-# Do not use `cd foo && pwd` to compute absolute paths, because
-# the directories may not exist.
-case `pwd` in
-.) ac_abs_builddir="$ac_dir";;
-*)
-  case "$ac_dir" in
-  .) ac_abs_builddir=`pwd`;;
-  [\\/]* | ?:[\\/]* ) ac_abs_builddir="$ac_dir";;
-  *) ac_abs_builddir=`pwd`/"$ac_dir";;
-  esac;;
-esac
-case $ac_abs_builddir in
-.) ac_abs_top_builddir=${ac_top_builddir}.;;
-*)
-  case ${ac_top_builddir}. in
-  .) ac_abs_top_builddir=$ac_abs_builddir;;
-  [\\/]* | ?:[\\/]* ) ac_abs_top_builddir=${ac_top_builddir}.;;
-  *) ac_abs_top_builddir=$ac_abs_builddir/${ac_top_builddir}.;;
-  esac;;
-esac
-case $ac_abs_builddir in
-.) ac_abs_srcdir=$ac_srcdir;;
-*)
-  case $ac_srcdir in
-  .) ac_abs_srcdir=$ac_abs_builddir;;
-  [\\/]* | ?:[\\/]* ) ac_abs_srcdir=$ac_srcdir;;
-  *) ac_abs_srcdir=$ac_abs_builddir/$ac_srcdir;;
-  esac;;
-esac
-case $ac_abs_builddir in
-.) ac_abs_top_srcdir=$ac_top_srcdir;;
-*)
-  case $ac_top_srcdir in
-  .) ac_abs_top_srcdir=$ac_abs_builddir;;
-  [\\/]* | ?:[\\/]* ) ac_abs_top_srcdir=$ac_top_srcdir;;
-  *) ac_abs_top_srcdir=$ac_abs_builddir/$ac_top_srcdir;;
-  esac;;
+    ac_top_srcdir=$srcdir
+    ac_abs_top_srcdir=$srcdir ;;
+  *) # Relative name.
+    ac_srcdir=$ac_top_build_prefix$srcdir$ac_dir_suffix
+    ac_top_srcdir=$ac_top_build_prefix$srcdir
+    ac_abs_top_srcdir=$ac_pwd/$srcdir ;;
 esac
-
-    cd $ac_dir
-    # Check for guested configure; otherwise get Cygnus style configure.
-    if test -f $ac_srcdir/configure.gnu; then
-      echo
-      $SHELL $ac_srcdir/configure.gnu  --help=recursive
-    elif test -f $ac_srcdir/configure; then
-      echo
-      $SHELL $ac_srcdir/configure  --help=recursive
-    elif test -f $ac_srcdir/configure.ac ||
-	   test -f $ac_srcdir/configure.in; then
-      echo
-      $ac_configure --help
+ac_abs_srcdir=$ac_abs_top_srcdir$ac_dir_suffix
+
+    cd "$ac_dir" || { ac_status=$?; continue; }
+    # Check for guested configure.
+    if test -f "$ac_srcdir/configure.gnu"; then
+      echo &&
+      $SHELL "$ac_srcdir/configure.gnu" --help=recursive
+    elif test -f "$ac_srcdir/configure"; then
+      echo &&
+      $SHELL "$ac_srcdir/configure" --help=recursive
     else
-      echo "$as_me: WARNING: no configuration information is in $ac_dir" >&2
-    fi
-    cd $ac_popdir
+      $as_echo "$as_me: WARNING: no configuration information is in $ac_dir" >&2
+    fi || ac_status=$?
+    cd "$ac_pwd" || { ac_status=$?; break; }
   done
 fi
 
-test -n "$ac_init_help" && exit 0
+test -n "$ac_init_help" && exit $ac_status
 if $ac_init_version; then
   cat <<\_ACEOF
+configure
+generated by GNU Autoconf 2.63
 
-Copyright (C) 2003 Free Software Foundation, Inc.
+Copyright (C) 1992, 1993, 1994, 1995, 1996, 1998, 1999, 2000, 2001,
+2002, 2003, 2004, 2005, 2006, 2007, 2008 Free Software Foundation, Inc.
 This configure script is free software; the Free Software Foundation
 gives unlimited permission to copy, distribute and modify it.
 _ACEOF
-  exit 0
+  exit
 fi
-exec 5>config.log
-cat >&5 <<_ACEOF
+cat >config.log <<_ACEOF
 This file contains any messages produced by compilers while
 running configure, to aid debugging if configure makes a mistake.
 
 It was created by $as_me, which was
-generated by GNU Autoconf 2.59.  Invocation command line was
+generated by GNU Autoconf 2.63.  Invocation command line was
 
   $ $0 $@
 
 _ACEOF
+exec 5>>config.log
 {
 cat <<_ASUNAME
 ## --------- ##
@@ -1000,7 +1497,7 @@ uname -v = `(uname -v) 2>/dev/null || echo unknown`
 /bin/arch              = `(/bin/arch) 2>/dev/null              || echo unknown`
 /usr/bin/arch -k       = `(/usr/bin/arch -k) 2>/dev/null       || echo unknown`
 /usr/convex/getsysinfo = `(/usr/convex/getsysinfo) 2>/dev/null || echo unknown`
-hostinfo               = `(hostinfo) 2>/dev/null               || echo unknown`
+/usr/bin/hostinfo      = `(/usr/bin/hostinfo) 2>/dev/null      || echo unknown`
 /bin/machine           = `(/bin/machine) 2>/dev/null           || echo unknown`
 /usr/bin/oslevel       = `(/usr/bin/oslevel) 2>/dev/null       || echo unknown`
 /bin/universe          = `(/bin/universe) 2>/dev/null          || echo unknown`
@@ -1012,8 +1509,9 @@ for as_dir in $PATH
 do
   IFS=$as_save_IFS
   test -z "$as_dir" && as_dir=.
-  echo "PATH: $as_dir"
+  $as_echo "PATH: $as_dir"
 done
+IFS=$as_save_IFS
 
 } >&5
 
@@ -1035,7 +1533,6 @@ _ACEOF
 ac_configure_args=
 ac_configure_args0=
 ac_configure_args1=
-ac_sep=
 ac_must_keep_next=false
 for ac_pass in 1 2
 do
@@ -1046,8 +1543,8 @@ do
     -q | -quiet | --quiet | --quie | --qui | --qu | --q \
     | -silent | --silent | --silen | --sile | --sil)
       continue ;;
-    *" "*|*"	"*|*[\[\]\~\#\$\^\&\*\(\)\{\}\\\|\;\<\>\?\"\']*)
-      ac_arg=`echo "$ac_arg" | sed "s/'/'\\\\\\\\''/g"` ;;
+    *\'*)
+      ac_arg=`$as_echo "$ac_arg" | sed "s/'/'\\\\\\\\''/g"` ;;
     esac
     case $ac_pass in
     1) ac_configure_args0="$ac_configure_args0 '$ac_arg'" ;;
@@ -1068,9 +1565,7 @@ do
 	  -* ) ac_must_keep_next=true ;;
 	esac
       fi
-      ac_configure_args="$ac_configure_args$ac_sep'$ac_arg'"
-      # Get rid of the leading space.
-      ac_sep=" "
+      ac_configure_args="$ac_configure_args '$ac_arg'"
       ;;
     esac
   done
@@ -1081,8 +1576,8 @@ $as_unset ac_configure_args1 || test "${ac_configure_args1+set}" != set || { ac_
 # When interrupted or exit'd, cleanup temporary files, and complete
 # config.log.  We remove comments because anyway the quotes in there
 # would cause problems or look ugly.
-# WARNING: Be sure not to use single quotes in there, as some shells,
-# such as our DU 5.0 friend, will then `close' the trap.
+# WARNING: Use '\'' to represent an apostrophe within the trap.
+# WARNING: Do not start the trap code with a newline, due to a FreeBSD 4.0 bug.
 trap 'exit_status=$?
   # Save into config.log some information that might help in debugging.
   {
@@ -1095,20 +1590,35 @@ trap 'exit_status=$?
 _ASBOX
     echo
     # The following way of writing the cache mishandles newlines in values,
-{
+(
+  for ac_var in `(set) 2>&1 | sed -n '\''s/^\([a-zA-Z_][a-zA-Z0-9_]*\)=.*/\1/p'\''`; do
+    eval ac_val=\$$ac_var
+    case $ac_val in #(
+    *${as_nl}*)
+      case $ac_var in #(
+      *_cv_*) { $as_echo "$as_me:$LINENO: WARNING: cache variable $ac_var contains a newline" >&5
+$as_echo "$as_me: WARNING: cache variable $ac_var contains a newline" >&2;} ;;
+      esac
+      case $ac_var in #(
+      _ | IFS | as_nl) ;; #(
+      BASH_ARGV | BASH_SOURCE) eval $ac_var= ;; #(
+      *) $as_unset $ac_var ;;
+      esac ;;
+    esac
+  done
   (set) 2>&1 |
-    case `(ac_space='"'"' '"'"'; set | grep ac_space) 2>&1` in
-    *ac_space=\ *)
+    case $as_nl`(ac_space='\'' '\''; set) 2>&1` in #(
+    *${as_nl}ac_space=\ *)
       sed -n \
-	"s/'"'"'/'"'"'\\\\'"'"''"'"'/g;
-	  s/^\\([_$as_cr_alnum]*_cv_[_$as_cr_alnum]*\\)=\\(.*\\)/\\1='"'"'\\2'"'"'/p"
-      ;;
+	"s/'\''/'\''\\\\'\'''\''/g;
+	  s/^\\([_$as_cr_alnum]*_cv_[_$as_cr_alnum]*\\)=\\(.*\\)/\\1='\''\\2'\''/p"
+      ;; #(
     *)
-      sed -n \
-	"s/^\\([_$as_cr_alnum]*_cv_[_$as_cr_alnum]*\\)=\\(.*\\)/\\1=\\2/p"
+      sed -n "/^[_$as_cr_alnum]*_cv_[_$as_cr_alnum]*=/p"
       ;;
-    esac;
-}
+    esac |
+    sort
+)
     echo
 
     cat <<\_ASBOX
@@ -1119,22 +1629,28 @@ _ASBOX
     echo
     for ac_var in $ac_subst_vars
     do
-      eval ac_val=$`echo $ac_var`
-      echo "$ac_var='"'"'$ac_val'"'"'"
+      eval ac_val=\$$ac_var
+      case $ac_val in
+      *\'\''*) ac_val=`$as_echo "$ac_val" | sed "s/'\''/'\''\\\\\\\\'\'''\''/g"`;;
+      esac
+      $as_echo "$ac_var='\''$ac_val'\''"
     done | sort
     echo
 
     if test -n "$ac_subst_files"; then
       cat <<\_ASBOX
-## ------------- ##
-## Output files. ##
-## ------------- ##
+## ------------------- ##
+## File substitutions. ##
+## ------------------- ##
 _ASBOX
       echo
       for ac_var in $ac_subst_files
       do
-	eval ac_val=$`echo $ac_var`
-	echo "$ac_var='"'"'$ac_val'"'"'"
+	eval ac_val=\$$ac_var
+	case $ac_val in
+	*\'\''*) ac_val=`$as_echo "$ac_val" | sed "s/'\''/'\''\\\\\\\\'\'''\''/g"`;;
+	esac
+	$as_echo "$ac_var='\''$ac_val'\''"
       done | sort
       echo
     fi
@@ -1146,26 +1662,24 @@ _ASBOX
 ## ----------- ##
 _ASBOX
       echo
-      sed "/^$/d" confdefs.h | sort
+      cat confdefs.h
       echo
     fi
     test "$ac_signal" != 0 &&
-      echo "$as_me: caught signal $ac_signal"
-    echo "$as_me: exit $exit_status"
+      $as_echo "$as_me: caught signal $ac_signal"
+    $as_echo "$as_me: exit $exit_status"
   } >&5
-  rm -f core *.core &&
-  rm -rf conftest* confdefs* conf$$* $ac_clean_files &&
+  rm -f core *.core core.conftest.* &&
+    rm -f -r conftest* confdefs* conf$$* $ac_clean_files &&
     exit $exit_status
-     ' 0
+' 0
 for ac_signal in 1 2 13 15; do
   trap 'ac_signal='$ac_signal'; { (exit 1); exit 1; }' $ac_signal
 done
 ac_signal=0
 
 # confdefs.h avoids OS command line length limits that DEFS can exceed.
-rm -rf conftest* confdefs.h
-# AIX cpp loses on an empty file, so make sure it contains at least a newline.
-echo >confdefs.h
+rm -f -r conftest* confdefs.h
 
 # Predefined preprocessor variables.
 
@@ -1195,18 +1709,24 @@ _ACEOF
 
 
 # Let the site file select an alternate cache file if it wants to.
-# Prefer explicitly selected file to automatically selected ones.
-if test -z "$CONFIG_SITE"; then
-  if test "x$prefix" != xNONE; then
-    CONFIG_SITE="$prefix/share/config.site $prefix/etc/config.site"
-  else
-    CONFIG_SITE="$ac_default_prefix/share/config.site $ac_default_prefix/etc/config.site"
-  fi
+# Prefer an explicitly selected file to automatically selected ones.
+ac_site_file1=NONE
+ac_site_file2=NONE
+if test -n "$CONFIG_SITE"; then
+  ac_site_file1=$CONFIG_SITE
+elif test "x$prefix" != xNONE; then
+  ac_site_file1=$prefix/share/config.site
+  ac_site_file2=$prefix/etc/config.site
+else
+  ac_site_file1=$ac_default_prefix/share/config.site
+  ac_site_file2=$ac_default_prefix/etc/config.site
 fi
-for ac_site_file in $CONFIG_SITE; do
+for ac_site_file in "$ac_site_file1" "$ac_site_file2"
+do
+  test "x$ac_site_file" = xNONE && continue
   if test -r "$ac_site_file"; then
-    { echo "$as_me:$LINENO: loading site script $ac_site_file" >&5
-echo "$as_me: loading site script $ac_site_file" >&6;}
+    { $as_echo "$as_me:$LINENO: loading site script $ac_site_file" >&5
+$as_echo "$as_me: loading site script $ac_site_file" >&6;}
     sed 's/^/| /' "$ac_site_file" >&5
     . "$ac_site_file"
   fi
@@ -1216,54 +1736,61 @@ if test -r "$cache_file"; then
   # Some versions of bash will fail to source /dev/null (special
   # files actually), so we avoid doing that.
   if test -f "$cache_file"; then
-    { echo "$as_me:$LINENO: loading cache $cache_file" >&5
-echo "$as_me: loading cache $cache_file" >&6;}
+    { $as_echo "$as_me:$LINENO: loading cache $cache_file" >&5
+$as_echo "$as_me: loading cache $cache_file" >&6;}
     case $cache_file in
-      [\\/]* | ?:[\\/]* ) . $cache_file;;
-      *)                      . ./$cache_file;;
+      [\\/]* | ?:[\\/]* ) . "$cache_file";;
+      *)                      . "./$cache_file";;
     esac
   fi
 else
-  { echo "$as_me:$LINENO: creating cache $cache_file" >&5
-echo "$as_me: creating cache $cache_file" >&6;}
+  { $as_echo "$as_me:$LINENO: creating cache $cache_file" >&5
+$as_echo "$as_me: creating cache $cache_file" >&6;}
   >$cache_file
 fi
 
 # Check that the precious variables saved in the cache have kept the same
 # value.
 ac_cache_corrupted=false
-for ac_var in `(set) 2>&1 |
-	       sed -n 's/^ac_env_\([a-zA-Z_0-9]*\)_set=.*/\1/p'`; do
+for ac_var in $ac_precious_vars; do
   eval ac_old_set=\$ac_cv_env_${ac_var}_set
   eval ac_new_set=\$ac_env_${ac_var}_set
-  eval ac_old_val="\$ac_cv_env_${ac_var}_value"
-  eval ac_new_val="\$ac_env_${ac_var}_value"
+  eval ac_old_val=\$ac_cv_env_${ac_var}_value
+  eval ac_new_val=\$ac_env_${ac_var}_value
   case $ac_old_set,$ac_new_set in
     set,)
-      { echo "$as_me:$LINENO: error: \`$ac_var' was set to \`$ac_old_val' in the previous run" >&5
-echo "$as_me: error: \`$ac_var' was set to \`$ac_old_val' in the previous run" >&2;}
+      { $as_echo "$as_me:$LINENO: error: \`$ac_var' was set to \`$ac_old_val' in the previous run" >&5
+$as_echo "$as_me: error: \`$ac_var' was set to \`$ac_old_val' in the previous run" >&2;}
       ac_cache_corrupted=: ;;
     ,set)
-      { echo "$as_me:$LINENO: error: \`$ac_var' was not set in the previous run" >&5
-echo "$as_me: error: \`$ac_var' was not set in the previous run" >&2;}
+      { $as_echo "$as_me:$LINENO: error: \`$ac_var' was not set in the previous run" >&5
+$as_echo "$as_me: error: \`$ac_var' was not set in the previous run" >&2;}
       ac_cache_corrupted=: ;;
     ,);;
     *)
       if test "x$ac_old_val" != "x$ac_new_val"; then
-	{ echo "$as_me:$LINENO: error: \`$ac_var' has changed since the previous run:" >&5
-echo "$as_me: error: \`$ac_var' has changed since the previous run:" >&2;}
-	{ echo "$as_me:$LINENO:   former value:  $ac_old_val" >&5
-echo "$as_me:   former value:  $ac_old_val" >&2;}
-	{ echo "$as_me:$LINENO:   current value: $ac_new_val" >&5
-echo "$as_me:   current value: $ac_new_val" >&2;}
-	ac_cache_corrupted=:
+	# differences in whitespace do not lead to failure.
+	ac_old_val_w=`echo x $ac_old_val`
+	ac_new_val_w=`echo x $ac_new_val`
+	if test "$ac_old_val_w" != "$ac_new_val_w"; then
+	  { $as_echo "$as_me:$LINENO: error: \`$ac_var' has changed since the previous run:" >&5
+$as_echo "$as_me: error: \`$ac_var' has changed since the previous run:" >&2;}
+	  ac_cache_corrupted=:
+	else
+	  { $as_echo "$as_me:$LINENO: warning: ignoring whitespace changes in \`$ac_var' since the previous run:" >&5
+$as_echo "$as_me: warning: ignoring whitespace changes in \`$ac_var' since the previous run:" >&2;}
+	  eval $ac_var=\$ac_old_val
+	fi
+	{ $as_echo "$as_me:$LINENO:   former value:  \`$ac_old_val'" >&5
+$as_echo "$as_me:   former value:  \`$ac_old_val'" >&2;}
+	{ $as_echo "$as_me:$LINENO:   current value: \`$ac_new_val'" >&5
+$as_echo "$as_me:   current value: \`$ac_new_val'" >&2;}
       fi;;
   esac
   # Pass precious variables to config.status.
   if test "$ac_new_set" = set; then
     case $ac_new_val in
-    *" "*|*"	"*|*[\[\]\~\#\$\^\&\*\(\)\{\}\\\|\;\<\>\?\"\']*)
-      ac_arg=$ac_var=`echo "$ac_new_val" | sed "s/'/'\\\\\\\\''/g"` ;;
+    *\'*) ac_arg=$ac_var=`$as_echo "$ac_new_val" | sed "s/'/'\\\\\\\\''/g"` ;;
     *) ac_arg=$ac_var=$ac_new_val ;;
     esac
     case " $ac_configure_args " in
@@ -1273,18 +1800,15 @@ echo "$as_me:   current value: $ac_new_val" >&2;}
   fi
 done
 if $ac_cache_corrupted; then
-  { echo "$as_me:$LINENO: error: changes in the environment can compromise the build" >&5
-echo "$as_me: error: changes in the environment can compromise the build" >&2;}
-  { { echo "$as_me:$LINENO: error: run \`make distclean' and/or \`rm $cache_file' and start over" >&5
-echo "$as_me: error: run \`make distclean' and/or \`rm $cache_file' and start over" >&2;}
+  { $as_echo "$as_me:$LINENO: error: in \`$ac_pwd':" >&5
+$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+  { $as_echo "$as_me:$LINENO: error: changes in the environment can compromise the build" >&5
+$as_echo "$as_me: error: changes in the environment can compromise the build" >&2;}
+  { { $as_echo "$as_me:$LINENO: error: run \`make distclean' and/or \`rm $cache_file' and start over" >&5
+$as_echo "$as_me: error: run \`make distclean' and/or \`rm $cache_file' and start over" >&2;}
    { (exit 1); exit 1; }; }
 fi
 
-ac_ext=c
-ac_cpp='$CPP $CPPFLAGS'
-ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
-ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
-ac_compiler_gnu=$ac_cv_c_compiler_gnu
 
 
 
@@ -1301,177 +1825,295 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
 
 
 
+ac_ext=c
+ac_cpp='$CPP $CPPFLAGS'
+ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
+ac_compiler_gnu=$ac_cv_c_compiler_gnu
+
+
+
 
+# Check whether --with-zlib-prefix was given.
+if test "${with_zlib_prefix+set}" = set; then
+  withval=$with_zlib_prefix;  ac_zlib_prefix=$withval
+else
+   ac_zlib_prefix=NONE
 
+fi
 
 
 
-# Check whether --with-libbfd or --without-libbfd was given.
+# Check whether --with-libbfd was given.
 if test "${with_libbfd+set}" = set; then
-  withval="$with_libbfd"
-   ac_libbfd=$withval
+  withval=$with_libbfd;  ac_libbfd=$withval
 else
    ac_libbfd=NONE
 
-fi;
+fi
+
 
 
-# Check whether --with-libiberty or --without-libiberty was given.
+# Check whether --with-libiberty was given.
 if test "${with_libiberty+set}" = set; then
-  withval="$with_libiberty"
-   ac_libiberty=$withval
+  withval=$with_libiberty;  ac_libiberty=$withval
 else
    ac_libiberty=NONE
 
-fi;
+fi
+
 
 
-# Check whether --with-bfd-include-dir or --without-bfd-include-dir was given.
+# Check whether --with-bfd-include-dir was given.
 if test "${with_bfd_include_dir+set}" = set; then
-  withval="$with_bfd_include_dir"
-   ac_bfd_include_dir=$withval
+  withval=$with_bfd_include_dir;  ac_bfd_include_dir=$withval
 else
    ac_bfd_include_dir=NONE
 
-fi;
+fi
+
 
 
-# Check whether --with-binutils-include-dir or --without-binutils-include-dir was given.
+# Check whether --with-binutils-include-dir was given.
 if test "${with_binutils_include_dir+set}" = set; then
-  withval="$with_binutils_include_dir"
-   ac_binutils_include_dir=$withval
+  withval=$with_binutils_include_dir;  ac_binutils_include_dir=$withval
 else
    ac_binutils_include_dir=NONE
 
-fi;
+fi
+
 
 
-# Check whether --with-binutils-ldscript-dir or --without-binutils-ldscript-dir was given.
+# Check whether --with-binutils-ldscript-dir was given.
 if test "${with_binutils_ldscript_dir+set}" = set; then
-  withval="$with_binutils_ldscript_dir"
-   ac_binutils_ldscript_dir=$withval
+  withval=$with_binutils_ldscript_dir;  ac_binutils_ldscript_dir=$withval
 else
    ac_binutils_ldscript_dir=NONE
 
-fi;
+fi
+
+
+
+# Check whether --with-binutils-build-dir was given.
+if test "${with_binutils_build_dir+set}" = set; then
+  withval=$with_binutils_build_dir;  ac_binutils_build_dir=$withval
+else
+   ac_binutils_build_dir=NONE
+
+fi
+
+
+# Check whether --enable-ld-elf2flt-binary was given.
+if test "${enable_ld_elf2flt_binary+set}" = set; then
+  enableval=$enable_ld_elf2flt_binary;  use_ld_elf2flt_binary=$enableval
+else
+   use_ld_elf2flt_binary=yes
+
+fi
+
+
+var_yn_to_10() {
+	if eval test \"\$$1\" = yes ; then
+		eval $1=1
+	else
+		eval $1=0
+	fi
+}
 
-# Check whether --enable-got-check or --disable-got-check was given.
+# Check whether --enable-got-check was given.
 if test "${enable_got_check+set}" = set; then
-  enableval="$enable_got_check"
-   got_check=$enableval
+  enableval=$enable_got_check;  got_check=$enableval
 else
    got_check=yes
 
-fi;
+fi
+
+var_yn_to_10 got_check
 
-# Check whether --enable-emit_relocs or --disable-emit_relocs was given.
+# Check whether --enable-emit-relocs was given.
 if test "${enable_emit_relocs+set}" = set; then
-  enableval="$enable_emit_relocs"
-   emit_relocs=$enableval
+  enableval=$enable_emit_relocs;  emit_relocs=$enableval
 else
    emit_relocs=yes
 
-fi;
+fi
+
+var_yn_to_10 emit_relocs
+
+# Check whether --enable-emit-ctor-dtor was given.
+if test "${enable_emit_ctor_dtor+set}" = set; then
+  enableval=$enable_emit_ctor_dtor;  emit_ctor_dtor=$enableval
+else
+   emit_ctor_dtor=no
+
+fi
+
+var_yn_to_10 emit_ctor_dtor
+
+# Check whether --enable-always-reloc-text was given.
+if test "${enable_always_reloc_text+set}" = set; then
+  enableval=$enable_always_reloc_text;  always_reloc_text=$enableval
+else
+
+	case $target in
+		bfin*) always_reloc_text=yes;;
+		*)     always_reloc_text=no;;
+	esac
+
+
+fi
+
+var_yn_to_10 always_reloc_text
 
 ac_aux_dir=
-for ac_dir in $srcdir $srcdir/.. $srcdir/../..; do
-  if test -f $ac_dir/install-sh; then
+for ac_dir in "$srcdir" "$srcdir/.." "$srcdir/../.."; do
+  if test -f "$ac_dir/install-sh"; then
     ac_aux_dir=$ac_dir
     ac_install_sh="$ac_aux_dir/install-sh -c"
     break
-  elif test -f $ac_dir/install.sh; then
+  elif test -f "$ac_dir/install.sh"; then
     ac_aux_dir=$ac_dir
     ac_install_sh="$ac_aux_dir/install.sh -c"
     break
-  elif test -f $ac_dir/shtool; then
+  elif test -f "$ac_dir/shtool"; then
     ac_aux_dir=$ac_dir
     ac_install_sh="$ac_aux_dir/shtool install -c"
     break
   fi
 done
 if test -z "$ac_aux_dir"; then
-  { { echo "$as_me:$LINENO: error: cannot find install-sh or install.sh in $srcdir $srcdir/.. $srcdir/../.." >&5
-echo "$as_me: error: cannot find install-sh or install.sh in $srcdir $srcdir/.. $srcdir/../.." >&2;}
+  { { $as_echo "$as_me:$LINENO: error: cannot find install-sh or install.sh in \"$srcdir\" \"$srcdir/..\" \"$srcdir/../..\"" >&5
+$as_echo "$as_me: error: cannot find install-sh or install.sh in \"$srcdir\" \"$srcdir/..\" \"$srcdir/../..\"" >&2;}
    { (exit 1); exit 1; }; }
 fi
-ac_config_guess="$SHELL $ac_aux_dir/config.guess"
-ac_config_sub="$SHELL $ac_aux_dir/config.sub"
-ac_configure="$SHELL $ac_aux_dir/configure" # This should be Cygnus configure.
+
+# These three variables are undocumented and unsupported,
+# and are intended to be withdrawn in a future Autoconf release.
+# They can cause serious problems if a builder's source tree is in a directory
+# whose full name contains unusual characters.
+ac_config_guess="$SHELL $ac_aux_dir/config.guess"  # Please don't use this var.
+ac_config_sub="$SHELL $ac_aux_dir/config.sub"  # Please don't use this var.
+ac_configure="$SHELL $ac_aux_dir/configure"  # Please don't use this var.
+
 
 # Make sure we can run config.sub.
-$ac_config_sub sun4 >/dev/null 2>&1 ||
-  { { echo "$as_me:$LINENO: error: cannot run $ac_config_sub" >&5
-echo "$as_me: error: cannot run $ac_config_sub" >&2;}
+$SHELL "$ac_aux_dir/config.sub" sun4 >/dev/null 2>&1 ||
+  { { $as_echo "$as_me:$LINENO: error: cannot run $SHELL $ac_aux_dir/config.sub" >&5
+$as_echo "$as_me: error: cannot run $SHELL $ac_aux_dir/config.sub" >&2;}
    { (exit 1); exit 1; }; }
 
-echo "$as_me:$LINENO: checking build system type" >&5
-echo $ECHO_N "checking build system type... $ECHO_C" >&6
+{ $as_echo "$as_me:$LINENO: checking build system type" >&5
+$as_echo_n "checking build system type... " >&6; }
 if test "${ac_cv_build+set}" = set; then
-  echo $ECHO_N "(cached) $ECHO_C" >&6
-else
-  ac_cv_build_alias=$build_alias
-test -z "$ac_cv_build_alias" &&
-  ac_cv_build_alias=`$ac_config_guess`
-test -z "$ac_cv_build_alias" &&
-  { { echo "$as_me:$LINENO: error: cannot guess build type; you must specify one" >&5
-echo "$as_me: error: cannot guess build type; you must specify one" >&2;}
+  $as_echo_n "(cached) " >&6
+else
+  ac_build_alias=$build_alias
+test "x$ac_build_alias" = x &&
+  ac_build_alias=`$SHELL "$ac_aux_dir/config.guess"`
+test "x$ac_build_alias" = x &&
+  { { $as_echo "$as_me:$LINENO: error: cannot guess build type; you must specify one" >&5
+$as_echo "$as_me: error: cannot guess build type; you must specify one" >&2;}
    { (exit 1); exit 1; }; }
-ac_cv_build=`$ac_config_sub $ac_cv_build_alias` ||
-  { { echo "$as_me:$LINENO: error: $ac_config_sub $ac_cv_build_alias failed" >&5
-echo "$as_me: error: $ac_config_sub $ac_cv_build_alias failed" >&2;}
+ac_cv_build=`$SHELL "$ac_aux_dir/config.sub" $ac_build_alias` ||
+  { { $as_echo "$as_me:$LINENO: error: $SHELL $ac_aux_dir/config.sub $ac_build_alias failed" >&5
+$as_echo "$as_me: error: $SHELL $ac_aux_dir/config.sub $ac_build_alias failed" >&2;}
    { (exit 1); exit 1; }; }
 
 fi
-echo "$as_me:$LINENO: result: $ac_cv_build" >&5
-echo "${ECHO_T}$ac_cv_build" >&6
+{ $as_echo "$as_me:$LINENO: result: $ac_cv_build" >&5
+$as_echo "$ac_cv_build" >&6; }
+case $ac_cv_build in
+*-*-*) ;;
+*) { { $as_echo "$as_me:$LINENO: error: invalid value of canonical build" >&5
+$as_echo "$as_me: error: invalid value of canonical build" >&2;}
+   { (exit 1); exit 1; }; };;
+esac
 build=$ac_cv_build
-build_cpu=`echo $ac_cv_build | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\1/'`
-build_vendor=`echo $ac_cv_build | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\2/'`
-build_os=`echo $ac_cv_build | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\3/'`
-
-
-echo "$as_me:$LINENO: checking host system type" >&5
-echo $ECHO_N "checking host system type... $ECHO_C" >&6
+ac_save_IFS=$IFS; IFS='-'
+set x $ac_cv_build
+shift
+build_cpu=$1
+build_vendor=$2
+shift; shift
+# Remember, the first character of IFS is used to create $*,
+# except with old shells:
+build_os=$*
+IFS=$ac_save_IFS
+case $build_os in *\ *) build_os=`echo "$build_os" | sed 's/ /-/g'`;; esac
+
+
+{ $as_echo "$as_me:$LINENO: checking host system type" >&5
+$as_echo_n "checking host system type... " >&6; }
 if test "${ac_cv_host+set}" = set; then
-  echo $ECHO_N "(cached) $ECHO_C" >&6
-else
-  ac_cv_host_alias=$host_alias
-test -z "$ac_cv_host_alias" &&
-  ac_cv_host_alias=$ac_cv_build_alias
-ac_cv_host=`$ac_config_sub $ac_cv_host_alias` ||
-  { { echo "$as_me:$LINENO: error: $ac_config_sub $ac_cv_host_alias failed" >&5
-echo "$as_me: error: $ac_config_sub $ac_cv_host_alias failed" >&2;}
+  $as_echo_n "(cached) " >&6
+else
+  if test "x$host_alias" = x; then
+  ac_cv_host=$ac_cv_build
+else
+  ac_cv_host=`$SHELL "$ac_aux_dir/config.sub" $host_alias` ||
+    { { $as_echo "$as_me:$LINENO: error: $SHELL $ac_aux_dir/config.sub $host_alias failed" >&5
+$as_echo "$as_me: error: $SHELL $ac_aux_dir/config.sub $host_alias failed" >&2;}
    { (exit 1); exit 1; }; }
+fi
 
 fi
-echo "$as_me:$LINENO: result: $ac_cv_host" >&5
-echo "${ECHO_T}$ac_cv_host" >&6
+{ $as_echo "$as_me:$LINENO: result: $ac_cv_host" >&5
+$as_echo "$ac_cv_host" >&6; }
+case $ac_cv_host in
+*-*-*) ;;
+*) { { $as_echo "$as_me:$LINENO: error: invalid value of canonical host" >&5
+$as_echo "$as_me: error: invalid value of canonical host" >&2;}
+   { (exit 1); exit 1; }; };;
+esac
 host=$ac_cv_host
-host_cpu=`echo $ac_cv_host | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\1/'`
-host_vendor=`echo $ac_cv_host | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\2/'`
-host_os=`echo $ac_cv_host | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\3/'`
-
-
-echo "$as_me:$LINENO: checking target system type" >&5
-echo $ECHO_N "checking target system type... $ECHO_C" >&6
+ac_save_IFS=$IFS; IFS='-'
+set x $ac_cv_host
+shift
+host_cpu=$1
+host_vendor=$2
+shift; shift
+# Remember, the first character of IFS is used to create $*,
+# except with old shells:
+host_os=$*
+IFS=$ac_save_IFS
+case $host_os in *\ *) host_os=`echo "$host_os" | sed 's/ /-/g'`;; esac
+
+
+{ $as_echo "$as_me:$LINENO: checking target system type" >&5
+$as_echo_n "checking target system type... " >&6; }
 if test "${ac_cv_target+set}" = set; then
-  echo $ECHO_N "(cached) $ECHO_C" >&6
-else
-  ac_cv_target_alias=$target_alias
-test "x$ac_cv_target_alias" = "x" &&
-  ac_cv_target_alias=$ac_cv_host_alias
-ac_cv_target=`$ac_config_sub $ac_cv_target_alias` ||
-  { { echo "$as_me:$LINENO: error: $ac_config_sub $ac_cv_target_alias failed" >&5
-echo "$as_me: error: $ac_config_sub $ac_cv_target_alias failed" >&2;}
+  $as_echo_n "(cached) " >&6
+else
+  if test "x$target_alias" = x; then
+  ac_cv_target=$ac_cv_host
+else
+  ac_cv_target=`$SHELL "$ac_aux_dir/config.sub" $target_alias` ||
+    { { $as_echo "$as_me:$LINENO: error: $SHELL $ac_aux_dir/config.sub $target_alias failed" >&5
+$as_echo "$as_me: error: $SHELL $ac_aux_dir/config.sub $target_alias failed" >&2;}
    { (exit 1); exit 1; }; }
+fi
 
 fi
-echo "$as_me:$LINENO: result: $ac_cv_target" >&5
-echo "${ECHO_T}$ac_cv_target" >&6
+{ $as_echo "$as_me:$LINENO: result: $ac_cv_target" >&5
+$as_echo "$ac_cv_target" >&6; }
+case $ac_cv_target in
+*-*-*) ;;
+*) { { $as_echo "$as_me:$LINENO: error: invalid value of canonical target" >&5
+$as_echo "$as_me: error: invalid value of canonical target" >&2;}
+   { (exit 1); exit 1; }; };;
+esac
 target=$ac_cv_target
-target_cpu=`echo $ac_cv_target | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\1/'`
-target_vendor=`echo $ac_cv_target | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\2/'`
-target_os=`echo $ac_cv_target | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\3/'`
+ac_save_IFS=$IFS; IFS='-'
+set x $ac_cv_target
+shift
+target_cpu=$1
+target_vendor=$2
+shift; shift
+# Remember, the first character of IFS is used to create $*,
+# except with old shells:
+target_os=$*
+IFS=$ac_save_IFS
+case $target_os in *\ *) target_os=`echo "$target_os" | sed 's/ /-/g'`;; esac
 
 
 # The aliases save the names the user supplied, while $host etc.
@@ -1489,10 +2131,10 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
 if test -n "$ac_tool_prefix"; then
   # Extract the first word of "${ac_tool_prefix}gcc", so it can be a program name with args.
 set dummy ${ac_tool_prefix}gcc; ac_word=$2
-echo "$as_me:$LINENO: checking for $ac_word" >&5
-echo $ECHO_N "checking for $ac_word... $ECHO_C" >&6
+{ $as_echo "$as_me:$LINENO: checking for $ac_word" >&5
+$as_echo_n "checking for $ac_word... " >&6; }
 if test "${ac_cv_prog_CC+set}" = set; then
-  echo $ECHO_N "(cached) $ECHO_C" >&6
+  $as_echo_n "(cached) " >&6
 else
   if test -n "$CC"; then
   ac_cv_prog_CC="$CC" # Let the user override the test.
@@ -1503,34 +2145,36 @@ do
   IFS=$as_save_IFS
   test -z "$as_dir" && as_dir=.
   for ac_exec_ext in '' $ac_executable_extensions; do
-  if $as_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
     ac_cv_prog_CC="${ac_tool_prefix}gcc"
-    echo "$as_me:$LINENO: found $as_dir/$ac_word$ac_exec_ext" >&5
+    $as_echo "$as_me:$LINENO: found $as_dir/$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
 done
+IFS=$as_save_IFS
 
 fi
 fi
 CC=$ac_cv_prog_CC
 if test -n "$CC"; then
-  echo "$as_me:$LINENO: result: $CC" >&5
-echo "${ECHO_T}$CC" >&6
+  { $as_echo "$as_me:$LINENO: result: $CC" >&5
+$as_echo "$CC" >&6; }
 else
-  echo "$as_me:$LINENO: result: no" >&5
-echo "${ECHO_T}no" >&6
+  { $as_echo "$as_me:$LINENO: result: no" >&5
+$as_echo "no" >&6; }
 fi
 
+
 fi
 if test -z "$ac_cv_prog_CC"; then
   ac_ct_CC=$CC
   # Extract the first word of "gcc", so it can be a program name with args.
 set dummy gcc; ac_word=$2
-echo "$as_me:$LINENO: checking for $ac_word" >&5
-echo $ECHO_N "checking for $ac_word... $ECHO_C" >&6
+{ $as_echo "$as_me:$LINENO: checking for $ac_word" >&5
+$as_echo_n "checking for $ac_word... " >&6; }
 if test "${ac_cv_prog_ac_ct_CC+set}" = set; then
-  echo $ECHO_N "(cached) $ECHO_C" >&6
+  $as_echo_n "(cached) " >&6
 else
   if test -n "$ac_ct_CC"; then
   ac_cv_prog_ac_ct_CC="$ac_ct_CC" # Let the user override the test.
@@ -1541,38 +2185,49 @@ do
   IFS=$as_save_IFS
   test -z "$as_dir" && as_dir=.
   for ac_exec_ext in '' $ac_executable_extensions; do
-  if $as_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
     ac_cv_prog_ac_ct_CC="gcc"
-    echo "$as_me:$LINENO: found $as_dir/$ac_word$ac_exec_ext" >&5
+    $as_echo "$as_me:$LINENO: found $as_dir/$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
 done
+IFS=$as_save_IFS
 
 fi
 fi
 ac_ct_CC=$ac_cv_prog_ac_ct_CC
 if test -n "$ac_ct_CC"; then
-  echo "$as_me:$LINENO: result: $ac_ct_CC" >&5
-echo "${ECHO_T}$ac_ct_CC" >&6
+  { $as_echo "$as_me:$LINENO: result: $ac_ct_CC" >&5
+$as_echo "$ac_ct_CC" >&6; }
 else
-  echo "$as_me:$LINENO: result: no" >&5
-echo "${ECHO_T}no" >&6
+  { $as_echo "$as_me:$LINENO: result: no" >&5
+$as_echo "no" >&6; }
 fi
 
-  CC=$ac_ct_CC
+  if test "x$ac_ct_CC" = x; then
+    CC=""
+  else
+    case $cross_compiling:$ac_tool_warned in
+yes:)
+{ $as_echo "$as_me:$LINENO: WARNING: using cross tools not prefixed with host triplet" >&5
+$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
+ac_tool_warned=yes ;;
+esac
+    CC=$ac_ct_CC
+  fi
 else
   CC="$ac_cv_prog_CC"
 fi
 
 if test -z "$CC"; then
-  if test -n "$ac_tool_prefix"; then
-  # Extract the first word of "${ac_tool_prefix}cc", so it can be a program name with args.
+          if test -n "$ac_tool_prefix"; then
+    # Extract the first word of "${ac_tool_prefix}cc", so it can be a program name with args.
 set dummy ${ac_tool_prefix}cc; ac_word=$2
-echo "$as_me:$LINENO: checking for $ac_word" >&5
-echo $ECHO_N "checking for $ac_word... $ECHO_C" >&6
+{ $as_echo "$as_me:$LINENO: checking for $ac_word" >&5
+$as_echo_n "checking for $ac_word... " >&6; }
 if test "${ac_cv_prog_CC+set}" = set; then
-  echo $ECHO_N "(cached) $ECHO_C" >&6
+  $as_echo_n "(cached) " >&6
 else
   if test -n "$CC"; then
   ac_cv_prog_CC="$CC" # Let the user override the test.
@@ -1583,76 +2238,36 @@ do
   IFS=$as_save_IFS
   test -z "$as_dir" && as_dir=.
   for ac_exec_ext in '' $ac_executable_extensions; do
-  if $as_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
     ac_cv_prog_CC="${ac_tool_prefix}cc"
-    echo "$as_me:$LINENO: found $as_dir/$ac_word$ac_exec_ext" >&5
+    $as_echo "$as_me:$LINENO: found $as_dir/$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
 done
+IFS=$as_save_IFS
 
 fi
 fi
 CC=$ac_cv_prog_CC
 if test -n "$CC"; then
-  echo "$as_me:$LINENO: result: $CC" >&5
-echo "${ECHO_T}$CC" >&6
-else
-  echo "$as_me:$LINENO: result: no" >&5
-echo "${ECHO_T}no" >&6
-fi
-
-fi
-if test -z "$ac_cv_prog_CC"; then
-  ac_ct_CC=$CC
-  # Extract the first word of "cc", so it can be a program name with args.
-set dummy cc; ac_word=$2
-echo "$as_me:$LINENO: checking for $ac_word" >&5
-echo $ECHO_N "checking for $ac_word... $ECHO_C" >&6
-if test "${ac_cv_prog_ac_ct_CC+set}" = set; then
-  echo $ECHO_N "(cached) $ECHO_C" >&6
-else
-  if test -n "$ac_ct_CC"; then
-  ac_cv_prog_ac_ct_CC="$ac_ct_CC" # Let the user override the test.
-else
-as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
-for as_dir in $PATH
-do
-  IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
-  for ac_exec_ext in '' $ac_executable_extensions; do
-  if $as_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
-    ac_cv_prog_ac_ct_CC="cc"
-    echo "$as_me:$LINENO: found $as_dir/$ac_word$ac_exec_ext" >&5
-    break 2
-  fi
-done
-done
-
-fi
-fi
-ac_ct_CC=$ac_cv_prog_ac_ct_CC
-if test -n "$ac_ct_CC"; then
-  echo "$as_me:$LINENO: result: $ac_ct_CC" >&5
-echo "${ECHO_T}$ac_ct_CC" >&6
+  { $as_echo "$as_me:$LINENO: result: $CC" >&5
+$as_echo "$CC" >&6; }
 else
-  echo "$as_me:$LINENO: result: no" >&5
-echo "${ECHO_T}no" >&6
+  { $as_echo "$as_me:$LINENO: result: no" >&5
+$as_echo "no" >&6; }
 fi
 
-  CC=$ac_ct_CC
-else
-  CC="$ac_cv_prog_CC"
-fi
 
+  fi
 fi
 if test -z "$CC"; then
   # Extract the first word of "cc", so it can be a program name with args.
 set dummy cc; ac_word=$2
-echo "$as_me:$LINENO: checking for $ac_word" >&5
-echo $ECHO_N "checking for $ac_word... $ECHO_C" >&6
+{ $as_echo "$as_me:$LINENO: checking for $ac_word" >&5
+$as_echo_n "checking for $ac_word... " >&6; }
 if test "${ac_cv_prog_CC+set}" = set; then
-  echo $ECHO_N "(cached) $ECHO_C" >&6
+  $as_echo_n "(cached) " >&6
 else
   if test -n "$CC"; then
   ac_cv_prog_CC="$CC" # Let the user override the test.
@@ -1664,17 +2279,18 @@ do
   IFS=$as_save_IFS
   test -z "$as_dir" && as_dir=.
   for ac_exec_ext in '' $ac_executable_extensions; do
-  if $as_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
     if test "$as_dir/$ac_word$ac_exec_ext" = "/usr/ucb/cc"; then
        ac_prog_rejected=yes
        continue
      fi
     ac_cv_prog_CC="cc"
-    echo "$as_me:$LINENO: found $as_dir/$ac_word$ac_exec_ext" >&5
+    $as_echo "$as_me:$LINENO: found $as_dir/$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
 done
+IFS=$as_save_IFS
 
 if test $ac_prog_rejected = yes; then
   # We found a bogon in the path, so make sure we never use it.
@@ -1692,24 +2308,25 @@ fi
 fi
 CC=$ac_cv_prog_CC
 if test -n "$CC"; then
-  echo "$as_me:$LINENO: result: $CC" >&5
-echo "${ECHO_T}$CC" >&6
+  { $as_echo "$as_me:$LINENO: result: $CC" >&5
+$as_echo "$CC" >&6; }
 else
-  echo "$as_me:$LINENO: result: no" >&5
-echo "${ECHO_T}no" >&6
+  { $as_echo "$as_me:$LINENO: result: no" >&5
+$as_echo "no" >&6; }
 fi
 
+
 fi
 if test -z "$CC"; then
   if test -n "$ac_tool_prefix"; then
-  for ac_prog in cl
+  for ac_prog in cl.exe
   do
     # Extract the first word of "$ac_tool_prefix$ac_prog", so it can be a program name with args.
 set dummy $ac_tool_prefix$ac_prog; ac_word=$2
-echo "$as_me:$LINENO: checking for $ac_word" >&5
-echo $ECHO_N "checking for $ac_word... $ECHO_C" >&6
+{ $as_echo "$as_me:$LINENO: checking for $ac_word" >&5
+$as_echo_n "checking for $ac_word... " >&6; }
 if test "${ac_cv_prog_CC+set}" = set; then
-  echo $ECHO_N "(cached) $ECHO_C" >&6
+  $as_echo_n "(cached) " >&6
 else
   if test -n "$CC"; then
   ac_cv_prog_CC="$CC" # Let the user override the test.
@@ -1720,38 +2337,40 @@ do
   IFS=$as_save_IFS
   test -z "$as_dir" && as_dir=.
   for ac_exec_ext in '' $ac_executable_extensions; do
-  if $as_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
     ac_cv_prog_CC="$ac_tool_prefix$ac_prog"
-    echo "$as_me:$LINENO: found $as_dir/$ac_word$ac_exec_ext" >&5
+    $as_echo "$as_me:$LINENO: found $as_dir/$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
 done
+IFS=$as_save_IFS
 
 fi
 fi
 CC=$ac_cv_prog_CC
 if test -n "$CC"; then
-  echo "$as_me:$LINENO: result: $CC" >&5
-echo "${ECHO_T}$CC" >&6
+  { $as_echo "$as_me:$LINENO: result: $CC" >&5
+$as_echo "$CC" >&6; }
 else
-  echo "$as_me:$LINENO: result: no" >&5
-echo "${ECHO_T}no" >&6
+  { $as_echo "$as_me:$LINENO: result: no" >&5
+$as_echo "no" >&6; }
 fi
 
+
     test -n "$CC" && break
   done
 fi
 if test -z "$CC"; then
   ac_ct_CC=$CC
-  for ac_prog in cl
+  for ac_prog in cl.exe
 do
   # Extract the first word of "$ac_prog", so it can be a program name with args.
 set dummy $ac_prog; ac_word=$2
-echo "$as_me:$LINENO: checking for $ac_word" >&5
-echo $ECHO_N "checking for $ac_word... $ECHO_C" >&6
+{ $as_echo "$as_me:$LINENO: checking for $ac_word" >&5
+$as_echo_n "checking for $ac_word... " >&6; }
 if test "${ac_cv_prog_ac_ct_CC+set}" = set; then
-  echo $ECHO_N "(cached) $ECHO_C" >&6
+  $as_echo_n "(cached) " >&6
 else
   if test -n "$ac_ct_CC"; then
   ac_cv_prog_ac_ct_CC="$ac_ct_CC" # Let the user override the test.
@@ -1762,58 +2381,90 @@ do
   IFS=$as_save_IFS
   test -z "$as_dir" && as_dir=.
   for ac_exec_ext in '' $ac_executable_extensions; do
-  if $as_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
     ac_cv_prog_ac_ct_CC="$ac_prog"
-    echo "$as_me:$LINENO: found $as_dir/$ac_word$ac_exec_ext" >&5
+    $as_echo "$as_me:$LINENO: found $as_dir/$ac_word$ac_exec_ext" >&5
     break 2
   fi
 done
 done
+IFS=$as_save_IFS
 
 fi
 fi
 ac_ct_CC=$ac_cv_prog_ac_ct_CC
 if test -n "$ac_ct_CC"; then
-  echo "$as_me:$LINENO: result: $ac_ct_CC" >&5
-echo "${ECHO_T}$ac_ct_CC" >&6
+  { $as_echo "$as_me:$LINENO: result: $ac_ct_CC" >&5
+$as_echo "$ac_ct_CC" >&6; }
 else
-  echo "$as_me:$LINENO: result: no" >&5
-echo "${ECHO_T}no" >&6
+  { $as_echo "$as_me:$LINENO: result: no" >&5
+$as_echo "no" >&6; }
 fi
 
+
   test -n "$ac_ct_CC" && break
 done
 
-  CC=$ac_ct_CC
+  if test "x$ac_ct_CC" = x; then
+    CC=""
+  else
+    case $cross_compiling:$ac_tool_warned in
+yes:)
+{ $as_echo "$as_me:$LINENO: WARNING: using cross tools not prefixed with host triplet" >&5
+$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
+ac_tool_warned=yes ;;
+esac
+    CC=$ac_ct_CC
+  fi
 fi
 
 fi
 
 
-test -z "$CC" && { { echo "$as_me:$LINENO: error: no acceptable C compiler found in \$PATH
+test -z "$CC" && { { $as_echo "$as_me:$LINENO: error: in \`$ac_pwd':" >&5
+$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+{ { $as_echo "$as_me:$LINENO: error: no acceptable C compiler found in \$PATH
 See \`config.log' for more details." >&5
-echo "$as_me: error: no acceptable C compiler found in \$PATH
+$as_echo "$as_me: error: no acceptable C compiler found in \$PATH
 See \`config.log' for more details." >&2;}
-   { (exit 1); exit 1; }; }
+   { (exit 1); exit 1; }; }; }
 
 # Provide some information about the compiler.
-echo "$as_me:$LINENO:" \
-     "checking for C compiler version" >&5
-ac_compiler=`set X $ac_compile; echo $2`
-{ (eval echo "$as_me:$LINENO: \"$ac_compiler --version </dev/null >&5\"") >&5
-  (eval $ac_compiler --version </dev/null >&5) 2>&5
+$as_echo "$as_me:$LINENO: checking for C compiler version" >&5
+set X $ac_compile
+ac_compiler=$2
+{ (ac_try="$ac_compiler --version >&5"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_compiler --version >&5") 2>&5
   ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
   (exit $ac_status); }
-{ (eval echo "$as_me:$LINENO: \"$ac_compiler -v </dev/null >&5\"") >&5
-  (eval $ac_compiler -v </dev/null >&5) 2>&5
+{ (ac_try="$ac_compiler -v >&5"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_compiler -v >&5") 2>&5
   ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
   (exit $ac_status); }
-{ (eval echo "$as_me:$LINENO: \"$ac_compiler -V </dev/null >&5\"") >&5
-  (eval $ac_compiler -V </dev/null >&5) 2>&5
+{ (ac_try="$ac_compiler -V >&5"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_compiler -V >&5") 2>&5
   ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
   (exit $ac_status); }
 
 cat >conftest.$ac_ext <<_ACEOF
@@ -1832,111 +2483,150 @@ main ()
 }
 _ACEOF
 ac_clean_files_save=$ac_clean_files
-ac_clean_files="$ac_clean_files a.out a.exe b.out"
+ac_clean_files="$ac_clean_files a.out a.out.dSYM a.exe b.out"
 # Try to create an executable without -o first, disregard a.out.
 # It will help us diagnose broken compilers, and finding out an intuition
 # of exeext.
-echo "$as_me:$LINENO: checking for C compiler default output file name" >&5
-echo $ECHO_N "checking for C compiler default output file name... $ECHO_C" >&6
-ac_link_default=`echo "$ac_link" | sed 's/ -o *conftest[^ ]*//'`
-if { (eval echo "$as_me:$LINENO: \"$ac_link_default\"") >&5
-  (eval $ac_link_default) 2>&5
+{ $as_echo "$as_me:$LINENO: checking for C compiler default output file name" >&5
+$as_echo_n "checking for C compiler default output file name... " >&6; }
+ac_link_default=`$as_echo "$ac_link" | sed 's/ -o *conftest[^ ]*//'`
+
+# The possible output files:
+ac_files="a.out conftest.exe conftest a.exe a_out.exe b.out conftest.*"
+
+ac_rmfiles=
+for ac_file in $ac_files
+do
+  case $ac_file in
+    *.$ac_ext | *.xcoff | *.tds | *.d | *.pdb | *.xSYM | *.bb | *.bbg | *.map | *.inf | *.dSYM | *.o | *.obj ) ;;
+    * ) ac_rmfiles="$ac_rmfiles $ac_file";;
+  esac
+done
+rm -f $ac_rmfiles
+
+if { (ac_try="$ac_link_default"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_link_default") 2>&5
   ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
   (exit $ac_status); }; then
-  # Find the output, starting from the most likely.  This scheme is
-# not robust to junk in `.', hence go to wildcards (a.*) only as a last
-# resort.
-
-# Be careful to initialize this variable, since it used to be cached.
-# Otherwise an old cache value of `no' led to `EXEEXT = no' in a Makefile.
-ac_cv_exeext=
-# b.out is created by i960 compilers.
-for ac_file in a_out.exe a.exe conftest.exe a.out conftest a.* conftest.* b.out
+  # Autoconf-2.13 could set the ac_cv_exeext variable to `no'.
+# So ignore a value of `no', otherwise this would lead to `EXEEXT = no'
+# in a Makefile.  We should not override ac_cv_exeext if it was cached,
+# so that the user can short-circuit this test for compilers unknown to
+# Autoconf.
+for ac_file in $ac_files ''
 do
   test -f "$ac_file" || continue
   case $ac_file in
-    *.$ac_ext | *.xcoff | *.tds | *.d | *.pdb | *.xSYM | *.bb | *.bbg | *.o | *.obj )
-	;;
-    conftest.$ac_ext )
-	# This is the source file.
+    *.$ac_ext | *.xcoff | *.tds | *.d | *.pdb | *.xSYM | *.bb | *.bbg | *.map | *.inf | *.dSYM | *.o | *.obj )
 	;;
     [ab].out )
 	# We found the default executable, but exeext='' is most
 	# certainly right.
 	break;;
     *.* )
-	ac_cv_exeext=`expr "$ac_file" : '[^.]*\(\..*\)'`
-	# FIXME: I believe we export ac_cv_exeext for Libtool,
-	# but it would be cool to find out if it's true.  Does anybody
-	# maintain Libtool? --akim.
-	export ac_cv_exeext
+        if test "${ac_cv_exeext+set}" = set && test "$ac_cv_exeext" != no;
+	then :; else
+	   ac_cv_exeext=`expr "$ac_file" : '[^.]*\(\..*\)'`
+	fi
+	# We set ac_cv_exeext here because the later test for it is not
+	# safe: cross compilers may not add the suffix if given an `-o'
+	# argument, so we may need to know it at that point already.
+	# Even if this section looks crufty: it has the advantage of
+	# actually working.
 	break;;
     * )
 	break;;
   esac
 done
+test "$ac_cv_exeext" = no && ac_cv_exeext=
+
 else
-  echo "$as_me: failed program was:" >&5
+  ac_file=''
+fi
+
+{ $as_echo "$as_me:$LINENO: result: $ac_file" >&5
+$as_echo "$ac_file" >&6; }
+if test -z "$ac_file"; then
+  $as_echo "$as_me: failed program was:" >&5
 sed 's/^/| /' conftest.$ac_ext >&5
 
-{ { echo "$as_me:$LINENO: error: C compiler cannot create executables
+{ { $as_echo "$as_me:$LINENO: error: in \`$ac_pwd':" >&5
+$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+{ { $as_echo "$as_me:$LINENO: error: C compiler cannot create executables
 See \`config.log' for more details." >&5
-echo "$as_me: error: C compiler cannot create executables
+$as_echo "$as_me: error: C compiler cannot create executables
 See \`config.log' for more details." >&2;}
-   { (exit 77); exit 77; }; }
+   { (exit 77); exit 77; }; }; }
 fi
 
 ac_exeext=$ac_cv_exeext
-echo "$as_me:$LINENO: result: $ac_file" >&5
-echo "${ECHO_T}$ac_file" >&6
 
-# Check the compiler produces executables we can run.  If not, either
+# Check that the compiler produces executables we can run.  If not, either
 # the compiler is broken, or we cross compile.
-echo "$as_me:$LINENO: checking whether the C compiler works" >&5
-echo $ECHO_N "checking whether the C compiler works... $ECHO_C" >&6
+{ $as_echo "$as_me:$LINENO: checking whether the C compiler works" >&5
+$as_echo_n "checking whether the C compiler works... " >&6; }
 # FIXME: These cross compiler hacks should be removed for Autoconf 3.0
 # If not cross compiling, check that we can run a simple program.
 if test "$cross_compiling" != yes; then
   if { ac_try='./$ac_file'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
+  { (case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_try") 2>&5
   ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
   (exit $ac_status); }; }; then
     cross_compiling=no
   else
     if test "$cross_compiling" = maybe; then
 	cross_compiling=yes
     else
-	{ { echo "$as_me:$LINENO: error: cannot run C compiled programs.
+	{ { $as_echo "$as_me:$LINENO: error: in \`$ac_pwd':" >&5
+$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+{ { $as_echo "$as_me:$LINENO: error: cannot run C compiled programs.
 If you meant to cross compile, use \`--host'.
 See \`config.log' for more details." >&5
-echo "$as_me: error: cannot run C compiled programs.
+$as_echo "$as_me: error: cannot run C compiled programs.
 If you meant to cross compile, use \`--host'.
 See \`config.log' for more details." >&2;}
-   { (exit 1); exit 1; }; }
+   { (exit 1); exit 1; }; }; }
     fi
   fi
 fi
-echo "$as_me:$LINENO: result: yes" >&5
-echo "${ECHO_T}yes" >&6
+{ $as_echo "$as_me:$LINENO: result: yes" >&5
+$as_echo "yes" >&6; }
 
-rm -f a.out a.exe conftest$ac_cv_exeext b.out
+rm -f -r a.out a.out.dSYM a.exe conftest$ac_cv_exeext b.out
 ac_clean_files=$ac_clean_files_save
-# Check the compiler produces executables we can run.  If not, either
+# Check that the compiler produces executables we can run.  If not, either
 # the compiler is broken, or we cross compile.
-echo "$as_me:$LINENO: checking whether we are cross compiling" >&5
-echo $ECHO_N "checking whether we are cross compiling... $ECHO_C" >&6
-echo "$as_me:$LINENO: result: $cross_compiling" >&5
-echo "${ECHO_T}$cross_compiling" >&6
-
-echo "$as_me:$LINENO: checking for suffix of executables" >&5
-echo $ECHO_N "checking for suffix of executables... $ECHO_C" >&6
-if { (eval echo "$as_me:$LINENO: \"$ac_link\"") >&5
-  (eval $ac_link) 2>&5
+{ $as_echo "$as_me:$LINENO: checking whether we are cross compiling" >&5
+$as_echo_n "checking whether we are cross compiling... " >&6; }
+{ $as_echo "$as_me:$LINENO: result: $cross_compiling" >&5
+$as_echo "$cross_compiling" >&6; }
+
+{ $as_echo "$as_me:$LINENO: checking for suffix of executables" >&5
+$as_echo_n "checking for suffix of executables... " >&6; }
+if { (ac_try="$ac_link"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_link") 2>&5
   ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
   (exit $ac_status); }; then
   # If both `conftest.exe' and `conftest' are `present' (well, observable)
 # catch `conftest.exe'.  For instance with Cygwin, `ls conftest' will
@@ -1945,32 +2635,33 @@ if { (eval echo "$as_me:$LINENO: \"$ac_link\"") >&5
 for ac_file in conftest.exe conftest conftest.*; do
   test -f "$ac_file" || continue
   case $ac_file in
-    *.$ac_ext | *.xcoff | *.tds | *.d | *.pdb | *.xSYM | *.bb | *.bbg | *.o | *.obj ) ;;
+    *.$ac_ext | *.xcoff | *.tds | *.d | *.pdb | *.xSYM | *.bb | *.bbg | *.map | *.inf | *.dSYM | *.o | *.obj ) ;;
     *.* ) ac_cv_exeext=`expr "$ac_file" : '[^.]*\(\..*\)'`
-	  export ac_cv_exeext
 	  break;;
     * ) break;;
   esac
 done
 else
-  { { echo "$as_me:$LINENO: error: cannot compute suffix of executables: cannot compile and link
+  { { $as_echo "$as_me:$LINENO: error: in \`$ac_pwd':" >&5
+$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+{ { $as_echo "$as_me:$LINENO: error: cannot compute suffix of executables: cannot compile and link
 See \`config.log' for more details." >&5
-echo "$as_me: error: cannot compute suffix of executables: cannot compile and link
+$as_echo "$as_me: error: cannot compute suffix of executables: cannot compile and link
 See \`config.log' for more details." >&2;}
-   { (exit 1); exit 1; }; }
+   { (exit 1); exit 1; }; }; }
 fi
 
 rm -f conftest$ac_cv_exeext
-echo "$as_me:$LINENO: result: $ac_cv_exeext" >&5
-echo "${ECHO_T}$ac_cv_exeext" >&6
+{ $as_echo "$as_me:$LINENO: result: $ac_cv_exeext" >&5
+$as_echo "$ac_cv_exeext" >&6; }
 
 rm -f conftest.$ac_ext
 EXEEXT=$ac_cv_exeext
 ac_exeext=$EXEEXT
-echo "$as_me:$LINENO: checking for suffix of object files" >&5
-echo $ECHO_N "checking for suffix of object files... $ECHO_C" >&6
+{ $as_echo "$as_me:$LINENO: checking for suffix of object files" >&5
+$as_echo_n "checking for suffix of object files... " >&6; }
 if test "${ac_cv_objext+set}" = set; then
-  echo $ECHO_N "(cached) $ECHO_C" >&6
+  $as_echo_n "(cached) " >&6
 else
   cat >conftest.$ac_ext <<_ACEOF
 /* confdefs.h.  */
@@ -1988,39 +2679,48 @@ main ()
 }
 _ACEOF
 rm -f conftest.o conftest.obj
-if { (eval echo "$as_me:$LINENO: \"$ac_compile\"") >&5
-  (eval $ac_compile) 2>&5
+if { (ac_try="$ac_compile"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_compile") 2>&5
   ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
   (exit $ac_status); }; then
-  for ac_file in `(ls conftest.o conftest.obj; ls conftest.*) 2>/dev/null`; do
+  for ac_file in conftest.o conftest.obj conftest.*; do
+  test -f "$ac_file" || continue;
   case $ac_file in
-    *.$ac_ext | *.xcoff | *.tds | *.d | *.pdb | *.xSYM | *.bb | *.bbg ) ;;
+    *.$ac_ext | *.xcoff | *.tds | *.d | *.pdb | *.xSYM | *.bb | *.bbg | *.map | *.inf | *.dSYM ) ;;
     *) ac_cv_objext=`expr "$ac_file" : '.*\.\(.*\)'`
        break;;
   esac
 done
 else
-  echo "$as_me: failed program was:" >&5
+  $as_echo "$as_me: failed program was:" >&5
 sed 's/^/| /' conftest.$ac_ext >&5
 
-{ { echo "$as_me:$LINENO: error: cannot compute suffix of object files: cannot compile
+{ { $as_echo "$as_me:$LINENO: error: in \`$ac_pwd':" >&5
+$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+{ { $as_echo "$as_me:$LINENO: error: cannot compute suffix of object files: cannot compile
 See \`config.log' for more details." >&5
-echo "$as_me: error: cannot compute suffix of object files: cannot compile
+$as_echo "$as_me: error: cannot compute suffix of object files: cannot compile
 See \`config.log' for more details." >&2;}
-   { (exit 1); exit 1; }; }
+   { (exit 1); exit 1; }; }; }
 fi
 
 rm -f conftest.$ac_cv_objext conftest.$ac_ext
 fi
-echo "$as_me:$LINENO: result: $ac_cv_objext" >&5
-echo "${ECHO_T}$ac_cv_objext" >&6
+{ $as_echo "$as_me:$LINENO: result: $ac_cv_objext" >&5
+$as_echo "$ac_cv_objext" >&6; }
 OBJEXT=$ac_cv_objext
 ac_objext=$OBJEXT
-echo "$as_me:$LINENO: checking whether we are using the GNU C compiler" >&5
-echo $ECHO_N "checking whether we are using the GNU C compiler... $ECHO_C" >&6
+{ $as_echo "$as_me:$LINENO: checking whether we are using the GNU C compiler" >&5
+$as_echo_n "checking whether we are using the GNU C compiler... " >&6; }
 if test "${ac_cv_c_compiler_gnu+set}" = set; then
-  echo $ECHO_N "(cached) $ECHO_C" >&6
+  $as_echo_n "(cached) " >&6
 else
   cat >conftest.$ac_ext <<_ACEOF
 /* confdefs.h.  */
@@ -2041,50 +2741,54 @@ main ()
 }
 _ACEOF
 rm -f conftest.$ac_objext
-if { (eval echo "$as_me:$LINENO: \"$ac_compile\"") >&5
-  (eval $ac_compile) 2>conftest.er1
+if { (ac_try="$ac_compile"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_compile") 2>conftest.er1
   ac_status=$?
   grep -v '^ *+' conftest.er1 >conftest.err
   rm -f conftest.er1
   cat conftest.err >&5
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); } &&
-	 { ac_try='test -z "$ac_c_werror_flag"
-			 || test ! -s conftest.err'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
-  ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; } &&
-	 { ac_try='test -s conftest.$ac_objext'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
-  ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; }; then
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  (exit $ac_status); } && {
+	 test -z "$ac_c_werror_flag" ||
+	 test ! -s conftest.err
+       } && test -s conftest.$ac_objext; then
   ac_compiler_gnu=yes
 else
-  echo "$as_me: failed program was:" >&5
+  $as_echo "$as_me: failed program was:" >&5
 sed 's/^/| /' conftest.$ac_ext >&5
 
-ac_compiler_gnu=no
+	ac_compiler_gnu=no
 fi
-rm -f conftest.err conftest.$ac_objext conftest.$ac_ext
+
+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
 ac_cv_c_compiler_gnu=$ac_compiler_gnu
 
 fi
-echo "$as_me:$LINENO: result: $ac_cv_c_compiler_gnu" >&5
-echo "${ECHO_T}$ac_cv_c_compiler_gnu" >&6
-GCC=`test $ac_compiler_gnu = yes && echo yes`
+{ $as_echo "$as_me:$LINENO: result: $ac_cv_c_compiler_gnu" >&5
+$as_echo "$ac_cv_c_compiler_gnu" >&6; }
+if test $ac_compiler_gnu = yes; then
+  GCC=yes
+else
+  GCC=
+fi
 ac_test_CFLAGS=${CFLAGS+set}
 ac_save_CFLAGS=$CFLAGS
-CFLAGS="-g"
-echo "$as_me:$LINENO: checking whether $CC accepts -g" >&5
-echo $ECHO_N "checking whether $CC accepts -g... $ECHO_C" >&6
+{ $as_echo "$as_me:$LINENO: checking whether $CC accepts -g" >&5
+$as_echo_n "checking whether $CC accepts -g... " >&6; }
 if test "${ac_cv_prog_cc_g+set}" = set; then
-  echo $ECHO_N "(cached) $ECHO_C" >&6
+  $as_echo_n "(cached) " >&6
 else
-  cat >conftest.$ac_ext <<_ACEOF
+  ac_save_c_werror_flag=$ac_c_werror_flag
+   ac_c_werror_flag=yes
+   ac_cv_prog_cc_g=no
+   CFLAGS="-g"
+   cat >conftest.$ac_ext <<_ACEOF
 /* confdefs.h.  */
 _ACEOF
 cat confdefs.h >>conftest.$ac_ext
@@ -2100,38 +2804,121 @@ main ()
 }
 _ACEOF
 rm -f conftest.$ac_objext
-if { (eval echo "$as_me:$LINENO: \"$ac_compile\"") >&5
-  (eval $ac_compile) 2>conftest.er1
+if { (ac_try="$ac_compile"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_compile") 2>conftest.er1
   ac_status=$?
   grep -v '^ *+' conftest.er1 >conftest.err
   rm -f conftest.er1
   cat conftest.err >&5
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); } &&
-	 { ac_try='test -z "$ac_c_werror_flag"
-			 || test ! -s conftest.err'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  (exit $ac_status); } && {
+	 test -z "$ac_c_werror_flag" ||
+	 test ! -s conftest.err
+       } && test -s conftest.$ac_objext; then
+  ac_cv_prog_cc_g=yes
+else
+  $as_echo "$as_me: failed program was:" >&5
+sed 's/^/| /' conftest.$ac_ext >&5
+
+	CFLAGS=""
+      cat >conftest.$ac_ext <<_ACEOF
+/* confdefs.h.  */
+_ACEOF
+cat confdefs.h >>conftest.$ac_ext
+cat >>conftest.$ac_ext <<_ACEOF
+/* end confdefs.h.  */
+
+int
+main ()
+{
+
+  ;
+  return 0;
+}
+_ACEOF
+rm -f conftest.$ac_objext
+if { (ac_try="$ac_compile"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_compile") 2>conftest.er1
   ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; } &&
-	 { ac_try='test -s conftest.$ac_objext'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
+  grep -v '^ *+' conftest.er1 >conftest.err
+  rm -f conftest.er1
+  cat conftest.err >&5
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  (exit $ac_status); } && {
+	 test -z "$ac_c_werror_flag" ||
+	 test ! -s conftest.err
+       } && test -s conftest.$ac_objext; then
+  :
+else
+  $as_echo "$as_me: failed program was:" >&5
+sed 's/^/| /' conftest.$ac_ext >&5
+
+	ac_c_werror_flag=$ac_save_c_werror_flag
+	 CFLAGS="-g"
+	 cat >conftest.$ac_ext <<_ACEOF
+/* confdefs.h.  */
+_ACEOF
+cat confdefs.h >>conftest.$ac_ext
+cat >>conftest.$ac_ext <<_ACEOF
+/* end confdefs.h.  */
+
+int
+main ()
+{
+
+  ;
+  return 0;
+}
+_ACEOF
+rm -f conftest.$ac_objext
+if { (ac_try="$ac_compile"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_compile") 2>conftest.er1
   ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; }; then
+  grep -v '^ *+' conftest.er1 >conftest.err
+  rm -f conftest.er1
+  cat conftest.err >&5
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  (exit $ac_status); } && {
+	 test -z "$ac_c_werror_flag" ||
+	 test ! -s conftest.err
+       } && test -s conftest.$ac_objext; then
   ac_cv_prog_cc_g=yes
 else
-  echo "$as_me: failed program was:" >&5
+  $as_echo "$as_me: failed program was:" >&5
 sed 's/^/| /' conftest.$ac_ext >&5
 
-ac_cv_prog_cc_g=no
+
 fi
-rm -f conftest.err conftest.$ac_objext conftest.$ac_ext
+
+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+fi
+
+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+fi
+
+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+   ac_c_werror_flag=$ac_save_c_werror_flag
 fi
-echo "$as_me:$LINENO: result: $ac_cv_prog_cc_g" >&5
-echo "${ECHO_T}$ac_cv_prog_cc_g" >&6
+{ $as_echo "$as_me:$LINENO: result: $ac_cv_prog_cc_g" >&5
+$as_echo "$ac_cv_prog_cc_g" >&6; }
 if test "$ac_test_CFLAGS" = set; then
   CFLAGS=$ac_save_CFLAGS
 elif test $ac_cv_prog_cc_g = yes; then
@@ -2147,12 +2934,12 @@ else
     CFLAGS=
   fi
 fi
-echo "$as_me:$LINENO: checking for $CC option to accept ANSI C" >&5
-echo $ECHO_N "checking for $CC option to accept ANSI C... $ECHO_C" >&6
-if test "${ac_cv_prog_cc_stdc+set}" = set; then
-  echo $ECHO_N "(cached) $ECHO_C" >&6
+{ $as_echo "$as_me:$LINENO: checking for $CC option to accept ISO C89" >&5
+$as_echo_n "checking for $CC option to accept ISO C89... " >&6; }
+if test "${ac_cv_prog_cc_c89+set}" = set; then
+  $as_echo_n "(cached) " >&6
 else
-  ac_cv_prog_cc_stdc=no
+  ac_cv_prog_cc_c89=no
 ac_save_CC=$CC
 cat >conftest.$ac_ext <<_ACEOF
 /* confdefs.h.  */
@@ -2186,12 +2973,17 @@ static char *f (char * (*g) (char **, int), char **p, ...)
 /* OSF 4.0 Compaq cc is some sort of almost-ANSI by default.  It has
    function prototypes and stuff, but not '\xHH' hex character constants.
    These don't provoke an error unfortunately, instead are silently treated
-   as 'x'.  The following induces an error, until -std1 is added to get
+   as 'x'.  The following induces an error, until -std is added to get
    proper ANSI mode.  Curiously '\x00'!='x' always comes out true, for an
    array size@least.  It's necessary to write '\x00'==0 to get something
-   that's true only with -std1.  */
+   that's true only with -std.  */
 int osf4_cc_array ['\x00' == 0 ? 1 : -1];
 
+/* IBM C 6 for AIX is almost-ANSI by default, but it replaces macro parameters
+   inside strings and character constants.  */
+#define FOO(x) 'x'
+int xlc6_cc_array[FOO(a) == 'x' ? 1 : -1];
+
 int test (int i, double x);
 struct s1 {int (*f) (int a);};
 struct s2 {int (*f) (double a);};
@@ -2206,210 +2998,915 @@ return f (e, argv, 0) != argv[0]  ||  f (e, argv, 1) != argv[1];
   return 0;
 }
 _ACEOF
-# Don't try gcc -ansi; that turns off useful extensions and
-# breaks some systems' header files.
-# AIX			-qlanglvl=ansi
-# Ultrix and OSF/1	-std1
-# HP-UX 10.20 and later	-Ae
-# HP-UX older versions	-Aa -D_HPUX_SOURCE
-# SVR4			-Xc -D__EXTENSIONS__
-for ac_arg in "" -qlanglvl=ansi -std1 -Ae "-Aa -D_HPUX_SOURCE" "-Xc -D__EXTENSIONS__"
+for ac_arg in '' -qlanglvl=extc89 -qlanglvl=ansi -std \
+	-Ae "-Aa -D_HPUX_SOURCE" "-Xc -D__EXTENSIONS__"
 do
   CC="$ac_save_CC $ac_arg"
   rm -f conftest.$ac_objext
-if { (eval echo "$as_me:$LINENO: \"$ac_compile\"") >&5
-  (eval $ac_compile) 2>conftest.er1
+if { (ac_try="$ac_compile"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_compile") 2>conftest.er1
   ac_status=$?
   grep -v '^ *+' conftest.er1 >conftest.err
   rm -f conftest.er1
   cat conftest.err >&5
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); } &&
-	 { ac_try='test -z "$ac_c_werror_flag"
-			 || test ! -s conftest.err'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
-  ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; } &&
-	 { ac_try='test -s conftest.$ac_objext'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
-  ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; }; then
-  ac_cv_prog_cc_stdc=$ac_arg
-break
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  (exit $ac_status); } && {
+	 test -z "$ac_c_werror_flag" ||
+	 test ! -s conftest.err
+       } && test -s conftest.$ac_objext; then
+  ac_cv_prog_cc_c89=$ac_arg
 else
-  echo "$as_me: failed program was:" >&5
+  $as_echo "$as_me: failed program was:" >&5
 sed 's/^/| /' conftest.$ac_ext >&5
 
+
 fi
-rm -f conftest.err conftest.$ac_objext
+
+rm -f core conftest.err conftest.$ac_objext
+  test "x$ac_cv_prog_cc_c89" != "xno" && break
 done
-rm -f conftest.$ac_ext conftest.$ac_objext
+rm -f conftest.$ac_ext
 CC=$ac_save_CC
 
 fi
-
-case "x$ac_cv_prog_cc_stdc" in
-  x|xno)
-    echo "$as_me:$LINENO: result: none needed" >&5
-echo "${ECHO_T}none needed" >&6 ;;
+# AC_CACHE_VAL
+case "x$ac_cv_prog_cc_c89" in
+  x)
+    { $as_echo "$as_me:$LINENO: result: none needed" >&5
+$as_echo "none needed" >&6; } ;;
+  xno)
+    { $as_echo "$as_me:$LINENO: result: unsupported" >&5
+$as_echo "unsupported" >&6; } ;;
   *)
-    echo "$as_me:$LINENO: result: $ac_cv_prog_cc_stdc" >&5
-echo "${ECHO_T}$ac_cv_prog_cc_stdc" >&6
-    CC="$CC $ac_cv_prog_cc_stdc" ;;
+    CC="$CC $ac_cv_prog_cc_c89"
+    { $as_echo "$as_me:$LINENO: result: $ac_cv_prog_cc_c89" >&5
+$as_echo "$ac_cv_prog_cc_c89" >&6; } ;;
 esac
 
-# Some people use a C++ compiler to compile C.  Since we use `exit',
-# in C++ we need to declare it.  In case someone uses the same compiler
-# for both compiling C and C++ we need to have the C++ compiler decide
-# the declaration of exit, since it's the most demanding environment.
-cat >conftest.$ac_ext <<_ACEOF
-#ifndef __cplusplus
-  choke me
+
+ac_ext=c
+ac_cpp='$CPP $CPPFLAGS'
+ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
+ac_compiler_gnu=$ac_cv_c_compiler_gnu
+
+
+ac_ext=c
+ac_cpp='$CPP $CPPFLAGS'
+ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
+ac_compiler_gnu=$ac_cv_c_compiler_gnu
+{ $as_echo "$as_me:$LINENO: checking how to run the C preprocessor" >&5
+$as_echo_n "checking how to run the C preprocessor... " >&6; }
+# On Suns, sometimes $CPP names a directory.
+if test -n "$CPP" && test -d "$CPP"; then
+  CPP=
+fi
+if test -z "$CPP"; then
+  if test "${ac_cv_prog_CPP+set}" = set; then
+  $as_echo_n "(cached) " >&6
+else
+      # Double quotes because CPP needs to be expanded
+    for CPP in "$CC -E" "$CC -E -traditional-cpp" "/lib/cpp"
+    do
+      ac_preproc_ok=false
+for ac_c_preproc_warn_flag in '' yes
+do
+  # Use a header file that comes with gcc, so configuring glibc
+  # with a fresh cross-compiler works.
+  # Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
+  # <limits.h> exists even on freestanding compilers.
+  # On the NeXT, cc -E runs the code through the compiler's parser,
+  # not just through cpp. "Syntax error" is here to catch this case.
+  cat >conftest.$ac_ext <<_ACEOF
+/* confdefs.h.  */
+_ACEOF
+cat confdefs.h >>conftest.$ac_ext
+cat >>conftest.$ac_ext <<_ACEOF
+/* end confdefs.h.  */
+#ifdef __STDC__
+# include <limits.h>
+#else
+# include <assert.h>
 #endif
+		     Syntax error
 _ACEOF
-rm -f conftest.$ac_objext
-if { (eval echo "$as_me:$LINENO: \"$ac_compile\"") >&5
-  (eval $ac_compile) 2>conftest.er1
+if { (ac_try="$ac_cpp conftest.$ac_ext"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_cpp conftest.$ac_ext") 2>conftest.er1
   ac_status=$?
   grep -v '^ *+' conftest.er1 >conftest.err
   rm -f conftest.er1
   cat conftest.err >&5
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); } &&
-	 { ac_try='test -z "$ac_c_werror_flag"
-			 || test ! -s conftest.err'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  (exit $ac_status); } >/dev/null && {
+	 test -z "$ac_c_preproc_warn_flag$ac_c_werror_flag" ||
+	 test ! -s conftest.err
+       }; then
+  :
+else
+  $as_echo "$as_me: failed program was:" >&5
+sed 's/^/| /' conftest.$ac_ext >&5
+
+  # Broken: fails on valid input.
+continue
+fi
+
+rm -f conftest.err conftest.$ac_ext
+
+  # OK, works on sane cases.  Now check whether nonexistent headers
+  # can be detected and how.
+  cat >conftest.$ac_ext <<_ACEOF
+/* confdefs.h.  */
+_ACEOF
+cat confdefs.h >>conftest.$ac_ext
+cat >>conftest.$ac_ext <<_ACEOF
+/* end confdefs.h.  */
+#include <ac_nonexistent.h>
+_ACEOF
+if { (ac_try="$ac_cpp conftest.$ac_ext"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_cpp conftest.$ac_ext") 2>conftest.er1
   ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; } &&
-	 { ac_try='test -s conftest.$ac_objext'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
+  grep -v '^ *+' conftest.er1 >conftest.err
+  rm -f conftest.er1
+  cat conftest.err >&5
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  (exit $ac_status); } >/dev/null && {
+	 test -z "$ac_c_preproc_warn_flag$ac_c_werror_flag" ||
+	 test ! -s conftest.err
+       }; then
+  # Broken: success on invalid input.
+continue
+else
+  $as_echo "$as_me: failed program was:" >&5
+sed 's/^/| /' conftest.$ac_ext >&5
+
+  # Passes both tests.
+ac_preproc_ok=:
+break
+fi
+
+rm -f conftest.err conftest.$ac_ext
+
+done
+# Because of `break', _AC_PREPROC_IFELSE's cleaning code was skipped.
+rm -f conftest.err conftest.$ac_ext
+if $ac_preproc_ok; then
+  break
+fi
+
+    done
+    ac_cv_prog_CPP=$CPP
+
+fi
+  CPP=$ac_cv_prog_CPP
+else
+  ac_cv_prog_CPP=$CPP
+fi
+{ $as_echo "$as_me:$LINENO: result: $CPP" >&5
+$as_echo "$CPP" >&6; }
+ac_preproc_ok=false
+for ac_c_preproc_warn_flag in '' yes
+do
+  # Use a header file that comes with gcc, so configuring glibc
+  # with a fresh cross-compiler works.
+  # Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
+  # <limits.h> exists even on freestanding compilers.
+  # On the NeXT, cc -E runs the code through the compiler's parser,
+  # not just through cpp. "Syntax error" is here to catch this case.
+  cat >conftest.$ac_ext <<_ACEOF
+/* confdefs.h.  */
+_ACEOF
+cat confdefs.h >>conftest.$ac_ext
+cat >>conftest.$ac_ext <<_ACEOF
+/* end confdefs.h.  */
+#ifdef __STDC__
+# include <limits.h>
+#else
+# include <assert.h>
+#endif
+		     Syntax error
+_ACEOF
+if { (ac_try="$ac_cpp conftest.$ac_ext"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_cpp conftest.$ac_ext") 2>conftest.er1
   ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; }; then
-  for ac_declaration in \
-   '' \
-   'extern "C" void std::exit (int) throw (); using std::exit;' \
-   'extern "C" void std::exit (int); using std::exit;' \
-   'extern "C" void exit (int) throw ();' \
-   'extern "C" void exit (int);' \
-   'void exit (int);'
+  grep -v '^ *+' conftest.er1 >conftest.err
+  rm -f conftest.er1
+  cat conftest.err >&5
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  (exit $ac_status); } >/dev/null && {
+	 test -z "$ac_c_preproc_warn_flag$ac_c_werror_flag" ||
+	 test ! -s conftest.err
+       }; then
+  :
+else
+  $as_echo "$as_me: failed program was:" >&5
+sed 's/^/| /' conftest.$ac_ext >&5
+
+  # Broken: fails on valid input.
+continue
+fi
+
+rm -f conftest.err conftest.$ac_ext
+
+  # OK, works on sane cases.  Now check whether nonexistent headers
+  # can be detected and how.
+  cat >conftest.$ac_ext <<_ACEOF
+/* confdefs.h.  */
+_ACEOF
+cat confdefs.h >>conftest.$ac_ext
+cat >>conftest.$ac_ext <<_ACEOF
+/* end confdefs.h.  */
+#include <ac_nonexistent.h>
+_ACEOF
+if { (ac_try="$ac_cpp conftest.$ac_ext"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_cpp conftest.$ac_ext") 2>conftest.er1
+  ac_status=$?
+  grep -v '^ *+' conftest.er1 >conftest.err
+  rm -f conftest.er1
+  cat conftest.err >&5
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  (exit $ac_status); } >/dev/null && {
+	 test -z "$ac_c_preproc_warn_flag$ac_c_werror_flag" ||
+	 test ! -s conftest.err
+       }; then
+  # Broken: success on invalid input.
+continue
+else
+  $as_echo "$as_me: failed program was:" >&5
+sed 's/^/| /' conftest.$ac_ext >&5
+
+  # Passes both tests.
+ac_preproc_ok=:
+break
+fi
+
+rm -f conftest.err conftest.$ac_ext
+
+done
+# Because of `break', _AC_PREPROC_IFELSE's cleaning code was skipped.
+rm -f conftest.err conftest.$ac_ext
+if $ac_preproc_ok; then
+  :
+else
+  { { $as_echo "$as_me:$LINENO: error: in \`$ac_pwd':" >&5
+$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+{ { $as_echo "$as_me:$LINENO: error: C preprocessor \"$CPP\" fails sanity check
+See \`config.log' for more details." >&5
+$as_echo "$as_me: error: C preprocessor \"$CPP\" fails sanity check
+See \`config.log' for more details." >&2;}
+   { (exit 1); exit 1; }; }; }
+fi
+
+ac_ext=c
+ac_cpp='$CPP $CPPFLAGS'
+ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
+ac_compiler_gnu=$ac_cv_c_compiler_gnu
+
+
+{ $as_echo "$as_me:$LINENO: checking for grep that handles long lines and -e" >&5
+$as_echo_n "checking for grep that handles long lines and -e... " >&6; }
+if test "${ac_cv_path_GREP+set}" = set; then
+  $as_echo_n "(cached) " >&6
+else
+  if test -z "$GREP"; then
+  ac_path_GREP_found=false
+  # Loop through the user's path and test for each of PROGNAME-LIST
+  as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
+for as_dir in $PATH$PATH_SEPARATOR/usr/xpg4/bin
 do
+  IFS=$as_save_IFS
+  test -z "$as_dir" && as_dir=.
+  for ac_prog in grep ggrep; do
+    for ac_exec_ext in '' $ac_executable_extensions; do
+      ac_path_GREP="$as_dir/$ac_prog$ac_exec_ext"
+      { test -f "$ac_path_GREP" && $as_test_x "$ac_path_GREP"; } || continue
+# Check for GNU ac_path_GREP and select it if it is found.
+  # Check for GNU $ac_path_GREP
+case `"$ac_path_GREP" --version 2>&1` in
+*GNU*)
+  ac_cv_path_GREP="$ac_path_GREP" ac_path_GREP_found=:;;
+*)
+  ac_count=0
+  $as_echo_n 0123456789 >"conftest.in"
+  while :
+  do
+    cat "conftest.in" "conftest.in" >"conftest.tmp"
+    mv "conftest.tmp" "conftest.in"
+    cp "conftest.in" "conftest.nl"
+    $as_echo 'GREP' >> "conftest.nl"
+    "$ac_path_GREP" -e 'GREP$' -e '-(cannot match)-' < "conftest.nl" >"conftest.out" 2>/dev/null || break
+    diff "conftest.out" "conftest.nl" >/dev/null 2>&1 || break
+    ac_count=`expr $ac_count + 1`
+    if test $ac_count -gt ${ac_path_GREP_max-0}; then
+      # Best one so far, save it but keep looking for a better one
+      ac_cv_path_GREP="$ac_path_GREP"
+      ac_path_GREP_max=$ac_count
+    fi
+    # 10*(2^10) chars as input seems more than enough
+    test $ac_count -gt 10 && break
+  done
+  rm -f conftest.in conftest.tmp conftest.nl conftest.out;;
+esac
+
+      $ac_path_GREP_found && break 3
+    done
+  done
+done
+IFS=$as_save_IFS
+  if test -z "$ac_cv_path_GREP"; then
+    { { $as_echo "$as_me:$LINENO: error: no acceptable grep could be found in $PATH$PATH_SEPARATOR/usr/xpg4/bin" >&5
+$as_echo "$as_me: error: no acceptable grep could be found in $PATH$PATH_SEPARATOR/usr/xpg4/bin" >&2;}
+   { (exit 1); exit 1; }; }
+  fi
+else
+  ac_cv_path_GREP=$GREP
+fi
+
+fi
+{ $as_echo "$as_me:$LINENO: result: $ac_cv_path_GREP" >&5
+$as_echo "$ac_cv_path_GREP" >&6; }
+ GREP="$ac_cv_path_GREP"
+
+
+{ $as_echo "$as_me:$LINENO: checking for egrep" >&5
+$as_echo_n "checking for egrep... " >&6; }
+if test "${ac_cv_path_EGREP+set}" = set; then
+  $as_echo_n "(cached) " >&6
+else
+  if echo a | $GREP -E '(a|b)' >/dev/null 2>&1
+   then ac_cv_path_EGREP="$GREP -E"
+   else
+     if test -z "$EGREP"; then
+  ac_path_EGREP_found=false
+  # Loop through the user's path and test for each of PROGNAME-LIST
+  as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
+for as_dir in $PATH$PATH_SEPARATOR/usr/xpg4/bin
+do
+  IFS=$as_save_IFS
+  test -z "$as_dir" && as_dir=.
+  for ac_prog in egrep; do
+    for ac_exec_ext in '' $ac_executable_extensions; do
+      ac_path_EGREP="$as_dir/$ac_prog$ac_exec_ext"
+      { test -f "$ac_path_EGREP" && $as_test_x "$ac_path_EGREP"; } || continue
+# Check for GNU ac_path_EGREP and select it if it is found.
+  # Check for GNU $ac_path_EGREP
+case `"$ac_path_EGREP" --version 2>&1` in
+*GNU*)
+  ac_cv_path_EGREP="$ac_path_EGREP" ac_path_EGREP_found=:;;
+*)
+  ac_count=0
+  $as_echo_n 0123456789 >"conftest.in"
+  while :
+  do
+    cat "conftest.in" "conftest.in" >"conftest.tmp"
+    mv "conftest.tmp" "conftest.in"
+    cp "conftest.in" "conftest.nl"
+    $as_echo 'EGREP' >> "conftest.nl"
+    "$ac_path_EGREP" 'EGREP$' < "conftest.nl" >"conftest.out" 2>/dev/null || break
+    diff "conftest.out" "conftest.nl" >/dev/null 2>&1 || break
+    ac_count=`expr $ac_count + 1`
+    if test $ac_count -gt ${ac_path_EGREP_max-0}; then
+      # Best one so far, save it but keep looking for a better one
+      ac_cv_path_EGREP="$ac_path_EGREP"
+      ac_path_EGREP_max=$ac_count
+    fi
+    # 10*(2^10) chars as input seems more than enough
+    test $ac_count -gt 10 && break
+  done
+  rm -f conftest.in conftest.tmp conftest.nl conftest.out;;
+esac
+
+      $ac_path_EGREP_found && break 3
+    done
+  done
+done
+IFS=$as_save_IFS
+  if test -z "$ac_cv_path_EGREP"; then
+    { { $as_echo "$as_me:$LINENO: error: no acceptable egrep could be found in $PATH$PATH_SEPARATOR/usr/xpg4/bin" >&5
+$as_echo "$as_me: error: no acceptable egrep could be found in $PATH$PATH_SEPARATOR/usr/xpg4/bin" >&2;}
+   { (exit 1); exit 1; }; }
+  fi
+else
+  ac_cv_path_EGREP=$EGREP
+fi
+
+   fi
+fi
+{ $as_echo "$as_me:$LINENO: result: $ac_cv_path_EGREP" >&5
+$as_echo "$ac_cv_path_EGREP" >&6; }
+ EGREP="$ac_cv_path_EGREP"
+
+
+{ $as_echo "$as_me:$LINENO: checking for ANSI C header files" >&5
+$as_echo_n "checking for ANSI C header files... " >&6; }
+if test "${ac_cv_header_stdc+set}" = set; then
+  $as_echo_n "(cached) " >&6
+else
   cat >conftest.$ac_ext <<_ACEOF
 /* confdefs.h.  */
 _ACEOF
 cat confdefs.h >>conftest.$ac_ext
 cat >>conftest.$ac_ext <<_ACEOF
 /* end confdefs.h.  */
-$ac_declaration
 #include <stdlib.h>
+#include <stdarg.h>
+#include <string.h>
+#include <float.h>
+
 int
 main ()
 {
-exit (42);
+
   ;
   return 0;
 }
 _ACEOF
 rm -f conftest.$ac_objext
-if { (eval echo "$as_me:$LINENO: \"$ac_compile\"") >&5
-  (eval $ac_compile) 2>conftest.er1
+if { (ac_try="$ac_compile"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_compile") 2>conftest.er1
   ac_status=$?
   grep -v '^ *+' conftest.er1 >conftest.err
   rm -f conftest.er1
   cat conftest.err >&5
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); } &&
-	 { ac_try='test -z "$ac_c_werror_flag"
-			 || test ! -s conftest.err'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  (exit $ac_status); } && {
+	 test -z "$ac_c_werror_flag" ||
+	 test ! -s conftest.err
+       } && test -s conftest.$ac_objext; then
+  ac_cv_header_stdc=yes
+else
+  $as_echo "$as_me: failed program was:" >&5
+sed 's/^/| /' conftest.$ac_ext >&5
+
+	ac_cv_header_stdc=no
+fi
+
+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+
+if test $ac_cv_header_stdc = yes; then
+  # SunOS 4.x string.h does not declare mem*, contrary to ANSI.
+  cat >conftest.$ac_ext <<_ACEOF
+/* confdefs.h.  */
+_ACEOF
+cat confdefs.h >>conftest.$ac_ext
+cat >>conftest.$ac_ext <<_ACEOF
+/* end confdefs.h.  */
+#include <string.h>
+
+_ACEOF
+if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
+  $EGREP "memchr" >/dev/null 2>&1; then
+  :
+else
+  ac_cv_header_stdc=no
+fi
+rm -f conftest*
+
+fi
+
+if test $ac_cv_header_stdc = yes; then
+  # ISC 2.0.2 stdlib.h does not declare free, contrary to ANSI.
+  cat >conftest.$ac_ext <<_ACEOF
+/* confdefs.h.  */
+_ACEOF
+cat confdefs.h >>conftest.$ac_ext
+cat >>conftest.$ac_ext <<_ACEOF
+/* end confdefs.h.  */
+#include <stdlib.h>
+
+_ACEOF
+if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
+  $EGREP "free" >/dev/null 2>&1; then
+  :
+else
+  ac_cv_header_stdc=no
+fi
+rm -f conftest*
+
+fi
+
+if test $ac_cv_header_stdc = yes; then
+  # /bin/cc in Irix-4.0.5 gets non-ANSI ctype macros unless using -ansi.
+  if test "$cross_compiling" = yes; then
+  :
+else
+  cat >conftest.$ac_ext <<_ACEOF
+/* confdefs.h.  */
+_ACEOF
+cat confdefs.h >>conftest.$ac_ext
+cat >>conftest.$ac_ext <<_ACEOF
+/* end confdefs.h.  */
+#include <ctype.h>
+#include <stdlib.h>
+#if ((' ' & 0x0FF) == 0x020)
+# define ISLOWER(c) ('a' <= (c) && (c) <= 'z')
+# define TOUPPER(c) (ISLOWER(c) ? 'A' + ((c) - 'a') : (c))
+#else
+# define ISLOWER(c) \
+		   (('a' <= (c) && (c) <= 'i') \
+		     || ('j' <= (c) && (c) <= 'r') \
+		     || ('s' <= (c) && (c) <= 'z'))
+# define TOUPPER(c) (ISLOWER(c) ? ((c) | 0x40) : (c))
+#endif
+
+#define XOR(e, f) (((e) && !(f)) || (!(e) && (f)))
+int
+main ()
+{
+  int i;
+  for (i = 0; i < 256; i++)
+    if (XOR (islower (i), ISLOWER (i))
+	|| toupper (i) != TOUPPER (i))
+      return 2;
+  return 0;
+}
+_ACEOF
+rm -f conftest$ac_exeext
+if { (ac_try="$ac_link"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_link") 2>&5
   ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; } &&
-	 { ac_try='test -s conftest.$ac_objext'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  (exit $ac_status); } && { ac_try='./conftest$ac_exeext'
+  { (case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_try") 2>&5
   ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
   (exit $ac_status); }; }; then
   :
 else
-  echo "$as_me: failed program was:" >&5
+  $as_echo "$as_me: program exited with status $ac_status" >&5
+$as_echo "$as_me: failed program was:" >&5
 sed 's/^/| /' conftest.$ac_ext >&5
 
-continue
-fi
-rm -f conftest.err conftest.$ac_objext conftest.$ac_ext
+( exit $ac_status )
+ac_cv_header_stdc=no
+fi
+rm -rf conftest.dSYM
+rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext conftest.$ac_objext conftest.$ac_ext
+fi
+
+
+fi
+fi
+{ $as_echo "$as_me:$LINENO: result: $ac_cv_header_stdc" >&5
+$as_echo "$ac_cv_header_stdc" >&6; }
+if test $ac_cv_header_stdc = yes; then
+
+cat >>confdefs.h <<\_ACEOF
+#define STDC_HEADERS 1
+_ACEOF
+
+fi
+
+# On IRIX 5.3, sys/types and inttypes.h are conflicting.
+
+
+
+
+
+
+
+
+
+for ac_header in sys/types.h sys/stat.h stdlib.h string.h memory.h strings.h \
+		  inttypes.h stdint.h unistd.h
+do
+as_ac_Header=`$as_echo "ac_cv_header_$ac_header" | $as_tr_sh`
+{ $as_echo "$as_me:$LINENO: checking for $ac_header" >&5
+$as_echo_n "checking for $ac_header... " >&6; }
+if { as_var=$as_ac_Header; eval "test \"\${$as_var+set}\" = set"; }; then
+  $as_echo_n "(cached) " >&6
+else
+  cat >conftest.$ac_ext <<_ACEOF
+/* confdefs.h.  */
+_ACEOF
+cat confdefs.h >>conftest.$ac_ext
+cat >>conftest.$ac_ext <<_ACEOF
+/* end confdefs.h.  */
+$ac_includes_default
+
+#include <$ac_header>
+_ACEOF
+rm -f conftest.$ac_objext
+if { (ac_try="$ac_compile"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_compile") 2>conftest.er1
+  ac_status=$?
+  grep -v '^ *+' conftest.er1 >conftest.err
+  rm -f conftest.er1
+  cat conftest.err >&5
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  (exit $ac_status); } && {
+	 test -z "$ac_c_werror_flag" ||
+	 test ! -s conftest.err
+       } && test -s conftest.$ac_objext; then
+  eval "$as_ac_Header=yes"
+else
+  $as_echo "$as_me: failed program was:" >&5
+sed 's/^/| /' conftest.$ac_ext >&5
+
+	eval "$as_ac_Header=no"
+fi
+
+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+fi
+ac_res=`eval 'as_val=${'$as_ac_Header'}
+		 $as_echo "$as_val"'`
+	       { $as_echo "$as_me:$LINENO: result: $ac_res" >&5
+$as_echo "$ac_res" >&6; }
+as_val=`eval 'as_val=${'$as_ac_Header'}
+		 $as_echo "$as_val"'`
+   if test "x$as_val" = x""yes; then
+  cat >>confdefs.h <<_ACEOF
+#define `$as_echo "HAVE_$ac_header" | $as_tr_cpp` 1
+_ACEOF
+
+fi
+
+done
+
+
+
+  if test "${ac_cv_header_minix_config_h+set}" = set; then
+  { $as_echo "$as_me:$LINENO: checking for minix/config.h" >&5
+$as_echo_n "checking for minix/config.h... " >&6; }
+if test "${ac_cv_header_minix_config_h+set}" = set; then
+  $as_echo_n "(cached) " >&6
+fi
+{ $as_echo "$as_me:$LINENO: result: $ac_cv_header_minix_config_h" >&5
+$as_echo "$ac_cv_header_minix_config_h" >&6; }
+else
+  # Is the header compilable?
+{ $as_echo "$as_me:$LINENO: checking minix/config.h usability" >&5
+$as_echo_n "checking minix/config.h usability... " >&6; }
+cat >conftest.$ac_ext <<_ACEOF
+/* confdefs.h.  */
+_ACEOF
+cat confdefs.h >>conftest.$ac_ext
+cat >>conftest.$ac_ext <<_ACEOF
+/* end confdefs.h.  */
+$ac_includes_default
+#include <minix/config.h>
+_ACEOF
+rm -f conftest.$ac_objext
+if { (ac_try="$ac_compile"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_compile") 2>conftest.er1
+  ac_status=$?
+  grep -v '^ *+' conftest.er1 >conftest.err
+  rm -f conftest.er1
+  cat conftest.err >&5
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  (exit $ac_status); } && {
+	 test -z "$ac_c_werror_flag" ||
+	 test ! -s conftest.err
+       } && test -s conftest.$ac_objext; then
+  ac_header_compiler=yes
+else
+  $as_echo "$as_me: failed program was:" >&5
+sed 's/^/| /' conftest.$ac_ext >&5
+
+	ac_header_compiler=no
+fi
+
+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+{ $as_echo "$as_me:$LINENO: result: $ac_header_compiler" >&5
+$as_echo "$ac_header_compiler" >&6; }
+
+# Is the header present?
+{ $as_echo "$as_me:$LINENO: checking minix/config.h presence" >&5
+$as_echo_n "checking minix/config.h presence... " >&6; }
+cat >conftest.$ac_ext <<_ACEOF
+/* confdefs.h.  */
+_ACEOF
+cat confdefs.h >>conftest.$ac_ext
+cat >>conftest.$ac_ext <<_ACEOF
+/* end confdefs.h.  */
+#include <minix/config.h>
+_ACEOF
+if { (ac_try="$ac_cpp conftest.$ac_ext"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_cpp conftest.$ac_ext") 2>conftest.er1
+  ac_status=$?
+  grep -v '^ *+' conftest.er1 >conftest.err
+  rm -f conftest.er1
+  cat conftest.err >&5
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  (exit $ac_status); } >/dev/null && {
+	 test -z "$ac_c_preproc_warn_flag$ac_c_werror_flag" ||
+	 test ! -s conftest.err
+       }; then
+  ac_header_preproc=yes
+else
+  $as_echo "$as_me: failed program was:" >&5
+sed 's/^/| /' conftest.$ac_ext >&5
+
+  ac_header_preproc=no
+fi
+
+rm -f conftest.err conftest.$ac_ext
+{ $as_echo "$as_me:$LINENO: result: $ac_header_preproc" >&5
+$as_echo "$ac_header_preproc" >&6; }
+
+# So?  What about this header?
+case $ac_header_compiler:$ac_header_preproc:$ac_c_preproc_warn_flag in
+  yes:no: )
+    { $as_echo "$as_me:$LINENO: WARNING: minix/config.h: accepted by the compiler, rejected by the preprocessor!" >&5
+$as_echo "$as_me: WARNING: minix/config.h: accepted by the compiler, rejected by the preprocessor!" >&2;}
+    { $as_echo "$as_me:$LINENO: WARNING: minix/config.h: proceeding with the compiler's result" >&5
+$as_echo "$as_me: WARNING: minix/config.h: proceeding with the compiler's result" >&2;}
+    ac_header_preproc=yes
+    ;;
+  no:yes:* )
+    { $as_echo "$as_me:$LINENO: WARNING: minix/config.h: present but cannot be compiled" >&5
+$as_echo "$as_me: WARNING: minix/config.h: present but cannot be compiled" >&2;}
+    { $as_echo "$as_me:$LINENO: WARNING: minix/config.h:     check for missing prerequisite headers?" >&5
+$as_echo "$as_me: WARNING: minix/config.h:     check for missing prerequisite headers?" >&2;}
+    { $as_echo "$as_me:$LINENO: WARNING: minix/config.h: see the Autoconf documentation" >&5
+$as_echo "$as_me: WARNING: minix/config.h: see the Autoconf documentation" >&2;}
+    { $as_echo "$as_me:$LINENO: WARNING: minix/config.h:     section \"Present But Cannot Be Compiled\"" >&5
+$as_echo "$as_me: WARNING: minix/config.h:     section \"Present But Cannot Be Compiled\"" >&2;}
+    { $as_echo "$as_me:$LINENO: WARNING: minix/config.h: proceeding with the preprocessor's result" >&5
+$as_echo "$as_me: WARNING: minix/config.h: proceeding with the preprocessor's result" >&2;}
+    { $as_echo "$as_me:$LINENO: WARNING: minix/config.h: in the future, the compiler will take precedence" >&5
+$as_echo "$as_me: WARNING: minix/config.h: in the future, the compiler will take precedence" >&2;}
+
+    ;;
+esac
+{ $as_echo "$as_me:$LINENO: checking for minix/config.h" >&5
+$as_echo_n "checking for minix/config.h... " >&6; }
+if test "${ac_cv_header_minix_config_h+set}" = set; then
+  $as_echo_n "(cached) " >&6
+else
+  ac_cv_header_minix_config_h=$ac_header_preproc
+fi
+{ $as_echo "$as_me:$LINENO: result: $ac_cv_header_minix_config_h" >&5
+$as_echo "$ac_cv_header_minix_config_h" >&6; }
+
+fi
+if test "x$ac_cv_header_minix_config_h" = x""yes; then
+  MINIX=yes
+else
+  MINIX=
+fi
+
+
+  if test "$MINIX" = yes; then
+
+cat >>confdefs.h <<\_ACEOF
+#define _POSIX_SOURCE 1
+_ACEOF
+
+
+cat >>confdefs.h <<\_ACEOF
+#define _POSIX_1_SOURCE 2
+_ACEOF
+
+
+cat >>confdefs.h <<\_ACEOF
+#define _MINIX 1
+_ACEOF
+
+  fi
+
+
+
+  { $as_echo "$as_me:$LINENO: checking whether it is safe to define __EXTENSIONS__" >&5
+$as_echo_n "checking whether it is safe to define __EXTENSIONS__... " >&6; }
+if test "${ac_cv_safe_to_define___extensions__+set}" = set; then
+  $as_echo_n "(cached) " >&6
+else
   cat >conftest.$ac_ext <<_ACEOF
 /* confdefs.h.  */
 _ACEOF
 cat confdefs.h >>conftest.$ac_ext
 cat >>conftest.$ac_ext <<_ACEOF
 /* end confdefs.h.  */
-$ac_declaration
+
+#	  define __EXTENSIONS__ 1
+	  $ac_includes_default
 int
 main ()
 {
-exit (42);
+
   ;
   return 0;
 }
 _ACEOF
 rm -f conftest.$ac_objext
-if { (eval echo "$as_me:$LINENO: \"$ac_compile\"") >&5
-  (eval $ac_compile) 2>conftest.er1
+if { (ac_try="$ac_compile"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_compile") 2>conftest.er1
   ac_status=$?
   grep -v '^ *+' conftest.er1 >conftest.err
   rm -f conftest.er1
   cat conftest.err >&5
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); } &&
-	 { ac_try='test -z "$ac_c_werror_flag"
-			 || test ! -s conftest.err'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
-  ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; } &&
-	 { ac_try='test -s conftest.$ac_objext'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
-  ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; }; then
-  break
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  (exit $ac_status); } && {
+	 test -z "$ac_c_werror_flag" ||
+	 test ! -s conftest.err
+       } && test -s conftest.$ac_objext; then
+  ac_cv_safe_to_define___extensions__=yes
 else
-  echo "$as_me: failed program was:" >&5
+  $as_echo "$as_me: failed program was:" >&5
 sed 's/^/| /' conftest.$ac_ext >&5
 
+	ac_cv_safe_to_define___extensions__=no
 fi
-rm -f conftest.err conftest.$ac_objext conftest.$ac_ext
-done
-rm -f conftest*
-if test -n "$ac_declaration"; then
-  echo '#ifdef __cplusplus' >>confdefs.h
-  echo $ac_declaration      >>confdefs.h
-  echo '#endif'             >>confdefs.h
+
+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
 fi
+{ $as_echo "$as_me:$LINENO: result: $ac_cv_safe_to_define___extensions__" >&5
+$as_echo "$ac_cv_safe_to_define___extensions__" >&6; }
+  test $ac_cv_safe_to_define___extensions__ = yes &&
+    cat >>confdefs.h <<\_ACEOF
+#define __EXTENSIONS__ 1
+_ACEOF
 
-else
-  echo "$as_me: failed program was:" >&5
-sed 's/^/| /' conftest.$ac_ext >&5
+  cat >>confdefs.h <<\_ACEOF
+#define _ALL_SOURCE 1
+_ACEOF
+
+  cat >>confdefs.h <<\_ACEOF
+#define _GNU_SOURCE 1
+_ACEOF
+
+  cat >>confdefs.h <<\_ACEOF
+#define _POSIX_PTHREAD_SEMANTICS 1
+_ACEOF
+
+  cat >>confdefs.h <<\_ACEOF
+#define _TANDEM_SOURCE 1
+_ACEOF
 
-fi
-rm -f conftest.err conftest.$ac_objext conftest.$ac_ext
-ac_ext=c
-ac_cpp='$CPP $CPPFLAGS'
-ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
-ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
-ac_compiler_gnu=$ac_cv_c_compiler_gnu
 
 # Find a good install program.  We prefer a C program (faster),
 # so one script is as good as another.  But avoid the broken or
@@ -2424,11 +3921,12 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
 # SVR4 /usr/ucb/install, which tries to use the nonexistent group "staff"
 # OS/2's system install, which has a completely different semantic
 # ./install, which can be erroneously created by make from ./install.sh.
-echo "$as_me:$LINENO: checking for a BSD-compatible install" >&5
-echo $ECHO_N "checking for a BSD-compatible install... $ECHO_C" >&6
+# Reject install programs that cannot install multiple files.
+{ $as_echo "$as_me:$LINENO: checking for a BSD-compatible install" >&5
+$as_echo_n "checking for a BSD-compatible install... " >&6; }
 if test -z "$INSTALL"; then
 if test "${ac_cv_path_install+set}" = set; then
-  echo $ECHO_N "(cached) $ECHO_C" >&6
+  $as_echo_n "(cached) " >&6
 else
   as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
 for as_dir in $PATH
@@ -2447,7 +3945,7 @@ case $as_dir/ in
     # by default.
     for ac_prog in ginstall scoinst install; do
       for ac_exec_ext in '' $ac_executable_extensions; do
-	if $as_executable_p "$as_dir/$ac_prog$ac_exec_ext"; then
+	if { test -f "$as_dir/$ac_prog$ac_exec_ext" && $as_test_x "$as_dir/$ac_prog$ac_exec_ext"; }; then
 	  if test $ac_prog = install &&
 	    grep dspmsg "$as_dir/$ac_prog$ac_exec_ext" >/dev/null 2>&1; then
 	    # AIX install.  It has an incompatible calling convention.
@@ -2457,30 +3955,43 @@ case $as_dir/ in
 	    # program-specific install script used by HP pwplus--don't use.
 	    :
 	  else
-	    ac_cv_path_install="$as_dir/$ac_prog$ac_exec_ext -c"
-	    break 3
+	    rm -rf conftest.one conftest.two conftest.dir
+	    echo one > conftest.one
+	    echo two > conftest.two
+	    mkdir conftest.dir
+	    if "$as_dir/$ac_prog$ac_exec_ext" -c conftest.one conftest.two "`pwd`/conftest.dir" &&
+	      test -s conftest.one && test -s conftest.two &&
+	      test -s conftest.dir/conftest.one &&
+	      test -s conftest.dir/conftest.two
+	    then
+	      ac_cv_path_install="$as_dir/$ac_prog$ac_exec_ext -c"
+	      break 3
+	    fi
 	  fi
 	fi
       done
     done
     ;;
 esac
+
 done
+IFS=$as_save_IFS
 
+rm -rf conftest.one conftest.two conftest.dir
 
 fi
   if test "${ac_cv_path_install+set}" = set; then
     INSTALL=$ac_cv_path_install
   else
-    # As a last resort, use the slow shell script.  We don't cache a
-    # path for INSTALL within a source directory, because that will
+    # As a last resort, use the slow shell script.  Don't cache a
+    # value for INSTALL within a source directory, because that will
     # break other packages using the cache if that directory is
-    # removed, or if the path is relative.
+    # removed, or if the value is a relative name.
     INSTALL=$ac_install_sh
   fi
 fi
-echo "$as_me:$LINENO: result: $INSTALL" >&5
-echo "${ECHO_T}$INSTALL" >&6
+{ $as_echo "$as_me:$LINENO: result: $INSTALL" >&5
+$as_echo "$INSTALL" >&6; }
 
 # Use test -z because SunOS4 sh mishandles braces in ${var-val}.
 # It thinks the first close brace ends the variable substitution.
@@ -2491,13 +4002,19 @@ test -z "$INSTALL_SCRIPT" && INSTALL_SCRIPT='${INSTALL}'
 test -z "$INSTALL_DATA" && INSTALL_DATA='${INSTALL} -m 644'
 
 
-if test "$ac_libiberty" = "NONE"; then
+if test "$ac_binutils_build_dir" != "NONE"; then
+  test "$ac_libbfd"               = "NONE" && ac_libbfd="$ac_binutils_build_dir/bfd/libbfd.a"
+  test "$ac_libiberty"            = "NONE" && ac_libiberty="$ac_binutils_build_dir/libiberty/libiberty.a"
+  test "$ac_bfd_include_dir"      = "NONE" && ac_bfd_include_dir="$ac_binutils_build_dir/bfd"
+  test "$ac_binutils_include_dir" = "NONE" && ac_binutils_include_dir="$ac_binutils_build_dir/include"
+fi
 
+if test "$ac_libiberty" = "NONE"; then
 
-echo "$as_me:$LINENO: checking for objalloc_create in -liberty" >&5
-echo $ECHO_N "checking for objalloc_create in -liberty... $ECHO_C" >&6
+{ $as_echo "$as_me:$LINENO: checking for objalloc_create in -liberty" >&5
+$as_echo_n "checking for objalloc_create in -liberty... " >&6; }
 if test "${ac_cv_lib_iberty_objalloc_create+set}" = set; then
-  echo $ECHO_N "(cached) $ECHO_C" >&6
+  $as_echo_n "(cached) " >&6
 else
   ac_check_lib_save_LIBS=$LIBS
 LIBS="-liberty  $LIBS"
@@ -2508,57 +4025,58 @@ cat confdefs.h >>conftest.$ac_ext
 cat >>conftest.$ac_ext <<_ACEOF
 /* end confdefs.h.  */
 
-/* Override any gcc2 internal prototype to avoid an error.  */
+/* Override any GCC internal prototype to avoid an error.
+   Use char because int might match the return type of a GCC
+   builtin and then its argument prototype would still apply.  */
 #ifdef __cplusplus
 extern "C"
 #endif
-/* We use char because int might match the return type of a gcc2
-   builtin and then its argument prototype would still apply.  */
 char objalloc_create ();
 int
 main ()
 {
-objalloc_create ();
+return objalloc_create ();
   ;
   return 0;
 }
 _ACEOF
 rm -f conftest.$ac_objext conftest$ac_exeext
-if { (eval echo "$as_me:$LINENO: \"$ac_link\"") >&5
-  (eval $ac_link) 2>conftest.er1
+if { (ac_try="$ac_link"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_link") 2>conftest.er1
   ac_status=$?
   grep -v '^ *+' conftest.er1 >conftest.err
   rm -f conftest.er1
   cat conftest.err >&5
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); } &&
-	 { ac_try='test -z "$ac_c_werror_flag"
-			 || test ! -s conftest.err'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
-  ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; } &&
-	 { ac_try='test -s conftest$ac_exeext'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
-  ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; }; then
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  (exit $ac_status); } && {
+	 test -z "$ac_c_werror_flag" ||
+	 test ! -s conftest.err
+       } && test -s conftest$ac_exeext && {
+	 test "$cross_compiling" = yes ||
+	 $as_test_x conftest$ac_exeext
+       }; then
   ac_cv_lib_iberty_objalloc_create=yes
 else
-  echo "$as_me: failed program was:" >&5
+  $as_echo "$as_me: failed program was:" >&5
 sed 's/^/| /' conftest.$ac_ext >&5
 
-ac_cv_lib_iberty_objalloc_create=no
+	ac_cv_lib_iberty_objalloc_create=no
 fi
-rm -f conftest.err conftest.$ac_objext \
+
+rm -rf conftest.dSYM
+rm -f core conftest.err conftest.$ac_objext conftest_ipa8_conftest.oo \
       conftest$ac_exeext conftest.$ac_ext
 LIBS=$ac_check_lib_save_LIBS
 fi
-echo "$as_me:$LINENO: result: $ac_cv_lib_iberty_objalloc_create" >&5
-echo "${ECHO_T}$ac_cv_lib_iberty_objalloc_create" >&6
-if test $ac_cv_lib_iberty_objalloc_create = yes; then
+{ $as_echo "$as_me:$LINENO: result: $ac_cv_lib_iberty_objalloc_create" >&5
+$as_echo "$ac_cv_lib_iberty_objalloc_create" >&6; }
+if test "x$ac_cv_lib_iberty_objalloc_create" = x""yes; then
   cat >>confdefs.h <<_ACEOF
 #define HAVE_LIBIBERTY 1
 _ACEOF
@@ -2573,10 +4091,10 @@ else
 fi
 if test "$ac_libbfd" = "NONE"; then
 
-echo "$as_me:$LINENO: checking for bfd_openr in -lbfd" >&5
-echo $ECHO_N "checking for bfd_openr in -lbfd... $ECHO_C" >&6
+{ $as_echo "$as_me:$LINENO: checking for bfd_openr in -lbfd" >&5
+$as_echo_n "checking for bfd_openr in -lbfd... " >&6; }
 if test "${ac_cv_lib_bfd_bfd_openr+set}" = set; then
-  echo $ECHO_N "(cached) $ECHO_C" >&6
+  $as_echo_n "(cached) " >&6
 else
   ac_check_lib_save_LIBS=$LIBS
 LIBS="-lbfd  $LIBS"
@@ -2587,57 +4105,58 @@ cat confdefs.h >>conftest.$ac_ext
 cat >>conftest.$ac_ext <<_ACEOF
 /* end confdefs.h.  */
 
-/* Override any gcc2 internal prototype to avoid an error.  */
+/* Override any GCC internal prototype to avoid an error.
+   Use char because int might match the return type of a GCC
+   builtin and then its argument prototype would still apply.  */
 #ifdef __cplusplus
 extern "C"
 #endif
-/* We use char because int might match the return type of a gcc2
-   builtin and then its argument prototype would still apply.  */
 char bfd_openr ();
 int
 main ()
 {
-bfd_openr ();
+return bfd_openr ();
   ;
   return 0;
 }
 _ACEOF
 rm -f conftest.$ac_objext conftest$ac_exeext
-if { (eval echo "$as_me:$LINENO: \"$ac_link\"") >&5
-  (eval $ac_link) 2>conftest.er1
+if { (ac_try="$ac_link"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_link") 2>conftest.er1
   ac_status=$?
   grep -v '^ *+' conftest.er1 >conftest.err
   rm -f conftest.er1
   cat conftest.err >&5
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); } &&
-	 { ac_try='test -z "$ac_c_werror_flag"
-			 || test ! -s conftest.err'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
-  ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; } &&
-	 { ac_try='test -s conftest$ac_exeext'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
-  ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; }; then
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  (exit $ac_status); } && {
+	 test -z "$ac_c_werror_flag" ||
+	 test ! -s conftest.err
+       } && test -s conftest$ac_exeext && {
+	 test "$cross_compiling" = yes ||
+	 $as_test_x conftest$ac_exeext
+       }; then
   ac_cv_lib_bfd_bfd_openr=yes
 else
-  echo "$as_me: failed program was:" >&5
+  $as_echo "$as_me: failed program was:" >&5
 sed 's/^/| /' conftest.$ac_ext >&5
 
-ac_cv_lib_bfd_bfd_openr=no
+	ac_cv_lib_bfd_bfd_openr=no
 fi
-rm -f conftest.err conftest.$ac_objext \
+
+rm -rf conftest.dSYM
+rm -f core conftest.err conftest.$ac_objext conftest_ipa8_conftest.oo \
       conftest$ac_exeext conftest.$ac_ext
 LIBS=$ac_check_lib_save_LIBS
 fi
-echo "$as_me:$LINENO: result: $ac_cv_lib_bfd_bfd_openr" >&5
-echo "${ECHO_T}$ac_cv_lib_bfd_bfd_openr" >&6
-if test $ac_cv_lib_bfd_bfd_openr = yes; then
+{ $as_echo "$as_me:$LINENO: result: $ac_cv_lib_bfd_bfd_openr" >&5
+$as_echo "$ac_cv_lib_bfd_bfd_openr" >&6; }
+if test "x$ac_cv_lib_bfd_bfd_openr" = x""yes; then
   cat >>confdefs.h <<_ACEOF
 #define HAVE_LIBBFD 1
 _ACEOF
@@ -2650,325 +4169,236 @@ fi
 else
   LIBS="$ac_libbfd $LIBS"
 fi
+if test "$ac_zlib_prefix" = "NONE"; then
 
-bfd_include_dir=
-if test "$ac_bfd_include_dir" != "NONE"; then
-  bfd_include_dir="-I$ac_bfd_include_dir"
-fi
-
-binutils_include_dir=
-if test "$ac_binutils_include_dir" != "NONE"; then
-  binutils_include_dir="-I$ac_binutils_include_dir"
-fi
-
-binutils_ldscript_dir=
-if test "$ac_binutils_ldscript_dir" = "NONE"; then
-  ac_binutils_ldscript_dir="\${TOOLDIR}/../${target_alias}/lib"
-fi
-binutils_ldscript_dir="$ac_binutils_ldscript_dir"
-
-if test "$ac_libbfd" = "NONE" -o "$ac_libiberty" = "NONE" ; then
-	{ { echo "$as_me:$LINENO: error:
-
-You need to specify the location of the libfd.a and libiberty.a
-host libraries from the binutils package.
-
-Run configure again specifying these options:
-
-  ./configure --target=<ARCH> --with-bfd-include-dir=<dir> --with-libbfd=<libbfd.a> --with-libiberty=<libiberty.a>
-" >&5
-echo "$as_me: error:
-
-You need to specify the location of the libfd.a and libiberty.a
-host libraries from the binutils package.
-
-Run configure again specifying these options:
-
-  ./configure --target=<ARCH> --with-bfd-include-dir=<dir> --with-libbfd=<libbfd.a> --with-libiberty=<libiberty.a>
-" >&2;}
-   { (exit 1); exit 1; }; }
-fi
-
-if test "$ac_bfd_include_dir" = "NONE" ; then
-	{ { echo "$as_me:$LINENO: error:
-
-You need to specify the location of the bfd.h header from a
-configured/compiled version of the binutils package for your target.
-Without this your elf2flt may crash as it will try to use the
-systems bfd.h which may be from a different binutils package.
-
-Run configure again specifying these options:
-
-  ./configure --target=<ARCH> --with-bfd-include-dir=<dir> --with-libbfd=<libbfd.a> --with-libiberty=<libiberty.a>
-" >&5
-echo "$as_me: error:
-
-You need to specify the location of the bfd.h header from a
-configured/compiled version of the binutils package for your target.
-Without this your elf2flt may crash as it will try to use the
-systems bfd.h which may be from a different binutils package.
-
-Run configure again specifying these options:
-
-  ./configure --target=<ARCH> --with-bfd-include-dir=<dir> --with-libbfd=<libbfd.a> --with-libiberty=<libiberty.a>
-" >&2;}
-   { (exit 1); exit 1; }; }
-fi
-
-ac_ext=c
-ac_cpp='$CPP $CPPFLAGS'
-ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
-ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
-ac_compiler_gnu=$ac_cv_c_compiler_gnu
-echo "$as_me:$LINENO: checking how to run the C preprocessor" >&5
-echo $ECHO_N "checking how to run the C preprocessor... $ECHO_C" >&6
-# On Suns, sometimes $CPP names a directory.
-if test -n "$CPP" && test -d "$CPP"; then
-  CPP=
-fi
-if test -z "$CPP"; then
-  if test "${ac_cv_prog_CPP+set}" = set; then
-  echo $ECHO_N "(cached) $ECHO_C" >&6
+{ $as_echo "$as_me:$LINENO: checking for deflate in -lz" >&5
+$as_echo_n "checking for deflate in -lz... " >&6; }
+if test "${ac_cv_lib_z_deflate+set}" = set; then
+  $as_echo_n "(cached) " >&6
 else
-      # Double quotes because CPP needs to be expanded
-    for CPP in "$CC -E" "$CC -E -traditional-cpp" "/lib/cpp"
-    do
-      ac_preproc_ok=false
-for ac_c_preproc_warn_flag in '' yes
-do
-  # Use a header file that comes with gcc, so configuring glibc
-  # with a fresh cross-compiler works.
-  # Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
-  # <limits.h> exists even on freestanding compilers.
-  # On the NeXT, cc -E runs the code through the compiler's parser,
-  # not just through cpp. "Syntax error" is here to catch this case.
-  cat >conftest.$ac_ext <<_ACEOF
+  ac_check_lib_save_LIBS=$LIBS
+LIBS="-lz  $LIBS"
+cat >conftest.$ac_ext <<_ACEOF
 /* confdefs.h.  */
 _ACEOF
 cat confdefs.h >>conftest.$ac_ext
 cat >>conftest.$ac_ext <<_ACEOF
 /* end confdefs.h.  */
-#ifdef __STDC__
-# include <limits.h>
-#else
-# include <assert.h>
+
+/* Override any GCC internal prototype to avoid an error.
+   Use char because int might match the return type of a GCC
+   builtin and then its argument prototype would still apply.  */
+#ifdef __cplusplus
+extern "C"
 #endif
-		     Syntax error
+char deflate ();
+int
+main ()
+{
+return deflate ();
+  ;
+  return 0;
+}
 _ACEOF
-if { (eval echo "$as_me:$LINENO: \"$ac_cpp conftest.$ac_ext\"") >&5
-  (eval $ac_cpp conftest.$ac_ext) 2>conftest.er1
+rm -f conftest.$ac_objext conftest$ac_exeext
+if { (ac_try="$ac_link"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_link") 2>conftest.er1
   ac_status=$?
   grep -v '^ *+' conftest.er1 >conftest.err
   rm -f conftest.er1
   cat conftest.err >&5
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); } >/dev/null; then
-  if test -s conftest.err; then
-    ac_cpp_err=$ac_c_preproc_warn_flag
-    ac_cpp_err=$ac_cpp_err$ac_c_werror_flag
-  else
-    ac_cpp_err=
-  fi
-else
-  ac_cpp_err=yes
-fi
-if test -z "$ac_cpp_err"; then
-  :
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  (exit $ac_status); } && {
+	 test -z "$ac_c_werror_flag" ||
+	 test ! -s conftest.err
+       } && test -s conftest$ac_exeext && {
+	 test "$cross_compiling" = yes ||
+	 $as_test_x conftest$ac_exeext
+       }; then
+  ac_cv_lib_z_deflate=yes
 else
-  echo "$as_me: failed program was:" >&5
+  $as_echo "$as_me: failed program was:" >&5
 sed 's/^/| /' conftest.$ac_ext >&5
 
-  # Broken: fails on valid input.
-continue
+	ac_cv_lib_z_deflate=no
 fi
-rm -f conftest.err conftest.$ac_ext
 
-  # OK, works on sane cases.  Now check whether non-existent headers
-  # can be detected and how.
-  cat >conftest.$ac_ext <<_ACEOF
-/* confdefs.h.  */
-_ACEOF
-cat confdefs.h >>conftest.$ac_ext
-cat >>conftest.$ac_ext <<_ACEOF
-/* end confdefs.h.  */
-#include <ac_nonexistent.h>
+rm -rf conftest.dSYM
+rm -f core conftest.err conftest.$ac_objext conftest_ipa8_conftest.oo \
+      conftest$ac_exeext conftest.$ac_ext
+LIBS=$ac_check_lib_save_LIBS
+fi
+{ $as_echo "$as_me:$LINENO: result: $ac_cv_lib_z_deflate" >&5
+$as_echo "$ac_cv_lib_z_deflate" >&6; }
+if test "x$ac_cv_lib_z_deflate" = x""yes; then
+  cat >>confdefs.h <<_ACEOF
+#define HAVE_LIBZ 1
 _ACEOF
-if { (eval echo "$as_me:$LINENO: \"$ac_cpp conftest.$ac_ext\"") >&5
-  (eval $ac_cpp conftest.$ac_ext) 2>conftest.er1
-  ac_status=$?
-  grep -v '^ *+' conftest.er1 >conftest.err
-  rm -f conftest.er1
-  cat conftest.err >&5
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); } >/dev/null; then
-  if test -s conftest.err; then
-    ac_cpp_err=$ac_c_preproc_warn_flag
-    ac_cpp_err=$ac_cpp_err$ac_c_werror_flag
-  else
-    ac_cpp_err=
-  fi
-else
-  ac_cpp_err=yes
+
+  LIBS="-lz $LIBS"
+
 fi
-if test -z "$ac_cpp_err"; then
-  # Broken: success on invalid input.
-continue
-else
-  echo "$as_me: failed program was:" >&5
-sed 's/^/| /' conftest.$ac_ext >&5
 
-  # Passes both tests.
-ac_preproc_ok=:
-break
+else
+  LIBS="-L$ac_zlib_prefix/lib -lz $LIBS"
 fi
-rm -f conftest.err conftest.$ac_ext
 
-done
-# Because of `break', _AC_PREPROC_IFELSE's cleaning code was skipped.
-rm -f conftest.err conftest.$ac_ext
-if $ac_preproc_ok; then
-  break
+bfd_include_dir=
+if test "$ac_bfd_include_dir" != "NONE"; then
+  bfd_include_dir="-I$ac_bfd_include_dir"
 fi
 
-    done
-    ac_cv_prog_CPP=$CPP
+binutils_include_dir=
+if test "$ac_binutils_include_dir" != "NONE"; then
+  binutils_include_dir="-I$ac_binutils_include_dir"
+fi
 
+zlib_include_dir=
+if test "$ac_zlib_prefix" != "NONE"; then
+  zlib_include_dir="-I$ac_zlib_prefix/include"
 fi
-  CPP=$ac_cv_prog_CPP
-else
-  ac_cv_prog_CPP=$CPP
+
+binutils_ldscript_dir=
+if test "$ac_binutils_ldscript_dir" = "NONE"; then
+  ac_binutils_ldscript_dir="\${TOOLDIR}/../${target_alias}/lib"
 fi
-echo "$as_me:$LINENO: result: $CPP" >&5
-echo "${ECHO_T}$CPP" >&6
-ac_preproc_ok=false
-for ac_c_preproc_warn_flag in '' yes
-do
-  # Use a header file that comes with gcc, so configuring glibc
-  # with a fresh cross-compiler works.
-  # Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
-  # <limits.h> exists even on freestanding compilers.
-  # On the NeXT, cc -E runs the code through the compiler's parser,
-  # not just through cpp. "Syntax error" is here to catch this case.
-  cat >conftest.$ac_ext <<_ACEOF
-/* confdefs.h.  */
-_ACEOF
-cat confdefs.h >>conftest.$ac_ext
-cat >>conftest.$ac_ext <<_ACEOF
-/* end confdefs.h.  */
-#ifdef __STDC__
-# include <limits.h>
-#else
-# include <assert.h>
-#endif
-		     Syntax error
-_ACEOF
-if { (eval echo "$as_me:$LINENO: \"$ac_cpp conftest.$ac_ext\"") >&5
-  (eval $ac_cpp conftest.$ac_ext) 2>conftest.er1
-  ac_status=$?
-  grep -v '^ *+' conftest.er1 >conftest.err
-  rm -f conftest.er1
-  cat conftest.err >&5
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); } >/dev/null; then
-  if test -s conftest.err; then
-    ac_cpp_err=$ac_c_preproc_warn_flag
-    ac_cpp_err=$ac_cpp_err$ac_c_werror_flag
-  else
-    ac_cpp_err=
-  fi
-else
-  ac_cpp_err=yes
+binutils_ldscript_dir="$ac_binutils_ldscript_dir"
+
+if test "$ac_libbfd" = "NONE" -o "$ac_libiberty" = "NONE" ; then
+	{ { $as_echo "$as_me:$LINENO: error:
+
+You need to specify the location of the libfd.a and libiberty.a
+host libraries from the binutils package.
+
+Run configure again specifying these options:
+
+  ./configure --target=<ARCH> --with-bfd-include-dir=<dir> --with-libbfd=<libbfd.a> --with-libiberty=<libiberty.a>
+" >&5
+$as_echo "$as_me: error:
+
+You need to specify the location of the libfd.a and libiberty.a
+host libraries from the binutils package.
+
+Run configure again specifying these options:
+
+  ./configure --target=<ARCH> --with-bfd-include-dir=<dir> --with-libbfd=<libbfd.a> --with-libiberty=<libiberty.a>
+" >&2;}
+   { (exit 1); exit 1; }; }
 fi
-if test -z "$ac_cpp_err"; then
-  :
-else
-  echo "$as_me: failed program was:" >&5
-sed 's/^/| /' conftest.$ac_ext >&5
 
-  # Broken: fails on valid input.
-continue
+if test "$ac_bfd_include_dir" = "NONE" ; then
+	{ { $as_echo "$as_me:$LINENO: error:
+
+You need to specify the location of the bfd.h header from a
+configured/compiled version of the binutils package for your target.
+Without this your elf2flt may crash as it will try to use the
+systems bfd.h which may be from a different binutils package.
+
+Run configure again specifying these options:
+
+  ./configure --target=<ARCH> --with-bfd-include-dir=<dir> --with-libbfd=<libbfd.a> --with-libiberty=<libiberty.a>
+" >&5
+$as_echo "$as_me: error:
+
+You need to specify the location of the bfd.h header from a
+configured/compiled version of the binutils package for your target.
+Without this your elf2flt may crash as it will try to use the
+systems bfd.h which may be from a different binutils package.
+
+Run configure again specifying these options:
+
+  ./configure --target=<ARCH> --with-bfd-include-dir=<dir> --with-libbfd=<libbfd.a> --with-libiberty=<libiberty.a>
+" >&2;}
+   { (exit 1); exit 1; }; }
 fi
-rm -f conftest.err conftest.$ac_ext
 
-  # OK, works on sane cases.  Now check whether non-existent headers
-  # can be detected and how.
-  cat >conftest.$ac_ext <<_ACEOF
+SYMBOL_PREFIX=
+case $target in
+	h8300|bfin*)
+		SYMBOL_PREFIX=_
+		;;
+esac
+
+{ $as_echo "$as_me:$LINENO: checking for malloc in -lc" >&5
+$as_echo_n "checking for malloc in -lc... " >&6; }
+if test "${ac_cv_lib_c_malloc+set}" = set; then
+  $as_echo_n "(cached) " >&6
+else
+  ac_check_lib_save_LIBS=$LIBS
+LIBS="-lc  $LIBS"
+cat >conftest.$ac_ext <<_ACEOF
 /* confdefs.h.  */
 _ACEOF
 cat confdefs.h >>conftest.$ac_ext
 cat >>conftest.$ac_ext <<_ACEOF
 /* end confdefs.h.  */
-#include <ac_nonexistent.h>
+
+/* Override any GCC internal prototype to avoid an error.
+   Use char because int might match the return type of a GCC
+   builtin and then its argument prototype would still apply.  */
+#ifdef __cplusplus
+extern "C"
+#endif
+char malloc ();
+int
+main ()
+{
+return malloc ();
+  ;
+  return 0;
+}
 _ACEOF
-if { (eval echo "$as_me:$LINENO: \"$ac_cpp conftest.$ac_ext\"") >&5
-  (eval $ac_cpp conftest.$ac_ext) 2>conftest.er1
+rm -f conftest.$ac_objext conftest$ac_exeext
+if { (ac_try="$ac_link"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_link") 2>conftest.er1
   ac_status=$?
   grep -v '^ *+' conftest.er1 >conftest.err
   rm -f conftest.er1
   cat conftest.err >&5
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); } >/dev/null; then
-  if test -s conftest.err; then
-    ac_cpp_err=$ac_c_preproc_warn_flag
-    ac_cpp_err=$ac_cpp_err$ac_c_werror_flag
-  else
-    ac_cpp_err=
-  fi
-else
-  ac_cpp_err=yes
-fi
-if test -z "$ac_cpp_err"; then
-  # Broken: success on invalid input.
-continue
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  (exit $ac_status); } && {
+	 test -z "$ac_c_werror_flag" ||
+	 test ! -s conftest.err
+       } && test -s conftest$ac_exeext && {
+	 test "$cross_compiling" = yes ||
+	 $as_test_x conftest$ac_exeext
+       }; then
+  ac_cv_lib_c_malloc=yes
 else
-  echo "$as_me: failed program was:" >&5
+  $as_echo "$as_me: failed program was:" >&5
 sed 's/^/| /' conftest.$ac_ext >&5
 
-  # Passes both tests.
-ac_preproc_ok=:
-break
+	ac_cv_lib_c_malloc=no
 fi
-rm -f conftest.err conftest.$ac_ext
 
-done
-# Because of `break', _AC_PREPROC_IFELSE's cleaning code was skipped.
-rm -f conftest.err conftest.$ac_ext
-if $ac_preproc_ok; then
-  :
-else
-  { { echo "$as_me:$LINENO: error: C preprocessor \"$CPP\" fails sanity check
-See \`config.log' for more details." >&5
-echo "$as_me: error: C preprocessor \"$CPP\" fails sanity check
-See \`config.log' for more details." >&2;}
-   { (exit 1); exit 1; }; }
+rm -rf conftest.dSYM
+rm -f core conftest.err conftest.$ac_objext conftest_ipa8_conftest.oo \
+      conftest$ac_exeext conftest.$ac_ext
+LIBS=$ac_check_lib_save_LIBS
 fi
-
-ac_ext=c
-ac_cpp='$CPP $CPPFLAGS'
-ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
-ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
-ac_compiler_gnu=$ac_cv_c_compiler_gnu
-
-
-echo "$as_me:$LINENO: checking for egrep" >&5
-echo $ECHO_N "checking for egrep... $ECHO_C" >&6
-if test "${ac_cv_prog_egrep+set}" = set; then
-  echo $ECHO_N "(cached) $ECHO_C" >&6
-else
-  if echo a | (grep -E '(a|b)') >/dev/null 2>&1
-    then ac_cv_prog_egrep='grep -E'
-    else ac_cv_prog_egrep='egrep'
-    fi
+{ $as_echo "$as_me:$LINENO: result: $ac_cv_lib_c_malloc" >&5
+$as_echo "$ac_cv_lib_c_malloc" >&6; }
+if test "x$ac_cv_lib_c_malloc" = x""yes; then
+  LIBS="-lc $LIBS"
 fi
-echo "$as_me:$LINENO: result: $ac_cv_prog_egrep" >&5
-echo "${ECHO_T}$ac_cv_prog_egrep" >&6
- EGREP=$ac_cv_prog_egrep
 
 
-echo "$as_me:$LINENO: checking for ANSI C header files" >&5
-echo $ECHO_N "checking for ANSI C header files... $ECHO_C" >&6
+{ $as_echo "$as_me:$LINENO: checking for ANSI C header files" >&5
+$as_echo_n "checking for ANSI C header files... " >&6; }
 if test "${ac_cv_header_stdc+set}" = set; then
-  echo $ECHO_N "(cached) $ECHO_C" >&6
+  $as_echo_n "(cached) " >&6
 else
   cat >conftest.$ac_ext <<_ACEOF
 /* confdefs.h.  */
@@ -2990,35 +4420,32 @@ main ()
 }
 _ACEOF
 rm -f conftest.$ac_objext
-if { (eval echo "$as_me:$LINENO: \"$ac_compile\"") >&5
-  (eval $ac_compile) 2>conftest.er1
+if { (ac_try="$ac_compile"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_compile") 2>conftest.er1
   ac_status=$?
   grep -v '^ *+' conftest.er1 >conftest.err
   rm -f conftest.er1
   cat conftest.err >&5
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); } &&
-	 { ac_try='test -z "$ac_c_werror_flag"
-			 || test ! -s conftest.err'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
-  ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; } &&
-	 { ac_try='test -s conftest.$ac_objext'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
-  ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; }; then
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  (exit $ac_status); } && {
+	 test -z "$ac_c_werror_flag" ||
+	 test ! -s conftest.err
+       } && test -s conftest.$ac_objext; then
   ac_cv_header_stdc=yes
 else
-  echo "$as_me: failed program was:" >&5
+  $as_echo "$as_me: failed program was:" >&5
 sed 's/^/| /' conftest.$ac_ext >&5
 
-ac_cv_header_stdc=no
+	ac_cv_header_stdc=no
 fi
-rm -f conftest.err conftest.$ac_objext conftest.$ac_ext
+
+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
 
 if test $ac_cv_header_stdc = yes; then
   # SunOS 4.x string.h does not declare mem*, contrary to ANSI.
@@ -3074,6 +4501,7 @@ cat confdefs.h >>conftest.$ac_ext
 cat >>conftest.$ac_ext <<_ACEOF
 /* end confdefs.h.  */
 #include <ctype.h>
+#include <stdlib.h>
 #if ((' ' & 0x0FF) == 0x020)
 # define ISLOWER(c) ('a' <= (c) && (c) <= 'z')
 # define TOUPPER(c) (ISLOWER(c) ? 'A' + ((c) - 'a') : (c))
@@ -3093,36 +4521,50 @@ main ()
   for (i = 0; i < 256; i++)
     if (XOR (islower (i), ISLOWER (i))
 	|| toupper (i) != TOUPPER (i))
-      exit(2);
-  exit (0);
+      return 2;
+  return 0;
 }
 _ACEOF
 rm -f conftest$ac_exeext
-if { (eval echo "$as_me:$LINENO: \"$ac_link\"") >&5
-  (eval $ac_link) 2>&5
+if { (ac_try="$ac_link"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_link") 2>&5
   ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
   (exit $ac_status); } && { ac_try='./conftest$ac_exeext'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
+  { (case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_try") 2>&5
   ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
   (exit $ac_status); }; }; then
   :
 else
-  echo "$as_me: program exited with status $ac_status" >&5
-echo "$as_me: failed program was:" >&5
+  $as_echo "$as_me: program exited with status $ac_status" >&5
+$as_echo "$as_me: failed program was:" >&5
 sed 's/^/| /' conftest.$ac_ext >&5
 
 ( exit $ac_status )
 ac_cv_header_stdc=no
 fi
-rm -f core *.core gmon.out bb.out conftest$ac_exeext conftest.$ac_objext conftest.$ac_ext
+rm -rf conftest.dSYM
+rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext conftest.$ac_objext conftest.$ac_ext
 fi
+
+
 fi
 fi
-echo "$as_me:$LINENO: result: $ac_cv_header_stdc" >&5
-echo "${ECHO_T}$ac_cv_header_stdc" >&6
+{ $as_echo "$as_me:$LINENO: result: $ac_cv_header_stdc" >&5
+$as_echo "$ac_cv_header_stdc" >&6; }
 if test $ac_cv_header_stdc = yes; then
 
 cat >>confdefs.h <<\_ACEOF
@@ -3131,96 +4573,26 @@ _ACEOF
 
 fi
 
-# On IRIX 5.3, sys/types and inttypes.h are conflicting.
-
-
-
-
-
-
-
-
-
-for ac_header in sys/types.h sys/stat.h stdlib.h string.h memory.h strings.h \
-		  inttypes.h stdint.h unistd.h
-do
-as_ac_Header=`echo "ac_cv_header_$ac_header" | $as_tr_sh`
-echo "$as_me:$LINENO: checking for $ac_header" >&5
-echo $ECHO_N "checking for $ac_header... $ECHO_C" >&6
-if eval "test \"\${$as_ac_Header+set}\" = set"; then
-  echo $ECHO_N "(cached) $ECHO_C" >&6
-else
-  cat >conftest.$ac_ext <<_ACEOF
-/* confdefs.h.  */
-_ACEOF
-cat confdefs.h >>conftest.$ac_ext
-cat >>conftest.$ac_ext <<_ACEOF
-/* end confdefs.h.  */
-$ac_includes_default
-
-#include <$ac_header>
-_ACEOF
-rm -f conftest.$ac_objext
-if { (eval echo "$as_me:$LINENO: \"$ac_compile\"") >&5
-  (eval $ac_compile) 2>conftest.er1
-  ac_status=$?
-  grep -v '^ *+' conftest.er1 >conftest.err
-  rm -f conftest.er1
-  cat conftest.err >&5
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); } &&
-	 { ac_try='test -z "$ac_c_werror_flag"
-			 || test ! -s conftest.err'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
-  ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; } &&
-	 { ac_try='test -s conftest.$ac_objext'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
-  ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; }; then
-  eval "$as_ac_Header=yes"
-else
-  echo "$as_me: failed program was:" >&5
-sed 's/^/| /' conftest.$ac_ext >&5
-
-eval "$as_ac_Header=no"
-fi
-rm -f conftest.err conftest.$ac_objext conftest.$ac_ext
-fi
-echo "$as_me:$LINENO: result: `eval echo '${'$as_ac_Header'}'`" >&5
-echo "${ECHO_T}`eval echo '${'$as_ac_Header'}'`" >&6
-if test `eval echo '${'$as_ac_Header'}'` = yes; then
-  cat >>confdefs.h <<_ACEOF
-#define `echo "HAVE_$ac_header" | $as_tr_cpp` 1
-_ACEOF
-
-fi
-
-done
-
-
 
 
 
 for ac_header in fcntl.h unistd.h bfd.h
 do
-as_ac_Header=`echo "ac_cv_header_$ac_header" | $as_tr_sh`
-if eval "test \"\${$as_ac_Header+set}\" = set"; then
-  echo "$as_me:$LINENO: checking for $ac_header" >&5
-echo $ECHO_N "checking for $ac_header... $ECHO_C" >&6
-if eval "test \"\${$as_ac_Header+set}\" = set"; then
-  echo $ECHO_N "(cached) $ECHO_C" >&6
-fi
-echo "$as_me:$LINENO: result: `eval echo '${'$as_ac_Header'}'`" >&5
-echo "${ECHO_T}`eval echo '${'$as_ac_Header'}'`" >&6
+as_ac_Header=`$as_echo "ac_cv_header_$ac_header" | $as_tr_sh`
+if { as_var=$as_ac_Header; eval "test \"\${$as_var+set}\" = set"; }; then
+  { $as_echo "$as_me:$LINENO: checking for $ac_header" >&5
+$as_echo_n "checking for $ac_header... " >&6; }
+if { as_var=$as_ac_Header; eval "test \"\${$as_var+set}\" = set"; }; then
+  $as_echo_n "(cached) " >&6
+fi
+ac_res=`eval 'as_val=${'$as_ac_Header'}
+		 $as_echo "$as_val"'`
+	       { $as_echo "$as_me:$LINENO: result: $ac_res" >&5
+$as_echo "$ac_res" >&6; }
 else
   # Is the header compilable?
-echo "$as_me:$LINENO: checking $ac_header usability" >&5
-echo $ECHO_N "checking $ac_header usability... $ECHO_C" >&6
+{ $as_echo "$as_me:$LINENO: checking $ac_header usability" >&5
+$as_echo_n "checking $ac_header usability... " >&6; }
 cat >conftest.$ac_ext <<_ACEOF
 /* confdefs.h.  */
 _ACEOF
@@ -3231,41 +4603,38 @@ $ac_includes_default
 #include <$ac_header>
 _ACEOF
 rm -f conftest.$ac_objext
-if { (eval echo "$as_me:$LINENO: \"$ac_compile\"") >&5
-  (eval $ac_compile) 2>conftest.er1
+if { (ac_try="$ac_compile"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_compile") 2>conftest.er1
   ac_status=$?
   grep -v '^ *+' conftest.er1 >conftest.err
   rm -f conftest.er1
   cat conftest.err >&5
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); } &&
-	 { ac_try='test -z "$ac_c_werror_flag"
-			 || test ! -s conftest.err'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
-  ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; } &&
-	 { ac_try='test -s conftest.$ac_objext'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
-  ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; }; then
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  (exit $ac_status); } && {
+	 test -z "$ac_c_werror_flag" ||
+	 test ! -s conftest.err
+       } && test -s conftest.$ac_objext; then
   ac_header_compiler=yes
 else
-  echo "$as_me: failed program was:" >&5
+  $as_echo "$as_me: failed program was:" >&5
 sed 's/^/| /' conftest.$ac_ext >&5
 
-ac_header_compiler=no
+	ac_header_compiler=no
 fi
-rm -f conftest.err conftest.$ac_objext conftest.$ac_ext
-echo "$as_me:$LINENO: result: $ac_header_compiler" >&5
-echo "${ECHO_T}$ac_header_compiler" >&6
+
+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+{ $as_echo "$as_me:$LINENO: result: $ac_header_compiler" >&5
+$as_echo "$ac_header_compiler" >&6; }
 
 # Is the header present?
-echo "$as_me:$LINENO: checking $ac_header presence" >&5
-echo $ECHO_N "checking $ac_header presence... $ECHO_C" >&6
+{ $as_echo "$as_me:$LINENO: checking $ac_header presence" >&5
+$as_echo_n "checking $ac_header presence... " >&6; }
 cat >conftest.$ac_ext <<_ACEOF
 /* confdefs.h.  */
 _ACEOF
@@ -3274,81 +4643,78 @@ cat >>conftest.$ac_ext <<_ACEOF
 /* end confdefs.h.  */
 #include <$ac_header>
 _ACEOF
-if { (eval echo "$as_me:$LINENO: \"$ac_cpp conftest.$ac_ext\"") >&5
-  (eval $ac_cpp conftest.$ac_ext) 2>conftest.er1
+if { (ac_try="$ac_cpp conftest.$ac_ext"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_cpp conftest.$ac_ext") 2>conftest.er1
   ac_status=$?
   grep -v '^ *+' conftest.er1 >conftest.err
   rm -f conftest.er1
   cat conftest.err >&5
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); } >/dev/null; then
-  if test -s conftest.err; then
-    ac_cpp_err=$ac_c_preproc_warn_flag
-    ac_cpp_err=$ac_cpp_err$ac_c_werror_flag
-  else
-    ac_cpp_err=
-  fi
-else
-  ac_cpp_err=yes
-fi
-if test -z "$ac_cpp_err"; then
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  (exit $ac_status); } >/dev/null && {
+	 test -z "$ac_c_preproc_warn_flag$ac_c_werror_flag" ||
+	 test ! -s conftest.err
+       }; then
   ac_header_preproc=yes
 else
-  echo "$as_me: failed program was:" >&5
+  $as_echo "$as_me: failed program was:" >&5
 sed 's/^/| /' conftest.$ac_ext >&5
 
   ac_header_preproc=no
 fi
+
 rm -f conftest.err conftest.$ac_ext
-echo "$as_me:$LINENO: result: $ac_header_preproc" >&5
-echo "${ECHO_T}$ac_header_preproc" >&6
+{ $as_echo "$as_me:$LINENO: result: $ac_header_preproc" >&5
+$as_echo "$ac_header_preproc" >&6; }
 
 # So?  What about this header?
 case $ac_header_compiler:$ac_header_preproc:$ac_c_preproc_warn_flag in
   yes:no: )
-    { echo "$as_me:$LINENO: WARNING: $ac_header: accepted by the compiler, rejected by the preprocessor!" >&5
-echo "$as_me: WARNING: $ac_header: accepted by the compiler, rejected by the preprocessor!" >&2;}
-    { echo "$as_me:$LINENO: WARNING: $ac_header: proceeding with the compiler's result" >&5
-echo "$as_me: WARNING: $ac_header: proceeding with the compiler's result" >&2;}
+    { $as_echo "$as_me:$LINENO: WARNING: $ac_header: accepted by the compiler, rejected by the preprocessor!" >&5
+$as_echo "$as_me: WARNING: $ac_header: accepted by the compiler, rejected by the preprocessor!" >&2;}
+    { $as_echo "$as_me:$LINENO: WARNING: $ac_header: proceeding with the compiler's result" >&5
+$as_echo "$as_me: WARNING: $ac_header: proceeding with the compiler's result" >&2;}
     ac_header_preproc=yes
     ;;
   no:yes:* )
-    { echo "$as_me:$LINENO: WARNING: $ac_header: present but cannot be compiled" >&5
-echo "$as_me: WARNING: $ac_header: present but cannot be compiled" >&2;}
-    { echo "$as_me:$LINENO: WARNING: $ac_header:     check for missing prerequisite headers?" >&5
-echo "$as_me: WARNING: $ac_header:     check for missing prerequisite headers?" >&2;}
-    { echo "$as_me:$LINENO: WARNING: $ac_header: see the Autoconf documentation" >&5
-echo "$as_me: WARNING: $ac_header: see the Autoconf documentation" >&2;}
-    { echo "$as_me:$LINENO: WARNING: $ac_header:     section \"Present But Cannot Be Compiled\"" >&5
-echo "$as_me: WARNING: $ac_header:     section \"Present But Cannot Be Compiled\"" >&2;}
-    { echo "$as_me:$LINENO: WARNING: $ac_header: proceeding with the preprocessor's result" >&5
-echo "$as_me: WARNING: $ac_header: proceeding with the preprocessor's result" >&2;}
-    { echo "$as_me:$LINENO: WARNING: $ac_header: in the future, the compiler will take precedence" >&5
-echo "$as_me: WARNING: $ac_header: in the future, the compiler will take precedence" >&2;}
-    (
-      cat <<\_ASBOX
-## ------------------------------------------ ##
-## Report this to the AC_PACKAGE_NAME lists.  ##
-## ------------------------------------------ ##
-_ASBOX
-    ) |
-      sed "s/^/$as_me: WARNING:     /" >&2
+    { $as_echo "$as_me:$LINENO: WARNING: $ac_header: present but cannot be compiled" >&5
+$as_echo "$as_me: WARNING: $ac_header: present but cannot be compiled" >&2;}
+    { $as_echo "$as_me:$LINENO: WARNING: $ac_header:     check for missing prerequisite headers?" >&5
+$as_echo "$as_me: WARNING: $ac_header:     check for missing prerequisite headers?" >&2;}
+    { $as_echo "$as_me:$LINENO: WARNING: $ac_header: see the Autoconf documentation" >&5
+$as_echo "$as_me: WARNING: $ac_header: see the Autoconf documentation" >&2;}
+    { $as_echo "$as_me:$LINENO: WARNING: $ac_header:     section \"Present But Cannot Be Compiled\"" >&5
+$as_echo "$as_me: WARNING: $ac_header:     section \"Present But Cannot Be Compiled\"" >&2;}
+    { $as_echo "$as_me:$LINENO: WARNING: $ac_header: proceeding with the preprocessor's result" >&5
+$as_echo "$as_me: WARNING: $ac_header: proceeding with the preprocessor's result" >&2;}
+    { $as_echo "$as_me:$LINENO: WARNING: $ac_header: in the future, the compiler will take precedence" >&5
+$as_echo "$as_me: WARNING: $ac_header: in the future, the compiler will take precedence" >&2;}
+
     ;;
 esac
-echo "$as_me:$LINENO: checking for $ac_header" >&5
-echo $ECHO_N "checking for $ac_header... $ECHO_C" >&6
-if eval "test \"\${$as_ac_Header+set}\" = set"; then
-  echo $ECHO_N "(cached) $ECHO_C" >&6
+{ $as_echo "$as_me:$LINENO: checking for $ac_header" >&5
+$as_echo_n "checking for $ac_header... " >&6; }
+if { as_var=$as_ac_Header; eval "test \"\${$as_var+set}\" = set"; }; then
+  $as_echo_n "(cached) " >&6
 else
   eval "$as_ac_Header=\$ac_header_preproc"
 fi
-echo "$as_me:$LINENO: result: `eval echo '${'$as_ac_Header'}'`" >&5
-echo "${ECHO_T}`eval echo '${'$as_ac_Header'}'`" >&6
+ac_res=`eval 'as_val=${'$as_ac_Header'}
+		 $as_echo "$as_val"'`
+	       { $as_echo "$as_me:$LINENO: result: $ac_res" >&5
+$as_echo "$ac_res" >&6; }
 
 fi
-if test `eval echo '${'$as_ac_Header'}'` = yes; then
+as_val=`eval 'as_val=${'$as_ac_Header'}
+		 $as_echo "$as_val"'`
+   if test "x$as_val" = x""yes; then
   cat >>confdefs.h <<_ACEOF
-#define `echo "HAVE_$ac_header" | $as_tr_cpp` 1
+#define `$as_echo "HAVE_$ac_header" | $as_tr_cpp` 1
 _ACEOF
 
 fi
@@ -3356,10 +4722,10 @@ fi
 done
 
 
-echo "$as_me:$LINENO: checking for an ANSI C-conforming const" >&5
-echo $ECHO_N "checking for an ANSI C-conforming const... $ECHO_C" >&6
+{ $as_echo "$as_me:$LINENO: checking for an ANSI C-conforming const" >&5
+$as_echo_n "checking for an ANSI C-conforming const... " >&6; }
 if test "${ac_cv_c_const+set}" = set; then
-  echo $ECHO_N "(cached) $ECHO_C" >&6
+  $as_echo_n "(cached) " >&6
 else
   cat >conftest.$ac_ext <<_ACEOF
 /* confdefs.h.  */
@@ -3375,10 +4741,10 @@ main ()
 #ifndef __cplusplus
   /* Ultrix mips cc rejects this.  */
   typedef int charset[2];
-  const charset x;
+  const charset cs;
   /* SunOS 4.1.1 cc rejects this.  */
-  char const *const *ccp;
-  char **p;
+  char const *const *pcpcc;
+  char **ppc;
   /* NEC SVR4.0.2 mips cc rejects this.  */
   struct point {int x, y;};
   static struct point const zero = {0,0};
@@ -3387,16 +4753,17 @@ main ()
      an arm of an if-expression whose if-part is not a constant
      expression */
   const char *g = "string";
-  ccp = &g + (g ? g-g : 0);
+  pcpcc = &g + (g ? g-g : 0);
   /* HPUX 7.0 cc rejects these. */
-  ++ccp;
-  p = (char**) ccp;
-  ccp = (char const *const *) p;
+  ++pcpcc;
+  ppc = (char**) pcpcc;
+  pcpcc = (char const *const *) ppc;
   { /* SCO 3.2v4 cc rejects this.  */
     char *t;
     char const *s = 0 ? (char *) 0 : (char const *) 0;
 
     *t++ = 0;
+    if (s) return 0;
   }
   { /* Someone thinks the Sun supposedly-ANSI compiler will reject this.  */
     int x[] = {25, 17};
@@ -3415,7 +4782,9 @@ main ()
   }
   { /* ULTRIX-32 V3.1 (Rev 9) vcc rejects this */
     const int foo = 10;
+    if (!foo) return 0;
   }
+  return !cs[0] && !zero.x;
 #endif
 
   ;
@@ -3423,42 +4792,39 @@ main ()
 }
 _ACEOF
 rm -f conftest.$ac_objext
-if { (eval echo "$as_me:$LINENO: \"$ac_compile\"") >&5
-  (eval $ac_compile) 2>conftest.er1
+if { (ac_try="$ac_compile"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_compile") 2>conftest.er1
   ac_status=$?
   grep -v '^ *+' conftest.er1 >conftest.err
   rm -f conftest.er1
   cat conftest.err >&5
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); } &&
-	 { ac_try='test -z "$ac_c_werror_flag"
-			 || test ! -s conftest.err'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
-  ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; } &&
-	 { ac_try='test -s conftest.$ac_objext'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
-  ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; }; then
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  (exit $ac_status); } && {
+	 test -z "$ac_c_werror_flag" ||
+	 test ! -s conftest.err
+       } && test -s conftest.$ac_objext; then
   ac_cv_c_const=yes
 else
-  echo "$as_me: failed program was:" >&5
+  $as_echo "$as_me: failed program was:" >&5
 sed 's/^/| /' conftest.$ac_ext >&5
 
-ac_cv_c_const=no
+	ac_cv_c_const=no
 fi
-rm -f conftest.err conftest.$ac_objext conftest.$ac_ext
+
+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
 fi
-echo "$as_me:$LINENO: result: $ac_cv_c_const" >&5
-echo "${ECHO_T}$ac_cv_c_const" >&6
+{ $as_echo "$as_me:$LINENO: result: $ac_cv_c_const" >&5
+$as_echo "$ac_cv_c_const" >&6; }
 if test $ac_cv_c_const = no; then
 
 cat >>confdefs.h <<\_ACEOF
-#define const
+#define const /**/
 _ACEOF
 
 fi
@@ -3467,11 +4833,11 @@ fi
 
 for ac_func in vprintf
 do
-as_ac_var=`echo "ac_cv_func_$ac_func" | $as_tr_sh`
-echo "$as_me:$LINENO: checking for $ac_func" >&5
-echo $ECHO_N "checking for $ac_func... $ECHO_C" >&6
-if eval "test \"\${$as_ac_var+set}\" = set"; then
-  echo $ECHO_N "(cached) $ECHO_C" >&6
+as_ac_var=`$as_echo "ac_cv_func_$ac_func" | $as_tr_sh`
+{ $as_echo "$as_me:$LINENO: checking for $ac_func" >&5
+$as_echo_n "checking for $ac_func... " >&6; }
+if { as_var=$as_ac_var; eval "test \"\${$as_var+set}\" = set"; }; then
+  $as_echo_n "(cached) " >&6
 else
   cat >conftest.$ac_ext <<_ACEOF
 /* confdefs.h.  */
@@ -3496,77 +4862,76 @@ cat >>conftest.$ac_ext <<_ACEOF
 
 #undef $ac_func
 
-/* Override any gcc2 internal prototype to avoid an error.  */
+/* Override any GCC internal prototype to avoid an error.
+   Use char because int might match the return type of a GCC
+   builtin and then its argument prototype would still apply.  */
 #ifdef __cplusplus
 extern "C"
-{
 #endif
-/* We use char because int might match the return type of a gcc2
-   builtin and then its argument prototype would still apply.  */
 char $ac_func ();
 /* The GNU C library defines this for functions which it implements
     to always fail with ENOSYS.  Some functions are actually named
     something starting with __ and the normal name is an alias.  */
-#if defined (__stub_$ac_func) || defined (__stub___$ac_func)
+#if defined __stub_$ac_func || defined __stub___$ac_func
 choke me
-#else
-char (*f) () = $ac_func;
-#endif
-#ifdef __cplusplus
-}
 #endif
 
 int
 main ()
 {
-return f != $ac_func;
+return $ac_func ();
   ;
   return 0;
 }
 _ACEOF
 rm -f conftest.$ac_objext conftest$ac_exeext
-if { (eval echo "$as_me:$LINENO: \"$ac_link\"") >&5
-  (eval $ac_link) 2>conftest.er1
+if { (ac_try="$ac_link"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_link") 2>conftest.er1
   ac_status=$?
   grep -v '^ *+' conftest.er1 >conftest.err
   rm -f conftest.er1
   cat conftest.err >&5
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); } &&
-	 { ac_try='test -z "$ac_c_werror_flag"
-			 || test ! -s conftest.err'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
-  ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; } &&
-	 { ac_try='test -s conftest$ac_exeext'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
-  ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; }; then
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  (exit $ac_status); } && {
+	 test -z "$ac_c_werror_flag" ||
+	 test ! -s conftest.err
+       } && test -s conftest$ac_exeext && {
+	 test "$cross_compiling" = yes ||
+	 $as_test_x conftest$ac_exeext
+       }; then
   eval "$as_ac_var=yes"
 else
-  echo "$as_me: failed program was:" >&5
+  $as_echo "$as_me: failed program was:" >&5
 sed 's/^/| /' conftest.$ac_ext >&5
 
-eval "$as_ac_var=no"
+	eval "$as_ac_var=no"
 fi
-rm -f conftest.err conftest.$ac_objext \
+
+rm -rf conftest.dSYM
+rm -f core conftest.err conftest.$ac_objext conftest_ipa8_conftest.oo \
       conftest$ac_exeext conftest.$ac_ext
 fi
-echo "$as_me:$LINENO: result: `eval echo '${'$as_ac_var'}'`" >&5
-echo "${ECHO_T}`eval echo '${'$as_ac_var'}'`" >&6
-if test `eval echo '${'$as_ac_var'}'` = yes; then
+ac_res=`eval 'as_val=${'$as_ac_var'}
+		 $as_echo "$as_val"'`
+	       { $as_echo "$as_me:$LINENO: result: $ac_res" >&5
+$as_echo "$ac_res" >&6; }
+as_val=`eval 'as_val=${'$as_ac_var'}
+		 $as_echo "$as_val"'`
+   if test "x$as_val" = x""yes; then
   cat >>confdefs.h <<_ACEOF
-#define `echo "HAVE_$ac_func" | $as_tr_cpp` 1
+#define `$as_echo "HAVE_$ac_func" | $as_tr_cpp` 1
 _ACEOF
 
-echo "$as_me:$LINENO: checking for _doprnt" >&5
-echo $ECHO_N "checking for _doprnt... $ECHO_C" >&6
+{ $as_echo "$as_me:$LINENO: checking for _doprnt" >&5
+$as_echo_n "checking for _doprnt... " >&6; }
 if test "${ac_cv_func__doprnt+set}" = set; then
-  echo $ECHO_N "(cached) $ECHO_C" >&6
+  $as_echo_n "(cached) " >&6
 else
   cat >conftest.$ac_ext <<_ACEOF
 /* confdefs.h.  */
@@ -3591,69 +4956,64 @@ cat >>conftest.$ac_ext <<_ACEOF
 
 #undef _doprnt
 
-/* Override any gcc2 internal prototype to avoid an error.  */
+/* Override any GCC internal prototype to avoid an error.
+   Use char because int might match the return type of a GCC
+   builtin and then its argument prototype would still apply.  */
 #ifdef __cplusplus
 extern "C"
-{
 #endif
-/* We use char because int might match the return type of a gcc2
-   builtin and then its argument prototype would still apply.  */
 char _doprnt ();
 /* The GNU C library defines this for functions which it implements
     to always fail with ENOSYS.  Some functions are actually named
     something starting with __ and the normal name is an alias.  */
-#if defined (__stub__doprnt) || defined (__stub____doprnt)
+#if defined __stub__doprnt || defined __stub____doprnt
 choke me
-#else
-char (*f) () = _doprnt;
-#endif
-#ifdef __cplusplus
-}
 #endif
 
 int
 main ()
 {
-return f != _doprnt;
+return _doprnt ();
   ;
   return 0;
 }
 _ACEOF
 rm -f conftest.$ac_objext conftest$ac_exeext
-if { (eval echo "$as_me:$LINENO: \"$ac_link\"") >&5
-  (eval $ac_link) 2>conftest.er1
+if { (ac_try="$ac_link"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_link") 2>conftest.er1
   ac_status=$?
   grep -v '^ *+' conftest.er1 >conftest.err
   rm -f conftest.er1
   cat conftest.err >&5
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); } &&
-	 { ac_try='test -z "$ac_c_werror_flag"
-			 || test ! -s conftest.err'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
-  ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; } &&
-	 { ac_try='test -s conftest$ac_exeext'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
-  ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; }; then
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  (exit $ac_status); } && {
+	 test -z "$ac_c_werror_flag" ||
+	 test ! -s conftest.err
+       } && test -s conftest$ac_exeext && {
+	 test "$cross_compiling" = yes ||
+	 $as_test_x conftest$ac_exeext
+       }; then
   ac_cv_func__doprnt=yes
 else
-  echo "$as_me: failed program was:" >&5
+  $as_echo "$as_me: failed program was:" >&5
 sed 's/^/| /' conftest.$ac_ext >&5
 
-ac_cv_func__doprnt=no
+	ac_cv_func__doprnt=no
 fi
-rm -f conftest.err conftest.$ac_objext \
+
+rm -rf conftest.dSYM
+rm -f core conftest.err conftest.$ac_objext conftest_ipa8_conftest.oo \
       conftest$ac_exeext conftest.$ac_ext
 fi
-echo "$as_me:$LINENO: result: $ac_cv_func__doprnt" >&5
-echo "${ECHO_T}$ac_cv_func__doprnt" >&6
-if test $ac_cv_func__doprnt = yes; then
+{ $as_echo "$as_me:$LINENO: result: $ac_cv_func__doprnt" >&5
+$as_echo "$ac_cv_func__doprnt" >&6; }
+if test "x$ac_cv_func__doprnt" = x""yes; then
 
 cat >>confdefs.h <<\_ACEOF
 #define HAVE_DOPRNT 1
@@ -3667,13 +5027,21 @@ done
 
 
 
-for ac_func in dcgettext
+
+
+
+for ac_func in  \
+	dcgettext \
+	getline \
+	libintl_dgettext \
+	strsignal \
+
 do
-as_ac_var=`echo "ac_cv_func_$ac_func" | $as_tr_sh`
-echo "$as_me:$LINENO: checking for $ac_func" >&5
-echo $ECHO_N "checking for $ac_func... $ECHO_C" >&6
-if eval "test \"\${$as_ac_var+set}\" = set"; then
-  echo $ECHO_N "(cached) $ECHO_C" >&6
+as_ac_var=`$as_echo "ac_cv_func_$ac_func" | $as_tr_sh`
+{ $as_echo "$as_me:$LINENO: checking for $ac_func" >&5
+$as_echo_n "checking for $ac_func... " >&6; }
+if { as_var=$as_ac_var; eval "test \"\${$as_var+set}\" = set"; }; then
+  $as_echo_n "(cached) " >&6
 else
   cat >conftest.$ac_ext <<_ACEOF
 /* confdefs.h.  */
@@ -3698,77 +5066,78 @@ cat >>conftest.$ac_ext <<_ACEOF
 
 #undef $ac_func
 
-/* Override any gcc2 internal prototype to avoid an error.  */
+/* Override any GCC internal prototype to avoid an error.
+   Use char because int might match the return type of a GCC
+   builtin and then its argument prototype would still apply.  */
 #ifdef __cplusplus
 extern "C"
-{
 #endif
-/* We use char because int might match the return type of a gcc2
-   builtin and then its argument prototype would still apply.  */
 char $ac_func ();
 /* The GNU C library defines this for functions which it implements
     to always fail with ENOSYS.  Some functions are actually named
     something starting with __ and the normal name is an alias.  */
-#if defined (__stub_$ac_func) || defined (__stub___$ac_func)
+#if defined __stub_$ac_func || defined __stub___$ac_func
 choke me
-#else
-char (*f) () = $ac_func;
-#endif
-#ifdef __cplusplus
-}
 #endif
 
 int
 main ()
 {
-return f != $ac_func;
+return $ac_func ();
   ;
   return 0;
 }
 _ACEOF
 rm -f conftest.$ac_objext conftest$ac_exeext
-if { (eval echo "$as_me:$LINENO: \"$ac_link\"") >&5
-  (eval $ac_link) 2>conftest.er1
+if { (ac_try="$ac_link"
+case "(($ac_try" in
+  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+  *) ac_try_echo=$ac_try;;
+esac
+eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+$as_echo "$ac_try_echo") >&5
+  (eval "$ac_link") 2>conftest.er1
   ac_status=$?
   grep -v '^ *+' conftest.er1 >conftest.err
   rm -f conftest.er1
   cat conftest.err >&5
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); } &&
-	 { ac_try='test -z "$ac_c_werror_flag"
-			 || test ! -s conftest.err'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
-  ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; } &&
-	 { ac_try='test -s conftest$ac_exeext'
-  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-  (eval $ac_try) 2>&5
-  ac_status=$?
-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-  (exit $ac_status); }; }; then
+  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+  (exit $ac_status); } && {
+	 test -z "$ac_c_werror_flag" ||
+	 test ! -s conftest.err
+       } && test -s conftest$ac_exeext && {
+	 test "$cross_compiling" = yes ||
+	 $as_test_x conftest$ac_exeext
+       }; then
   eval "$as_ac_var=yes"
 else
-  echo "$as_me: failed program was:" >&5
+  $as_echo "$as_me: failed program was:" >&5
 sed 's/^/| /' conftest.$ac_ext >&5
 
-eval "$as_ac_var=no"
+	eval "$as_ac_var=no"
 fi
-rm -f conftest.err conftest.$ac_objext \
+
+rm -rf conftest.dSYM
+rm -f core conftest.err conftest.$ac_objext conftest_ipa8_conftest.oo \
       conftest$ac_exeext conftest.$ac_ext
 fi
-echo "$as_me:$LINENO: result: `eval echo '${'$as_ac_var'}'`" >&5
-echo "${ECHO_T}`eval echo '${'$as_ac_var'}'`" >&6
-if test `eval echo '${'$as_ac_var'}'` = yes; then
+ac_res=`eval 'as_val=${'$as_ac_var'}
+		 $as_echo "$as_val"'`
+	       { $as_echo "$as_me:$LINENO: result: $ac_res" >&5
+$as_echo "$ac_res" >&6; }
+as_val=`eval 'as_val=${'$as_ac_var'}
+		 $as_echo "$as_val"'`
+   if test "x$as_val" = x""yes; then
   cat >>confdefs.h <<_ACEOF
-#define `echo "HAVE_$ac_func" | $as_tr_cpp` 1
+#define `$as_echo "HAVE_$ac_func" | $as_tr_cpp` 1
 _ACEOF
 
 fi
 done
 
 
+test "$GCC" = yes && CFLAGS="-Wall $CFLAGS"
+
 
 
 
@@ -3780,7 +5149,13 @@ done
 
 
 
-                    ac_config_files="$ac_config_files Makefile ld-elf2flt"
+
+
+
+
+
+ac_config_files="$ac_config_files ld-elf2flt.sh:ld-elf2flt.in Makefile elf2flt.ld"
+
 cat >confcache <<\_ACEOF
 # This file is a shell script that caches the results of configure
 # tests run on this system so they can be shared between configure
@@ -3799,39 +5174,59 @@ _ACEOF
 
 # The following way of writing the cache mishandles newlines in values,
 # but we know of no workaround that is simple, portable, and efficient.
-# So, don't put newlines in cache variables' values.
+# So, we kill variables containing newlines.
 # Ultrix sh set writes to stderr and can't be redirected directly,
 # and sets the high bit in the cache file unless we assign to the vars.
-{
+(
+  for ac_var in `(set) 2>&1 | sed -n 's/^\([a-zA-Z_][a-zA-Z0-9_]*\)=.*/\1/p'`; do
+    eval ac_val=\$$ac_var
+    case $ac_val in #(
+    *${as_nl}*)
+      case $ac_var in #(
+      *_cv_*) { $as_echo "$as_me:$LINENO: WARNING: cache variable $ac_var contains a newline" >&5
+$as_echo "$as_me: WARNING: cache variable $ac_var contains a newline" >&2;} ;;
+      esac
+      case $ac_var in #(
+      _ | IFS | as_nl) ;; #(
+      BASH_ARGV | BASH_SOURCE) eval $ac_var= ;; #(
+      *) $as_unset $ac_var ;;
+      esac ;;
+    esac
+  done
+
   (set) 2>&1 |
-    case `(ac_space=' '; set | grep ac_space) 2>&1` in
-    *ac_space=\ *)
+    case $as_nl`(ac_space=' '; set) 2>&1` in #(
+    *${as_nl}ac_space=\ *)
       # `set' does not quote correctly, so add quotes (double-quote
       # substitution turns \\\\ into \\, and sed turns \\ into \).
       sed -n \
 	"s/'/'\\\\''/g;
 	  s/^\\([_$as_cr_alnum]*_cv_[_$as_cr_alnum]*\\)=\\(.*\\)/\\1='\\2'/p"
-      ;;
+      ;; #(
     *)
       # `set' quotes correctly as required by POSIX, so do not add quotes.
-      sed -n \
-	"s/^\\([_$as_cr_alnum]*_cv_[_$as_cr_alnum]*\\)=\\(.*\\)/\\1=\\2/p"
+      sed -n "/^[_$as_cr_alnum]*_cv_[_$as_cr_alnum]*=/p"
       ;;
-    esac;
-} |
+    esac |
+    sort
+) |
   sed '
+     /^ac_cv_env_/b end
      t clear
-     : clear
+     :clear
      s/^\([^=]*\)=\(.*[{}].*\)$/test "${\1+set}" = set || &/
      t end
-     /^ac_cv_env/!s/^\([^=]*\)=\(.*\)$/\1=${\1=\2}/
-     : end' >>confcache
-if diff $cache_file confcache >/dev/null 2>&1; then :; else
-  if test -w $cache_file; then
-    test "x$cache_file" != "x/dev/null" && echo "updating cache $cache_file"
+     s/^\([^=]*\)=\(.*\)$/\1=${\1=\2}/
+     :end' >>confcache
+if diff "$cache_file" confcache >/dev/null 2>&1; then :; else
+  if test -w "$cache_file"; then
+    test "x$cache_file" != "x/dev/null" &&
+      { $as_echo "$as_me:$LINENO: updating cache $cache_file" >&5
+$as_echo "$as_me: updating cache $cache_file" >&6;}
     cat confcache >$cache_file
   else
-    echo "not updating unwritable cache $cache_file"
+    { $as_echo "$as_me:$LINENO: not updating unwritable cache $cache_file" >&5
+$as_echo "$as_me: not updating unwritable cache $cache_file" >&6;}
   fi
 fi
 rm -f confcache
@@ -3840,63 +5235,54 @@ test "x$prefix" = xNONE && prefix=$ac_default_prefix
 # Let make expand exec_prefix.
 test "x$exec_prefix" = xNONE && exec_prefix='${prefix}'
 
-# VPATH may cause trouble with some makes, so we remove $(srcdir),
-# ${srcdir} and @srcdir@ from VPATH if srcdir is ".", strip leading and
-# trailing colons and then remove the whole line if VPATH becomes empty
-# (actually we leave an empty line to preserve line numbers).
-if test "x$srcdir" = x.; then
-  ac_vpsub='/^[	 ]*VPATH[	 ]*=/{
-s/:*\$(srcdir):*/:/;
-s/:*\${srcdir}:*/:/;
-s/:*@srcdir@:*/:/;
-s/^\([^=]*=[	 ]*\):*/\1/;
-s/:*$//;
-s/^[^=]*=[	 ]*$//;
-}'
-fi
-
 # Transform confdefs.h into DEFS.
 # Protect against shell expansion while executing Makefile rules.
 # Protect against Makefile macro expansion.
 #
 # If the first sed substitution is executed (which looks for macros that
-# take arguments), then we branch to the quote section.  Otherwise,
+# take arguments), then branch to the quote section.  Otherwise,
 # look for a macro that doesn't take arguments.
-cat >confdef2opt.sed <<\_ACEOF
+ac_script='
+:mline
+/\\$/{
+ N
+ s,\\\n,,
+ b mline
+}
 t clear
-: clear
-s,^[	 ]*#[	 ]*define[	 ][	 ]*\([^	 (][^	 (]*([^)]*)\)[	 ]*\(.*\),-D\1=\2,g
+:clear
+s/^[	 ]*#[	 ]*define[	 ][	 ]*\([^	 (][^	 (]*([^)]*)\)[	 ]*\(.*\)/-D\1=\2/g
 t quote
-s,^[	 ]*#[	 ]*define[	 ][	 ]*\([^	 ][^	 ]*\)[	 ]*\(.*\),-D\1=\2,g
+s/^[	 ]*#[	 ]*define[	 ][	 ]*\([^	 ][^	 ]*\)[	 ]*\(.*\)/-D\1=\2/g
 t quote
-d
-: quote
-s,[	 `~#$^&*(){}\\|;'"<>?],\\&,g
-s,\[,\\&,g
-s,\],\\&,g
-s,\$,$$,g
-p
-_ACEOF
-# We use echo to avoid assuming a particular line-breaking character.
-# The extra dot is to prevent the shell from consuming trailing
-# line-breaks from the sub-command output.  A line-break within
-# single-quotes doesn't work because, if this script is created in a
-# platform that uses two characters for line-breaks (e.g., DOS), tr
-# would break.
-ac_LF_and_DOT=`echo; echo .`
-DEFS=`sed -n -f confdef2opt.sed confdefs.h | tr "$ac_LF_and_DOT" ' .'`
-rm -f confdef2opt.sed
+b any
+:quote
+s/[	 `~#$^&*(){}\\|;'\''"<>?]/\\&/g
+s/\[/\\&/g
+s/\]/\\&/g
+s/\$/$$/g
+H
+:any
+${
+	g
+	s/^\n//
+	s/\n/ /g
+	p
+}
+'
+DEFS=`sed -n "$ac_script" confdefs.h`
 
 
 ac_libobjs=
 ac_ltlibobjs=
 for ac_i in : $LIBOBJS; do test "x$ac_i" = x: && continue
   # 1. Remove the extension, and $U if already installed.
-  ac_i=`echo "$ac_i" |
-	 sed 's/\$U\././;s/\.o$//;s/\.obj$//'`
-  # 2. Add them.
-  ac_libobjs="$ac_libobjs $ac_i\$U.$ac_objext"
-  ac_ltlibobjs="$ac_ltlibobjs $ac_i"'$U.lo'
+  ac_script='s/\$U\././;s/\.o$//;s/\.obj$//'
+  ac_i=`$as_echo "$ac_i" | sed "$ac_script"`
+  # 2. Prepend LIBOBJDIR.  When used with automake>=1.10 LIBOBJDIR
+  #    will be set to the directory where LIBOBJS objects are built.
+  ac_libobjs="$ac_libobjs \${LIBOBJDIR}$ac_i\$U.$ac_objext"
+  ac_ltlibobjs="$ac_ltlibobjs \${LIBOBJDIR}$ac_i"'$U.lo'
 done
 LIBOBJS=$ac_libobjs
 
@@ -3905,11 +5291,12 @@ LTLIBOBJS=$ac_ltlibobjs
 
 
 : ${CONFIG_STATUS=./config.status}
+ac_write_fail=0
 ac_clean_files_save=$ac_clean_files
 ac_clean_files="$ac_clean_files $CONFIG_STATUS"
-{ echo "$as_me:$LINENO: creating $CONFIG_STATUS" >&5
-echo "$as_me: creating $CONFIG_STATUS" >&6;}
-cat >$CONFIG_STATUS <<_ACEOF
+{ $as_echo "$as_me:$LINENO: creating $CONFIG_STATUS" >&5
+$as_echo "$as_me: creating $CONFIG_STATUS" >&6;}
+cat >$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
 #! $SHELL
 # Generated by $as_me.
 # Run this file to recreate the current configuration.
@@ -3922,22 +5309,78 @@ ac_cs_silent=false
 SHELL=\${CONFIG_SHELL-$SHELL}
 _ACEOF
 
-cat >>$CONFIG_STATUS <<\_ACEOF
+cat >>$CONFIG_STATUS <<\_ACEOF || ac_write_fail=1
 ## --------------------- ##
 ## M4sh Initialization.  ##
 ## --------------------- ##
 
-# Be Bourne compatible
-if test -n "${ZSH_VERSION+set}" && (emulate sh) >/dev/null 2>&1; then
-  emulate sh
-  NULLCMD=:
-  # Zsh 3.x and 4.x performs word splitting on ${1+"$@"}, which
-  # is contrary to our usage.  Disable this feature.
-  alias -g '${1+"$@"}'='"$@"'
-elif test -n "${BASH_VERSION+set}" && (set -o posix) >/dev/null 2>&1; then
-  set -o posix
+# Be more Bourne compatible
+DUALCASE=1; export DUALCASE # for MKS sh
+if test -n "${ZSH_VERSION+set}" && (emulate sh) >/dev/null 2>&1; then
+  emulate sh
+  NULLCMD=:
+  # Pre-4.2 versions of Zsh do word splitting on ${1+"$@"}, which
+  # is contrary to our usage.  Disable this feature.
+  alias -g '${1+"$@"}'='"$@"'
+  setopt NO_GLOB_SUBST
+else
+  case `(set -o) 2>/dev/null` in
+  *posix*) set -o posix ;;
+esac
+
+fi
+
+
+
+
+# PATH needs CR
+# Avoid depending upon Character Ranges.
+as_cr_letters='abcdefghijklmnopqrstuvwxyz'
+as_cr_LETTERS='ABCDEFGHIJKLMNOPQRSTUVWXYZ'
+as_cr_Letters=$as_cr_letters$as_cr_LETTERS
+as_cr_digits='0123456789'
+as_cr_alnum=$as_cr_Letters$as_cr_digits
+
+as_nl='
+'
+export as_nl
+# Printing a long string crashes Solaris 7 /usr/bin/printf.
+as_echo='\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'
+as_echo=$as_echo$as_echo$as_echo$as_echo$as_echo
+as_echo=$as_echo$as_echo$as_echo$as_echo$as_echo$as_echo
+if (test "X`printf %s $as_echo`" = "X$as_echo") 2>/dev/null; then
+  as_echo='printf %s\n'
+  as_echo_n='printf %s'
+else
+  if test "X`(/usr/ucb/echo -n -n $as_echo) 2>/dev/null`" = "X-n $as_echo"; then
+    as_echo_body='eval /usr/ucb/echo -n "$1$as_nl"'
+    as_echo_n='/usr/ucb/echo -n'
+  else
+    as_echo_body='eval expr "X$1" : "X\\(.*\\)"'
+    as_echo_n_body='eval
+      arg=$1;
+      case $arg in
+      *"$as_nl"*)
+	expr "X$arg" : "X\\(.*\\)$as_nl";
+	arg=`expr "X$arg" : ".*$as_nl\\(.*\\)"`;;
+      esac;
+      expr "X$arg" : "X\\(.*\\)" | tr -d "$as_nl"
+    '
+    export as_echo_n_body
+    as_echo_n='sh -c $as_echo_n_body as_echo'
+  fi
+  export as_echo_body
+  as_echo='sh -c $as_echo_body as_echo'
+fi
+
+# The user is always right.
+if test "${PATH_SEPARATOR+set}" != set; then
+  PATH_SEPARATOR=:
+  (PATH='/bin;/bin'; FPATH=$PATH; sh -c :) >/dev/null 2>&1 && {
+    (PATH='/bin:/bin'; FPATH=$PATH; sh -c :) >/dev/null 2>&1 ||
+      PATH_SEPARATOR=';'
+  }
 fi
-DUALCASE=1; export DUALCASE # for MKS sh
 
 # Support unset when possible.
 if ( (MAIL=60; unset MAIL) || exit) >/dev/null 2>&1; then
@@ -3947,33 +5390,60 @@ else
 fi
 
 
+# IFS
+# We need space, tab and new line, in precisely that order.  Quoting is
+# there to prevent editors from complaining about space-tab.
+# (If _AS_PATH_WALK were called with IFS unset, it would disable word
+# splitting by setting IFS to empty value.)
+IFS=" ""	$as_nl"
+
+# Find who we are.  Look in the path if we contain no directory separator.
+case $0 in
+  *[\\/]* ) as_myself=$0 ;;
+  *) as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
+for as_dir in $PATH
+do
+  IFS=$as_save_IFS
+  test -z "$as_dir" && as_dir=.
+  test -r "$as_dir/$0" && as_myself=$as_dir/$0 && break
+done
+IFS=$as_save_IFS
+
+     ;;
+esac
+# We did not find ourselves, most probably we were run as `sh COMMAND'
+# in which case we are not to be found in the path.
+if test "x$as_myself" = x; then
+  as_myself=$0
+fi
+if test ! -f "$as_myself"; then
+  $as_echo "$as_myself: error: cannot find myself; rerun with an absolute file name" >&2
+  { (exit 1); exit 1; }
+fi
+
 # Work around bugs in pre-3.0 UWIN ksh.
-$as_unset ENV MAIL MAILPATH
+for as_var in ENV MAIL MAILPATH
+do ($as_unset $as_var) >/dev/null 2>&1 && $as_unset $as_var
+done
 PS1='$ '
 PS2='> '
 PS4='+ '
 
 # NLS nuisances.
-for as_var in \
-  LANG LANGUAGE LC_ADDRESS LC_ALL LC_COLLATE LC_CTYPE LC_IDENTIFICATION \
-  LC_MEASUREMENT LC_MESSAGES LC_MONETARY LC_NAME LC_NUMERIC LC_PAPER \
-  LC_TELEPHONE LC_TIME
-do
-  if (set +x; test -z "`(eval $as_var=C; export $as_var) 2>&1`"); then
-    eval $as_var=C; export $as_var
-  else
-    $as_unset $as_var
-  fi
-done
+LC_ALL=C
+export LC_ALL
+LANGUAGE=C
+export LANGUAGE
 
 # Required to use basename.
-if expr a : '\(a\)' >/dev/null 2>&1; then
+if expr a : '\(a\)' >/dev/null 2>&1 &&
+   test "X`expr 00001 : '.*\(...\)'`" = X001; then
   as_expr=expr
 else
   as_expr=false
 fi
 
-if (basename /) >/dev/null 2>&1 && test "X`basename / 2>&1`" = "X/"; then
+if (basename -- /) >/dev/null 2>&1 && test "X`basename -- / 2>&1`" = "X/"; then
   as_basename=basename
 else
   as_basename=false
@@ -3981,159 +5451,122 @@ fi
 
 
 # Name of the executable.
-as_me=`$as_basename "$0" ||
+as_me=`$as_basename -- "$0" ||
 $as_expr X/"$0" : '.*/\([^/][^/]*\)/*$' \| \
 	 X"$0" : 'X\(//\)$' \| \
-	 X"$0" : 'X\(/\)$' \| \
-	 .     : '\(.\)' 2>/dev/null ||
-echo X/"$0" |
-    sed '/^.*\/\([^/][^/]*\)\/*$/{ s//\1/; q; }
-  	  /^X\/\(\/\/\)$/{ s//\1/; q; }
-  	  /^X\/\(\/\).*/{ s//\1/; q; }
-  	  s/.*/./; q'`
-
-
-# PATH needs CR, and LINENO needs CR and PATH.
-# Avoid depending upon Character Ranges.
-as_cr_letters='abcdefghijklmnopqrstuvwxyz'
-as_cr_LETTERS='ABCDEFGHIJKLMNOPQRSTUVWXYZ'
-as_cr_Letters=$as_cr_letters$as_cr_LETTERS
-as_cr_digits='0123456789'
-as_cr_alnum=$as_cr_Letters$as_cr_digits
+	 X"$0" : 'X\(/\)' \| . 2>/dev/null ||
+$as_echo X/"$0" |
+    sed '/^.*\/\([^/][^/]*\)\/*$/{
+	    s//\1/
+	    q
+	  }
+	  /^X\/\(\/\/\)$/{
+	    s//\1/
+	    q
+	  }
+	  /^X\/\(\/\).*/{
+	    s//\1/
+	    q
+	  }
+	  s/.*/./; q'`
 
-# The user is always right.
-if test "${PATH_SEPARATOR+set}" != set; then
-  echo "#! /bin/sh" >conf$$.sh
-  echo  "exit 0"   >>conf$$.sh
-  chmod +x conf$$.sh
-  if (PATH="/nonexistent;."; conf$$.sh) >/dev/null 2>&1; then
-    PATH_SEPARATOR=';'
-  else
-    PATH_SEPARATOR=:
-  fi
-  rm -f conf$$.sh
-fi
+# CDPATH.
+$as_unset CDPATH
 
 
-  as_lineno_1=$LINENO
-  as_lineno_2=$LINENO
-  as_lineno_3=`(expr $as_lineno_1 + 1) 2>/dev/null`
-  test "x$as_lineno_1" != "x$as_lineno_2" &&
-  test "x$as_lineno_3"  = "x$as_lineno_2"  || {
-  # Find who we are.  Look in the path if we contain no path at all
-  # relative or not.
-  case $0 in
-    *[\\/]* ) as_myself=$0 ;;
-    *) as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
-for as_dir in $PATH
-do
-  IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
-  test -r "$as_dir/$0" && as_myself=$as_dir/$0 && break
-done
 
-       ;;
-  esac
-  # We did not find ourselves, most probably we were run as `sh COMMAND'
-  # in which case we are not to be found in the path.
-  if test "x$as_myself" = x; then
-    as_myself=$0
-  fi
-  if test ! -f "$as_myself"; then
-    { { echo "$as_me:$LINENO: error: cannot find myself; rerun with an absolute path" >&5
-echo "$as_me: error: cannot find myself; rerun with an absolute path" >&2;}
-   { (exit 1); exit 1; }; }
-  fi
-  case $CONFIG_SHELL in
-  '')
-    as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
-for as_dir in /bin$PATH_SEPARATOR/usr/bin$PATH_SEPARATOR$PATH
-do
-  IFS=$as_save_IFS
-  test -z "$as_dir" && as_dir=.
-  for as_base in sh bash ksh sh5; do
-	 case $as_dir in
-	 /*)
-	   if ("$as_dir/$as_base" -c '
   as_lineno_1=$LINENO
   as_lineno_2=$LINENO
-  as_lineno_3=`(expr $as_lineno_1 + 1) 2>/dev/null`
   test "x$as_lineno_1" != "x$as_lineno_2" &&
-  test "x$as_lineno_3"  = "x$as_lineno_2" ') 2>/dev/null; then
-	     $as_unset BASH_ENV || test "${BASH_ENV+set}" != set || { BASH_ENV=; export BASH_ENV; }
-	     $as_unset ENV || test "${ENV+set}" != set || { ENV=; export ENV; }
-	     CONFIG_SHELL=$as_dir/$as_base
-	     export CONFIG_SHELL
-	     exec "$CONFIG_SHELL" "$0" ${1+"$@"}
-	   fi;;
-	 esac
-       done
-done
-;;
-  esac
+  test "x`expr $as_lineno_1 + 1`" = "x$as_lineno_2" || {
 
   # Create $as_me.lineno as a copy of $as_myself, but with $LINENO
   # uniformly replaced by the line number.  The first 'sed' inserts a
-  # line-number line before each line; the second 'sed' does the real
-  # work.  The second script uses 'N' to pair each line-number line
-  # with the numbered line, and appends trailing '-' during
-  # substitution so that $LINENO is not a special case at line end.
+  # line-number line after each line using $LINENO; the second 'sed'
+  # does the real work.  The second script uses 'N' to pair each
+  # line-number line with the line containing $LINENO, and appends
+  # trailing '-' during substitution so that $LINENO is not a special
+  # case at line end.
   # (Raja R Harinath suggested sed '=', and Paul Eggert wrote the
-  # second 'sed' script.  Blame Lee E. McMahon for sed's syntax.  :-)
-  sed '=' <$as_myself |
+  # scripts with optimization help from Paolo Bonzini.  Blame Lee
+  # E. McMahon (1931-1989) for sed's syntax.  :-)
+  sed -n '
+    p
+    /[$]LINENO/=
+  ' <$as_myself |
     sed '
+      s/[$]LINENO.*/&-/
+      t lineno
+      b
+      :lineno
       N
-      s,$,-,
-      : loop
-      s,^\(['$as_cr_digits']*\)\(.*\)[$]LINENO\([^'$as_cr_alnum'_]\),\1\2\1\3,
+      :loop
+      s/[$]LINENO\([^'$as_cr_alnum'_].*\n\)\(.*\)/\2\1\2/
       t loop
-      s,-$,,
-      s,^['$as_cr_digits']*\n,,
+      s/-\n.*//
     ' >$as_me.lineno &&
-  chmod +x $as_me.lineno ||
-    { { echo "$as_me:$LINENO: error: cannot create $as_me.lineno; rerun with a POSIX shell" >&5
-echo "$as_me: error: cannot create $as_me.lineno; rerun with a POSIX shell" >&2;}
+  chmod +x "$as_me.lineno" ||
+    { $as_echo "$as_me: error: cannot create $as_me.lineno; rerun with a POSIX shell" >&2
    { (exit 1); exit 1; }; }
 
   # Don't try to exec as it changes $[0], causing all sort of problems
   # (the dirname of $[0] is not the place where we might find the
-  # original and so on.  Autoconf is especially sensible to this).
-  . ./$as_me.lineno
+  # original and so on.  Autoconf is especially sensitive to this).
+  . "./$as_me.lineno"
   # Exit status is that of the last command.
   exit
 }
 
 
-case `echo "testing\c"; echo 1,2,3`,`echo -n testing; echo 1,2,3` in
-  *c*,-n*) ECHO_N= ECHO_C='
-' ECHO_T='	' ;;
-  *c*,*  ) ECHO_N=-n ECHO_C= ECHO_T= ;;
-  *)       ECHO_N= ECHO_C='\c' ECHO_T= ;;
-esac
+if (as_dir=`dirname -- /` && test "X$as_dir" = X/) >/dev/null 2>&1; then
+  as_dirname=dirname
+else
+  as_dirname=false
+fi
 
-if expr a : '\(a\)' >/dev/null 2>&1; then
+ECHO_C= ECHO_N= ECHO_T=
+case `echo -n x` in
+-n*)
+  case `echo 'x\c'` in
+  *c*) ECHO_T='	';;	# ECHO_T is single tab character.
+  *)   ECHO_C='\c';;
+  esac;;
+*)
+  ECHO_N='-n';;
+esac
+if expr a : '\(a\)' >/dev/null 2>&1 &&
+   test "X`expr 00001 : '.*\(...\)'`" = X001; then
   as_expr=expr
 else
   as_expr=false
 fi
 
 rm -f conf$$ conf$$.exe conf$$.file
-echo >conf$$.file
-if ln -s conf$$.file conf$$ 2>/dev/null; then
-  # We could just check for DJGPP; but this test a) works b) is more generic
-  # and c) will remain valid once DJGPP supports symlinks (DJGPP 2.04).
-  if test -f conf$$.exe; then
-    # Don't use ln at all; we don't have any links
-    as_ln_s='cp -p'
-  else
+if test -d conf$$.dir; then
+  rm -f conf$$.dir/conf$$.file
+else
+  rm -f conf$$.dir
+  mkdir conf$$.dir 2>/dev/null
+fi
+if (echo >conf$$.file) 2>/dev/null; then
+  if ln -s conf$$.file conf$$ 2>/dev/null; then
     as_ln_s='ln -s'
+    # ... but there are two gotchas:
+    # 1) On MSYS, both `ln -s file dir' and `ln file dir' fail.
+    # 2) DJGPP < 2.04 has no symlinks; `ln -s' creates a wrapper executable.
+    # In both cases, we have to default to `cp -p'.
+    ln -s conf$$.file conf$$.dir 2>/dev/null && test ! -f conf$$.exe ||
+      as_ln_s='cp -p'
+  elif ln conf$$.file conf$$ 2>/dev/null; then
+    as_ln_s=ln
+  else
+    as_ln_s='cp -p'
   fi
-elif ln conf$$.file conf$$ 2>/dev/null; then
-  as_ln_s=ln
 else
   as_ln_s='cp -p'
 fi
-rm -f conf$$ conf$$.exe conf$$.file
+rm -f conf$$ conf$$.exe conf$$.dir/conf$$.file conf$$.file
+rmdir conf$$.dir 2>/dev/null
 
 if mkdir -p . 2>/dev/null; then
   as_mkdir_p=:
@@ -4142,7 +5575,28 @@ else
   as_mkdir_p=false
 fi
 
-as_executable_p="test -f"
+if test -x / >/dev/null 2>&1; then
+  as_test_x='test -x'
+else
+  if ls -dL / >/dev/null 2>&1; then
+    as_ls_L_option=L
+  else
+    as_ls_L_option=
+  fi
+  as_test_x='
+    eval sh -c '\''
+      if test -d "$1"; then
+	test -d "$1/.";
+      else
+	case $1 in
+	-*)set "./$1";;
+	esac;
+	case `ls -ld'$as_ls_L_option' "$1" 2>/dev/null` in
+	???[sx]*):;;*)false;;esac;fi
+    '\'' sh
+  '
+fi
+as_executable_p=$as_test_x
 
 # Sed expression to map a string onto a valid CPP name.
 as_tr_cpp="eval sed 'y%*$as_cr_letters%P$as_cr_LETTERS%;s%[^_$as_cr_alnum]%_%g'"
@@ -4151,31 +5605,14 @@ as_tr_cpp="eval sed 'y%*$as_cr_letters%P$as_cr_LETTERS%;s%[^_$as_cr_alnum]%_%g'"
 as_tr_sh="eval sed 'y%*+%pp%;s%[^_$as_cr_alnum]%_%g'"
 
 
-# IFS
-# We need space, tab and new line, in precisely that order.
-as_nl='
-'
-IFS=" 	$as_nl"
-
-# CDPATH.
-$as_unset CDPATH
-
 exec 6>&1
 
-# Open the log real soon, to keep \$[0] and so on meaningful, and to
+# Save the log message, to keep $[0] and so on meaningful, and to
 # report actual input values of CONFIG_FILES etc. instead of their
-# values after options handling.  Logging --version etc. is OK.
-exec 5>>config.log
-{
-  echo
-  sed 'h;s/./-/g;s/^.../## /;s/...$/ ##/;p;x;p;x' <<_ASBOX
-## Running $as_me. ##
-_ASBOX
-} >&5
-cat >&5 <<_CSEOF
-
+# values after options handling.
+ac_log="
 This file was extended by $as_me, which was
-generated by GNU Autoconf 2.59.  Invocation command line was
+generated by GNU Autoconf 2.63.  Invocation command line was
 
   CONFIG_FILES    = $CONFIG_FILES
   CONFIG_HEADERS  = $CONFIG_HEADERS
@@ -4183,125 +5620,107 @@ generated by GNU Autoconf 2.59.  Invocation command line was
   CONFIG_COMMANDS = $CONFIG_COMMANDS
   $ $0 $@
 
-_CSEOF
-echo "on `(hostname || uname -n) 2>/dev/null | sed 1q`" >&5
-echo >&5
+on `(hostname || uname -n) 2>/dev/null | sed 1q`
+"
+
 _ACEOF
 
-# Files that config.status was made for.
-if test -n "$ac_config_files"; then
-  echo "config_files=\"$ac_config_files\"" >>$CONFIG_STATUS
-fi
+case $ac_config_files in *"
+"*) set x $ac_config_files; shift; ac_config_files=$*;;
+esac
 
-if test -n "$ac_config_headers"; then
-  echo "config_headers=\"$ac_config_headers\"" >>$CONFIG_STATUS
-fi
 
-if test -n "$ac_config_links"; then
-  echo "config_links=\"$ac_config_links\"" >>$CONFIG_STATUS
-fi
 
-if test -n "$ac_config_commands"; then
-  echo "config_commands=\"$ac_config_commands\"" >>$CONFIG_STATUS
-fi
+cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
+# Files that config.status was made for.
+config_files="$ac_config_files"
 
-cat >>$CONFIG_STATUS <<\_ACEOF
+_ACEOF
 
+cat >>$CONFIG_STATUS <<\_ACEOF || ac_write_fail=1
 ac_cs_usage="\
 \`$as_me' instantiates files from templates according to the
 current configuration.
 
-Usage: $0 [OPTIONS] [FILE]...
+Usage: $0 [OPTION]... [FILE]...
 
   -h, --help       print this help, then exit
-  -V, --version    print version number, then exit
-  -q, --quiet      do not print progress messages
+  -V, --version    print version number and configuration settings, then exit
+  -q, --quiet, --silent
+                   do not print progress messages
   -d, --debug      don't remove temporary files
       --recheck    update $as_me by reconfiguring in the same conditions
-  --file=FILE[:TEMPLATE]
-		   instantiate the configuration file FILE
+      --file=FILE[:TEMPLATE]
+                   instantiate the configuration file FILE
 
 Configuration files:
 $config_files
 
 Report bugs to <bug-autoconf@gnu.org>."
-_ACEOF
 
-cat >>$CONFIG_STATUS <<_ACEOF
+_ACEOF
+cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
 ac_cs_version="\\
 config.status
-configured by $0, generated by GNU Autoconf 2.59,
-  with options \\"`echo "$ac_configure_args" | sed 's/[\\""\`\$]/\\\\&/g'`\\"
+configured by $0, generated by GNU Autoconf 2.63,
+  with options \\"`$as_echo "$ac_configure_args" | sed 's/^ //; s/[\\""\`\$]/\\\\&/g'`\\"
 
-Copyright (C) 2003 Free Software Foundation, Inc.
+Copyright (C) 2008 Free Software Foundation, Inc.
 This config.status script is free software; the Free Software Foundation
 gives unlimited permission to copy, distribute and modify it."
-srcdir=$srcdir
-INSTALL="$INSTALL"
+
+ac_pwd='$ac_pwd'
+srcdir='$srcdir'
+INSTALL='$INSTALL'
+test -n "\$AWK" || AWK=awk
 _ACEOF
 
-cat >>$CONFIG_STATUS <<\_ACEOF
-# If no file are specified by the user, then we need to provide default
-# value.  By we need to know if files were specified by the user.
+cat >>$CONFIG_STATUS <<\_ACEOF || ac_write_fail=1
+# The default lists apply if the user does not specify any file.
 ac_need_defaults=:
 while test $# != 0
 do
   case $1 in
   --*=*)
-    ac_option=`expr "x$1" : 'x\([^=]*\)='`
-    ac_optarg=`expr "x$1" : 'x[^=]*=\(.*\)'`
+    ac_option=`expr "X$1" : 'X\([^=]*\)='`
+    ac_optarg=`expr "X$1" : 'X[^=]*=\(.*\)'`
     ac_shift=:
     ;;
-  -*)
+  *)
     ac_option=$1
     ac_optarg=$2
     ac_shift=shift
     ;;
-  *) # This is not an option, so the user has probably given explicit
-     # arguments.
-     ac_option=$1
-     ac_need_defaults=false;;
   esac
 
   case $ac_option in
   # Handling of the options.
-_ACEOF
-cat >>$CONFIG_STATUS <<\_ACEOF
   -recheck | --recheck | --rechec | --reche | --rech | --rec | --re | --r)
     ac_cs_recheck=: ;;
-  --version | --vers* | -V )
-    echo "$ac_cs_version"; exit 0 ;;
-  --he | --h)
-    # Conflict between --help and --header
-    { { echo "$as_me:$LINENO: error: ambiguous option: $1
-Try \`$0 --help' for more information." >&5
-echo "$as_me: error: ambiguous option: $1
-Try \`$0 --help' for more information." >&2;}
-   { (exit 1); exit 1; }; };;
-  --help | --hel | -h )
-    echo "$ac_cs_usage"; exit 0 ;;
-  --debug | --d* | -d )
+  --version | --versio | --versi | --vers | --ver | --ve | --v | -V )
+    $as_echo "$ac_cs_version"; exit ;;
+  --debug | --debu | --deb | --de | --d | -d )
     debug=: ;;
   --file | --fil | --fi | --f )
     $ac_shift
-    CONFIG_FILES="$CONFIG_FILES $ac_optarg"
-    ac_need_defaults=false;;
-  --header | --heade | --head | --hea )
-    $ac_shift
-    CONFIG_HEADERS="$CONFIG_HEADERS $ac_optarg"
+    case $ac_optarg in
+    *\'*) ac_optarg=`$as_echo "$ac_optarg" | sed "s/'/'\\\\\\\\''/g"` ;;
+    esac
+    CONFIG_FILES="$CONFIG_FILES '$ac_optarg'"
     ac_need_defaults=false;;
+  --he | --h |  --help | --hel | -h )
+    $as_echo "$ac_cs_usage"; exit ;;
   -q | -quiet | --quiet | --quie | --qui | --qu | --q \
   | -silent | --silent | --silen | --sile | --sil | --si | --s)
     ac_cs_silent=: ;;
 
   # This is an error.
-  -*) { { echo "$as_me:$LINENO: error: unrecognized option: $1
-Try \`$0 --help' for more information." >&5
-echo "$as_me: error: unrecognized option: $1
-Try \`$0 --help' for more information." >&2;}
+  -*) { $as_echo "$as_me: error: unrecognized option: $1
+Try \`$0 --help' for more information." >&2
    { (exit 1); exit 1; }; } ;;
 
-  *) ac_config_targets="$ac_config_targets $1" ;;
+  *) ac_config_targets="$ac_config_targets $1"
+     ac_need_defaults=false ;;
 
   esac
   shift
@@ -4315,31 +5734,48 @@ if $ac_cs_silent; then
 fi
 
 _ACEOF
-cat >>$CONFIG_STATUS <<_ACEOF
+cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
 if \$ac_cs_recheck; then
-  echo "running $SHELL $0 " $ac_configure_args \$ac_configure_extra_args " --no-create --no-recursion" >&6
-  exec $SHELL $0 $ac_configure_args \$ac_configure_extra_args --no-create --no-recursion
+  set X '$SHELL' '$0' $ac_configure_args \$ac_configure_extra_args --no-create --no-recursion
+  shift
+  \$as_echo "running CONFIG_SHELL=$SHELL \$*" >&6
+  CONFIG_SHELL='$SHELL'
+  export CONFIG_SHELL
+  exec "\$@"
 fi
 
 _ACEOF
+cat >>$CONFIG_STATUS <<\_ACEOF || ac_write_fail=1
+exec 5>>config.log
+{
+  echo
+  sed 'h;s/./-/g;s/^.../## /;s/...$/ ##/;p;x;p;x' <<_ASBOX
+## Running $as_me. ##
+_ASBOX
+  $as_echo "$ac_log"
+} >&5
 
+_ACEOF
+cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
+_ACEOF
 
+cat >>$CONFIG_STATUS <<\_ACEOF || ac_write_fail=1
 
-
-
-cat >>$CONFIG_STATUS <<\_ACEOF
+# Handling of arguments.
 for ac_config_target in $ac_config_targets
 do
-  case "$ac_config_target" in
-  # Handling of arguments.
-  "Makefile" ) CONFIG_FILES="$CONFIG_FILES Makefile" ;;
-  "ld-elf2flt" ) CONFIG_FILES="$CONFIG_FILES ld-elf2flt" ;;
-  *) { { echo "$as_me:$LINENO: error: invalid argument: $ac_config_target" >&5
-echo "$as_me: error: invalid argument: $ac_config_target" >&2;}
+  case $ac_config_target in
+    "ld-elf2flt.sh") CONFIG_FILES="$CONFIG_FILES ld-elf2flt.sh:ld-elf2flt.in" ;;
+    "Makefile") CONFIG_FILES="$CONFIG_FILES Makefile" ;;
+    "elf2flt.ld") CONFIG_FILES="$CONFIG_FILES elf2flt.ld" ;;
+
+  *) { { $as_echo "$as_me:$LINENO: error: invalid argument: $ac_config_target" >&5
+$as_echo "$as_me: error: invalid argument: $ac_config_target" >&2;}
    { (exit 1); exit 1; }; };;
   esac
 done
 
+
 # If the user did not use the arguments to specify the items to instantiate,
 # then the envvar interface is used.  Set only those that are not.
 # We use the long form for the default assignment because of an extremely
@@ -4349,351 +5785,469 @@ if $ac_need_defaults; then
 fi
 
 # Have a temporary directory for convenience.  Make it in the build tree
-# simply because there is no reason to put it here, and in addition,
+# simply because there is no reason against having it here, and in addition,
 # creating and moving files from /tmp can sometimes cause problems.
-# Create a temporary directory, and hook for its removal unless debugging.
+# Hook for its removal unless debugging.
+# Note that there is a small window in which the directory will not be cleaned:
+# after its creation but before its name has been assigned to `$tmp'.
 $debug ||
 {
-  trap 'exit_status=$?; rm -rf $tmp && exit $exit_status' 0
+  tmp=
+  trap 'exit_status=$?
+  { test -z "$tmp" || test ! -d "$tmp" || rm -fr "$tmp"; } && exit $exit_status
+' 0
   trap '{ (exit 1); exit 1; }' 1 2 13 15
 }
-
 # Create a (secure) tmp directory for tmp files.
 
 {
-  tmp=`(umask 077 && mktemp -d -q "./confstatXXXXXX") 2>/dev/null` &&
+  tmp=`(umask 077 && mktemp -d "./confXXXXXX") 2>/dev/null` &&
   test -n "$tmp" && test -d "$tmp"
 }  ||
 {
-  tmp=./confstat$$-$RANDOM
-  (umask 077 && mkdir $tmp)
+  tmp=./conf$$-$RANDOM
+  (umask 077 && mkdir "$tmp")
 } ||
 {
-   echo "$me: cannot create a temporary directory in ." >&2
+   $as_echo "$as_me: cannot create a temporary directory in ." >&2
    { (exit 1); exit 1; }
 }
 
+# Set up the scripts for CONFIG_FILES section.
+# No need to generate them if there are no CONFIG_FILES.
+# This happens for instance with `./config.status config.h'.
+if test -n "$CONFIG_FILES"; then
+
+
+ac_cr=''
+ac_cs_awk_cr=`$AWK 'BEGIN { print "a\rb" }' </dev/null 2>/dev/null`
+if test "$ac_cs_awk_cr" = "a${ac_cr}b"; then
+  ac_cs_awk_cr='\\r'
+else
+  ac_cs_awk_cr=$ac_cr
+fi
+
+echo 'BEGIN {' >"$tmp/subs1.awk" &&
 _ACEOF
 
-cat >>$CONFIG_STATUS <<_ACEOF
 
-#
-# CONFIG_FILES section.
-#
+{
+  echo "cat >conf$$subs.awk <<_ACEOF" &&
+  echo "$ac_subst_vars" | sed 's/.*/&!$&$ac_delim/' &&
+  echo "_ACEOF"
+} >conf$$subs.sh ||
+  { { $as_echo "$as_me:$LINENO: error: could not make $CONFIG_STATUS" >&5
+$as_echo "$as_me: error: could not make $CONFIG_STATUS" >&2;}
+   { (exit 1); exit 1; }; }
+ac_delim_num=`echo "$ac_subst_vars" | grep -c '$'`
+ac_delim='%!_!# '
+for ac_last_try in false false false false false :; do
+  . ./conf$$subs.sh ||
+    { { $as_echo "$as_me:$LINENO: error: could not make $CONFIG_STATUS" >&5
+$as_echo "$as_me: error: could not make $CONFIG_STATUS" >&2;}
+   { (exit 1); exit 1; }; }
 
-# No need to generate the scripts if there are no CONFIG_FILES.
-# This happens for instance when ./config.status config.h
-if test -n "\$CONFIG_FILES"; then
-  # Protect against being on the right side of a sed subst in config.status.
-  sed 's/,@/@@/; s/@,/@@/; s/,;t t\$/@;t t/; /@;t t\$/s/[\\\\&,]/\\\\&/g;
-   s/@@/,@/; s/@@/@,/; s/@;t t\$/,;t t/' >\$tmp/subs.sed <<\\CEOF
-s, at SHELL@,$SHELL,;t t
-s, at PATH_SEPARATOR@,$PATH_SEPARATOR,;t t
-s, at PACKAGE_NAME@,$PACKAGE_NAME,;t t
-s, at PACKAGE_TARNAME@,$PACKAGE_TARNAME,;t t
-s, at PACKAGE_VERSION@,$PACKAGE_VERSION,;t t
-s, at PACKAGE_STRING@,$PACKAGE_STRING,;t t
-s, at PACKAGE_BUGREPORT@,$PACKAGE_BUGREPORT,;t t
-s, at exec_prefix@,$exec_prefix,;t t
-s, at prefix@,$prefix,;t t
-s, at program_transform_name@,$program_transform_name,;t t
-s, at bindir@,$bindir,;t t
-s, at sbindir@,$sbindir,;t t
-s, at libexecdir@,$libexecdir,;t t
-s, at datadir@,$datadir,;t t
-s, at sysconfdir@,$sysconfdir,;t t
-s, at sharedstatedir@,$sharedstatedir,;t t
-s, at localstatedir@,$localstatedir,;t t
-s, at libdir@,$libdir,;t t
-s, at includedir@,$includedir,;t t
-s, at oldincludedir@,$oldincludedir,;t t
-s, at infodir@,$infodir,;t t
-s, at mandir@,$mandir,;t t
-s, at build_alias@,$build_alias,;t t
-s, at host_alias@,$host_alias,;t t
-s, at target_alias@,$target_alias,;t t
-s, at DEFS@,$DEFS,;t t
-s, at ECHO_C@,$ECHO_C,;t t
-s, at ECHO_N@,$ECHO_N,;t t
-s, at ECHO_T@,$ECHO_T,;t t
-s, at LIBS@,$LIBS,;t t
-s, at build@,$build,;t t
-s, at build_cpu@,$build_cpu,;t t
-s, at build_vendor@,$build_vendor,;t t
-s, at build_os@,$build_os,;t t
-s, at host@,$host,;t t
-s, at host_cpu@,$host_cpu,;t t
-s, at host_vendor@,$host_vendor,;t t
-s, at host_os@,$host_os,;t t
-s, at target@,$target,;t t
-s, at target_cpu@,$target_cpu,;t t
-s, at target_vendor@,$target_vendor,;t t
-s, at target_os@,$target_os,;t t
-s, at CC@,$CC,;t t
-s, at CFLAGS@,$CFLAGS,;t t
-s, at LDFLAGS@,$LDFLAGS,;t t
-s, at CPPFLAGS@,$CPPFLAGS,;t t
-s, at ac_ct_CC@,$ac_ct_CC,;t t
-s, at EXEEXT@,$EXEEXT,;t t
-s, at OBJEXT@,$OBJEXT,;t t
-s, at INSTALL_PROGRAM@,$INSTALL_PROGRAM,;t t
-s, at INSTALL_SCRIPT@,$INSTALL_SCRIPT,;t t
-s, at INSTALL_DATA@,$INSTALL_DATA,;t t
-s, at CPP@,$CPP,;t t
-s, at EGREP@,$EGREP,;t t
-s, at bfd_include_dir@,$bfd_include_dir,;t t
-s, at binutils_include_dir@,$binutils_include_dir,;t t
-s, at binutils_ldscript_dir@,$binutils_ldscript_dir,;t t
-s, at got_check@,$got_check,;t t
-s, at emit_relocs@,$emit_relocs,;t t
-s, at LIBOBJS@,$LIBOBJS,;t t
-s,@LTLIBOBJS@,$LTLIBOBJS,;t t
-CEOF
+  ac_delim_n=`sed -n "s/.*$ac_delim\$/X/p" conf$$subs.awk | grep -c X`
+  if test $ac_delim_n = $ac_delim_num; then
+    break
+  elif $ac_last_try; then
+    { { $as_echo "$as_me:$LINENO: error: could not make $CONFIG_STATUS" >&5
+$as_echo "$as_me: error: could not make $CONFIG_STATUS" >&2;}
+   { (exit 1); exit 1; }; }
+  else
+    ac_delim="$ac_delim!$ac_delim _$ac_delim!! "
+  fi
+done
+rm -f conf$$subs.sh
 
+cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
+cat >>"\$tmp/subs1.awk" <<\\_ACAWK &&
 _ACEOF
+sed -n '
+h
+s/^/S["/; s/!.*/"]=/
+p
+g
+s/^[^!]*!//
+:repl
+t repl
+s/'"$ac_delim"'$//
+t delim
+:nl
+h
+s/\(.\{148\}\).*/\1/
+t more1
+s/["\\]/\\&/g; s/^/"/; s/$/\\n"\\/
+p
+n
+b repl
+:more1
+s/["\\]/\\&/g; s/^/"/; s/$/"\\/
+p
+g
+s/.\{148\}//
+t nl
+:delim
+h
+s/\(.\{148\}\).*/\1/
+t more2
+s/["\\]/\\&/g; s/^/"/; s/$/"/
+p
+b
+:more2
+s/["\\]/\\&/g; s/^/"/; s/$/"\\/
+p
+g
+s/.\{148\}//
+t delim
+' <conf$$subs.awk | sed '
+/^[^""]/{
+  N
+  s/\n//
+}
+' >>$CONFIG_STATUS || ac_write_fail=1
+rm -f conf$$subs.awk
+cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
+_ACAWK
+cat >>"\$tmp/subs1.awk" <<_ACAWK &&
+  for (key in S) S_is_set[key] = 1
+  FS = ""
 
-  cat >>$CONFIG_STATUS <<\_ACEOF
-  # Split the substitutions into bite-sized pieces for seds with
-  # small command number limits, like on Digital OSF/1 and HP-UX.
-  ac_max_sed_lines=48
-  ac_sed_frag=1 # Number of current file.
-  ac_beg=1 # First line for current file.
-  ac_end=$ac_max_sed_lines # Line after last line for current file.
-  ac_more_lines=:
-  ac_sed_cmds=
-  while $ac_more_lines; do
-    if test $ac_beg -gt 1; then
-      sed "1,${ac_beg}d; ${ac_end}q" $tmp/subs.sed >$tmp/subs.frag
-    else
-      sed "${ac_end}q" $tmp/subs.sed >$tmp/subs.frag
-    fi
-    if test ! -s $tmp/subs.frag; then
-      ac_more_lines=false
-    else
-      # The purpose of the label and of the branching condition is to
-      # speed up the sed processing (if there are no `@' at all, there
-      # is no need to browse any of the substitutions).
-      # These are the two extra sed commands mentioned above.
-      (echo ':t
-  /@[a-zA-Z_][a-zA-Z_0-9]*@/!b' && cat $tmp/subs.frag) >$tmp/subs-$ac_sed_frag.sed
-      if test -z "$ac_sed_cmds"; then
-	ac_sed_cmds="sed -f $tmp/subs-$ac_sed_frag.sed"
-      else
-	ac_sed_cmds="$ac_sed_cmds | sed -f $tmp/subs-$ac_sed_frag.sed"
-      fi
-      ac_sed_frag=`expr $ac_sed_frag + 1`
-      ac_beg=$ac_end
-      ac_end=`expr $ac_end + $ac_max_sed_lines`
-    fi
-  done
-  if test -z "$ac_sed_cmds"; then
-    ac_sed_cmds=cat
-  fi
-fi # test -n "$CONFIG_FILES"
+}
+{
+  line = $ 0
+  nfields = split(line, field, "@")
+  substed = 0
+  len = length(field[1])
+  for (i = 2; i < nfields; i++) {
+    key = field[i]
+    keylen = length(key)
+    if (S_is_set[key]) {
+      value = S[key]
+      line = substr(line, 1, len) "" value "" substr(line, len + keylen + 3)
+      len += length(value) + length(field[++i])
+      substed = 1
+    } else
+      len += 1 + keylen
+  }
+
+  print line
+}
 
+_ACAWK
 _ACEOF
-cat >>$CONFIG_STATUS <<\_ACEOF
-for ac_file in : $CONFIG_FILES; do test "x$ac_file" = x: && continue
-  # Support "outfile[:infile[:infile...]]", defaulting infile="outfile.in".
-  case $ac_file in
-  - | *:- | *:-:* ) # input from stdin
-	cat >$tmp/stdin
-	ac_file_in=`echo "$ac_file" | sed 's,[^:]*:,,'`
-	ac_file=`echo "$ac_file" | sed 's,:.*,,'` ;;
-  *:* ) ac_file_in=`echo "$ac_file" | sed 's,[^:]*:,,'`
-	ac_file=`echo "$ac_file" | sed 's,:.*,,'` ;;
-  * )   ac_file_in=$ac_file.in ;;
+cat >>$CONFIG_STATUS <<\_ACEOF || ac_write_fail=1
+if sed "s/$ac_cr//" < /dev/null > /dev/null 2>&1; then
+  sed "s/$ac_cr\$//; s/$ac_cr/$ac_cs_awk_cr/g"
+else
+  cat
+fi < "$tmp/subs1.awk" > "$tmp/subs.awk" \
+  || { { $as_echo "$as_me:$LINENO: error: could not setup config files machinery" >&5
+$as_echo "$as_me: error: could not setup config files machinery" >&2;}
+   { (exit 1); exit 1; }; }
+_ACEOF
+
+# VPATH may cause trouble with some makes, so we remove $(srcdir),
+# ${srcdir} and @srcdir@ from VPATH if srcdir is ".", strip leading and
+# trailing colons and then remove the whole line if VPATH becomes empty
+# (actually we leave an empty line to preserve line numbers).
+if test "x$srcdir" = x.; then
+  ac_vpsub='/^[	 ]*VPATH[	 ]*=/{
+s/:*\$(srcdir):*/:/
+s/:*\${srcdir}:*/:/
+s/:*@srcdir@:*/:/
+s/^\([^=]*=[	 ]*\):*/\1/
+s/:*$//
+s/^[^=]*=[	 ]*$//
+}'
+fi
+
+cat >>$CONFIG_STATUS <<\_ACEOF || ac_write_fail=1
+fi # test -n "$CONFIG_FILES"
+
+
+eval set X "  :F $CONFIG_FILES      "
+shift
+for ac_tag
+do
+  case $ac_tag in
+  :[FHLC]) ac_mode=$ac_tag; continue;;
+  esac
+  case $ac_mode$ac_tag in
+  :[FHL]*:*);;
+  :L* | :C*:*) { { $as_echo "$as_me:$LINENO: error: invalid tag $ac_tag" >&5
+$as_echo "$as_me: error: invalid tag $ac_tag" >&2;}
+   { (exit 1); exit 1; }; };;
+  :[FH]-) ac_tag=-:-;;
+  :[FH]*) ac_tag=$ac_tag:$ac_tag.in;;
+  esac
+  ac_save_IFS=$IFS
+  IFS=:
+  set x $ac_tag
+  IFS=$ac_save_IFS
+  shift
+  ac_file=$1
+  shift
+
+  case $ac_mode in
+  :L) ac_source=$1;;
+  :[FH])
+    ac_file_inputs=
+    for ac_f
+    do
+      case $ac_f in
+      -) ac_f="$tmp/stdin";;
+      *) # Look for the file first in the build tree, then in the source tree
+	 # (if the path is not absolute).  The absolute path cannot be DOS-style,
+	 # because $ac_f cannot contain `:'.
+	 test -f "$ac_f" ||
+	   case $ac_f in
+	   [\\/$]*) false;;
+	   *) test -f "$srcdir/$ac_f" && ac_f="$srcdir/$ac_f";;
+	   esac ||
+	   { { $as_echo "$as_me:$LINENO: error: cannot find input file: $ac_f" >&5
+$as_echo "$as_me: error: cannot find input file: $ac_f" >&2;}
+   { (exit 1); exit 1; }; };;
+      esac
+      case $ac_f in *\'*) ac_f=`$as_echo "$ac_f" | sed "s/'/'\\\\\\\\''/g"`;; esac
+      ac_file_inputs="$ac_file_inputs '$ac_f'"
+    done
+
+    # Let's still pretend it is `configure' which instantiates (i.e., don't
+    # use $as_me), people would be surprised to read:
+    #    /* config.h.  Generated by config.status.  */
+    configure_input='Generated from '`
+	  $as_echo "$*" | sed 's|^[^:]*/||;s|:[^:]*/|, |g'
+	`' by configure.'
+    if test x"$ac_file" != x-; then
+      configure_input="$ac_file.  $configure_input"
+      { $as_echo "$as_me:$LINENO: creating $ac_file" >&5
+$as_echo "$as_me: creating $ac_file" >&6;}
+    fi
+    # Neutralize special characters interpreted by sed in replacement strings.
+    case $configure_input in #(
+    *\&* | *\|* | *\\* )
+       ac_sed_conf_input=`$as_echo "$configure_input" |
+       sed 's/[\\\\&|]/\\\\&/g'`;; #(
+    *) ac_sed_conf_input=$configure_input;;
+    esac
+
+    case $ac_tag in
+    *:-:* | *:-) cat >"$tmp/stdin" \
+      || { { $as_echo "$as_me:$LINENO: error: could not create $ac_file" >&5
+$as_echo "$as_me: error: could not create $ac_file" >&2;}
+   { (exit 1); exit 1; }; } ;;
+    esac
+    ;;
   esac
 
-  # Compute @srcdir@, @top_srcdir@, and @INSTALL@ for subdirectories.
-  ac_dir=`(dirname "$ac_file") 2>/dev/null ||
+  ac_dir=`$as_dirname -- "$ac_file" ||
 $as_expr X"$ac_file" : 'X\(.*[^/]\)//*[^/][^/]*/*$' \| \
 	 X"$ac_file" : 'X\(//\)[^/]' \| \
 	 X"$ac_file" : 'X\(//\)$' \| \
-	 X"$ac_file" : 'X\(/\)' \| \
-	 .     : '\(.\)' 2>/dev/null ||
-echo X"$ac_file" |
-    sed '/^X\(.*[^/]\)\/\/*[^/][^/]*\/*$/{ s//\1/; q; }
-  	  /^X\(\/\/\)[^/].*/{ s//\1/; q; }
-  	  /^X\(\/\/\)$/{ s//\1/; q; }
-  	  /^X\(\/\).*/{ s//\1/; q; }
-  	  s/.*/./; q'`
-  { if $as_mkdir_p; then
-    mkdir -p "$ac_dir"
-  else
-    as_dir="$ac_dir"
+	 X"$ac_file" : 'X\(/\)' \| . 2>/dev/null ||
+$as_echo X"$ac_file" |
+    sed '/^X\(.*[^/]\)\/\/*[^/][^/]*\/*$/{
+	    s//\1/
+	    q
+	  }
+	  /^X\(\/\/\)[^/].*/{
+	    s//\1/
+	    q
+	  }
+	  /^X\(\/\/\)$/{
+	    s//\1/
+	    q
+	  }
+	  /^X\(\/\).*/{
+	    s//\1/
+	    q
+	  }
+	  s/.*/./; q'`
+  { as_dir="$ac_dir"
+  case $as_dir in #(
+  -*) as_dir=./$as_dir;;
+  esac
+  test -d "$as_dir" || { $as_mkdir_p && mkdir -p "$as_dir"; } || {
     as_dirs=
-    while test ! -d "$as_dir"; do
-      as_dirs="$as_dir $as_dirs"
-      as_dir=`(dirname "$as_dir") 2>/dev/null ||
+    while :; do
+      case $as_dir in #(
+      *\'*) as_qdir=`$as_echo "$as_dir" | sed "s/'/'\\\\\\\\''/g"`;; #'(
+      *) as_qdir=$as_dir;;
+      esac
+      as_dirs="'$as_qdir' $as_dirs"
+      as_dir=`$as_dirname -- "$as_dir" ||
 $as_expr X"$as_dir" : 'X\(.*[^/]\)//*[^/][^/]*/*$' \| \
 	 X"$as_dir" : 'X\(//\)[^/]' \| \
 	 X"$as_dir" : 'X\(//\)$' \| \
-	 X"$as_dir" : 'X\(/\)' \| \
-	 .     : '\(.\)' 2>/dev/null ||
-echo X"$as_dir" |
-    sed '/^X\(.*[^/]\)\/\/*[^/][^/]*\/*$/{ s//\1/; q; }
-  	  /^X\(\/\/\)[^/].*/{ s//\1/; q; }
-  	  /^X\(\/\/\)$/{ s//\1/; q; }
-  	  /^X\(\/\).*/{ s//\1/; q; }
-  	  s/.*/./; q'`
+	 X"$as_dir" : 'X\(/\)' \| . 2>/dev/null ||
+$as_echo X"$as_dir" |
+    sed '/^X\(.*[^/]\)\/\/*[^/][^/]*\/*$/{
+	    s//\1/
+	    q
+	  }
+	  /^X\(\/\/\)[^/].*/{
+	    s//\1/
+	    q
+	  }
+	  /^X\(\/\/\)$/{
+	    s//\1/
+	    q
+	  }
+	  /^X\(\/\).*/{
+	    s//\1/
+	    q
+	  }
+	  s/.*/./; q'`
+      test -d "$as_dir" && break
     done
-    test ! -n "$as_dirs" || mkdir $as_dirs
-  fi || { { echo "$as_me:$LINENO: error: cannot create directory \"$ac_dir\"" >&5
-echo "$as_me: error: cannot create directory \"$ac_dir\"" >&2;}
+    test -z "$as_dirs" || eval "mkdir $as_dirs"
+  } || test -d "$as_dir" || { { $as_echo "$as_me:$LINENO: error: cannot create directory $as_dir" >&5
+$as_echo "$as_me: error: cannot create directory $as_dir" >&2;}
    { (exit 1); exit 1; }; }; }
-
   ac_builddir=.
 
-if test "$ac_dir" != .; then
-  ac_dir_suffix=/`echo "$ac_dir" | sed 's,^\.[\\/],,'`
-  # A "../" for each directory in $ac_dir_suffix.
-  ac_top_builddir=`echo "$ac_dir_suffix" | sed 's,/[^\\/]*,../,g'`
-else
-  ac_dir_suffix= ac_top_builddir=
-fi
+case "$ac_dir" in
+.) ac_dir_suffix= ac_top_builddir_sub=. ac_top_build_prefix= ;;
+*)
+  ac_dir_suffix=/`$as_echo "$ac_dir" | sed 's|^\.[\\/]||'`
+  # A ".." for each directory in $ac_dir_suffix.
+  ac_top_builddir_sub=`$as_echo "$ac_dir_suffix" | sed 's|/[^\\/]*|/..|g;s|/||'`
+  case $ac_top_builddir_sub in
+  "") ac_top_builddir_sub=. ac_top_build_prefix= ;;
+  *)  ac_top_build_prefix=$ac_top_builddir_sub/ ;;
+  esac ;;
+esac
+ac_abs_top_builddir=$ac_pwd
+ac_abs_builddir=$ac_pwd$ac_dir_suffix
+# for backward compatibility:
+ac_top_builddir=$ac_top_build_prefix
 
 case $srcdir in
-  .)  # No --srcdir option.  We are building in place.
+  .)  # We are building in place.
     ac_srcdir=.
-    if test -z "$ac_top_builddir"; then
-       ac_top_srcdir=.
-    else
-       ac_top_srcdir=`echo $ac_top_builddir | sed 's,/$,,'`
-    fi ;;
-  [\\/]* | ?:[\\/]* )  # Absolute path.
+    ac_top_srcdir=$ac_top_builddir_sub
+    ac_abs_top_srcdir=$ac_pwd ;;
+  [\\/]* | ?:[\\/]* )  # Absolute name.
     ac_srcdir=$srcdir$ac_dir_suffix;
-    ac_top_srcdir=$srcdir ;;
-  *) # Relative path.
-    ac_srcdir=$ac_top_builddir$srcdir$ac_dir_suffix
-    ac_top_srcdir=$ac_top_builddir$srcdir ;;
+    ac_top_srcdir=$srcdir
+    ac_abs_top_srcdir=$srcdir ;;
+  *) # Relative name.
+    ac_srcdir=$ac_top_build_prefix$srcdir$ac_dir_suffix
+    ac_top_srcdir=$ac_top_build_prefix$srcdir
+    ac_abs_top_srcdir=$ac_pwd/$srcdir ;;
 esac
+ac_abs_srcdir=$ac_abs_top_srcdir$ac_dir_suffix
 
-# Do not use `cd foo && pwd` to compute absolute paths, because
-# the directories may not exist.
-case `pwd` in
-.) ac_abs_builddir="$ac_dir";;
-*)
-  case "$ac_dir" in
-  .) ac_abs_builddir=`pwd`;;
-  [\\/]* | ?:[\\/]* ) ac_abs_builddir="$ac_dir";;
-  *) ac_abs_builddir=`pwd`/"$ac_dir";;
-  esac;;
-esac
-case $ac_abs_builddir in
-.) ac_abs_top_builddir=${ac_top_builddir}.;;
-*)
-  case ${ac_top_builddir}. in
-  .) ac_abs_top_builddir=$ac_abs_builddir;;
-  [\\/]* | ?:[\\/]* ) ac_abs_top_builddir=${ac_top_builddir}.;;
-  *) ac_abs_top_builddir=$ac_abs_builddir/${ac_top_builddir}.;;
-  esac;;
-esac
-case $ac_abs_builddir in
-.) ac_abs_srcdir=$ac_srcdir;;
-*)
-  case $ac_srcdir in
-  .) ac_abs_srcdir=$ac_abs_builddir;;
-  [\\/]* | ?:[\\/]* ) ac_abs_srcdir=$ac_srcdir;;
-  *) ac_abs_srcdir=$ac_abs_builddir/$ac_srcdir;;
-  esac;;
-esac
-case $ac_abs_builddir in
-.) ac_abs_top_srcdir=$ac_top_srcdir;;
-*)
-  case $ac_top_srcdir in
-  .) ac_abs_top_srcdir=$ac_abs_builddir;;
-  [\\/]* | ?:[\\/]* ) ac_abs_top_srcdir=$ac_top_srcdir;;
-  *) ac_abs_top_srcdir=$ac_abs_builddir/$ac_top_srcdir;;
-  esac;;
-esac
 
+  case $ac_mode in
+  :F)
+  #
+  # CONFIG_FILE
+  #
 
   case $INSTALL in
   [\\/$]* | ?:[\\/]* ) ac_INSTALL=$INSTALL ;;
-  *) ac_INSTALL=$ac_top_builddir$INSTALL ;;
+  *) ac_INSTALL=$ac_top_build_prefix$INSTALL ;;
   esac
+_ACEOF
 
-  if test x"$ac_file" != x-; then
-    { echo "$as_me:$LINENO: creating $ac_file" >&5
-echo "$as_me: creating $ac_file" >&6;}
-    rm -f "$ac_file"
-  fi
-  # Let's still pretend it is `configure' which instantiates (i.e., don't
-  # use $as_me), people would be surprised to read:
-  #    /* config.h.  Generated by config.status.  */
-  if test x"$ac_file" = x-; then
-    configure_input=
-  else
-    configure_input="$ac_file.  "
-  fi
-  configure_input=$configure_input"Generated from `echo $ac_file_in |
-				     sed 's,.*/,,'` by configure."
-
-  # First look for the input files in the build tree, otherwise in the
-  # src tree.
-  ac_file_inputs=`IFS=:
-    for f in $ac_file_in; do
-      case $f in
-      -) echo $tmp/stdin ;;
-      [\\/$]*)
-	 # Absolute (can't be DOS-style, as IFS=:)
-	 test -f "$f" || { { echo "$as_me:$LINENO: error: cannot find input file: $f" >&5
-echo "$as_me: error: cannot find input file: $f" >&2;}
-   { (exit 1); exit 1; }; }
-	 echo "$f";;
-      *) # Relative
-	 if test -f "$f"; then
-	   # Build tree
-	   echo "$f"
-	 elif test -f "$srcdir/$f"; then
-	   # Source tree
-	   echo "$srcdir/$f"
-	 else
-	   # /dev/null tree
-	   { { echo "$as_me:$LINENO: error: cannot find input file: $f" >&5
-echo "$as_me: error: cannot find input file: $f" >&2;}
-   { (exit 1); exit 1; }; }
-	 fi;;
-      esac
-    done` || { (exit 1); exit 1; }
+cat >>$CONFIG_STATUS <<\_ACEOF || ac_write_fail=1
+# If the template does not know about datarootdir, expand it.
+# FIXME: This hack should be removed a few years after 2.60.
+ac_datarootdir_hack=; ac_datarootdir_seen=
+
+ac_sed_dataroot='
+/datarootdir/ {
+  p
+  q
+}
+/@datadir@/p
+/@docdir@/p
+/@infodir@/p
+/@localedir@/p
+/@mandir@/p
+'
+case `eval "sed -n \"\$ac_sed_dataroot\" $ac_file_inputs"` in
+*datarootdir*) ac_datarootdir_seen=yes;;
+*@datadir@*|*@docdir@*|*@infodir@*|*@localedir@*|*@mandir@*)
+  { $as_echo "$as_me:$LINENO: WARNING: $ac_file_inputs seems to ignore the --datarootdir setting" >&5
+$as_echo "$as_me: WARNING: $ac_file_inputs seems to ignore the --datarootdir setting" >&2;}
+_ACEOF
+cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
+  ac_datarootdir_hack='
+  s&@datadir@&$datadir&g
+  s&@docdir@&$docdir&g
+  s&@infodir@&$infodir&g
+  s&@localedir@&$localedir&g
+  s&@mandir@&$mandir&g
+    s&\\\${datarootdir}&$datarootdir&g' ;;
+esac
 _ACEOF
-cat >>$CONFIG_STATUS <<_ACEOF
-  sed "$ac_vpsub
+
+# Neutralize VPATH when `$srcdir' = `.'.
+# Shell code in configure.ac might set extrasub.
+# FIXME: do we really want to maintain this feature?
+cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
+ac_sed_extra="$ac_vpsub
 $extrasub
 _ACEOF
-cat >>$CONFIG_STATUS <<\_ACEOF
+cat >>$CONFIG_STATUS <<\_ACEOF || ac_write_fail=1
 :t
 /@[a-zA-Z_][a-zA-Z_0-9]*@/!b
-s, at configure_input@,$configure_input,;t t
-s, at srcdir@,$ac_srcdir,;t t
-s, at abs_srcdir@,$ac_abs_srcdir,;t t
-s, at top_srcdir@,$ac_top_srcdir,;t t
-s, at abs_top_srcdir@,$ac_abs_top_srcdir,;t t
-s, at builddir@,$ac_builddir,;t t
-s, at abs_builddir@,$ac_abs_builddir,;t t
-s, at top_builddir@,$ac_top_builddir,;t t
-s, at abs_top_builddir@,$ac_abs_top_builddir,;t t
-s,@INSTALL@,$ac_INSTALL,;t t
-" $ac_file_inputs | (eval "$ac_sed_cmds") >$tmp/out
-  rm -f $tmp/stdin
-  if test x"$ac_file" != x-; then
-    mv $tmp/out $ac_file
-  else
-    cat $tmp/out
-    rm -f $tmp/out
-  fi
+s|@configure_input@|$ac_sed_conf_input|;t t
+s&@top_builddir@&$ac_top_builddir_sub&;t t
+s&@top_build_prefix@&$ac_top_build_prefix&;t t
+s&@srcdir@&$ac_srcdir&;t t
+s&@abs_srcdir@&$ac_abs_srcdir&;t t
+s&@top_srcdir@&$ac_top_srcdir&;t t
+s&@abs_top_srcdir@&$ac_abs_top_srcdir&;t t
+s&@builddir@&$ac_builddir&;t t
+s&@abs_builddir@&$ac_abs_builddir&;t t
+s&@abs_top_builddir@&$ac_abs_top_builddir&;t t
+s&@INSTALL@&$ac_INSTALL&;t t
+$ac_datarootdir_hack
+"
+eval sed \"\$ac_sed_extra\" "$ac_file_inputs" | $AWK -f "$tmp/subs.awk" >$tmp/out \
+  || { { $as_echo "$as_me:$LINENO: error: could not create $ac_file" >&5
+$as_echo "$as_me: error: could not create $ac_file" >&2;}
+   { (exit 1); exit 1; }; }
 
-done
-_ACEOF
+test -z "$ac_datarootdir_hack$ac_datarootdir_seen" &&
+  { ac_out=`sed -n '/\${datarootdir}/p' "$tmp/out"`; test -n "$ac_out"; } &&
+  { ac_out=`sed -n '/^[	 ]*datarootdir[	 ]*:*=/p' "$tmp/out"`; test -z "$ac_out"; } &&
+  { $as_echo "$as_me:$LINENO: WARNING: $ac_file contains a reference to the variable \`datarootdir'
+which seems to be undefined.  Please make sure it is defined." >&5
+$as_echo "$as_me: WARNING: $ac_file contains a reference to the variable \`datarootdir'
+which seems to be undefined.  Please make sure it is defined." >&2;}
+
+  rm -f "$tmp/stdin"
+  case $ac_file in
+  -) cat "$tmp/out" && rm -f "$tmp/out";;
+  *) rm -f "$ac_file" && mv "$tmp/out" "$ac_file";;
+  esac \
+  || { { $as_echo "$as_me:$LINENO: error: could not create $ac_file" >&5
+$as_echo "$as_me: error: could not create $ac_file" >&2;}
+   { (exit 1); exit 1; }; }
+ ;;
+
+
+
+  esac
+
+done # for ac_tag
 
-cat >>$CONFIG_STATUS <<\_ACEOF
 
 { (exit 0); exit 0; }
 _ACEOF
 chmod +x $CONFIG_STATUS
 ac_clean_files=$ac_clean_files_save
 
+test $ac_write_fail = 0 ||
+  { { $as_echo "$as_me:$LINENO: error: write failure creating $CONFIG_STATUS" >&5
+$as_echo "$as_me: error: write failure creating $CONFIG_STATUS" >&2;}
+   { (exit 1); exit 1; }; }
+
 
 # configure is writing to config.log, and then calls config.status.
 # config.status does its own redirection, appending to config.log.
@@ -4715,5 +6269,9 @@ if test "$no_create" != yes; then
   # would make configure fail if this is the last instruction.
   $ac_cs_success || { (exit 1); exit 1; }
 fi
+if test -n "$ac_unrecognized_opts" && test "$enable_option_checking" != no; then
+  { $as_echo "$as_me:$LINENO: WARNING: unrecognized options: $ac_unrecognized_opts" >&5
+$as_echo "$as_me: WARNING: unrecognized options: $ac_unrecognized_opts" >&2;}
+fi
 
 
diff --git a/package/elf2flt/src/configure.in b/package/elf2flt/src/configure.in
index 73443c6..951eb32 100644
--- a/package/elf2flt/src/configure.in
+++ b/package/elf2flt/src/configure.in
@@ -1,55 +1,111 @@
 dnl Process this file with autoconf to produce a configure script.
 AC_INIT(elf2flt.c)
 
+AC_ARG_WITH(zlib-prefix,
+	AS_HELP_STRING([--with-zlib-prefix=<dir>], [path to installed zlib]),
+	[ ac_zlib_prefix=$withval ],
+	[ ac_zlib_prefix=NONE ]
+)
+
 AC_ARG_WITH(libbfd,
-	[ --with-libbfd=<file>  path to libbfd.a library to use ],
+	AS_HELP_STRING([--with-libbfd=<file>], [path to libbfd.a library to use]),
 	[ ac_libbfd=$withval ],
 	[ ac_libbfd=NONE ]
 )
 
 AC_ARG_WITH(libiberty,
-	[ --with-libiberty=<file>  path to libiberty.a library to use ],
+	AS_HELP_STRING([--with-libiberty=<file>], [path to libiberty.a library to use]),
 	[ ac_libiberty=$withval ],
 	[ ac_libiberty=NONE ]
 )
 
 AC_ARG_WITH(bfd-include-dir,
-	[ --with-bfd-include-dir=<dir>  include path for correct bfd.h ],
+	AS_HELP_STRING([--with-bfd-include-dir=<dir>], [include path for correct bfd.h]),
 	[ ac_bfd_include_dir=$withval ],
 	[ ac_bfd_include_dir=NONE ]
 )
 
 AC_ARG_WITH(binutils-include-dir,
-	[ --with-binutils-include-dir=<dir>  include path for binutils headers ],
+	AS_HELP_STRING([--with-binutils-include-dir=<dir>], [include path for binutils headers]),
 	[ ac_binutils_include_dir=$withval ],
 	[ ac_binutils_include_dir=NONE ]
 )
 
 AC_ARG_WITH(binutils-ldscript-dir,
-	[ --with-binutils-ldscript-dir=<dir>  path to install elf2flt.ld ],
+	AS_HELP_STRING([--with-binutils-ldscript-dir=<dir>], [path to install elf2flt.ld]),
 	[ ac_binutils_ldscript_dir=$withval ],
 	[ ac_binutils_ldscript_dir=NONE ]
 )
 
+AC_ARG_WITH(binutils-build-dir,
+	AS_HELP_STRING([--with-binutils-build-dir=<dir>], [path to compiled binutils tree]),
+	[ ac_binutils_build_dir=$withval ],
+	[ ac_binutils_build_dir=NONE ]
+)
+
+AC_ARG_ENABLE(ld-elf2flt-binary,
+	AS_HELP_STRING([--disable-ld-elf2flt-binary], [use ld-elf2flt shell script]),
+	[ use_ld_elf2flt_binary=$enableval ],
+	[ use_ld_elf2flt_binary=yes ]
+)
+
+dnl convert a yes/no variable to 1/0 for C code
+var_yn_to_10() {
+	if eval test \"\$$1\" = yes ; then
+		eval $1=1
+	else
+		eval $1=0
+	fi
+}
+
 AC_ARG_ENABLE(got-check,
-	[ --disable-got-check - disable check for GOT (needed on H8) ],
+	AS_HELP_STRING([--disable-got-check], [disable check for GOT (needed on H8)]),
 	[ got_check=$enableval ],
 	[ got_check=yes ]
 )
+var_yn_to_10 got_check
 
-AC_ARG_ENABLE(emit_relocs,
-	[ --disable-emit-relocs - don't use the --emit-relocs (-q) linker option ],
+AC_ARG_ENABLE(emit-relocs,
+	AS_HELP_STRING([--disable-emit-relocs], [don't use the --emit-relocs (-q) linker option]),
 	[ emit_relocs=$enableval ],
 	[ emit_relocs=yes ]
 )
+var_yn_to_10 emit_relocs
+
+AC_ARG_ENABLE(emit-ctor-dtor,
+	AS_HELP_STRING([--enable-emit-ctor-dtor], [manually create ctor/dtor list]),
+	[ emit_ctor_dtor=$enableval ],
+	[ emit_ctor_dtor=no ]
+)
+var_yn_to_10 emit_ctor_dtor
+
+AC_ARG_ENABLE(always-reloc-text,
+	AS_HELP_STRING([--enable-always-reloc-text], [always process text relocs ignoring pic/got (needed on Blackfin)]),
+	[ always_reloc_text=$enableval ],
+	[
+	case $target in
+		bfin*) always_reloc_text=yes;;
+		*)     always_reloc_text=no;;
+	esac
+	]
+)
+var_yn_to_10 always_reloc_text
 
 AC_CANONICAL_HOST
 AC_CANONICAL_TARGET
 
 dnl Checks for programs.
 AC_PROG_CC
+AC_USE_SYSTEM_EXTENSIONS
 AC_PROG_INSTALL
 
+if test "$ac_binutils_build_dir" != "NONE"; then
+  test "$ac_libbfd"               = "NONE" && ac_libbfd="$ac_binutils_build_dir/bfd/libbfd.a"
+  test "$ac_libiberty"            = "NONE" && ac_libiberty="$ac_binutils_build_dir/libiberty/libiberty.a"
+  test "$ac_bfd_include_dir"      = "NONE" && ac_bfd_include_dir="$ac_binutils_build_dir/bfd"
+  test "$ac_binutils_include_dir" = "NONE" && ac_binutils_include_dir="$ac_binutils_build_dir/include"
+fi
+
 dnl Checks for libraries.
 if test "$ac_libiberty" = "NONE"; then
   AC_CHECK_LIB(iberty, objalloc_create)
@@ -63,6 +119,11 @@ if test "$ac_libbfd" = "NONE"; then
 else
   LIBS="$ac_libbfd $LIBS"
 fi
+if test "$ac_zlib_prefix" = "NONE"; then
+  AC_CHECK_LIB(z, deflate)
+else
+  LIBS="-L$ac_zlib_prefix/lib -lz $LIBS"
+fi
 
 bfd_include_dir=
 if test "$ac_bfd_include_dir" != "NONE"; then
@@ -74,6 +135,11 @@ if test "$ac_binutils_include_dir" != "NONE"; then
   binutils_include_dir="-I$ac_binutils_include_dir"
 fi
 
+zlib_include_dir=
+if test "$ac_zlib_prefix" != "NONE"; then
+  zlib_include_dir="-I$ac_zlib_prefix/include"
+fi
+
 binutils_ldscript_dir=
 if test "$ac_binutils_ldscript_dir" = "NONE"; then
   ac_binutils_ldscript_dir="\${TOOLDIR}/../${target_alias}/lib"
@@ -106,6 +172,20 @@ Run configure again specifying these options:
 ])
 fi
 
+SYMBOL_PREFIX=
+case $target in
+	h8300|bfin*)
+		SYMBOL_PREFIX=_
+		;;
+esac
+
+dnl Make sure we resolve system symbols before libiberty/libbfd ones.
+dnl Otherwise, things like getopt get screwed up because the system headers
+dnl redirect some functions to the system symbols, but other local symbols
+dnl come from libiberty/libbfd.
+dnl int getopt(int, char * const [], const char *) __asm("_" "getopt" "$UNIX2003");
+AC_CHECK_LIB(c, malloc, LIBS="-lc $LIBS")
+
 dnl Checks for header files.
 AC_HEADER_STDC
 AC_CHECK_HEADERS(fcntl.h unistd.h bfd.h)
@@ -116,7 +196,14 @@ AC_C_CONST
 dnl Checks for library functions.
 AC_FUNC_VPRINTF
 
-AC_CHECK_FUNCS(dcgettext)
+AC_CHECK_FUNCS([ \
+	dcgettext \
+	getline \
+	libintl_dgettext \
+	strsignal \
+])
+
+test "$GCC" = yes && CFLAGS="-Wall $CFLAGS"
 
 dnl Subsitute values
 AC_SUBST(target)
@@ -126,9 +213,14 @@ AC_SUBST(target_os)
 AC_SUBST(target_vendor)
 AC_SUBST(bfd_include_dir)
 AC_SUBST(binutils_include_dir)
+AC_SUBST(zlib_include_dir)
 AC_SUBST(binutils_ldscript_dir)
+AC_SUBST(use_ld_elf2flt_binary)
 AC_SUBST(got_check)
 AC_SUBST(emit_relocs)
+AC_SUBST(emit_ctor_dtor)
+AC_SUBST(always_reloc_text)
+AC_SUBST(SYMBOL_PREFIX)
 
-AC_OUTPUT(Makefile ld-elf2flt)
+AC_OUTPUT(ld-elf2flt.sh:ld-elf2flt.in Makefile elf2flt.ld)
 
diff --git a/package/elf2flt/src/elf2flt.c b/package/elf2flt/src/elf2flt.c
index 65a116c..2fea9b5 100644
--- a/package/elf2flt/src/elf2flt.c
+++ b/package/elf2flt/src/elf2flt.c
@@ -44,16 +44,13 @@
 #include <unistd.h>   /* Userland prototypes of the Unix std system calls    */
 #include <fcntl.h>    /* Flag value for file handling functions              */
 #include <time.h>
-#ifndef WIN32
-#include <netinet/in.h> /* Consts and structs defined by the internet system */
-#define	BINARY_FILE_OPTS
-#else
-#include <winsock2.h>
-#define	BINARY_FILE_OPTS "b"
-#endif
 
 /* from $(INSTALLDIR)/include       */
 #include <bfd.h>      /* Main header file for the BFD library                */
+#include <libiberty.h>
+
+#include "stubs.h"
+const char *elf2flt_progname;
 
 #if defined(TARGET_h8300)
 #include <elf/h8.h>      /* TARGET_* ELF support for the BFD library            */
@@ -61,18 +58,24 @@
 #include "cygwin-elf.h"	/* Cygwin uses a local copy */
 #elif defined(TARGET_microblaze)
 #include <elf/microblaze.h>	/* TARGET_* ELF support for the BFD library */
-#elif defined(TARGET_bfin)
-#include "elf/bfin.h"
 #else
 #include <elf.h>      /* TARGET_* ELF support for the BFD library            */
 #endif
 
+/* Always include Blackfin-specific defines in addition to common ELF stuff
+ * above as the common elf headers often do not have our relocs.
+ */
+#if defined(TARGET_bfin) && !defined(R_BFIN_RIMM16)
+#include "elf/bfin.h"
+#endif
+
 #if defined(__MINGW32__)
 #include <getopt.h>
 #endif
 
 /* from uClinux-x.x.x/include/linux */
 #include "flat.h"     /* Binary flat header description                      */
+#include "compress.h"
 
 #ifdef TARGET_e1
 #include <e1.h>
@@ -100,13 +103,6 @@
 #define ARCH    "e1-coff"
 #elif defined(TARGET_bfin)
 #define ARCH	"bfin"
-#define FLAT_RELOC_TYPE_TEXT 0
-#define FLAT_RELOC_TYPE_DATA 1
-#define FLAT_RELOC_TYPE_BSS 2
-#define FLAT_RELOC_TYPE_STACK 3
-#define FLAT_RELOC_PART_LO 0
-#define FLAT_RELOC_PART_HI 1
-#define PCREL24_MAGIC_OFFSET -1
 #elif defined(TARGET_nios)
 #define ARCH	"nios"
 #elif defined(TARGET_nios2)
@@ -142,7 +138,7 @@ int verbose = 0;      /* extra output when running */
 int pic_with_got = 0; /* do elf/got processing with PIC code */
 int load_to_ram = 0;  /* instruct loader to allocate everything into RAM */
 int ktrace = 0;       /* instruct loader output kernel trace on load */
-int compress = 0;     /* 1 = compress everything, 2 = compress data only */
+int docompress = 0;   /* 1 = compress everything, 2 = compress data only */
 int use_resolved = 0; /* If true, get the value of symbol references from */
 		      /* the program contents, not from the relocation table. */
 		      /* In this case, the input ELF file must be already */
@@ -150,80 +146,14 @@ int use_resolved = 0; /* If true, get the value of symbol references from */
 		      /* versions of GNU ld will give you a fully resolved */
 		      /* output file with relocation entries).  */
 
-const char *progname, *filename;
-int lineno;
-
-int nerrors = 0;
-int nwarnings = 0;
-
-static char where[200];
-
-enum {
-  /* Use exactly one of these: */
-  E_NOFILE = 0,         /* "progname: " */
-  E_FILE = 1,           /* "filename: " */
-  E_FILELINE = 2,       /* "filename:lineno: " */
-  E_FILEWHERE = 3,      /* "filename:%s: " -- set %s with ewhere() */
-          
-  /* Add in any of these with |': */
-  E_WARNING = 0x10,
-  E_PERROR = 0x20
-};
-                  
-void ewhere (const char *format, ...);
-void einfo (int type, const char *format, ...);
-                  
-
-void
-ewhere (const char *format, ...) {
-  va_list args;
-  va_start (args, format);
-  vsprintf (where, format, args);
-  va_end (args);
-}
-
-
-void
-einfo (int type, const char *format, ...) {
-  va_list args;
-
-  switch (type & 0x0f) {
-  case E_NOFILE:
-    fprintf (stderr, "%s: ", progname);
-    break;
-  case E_FILE:
-    fprintf (stderr, "%s: ", filename);
-    break;
-  case E_FILELINE:
-    ewhere ("%d", lineno);
-    /* fall-through */
-  case E_FILEWHERE:
-    fprintf (stderr, "%s:%s: ", filename, where);
-    break;
-  }
-
-  if (type & E_WARNING) {
-    fprintf (stderr, "warning: ");
-    nwarnings++;
-  } else {
-    nerrors++;
-  }
-
-  va_start (args, format);
-  vfprintf (stderr, format, args);
-  va_end (args);
-
-  if (type & E_PERROR)
-    perror ("");
-  else
-    fprintf (stderr, "\n");
-}
-
+/* Set if the text section contains any relocations.  If it does, we must
+   set the load_to_ram flag.  */
+int text_has_relocs = 0;
 
 asymbol**
 get_symbols (bfd *abfd, long *num)
 {
-  long storage_needed;
+  int32_t storage_needed;
   asymbol **symbol_table;
   long number_of_symbols;
   
@@ -235,7 +165,7 @@ get_symbols (bfd *abfd, long *num)
   if (storage_needed == 0)
     return NULL;
 
-  symbol_table = (asymbol **) malloc (storage_needed);
+  symbol_table = xmalloc (storage_needed);
 
   number_of_symbols = bfd_canonicalize_symtab (abfd, symbol_table);
   
@@ -279,6 +209,7 @@ get_symbol_offset(char *name, asection *sec, asymbol **symbol_table, long number
 
 
 
+#ifdef TARGET_nios2
 long
 get_gp_value(asymbol **symbol_table, long number_of_symbols)
 {
@@ -289,14 +220,15 @@ get_gp_value(asymbol **symbol_table, long number_of_symbols)
   }
   return -1;
 }
- 
+#endif
 
 
-long
-add_com_to_bss(asymbol **symbol_table, long number_of_symbols, long bss_len)
+
+int32_t
+add_com_to_bss(asymbol **symbol_table, int32_t number_of_symbols, int32_t bss_len)
 {
-  long i, comsize;
-  long offset;
+  int32_t i, comsize;
+  int32_t offset;
 
   comsize = 0;
   for (i=0; i<number_of_symbols; i++) {
@@ -331,60 +263,61 @@ weak_und_symbol(const char *reloc_section_name,
 }
 
 static int
-bfin_set_reloc (uint32_t *reloc, 
-		const char *reloc_section_name, 
+bfin_set_reloc (uint32_t *reloc,
+		const char *reloc_section_name,
 		const char *sym_name,
 		struct bfd_symbol *symbol,
-		int sp, int hilo, int32_t offset)
+		int sp, int32_t offset)
 {
-    unsigned int type;
+    unsigned int type = 0;
     uint32_t val;
 
-    if (strstr (reloc_section_name, "text"))
-	type = FLAT_RELOC_TYPE_TEXT;
-    else if (strstr (reloc_section_name, "data"))
-	type = FLAT_RELOC_TYPE_DATA;
-    else if (strstr (reloc_section_name, "bss"))
-	type = FLAT_RELOC_TYPE_BSS;
-    else if (strstr (reloc_section_name, "stack"))
-	type = FLAT_RELOC_TYPE_STACK;
-    else if (symbol->flags & BSF_WEAK){
-	/* weak symbol support ... if a weak symbol is undefined at the
-	   end of a final link, it should return 0 rather than error
-	   We will assume text section for the moment.
-	*/
-	type = FLAT_RELOC_TYPE_TEXT;
-    } else if (strstr (reloc_section_name, "*ABS*")){
-	/* (A data section initialization of something in the shared libc's text section
-	   does not resolve - i.e. a global pointer to function initialized with
-	   a libc function).
-	   The text section here is appropriate as the section information
-	   of the shared library is lost. The loader will do some calcs.
-	*/
-	type = FLAT_RELOC_TYPE_TEXT;
-    } else {
-	printf ("Unknown Type - relocation for %s in bad section - %s\n", sym_name, reloc_section_name);
-	return 1;
+    if (strstr (reloc_section_name, "stack")) {
+	    if (verbose)
+		    printf ("Stack-relative reloc, offset %08lx\n", offset);
+	    /* This must be a stack_start reloc for stack checking.  */
+	    type = 1;
     }
-
-    val = (offset & ((1 << 26) - 1)) << 6;
-    val |= (sp & (1 << 3) - 1) << 3;
-    val |= (hilo & 1) << 2;
-    val |= (type & (1 << 2) - 1);
+    val = (offset & ((1 << 26) - 1));
+    val |= (sp & (1 << 3) - 1) << 26;
+    val |= type << 29;
     *reloc = val;
     return 0;
 }
-#endif
 
+static bfd *compare_relocs_bfd;
+
+static int
+compare_relocs (const void *pa, const void *pb)
+{
+	const arelent *const *a = pa, *const *b = pb;
+	const arelent *ra = *a, *rb = *b;
+	unsigned long va, vb;
+	uint32_t a_vma, b_vma;
+
+	if (!ra->sym_ptr_ptr || !*ra->sym_ptr_ptr)
+		return -1;
+	else if (!rb->sym_ptr_ptr || !*rb->sym_ptr_ptr)
+		return 1;
+
+	a_vma = bfd_section_vma(compare_relocs_bfd,
+				(*(ra->sym_ptr_ptr))->section);
+	b_vma = bfd_section_vma(compare_relocs_bfd,
+				(*(rb->sym_ptr_ptr))->section);
+	va = (*(ra->sym_ptr_ptr))->value + a_vma + ra->addend;
+	vb = (*(rb->sym_ptr_ptr))->value + b_vma + rb->addend;
+	return va - vb;
+}
+#endif
 
 uint32_t *
 output_relocs (
   bfd *abs_bfd,
   asymbol **symbols,
   int number_of_symbols,
-  unsigned long *n_relocs,
-  unsigned char *text, int text_len, unsigned long text_vma,
-  unsigned char *data, int data_len, unsigned long data_vma,
+  uint32_t *n_relocs,
+  unsigned char *text, int text_len, uint32_t text_vma,
+  unsigned char *data, int data_len, uint32_t data_vma,
   bfd *rel_bfd)
 {
   uint32_t		*flat_relocs;
@@ -394,7 +327,7 @@ output_relocs (
   unsigned char		*sectionp;
   unsigned long		pflags;
   char			addstr[16];
-  long			sym_addr, sym_vma, section_vma;
+  uint32_t		sym_addr, sym_vma, section_vma;
   int			relsize, relcount;
   int			flat_reloc_count;
   int			sym_reloc_size, rc;
@@ -402,6 +335,9 @@ output_relocs (
   int			bad_relocs = 0;
   asymbol		**symb;
   long			nsymb;
+#ifdef TARGET_bfin
+  unsigned long		persistent_data = 0;
+#endif
   
 #if 0
   printf("%s(%d): output_relocs(abs_bfd=%d,synbols=0x%x,number_of_symbols=%d"
@@ -426,19 +362,17 @@ dump_symbols(symbols, number_of_symbols);
    * terminator even though the relocatable one doesn't have the GOT!
    */
   if (pic_with_got && !use_resolved) {
-    unsigned long *lp = (unsigned long *)data;
+    uint32_t *lp = (uint32_t *)data;
     /* Should call ntohl(*lp) here but is isn't going to matter */
     while (*lp != 0xffffffff) lp++;
     got_size = ((unsigned char *)lp) - data;
     if (verbose)
 	    printf("GOT table contains %d entries (%d bytes)\n",
-			    got_size/sizeof(unsigned long), got_size);
+			    got_size/sizeof(uint32_t), got_size);
 #ifdef TARGET_m68k
-    if (got_size > GOT_LIMIT) {
-	    fprintf(stderr, "GOT too large: %d bytes (limit = %d bytes)\n",
-			    got_size, GOT_LIMIT);
-	    exit(1);
-    }
+    if (got_size > GOT_LIMIT)
+	    fatal("GOT too large: %d bytes (limit = %d bytes)",
+			got_size, GOT_LIMIT);
 #endif
   }
 
@@ -462,7 +396,7 @@ dump_symbols(symbols, number_of_symbols);
 	 *	Only relocate things in the data sections if we are PIC/GOT.
 	 *	otherwise do text as well
 	 */
-	if (!pic_with_got && (a->flags & SEC_CODE))
+	if ((!pic_with_got || ALWAYS_RELOC_TEXT) && (a->flags & SEC_CODE))
 		sectionp = text + (a->vma - text_vma);
 	else if (a->flags & SEC_DATA)
 		sectionp = data + (a->vma - data_vma);
@@ -492,7 +426,8 @@ dump_symbols(symbols, number_of_symbols);
 	}
 
 	symb = get_symbols(rel_bfd, &nsymb);
-	relpp = (arelent **) xmalloc(relsize);
+	relpp = xmalloc(relsize);
+
 	relcount = bfd_canonicalize_reloc(rel_bfd, r, relpp, symb);
 	if (relcount <= 0) {
 		if (verbose)
@@ -500,6 +435,10 @@ dump_symbols(symbols, number_of_symbols);
 			__FILE__, __LINE__, r->name);
 		continue;
 	} else {
+#ifdef TARGET_bfin
+		compare_relocs_bfd = abs_bfd;
+		qsort (relpp, relcount, sizeof *relpp, compare_relocs);
+#endif
 		for (p = relpp; (relcount && (*p != NULL)); p++, relcount--) {
 			unsigned char *r_mem;
 			int relocation_needed = 0;
@@ -513,6 +452,7 @@ dump_symbols(symbols, number_of_symbols);
 			{
 			case R_MICROBLAZE_NONE:
 			case R_MICROBLAZE_64_NONE:
+			case R_MICROBLAZE_32_PCREL_LO:
 				continue;
 			}
 #endif /* TARGET_microblaze */
@@ -598,7 +538,7 @@ dump_symbols(symbols, number_of_symbols);
 			 *	Fixup offset in the actual section.
 			 */
 			addstr[0] = 0;
-#ifndef TARGET_e1
+#if !defined TARGET_e1 && !defined TARGET_bfin
   			if ((sym_addr = get_symbol_offset((char *) sym_name,
 			    sym_section, symbols, number_of_symbols)) == -1) {
 				sym_addr = 0;
@@ -701,6 +641,10 @@ dump_symbols(symbols, number_of_symbols);
 				case R_ARM_REL32:
 				case R_ARM_THM_PC11:
 				case R_ARM_THM_PC22:
+				case R_ARM_PC24:
+				case R_ARM_PLT32:
+				case R_ARM_GOTPC:
+				case R_ARM_GOT32:
 					relocation_needed = 0;
 					break;
 				default:
@@ -718,6 +662,61 @@ dump_symbols(symbols, number_of_symbols);
 					continue;
 				default:
 					goto bad_resolved_reloc;
+#elif defined TARGET_bfin
+				case R_BFIN_RIMM16:
+				case R_BFIN_LUIMM16:
+				case R_BFIN_HUIMM16:
+				    sym_vma = bfd_section_vma(abs_bfd, sym_section);
+				    sym_addr += sym_vma + q->addend;
+
+				    if (weak_und_symbol(sym_section->name, (*(q->sym_ptr_ptr))))
+					continue;
+				    if (q->howto->type == R_BFIN_RIMM16 && (0xFFFF0000 & sym_addr)) {
+					fprintf (stderr, "Relocation overflow for rN = %s\n",sym_name);
+					bad_relocs++;
+				    }
+				    if ((0xFFFF0000 & sym_addr) != persistent_data) {
+				    flat_relocs = (uint32_t *)
+					(realloc (flat_relocs, (flat_reloc_count + 1) * sizeof (uint32_t)));
+					    if (verbose)
+						    printf ("New persistent data for %08lx\n", sym_addr);
+					    persistent_data = 0xFFFF0000 & sym_addr;
+					    flat_relocs[flat_reloc_count++]
+						    = (sym_addr >> 16) | (3 << 26);
+				    }
+
+				    flat_relocs = (uint32_t *)
+					(realloc (flat_relocs, (flat_reloc_count + 1) * sizeof (uint32_t)));
+				    if (bfin_set_reloc (flat_relocs + flat_reloc_count,
+							sym_section->name, sym_name,
+							(*(q->sym_ptr_ptr)),
+							q->howto->type == R_BFIN_HUIMM16 ? 1 : 0,
+							section_vma + q->address))
+					bad_relocs++;
+				    if (a->flags & SEC_CODE)
+					text_has_relocs = 1;
+				    flat_reloc_count++;
+				    break;
+
+				case R_BFIN_BYTE4_DATA:
+				    sym_vma = bfd_section_vma(abs_bfd, sym_section);
+				    sym_addr += sym_vma + q->addend;
+
+				    if (weak_und_symbol (sym_section->name, (*(q->sym_ptr_ptr))))
+					continue;
+
+				    flat_relocs = (uint32_t *)
+					(realloc (flat_relocs, (flat_reloc_count + 1) * sizeof (uint32_t)));
+				    if (bfin_set_reloc (flat_relocs + flat_reloc_count,
+							sym_section->name, sym_name,
+							(*(q->sym_ptr_ptr)),
+							2, section_vma + q->address))
+					bad_relocs++;
+				    if (a->flags & SEC_CODE)
+					text_has_relocs = 1;
+
+				    flat_reloc_count++;
+				    break;
 #else
 				default:
 					/* The default is to assume that the
@@ -792,7 +791,7 @@ dump_symbols(symbols, number_of_symbols);
 							sym_vma, (*(q->sym_ptr_ptr))->value,
 							q->address, sym_addr,
 							(*p)->howto->rightshift,
-							*(unsigned long *)r_mem);
+							*(uint32_t *)r_mem);
 					sym_vma = bfd_section_vma(abs_bfd, sym_section);
 					sym_addr += sym_vma + q->addend;
 					break;
@@ -809,7 +808,7 @@ dump_symbols(symbols, number_of_symbols);
 							sym_vma, (*(q->sym_ptr_ptr))->value,
 							q->address, sym_addr,
 							(*p)->howto->rightshift,
-							*(unsigned long *)r_mem);
+							*(uint32_t *)r_mem);
 				case R_ARM_PC24:
 					sym_vma = 0;
 					sym_addr = (sym_addr-q->address)>>(*p)->howto->rightshift;
@@ -900,15 +899,11 @@ dump_symbols(symbols, number_of_symbols);
 		   the relocation symbol. */
 				{
 					unsigned char *p = r_mem;
-					unsigned long offset;
 					pflags=0x80000000;
 
 					/* work out the relocation */
 					sym_vma = bfd_section_vma(abs_bfd, sym_section);
-					/* grab any offset from the text */
-					offset = (p[2]<<24) + (p[3] << 16) + (p[6] << 8) + (p[7]);
-					/* Update the address */
-					sym_addr += offset + sym_vma + q->addend;
+					sym_addr += sym_vma + q->addend;
 					/* Write relocated pointer back */
 					p[2] = (sym_addr >> 24) & 0xff;
 					p[3] = (sym_addr >> 16) & 0xff;
@@ -940,36 +935,21 @@ dump_symbols(symbols, number_of_symbols);
 				case R_MICROBLAZE_32:
 				{	
 					unsigned char *p = r_mem;
-					unsigned long offset;
 
-					/* grab any offset from the text */
-					offset = (p[0]<<24) + (p[1] << 16) + (p[2] << 8) + (p[3]);
 					sym_vma = bfd_section_vma(abs_bfd, sym_section);
-					/* This is a horrible kludge.  For some
-					   reason, *sometimes* the offset is in
-					   both addend and the code.  Detect
-					   it, and cancel the effect.  Otherwise
-					   the offset gets added twice - ouch.
-					   There should be a better test
-					   for this condition, based on the
-					   BFD data structures */
-					if(offset==q->addend)
-						offset=0;
-
-					sym_addr += offset + sym_vma + q->addend;
+					sym_addr += sym_vma + q->addend;
 					relocation_needed = 1;
 					break;
 				}
 				case R_MICROBLAZE_64_PCREL:
 					sym_vma = 0;
-					//sym_addr = (*(q->sym_ptr_ptr))->value;
 					sym_addr += sym_vma + q->addend;
 					sym_addr -= (q->address + 4);
 					sym_addr = htonl(sym_addr);
 					/* insert 16 MSB */
-					* ((unsigned short *) (r_mem+2)) |= (sym_addr) & 0xFFFF;
+					* ((unsigned short *) (r_mem+2)) = (sym_addr) & 0xFFFF;
 					/* then 16 LSB */
-					* ((unsigned short *) (r_mem+6)) |= (sym_addr >> 16) & 0xFFFF;
+					* ((unsigned short *) (r_mem+6)) = (sym_addr >> 16) & 0xFFFF;
 					/* We've done all the work, so continue
 					   to next reloc instead of break */
 					continue;
@@ -1149,7 +1129,7 @@ NIOS2_RELOC_ERR:
 					sym_addr = (((*(q->sym_ptr_ptr))->value-
 						q->address) >> 2) & 0x3fffffff;
 					sym_addr |= (
-						ntohl(*(unsigned long *)r_mem)
+						ntohl(*(uint32_t *)r_mem)
 						& 0xc0000000
 						);
 					break;
@@ -1159,7 +1139,7 @@ NIOS2_RELOC_ERR:
 					sym_vma = bfd_section_vma(abs_bfd, sym_section);
 					sym_addr += sym_vma + q->addend;
 					sym_addr |= (
-						htonl(*(unsigned long *)r_mem)
+						htonl(*(uint32_t *)r_mem)
 						& 0xffc00000
 						);
 					break;
@@ -1170,118 +1150,12 @@ NIOS2_RELOC_ERR:
 					sym_addr += sym_vma + q->addend;
 					sym_addr &= 0x000003ff;
 					sym_addr |= (
-						htonl(*(unsigned long *)r_mem)
+						htonl(*(uint32_t *)r_mem)
 						& 0xfffffc00
 						);
 					break;
 #endif /* TARGET_sparc */
 
-#ifdef TARGET_bfin
-				case R_pcrel12_jump:
-				case R_pcrel12_jump_s:
-				case R_pcrel24:
-				case R_pcrel24_jump_l:
-				case R_pcrel24_jump_x:
-				case R_pcrel24_call_x:
-				case R_pcrel10:
-				case R_pcrel11:
-				case R_pcrel5m2:
-				  sym_addr += q->addend;// get the symbol addr
-				  sym_vma = bfd_section_vma(abs_bfd, sym_section);
-				  sym_addr -= q->address; // make it PC relative 
-				  // implicitly assumes code section and symbol section are same
-				  break;
-				case R_got:
-				    /* Ignore these.  */
-				    break;
-
-				case R_rimm16:
-				    sym_addr += q->addend;
-				    if(weak_und_symbol(sym_section->name, (*(q->sym_ptr_ptr))))
-					continue;
-				    if(0xFFFF0000 & sym_addr){
-					fprintf (stderr, "Relocation overflow for rN = %s\n",sym_name);
-					bad_relocs++;
-				    }
-				    flat_relocs = (uint32_t *)
-					(realloc (flat_relocs, (flat_reloc_count + 1) * sizeof (uint32_t)));
-				    if (bfin_set_reloc (flat_relocs + flat_reloc_count, 
-							sym_section->name, sym_name,
-							(*(q->sym_ptr_ptr)),
-							0, FLAT_RELOC_PART_LO, 
-							section_vma + q->address))
-					bad_relocs++;
-				    flat_reloc_count++;
-				    break;
-				    
-				case R_luimm16:
-				case R_huimm16:
-				{
-				    unsigned int sp;
-				    unsigned int reloc_count_incr;
-				    unsigned int hi_lo;
-
-				    if (q->howto->type == R_luimm16)
-					hi_lo = FLAT_RELOC_PART_LO;
-				    else
-					hi_lo = FLAT_RELOC_PART_HI;
-				
-				    sym_addr += q->addend;
-
-				    flat_relocs = (uint32_t *)
-					(realloc (flat_relocs, (flat_reloc_count + 2) * sizeof (uint32_t)));
-				    reloc_count_incr = 1;
-				    if (weak_und_symbol (sym_section->name, (*(q->sym_ptr_ptr))))
-					continue;
-				    if (0xFFFF0000 & sym_addr) {
-					/* value is > 16 bits - use an extra field */
-					/* see if we have already output that symbol */
-					/* reloc may be addend from symbol and       */
-					/* we can only store 16 bit offsets	     */
-					sp = 1;
-					if ((*(q->sym_ptr_ptr))->udata.i == 0
-					    || flat_relocs[(*(q->sym_ptr_ptr))->udata.i] != sym_addr
-					    || ((*(q->sym_ptr_ptr))->udata.i & 0xFFFF0000))
-					{
-					    reloc_count_incr = 2;
-					    flat_relocs[flat_reloc_count + 1] = sym_addr;
-					    (*(q->sym_ptr_ptr))->udata.i = flat_reloc_count + 1;
-					    sym_addr = 0; // indication to loader to read next
-					} else{
-					    sym_addr = (*(q->sym_ptr_ptr))->udata.i;
-					}
-				    } else {
-					sp = 0;
-				    }
-
-				    if (bfin_set_reloc (flat_relocs + flat_reloc_count, 
-							sym_section->name, sym_name,
-							(*(q->sym_ptr_ptr)),
-							sp, hi_lo,
-							section_vma + q->address))
-					bad_relocs++;
-				    flat_reloc_count += reloc_count_incr;
-				    break;
-				}
-				case R_byte4_data:
-				    sym_addr += q->addend;
-
-				    if (weak_und_symbol (sym_section->name, *q->sym_ptr_ptr))
-					continue;
-
-				    flat_relocs = (uint32_t *)
-					(realloc (flat_relocs, (flat_reloc_count + 1) * sizeof (uint32_t)));
-				    if (bfin_set_reloc (flat_relocs + flat_reloc_count, 
-							sym_section->name, sym_name,
-							(*(q->sym_ptr_ptr)),
-							2, FLAT_RELOC_PART_LO, 
-							section_vma + q->address))
-					bad_relocs++;
-
-				    flat_reloc_count++;
-				    break;
-
-#endif //TARGET_bfin
 
 #ifdef TARGET_sh
 				case R_SH_DIR32:
@@ -1490,9 +1364,9 @@ DIS29_RELOCATION:
 #if defined(TARGET_arm)
 				union {
 					unsigned char c[4];
-					unsigned long l;
+					uint32_t l;
 				} tmp;
-				long hl;
+				int32_t hl;
 				int i0, i1, i2, i3;
 
 				/*
@@ -1510,7 +1384,7 @@ DIS29_RELOCATION:
 					i3 = 0;
 				}
 
-				tmp.l = *(unsigned long *)r_mem;
+				tmp.l = *(uint32_t *)r_mem;
 				hl = tmp.c[i0] | (tmp.c[i1] << 8) | (tmp.c[i2] << 16);
 				if (use_resolved ||
 					(((*p)->howto->type != R_ARM_PC24) &&
@@ -1528,51 +1402,9 @@ DIS29_RELOCATION:
 					((*p)->howto->type != R_ARM_PLT32)))
 					tmp.c[i3] = (hl >> 24) & 0xff;
 				if ((*p)->howto->type == R_ARM_ABS32)
-					*(unsigned long *)r_mem = htonl(hl);
+					*(uint32_t *)r_mem = htonl(hl);
 				else
-					*(unsigned long *)r_mem = tmp.l;
-
-#elif defined(TARGET_bfin)
-				if ((*p)->howto->type == R_pcrel24
-				    || (*p)->howto->type == R_pcrel24_jump_l
-				    || (*p)->howto->type == R_pcrel24_jump_x
-				    || (*p)->howto->type == R_pcrel24_call_x)
-				{
-				    sym_addr += 2*-1*PCREL24_MAGIC_OFFSET;
-				    *((unsigned short *)(sectionp + q->address) + 1 + PCREL24_MAGIC_OFFSET)
-					= (sym_addr >> 1) & 0xffff;
-				    *((unsigned short *)(sectionp + q->address) + PCREL24_MAGIC_OFFSET)
-					= (0xff00 & *((unsigned short *) (sectionp + q->address) + PCREL24_MAGIC_OFFSET)
-					   | ((sym_addr >> 17) & 0xff));
-				} else if ((*p)->howto->type == R_byte4_data) {
-				    *((uint32_t *)(sectionp + q->address)) = sym_addr;
-				} else if ((*p)->howto->type == R_pcrel12_jump
-					   || (*p)->howto->type == R_pcrel12_jump_s) {
-				    *((unsigned short *)(sectionp + q->address))
-					= (0xf000 & *((unsigned short *)(sectionp + q->address))
-					   | ((sym_addr >> 1) & 0xfff));
-				} else if ((*p)->howto->type == R_pcrel10) {
-				    *((unsigned short *)(sectionp + q->address))
-					= (~0x3ff & *((unsigned short *)(sectionp + q->address))
-					   | ((sym_addr >> 1) & 0x3ff));
-				} else if ((*p)->howto->type == R_rimm16
-					   || (*p)->howto->type == R_huimm16
-					   || (*p)->howto->type == R_luimm16) {
-				    /* for l and h we set the lower 16 bits which is only when it will be used */
-				    *((unsigned short *) (sectionp + q->address)) = (unsigned short) sym_addr;
-				} else if ((*p)->howto->type == R_pcrel5m2) {
-				    *((unsigned short *)(sectionp + q->address))
-					= (0xfff0 & *((unsigned short *)(sectionp + q->address))
-					   | ((sym_addr >> 1) & 0xf));
-				} else if ((*p)->howto->type == R_pcrel11){
-				    *((unsigned short *)(sectionp + q->address))
-					= (0xfc00 & *((unsigned short *)(sectionp + q->address))
-					   | ((sym_addr >> 1) & 0x3ff));
-				} else if (0xE0 <= (*p)->howto->type && 0xF3 >= (*p)->howto->type) {
-				    //arith relocs dont generate a real relocation
-				} else {
-				    printf("Blackfin relocation fail for reloc type: 0x%x\n", (*p)->howto->type);
-				}
+					*(uint32_t *)r_mem = tmp.l;
 #elif defined(TARGET_e1)
 #define OPCODE_SIZE 2           /* Add 2 bytes, counting the opcode size*/
 				switch ((*p)->howto->type) {
@@ -1599,7 +1431,17 @@ DIS29_RELOCATION:
 						exit(0);
 				break;
 				}
-#else /* ! TARGET_arm && ! TARGET_e1 */
+#elif defined TARGET_bfin
+				if ((*p)->howto->type == R_BFIN_RIMM16
+				    || (*p)->howto->type == R_BFIN_HUIMM16
+				    || (*p)->howto->type == R_BFIN_LUIMM16)
+				{
+					/* for l and h we set the lower 16 bits which is only when it will be used */
+					bfd_putl16 (sym_addr, sectionp + q->address);
+				} else if ((*p)->howto->type == R_BFIN_BYTE4_DATA) {
+					bfd_putl32 (sym_addr, sectionp + q->address);
+				}
+#else /* ! TARGET_arm && ! TARGET_e1 && ! TARGET_bfin */
 
 				switch (q->howto->type) {
 #ifdef TARGET_v850
@@ -1652,19 +1494,6 @@ DIS29_RELOCATION:
 #endif /* !TARGET_arm */
 			}
 
-#ifdef TARGET_bfin
-			else {
-			    if ((*p)->howto->type == R_rimm16
-				|| (*p)->howto->type == R_huimm16
-				|| (*p)->howto->type == R_luimm16)
-			    {
-				/* for l and h we set the lower 16 bits which is only when it will be used */
-				*((unsigned short *) (sectionp + q->address)) = (unsigned short) sym_addr;
-			    } else if ((*p)->howto->type == R_byte4_data) {
-				*((uint32_t *)(sectionp + q->address)) = sym_addr;
-			    }
-			}
-#endif
 			if (verbose)
 				printf("  RELOC[%d]: offset=0x%x symbol=%s%s "
 					"section=%s size=%d "
@@ -1713,7 +1542,7 @@ DIS29_RELOCATION:
 				}
 #endif
 				flat_reloc_count++;
-#endif
+#endif //TARGET_bfin
 				relocation_needed = 0;
 				pflags = 0;
 			}
@@ -1741,10 +1570,8 @@ printf("%s(%d): symbol name=%s address=0x%x section=%s -> RELOC=0x%x\n",
 
 
 
-static char * program;
-
 static void usage(void)
-{  
+{
     fprintf(stderr, "Usage: %s [vrzd] [-p <abs-pic-file>] [-s stack-size] "
 	"[-o <output-file>] <elf-file>\n\n"
 	"       -v              : verbose operation\n"
@@ -1759,14 +1586,14 @@ static void usage(void)
 	"       -p abs-pic-file : GOT/PIC processing with files\n"
 	"       -s stacksize    : set application stack size\n"
 	"       -o output-file  : output file name\n\n",
-	program);
+	elf2flt_progname);
 	fprintf(stderr, "Compiled for " ARCH " architecture\n\n");
     exit(2);
 }
 
 
 /* Write NUM zeroes to STREAM.  */
-static void write_zeroes (unsigned long num, FILE *stream)
+static void write_zeroes (unsigned long num, stream *stream)
 {
   char zeroes[1024];
   if (num > 0) {
@@ -1774,11 +1601,11 @@ static void write_zeroes (unsigned long num, FILE *stream)
        work for stdio output files.  */
     memset(zeroes, 0x00, 1024);
     while (num > sizeof(zeroes)) {
-      fwrite(zeroes, sizeof(zeroes), 1, stream);
+      fwrite_stream(zeroes, sizeof(zeroes), 1, stream);
       num -= sizeof(zeroes);
     }
     if (num > 0)
-      fwrite(zeroes, num, 1, stream);
+      fwrite_stream(zeroes, num, 1, stream);
   }
 }
 
@@ -1793,44 +1620,39 @@ int main(int argc, char *argv[])
   int opt;
   int i;
   int stack;
-  char  cmd[1024];
-  FILE *gf = NULL;
+  stream gf;
 
   asymbol **symbol_table;
   long number_of_symbols;
 
-  unsigned long data_len = 0;
-  unsigned long bss_len = 0;
-  unsigned long text_len = 0;
-  unsigned long reloc_len;
+  uint32_t data_len = 0;
+  uint32_t bss_len = 0;
+  uint32_t text_len = 0;
+  uint32_t reloc_len;
 
-  unsigned long data_vma = ~0;
-  unsigned long bss_vma = ~0;
-  unsigned long text_vma = ~0;
+  uint32_t data_vma = ~0;
+  uint32_t bss_vma = ~0;
+  uint32_t text_vma = ~0;
 
-  unsigned long text_offs;
+  uint32_t text_offs;
 
   void *text;
   void *data;
   uint32_t *reloc;
-  
-  struct flat_hdr hdr;
 
-  int gf_is_pipe = 0;
+  struct flat_hdr hdr;
 
-  program = argv[0];
-  progname = argv[0];
+  elf2flt_progname = argv[0];
+  xmalloc_set_program_name(elf2flt_progname);
 
   if (argc < 2)
   	usage();
-  
-  if (sizeof(hdr) != 64) {
-    fprintf(stderr,
+
+  if (sizeof(hdr) != 64)
+    fatal(
 	    "Potential flat header incompatibility detected\n"
-	    "header size should be 64 but is %d\n",
+	    "header size should be 64 but is %d",
 	    sizeof(hdr));
-    exit(64);
-  }
 
 #ifndef TARGET_e1
   stack = 4096;
@@ -1850,10 +1672,10 @@ int main(int argc, char *argv[])
       ktrace++;
       break;
     case 'z':
-      compress = 1;
+      docompress = 1;
       break;
     case 'd':
-      compress = 2;
+      docompress = 2;
       break;
     case 'p':
       pfile = optarg;
@@ -1865,7 +1687,10 @@ int main(int argc, char *argv[])
       use_resolved = 1;
       break;
     case 's':
-      stack = atoi(optarg);
+      if (sscanf(optarg, "%i", &stack) != 1) {
+        fprintf(stderr, "%s invalid stack size %s\n", argv[0], optarg);
+        usage();
+      }
       break;
     case 'R':
       rel_file = optarg;
@@ -1884,7 +1709,7 @@ int main(int argc, char *argv[])
   if (!load_to_ram && !pfile)
     load_to_ram = 1;
 
-  filename = fname = argv[argc-1];
+  fname = argv[argc-1];
 
   if (pfile) {
     pic_with_got = 1;
@@ -1895,49 +1720,36 @@ int main(int argc, char *argv[])
   if (! rel_file)
     rel_file = fname;
 
-  if (!(rel_bfd = bfd_openr(rel_file, 0))) {
-    fprintf(stderr, "Can't open %s\n", rel_file);
-    exit(1);
-  }
+  if (!(rel_bfd = bfd_openr(rel_file, 0)))
+    fatal_perror("Can't open '%s'", rel_file);
 
-  if (bfd_check_format (rel_bfd, bfd_object) == 0) {
-    fprintf(stderr, "File is not an object file\n");
-    exit(2);
-  }
+  if (bfd_check_format (rel_bfd, bfd_object) == 0)
+    fatal("File is not an object file");
 
   if (abs_file == rel_file)
     abs_bfd = rel_bfd; /* one file does all */
   else {
-    if (!(abs_bfd = bfd_openr(abs_file, 0))) {
-      fprintf(stderr, "Can't open %s\n", abs_file);
-      exit(1);
-    }
+    if (!(abs_bfd = bfd_openr(abs_file, 0)))
+      fatal_perror("Can't open '%s'", abs_file);
 
-    if (bfd_check_format (abs_bfd, bfd_object) == 0) {
-      fprintf(stderr, "File is not an object file\n");
-      exit(2);
-    }
+    if (bfd_check_format (abs_bfd, bfd_object) == 0)
+      fatal("File is not an object file");
   }
 
-  if (! (bfd_get_file_flags(rel_bfd) & HAS_RELOC)) {
-    fprintf (stderr, "%s: Input file contains no relocation info\n", rel_file);
-    exit (2);
-  }
+  if (! (bfd_get_file_flags(rel_bfd) & HAS_RELOC))
+    fatal("%s: Input file contains no relocation info", rel_file);
 
-  if (use_resolved && !(bfd_get_file_flags(abs_bfd) & EXEC_P)) {
+  if (use_resolved && !(bfd_get_file_flags(abs_bfd) & EXEC_P))
     /* `Absolute' file is not absolute, so neither are address
        contained therein.  */
-    fprintf (stderr,
-	     "%s: `-a' option specified with non-fully-resolved input file\n",
+    fatal("%s: `-a' option specified with non-fully-resolved input file",
 	     bfd_get_filename (abs_bfd));
-    exit (2);
-  }
 
   symbol_table = get_symbols(abs_bfd, &number_of_symbols);
 
   /* Group output sections into text, data, and bss, and calc their sizes.  */
   for (s = abs_bfd->sections; s != NULL; s = s->next) {
-    unsigned long *vma, *len;
+    uint32_t *vma, *len;
     bfd_size_type sec_size;
     bfd_vma sec_vma;
 
@@ -1966,12 +1778,10 @@ int main(int argc, char *argv[])
       *len = sec_vma + sec_size - *vma;
   }
 
-  if (text_len == 0) {
-    fprintf (stderr, "%s: no .text section", abs_file);
-    exit (2);
-  }
+  if (text_len == 0)
+    fatal("%s: no .text section", abs_file);
 
-  text = malloc(text_len);
+  text = xmalloc(text_len);
 
   if (verbose)
     printf("TEXT -> vma=0x%x len=0x%x\n", text_vma, text_len);
@@ -1983,15 +1793,12 @@ int main(int argc, char *argv[])
 				   text + (s->vma - text_vma), 0,
 				   bfd_section_size(abs_bfd, s)))
       {
-	fprintf(stderr, "read error section %s\n", s->name);
-	exit(2);
+	fatal("read error section %s", s->name);
       }
 
-  if (data_len == 0) {
-    fprintf (stderr, "%s: no .data section", abs_file);
-    exit (2);
-  }
-  data = malloc(data_len);
+  if (data_len == 0)
+    fatal("%s: no .data section", abs_file);
+  data = xmalloc(data_len);
 
   if (verbose)
     printf("DATA -> vma=0x%x len=0x%x\n", data_vma, data_len);
@@ -2014,10 +1821,12 @@ int main(int argc, char *argv[])
 				   data + (s->vma - data_vma), 0,
 				   bfd_section_size(abs_bfd, s)))
       {
-	fprintf(stderr, "read error section %s\n", s->name);
-	exit(2);
+	fatal("read error section %s", s->name);
       }
 
+  if (bss_vma == ~0)
+    bss_vma = data_vma + data_len;
+
   /* Put common symbols in bss.  */
   bss_len += add_com_to_bss(symbol_table, number_of_symbols, bss_len);
 
@@ -2036,11 +1845,11 @@ int main(int argc, char *argv[])
     data_len = bss_vma - data_vma;
   }
 
-  reloc = output_relocs(abs_bfd, symbol_table, number_of_symbols, &reloc_len,
-			text, text_len, text_vma, data, data_len, data_vma,
-			rel_bfd);
+  reloc = (uint32_t *)
+    output_relocs(abs_bfd, symbol_table, number_of_symbols, &reloc_len,
+		  text, text_len, text_vma, data, data_len, data_vma, rel_bfd);
 
-  if (reloc == NULL)
+  if (reloc == NULL && verbose)
     printf("No relocations in code!\n");
 
   text_offs = real_address_bits(text_vma);
@@ -2056,12 +1865,12 @@ int main(int argc, char *argv[])
   hdr.reloc_start = htonl(sizeof(hdr) + text_offs + text_len +data_len);
   hdr.reloc_count = htonl(reloc_len);
   hdr.flags       = htonl(0
-	  | (load_to_ram ? FLAT_FLAG_RAM : 0)
+	  | (load_to_ram || text_has_relocs ? FLAT_FLAG_RAM : 0)
 	  | (ktrace ? FLAT_FLAG_KTRACE : 0)
 	  | (pic_with_got ? FLAT_FLAG_GOTPIC : 0)
-	  | (compress ? (compress == 2 ? FLAT_FLAG_GZDATA : FLAT_FLAG_GZIP) : 0)
+	  | (docompress ? (docompress == 2 ? FLAT_FLAG_GZDATA : FLAT_FLAG_GZIP) : 0)
 	  );
-  hdr.build_date = htonl((unsigned long)time(NULL));
+  hdr.build_date = htonl((uint32_t)time(NULL));
   memset(hdr.filler, 0x00, sizeof(hdr.filler));
 
   for (i=0; i<reloc_len; i++) reloc[i] = htonl(reloc[i]);
@@ -2075,67 +1884,41 @@ int main(int argc, char *argv[])
   }
   
   if (!ofile) {
-    ofile = malloc(strlen(fname) + 5 + 1); /* 5 to add suffix */
+    ofile = xmalloc(strlen(fname) + 5 + 1); /* 5 to add suffix */
     strcpy(ofile, fname);
     strcat(ofile, ".bflt");
   }
 
-  if ((fd = open (ofile, O_WRONLY|O_BINARY|O_CREAT|O_TRUNC, 0744)) < 0) {
-    fprintf (stderr, "Can't open output file %s\n", ofile);
-    exit(4);
-  }
+  if ((fd = open (ofile, O_WRONLY|O_BINARY|O_CREAT|O_TRUNC, 0744)) < 0)
+    fatal_perror("Can't open output file %s", ofile);
 
   write(fd, &hdr, sizeof(hdr));
   close(fd);
 
-  /*
-   * get the compression command ready
-   */
-  sprintf(cmd, "gzip -f -9 >> %s", ofile);
-
-#define	START_COMPRESSOR do { \
-		if (gf) \
-			if (gf_is_pipe) \
-				pclose(gf); \
-			else \
-				fclose(gf); \
-		if (!(gf = popen(cmd, "w" BINARY_FILE_OPTS))) { \
-			fprintf(stderr, "Can't run cmd %s\n", cmd); \
-			exit(4); \
-		} \
-		gf_is_pipe = 1; \
-	} while (0)
-
-  gf = fopen(ofile, "ab");	/* Add 'b' to support non-posix (ie windows) */
-  if (!gf) {
-  	fprintf(stderr, "Can't open file %s for writing\n", ofile); \
-	exit(4);
-  }
+  if (fopen_stream_u(&gf, ofile, "a" BINARY_FILE_OPTS))
+    fatal_perror("Can't open file %s for writing", ofile);
 
-  if (compress == 1)
-  	START_COMPRESSOR;
+  if (docompress == 1)
+    reopen_stream_compressed(&gf);
 
   /* Fill in any hole at the beginning of the text segment.  */
   if (verbose)
-	  printf("ZERO before text len=0x%x\n", text_offs);
-  write_zeroes(text_offs, gf);
+    printf("ZERO before text len=0x%x\n", text_offs);
+  write_zeroes(text_offs, &gf);
 
   /* Write the text segment.  */
-  fwrite(text, text_len, 1, gf);
+  fwrite_stream(text, text_len, 1, &gf);
 
-  if (compress == 2)
-  	START_COMPRESSOR;
+  if (docompress == 2)
+    reopen_stream_compressed(&gf);
 
   /* Write the data segment.  */
-  fwrite(data, data_len, 1, gf);
+  fwrite_stream(data, data_len, 1, &gf);
 
   if (reloc)
-    fwrite(reloc, reloc_len * 4, 1, gf);
+    fwrite_stream(reloc, reloc_len * 4, 1, &gf);
 
-  if(gf_is_pipe)
-    pclose(gf);
-  else
-  fclose(gf);
+  fclose_stream(&gf);
 
   exit(0);
 }
diff --git a/package/elf2flt/src/elf2flt.ld b/package/elf2flt/src/elf2flt.ld
deleted file mode 100644
index cd4e652..0000000
--- a/package/elf2flt/src/elf2flt.ld
+++ /dev/null
@@ -1,179 +0,0 @@
-
-ENTRY (_start)
-
-MEMORY {
-	flatmem : ORIGIN = 0x0, LENGTH = 0xfffffff
-}
-
-SECTIONS {
-
-	.text 0x0 : {
-		. = . + 4;
-		. = ALIGN(0x4) ;
-		_stext = . ;
-		*(.text)
-		*(.text.*)
-		*(.gnu.warning)
-		*(.stub)
-		*(.gnu.linkonce.t*)
-		*(.glue_7t)
-		*(.glue_7)
-		*(.jcr)
-		*(.init)
-		*(.fini)
-
-W_RODAT		*(.rodata)
-W_RODAT		*(.rodata1)
-W_RODAT		*(.rodata.*)
-W_RODAT		*(.gnu.linkonce.r*)
-
-		/* This is special code area at the end of the normal
-		   text section.  It contains a small lookup table at
-		   the start followed by the code pointed to by entries
-		   in the lookup table.  */
-		. = ALIGN (4) ;
-		PROVIDE(__ctbp = .);
-		*(.call_table_data)
-		*(.call_table_text)
-
-		. = ALIGN(0x20) ;
-		_etext = . ;
-	} > flatmem
-
-	.data : {
-		. = ALIGN(0x4) ;
-		_sdata = . ;
-		__data_start = . ;
-		data_start = . ;
-		*(.got.plt)
-		*(.got)
-		FILL(0) ;
-		. = ALIGN(0x20) ; 
-		LONG(-1)
-		. = ALIGN(0x20) ; 
-R_RODAT		*(.rodata)
-R_RODAT		*(.rodata1)
-R_RODAT		*(.rodata.*)
-R_RODAT		*(.gnu.linkonce.r*)
-		*(.data)
-		*(.data1)
-		*(.data.*)
-		*(.gnu.linkonce.d*)
-		*(.data1)
-		*(.eh_frame)
-		*(.gcc_except_table)
-
-		/* Microblaze has .sdata and .sbss (small bss).  They must
-		   be contiguous, so please don't move any of this. JW */
-		_ssrw = . ;			
-		*(.sdata) 
-		*(.sdata.*)
-		*(.sbss)			/* Don't move this! */
-		_essrw = . ;
-
-		_ssrw_size = _essrw - _ssrw;
-		PROVIDE(_SDA_BASE_ = _ssrw + (_ssrw_size / 2));
-
-		*(.gnu.linkonce.s.*)
-		*(__libc_atexit)
-		*(__libc_subinit)
-		*(__libc_subfreeres)
-		*(.note.ABI-tag)
-
-		/* microblaze-specific read-only small data area
-		   and associated locating symbols */
-		_ssro = . ;
-		*(.sdata2)
-		_essro = . ;
-		_ssro_size = _essro - _ssro;
-		PROVIDE(_SDA2_BASE_ = _ssro + (_ssro_size / 2));
-
-		. = ALIGN(4) ;
-		__CTOR_LIST__ = .;
-		LONG((__CTOR_END__ - __CTOR_LIST__) / 4 - 2)
-SINGLE_LINK:	/* gcc uses crtbegin.o to find the start of
-SINGLE_LINK:	   the constructors, so we make sure it is
-SINGLE_LINK:	   first.  Because this is a wildcard, it
-SINGLE_LINK:	   doesn't matter if the user does not
-SINGLE_LINK:	   actually link against crtbegin.o; the
-SINGLE_LINK:	   linker won't look for a file to match a
-SINGLE_LINK:	   wildcard.  The wildcard also means that it
-SINGLE_LINK:	   doesn't matter which directory crtbegin.o
-SINGLE_LINK:	   is in.  */
-SINGLE_LINK:	KEEP (*crtbegin*.o(.ctors))
-SINGLE_LINK:	/* We don't want to include the .ctor section from
-SINGLE_LINK:	   from the crtend.o file until after the sorted ctors.
-SINGLE_LINK:	   The .ctor section from the crtend file contains the
-SINGLE_LINK:	   end of ctors marker and it must be last */
-SINGLE_LINK:	KEEP (*(EXCLUDE_FILE (*crtend*.o ) .ctors))
-SINGLE_LINK:	KEEP (*(SORT(.ctors.*)))
-		KEEP (*(.ctors))
-		LONG(0)
-		__CTOR_END__ = .;
-		__DTOR_LIST__ = .;
-		LONG((__DTOR_END__ - __DTOR_LIST__) / 4 - 2)
-SINGLE_LINK:	KEEP (*crtbegin*.o(.dtors))
-SINGLE_LINK:	KEEP (*(EXCLUDE_FILE (*crtend*.o ) .dtors))
-SINGLE_LINK:	KEEP (*(SORT(.dtors.*)))
-		KEEP (*(.dtors))
-		LONG(0)
-		__DTOR_END__ = .;
-
-		PROVIDE (__preinit_array_start = .);
-		KEEP (*(.preinit_array))
-		PROVIDE (__preinit_array_end = .);
-
-		PROVIDE (__init_array_start = .);
-		KEEP (*(SORT(.init_array.*)))
-		KEEP (*(.init_array))
-		PROVIDE (__init_array_end = .);
-
-		PROVIDE (__fini_array_start = .);
-		KEEP (*(.fini_array))
-		KEEP (*(SORT(.fini_array.*)))
-		PROVIDE (__fini_array_end = .);
-
-		. = ALIGN(0x10) ; 
-		_edata = . ;
-	} > flatmem
-
-	.bss : {
-		. = ALIGN(0x4) ;
-		_sbss = ALIGN(0x4) ;
-		__bss_start = . ;
-		*(.dynsbss)
-		*(.sbss)
-		*(.sbss.*)
-		*(.scommon)
-		*(.dynbss)
-		*(.bss)
-		*(.bss.*)
-		*(.bss*)
-		*(.gnu.linkonce.b*)
-		*(COMMON)
-		. = ALIGN(0x10) ;
-		_ebss = . ;
-		_end = . ;
-		end = . ;
-	} > flatmem
-
-	.stack : {
-		. = ALIGN(0x4);
-		__stack_start = .;
-	}
-
-	.junk 0 : { *(.rel*) *(.rela*) }
-	/* Stabs debugging sections.    */
-	.stab 0 : { *(.stab) }
-	.stabstr 0 : { *(.stabstr) }
-	.stab.excl 0 : { *(.stab.excl) }
-	.stab.exclstr 0 : { *(.stab.exclstr) }
-	.stab.index 0 : { *(.stab.index) }
-	.stab.indexstr 0 : { *(.stab.indexstr) }
-	.comment 0 : { *(.comment) }
-	.debug_abbrev 0 : { *(.debug_abbrev) }
-	.debug_info 0 : { *(.debug_info) }
-	.debug_line 0 : { *(.debug_line) }
-	.debug_pubnames 0 : { *(.debug_pubnames) }
-	.debug_aranges 0 : { *(.debug_aranges) }
-}
diff --git a/package/elf2flt/src/elf2flt.ld.in b/package/elf2flt/src/elf2flt.ld.in
new file mode 100644
index 0000000..5353413
--- /dev/null
+++ b/package/elf2flt/src/elf2flt.ld.in
@@ -0,0 +1,210 @@
+
+ENTRY (@SYMBOL_PREFIX at _start)
+
+MEMORY {
+	flatmem : ORIGIN = 0x0, LENGTH = 0xfffffff
+}
+
+PHDRS {
+	text PT_LOAD ;
+	data PT_LOAD ;
+}
+
+SECTIONS {
+
+	.text 0x0 : {
+		. = . + 4;
+		. = ALIGN(0x4) ;
+		@SYMBOL_PREFIX at _stext = . ;
+		*(.text)
+		*(.text.*)
+		*(.gnu.warning)
+		*(.stub)
+		*(.gnu.linkonce.t*)
+		*(.glue_7t)
+		*(.glue_7)
+		*(.jcr)
+		KEEP (*(.init))
+		KEEP (*(.fini))
+
+W_RODAT		*(.rodata)
+W_RODAT		*(.rodata1)
+W_RODAT		*(.rodata.*)
+W_RODAT		*(.gnu.linkonce.r*)
+
+		/* This is special code area at the end of the normal
+		   text section.  It contains a small lookup table at
+		   the start followed by the code pointed to by entries
+		   in the lookup table.  */
+		. = ALIGN (4) ;
+		PROVIDE(@SYMBOL_PREFIX at __ctbp = .);
+		*(.call_table_data)
+		*(.call_table_text)
+
+		. = ALIGN(0x20) ;
+		@SYMBOL_PREFIX at _etext = . ;
+	} > flatmem :text
+
+	.data : {
+		. = ALIGN(0x4) ;
+		@SYMBOL_PREFIX at _sdata = . ;
+		@SYMBOL_PREFIX at __data_start = . ;
+		@SYMBOL_PREFIX at data_start = . ;
+		*(.got.plt)
+		*(.got)
+		FILL(0) ;
+		. = ALIGN(0x20) ;
+		LONG(-1)
+		. = ALIGN(0x20) ;
+R_RODAT		*(.rodata)
+R_RODAT		*(.rodata1)
+R_RODAT		*(.rodata.*)
+R_RODAT		*(.gnu.linkonce.r*)
+		*(.data)
+		*(.data1)
+		*(.data.*)
+		*(.gnu.linkonce.d*)
+
+		/* Microblaze has .sdata and .sbss (small bss).  They must
+		   be contiguous, so please don't move any of this. JW */
+		@SYMBOL_PREFIX at _ssrw = . ;
+		*(.sdata)
+		*(.sdata.*)
+		*(.sbss)			/* Don't move this! */
+		*(.gnu.linkonce.sb*)
+		@SYMBOL_PREFIX at _essrw = . ;
+
+		@SYMBOL_PREFIX at _ssrw_size = @SYMBOL_PREFIX at _essrw - @SYMBOL_PREFIX at _ssrw;
+		PROVIDE(@SYMBOL_PREFIX at _SDA_BASE_ = @SYMBOL_PREFIX at _ssrw + (@SYMBOL_PREFIX at _ssrw_size / 2));
+
+		*(.gnu.linkonce.s.*)
+		*(__libc_atexit)
+		*(__libc_subinit)
+		*(__libc_subfreeres)
+
+		/* microblaze-specific read-only small data area
+		   and associated locating symbols */
+		@SYMBOL_PREFIX at _ssro = . ;
+		*(.sdata2)
+		@SYMBOL_PREFIX at _essro = . ;
+		@SYMBOL_PREFIX at _ssro_size = @SYMBOL_PREFIX at _essro - @SYMBOL_PREFIX at _ssro;
+		PROVIDE(@SYMBOL_PREFIX at _SDA2_BASE_ = @SYMBOL_PREFIX at _ssro + (@SYMBOL_PREFIX at _ssro_size / 2));
+
+		. = ALIGN(4) ;
+TOR:		@SYMBOL_PREFIX at __CTOR_LIST__ = .;
+TOR:		LONG((@SYMBOL_PREFIX at __CTOR_END__ - @SYMBOL_PREFIX at __CTOR_LIST__) / 4 - 2)
+SINGLE_LINK:	/* gcc uses crtbegin.o to find the start of
+SINGLE_LINK:	   the constructors, so we make sure it is
+SINGLE_LINK:	   first.  Because this is a wildcard, it
+SINGLE_LINK:	   doesn't matter if the user does not
+SINGLE_LINK:	   actually link against crtbegin.o; the
+SINGLE_LINK:	   linker won't look for a file to match a
+SINGLE_LINK:	   wildcard.  The wildcard also means that it
+SINGLE_LINK:	   doesn't matter which directory crtbegin.o
+SINGLE_LINK:	   is in.  */
+SINGLE_LINK:	KEEP (*crtbegin*.o(.ctors))
+SINGLE_LINK:	/* We don't want to include the .ctor section from
+SINGLE_LINK:	   from the crtend.o file until after the sorted ctors.
+SINGLE_LINK:	   The .ctor section from the crtend file contains the
+SINGLE_LINK:	   end of ctors marker and it must be last */
+SINGLE_LINK:	KEEP (*(EXCLUDE_FILE (*crtend*.o ) .ctors))
+SINGLE_LINK:	KEEP (*(SORT(.ctors.*)))
+		KEEP (*(.ctors))
+TOR:		LONG(0)
+TOR:		@SYMBOL_PREFIX at __CTOR_END__ = .;
+TOR:		@SYMBOL_PREFIX at __DTOR_LIST__ = .;
+TOR:		LONG((@SYMBOL_PREFIX at __DTOR_END__ - @SYMBOL_PREFIX at __DTOR_LIST__) / 4 - 2)
+SINGLE_LINK:	KEEP (*crtbegin*.o(.dtors))
+SINGLE_LINK:	KEEP (*(EXCLUDE_FILE (*crtend*.o ) .dtors))
+SINGLE_LINK:	KEEP (*(SORT(.dtors.*)))
+		KEEP (*(.dtors))
+TOR:		LONG(0)
+TOR:		@SYMBOL_PREFIX at __DTOR_END__ = .;
+
+		PROVIDE (@SYMBOL_PREFIX at __preinit_array_start = .);
+		KEEP (*(.preinit_array))
+		PROVIDE (@SYMBOL_PREFIX at __preinit_array_end = .);
+
+		PROVIDE (@SYMBOL_PREFIX at __init_array_start = .);
+		KEEP (*(SORT(.init_array.*)))
+		KEEP (*(.init_array))
+		PROVIDE (@SYMBOL_PREFIX at __init_array_end = .);
+
+		PROVIDE (@SYMBOL_PREFIX at __fini_array_start = .);
+		KEEP (*(.fini_array))
+		KEEP (*(SORT(.fini_array.*)))
+		PROVIDE (@SYMBOL_PREFIX at __fini_array_end = .);
+	} > flatmem :data
+
+	.note.ABI-tag : { *(.note.ABI-tag) } > flatmem
+	.eh_frame_hdr : { *(.eh_frame_hdr) } > flatmem
+	.eh_frame : { KEEP(*(.eh_frame)) } > flatmem
+	.gcc_except_table : {
+		KEEP(*(.gcc_except_table))
+		KEEP(*(.gcc_except_table.*))
+	} >flatmem
+
+	. = ALIGN(0x10) ;
+	@SYMBOL_PREFIX at _edata = . ;
+
+	.bss : {
+		. = ALIGN(0x4) ;
+		@SYMBOL_PREFIX at _sbss = ALIGN(0x4) ;
+		@SYMBOL_PREFIX at __bss_start = . ;
+		*(.dynsbss)
+		*(.sbss)
+		*(.sbss.*)
+		*(.scommon)
+		*(.dynbss)
+		*(.bss)
+		*(.bss.*)
+		*(.bss*)
+		*(.gnu.linkonce.b*)
+		*(COMMON)
+		. = ALIGN(0x10) ;
+		@SYMBOL_PREFIX at _ebss = . ;
+		@SYMBOL_PREFIX at _end = . ;
+		@SYMBOL_PREFIX at end = . ;
+	} > flatmem
+
+	.stack : {
+		. = ALIGN(0x4);
+		@SYMBOL_PREFIX at _stack_start = .;
+	} > flatmem
+
+	.junk 0 : { *(.rel*) *(.rela*) }
+	/DISCARD/ : { *(.note.GNU-stack) }
+	/* Stabs debugging sections.    */
+	.stab 0 : { *(.stab) }
+	.stabstr 0 : { *(.stabstr) }
+	.stab.excl 0 : { *(.stab.excl) }
+	.stab.exclstr 0 : { *(.stab.exclstr) }
+	.stab.index 0 : { *(.stab.index) }
+	.stab.indexstr 0 : { *(.stab.indexstr) }
+	.comment 0 : { *(.comment) }
+	/* DWARF debug sections.
+	   Symbols in the DWARF debugging sections are relative to the beginning
+	   of the section so we begin them at 0.  */
+	/* DWARF 1 */
+	.debug          0 : { *(.debug) }
+	.line           0 : { *(.line) }
+	/* GNU DWARF 1 extensions */
+	.debug_srcinfo  0 : { *(.debug_srcinfo) }
+	.debug_sfnames  0 : { *(.debug_sfnames) }
+	/* DWARF 1.1 and DWARF 2 */
+	.debug_aranges  0 : { *(.debug_aranges) }
+	.debug_pubnames 0 : { *(.debug_pubnames) }
+	/* DWARF 2 */
+	.debug_info     0 : { *(.debug_info .gnu.linkonce.wi.*) }
+	.debug_abbrev   0 : { *(.debug_abbrev) }
+	.debug_line     0 : { *(.debug_line) }
+	.debug_frame    0 : { *(.debug_frame) }
+	.debug_str      0 : { *(.debug_str) }
+	.debug_loc      0 : { *(.debug_loc) }
+	.debug_macinfo  0 : { *(.debug_macinfo) }
+	/* SGI/MIPS DWARF 2 extensions */
+	.debug_weaknames 0 : { *(.debug_weaknames) }
+	.debug_funcnames 0 : { *(.debug_funcnames) }
+	.debug_typenames 0 : { *(.debug_typenames) }
+	.debug_varnames  0 : { *(.debug_varnames) }
+}
diff --git a/package/elf2flt/src/flat.h b/package/elf2flt/src/flat.h
index 3cc502d..2fef529 100644
--- a/package/elf2flt/src/flat.h
+++ b/package/elf2flt/src/flat.h
@@ -17,6 +17,7 @@
 #include <linux/types.h>
 #include <asm/flat.h>
 #endif
+#include <stdint.h>
 
 #define	FLAT_VERSION			0x00000004L
 
@@ -59,6 +60,7 @@ struct flat_hdr {
 #define FLAT_FLAG_GZIP   0x0004 /* all but the header is compressed */
 #define FLAT_FLAG_GZDATA 0x0008 /* only data/relocs are compressed (for XIP) */
 #define FLAT_FLAG_KTRACE 0x0010 /* output useful kernel trace for debugging */
+#define FLAT_FLAG_L1STK  0x0020 /* use a 4k stack in L1 scratch memory.  */
 
 #ifdef __KERNEL__ /* so systems without linux headers can compile the apps */
 /*
diff --git a/package/elf2flt/src/flthdr.c b/package/elf2flt/src/flthdr.c
index 967d640..dfc9107 100644
--- a/package/elf2flt/src/flthdr.c
+++ b/package/elf2flt/src/flthdr.c
@@ -15,15 +15,14 @@
 #include <time.h>
 #include <stdlib.h>   /* exit() */
 #include <string.h>   /* strcat(), strcpy() */
+#include <inttypes.h>
+#include <assert.h>
 
-/* macros for conversion between host and (internet) network byte order */
-#ifndef WIN32
-#include <netinet/in.h> /* Consts and structs defined by the internet system */
-#define	BINARY_FILE_OPTS
-#else
-#include <winsock2.h>
-#define	BINARY_FILE_OPTS "b"
-#endif
+#include "compress.h"
+#include <libiberty.h>
+
+#include "stubs.h"
+const char *elf2flt_progname;
 
 /* from uClinux-x.x.x/include/linux */
 #include "flat.h"     /* Binary flat header description                      */
@@ -35,68 +34,44 @@
 
 #endif
 
-/****************************************************************************/
-
-char *program_name;
-
-static char cmd[1024];
-static int print = 0, compress = 0, ramload = 0, stacksize = 0, ktrace = 0;
-static int short_format = 0;
+#if defined TARGET_bfin
+# define flat_get_relocate_addr(addr) (addr & 0x03ffffff)
+#else
+# define flat_get_relocate_addr(addr) (addr)
+#endif
 
 /****************************************************************************/
 
-void
-transferr(FILE *ifp, FILE *ofp, int count)
-{
-	int n, num;
+static int print = 0, print_relocs = 0, docompress = 0, ramload = 0,
+           stacksize = 0, ktrace = 0, l1stack = 0;
 
-	while (count == -1 || count > 0) {
-		if (count == -1 || count > sizeof(cmd))
-			num = sizeof(cmd);
-		else
-			num = count;
-		n = fread(cmd, 1, num, ifp);
-		if (n == 0)
-			break;
-		if (fwrite(cmd, n, 1, ofp) != 1) {
-			fprintf(stderr, "Write failed :-(\n");
-			exit(1);
-		}
-		if (count != -1)
-			count -= n;
-	}
-	if (count > 0) {
-		fprintf(stderr, "Failed to transferr %d bytes\n", count);
-		exit(1);
-	}
-}
-	
 /****************************************************************************/
 
 void
 process_file(char *ifile, char *ofile)
 {
 	int old_flags, old_stack, new_flags, new_stack;
-	FILE *ifp, *ofp;
-	int ofp_is_pipe = 0;
+	stream ifp, ofp;
 	struct flat_hdr old_hdr, new_hdr;
-	char tfile[256];
-	char tfile2[256];
+	char *tfile, tmpbuf[256];
+	int input_error, output_error;
 
-	*tfile = *tfile2 = '\0';
+	*tmpbuf = '\0';
 
-	if ((ifp = fopen(ifile, "r" BINARY_FILE_OPTS)) == NULL) {
+	if (fopen_stream_u(&ifp, ifile, "r" BINARY_FILE_OPTS)) {
 		fprintf(stderr, "Cannot open %s\n", ifile);
 		return;
 	}
 
-	if (fread(&old_hdr, sizeof(old_hdr), 1, ifp) != 1) {
+	if (fread_stream(&old_hdr, sizeof(old_hdr), 1, &ifp) != 1) {
 		fprintf(stderr, "Cannot read header of %s\n", ifile);
+		fclose_stream(&ifp);
 		return;
 	}
 
 	if (strncmp(old_hdr.magic, "bFLT", 4) != 0) {
 		fprintf(stderr, "Cannot read header of %s\n", ifile);
+		fclose_stream(&ifp);
 		return;
 	}
 
@@ -104,13 +79,13 @@ process_file(char *ifile, char *ofile)
 	new_stack = old_stack = ntohl(old_hdr.stack_size);
 	new_hdr = old_hdr;
 
-	if (compress == 1) {
+	if (docompress == 1) {
 		new_flags |= FLAT_FLAG_GZIP;
 		new_flags &= ~FLAT_FLAG_GZDATA;
-	} else if (compress == 2) {
+	} else if (docompress == 2) {
 		new_flags |= FLAT_FLAG_GZDATA;
 		new_flags &= ~FLAT_FLAG_GZIP;
-	} else if (compress < 0)
+	} else if (docompress < 0)
 		new_flags &= ~(FLAT_FLAG_GZIP|FLAT_FLAG_GZDATA);
 	
 	if (ramload > 0)
@@ -123,11 +98,17 @@ process_file(char *ifile, char *ofile)
 	else if (ktrace < 0)
 		new_flags &= ~FLAT_FLAG_KTRACE;
 	
+	if (l1stack > 0)
+		new_flags |= FLAT_FLAG_L1STK;
+	else if (l1stack < 0)
+		new_flags &= ~FLAT_FLAG_L1STK;
+
 	if (stacksize)
 		new_stack = stacksize;
 
 	if (print == 1) {
 		time_t t;
+		uint32_t reloc_count, reloc_start;
 
 		printf("%s\n", ifile);
 		printf("    Magic:        %4.4s\n", old_hdr.magic);
@@ -139,8 +120,10 @@ process_file(char *ifile, char *ofile)
 		printf("    Data End:     0x%x\n",  ntohl(old_hdr.data_end));
 		printf("    BSS End:      0x%x\n",  ntohl(old_hdr.bss_end));
 		printf("    Stack Size:   0x%x\n",  ntohl(old_hdr.stack_size));
-		printf("    Reloc Start:  0x%x\n",  ntohl(old_hdr.reloc_start));
-		printf("    Reloc Count:  0x%x\n",  ntohl(old_hdr.reloc_count));
+		reloc_start = ntohl(old_hdr.reloc_start);
+		printf("    Reloc Start:  0x%x\n",  reloc_start);
+		reloc_count = ntohl(old_hdr.reloc_count);
+		printf("    Reloc Count:  0x%x\n",  reloc_count);
 		printf("    Flags:        0x%x ( ",  ntohl(old_hdr.flags));
 		if (old_flags) {
 			if (old_flags & FLAT_FLAG_RAM)
@@ -153,8 +136,45 @@ process_file(char *ifile, char *ofile)
 				printf("Gzip-Data-Compressed ");
 			if (old_flags & FLAT_FLAG_KTRACE)
 				printf("Kernel-Traced-Load ");
+			if (old_flags & FLAT_FLAG_L1STK)
+				printf("L1-Scratch-Stack ");
 			printf(")\n");
 		}
+
+		if (print_relocs) {
+			uint32_t *relocs = xcalloc(reloc_count, sizeof(uint32_t));
+			uint32_t i;
+			unsigned long r;
+
+			printf("    Relocs:\n");
+			printf("    #\treloc      (  address )\tdata\n");
+
+			if (old_flags & FLAT_FLAG_GZIP)
+				reopen_stream_compressed(&ifp);
+			if (fseek_stream(&ifp, reloc_start, SEEK_SET)) {
+				fprintf(stderr, "Cannot seek to relocs of %s\n", ifile);
+				fclose_stream(&ifp);
+				return;
+			}
+			if (fread_stream(relocs, sizeof(uint32_t), reloc_count, &ifp) == -1) {
+				fprintf(stderr, "Cannot read relocs of %s\n", ifile);
+				fclose_stream(&ifp);
+				return;
+			}
+
+			for (i = 0; i < reloc_count; ++i) {
+				uint32_t raddr, addr;
+				r = ntohl(relocs[i]);
+				raddr = flat_get_relocate_addr(r);
+				printf("    %u\t0x%08lx (0x%08"PRIx32")\t", i, r, raddr);
+				fseek_stream(&ifp, sizeof(old_hdr) + raddr, SEEK_SET);
+				fread_stream(&addr, sizeof(addr), 1, &ifp);
+				printf("%"PRIx32"\n", addr);
+			}
+
+			/* reset file position for below */
+			fseek_stream(&ifp, sizeof(old_hdr), SEEK_SET);
+		}
 	} else if (print > 1) {
 		static int first = 1;
 		unsigned int text, data, bss, stk, rel, tot;
@@ -164,13 +184,13 @@ process_file(char *ifile, char *ofile)
 			printf("-----------------------------------------------------------\n");
 			first = 0;
 		}
-		*tfile = '\0';
-		strcat(tfile, (old_flags & FLAT_FLAG_KTRACE) ? "k" : "");
-		strcat(tfile, (old_flags & FLAT_FLAG_RAM) ? "r" : "");
-		strcat(tfile, (old_flags & FLAT_FLAG_GOTPIC) ? "p" : "");
-		strcat(tfile, (old_flags & FLAT_FLAG_GZIP) ? "z" :
+		*tmpbuf = '\0';
+		strcat(tmpbuf, (old_flags & FLAT_FLAG_KTRACE) ? "k" : "");
+		strcat(tmpbuf, (old_flags & FLAT_FLAG_RAM) ? "r" : "");
+		strcat(tmpbuf, (old_flags & FLAT_FLAG_GOTPIC) ? "p" : "");
+		strcat(tmpbuf, (old_flags & FLAT_FLAG_GZIP) ? "z" :
 					((old_flags & FLAT_FLAG_GZDATA) ? "d" : ""));
-		printf("-%-3.3s ", tfile);
+		printf("-%-3.3s ", tmpbuf);
 		printf("%3d ", ntohl(old_hdr.rev));
 		printf("%6d ", text=ntohl(old_hdr.data_start)-sizeof(struct flat_hdr));
 		printf("%6d ", data=ntohl(old_hdr.data_end)-ntohl(old_hdr.data_start));
@@ -200,112 +220,79 @@ process_file(char *ifile, char *ofile)
 	}
 
 	/* if there is nothing else to do, leave */
-	if (new_flags == old_flags && new_stack == old_stack)
+	if (new_flags == old_flags && new_stack == old_stack) {
+		fclose_stream(&ifp);
 		return;
-	
+	}
+
 	new_hdr.flags = htonl(new_flags);
 	new_hdr.stack_size = htonl(new_stack);
 
-	strcpy(tfile, "/tmp/flatXXXXXX");
-	mkstemp(tfile);
-	if ((ofp = fopen(tfile, "w" BINARY_FILE_OPTS)) == NULL) {
-		fprintf(stderr, "Failed to open %s for writing\n", tfile);
+	tfile = make_temp_file("flthdr");
+
+	if (fopen_stream_u(&ofp, tfile, "w" BINARY_FILE_OPTS)) {
 		unlink(tfile);
-		unlink(tfile2);
-		exit(1);
+		fatal("Failed to open %s for writing\n", tfile);
 	}
 
-	if (fwrite(&new_hdr, sizeof(new_hdr), 1, ofp) != 1) {
-		fprintf(stderr, "Failed to write to  %s\n", tfile);
+	/* Copy header (always uncompressed).  */
+	if (fwrite_stream(&new_hdr, sizeof(new_hdr), 1, &ofp) != 1) {
 		unlink(tfile);
-		unlink(tfile2);
-		exit(1);
+		fatal("Failed to write to  %s\n", tfile);
 	}
 
-	/*
-	 * get ourselves a fully uncompressed copy of the text/data/relocs
-	 * so that we can manipulate it more easily
-	 */
-	if (old_flags & (FLAT_FLAG_GZIP|FLAT_FLAG_GZDATA)) {
-		FILE *tfp;
-
-		strcpy(tfile2, "/tmp/flat2XXXXXX");
-		mkstemp(tfile2);
-		
-		if (old_flags & FLAT_FLAG_GZDATA) {
-			tfp = fopen(tfile2, "w" BINARY_FILE_OPTS);
-			if (!tfp) {
-				fprintf(stderr, "Failed to open %s for writing\n", tfile2);
-				exit(1);
-			}
-			transferr(ifp, tfp, ntohl(old_hdr.data_start) -
-					sizeof(struct flat_hdr));
-			fclose(tfp);
-		}
-
-		sprintf(cmd, "gunzip >> %s", tfile2);
-		tfp = popen(cmd, "w" BINARY_FILE_OPTS);
-		if(!tfp) {
-			perror("popen");
-			exit(1);
-		}
-		transferr(ifp, tfp, -1);
-		pclose(tfp);
-
-		fclose(ifp);
-		ifp = fopen(tfile2, "r" BINARY_FILE_OPTS);
-		if (!ifp) {
-			fprintf(stderr, "Failed to open %s for reading\n", tfile2);
-			unlink(tfile);
-			unlink(tfile2);
-			exit(1);
-		}
-	}
+	/* Whole input file (including text) is compressed: start decompressing
+	   now.  */
+	if (old_flags & FLAT_FLAG_GZIP)
+		reopen_stream_compressed(&ifp);
 
+	/* Likewise, output file is compressed. Start compressing now.  */
 	if (new_flags & FLAT_FLAG_GZIP) {
 		printf("zflat %s --> %s\n", ifile, ofile);
-		fclose(ofp);
-		sprintf(cmd, "gzip -9 -f >> %s", tfile);
-		ofp = popen(cmd, "w" BINARY_FILE_OPTS);
-		ofp_is_pipe = 1;
-	} else if (new_flags & FLAT_FLAG_GZDATA) {
-		printf("zflat-data %s --> %s\n", ifile, ofile);
-		transferr(ifp, ofp, ntohl(new_hdr.data_start) -
-				sizeof(struct flat_hdr));
-		fclose(ofp);
-		sprintf(cmd, "gzip -9 -f >> %s", tfile);
-		ofp = popen(cmd, "w" BINARY_FILE_OPTS);
-		ofp_is_pipe = 1;
+		reopen_stream_compressed(&ofp);
 	}
 
-	if (!ofp) { /* can only happen if using gzip/gunzip */
-		fprintf(stderr, "Can't run cmd %s\n", cmd);
-		unlink(tfile);
-		unlink(tfile2);
-		exit(1);
+	transfer(&ifp, &ofp,
+		  ntohl(old_hdr.data_start) - sizeof(struct flat_hdr));
+
+	/* Only data and relocs were compressed in input.  Start decompressing
+	   from here.  */
+	if (old_flags & FLAT_FLAG_GZDATA)
+		reopen_stream_compressed(&ifp);
+
+	/* Only data/relocs to be compressed in output.  Start compressing
+	   from here.  */
+	if (new_flags & FLAT_FLAG_GZDATA) {
+		printf("zflat-data %s --> %s\n", ifile, ofile);
+		reopen_stream_compressed(&ofp);
 	}
 
-	transferr(ifp, ofp, -1);
-	
-	if (ferror(ifp) || ferror(ofp)) {
-		fprintf(stderr, "Error on file pointer%s%s\n",
-				ferror(ifp) ? " input" : "", ferror(ofp) ? " output" : "");
+	transfer(&ifp, &ofp, -1);
+
+	input_error = ferror_stream(&ifp);
+	output_error = ferror_stream(&ofp);
+
+	if (input_error || output_error) {
 		unlink(tfile);
-		unlink(tfile2);
-		exit(1);
+		fatal("Error on file pointer%s%s\n",
+				input_error ? " input" : "",
+				output_error ? " output" : "");
 	}
 
-	fclose(ifp);
-	if (ofp_is_pipe)
-		pclose(ofp);
-	else
-		fclose(ofp);
+	fclose_stream(&ifp);
+	fclose_stream(&ofp);
+
+	/* Copy temporary file to output location.  */
+	fopen_stream_u(&ifp, tfile, "r" BINARY_FILE_OPTS);
+	fopen_stream_u(&ofp, ofile, "w" BINARY_FILE_OPTS);
+
+	transfer(&ifp, &ofp, -1);
+
+	fclose_stream(&ifp);
+	fclose_stream(&ofp);
 
-	/* cheat a little here to preserve file permissions */
-	sprintf(cmd, "cp %s %s", tfile, ofile);
-	system(cmd);
 	unlink(tfile);
-	unlink(tfile2);
+	free(tfile);
 }
 
 /****************************************************************************/
@@ -315,9 +302,10 @@ usage(char *s)
 {
 	if (s)
 		fprintf(stderr, "%s\n", s);
-	fprintf(stderr, "usage: %s [options] flat-file\n", program_name);
+	fprintf(stderr, "usage: %s [options] flat-file\n", elf2flt_progname);
 	fprintf(stderr, "       Allows you to change an existing flat file\n\n");
 	fprintf(stderr, "       -p      : print current settings\n");
+	fprintf(stderr, "       -P      : print relocations\n");
 	fprintf(stderr, "       -z      : compressed flat file\n");
 	fprintf(stderr, "       -d      : compressed data-only flat file\n");
 	fprintf(stderr, "       -Z      : un-compressed flat file\n");
@@ -325,6 +313,8 @@ usage(char *s)
 	fprintf(stderr, "       -R      : do not RAM load\n");
 	fprintf(stderr, "       -k      : kernel traced load (for debug)\n");
 	fprintf(stderr, "       -K      : normal non-kernel traced load\n");
+	fprintf(stderr, "       -u      : place stack in L1 scratchpad memory\n");
+	fprintf(stderr, "       -U      : place stack in normal SDRAM memory\n");
 	fprintf(stderr, "       -s size : stack size\n");
 	fprintf(stderr, "       -o file : output-file\n"
 	                "                 (default is to modify input file)\n");
@@ -336,27 +326,35 @@ usage(char *s)
 int
 main(int argc, char *argv[])
 {
-	int c;
+	int c, noargs;
 	char *ofile = NULL, *ifile;
 
-	program_name = argv[0];
+	elf2flt_progname = argv[0];
 
-	while ((c = getopt(argc, argv, "pdzZrRkKs:o:")) != EOF) {
+	noargs = 1;
+	while ((c = getopt(argc, argv, "pPdzZrRuUkKs:o:")) != EOF) {
 		switch (c) {
 		case 'p': print = 1;                break;
-		case 'z': compress = 1;             break;
-		case 'd': compress = 2;             break;
-		case 'Z': compress = -1;            break;
+		case 'P': print_relocs = 1;         break;
+		case 'z': docompress = 1;           break;
+		case 'd': docompress = 2;           break;
+		case 'Z': docompress = -1;          break;
 		case 'r': ramload = 1;              break;
 		case 'R': ramload = -1;             break;
 		case 'k': ktrace = 1;               break;
 		case 'K': ktrace = -1;              break;
-		case 's': stacksize = atoi(optarg); break;
+		case 'u': l1stack = 1;              break;
+		case 'U': l1stack = -1;             break;
 		case 'o': ofile = optarg;           break;
+		case 's':
+			if (sscanf(optarg, "%i", &stacksize) != 1)
+				usage("invalid stack size");
+			break;
 		default:
 			usage("invalid option");
 			break;
 		}
+		noargs = 0;
 	}
 
 	if (optind >= argc)
@@ -364,10 +362,10 @@ main(int argc, char *argv[])
 
 	if (ofile && argc - optind > 1)
 		usage("-o can only be used with a single file");
-	
-	if (!print && !compress && !ramload && !stacksize) /* no args == print */
+
+	if (!print && noargs) /* no args == print */
 		print = argc - optind; /* greater than 1 is short format */
-	
+
 	for (c = optind; c < argc; c++) {
 		ifile = argv[c];
 		if (!ofile)
diff --git a/package/elf2flt/src/ld-elf2flt.c b/package/elf2flt/src/ld-elf2flt.c
new file mode 100644
index 0000000..b8b02fd
--- /dev/null
+++ b/package/elf2flt/src/ld-elf2flt.c
@@ -0,0 +1,580 @@
+/*
+ * Wrapper for the real linker and the elf2flt converter.  This was
+ * originally a simple shell script, but that doesn't work on a
+ * Windows host without cygwin.
+ * The proper long term solution is to add FLT as a BFD output format.
+ *
+ * Converted from ld-elf2flt.in by Nathan Sidwell, nathan at codesourcery.com.
+ * Updated to latest elf2flt code by Mike Frysinger, vapier at gentoo.org.
+ *
+ * This is Free Software, under the GNU General Public License V2 or greater.
+ *
+ * Copyright (C) 2006, CodeSourcery Inc.
+ * Copyright (C) 2009, Analog Devices, Inc.
+ * Copyright (C) 2002-2003 David McCullough <davidm@snapgear.com>
+ * Copyright (C) 2000, Lineo. <davidm@lineo.com>
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdarg.h>
+#include <string.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <unistd.h>
+#include <errno.h>
+#include <libiberty.h>
+#include <filenames.h>
+
+#include "stubs.h"
+const char *elf2flt_progname;
+
+static int flag_verbose = 0, flag_final = 1, have_elf2flt_options = 0,
+	flag_move_data = 0, want_shared = 0;
+static const char *shared_lib_id = NULL;
+static const char *output_file = "a.out";
+static const char *linker_script = NULL;
+static const char *emulation = NULL;
+static const char *tmp_file = NULL;
+static const char *output_gdb = NULL;
+static const char *output_elf = NULL;
+static const char *output_flt = NULL;
+static options_t search_dirs, all_options, other_options, flt_options;
+
+static const char *linker = NULL;
+static const char *elf2flt = NULL;
+static const char *nm = NULL;
+static const char *objdump = NULL;
+static const char *objcopy = NULL;
+static const char *ldscriptpath = BINUTILS_LDSCRIPTDIR;
+
+/* A list of sed commands */
+typedef struct {
+	options_t *pattern;      /* '^' for start of line match, everything else verbatim */
+	options_t *replacement;  /* Delete line, if NULL */
+} sed_commands_t;
+
+/* Initialize a sed structure */
+#define init_sed(DST) ( \
+	(DST)->pattern = xmalloc(sizeof(*(DST)->pattern)), \
+	(DST)->replacement = xmalloc(sizeof(*(DST)->replacement)), \
+	init_options((DST)->pattern), \
+	init_options((DST)->replacement) \
+)
+#define free_sed(DST) (free((DST)->pattern), free((DST)->replacement))
+
+/* Append a slot for a new sed command.  */
+static void append_sed(sed_commands_t *dst, const char *pattern,
+		       const char *replacement)
+{
+	debug1("adding pattern '%s' with replacement '%s'\n",
+		pattern, replacement);
+	append_option(dst->pattern, pattern);
+	append_option(dst->replacement, replacement);
+}
+
+/* Execute an external program COMMAND.  Write its stdout to OUTPUT,
+   unless that is NULL.  Pass the trailing NULL terminated list of
+   options, followed by all those in OPTIONS, if that is non-NULL.
+   Order of options is important here as we may run on systems that
+   do not allow options after non-options (i.e. many BSDs).  So the
+   final command line will look like:
+   <command> [options] [... va args ...]
+   This is because [options] will (should?) never contain non-options,
+   while non-options will always be passed via the [va args].
+ */
+static int
+execute(const char *command, const char *output, const options_t *options, ...)
+{
+	struct pex_obj *pex;
+	const char *errmsg;
+	int err;
+	int status;
+	va_list args;
+	const char *opt;
+	options_t opts;
+
+	debug("command=%s\n", command);
+
+	init_options(&opts);
+	append_option(&opts, command);
+	if (options)
+		append_options(&opts, options);
+	va_start(args, options);
+	while ((opt = va_arg(args, const char *)))
+		append_option(&opts, opt);
+	va_end(args);
+	append_option(&opts, NULL);
+
+	fflush(stdout);
+	fflush(stderr);
+
+	pex = pex_init(0, elf2flt_progname, NULL);
+	if (pex == NULL)
+		fatal_perror("pex_init failed");
+
+	if (flag_verbose) {
+		unsigned ix;
+
+		fprintf(stderr, "Invoking:");
+		for (ix = 0; ix != opts.num - 1; ix++)
+			fprintf(stderr, " '%s'", opts.options[ix]);
+		if (output)
+			fprintf(stderr, " > '%s'", output);
+		fprintf(stderr, "\n");
+	}
+
+	errmsg = pex_run(pex, PEX_LAST | PEX_SEARCH, command,
+		(char *const *)opts.options, output, NULL, &err);
+	if (errmsg != NULL) {
+		if (err != 0) {
+			errno = err;
+			fatal_perror(errmsg);
+		} else
+			fatal(errmsg);
+	}
+
+	if (!pex_get_status(pex, 1, &status))
+		fatal_perror("can't get program status");
+	pex_free(pex);
+
+	if (status) {
+		if (WIFSIGNALED(status)) {
+			int sig = WTERMSIG(status);
+
+			fatal("%s terminated with signal %d [%s]%s",
+			      command, sig, strsignal(sig),
+			      WCOREDUMP(status) ? ", core dumped" : "");
+		}
+
+		if (WIFEXITED(status))
+			return WEXITSTATUS(status);
+	}
+	return 0;
+}
+/* Auto NULL terminate */
+#define execute(...) execute(__VA_ARGS__, NULL)
+
+/* Apply the sed commands in SED to file NAME_IN producing file NAME_OUT */
+static void
+do_sed(const sed_commands_t *sed, const char *name_in, const char *name_out)
+{
+	FILE *in, *out;
+	size_t alloc = 0;
+	char *line = NULL;
+	ssize_t len;
+	const char *pattern, *replacement;
+	int ix;
+
+	if (flag_verbose) {
+		fprintf(stderr, "emulating: sed \\\n");
+		for (ix = 0; ix != sed->pattern->num; ix++) {
+			pattern = sed->pattern->options[ix];
+			replacement = sed->replacement->options[ix];
+			if (replacement)
+				fprintf(stderr, "\t-e 's/%s/%s/' \\\n", pattern, replacement);
+			else
+				fprintf(stderr, "\t-e '/%s/d' \\\n", pattern);
+		}
+		fprintf(stderr, "\t%s > %s\n", name_in, name_out);
+	}
+
+	in = xfopen(name_in, "r");
+	out = xfopen(name_out, "w");
+
+	while ((len = getline(&line, &alloc, in)) > 0) {
+		debug2("len=%2zi line=%s", len, line);
+
+		for (ix = 0; ix != sed->pattern->num; ix++) {
+			const char *ptr;
+			int bol;
+			size_t pat_len;
+
+			pattern = sed->pattern->options[ix];
+			replacement = sed->replacement->options[ix];
+			ptr = line;
+			bol = pattern[0] == '^';
+
+			pattern += bol;
+			pat_len = strlen(pattern);
+
+			if (!bol) {
+				do {
+					ptr = strchr(ptr, pattern[0]);
+					if (!ptr) ;
+					else if (!strncmp(ptr, pattern, pat_len))
+						goto found;
+					else
+						ptr++;
+				}
+				while (ptr);
+			} else if (!strncmp(ptr, pattern, pat_len)) {
+ found:
+				if (replacement) {
+					debug2(" [modified]\n");
+					fwrite(line, 1, ptr - line, out);
+					fwrite(replacement, 1, strlen(replacement), out);
+					fwrite(ptr + pat_len, 1,
+					       len - pat_len - (ptr - line),
+					       out);
+				} else
+					debug2("   {dropped}\n");
+				goto next_line;
+			}
+		}
+
+		debug2("(untouched)\n");
+		fwrite(line, 1, len, out);
+ next_line:
+		;
+	}
+	fclose(in);
+	if (fclose(out))
+		fatal_perror("error writing temporary script '%s'", name_out);
+	free(line);
+}
+
+/* Generate the flt binary along with any other necessary pieces.  */
+#define exec_or_ret(...) \
+	do { \
+		int status = execute(__VA_ARGS__); \
+		if (status) return status; \
+	} while (0)
+static int do_final_link(void)
+{
+	sed_commands_t sed;
+	struct stat buf;
+	const char *script;
+	const char *rel_output;
+	int have_got = 0;
+	FILE *in;
+	char *line = NULL;
+	size_t alloc = 0;
+	ssize_t len;
+
+	init_sed(&sed);
+
+	if (flag_move_data) {
+		FILE *in;
+
+		/* See if the .rodata section contains any relocations.  */
+		if (!output_flt)
+			output_flt = make_temp_file(NULL);
+		exec_or_ret(linker, NULL, &other_options, "-r", "-d", "-o", output_flt);
+		exec_or_ret(objdump, tmp_file, NULL, "-h", output_flt);
+
+		in = xfopen(tmp_file, "r");
+		while ((len = getline(&line, &alloc, in)) > 0) {
+			const char *ptr = line;
+
+			while (1) {
+				ptr = strchr(ptr, '.');
+				if (!ptr)
+					break;
+				if (streqn(ptr, ".rodata")) {
+					getline(&line, &alloc, in);
+					ptr = line;
+					while (1) {
+						ptr = strchr(ptr, 'R');
+						if (!ptr)
+							break;
+						if (streqn(ptr, "RELOC")) {
+							flag_move_data = 0;
+							fprintf(stderr, "warning: .rodata section contains relocations");
+							break;
+						} else
+							ptr++;
+					}
+					break;
+				} else
+					ptr++;
+			}
+		}
+		fclose(in);
+	}
+	append_sed(&sed, "^R_RODAT", flag_move_data ? NULL : "");
+	append_sed(&sed, "^W_RODAT", flag_move_data ? "" : NULL);
+	append_sed(&sed, "^SINGLE_LINK:", USE_EMIT_RELOCS ? "" : NULL);
+	append_sed(&sed, "^TOR:", EMIT_CTOR_DTOR ? "" : NULL);
+
+	if (shared_lib_id) {
+		const char *got_offset;
+		int adj, id = strtol(shared_lib_id, NULL, 0);
+		char buf[30];
+
+		/* Replace addresses using the shared object id.   */
+		sprintf(buf, "%.2X", id);
+		append_sed(&sed, "ORIGIN = 0x0,", concat("ORIGIN = 0x", buf, "000000,", NULL));
+		append_sed(&sed, ".text 0x0 :", concat(".text 0x0", buf, "000000 :", NULL));
+		if (id)
+			append_sed(&sed, "ENTRY (" SYMBOL_PREFIX "_start)", "ENTRY (lib_main)");
+
+		/* Provide the symbol specifying the library's data segment
+		   pointer offset.  */
+		adj = 4;
+		if (streq(TARGET_CPU, "h8300"))
+			got_offset = "__current_shared_library_er5_offset_";
+		else if (streq(TARGET_CPU, "bfin"))
+			got_offset = "_current_shared_library_p5_offset_", adj = 1;
+		else
+			got_offset = "_current_shared_library_a5_offset_";
+		append_option(&other_options, "-defsym");
+		sprintf(buf, "%d", id * -adj - adj);
+		append_option(&other_options, concat(got_offset, "=", buf, NULL));
+	}
+
+	/* Locate the default linker script, if we don't have one provided. */
+	if (!linker_script)
+		linker_script = concat(ldscriptpath, "/elf2flt.ld", NULL);
+
+	/* Try and locate the linker script.  */
+	script = linker_script;
+	if (stat(script, &buf) || !S_ISREG(buf.st_mode)) {
+		script = concat(ldscriptpath, "/", linker_script, NULL);
+		if (stat(script, &buf) || !S_ISREG(buf.st_mode)) {
+			script = concat(ldscriptpath, "/ldscripts/", linker_script, NULL);
+			if (stat(script, &buf) || !S_ISREG(buf.st_mode))
+				script = NULL;
+		}
+	}
+	/* And process it if we can -- if we can't find it, the user must
+	   know what they are doing.  */
+	if (script) {
+		do_sed(&sed, linker_script, tmp_file);
+		linker_script = tmp_file;
+	}
+	free_sed(&sed);
+
+	if (USE_EMIT_RELOCS) {
+
+		exec_or_ret(linker, NULL, &other_options,
+			"-T", linker_script, "-q", "-o", output_gdb, emulation);
+
+		append_option(&flt_options, "-a");
+		rel_output = output_gdb;
+
+	} else if (NO_GOT_CHECK) {
+
+		output_elf = make_temp_file(NULL);
+
+		exec_or_ret(linker, NULL, &other_options,
+			"-T", linker_script, "-Ur", "-d", "-o", output_elf, emulation);
+		exec_or_ret(linker, NULL, &other_options,
+			"-T", linker_script, "-o", output_gdb, emulation);
+
+		rel_output = output_elf;
+
+	} else {
+
+		output_flt = make_temp_file(NULL);
+		exec_or_ret(linker, NULL, &other_options,
+			"-r", "-d", "-o", output_flt, emulation);
+
+		output_elf = make_temp_file(NULL);
+		exec_or_ret(linker, NULL, &search_dirs,
+			"-T", linker_script, "-Ur", "-o", output_elf, output_flt, emulation);
+
+		exec_or_ret(linker, NULL, &search_dirs,
+			"-T", linker_script, "-o", output_gdb, output_flt, emulation);
+
+		rel_output = output_elf;
+
+	}
+
+	if (shared_lib_id && strtol(shared_lib_id, NULL, 0) != 0)
+		exec_or_ret(objcopy, NULL, NULL, "--localize-hidden", "--weaken", output_gdb);
+
+	exec_or_ret(nm, tmp_file, NULL, "-p", output_gdb);
+	in = xfopen(tmp_file, "r");
+	while ((len = getline(&line, &alloc, in)) > 0) {
+		const char *ptr = strchr(line, '_');
+		if (ptr && streqn(ptr, "_GLOBAL_OFFSET_TABLE")) {
+			have_got = 1;
+			break;
+		}
+	}
+	fclose(in);
+	if (have_got)
+		exec_or_ret(elf2flt, NULL, &flt_options,
+			"-o", output_file, "-p", output_gdb, rel_output);
+	else
+		exec_or_ret(elf2flt, NULL, &flt_options,
+			"-o", output_file, "-r", rel_output);
+
+	return 0;
+}
+
+/* parse all the arguments provided to us */
+static void parse_args(int argc, char **argv)
+{
+	char *fltflags;
+	int argno;
+
+	for (argno = 1; argno < argc; argno++) {
+		char const *arg = argv[argno];
+		int to_all = argno;
+
+		if (streq(arg, "-elf2flt")) {
+			have_elf2flt_options = 1;
+			to_all++;
+		} else if (streqn(arg, "-elf2flt=")) {
+			have_elf2flt_options = 1;
+			append_option_str(&flt_options, &arg[9], "\t ");
+			to_all++;
+		} else if (streq(arg, "-move-rodata")) {
+			flag_move_data = 1;
+		} else if (streq(arg, "-shared-lib-id")) {
+			shared_lib_id = argv[++argno];
+		} else if (streq(arg, "-shared") || streq(arg, "-G")) {
+			want_shared = 1;
+		} else if (streqn(arg, "-o")) {
+			output_file = arg[2] ? &arg[2] : argv[++argno];
+		} else if (streqn(arg, "-T")) {
+			linker_script = arg[2] ? &arg[2] : argv[++argno];
+		} else if (streq(arg, "-c")) {
+			linker_script = argv[++argno];
+		} else if (streqn(arg, "-L")) {
+			const char *merged =
+				(arg[2] ? arg : concat("-L", argv[++argno], NULL));
+			append_option(&other_options, merged);
+			append_option(&search_dirs, merged);
+		} else if (streq(arg, "-EB")) {
+			append_option(&other_options, arg);
+			append_option(&search_dirs, arg);
+		} else if (streq(arg, "-relax")) {
+			;
+		} else if (streq(arg, "-s") || streq(arg, "--strip-all") ||
+		           streq(arg, "-S") || streq(arg, "--strip-debug")) {
+			/* Ignore these strip options for links involving elf2flt.
+			   The final flat output will be stripped by definition, and we
+			   don't want to strip the .gdb helper file.  The strip options
+			   are also incompatible with -r and --emit-relocs.  */
+			;
+		} else if (streq(arg, "-r") || streq(arg, "-Ur")) {
+			flag_final = 0;
+			append_option(&other_options, arg);
+		} else if (streq(arg, "--verbose")) {
+			flag_verbose = 1;
+			append_option(&other_options, arg);
+		} else if (streqn(arg, "-m")) {
+			emulation = arg[2] ? arg : concat("-m", argv[++argno], NULL);
+		} else
+			append_option(&other_options, arg);
+
+		while (to_all <= argno)
+			append_option(&all_options, argv[to_all++]);
+	}
+
+	fltflags = getenv("FLTFLAGS");
+	if (fltflags)
+		append_option_str(&flt_options, fltflags, "\t ");
+}
+
+int main(int argc, char *argv[])
+{
+	const char *argv0 = argv[0];
+	const char *argv0_dir = make_relative_prefix(argv0, "/", "/");
+	char *tooldir = argv0_dir;
+	char *bindir = argv0_dir;
+	char *tmp;
+	struct stat buf;
+	const char *have_exe = NULL;
+	int status;
+
+#ifdef __WIN32
+	/* Remove the .exe extension, if it's there.  */
+	size_t len = strlen(argv0);
+	if (len > 4 && streq(&argv0[len - 4], ".exe")) {
+		have_exe = ".exe";
+		len -= 4;
+		argv0 = tmp = xstrdup(argv0);
+		tmp[len] = 0;
+		argv[0][len] = '\0';
+	}
+#endif
+	elf2flt_progname = lbasename(argv0);
+
+	/* The standard binutils tool layout has:
+
+	   bin/<TARGET_ALIAS>-foo
+	   lib/
+	   <TARGET_ALIAS>/bin/foo
+	   <TARGET_ALIAS>/lib
+
+	   It's <TARGET_ALIAS>/ that we want here: files in lib/ are for
+	   the host while those in <TARGET_ALIAS>/lib are for the target.
+	   Make bindir point to the bin dir for bin/<TARGET_ALIAS>-foo.
+	   Make tooldir point to the bin dir for <TARGET_ALIAS>/bin/foo.  */
+	if (streqn(elf2flt_progname, TARGET_ALIAS)) {
+		tmp = concat(argv0_dir, "../" TARGET_ALIAS "/bin", NULL);
+		if (stat(tmp, &buf) == 0 && S_ISDIR(buf.st_mode)) {
+			tooldir = concat(tmp, "/", NULL);
+		}
+	} else {
+		tmp = concat(argv0_dir, "../../bin", NULL);
+		if (stat(tmp, &buf) == 0 && S_ISDIR(buf.st_mode)) {
+			bindir = concat(tmp, "/", NULL);
+		}
+	}
+
+	/* Typically ld-elf2flt is invoked as `ld` which means error
+	 * messages from it will look like "ld: " which is completely
+	 * confusing.  So append an identifier to keep things clear.
+	 */
+	elf2flt_progname = concat(elf2flt_progname, " (ld-elf2flt)", NULL);
+
+	xmalloc_set_program_name(elf2flt_progname);
+
+	linker = concat(tooldir, "ld.real", have_exe, NULL);
+	elf2flt = concat(tooldir, "elf2flt", have_exe, NULL);
+	nm = concat(tooldir, "nm", have_exe, NULL);
+	objdump = concat(bindir, TARGET_ALIAS "-objdump", have_exe, NULL);
+	objcopy = concat(bindir, TARGET_ALIAS "-objcopy", have_exe, NULL);
+
+	if (stat(ldscriptpath, &buf) || !S_ISDIR(buf.st_mode))
+		ldscriptpath = concat(tooldir, "../lib", NULL);
+
+	parse_args(argc, argv);
+
+	if (flag_verbose) {
+		fprintf(stderr, "argv[0]      = '%s'\n", argv[0]);
+		fprintf(stderr, "bindir       = '%s'\n", bindir);
+		fprintf(stderr, "tooldir      = '%s'\n", tooldir);
+		fprintf(stderr, "linker       = '%s'\n", linker);
+		fprintf(stderr, "elf2flt      = '%s'\n", elf2flt);
+		fprintf(stderr, "nm           = '%s'\n", nm);
+		fprintf(stderr, "objdump      = '%s'\n", objdump);
+		fprintf(stderr, "objcopy      = '%s'\n", objcopy);
+		fprintf(stderr, "ldscriptpath = '%s'\n", ldscriptpath);
+	}
+
+	/* Pass off to regular linker, if there's nothing elf2flt-like */
+	if (!have_elf2flt_options)
+		return execute(linker, NULL, &all_options);
+
+	/* Pass off to regular linker, minus the elf2flt options, if it's
+	   not the final link.  */
+	if (!flag_final)
+		return execute(linker, NULL, &other_options, "-o", output_file);
+
+	if (want_shared && !shared_lib_id)
+		fatal("-shared used without passing a shared library ID");
+
+	/* Otherwise link & convert to flt.  */
+	output_gdb = concat(output_file, ".gdb", NULL);
+	tmp_file = make_temp_file(NULL);
+	status = do_final_link();
+	if (!flag_verbose) {
+		unlink(tmp_file);
+		unlink(output_flt);
+		unlink(output_elf);
+	} else {
+		fprintf(stderr,
+			"leaving elf2flt temp files behind:\n"
+			"tmp_file   = %s\n"
+			"output_flt = %s\n"
+			"output_elf = %s\n",
+			tmp_file, output_flt, output_elf);
+	}
+	return status;
+}
diff --git a/package/elf2flt/src/ld-elf2flt.in b/package/elf2flt/src/ld-elf2flt.in
index b876636..fd1faed 100644
--- a/package/elf2flt/src/ld-elf2flt.in
+++ b/package/elf2flt/src/ld-elf2flt.in
@@ -22,6 +22,7 @@ OBJDUMP="`expr $OBJCOPY : '\(.*\)objcopy'`objdump"
 LDSCRIPTPATH="@binutils_ldscript_dir@"	# and the scripts
 SHARED_ID=""
 NEWLDSCRIPT=""
+WANT_SHARED=""
 
 # check TOOLDIR from prefix/bin/ or prefix/target-alias/bin/
 [ -d "${LDSCRIPTPATH}" ] || LDSCRIPTPATH="${TOOLDIR}/../lib"
@@ -52,9 +53,13 @@ then
 
 		-move-rodata)
 		          MOVDAT="y";;                 # Put rodata in ROM if possible
-			 
+		-s|-S|--strip-all|--strip-debug)
+		          ;;                           # Ignore strip flags
+
 		-shared-lib-id)
 		          shift; SHARED_ID="$1";;      # Shared library ID
+		-shared|-G)
+		          WANT_SHARED="y";;            # Shared library
 
 		-o)       shift; OFILE="$1";;          # the final outfile
 		-o*)      OFILE="`expr \"$1\" : '-o\(.*\)'`";;
@@ -77,7 +82,8 @@ then
 		          ARG1="$ARG1 $1"
 				  ;;
 
-		-v)       ARG1="$ARG1 $1"
+		-v|--verbose)
+				  ARG1="$ARG1 $1"
 				  VERBOSE="y"
 				  ;;
 
@@ -90,11 +96,20 @@ then
 		shift
 	done
 
+	if [ "$WANT_SHARED" = "y" ]
+	then
+		if [ -z "$SHARED_ID" ]
+		then
+			echo "-shared used without passing a shared library ID"
+			exit 1
+		fi
+	fi
 	if [ "$FINAL" = "yes" ]
 	then
 		[ "$VERBOSE" = "y" ] && set -x
 		ARG1="$ARG1 $FINAL_ONLY"
 		NEWLDSCRIPT=`mktemp /tmp/flt-XXXXXX`
+		trap 'rm -f "$NEWLDSCRIPT"' EXIT
 		SEDOP=" -e s/^R_RODAT// -e /^W_RODAT/d"
 		OBJCOPYOP=""
 		if [ "$MOVDAT" ]
@@ -121,23 +136,31 @@ then
 			then
 				# Non application modules enter via main not _start
 				#    SEDOP="$SEDOP -e 's/ENTRY (_start)/ENTRY (main)/'"
-				SEDOP="$SEDOP -e s/\\(ENTRY.\\)(_start)/\1(lib_main)/"
+				SEDOP="$SEDOP -e s/\\(ENTRY.\\)(@SYMBOL_PREFIX at _start)/\1(lib_main)/"
 				OBJCOPYOP="--localize-hidden --weaken"
 			fi
 
 			# Provide the magic parameter that defines the library data segment pointer offset
+			GOT_ADJ=4
 			case "@target_cpu@" in
+			    bfin)  GOT_OFFSET="_current_shared_library_p5_offset_" GOT_ADJ=1;;
 			    h8300) GOT_OFFSET="__current_shared_library_er5_offset_";;
 			    *)     GOT_OFFSET="_current_shared_library_a5_offset_";;
 			esac
-			ARG1="$ARG1 -defsym $GOT_OFFSET=`expr ${SHARED_ID} '*' -4 - 4`"
+			ARG1="$ARG1 -defsym $GOT_OFFSET=`expr ${SHARED_ID} '*' -${GOT_ADJ} - ${GOT_ADJ}`"
 		fi
-		if [ "@emit_relocs@" = "yes" ]
+		if [ "@emit_relocs@" = "1" ]
 		then
 			SEDOP="$SEDOP -e s/^SINGLE_LINK://"
 		else
 			SEDOP="$SEDOP -e /^SINGLE_LINK:/d"
 		fi
+		if [ "@emit_ctor_dtor@" = "1" ]
+		then
+			SEDOP="$SEDOP -e s/^TOR://"
+		else
+			SEDOP="$SEDOP -e /^TOR:/d"
+		fi
 		
 		# provide a default linker script, we usually need one
 		[ -z "$LDSCRIPT" ] && LDSCRIPT="${LDSCRIPTPATH}/elf2flt.ld"
@@ -155,13 +178,13 @@ then
 			LDSCRIPT="$NEWLDSCRIPT"
 		fi
 
-		if [ "@emit_relocs@" = "yes" ]
+		if [ "@emit_relocs@" = "1" ]
 		then
 		 $LINKER $EMUL $SDIRS -T $LDSCRIPT -q -o "$OFILE.gdb" $ARG1             ||exit $?
 		 RFILE="$OFILE.gdb"
 		 FLTFLAGS="$FLTFLAGS -a"
 		else
-		 if [ "@got_check@" = "no" ]
+		 if [ "@got_check@" = "0" ]
 		 then
 		  $LINKER $EMUL $SDIRS -T $LDSCRIPT -Ur -d -o "$OFILE.elf" $ARG1         ||exit $?
 		  $LINKER $EMUL $SDIRS -T $LDSCRIPT -o "$OFILE.gdb" $ARG1                ||exit $?
@@ -205,7 +228,6 @@ then
 		 fi
 		fi
 		[ "$RFILE" = "$OFILE.gdb" ] || rm -f "$RFILE"  # not needed for any reason
-		rm -f "$NEWLDSCRIPT"
 		exit 0
 	fi
 
diff --git a/package/elf2flt/src/maketarball.sh b/package/elf2flt/src/maketarball.sh
deleted file mode 100755
index 1014860..0000000
--- a/package/elf2flt/src/maketarball.sh
+++ /dev/null
@@ -1,12 +0,0 @@
-#!/bin/bash
-
-cvs_stamp=$(cut -d/ -f4 CVS/Entries | sort | tail -n 1)
-stamp=$(date +%Y%m%d --date="${cvs_stamp}")
-
-p="elf2flt-${stamp}"
-rm -f elf2flt-*.tar.bz2
-mkdir ../${p}
-cp -r * ../${p}/ || exit 1
-tar jcf ${p}.tar.bz2 --exclude .svn -C .. ${p}
-rm -r ../${p} || exit 1
-du -b ${p}.tar.bz2
diff --git a/package/elf2flt/src/stubs.c b/package/elf2flt/src/stubs.c
index fb14d63..696ed3b 100644
--- a/package/elf2flt/src/stubs.c
+++ b/package/elf2flt/src/stubs.c
@@ -1,6 +1,133 @@
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "libiberty.h"
+
+#include "stubs.h"
+
 #ifndef HAVE_DCGETTEXT
-const char *dcgettext (const char *domain, const char *msg, int category)
+const char *dcgettext(const char *domain, const char *msg, int category)
 {
   return msg;
 }
 #endif /* !HAVE_DCGETTEXT */
+
+#ifndef HAVE_LIBINTL_DGETTEXT
+const char *libintl_dgettext(const char *domain, const char *msg)
+{
+  return msg;
+}
+#endif /* !HAVE_LIBINTL_DGETTEXT */
+
+#ifndef HAVE_GETLINE
+/* Read a line from IN.  LINE points to a malloc'd buffer that is extended as
+   necessary.  ALLOC points to the allocated length of LINE.  Returns
+   the length of the string read (including any trailing \n) */
+
+ssize_t getline(char **line, size_t *alloc, FILE *in)
+{
+	size_t len = 0;
+
+	if (!*alloc) {
+		*alloc = 200;
+		*line = xmalloc(*alloc);
+	}
+
+	while (1) {
+		if (!fgets(*line + len, *alloc - len, in))
+			return 0;
+		len += strlen(*line + len);
+		if (len && (*line)[len - 1] == '\n')
+			return len;
+
+		*alloc *= 2;
+		*line = xrealloc(*line, *alloc);
+	}
+}
+#endif
+
+/* fatal error & exit */
+void fatal(const char *format, ...)
+{
+	va_list args;
+
+	va_start(args, format);
+	fprintf(stderr, "%s: ", elf2flt_progname);
+	vfprintf(stderr, format, args);
+	fprintf(stderr, "\n");
+	va_end(args);
+	exit(1);
+}
+
+/* fatal error, perror & exit */
+void fatal_perror(const char *format, ...)
+{
+	int e = errno;
+	va_list args;
+
+	va_start(args, format);
+	fprintf(stderr, "%s: ", elf2flt_progname);
+	vfprintf(stderr, format, args);
+	fprintf(stderr, ": %s\n", strerror(e));
+	va_end(args);
+	exit(1);
+}
+
+/* open a file or fail */
+FILE *xfopen(const char *path, const char *mode)
+{
+	FILE *ret = fopen(path, mode);
+	if (!ret)
+		fatal_perror("Unable to open '%s'", path);
+	return ret;
+}
+
+/* Append a string SRC to an options array DST */
+void append_option(options_t *dst, const char *src)
+{
+	if (dst->alloc == dst->num) {
+		size_t a = (dst->num + 2) * 2;
+		void *o = xmalloc(sizeof(*dst->options) * a);
+
+		memcpy(o, dst->options, sizeof(*dst->options) * dst->num);
+		free(dst->options);
+		dst->options = o;
+		dst->alloc = a;
+	}
+
+	dst->options[dst->num] = src;
+	dst->num++;
+}
+
+/* Split and append a string SRC to an options array DST */
+void append_option_str(options_t *dst, const char *src, const char *delim)
+{
+	char *tok_src = xstrdup(src);
+	char *tok = strtok(tok_src, delim);
+	while (tok) {
+		append_option(dst, tok);
+		tok = strtok(NULL, delim);
+	}
+	/* don't free tok_src since options_t now points to it */
+}
+
+/* Append an options array SRC to another options array DST */
+void append_options(options_t *dst, const options_t *src)
+{
+	if (dst->alloc < dst->num + src->num) {
+		size_t a = (dst->num + src->num + 2) * 2;
+		void *o = xmalloc(sizeof(*dst->options) * a);
+
+		memcpy(o, dst->options, sizeof(*dst->options) * dst->num);
+		free(dst->options);
+		dst->options = o;
+		dst->alloc = a;
+	}
+
+	memcpy(&dst->options[dst->num], &src->options[0],
+		sizeof(*dst->options) * src->num);
+	dst->num += src->num;
+}
diff --git a/package/elf2flt/src/stubs.h b/package/elf2flt/src/stubs.h
new file mode 100644
index 0000000..615cab5
--- /dev/null
+++ b/package/elf2flt/src/stubs.h
@@ -0,0 +1,75 @@
+/* macros for conversion between host and (internet) network byte order */
+#ifndef WIN32
+# include <netinet/in.h> /* Consts and structs defined by the internet system */
+# define BINARY_FILE_OPTS
+#else
+# include <winsock2.h>
+# define BINARY_FILE_OPTS "b"
+#endif
+
+#ifndef __WIN32
+# include <sys/wait.h>
+#endif
+#ifndef WIFSIGNALED
+# define WIFSIGNALED(S) (((S) & 0xff) != 0 && ((S) & 0xff) != 0x7f)
+#endif
+#ifndef WTERMSIG
+# define WTERMSIG(S) ((S) & 0x7f)
+#endif
+#ifndef WIFEXITED
+# define WIFEXITED(S) (((S) & 0xff) == 0)
+#endif
+#ifndef WEXITSTATUS
+# define WEXITSTATUS(S) (((S) & 0xff00) >> 8)
+#endif
+#ifndef WCOREDUMP
+# define WCOREDUMP(S) ((S) & WCOREFLG)
+#endif
+#ifndef WCOREFLG
+# define WCOREFLG 0200
+#endif
+#ifndef HAVE_STRSIGNAL
+# define strsignal(sig) "SIG???"
+#endif
+
+#define streq(str1, str2) (strcmp(str1, str2) == 0)
+#define streqn(str1, str2) (strncmp(str1, str2, strlen(str2)) == 0)
+
+#ifndef DEBUG
+# define DEBUG -1
+#endif
+#define _debug(lvl, fmt, args...) \
+	do { \
+		if (lvl <= DEBUG) { \
+			fprintf(stderr, "%s:%i: " fmt, __func__, __LINE__ , ## args); \
+			fflush(stderr); \
+		} \
+	} while (0)
+#define debug2(...) _debug(2, __VA_ARGS__)
+#define debug1(...) _debug(1, __VA_ARGS__)
+#define debug0(...) _debug(0, __VA_ARGS__)
+#define debug(...)  debug0(__VA_ARGS__)
+
+#ifndef HAVE_GETLINE
+ssize_t getline(char **line, size_t *alloc, FILE *in);
+#endif
+
+extern const char *elf2flt_progname;
+
+void fatal(const char *, ...);
+void fatal_perror(const char *, ...);
+
+FILE *xfopen(const char *path, const char *mode);
+
+/* Structure to hold a list of options */
+typedef struct
+{
+  const char **options;
+  size_t num;
+  size_t alloc;
+} options_t;
+/* Initialize an options structure */
+#define init_options(DST) ((DST)->options = NULL, (DST)->num = (DST)->alloc = 0)
+void append_options(options_t *dst, const options_t *src);
+void append_option(options_t *dst, const char *src);
+void append_option_str(options_t *dst, const char *src, const char *delim);
-- 
1.8.1.5
