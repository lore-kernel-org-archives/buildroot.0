From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Feb 2016 10:29:35 +0100
Subject: [Buildroot] [PATCH/next 3/4] package/libv4l: bump version to 1.10.0
In-Reply-To: <1455442176-31448-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455442176-31448-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1455442176-31448-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patches applied upstream and unneeded autoreconf call.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...-dvb-keytable-fix-missing-libintl-linking.patch |  57 -----------
 ...scall-priv.h-Use-off_t-instead-of-__off_t.patch | 111 ---------------------
 ...rly-use-ENABLE_NLS-for-locale-related-cod.patch | 110 --------------------
 ...rt-only-expose-jpeg_mem_-protoypes-when-J.patch |  56 -----------
 package/libv4l/libv4l.hash                         |   2 +-
 package/libv4l/libv4l.mk                           |   6 +-
 6 files changed, 2 insertions(+), 340 deletions(-)
 delete mode 100644 package/libv4l/0002-dvb-keytable-fix-missing-libintl-linking.patch
 delete mode 100644 package/libv4l/0003-libv4lsyscall-priv.h-Use-off_t-instead-of-__off_t.patch
 delete mode 100644 package/libv4l/0004-utils-Properly-use-ENABLE_NLS-for-locale-related-cod.patch
 delete mode 100644 package/libv4l/0005-libv4lconvert-only-expose-jpeg_mem_-protoypes-when-J.patch

