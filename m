From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Thu,  2 Jan 2014 16:58:28 +0100
Subject: [Buildroot] [PATCH] valgrind: bump to version 1.9.0
Message-ID: <1388678308-57013-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop some patches:
 - glibc 2.17 and 2.18 are now supported by upstream
 - coregrind/link_tool_exe_linux.in has been reworked and should now
   support ccache

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 .../valgrind-0001-workaround-SIGSEGV-on-PPC.patch  | 32 ++++++++++
 ...e-largefile-support-unconditionally-on-uC.patch | 71 ++++++++++++++++++++++
 ...valgrind-0003-Add-replacement-for-a.out.h.patch | 58 ++++++++++++++++++
 ...grind-add-support-for-glibc-2.17-and-2.18.patch | 50 ---------------
 .../valgrind-dont-include-a-out-header.patch       | 45 --------------
 package/valgrind/valgrind-fix-ccache-support.patch | 49 ---------------
 package/valgrind/valgrind-largefile.patch          | 56 -----------------
 .../valgrind-workaround-SIGSEGV-on-PPC.patch       | 25 --------
 package/valgrind/valgrind.mk                       |  2 +-
 9 files changed, 162 insertions(+), 226 deletions(-)
 create mode 100644 package/valgrind/valgrind-0001-workaround-SIGSEGV-on-PPC.patch
 create mode 100644 package/valgrind/valgrind-0002-don-t-enable-largefile-support-unconditionally-on-uC.patch
 create mode 100644 package/valgrind/valgrind-0003-Add-replacement-for-a.out.h.patch
 delete mode 100644 package/valgrind/valgrind-add-support-for-glibc-2.17-and-2.18.patch
 delete mode 100644 package/valgrind/valgrind-dont-include-a-out-header.patch
 delete mode 100644 package/valgrind/valgrind-fix-ccache-support.patch
 delete mode 100644 package/valgrind/valgrind-largefile.patch
 delete mode 100644 package/valgrind/valgrind-workaround-SIGSEGV-on-PPC.patch

