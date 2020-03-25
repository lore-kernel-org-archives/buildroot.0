From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Mar 2020 07:26:34 +0100
Subject: [Buildroot] [PATCH] package/oprofile: fix build with binutils >=
 2.34
Message-ID: <20200325062634.1780288-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libbfd library provided by binutils unfortunately changed its API
in binutils >= 2.34. This is causing some build failures at the moment
on architectures such as ARC that are using a very recent binutils
version, but it would also cause build failures on other architectures
once they start using binutils 2.34.

We fix this build issue by backporting an upstream oprofile
patch. However, this patch touches configure.ac, which means we need
to autoreconf, which needs another fix in configure.ac for autoreconf
to succeed.

With all that in place, this commit fixes:

  http://autobuild.buildroot.net/results/583d281c6cd2aecb65556080b379db24101ae3a8/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...d-foreign-option-to-AM_INIT_AUTOMAKE.patch |  36 ++++
 ...o-handle-the-binutils-2.34-api-chang.patch | 169 ++++++++++++++++++
 package/oprofile/oprofile.mk                  |   3 +
 3 files changed, 208 insertions(+)
 create mode 100644 package/oprofile/0002-configure.ac-add-foreign-option-to-AM_INIT_AUTOMAKE.patch
 create mode 100644 package/oprofile/0003-Macro-wrappers-to-handle-the-binutils-2.34-api-chang.patch