diff --git a/package/libv4l/0002-dvb-keytable-fix-missing-libintl-linking.patch b/package/libv4l/0002-dvb-keytable-fix-missing-libintl-linking.patch
deleted file mode 100644
index 1b89961..0000000
--- a/package/libv4l/0002-dvb-keytable-fix-missing-libintl-linking.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 9eec274c2a92beb2bb1a3a1eeffef1988c7dd016 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Fri, 16 Oct 2015 20:32:45 +0200
-Subject: [PATCH] dvb/keytable: fix missing libintl linking
-
-Patch upstream at
-http://git.linuxtv.org/v4l-utils.git/commit/?id=ceaec539b62d83ffb5fdb5231e574a6adef0bf83.
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- utils/dvb/Makefile.am      | 8 ++++----
- utils/keytable/Makefile.am | 1 +
- 2 files changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/utils/dvb/Makefile.am b/utils/dvb/Makefile.am
-index 6aae408..a96a1a2 100644
---- a/utils/dvb/Makefile.am
-+++ b/utils/dvb/Makefile.am
-@@ -2,19 +2,19 @@ bin_PROGRAMS = dvb-fe-tool dvbv5-zap dvbv5-scan dvb-format-convert
- man_MANS = dvb-fe-tool.1 dvbv5-zap.1 dvbv5-scan.1 dvb-format-convert.1
- 
- dvb_fe_tool_SOURCES = dvb-fe-tool.c
--dvb_fe_tool_LDADD = ../../lib/libdvbv5/libdvbv5.la
-+dvb_fe_tool_LDADD = ../../lib/libdvbv5/libdvbv5.la @LIBINTL@
- dvb_fe_tool_LDFLAGS = $(ARGP_LIBS) -lm
- 
- dvbv5_zap_SOURCES = dvbv5-zap.c
--dvbv5_zap_LDADD = ../../lib/libdvbv5/libdvbv5.la
-+dvbv5_zap_LDADD = ../../lib/libdvbv5/libdvbv5.la @LIBINTL@
- dvbv5_zap_LDFLAGS = $(ARGP_LIBS) -lm
- 
- dvbv5_scan_SOURCES = dvbv5-scan.c
--dvbv5_scan_LDADD = ../../lib/libdvbv5/libdvbv5.la
-+dvbv5_scan_LDADD = ../../lib/libdvbv5/libdvbv5.la @LIBINTL@
- dvbv5_scan_LDFLAGS = $(ARGP_LIBS) -lm
- 
- dvb_format_convert_SOURCES = dvb-format-convert.c
--dvb_format_convert_LDADD = ../../lib/libdvbv5/libdvbv5.la
-+dvb_format_convert_LDADD = ../../lib/libdvbv5/libdvbv5.la @LIBINTL@
- dvb_format_convert_LDFLAGS = $(ARGP_LIBS) -lm
- 
- EXTRA_DIST = README
-diff --git a/utils/keytable/Makefile.am b/utils/keytable/Makefile.am
-index 925c8ea..8444ac2 100644
---- a/utils/keytable/Makefile.am
-+++ b/utils/keytable/Makefile.am
-@@ -5,6 +5,7 @@ keytablesystem_DATA = $(srcdir)/rc_keymaps/*
- udevrules_DATA = 70-infrared.rules
- 
- ir_keytable_SOURCES = keytable.c parse.h
-+ir_keytable_LDADD = @LIBINTL@
- ir_keytable_LDFLAGS = $(ARGP_LIBS)
- 
- EXTRA_DIST = 70-infrared.rules rc_keymaps rc_keymaps_userspace gen_keytables.pl ir-keytable.1 rc_maps.cfg
--- 
-2.1.4
-
diff --git a/package/libv4l/0003-libv4lsyscall-priv.h-Use-off_t-instead-of-__off_t.patch b/package/libv4l/0003-libv4lsyscall-priv.h-Use-off_t-instead-of-__off_t.patch
deleted file mode 100644
index 7868d71..0000000
--- a/package/libv4l/0003-libv4lsyscall-priv.h-Use-off_t-instead-of-__off_t.patch
+++ /dev/null
@@ -1,111 +0,0 @@
-From 87369a8d190a182ee087cec5164e4c9586b0d80e Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 28 Oct 2015 09:27:47 +0100
-Subject: [PATCH] libv4lsyscall-priv.h: Use off_t instead of __off_t
-
-__off_t is a kernel internal symbol, which happens to be user-visible
-with glibc, but not necessarily with other C libraries such as
-musl. In v4l-utils code, it's mainly used for the mmap() prototype,
-but the mmap() manpage really uses off_t, not __off_t.
-
-Switching from __off_t to off_t allows the code to build properly with
-musl.
-
-Patch upstream at
-http://git.linuxtv.org/v4l-utils.git/commit/?id=a6ff0635f7ed3400eec25039b96002b60a44209b.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- lib/libv4l1/v4l1compat.c               |  3 +--
- lib/libv4l2/v4l2convert.c              |  5 ++---
- lib/libv4lconvert/libv4lsyscall-priv.h | 11 +++--------
- 3 files changed, 6 insertions(+), 13 deletions(-)
-
-diff --git a/lib/libv4l1/v4l1compat.c b/lib/libv4l1/v4l1compat.c
-index 97e8c4e..e5c9e56 100644
---- a/lib/libv4l1/v4l1compat.c
-+++ b/lib/libv4l1/v4l1compat.c
-@@ -29,7 +29,6 @@
- #include <stdarg.h>
- #include <fcntl.h>
- #include <libv4l1.h>
--#include "../libv4lconvert/libv4lsyscall-priv.h" /* for __off_t */
- 
- #include <sys/ioctl.h>
- #include <sys/mman.h>
-@@ -119,7 +118,7 @@ LIBV4L_PUBLIC ssize_t read(int fd, void *buffer, size_t n)
- }
- 
- LIBV4L_PUBLIC void *mmap(void *start, size_t length, int prot, int flags, int fd,
--		__off_t offset)
-+		off_t offset)
- {
- 	return v4l1_mmap(start, length, prot, flags, fd, offset);
- }
-diff --git a/lib/libv4l2/v4l2convert.c b/lib/libv4l2/v4l2convert.c
-index a6dc30e..7b7e253 100644
---- a/lib/libv4l2/v4l2convert.c
-+++ b/lib/libv4l2/v4l2convert.c
-@@ -39,7 +39,6 @@
- #include <string.h>
- #include <sys/ioctl.h>
- #include <sys/mman.h>
--#include "../libv4lconvert/libv4lsyscall-priv.h"
- #include <linux/videodev2.h>
- #include <libv4l2.h>
- 
-@@ -151,14 +150,14 @@ LIBV4L_PUBLIC ssize_t read(int fd, void *buffer, size_t n)
- }
- 
- LIBV4L_PUBLIC void *mmap(void *start, size_t length, int prot, int flags, int fd,
--		__off_t offset)
-+		off_t offset)
- {
- 	return v4l2_mmap(start, length, prot, flags, fd, offset);
- }
- 
- #if defined(linux) && defined(__GLIBC__)
- LIBV4L_PUBLIC void *mmap64(void *start, size_t length, int prot, int flags, int fd,
--		__off64_t offset)
-+		off64_t offset)
- {
- 	return v4l2_mmap(start, length, prot, flags, fd, offset);
- }
-diff --git a/lib/libv4lconvert/libv4lsyscall-priv.h b/lib/libv4lconvert/libv4lsyscall-priv.h
-index f548fb2..f87eff4 100644
---- a/lib/libv4lconvert/libv4lsyscall-priv.h
-+++ b/lib/libv4lconvert/libv4lsyscall-priv.h
-@@ -59,11 +59,6 @@
- #define	_IOC_SIZE(cmd) IOCPARM_LEN(cmd)
- #define	MAP_ANONYMOUS MAP_ANON
- #define	MMAP2_PAGE_SHIFT 0
--typedef off_t __off_t;
--#endif
--
--#if defined(ANDROID)
--typedef off_t __off_t;
- #endif
- 
- #undef SYS_OPEN
-@@ -95,15 +90,15 @@ typedef off_t __off_t;
- #if defined(__FreeBSD__)
- #define SYS_MMAP(addr, len, prot, flags, fd, off) \
- 	__syscall(SYS_mmap, (void *)(addr), (size_t)(len), \
--			(int)(prot), (int)(flags), (int)(fd), (__off_t)(off))
-+			(int)(prot), (int)(flags), (int)(fd), (off_t)(off))
- #elif defined(__FreeBSD_kernel__)
- #define SYS_MMAP(addr, len, prot, flags, fd, off) \
- 	syscall(SYS_mmap, (void *)(addr), (size_t)(len), \
--			(int)(prot), (int)(flags), (int)(fd), (__off_t)(off))
-+			(int)(prot), (int)(flags), (int)(fd), (off_t)(off))
- #else
- #define SYS_MMAP(addr, len, prot, flags, fd, off) \
- 	syscall(SYS_mmap2, (void *)(addr), (size_t)(len), \
--			(int)(prot), (int)(flags), (int)(fd), (__off_t)((off) >> MMAP2_PAGE_SHIFT))
-+			(int)(prot), (int)(flags), (int)(fd), (off_t)((off) >> MMAP2_PAGE_SHIFT))
- #endif
- 
- #define SYS_MUNMAP(addr, len) \
--- 
-2.6.2
-
diff --git a/package/libv4l/0004-utils-Properly-use-ENABLE_NLS-for-locale-related-cod.patch b/package/libv4l/0004-utils-Properly-use-ENABLE_NLS-for-locale-related-cod.patch
deleted file mode 100644
index 2be74cc..0000000
--- a/package/libv4l/0004-utils-Properly-use-ENABLE_NLS-for-locale-related-cod.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 12e5dded4747bf3a3f1eb392a17d10e46ecbc90b Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 28 Oct 2015 09:29:08 +0100
-Subject: [PATCH] utils: Properly use ENABLE_NLS for locale related code
-
-Various tools in utils/ use ENABLE_NLS to decide whether locale
-support is available or not, and only include <locale.h> if ENABLE_NLS
-is defined. However, they unconditionally use functions defined in
-<locale.h> such as setlocale(), bindtextdomain() or textdomain(),
-which causes build failures when the prototypes of such functions are
-not available due to <locale.h> not being included.
-
-In order to fix this, we add ENABLE_NLS conditionals around the calls
-to these functions.
-
-Patch upstream at:
-http://git.linuxtv.org/v4l-utils.git/commit/?id=defad307a09c11ba989e6338bb0293c0e1acba87.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- utils/dvb/dvb-fe-tool.c        | 2 ++
- utils/dvb/dvb-format-convert.c | 2 ++
- utils/dvb/dvbv5-scan.c         | 2 ++
- utils/dvb/dvbv5-zap.c          | 2 ++
- utils/keytable/keytable.c      | 2 ++
- 5 files changed, 10 insertions(+)
-
-diff --git a/utils/dvb/dvb-fe-tool.c b/utils/dvb/dvb-fe-tool.c
-index efc2ebf..ba01aa9 100644
---- a/utils/dvb/dvb-fe-tool.c
-+++ b/utils/dvb/dvb-fe-tool.c
-@@ -276,9 +276,11 @@ int main(int argc, char *argv[])
- 	struct dvb_v5_fe_parms *parms;
- 	int fe_flags = O_RDWR;
- 
-+#ifdef ENABLE_NLS
- 	setlocale (LC_ALL, "");
- 	bindtextdomain (PACKAGE, LOCALEDIR);
- 	textdomain (PACKAGE);
-+#endif
- 
- 	argp_parse(&argp, argc, argv, ARGP_NO_HELP | ARGP_NO_EXIT, 0, 0);
- 
-diff --git a/utils/dvb/dvb-format-convert.c b/utils/dvb/dvb-format-convert.c
-index e39df03..09451d4 100644
---- a/utils/dvb/dvb-format-convert.c
-+++ b/utils/dvb/dvb-format-convert.c
-@@ -132,9 +132,11 @@ int main(int argc, char **argv)
- 		.args_doc = N_("<input file> <output file>"),
- 	};
- 
-+#ifdef ENABLE_NLS
- 	setlocale (LC_ALL, "");
- 	bindtextdomain (PACKAGE, LOCALEDIR);
- 	textdomain (PACKAGE);
-+#endif
- 
- 	memset(&args, 0, sizeof(args));
- 	argp_parse(&argp, argc, argv, ARGP_NO_HELP | ARGP_NO_EXIT, &idx, &args);
-diff --git a/utils/dvb/dvbv5-scan.c b/utils/dvb/dvbv5-scan.c
-index be1586d..1bb0ced 100644
---- a/utils/dvb/dvbv5-scan.c
-+++ b/utils/dvb/dvbv5-scan.c
-@@ -461,9 +461,11 @@ int main(int argc, char **argv)
- 		.args_doc = N_("<initial file>"),
- 	};
- 
-+#ifdef ENABLE_NLS
- 	setlocale (LC_ALL, "");
- 	bindtextdomain (PACKAGE, LOCALEDIR);
- 	textdomain (PACKAGE);
-+#endif
- 
- 	memset(&args, 0, sizeof(args));
- 	args.sat_number = -1;
-diff --git a/utils/dvb/dvbv5-zap.c b/utils/dvb/dvbv5-zap.c
-index 2812166..848259b 100644
---- a/utils/dvb/dvbv5-zap.c
-+++ b/utils/dvb/dvbv5-zap.c
-@@ -758,9 +758,11 @@ int main(int argc, char **argv)
- 		.args_doc = N_("<channel name> [or <frequency> if in monitor mode]"),
- 	};
- 
-+#ifdef ENABLE_NLS
- 	setlocale (LC_ALL, "");
- 	bindtextdomain (PACKAGE, LOCALEDIR);
- 	textdomain (PACKAGE);
-+#endif
- 
- 	memset(&args, 0, sizeof(args));
- 	args.sat_number = -1;
-diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
-index 3bf0618..d6d187f 100644
---- a/utils/keytable/keytable.c
-+++ b/utils/keytable/keytable.c
-@@ -1467,9 +1467,11 @@ int main(int argc, char *argv[])
- 	static struct sysfs_names *names;
- 	struct rc_device	  rc_dev;
- 
-+#ifdef ENABLE_NLS
- 	setlocale (LC_ALL, "");
- 	bindtextdomain (PACKAGE, LOCALEDIR);
- 	textdomain (PACKAGE);
-+#endif
- 
- 	argp_parse(&argp, argc, argv, ARGP_NO_HELP | ARGP_NO_EXIT, 0, 0);
- 
--- 
-2.6.2
-
diff --git a/package/libv4l/0005-libv4lconvert-only-expose-jpeg_mem_-protoypes-when-J.patch b/package/libv4l/0005-libv4lconvert-only-expose-jpeg_mem_-protoypes-when-J.patch
deleted file mode 100644
index 1868fd3..0000000
--- a/package/libv4l/0005-libv4lconvert-only-expose-jpeg_mem_-protoypes-when-J.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From d468d1bba973999f2f1103ebaf7df5c8440a5499 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Thu, 21 Jan 2016 10:22:16 +0100
-Subject: [PATCH] libv4lconvert: only expose jpeg_mem_*() protoypes when
- JPEG_LIB_VERSION < 80
-
-The jpeg_memsrcdest.c file implements jpeg_mem_src() and
-jpeg_mem_dest() when JPEG_LIB_VERSION < 80 in order to provide those
-functions to libv4lconvert when the libjpeg library being used is too
-old.
-
-However, the jpeg_memsrcdest.h file exposes the prototypes of those
-functions unconditionally. Until now, the prototype was matching the
-one of the functions exposed by libjpeg (when JPEG_LIB_VERSION >= 80),
-so there was no problem.
-
-But since the release of libjpeg 9b (in January 2016), they changed
-the second argument of jpeg_mem_src() from "unsigned char *" to "const
-unsigned char*". Therefore, there are two prototypes for the
-jpeg_mem_src() function: one from libjpeg, one from libv4l, and they
-conflict with each other.
-
-To resolve this situation, this patch modifies jpeg_memsrcdest.h to
-only expose the prototypes when libv4l is implementing the functions
-(i.e when JPEG_LIB_VERSION < 80). When JPEG_LIB_VERSION >= 80, the
-prototypes will come from <jpeglib.h>.
-
-Patch upstream at:
-http://git.linuxtv.org/v4l-utils.git/commit/?id=0b33f4c87cb26644ea662455acbc1649858b151f.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- lib/libv4lconvert/jpeg_memsrcdest.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/lib/libv4lconvert/jpeg_memsrcdest.h b/lib/libv4lconvert/jpeg_memsrcdest.h
-index e971182..28a6477 100644
---- a/lib/libv4lconvert/jpeg_memsrcdest.h
-+++ b/lib/libv4lconvert/jpeg_memsrcdest.h
-@@ -1,5 +1,7 @@
- #include <jpeglib.h>
- 
-+#if JPEG_LIB_VERSION < 80
-+
- void
- jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
- 	unsigned long bufsize);
-@@ -7,3 +9,5 @@ jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
- void
- jpeg_mem_dest (j_compress_ptr cinfo, unsigned char ** outbuffer,
- 	unsigned long * outsize);
-+
-+#endif
--- 
-2.6.4
-
diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
index d79ccbc..d58296f 100644
--- a/package/libv4l/libv4l.hash
+++ b/package/libv4l/libv4l.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 2f6219b03f19ea07c100e860238d5cdbfcbcfe440a14477e75137cc073431b33  v4l-utils-1.8.1.tar.bz2
+sha256	78ead27ee58a701d7c6342303cf4520bdd4a2b88a7813bc99a0b389307e4336b	v4l-utils-1.10.0.tar.bz2
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index ceb1666..bdd28bf 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,17 +4,13 @@
 #
 ################################################################################
 
-LIBV4L_VERSION = 1.8.1
+LIBV4L_VERSION = 1.10.0
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
 LIBV4L_DEPENDENCIES = host-pkgconf
 LIBV4L_CONF_OPTS = --disable-doxygen-doc
 
-# patch touches Makefile.am (and needs host-gettext for autoreconf)
-LIBV4L_AUTORECONF= YES
-LIBV4L_DEPENDENCIES += host-gettext
-
 # fix uclibc-ng configure/compile
 LIBV4L_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
-- 
2.7.0