diff --git a/package/valgrind/valgrind-0001-workaround-SIGSEGV-on-PPC.patch b/package/valgrind/valgrind-0001-workaround-SIGSEGV-on-PPC.patch
new file mode 100644
index 0000000..9e891be
--- /dev/null
+++ b/package/valgrind/valgrind-0001-workaround-SIGSEGV-on-PPC.patch
@@ -0,0 +1,32 @@
+From 872ade34d6af973ca88d5accd9e819216ecb94ba Mon Sep 17 00:00:00 2001
+From: Pierre Habouzit <madcoder@debian.org>
+Date: Tue, 10 May 2011 23:11:45 +0200
+Subject: [PATCH 1/3] workaround SIGSEGV on PPC.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Pierre Habouzit <madcoder@debian.org>
+Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
+---
+ coregrind/m_machine.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/coregrind/m_machine.c b/coregrind/m_machine.c
+index 28a180e..8426551 100644
+--- a/coregrind/m_machine.c
++++ b/coregrind/m_machine.c
+@@ -27,6 +27,10 @@
+    The GNU General Public License is contained in the file COPYING.
+ */
+ 
++#ifdef __powerpc__
++#  pragma GCC optimize ("-O0")
++#endif
++
+ #include "pub_core_basics.h"
+ #include "pub_core_vki.h"
+ #include "pub_core_libcsetjmp.h"   // setjmp facilities
+-- 
+1.8.3.2
+
diff --git a/package/valgrind/valgrind-0002-don-t-enable-largefile-support-unconditionally-on-uC.patch b/package/valgrind/valgrind-0002-don-t-enable-largefile-support-unconditionally-on-uC.patch
new file mode 100644
index 0000000..1df318a
--- /dev/null
+++ b/package/valgrind/valgrind-0002-don-t-enable-largefile-support-unconditionally-on-uC.patch
@@ -0,0 +1,71 @@
+From 271d855c0ad94a2ec164e20173257a06cd83288d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
+Date: Thu, 2 Jan 2014 16:00:06 +0100
+Subject: [PATCH 2/3] don't enable largefile support unconditionally on uClibc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+uClibc can be compiled without largefile support (and errors out if
+_FILE_OFFSET_BITS is set to 64), so don't define it if that combination
+is detected.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
+---
+ coregrind/m_initimg/initimg-linux.c | 4 ++++
+ coregrind/m_main.c                  | 4 ++++
+ coregrind/m_ume/elf.c               | 4 ++++
+ 3 files changed, 12 insertions(+)
+
+diff --git a/coregrind/m_initimg/initimg-linux.c b/coregrind/m_initimg/initimg-linux.c
+index 9bcc05c..ffee30f 100644
+--- a/coregrind/m_initimg/initimg-linux.c
++++ b/coregrind/m_initimg/initimg-linux.c
+@@ -55,7 +55,11 @@
+ 
+ /* --- !!! --- EXTERNAL HEADERS start --- !!! --- */
+ #define _GNU_SOURCE
++#include <features.h>
++/* uclibc without largefile support #errors on _FILE_OFFSET_BITS=64 */
++#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_LFS__))
+ #define _FILE_OFFSET_BITS 64
++#endif
+ /* This is for ELF types etc, and also the AT_ constants. */
+ #include <elf.h>
+ /* --- !!! --- EXTERNAL HEADERS end --- !!! --- */
+diff --git a/coregrind/m_main.c b/coregrind/m_main.c
+index 35c11e1..0372946 100644
+--- a/coregrind/m_main.c
++++ b/coregrind/m_main.c
+@@ -2997,7 +2997,11 @@ asm(
+ 
+ /* --- !!! --- EXTERNAL HEADERS start --- !!! --- */
+ #define _GNU_SOURCE
++#include <features.h>
++/* uclibc without largefile support #errors on _FILE_OFFSET_BITS=64 */
++#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_LFS__))
+ #define _FILE_OFFSET_BITS 64
++#endif
+ /* This is in order to get AT_NULL and AT_PAGESIZE. */
+ #include <elf.h>
+ /* --- !!! --- EXTERNAL HEADERS end --- !!! --- */
+diff --git a/coregrind/m_ume/elf.c b/coregrind/m_ume/elf.c
+index b5b30e5..0766c74 100644
+--- a/coregrind/m_ume/elf.c
++++ b/coregrind/m_ume/elf.c
+@@ -48,7 +48,11 @@
+ 
+ /* --- !!! --- EXTERNAL HEADERS start --- !!! --- */
+ #define _GNU_SOURCE
++#include <features.h>
++/* uclibc without largefile support #errors on _FILE_OFFSET_BITS=64 */
++#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_LFS__))
+ #define _FILE_OFFSET_BITS 64
++#endif
+ /* This is for ELF types etc, and also the AT_ constants. */
+ #include <elf.h>
+ /* --- !!! --- EXTERNAL HEADERS end --- !!! --- */
+-- 
+1.8.3.2
+
diff --git a/package/valgrind/valgrind-0003-Add-replacement-for-a.out.h.patch b/package/valgrind/valgrind-0003-Add-replacement-for-a.out.h.patch
new file mode 100644
index 0000000..f538d3c
--- /dev/null
+++ b/package/valgrind/valgrind-0003-Add-replacement-for-a.out.h.patch
@@ -0,0 +1,58 @@
+From d560106f300dd2547c659511c8668d88a50eb577 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
+Date: Thu, 2 Jan 2014 16:00:49 +0100
+Subject: [PATCH 3/3] Add replacement for <a.out.h>
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Valgrind includes <a.out.h> to get the definition of 'struct
+nlist'. However, while glibc directly defines 'struct nlist' in
+<a.out.h>, uClibc relies on it being defined by kernel headers (i.e
+<a.out.h> simply includes <linux/a.out.h>). This works for most
+architectures, but not for PowerPC, on which the a.out binary format
+has never been supported, and therefore the <linux/a.out.h> kernel
+header does not exist.
+
+One solution would have been to use the <nlist.h> header, but this one
+is only available in glibc, and it also has a slightly different
+definition than the one in <a.out.h>. So, for the time being, the
+easiest solution is to just replace the #include <a.out.h> in Valgrind
+code by a copy/paste of the 'struct nlist' definition.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
+---
+ coregrind/m_debuginfo/readstabs.c | 16 +++++++++++++++-
+ 1 file changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/coregrind/m_debuginfo/readstabs.c b/coregrind/m_debuginfo/readstabs.c
+index 70ad319..47f5bc7 100644
+--- a/coregrind/m_debuginfo/readstabs.c
++++ b/coregrind/m_debuginfo/readstabs.c
+@@ -54,7 +54,21 @@
+ 
+ /* --- !!! --- EXTERNAL HEADERS start --- !!! --- */
+ #if defined(VGO_linux)
+-#  include <a.out.h> /* stabs defns */
++/* Copied from a.out.h, because it is otherwise not available on
++   PowerPC/uClibc */
++struct nlist
++{
++  union
++    {
++      char *n_name;
++      struct nlist *n_next;
++      long n_strx;
++    } n_un;
++  unsigned char n_type;
++  char n_other;
++  short n_desc;
++  unsigned long n_value;
++};
+ #elif defined(VGO_darwin)
+ #  include <mach-o/nlist.h>
+ #  define n_other n_sect
+-- 
+1.8.3.2
+
diff --git a/package/valgrind/valgrind-add-support-for-glibc-2.17-and-2.18.patch b/package/valgrind/valgrind-add-support-for-glibc-2.17-and-2.18.patch
deleted file mode 100644
index c07dda2..0000000
--- a/package/valgrind/valgrind-add-support-for-glibc-2.17-and-2.18.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From bca21896dbdba12963aa7991d7f1b732b6a709a8 Mon Sep 17 00:00:00 2001
-From: Phil Eichinger <phil@zankapfel.net>
-Date: Wed, 23 Oct 2013 18:28:15 +0200
-Subject: [PATCH 1/1] Add support for glibc 2.17 and 2.18.
-
-
-Signed-off-by: Phil Eichinger <phil@zankapfel.net>
----
-Status: fixed in upstream r13228 & r13504, not yet released.
-
- configure.in |   16 +++++++++++++++-
- 1 file changed, 15 insertions(+), 1 deletion(-)
-
-diff --git a/configure.in b/configure.in
-index 1da3a2c..ccc60a0 100644
---- a/configure.in
-+++ b/configure.in
-@@ -906,6 +906,20 @@ case "${GLIBC_VERSION}" in
- 	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
- 	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
-+     2.17)
-+	AC_MSG_RESULT(2.17 family)
-+	AC_DEFINE([GLIBC_2_17], 1, [Define to 1 if you're using glibc 2.17.x])
-+	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	;;
-+     2.18)
-+	AC_MSG_RESULT(2.18 family)
-+	AC_DEFINE([GLIBC_2_18], 1, [Define to 1 if you're using glibc 2.18.x])
-+	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	;;
-      darwin)
- 	AC_MSG_RESULT(Darwin)
- 	AC_DEFINE([DARWIN_LIBC], 1, [Define to 1 if you're using Darwin])
-@@ -919,7 +933,7 @@ case "${GLIBC_VERSION}" in
- 
-      *)
- 	AC_MSG_RESULT([unsupported version ${GLIBC_VERSION}])
--	AC_MSG_ERROR([Valgrind requires glibc version 2.2 - 2.16])
-+	AC_MSG_ERROR([Valgrind requires glibc version 2.2 - 2.18])
- 	AC_MSG_ERROR([or Darwin libc])
- 	;;
- esac
--- 
-1.7.10.4
-
diff --git a/package/valgrind/valgrind-dont-include-a-out-header.patch b/package/valgrind/valgrind-dont-include-a-out-header.patch
deleted file mode 100644
index 2afd44a..0000000
--- a/package/valgrind/valgrind-dont-include-a-out-header.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-Add replacement for <a.out.h>
-
-Valgrind includes <a.out.h> to get the definition of 'struct
-nlist'. However, while glibc directly defines 'struct nlist' in
-<a.out.h>, uClibc relies on it being defined by kernel headers (i.e
-<a.out.h> simply includes <linux/a.out.h>). This works for most
-architectures, but not for PowerPC, on which the a.out binary format
-has never been supported, and therefore the <linux/a.out.h> kernel
-header does not exist.
-
-One solution would have been to use the <nlist.h> header, but this one
-is only available in glibc, and it also has a slightly different
-definition than the one in <a.out.h>. So, for the time being, the
-easiest solution is to just replace the #include <a.out.h> in Valgrind
-code by a copy/paste of the 'struct nlist' definition.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/coregrind/m_debuginfo/readstabs.c
-===================================================================
---- a/coregrind/m_debuginfo/readstabs.c
-+++ b/coregrind/m_debuginfo/readstabs.c
-@@ -53,7 +53,21 @@
- 
- /* --- !!! --- EXTERNAL HEADERS start --- !!! --- */
- #if defined(VGO_linux)
--#  include <a.out.h> /* stabs defns */
-+/* Copied from a.out.h, because it is otherwise not available on
-+   PowerPC/uClibc */
-+struct nlist
-+{
-+  union
-+    {
-+      char *n_name;
-+      struct nlist *n_next;
-+      long n_strx;
-+    } n_un;
-+  unsigned char n_type;
-+  char n_other;
-+  short n_desc;
-+  unsigned long n_value;
-+};
- #elif defined(VGO_darwin)
- #  include <mach-o/nlist.h>
- #  define n_other n_sect
diff --git a/package/valgrind/valgrind-fix-ccache-support.patch b/package/valgrind/valgrind-fix-ccache-support.patch
deleted file mode 100644
index 40ada8d..0000000
--- a/package/valgrind/valgrind-fix-ccache-support.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Fix link_tool_exe_linux.in to work with ccache
-
-The link_tool_exe_linux.in Perl script makes the assumption that the
-compilation command line is always:
-
-  gcc -o foobar foobar.c -someflags
-
-I.e, it assumes that the compiler is the first word of the command
-line. However, this is not true with ccache, where the command line
-is:
-
-  /path/to/ccache /path/to/crossgcc -o foobar foobar.c -someflags
-
-Therefore, we tune the script to take into account the case where
-ccache is used.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/coregrind/link_tool_exe_linux.in
-===================================================================
---- a/coregrind/link_tool_exe_linux.in
-+++ b/coregrind/link_tool_exe_linux.in
-@@ -60,8 +60,16 @@
- die "Bogus alt-load address"
-     if (length($ala) < 3 || index($ala, "0x") != 0);
- 
-+shift(@ARGV);
-+
-+if ($ARGV[0] =~ /.*ccache/) {
-+    shift(@ARGV);
-+}
-+
- # The cc invokation to do the final link
--my $cc = $ARGV[1];
-+my $cc = $ARGV[0];
-+
-+shift(@ARGV);
- 
- # and the 'restargs' are argv[2 ..]
- 
-@@ -82,7 +90,7 @@
- }
- 
- # Add the rest of the parameters
--foreach my $n (2 .. $#ARGV) {
-+foreach my $n (0 .. $#ARGV) {
-    $cmd = "$cmd $ARGV[$n]";
- }
- 
diff --git a/package/valgrind/valgrind-largefile.patch b/package/valgrind/valgrind-largefile.patch
deleted file mode 100644
index 3a8a780..0000000
--- a/package/valgrind/valgrind-largefile.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-[PATCH] valgrind: don't enable largefile support unconditionally on uClibc
-
-uClibc can be compiled without largefile support (and errors out if
-_FILE_OFFSET_BITS is set to 64), so don't define it if that combination
-is detected.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
-
-Index: b/coregrind/m_initimg/initimg-linux.c
-===================================================================
---- a/coregrind/m_initimg/initimg-linux.c
-+++ b/coregrind/m_initimg/initimg-linux.c
-@@ -55,7 +55,11 @@
- 
- /* --- !!! --- EXTERNAL HEADERS start --- !!! --- */
- #define _GNU_SOURCE
-+#include <features.h>
-+/* uclibc without largefile support #errors on _FILE_OFFSET_BITS=64 */
-+#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_LFS__))
- #define _FILE_OFFSET_BITS 64
-+#endif
- /* This is for ELF types etc, and also the AT_ constants. */
- #include <elf.h>
- /* --- !!! --- EXTERNAL HEADERS end --- !!! --- */
-Index: b/coregrind/m_main.c
-===================================================================
---- a/coregrind/m_main.c
-+++ b/coregrind/m_main.c
-@@ -2948,7 +2948,11 @@
- 
- /* --- !!! --- EXTERNAL HEADERS start --- !!! --- */
- #define _GNU_SOURCE
-+#include <features.h>
-+/* uclibc without largefile support #errors on _FILE_OFFSET_BITS=64 */
-+#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_LFS__))
- #define _FILE_OFFSET_BITS 64
-+#endif
- /* This is in order to get AT_NULL and AT_PAGESIZE. */
- #include <elf.h>
- /* --- !!! --- EXTERNAL HEADERS end --- !!! --- */
-Index: b/coregrind/m_ume/elf.c
-===================================================================
---- a/coregrind/m_ume/elf.c
-+++ b/coregrind/m_ume/elf.c
-@@ -48,7 +48,11 @@
- 
- /* --- !!! --- EXTERNAL HEADERS start --- !!! --- */
- #define _GNU_SOURCE
-+#include <features.h>
-+/* uclibc without largefile support #errors on _FILE_OFFSET_BITS=64 */
-+#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_LFS__))
- #define _FILE_OFFSET_BITS 64
-+#endif
- /* This is for ELF types etc, and also the AT_ constants. */
- #include <elf.h>
- /* --- !!! --- EXTERNAL HEADERS end --- !!! --- */
diff --git a/package/valgrind/valgrind-workaround-SIGSEGV-on-PPC.patch b/package/valgrind/valgrind-workaround-SIGSEGV-on-PPC.patch
deleted file mode 100644
index 3358c24..0000000
--- a/package/valgrind/valgrind-workaround-SIGSEGV-on-PPC.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From db894abcaa12555f60880a15840010f81d354806 Mon Sep 17 00:00:00 2001
-From: Pierre Habouzit <madcoder@debian.org>
-Date: Tue, 10 May 2011 23:11:45 +0200
-Subject: [PATCH] workaround SIGSEGV on PPC.
-
-Signed-off-by: Pierre Habouzit <madcoder@debian.org>
----
- coregrind/m_machine.c |    4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
-
-Index: b/coregrind/m_machine.c
-===================================================================
---- a/coregrind/m_machine.c
-+++ b/coregrind/m_machine.c
-@@ -27,6 +27,10 @@
-    The GNU General Public License is contained in the file COPYING.
- */
- 
-+#ifdef __powerpc__
-+#  pragma GCC optimize ("-O0")
-+#endif
-+
- #include "pub_core_basics.h"
- #include "pub_core_vki.h"
- #include "pub_core_libcsetjmp.h"   // setjmp facilities
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 953f929..a1594ce 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.8.1
+VALGRIND_VERSION = 3.9.0
 VALGRIND_SITE    = http://valgrind.org/downloads/
 VALGRIND_SOURCE  = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPLv2 GFDLv1.2
-- 
1.8.3.2