diff --git a/package/oprofile/0002-configure.ac-add-foreign-option-to-AM_INIT_AUTOMAKE.patch b/package/oprofile/0002-configure.ac-add-foreign-option-to-AM_INIT_AUTOMAKE.patch
new file mode 100644
index 0000000000..98dcac6906
--- /dev/null
+++ b/package/oprofile/0002-configure.ac-add-foreign-option-to-AM_INIT_AUTOMAKE.patch
@@ -0,0 +1,36 @@
+From ff172a49d1ca5708f45939b9b4f125cafba01db3 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 24 Mar 2020 22:50:32 +0100
+Subject: [PATCH] configure.ac: add foreign option to AM_INIT_AUTOMAKE
+
+oprofile doesn't provide the NEWS, AUTHORS and ChangeLog file, so
+autoreconf complains with:
+
+Makefile.am: error: required file './NEWS' not found
+Makefile.am: error: required file './AUTHORS' not found
+Makefile.am: error: required file './ChangeLog' not found
+
+Such errors can be avoided by passing the "foreign" option to
+AM_INIT_AUTOMAKE.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 00e30079..87afe2b7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -13,7 +13,7 @@ AC_PREREQ(2.13)
+ 
+ AC_INIT([OProfile], [1.3.0])
+ AC_CONFIG_SRCDIR([libop/op_config.h])
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
+ AC_CONFIG_HEADERS(config.h)
+ 
+ AC_CHECK_DECLS([basename], [], [], [[#include <libgen.h>]])
+-- 
+2.25.1
+
diff --git a/package/oprofile/0003-Macro-wrappers-to-handle-the-binutils-2.34-api-chang.patch b/package/oprofile/0003-Macro-wrappers-to-handle-the-binutils-2.34-api-chang.patch
new file mode 100644
index 0000000000..cff5030e00
--- /dev/null
+++ b/package/oprofile/0003-Macro-wrappers-to-handle-the-binutils-2.34-api-chang.patch
@@ -0,0 +1,169 @@
+From 377610414fb6cd7ac30e4485d9d6482fcf29aca6 Mon Sep 17 00:00:00 2001
+From: William Cohen <wcohen@redhat.com>
+Date: Wed, 18 Mar 2020 21:19:16 -0400
+Subject: [PATCH] Macro wrappers to handle the binutils 2.34 api changes
+
+Changes in binutils 2.34 API prevented oprofile from compiling with
+it.  This patch tests for the changes in the binutils API during
+configuration and selects the appropiate wrappers to allow oprofile to
+compile.  This allows oprofile to compile with both older and newer
+versions of binutils.
+
+Upstream: 377610414fb6cd7ac30e4485d9d6482fcf29aca6
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ configure.ac              | 20 ++++++++++++++++++++
+ libutil++/bfd_support.cpp | 11 ++++++-----
+ libutil/op_bfd_wrappers.h | 28 ++++++++++++++++++++++++++++
+ opjitconv/create_bfd.c    |  7 ++++---
+ 4 files changed, 58 insertions(+), 8 deletions(-)
+ create mode 100644 libutil/op_bfd_wrappers.h
+
+diff --git a/configure.ac b/configure.ac
+index ac2fd35e..df032a78 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -224,6 +224,26 @@ if test "$host_cpu" = "powerpc64le" -o "$host_cpu" = "powerpc64"; then
+ fi
+ AC_SUBST(PFM_LIB)
+ 
++HAVE_BINUTILS_234='1'
++AC_MSG_CHECKING([whether binutils 2.34 is being used])
++rm -f test-for-BINUTILS
++AC_LANG_CONFTEST(
++	[AC_LANG_PROGRAM([[#include <bfd.h>]],
++		[[asection * sect;
++		bfd_size_type buildid_sect_size = bfd_section_size(sect);
++		return 0;]])
++	])
++$CC conftest.$ac_ext $CFLAGS $LDFLAGS $LIBS $PERF_EVENT_FLAGS -o test-for-BINUTILS  > /dev/null 2>&1
++if test -f test-for-BINUTILS; then
++	echo "yes"
++	HAVE_BINUTILS_234='1'
++else
++	echo "no"
++	HAVE_BINUTILS_234='0'
++fi
++AC_DEFINE_UNQUOTED(HAVE_BINUTILS_234, $HAVE_BINUTILS_234, [Using binutils 2.34])
++rm -f test-for-BINUTILS*
++
+ AC_ARG_WITH(java,
+ [  --with-java=java-home        Path to Java home directory (default is "no"; "yes" will use /usr as Java home)],
+ JAVA_HOMEDIR=$with_java, [with_java=no])
+diff --git a/libutil++/bfd_support.cpp b/libutil++/bfd_support.cpp
+index fa904839..cd0f4f71 100644
+--- a/libutil++/bfd_support.cpp
++++ b/libutil++/bfd_support.cpp
+@@ -19,6 +19,7 @@
+ #include "locate_images.h"
+ #include "op_libiberty.h"
+ #include "op_exception.h"
++#include "op_bfd_wrappers.h"
+ 
+ #include <unistd.h>
+ #include <errno.h>
+@@ -137,7 +138,7 @@ static bool get_build_id(bfd * ibfd, unsigned char * build_id)
+ 		}
+ 	}
+ 
+-	bfd_size_type buildid_sect_size = bfd_section_size(ibfd, sect);
++	bfd_size_type buildid_sect_size = op_bfd_section_size(ibfd, sect);
+ 	char * contents = (char *) xmalloc(buildid_sect_size);
+ 	errno = 0;
+ 	if (!bfd_get_section_contents(ibfd, sect,
+@@ -188,7 +189,7 @@ bool get_debug_link_info(bfd * ibfd, string & filename, unsigned long & crc32)
+ 	if (sect == NULL)
+ 		return false;
+ 	
+-	bfd_size_type debuglink_size = bfd_section_size(ibfd, sect);  
++	bfd_size_type debuglink_size = op_bfd_section_size(ibfd, sect);
+ 	char * contents = (char *) xmalloc(debuglink_size);
+ 	cverb << vbfd
+ 	      << ".gnu_debuglink section has size " << debuglink_size << endl;
+@@ -346,7 +347,7 @@ void fixup_linenr(bfd * abfd, asection * section, asymbol ** syms,
+ 	// first restrict the search on a sensible range of vma, 16 is
+ 	// an intuitive value based on epilog code look
+ 	size_t max_search = 16;
+-	size_t section_size = bfd_section_size(abfd, section);
++	size_t section_size = op_bfd_section_size(abfd, section);
+ 	if (pc + max_search > section_size)
+ 		max_search = section_size - pc;
+ 
+@@ -819,10 +820,10 @@ find_nearest_line(bfd_info const & b, op_bfd_symbol const & sym,
+ 	else
+ 		pc = (sym.value() + offset) - sym.filepos();
+ 
+-	if ((bfd_get_section_flags(abfd, section) & SEC_ALLOC) == 0)
++	if ((op_bfd_get_section_flags(abfd, section) & SEC_ALLOC) == 0)
+ 		goto fail;
+ 
+-	if (pc >= bfd_section_size(abfd, section))
++	if (pc >= op_bfd_section_size(abfd, section))
+ 		goto fail;
+ 
+ 	ret = bfd_find_nearest_line(abfd, section, syms, pc, &cfilename,
+diff --git a/libutil/op_bfd_wrappers.h b/libutil/op_bfd_wrappers.h
+new file mode 100644
+index 00000000..b229cc12
+--- /dev/null
++++ b/libutil/op_bfd_wrappers.h
+@@ -0,0 +1,28 @@
++/**
++ * @file op_bfd_wrappers.h
++ * Wrappers to hide API changes in binutils 2.34
++ *
++ * @remark Copyright 2020 OProfile authors
++ * @remark Read the file COPYING
++ *
++ * @author William Cohen
++ */
++
++#ifndef OP_BFD_WRAPPERS_H
++#define OP_BFD_WRAPPERS_H
++
++#if HAVE_BINUTILS_234
++#define op_bfd_section_size(ibfd, sec) bfd_section_size(sec)
++#define op_bfd_get_section_flags(abfd, sec) bfd_section_flags(sec)
++#define op_bfd_set_section_flags(abfd, sec, flags) bfd_set_section_flags(sec, flags)
++#define op_bfd_set_section_vma(abfd, sec, vma) bfd_set_section_vma(sec, vma)
++#define op_bfd_set_section_size(abfd, sec, size) bfd_set_section_size(sec, size)
++#else
++#define op_bfd_section_size(ibfd, sec) bfd_section_size(ibfd, sec)
++#define op_bfd_get_section_flags(abfd, sec) bfd_get_section_flags(abfd, sec)
++#define op_bfd_set_section_flags(abfd, sec, flags) bfd_set_section_flags(abfd, sec, flags)
++#define op_bfd_set_section_vma(abfd, sec, vma) bfd_set_section_vma(abfd, sec, vma)
++#define op_bfd_set_section_size(abfd, sec, size) bfd_set_section_size(abfd, sec, size)
++#endif
++
++#endif /* !OP_BFD_WRAPPERS_H */
+diff --git a/opjitconv/create_bfd.c b/opjitconv/create_bfd.c
+index 48db143b..da1e6d29 100644
+--- a/opjitconv/create_bfd.c
++++ b/opjitconv/create_bfd.c
+@@ -16,6 +16,7 @@
+ 
+ #include "opjitconv.h"
+ #include "op_libiberty.h"
++#include "op_bfd_wrappers.h"
+ 
+ #include <bfd.h>
+ #include <assert.h>
+@@ -86,12 +87,12 @@ asection * create_section(bfd * abfd, char const * section_name,
+ 		bfd_perror("bfd_make_section");
+ 		goto error;
+ 	}
+-	bfd_set_section_vma(abfd, section, vma);
+-	if (bfd_set_section_size(abfd, section, size) == FALSE) {
++	op_bfd_set_section_vma(abfd, section, vma);
++	if (op_bfd_set_section_size(abfd, section, size) == FALSE) {
+ 		bfd_perror("bfd_set_section_size");
+ 		goto error;
+ 	}
+-	if (bfd_set_section_flags(abfd, section, flags) == FALSE) {
++	if (op_bfd_set_section_flags(abfd, section, flags) == FALSE) {
+ 		bfd_perror("bfd_set_section_flags");
+ 		goto error;
+ 	}
+-- 
+2.25.1
+
diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index cc41e5c6da..b9d7d9e608 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -8,6 +8,9 @@ OPROFILE_VERSION = 1.3.0
 OPROFILE_SITE = http://downloads.sourceforge.net/project/oprofile/oprofile/oprofile-$(OPROFILE_VERSION)
 OPROFILE_LICENSE = GPL-2.0+
 OPROFILE_LICENSE_FILES = COPYING
+# 0002-configure.ac-add-foreign-option-to-AM_INIT_AUTOMAKE.patch
+# 0003-Macro-wrappers-to-handle-the-binutils-2.34-api-chang.patch
+OPROFILE_AUTORECONF = YES
 OPROFILE_CONF_OPTS = \
 	--disable-account-check \
 	--enable-gui=no \
-- 
2.25.1
