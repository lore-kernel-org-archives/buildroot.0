From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 22:53:11 +0200
Subject: [Buildroot] [git commit] packages: remove non-lfs enabler patches
Message-ID: <20150401205856.5267381918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=415765b5a8861f3b7e86e9786bf903a5a4d09e73
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kexec/0001-largefile.patch                 |   22 ------
 package/links/0001-no-largefile.patch              |   26 -------
 .../mdadm/0020-uclibc-dont-force-largefile.patch   |   27 --------
 ...redefine-off64_t-as-off_t-if-no-largefile.patch |   27 --------
 package/openssl/002-dont-force-large-file.patch    |   19 -----
 package/opus-tools/0001-largefile.patch            |   37 ----------
 package/qt/0006-uClibc-lfs-fix.patch               |   41 -----------
 package/qt5/qt5base/0003-uclibc-no-lfs.patch       |   36 ----------
 package/rpm/0001-uclibc-no-lfs-fix.patch           |   22 ------
 package/stress/0001-Remove-largefile.patch         |   22 ------
 ...e-largefile-support-unconditionally-on-uC.patch |   71 --------------------
 package/vsftpd/0002-dont-force-largefile.patch     |   27 --------
 package/wipe/0001-dont-force-lfs.patch             |   16 -----
 13 files changed, 0 insertions(+), 393 deletions(-)

diff --git a/package/kexec/0001-largefile.patch b/package/kexec/0001-largefile.patch
deleted file mode 100644
index 74dd8e2..0000000
--- a/package/kexec/0001-largefile.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-[PATCH] vmcore-dmesg: don't enforce largefile handling
-
-Breaks build on !largefile toolchains.
-
-Instead simply use whatever mode is selected by toolchain / CFLAGS.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- vmcore-dmesg/vmcore-dmesg.c |    2 --
- 1 file changed, 2 deletions(-)
-
-Index: kexec-tools-2.0.3/vmcore-dmesg/vmcore-dmesg.c
-===================================================================
---- kexec-tools-2.0.3.orig/vmcore-dmesg/vmcore-dmesg.c
-+++ kexec-tools-2.0.3/vmcore-dmesg/vmcore-dmesg.c
-@@ -1,6 +1,4 @@
- #define _XOPEN_SOURCE 600
--#define _LARGEFILE_SOURCE 1
--#define _FILE_OFFSET_BITS 64
- #include <endian.h>
- #include <byteswap.h>
- #include <stdio.h>
diff --git a/package/links/0001-no-largefile.patch b/package/links/0001-no-largefile.patch
deleted file mode 100644
index 782a25a..0000000
--- a/package/links/0001-no-largefile.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Make links buildable without LFS support.
-Author/status: unknown.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura links-2.8/com-defs.h links-2.8.nonlfs/com-defs.h
---- links-2.8/com-defs.h	2013-07-31 20:45:30.000000000 -0300
-+++ links-2.8.nonlfs/com-defs.h	2014-12-28 08:42:47.352237462 -0300
-@@ -5,6 +5,9 @@
- #define __EXTENSIONS__
- #endif
- 
-+#include <features.h>
-+/* uclibc without largefile support #errors on _FILE_OFFSET_BITS=64 */
-+#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_LFS__))
- #ifndef _LARGEFILE_SOURCE
- #define _LARGEFILE_SOURCE	1
- #endif
-@@ -20,6 +23,7 @@
- #ifndef _FILE_OFFSET_BITS
- #define _FILE_OFFSET_BITS	64
- #endif
-+#endif /* UCLIBC !LFS */
- 
- #if defined(vax) && !defined(__vax)
- #define __vax	vax
diff --git a/package/mdadm/0020-uclibc-dont-force-largefile.patch b/package/mdadm/0020-uclibc-dont-force-largefile.patch
deleted file mode 100644
index fe3ab47..0000000
--- a/package/mdadm/0020-uclibc-dont-force-largefile.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-[PATCH] mdadm: don't enable largefile support unconditionally on uClibc
-
-uClibc can be compiled without largefile support (and errors out if
-_FILE_OFFSET_BITS is set to 64), so don't define it if that combination
-is detected.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- mdadm.h |    4 ++++
- 1 file changed, 4 insertions(+)
-
-Index: mdadm-3.2.6/mdadm.h
-===================================================================
---- mdadm-3.2.6.orig/mdadm.h
-+++ mdadm-3.2.6/mdadm.h
-@@ -23,7 +23,11 @@
-  */
- 
- #define	_GNU_SOURCE
-+#include <features.h>
-+/* uclibc without largefile support #errors on _FILE_OFFSET_BITS=64 */
-+#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_LFS__))
- #define _FILE_OFFSET_BITS 64
-+#endif
- #include	<unistd.h>
- #if !defined(__dietlibc__) && !defined(__KLIBC__)
- extern __off64_t lseek64 __P ((int __fd, __off64_t __offset, int __whence));
diff --git a/package/mdadm/0030-uclibc-redefine-off64_t-as-off_t-if-no-largefile.patch b/package/mdadm/0030-uclibc-redefine-off64_t-as-off_t-if-no-largefile.patch
deleted file mode 100644
index d958ab8..0000000
--- a/package/mdadm/0030-uclibc-redefine-off64_t-as-off_t-if-no-largefile.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 9c63360a2db71882cc548305774ce87af5f52b6e Mon Sep 17 00:00:00 2001
-From: Christophe Vu-Brugier <cvubrugier@lacie.com>
-Date: Thu, 7 Mar 2013 10:37:09 +0100
-Subject: [PATCH] uClibc: redefine off64_t as off_t if largefile support is
- disabled
-
-
-Signed-off-by: Christophe Vu-Brugier <cvubrugier@lacie.com>
----
- mdadm.h |    1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/mdadm.h b/mdadm.h
-index 216c31d..1c72cc4 100644
---- a/mdadm.h
-+++ b/mdadm.h
-@@ -1008,6 +1008,7 @@ struct stat64;
- # include <features.h>
- # ifndef __UCLIBC_HAS_LFS__
- #  define lseek64 lseek
-+#  define off64_t off_t
- # endif
- # ifndef  __UCLIBC_HAS_FTW__
- #  undef HAVE_FTW
--- 
-1.7.10.4
-
diff --git a/package/openssl/002-dont-force-large-file.patch b/package/openssl/002-dont-force-large-file.patch
deleted file mode 100644
index 13340d6..0000000
--- a/package/openssl/002-dont-force-large-file.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-[patch]: bss_file.c: don't force largefile mode
-
-[Adapted to version 1.0.2]
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-diff -rup a/crypto/bio/bss_file.c b/crypto/bio/bss_file.c
---- a/crypto/bio/bss_file.c	2015-01-22 14:58:32.000000000 +0000
-+++ b/crypto/bio/bss_file.c	2015-01-26 16:27:52.972519876 +0000
-@@ -78,9 +78,6 @@
-  * of 32-bit platforms which allow for sequential access of large files
-  * without extra "magic" comprise *BSD, Darwin, IRIX...
-  */
--#  ifndef _FILE_OFFSET_BITS
--#   define _FILE_OFFSET_BITS 64
--#  endif
- # endif
- 
- # include <stdio.h>
diff --git a/package/opus-tools/0001-largefile.patch b/package/opus-tools/0001-largefile.patch
deleted file mode 100644
index a10fcbc..0000000
--- a/package/opus-tools/0001-largefile.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From f1d9376b383f4ee7ec2d7c5a1728d38cdb692df6 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Date: Sat, 15 Dec 2012 00:05:41 +0100
-Subject: [PATCH] audio-in.c: Don't force largefile support
-
-Buildroot ensures the correct defines are enabled depending on toolchain
-configuration, so don't hard code largefile support here.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- src/audio-in.c |   10 ----------
- 1 file changed, 10 deletions(-)
-
-diff --git a/src/audio-in.c b/src/audio-in.c
-index 9bf4f6f..e404629 100644
---- a/src/audio-in.c
-+++ b/src/audio-in.c
-@@ -32,16 +32,6 @@
- # include <config.h>
- #endif
- 
--#if !defined(_LARGEFILE_SOURCE)
--# define _LARGEFILE_SOURCE
--#endif
--#if !defined(_LARGEFILE64_SOURCE)
--# define _LARGEFILE64_SOURCE
--#endif
--#if !defined(_FILE_OFFSET_BITS)
--# define _FILE_OFFSET_BITS 64
--#endif
--
- #include <stdlib.h>
- #include <stdio.h>
- #include <string.h>
--- 
-1.7.10.4
-
diff --git a/package/qt/0006-uClibc-lfs-fix.patch b/package/qt/0006-uClibc-lfs-fix.patch
deleted file mode 100644
index ea04a60..0000000
--- a/package/qt/0006-uClibc-lfs-fix.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 6f88b27de256266947a7f6a3e70e18510754aab2 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Date: Sat, 14 Apr 2012 20:36:07 +0200
-Subject: [PATCH] mkspecs/common/posix: fix !largefile builds on uClibc
-
-uClibc doesn't even define O_LARGEFILE when not configured with large file
-support, so ensure this define is only used when Qt is built with
--largefile, otherwise the build fails with:
-
-io/qtemporaryfile.cpp: In function 'bool createFileFromTemplate(
-	NativeFileHandle&, QFileSystemEntry::NativePath&, size_t, size_t,
-	QSystemError&)':
-io/qtemporaryfile.cpp:197:57: error: 'O_LARGEFILE' was not declared in
-	this scope
-
-Reported-Upstream: https://bugreports.qt-project.org/browse/QTBUG-25321
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- mkspecs/common/posix/qplatformdefs.h |    5 +++++
- 1 files changed, 5 insertions(+), 0 deletions(-)
-
-diff --git a/mkspecs/common/posix/qplatformdefs.h b/mkspecs/common/posix/qplatformdefs.h
-index daecc00..8a796cf 100644
---- a/mkspecs/common/posix/qplatformdefs.h
-+++ b/mkspecs/common/posix/qplatformdefs.h
-@@ -123,7 +123,12 @@
- #define QT_READ                 ::read
- #define QT_WRITE                ::write
- 
-+#ifdef QT_LARGEFILE_SUPPORT
- #define QT_OPEN_LARGEFILE       O_LARGEFILE
-+#else
-+#define QT_OPEN_LARGEFILE       0
-+#endif
-+
- #define QT_OPEN_RDONLY          O_RDONLY
- #define QT_OPEN_WRONLY          O_WRONLY
- #define QT_OPEN_RDWR            O_RDWR
--- 
-1.7.8.3
-
diff --git a/package/qt5/qt5base/0003-uclibc-no-lfs.patch b/package/qt5/qt5base/0003-uclibc-no-lfs.patch
deleted file mode 100644
index 9772d49..0000000
--- a/package/qt5/qt5base/0003-uclibc-no-lfs.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 6f88b27de256266947a7f6a3e70e18510754aab2 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Date: Sat, 14 Apr 2012 20:36:07 +0200
-Subject: [PATCH] mkspecs/common/posix: fix !largefile builds on uClibc
-
-uClibc doesn't even define O_LARGEFILE when not configured with large file
-support, so ensure this define is only used when Qt is built with
--largefile, otherwise the build fails with:
-
-io/qtemporaryfile.cpp: In function 'bool createFileFromTemplate(
-        NativeFileHandle&, QFileSystemEntry::NativePath&, size_t, size_t,
-        QSystemError&)':
-io/qtemporaryfile.cpp:197:57: error: 'O_LARGEFILE' was not declared in
-        this scope
-
-Moved to qt5 by Thomas Petazzoni.
-
-Reported-Upstream: https://bugreports.qt-project.org/browse/QTBUG-25321
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
-
-Index: b/mkspecs/common/posix/qplatformdefs.h
-===================================================================
---- a/mkspecs/common/posix/qplatformdefs.h
-+++ b/mkspecs/common/posix/qplatformdefs.h
-@@ -123,7 +123,11 @@
- #define QT_READ                 ::read
- #define QT_WRITE                ::write
- 
-+#ifdef QT_LARGEFILE_SUPPORT
- #define QT_OPEN_LARGEFILE       O_LARGEFILE
-+#else
-+#define QT_OPEN_LARGEFILE       0
-+#endif
- #define QT_OPEN_RDONLY          O_RDONLY
- #define QT_OPEN_WRONLY          O_WRONLY
- #define QT_OPEN_RDWR            O_RDWR
diff --git a/package/rpm/0001-uclibc-no-lfs-fix.patch b/package/rpm/0001-uclibc-no-lfs-fix.patch
deleted file mode 100644
index 00d0579..0000000
--- a/package/rpm/0001-uclibc-no-lfs-fix.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-[PATCH] rpm: fix build on uClibc with !LFS
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- rpmio/fts.c |    4 ++++
- 1 file changed, 4 insertions(+)
-
-Index: rpm-5.2.0/rpmio/fts.c
-===================================================================
---- rpm-5.2.0.orig/rpmio/fts.c
-+++ rpm-5.2.0/rpmio/fts.c
-@@ -47,6 +47,10 @@ static char sccsid[] = "@(#)fts.c	8.6 (B
- #else
- #if defined(__UCLIBC__)
- #   define __fxstat64(_stat_ver, _fd, _sbp)    fstat((_fd), (_sbp))
-+#   include <features.h>
-+#   ifndef __UCLIBC_HAS_LFS__
-+#     define stat64 stat
-+#   endif
- #endif
- #if defined(hpux) || defined(__hpux)
- # define        _INCLUDE_POSIX_SOURCE
diff --git a/package/stress/0001-Remove-largefile.patch b/package/stress/0001-Remove-largefile.patch
deleted file mode 100644
index bf894bc..0000000
--- a/package/stress/0001-Remove-largefile.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Remove largefile
-
-Otherwise it doesn't compile in uClibc without largefile.
-
-If the toolchain does support largefile, it will still work on large files
-anyway.
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
-Upstream status: mail sent to apw at rossby.metr.ou.edu
----
-diff -rup stress-1.0.4.orig/src/Makefile.am stress-1.0.4/src/Makefile.am
---- stress-1.0.4.orig/src/Makefile.am	2009-12-03 02:04:05.000000000 +0100
-+++ stress-1.0.4/src/Makefile.am	2012-05-04 23:09:48.229842463 +0200
-@@ -1,7 +1,5 @@
- MAINTAINERCLEANFILES = Makefile.in
- 
--AM_CFLAGS = -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
--
- bin_PROGRAMS = stress
- stress_SOURCES = stress.c
- stress_MANS = stress.1
diff --git a/package/valgrind/0002-don-t-enable-largefile-support-unconditionally-on-uC.patch b/package/valgrind/0002-don-t-enable-largefile-support-unconditionally-on-uC.patch
deleted file mode 100644
index 57ab2c3..0000000
--- a/package/valgrind/0002-don-t-enable-largefile-support-unconditionally-on-uC.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 6bb94d51e25b394bc9c52699f744a7cc06ffca15 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
-Date: Thu, 2 Jan 2014 16:00:06 +0100
-Subject: [PATCH 2/2] don't enable largefile support unconditionally on uClibc
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-uClibc can be compiled without largefile support (and errors out if
-_FILE_OFFSET_BITS is set to 64), so don't define it if that combination
-is detected.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
-Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
----
- coregrind/m_initimg/initimg-linux.c | 4 ++++
- coregrind/m_main.c                  | 4 ++++
- coregrind/m_ume/elf.c               | 4 ++++
- 3 files changed, 12 insertions(+)
-
-diff --git a/coregrind/m_initimg/initimg-linux.c b/coregrind/m_initimg/initimg-linux.c
-index a8e7d27..fa670cb 100644
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
-diff --git a/coregrind/m_main.c b/coregrind/m_main.c
-index e7159a8..4371a1f 100644
---- a/coregrind/m_main.c
-+++ b/coregrind/m_main.c
-@@ -3143,7 +3143,11 @@ asm(
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
-diff --git a/coregrind/m_ume/elf.c b/coregrind/m_ume/elf.c
-index 4615da3..06992a4 100644
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
--- 
-1.9.1
-
diff --git a/package/vsftpd/0002-dont-force-largefile.patch b/package/vsftpd/0002-dont-force-largefile.patch
deleted file mode 100644
index b66c25e..0000000
--- a/package/vsftpd/0002-dont-force-largefile.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-[PATCH] vsftpd: don't enforce largefile support
-
-In Buildroot we enable/disable largefile support globally, and pass the
-correct defines in CFLAGS, so don't enforce it unconditionally.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- sysutil.c |    6 ------
- 1 file changed, 6 deletions(-)
-
-Index: vsftpd-2.3.2/sysutil.c
-===================================================================
---- vsftpd-2.3.2.orig/sysutil.c
-+++ vsftpd-2.3.2/sysutil.c
-@@ -17,12 +17,6 @@
- #include "tunables.h"
- #include "sysdeputil.h"
- 
--/* Activate 64-bit file support on Linux/32bit plus others */
--#define _FILE_OFFSET_BITS 64
--#define _LARGEFILE_SOURCE 1
--#define _LARGEFILE64_SOURCE 1
--#define _LARGE_FILES 1
--
- /* For Linux, this adds nothing :-) */
- #include "port/porting_junk.h"
- 
diff --git a/package/wipe/0001-dont-force-lfs.patch b/package/wipe/0001-dont-force-lfs.patch
deleted file mode 100644
index 08916e2..0000000
--- a/package/wipe/0001-dont-force-lfs.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-LARGEFILE support shouldn't be forced into CFLAGS
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura wipe-2.3.1/configure.in wipe-2.3.1-lfs/configure.in
---- wipe-2.3.1/configure.in	2009-06-15 22:55:11.000000000 -0300
-+++ wipe-2.3.1-lfs/configure.in	2012-03-05 11:25:30.463221948 -0300
-@@ -91,7 +91,7 @@
- test "$with_efence" = "yes" && temp2CFLAGS="$debugCFLAGS" && LIBS="-lefence"
- 
- DEBUG="$debugCFLAGS $fullCFLAGS"
--fullCFLAGS="$temp2CFLAGS $fullCFLAGS -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
-+fullCFLAGS="$temp2CFLAGS $fullCFLAGS"
- CFLAGS="$checkCFLAGS -D__USE_BSD -D_BSD_SOURCE -D__USE_POSIX -D_POSIX_SOURCE -D_POSIX_MAPPED_FILES"
- 
- dnl Checks for libraries.
