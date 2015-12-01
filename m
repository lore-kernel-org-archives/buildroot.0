From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Dec 2015 23:00:29 +0100
Subject: [Buildroot] [PATCH 1/2] libv4l: add patches to fix musl build
	issues, and enable on musl
Message-ID: <1449007230-3175-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds two patches to the libv4l package, the first one
fixes the __off_t usage and the second one fixes locale-related
function usage. Those two patches allow libv4l to build fine against
musl, so we remove the dependency of glibc || uclibc.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...scall-priv.h-Use-off_t-instead-of-__off_t.patch | 108 +++++++++++++++++++++
 ...rly-use-ENABLE_NLS-for-locale-related-cod.patch | 107 ++++++++++++++++++++
 package/libv4l/Config.in                           |   7 +-
 3 files changed, 217 insertions(+), 5 deletions(-)
 create mode 100644 package/libv4l/0003-libv4lsyscall-priv.h-Use-off_t-instead-of-__off_t.patch
 create mode 100644 package/libv4l/0004-utils-Properly-use-ENABLE_NLS-for-locale-related-cod.patch

diff --git a/package/libv4l/0003-libv4lsyscall-priv.h-Use-off_t-instead-of-__off_t.patch b/package/libv4l/0003-libv4lsyscall-priv.h-Use-off_t-instead-of-__off_t.patch
new file mode 100644
index 0000000..015acd4
--- /dev/null
+++ b/package/libv4l/0003-libv4lsyscall-priv.h-Use-off_t-instead-of-__off_t.patch
@@ -0,0 +1,108 @@
+From 87369a8d190a182ee087cec5164e4c9586b0d80e Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 28 Oct 2015 09:27:47 +0100
+Subject: [PATCH] libv4lsyscall-priv.h: Use off_t instead of __off_t
+
+__off_t is a kernel internal symbol, which happens to be user-visible
+with glibc, but not necessarily with other C libraries such as
+musl. In v4l-utils code, it's mainly used for the mmap() prototype,
+but the mmap() manpage really uses off_t, not __off_t.
+
+Switching from __off_t to off_t allows the code to build properly with
+musl.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ lib/libv4l1/v4l1compat.c               |  3 +--
+ lib/libv4l2/v4l2convert.c              |  5 ++---
+ lib/libv4lconvert/libv4lsyscall-priv.h | 11 +++--------
+ 3 files changed, 6 insertions(+), 13 deletions(-)
+
+diff --git a/lib/libv4l1/v4l1compat.c b/lib/libv4l1/v4l1compat.c
+index 97e8c4e..e5c9e56 100644
+--- a/lib/libv4l1/v4l1compat.c
++++ b/lib/libv4l1/v4l1compat.c
+@@ -29,7 +29,6 @@
+ #include <stdarg.h>
+ #include <fcntl.h>
+ #include <libv4l1.h>
+-#include "../libv4lconvert/libv4lsyscall-priv.h" /* for __off_t */
+ 
+ #include <sys/ioctl.h>
+ #include <sys/mman.h>
+@@ -119,7 +118,7 @@ LIBV4L_PUBLIC ssize_t read(int fd, void *buffer, size_t n)
+ }
+ 
+ LIBV4L_PUBLIC void *mmap(void *start, size_t length, int prot, int flags, int fd,
+-		__off_t offset)
++		off_t offset)
+ {
+ 	return v4l1_mmap(start, length, prot, flags, fd, offset);
+ }
+diff --git a/lib/libv4l2/v4l2convert.c b/lib/libv4l2/v4l2convert.c
+index a6dc30e..7b7e253 100644
+--- a/lib/libv4l2/v4l2convert.c
++++ b/lib/libv4l2/v4l2convert.c
+@@ -39,7 +39,6 @@
+ #include <string.h>
+ #include <sys/ioctl.h>
+ #include <sys/mman.h>
+-#include "../libv4lconvert/libv4lsyscall-priv.h"
+ #include <linux/videodev2.h>
+ #include <libv4l2.h>
+ 
+@@ -151,14 +150,14 @@ LIBV4L_PUBLIC ssize_t read(int fd, void *buffer, size_t n)
+ }
+ 
+ LIBV4L_PUBLIC void *mmap(void *start, size_t length, int prot, int flags, int fd,
+-		__off_t offset)
++		off_t offset)
+ {
+ 	return v4l2_mmap(start, length, prot, flags, fd, offset);
+ }
+ 
+ #if defined(linux) && defined(__GLIBC__)
+ LIBV4L_PUBLIC void *mmap64(void *start, size_t length, int prot, int flags, int fd,
+-		__off64_t offset)
++		off64_t offset)
+ {
+ 	return v4l2_mmap(start, length, prot, flags, fd, offset);
+ }
+diff --git a/lib/libv4lconvert/libv4lsyscall-priv.h b/lib/libv4lconvert/libv4lsyscall-priv.h
+index f548fb2..f87eff4 100644
+--- a/lib/libv4lconvert/libv4lsyscall-priv.h
++++ b/lib/libv4lconvert/libv4lsyscall-priv.h
+@@ -59,11 +59,6 @@
+ #define	_IOC_SIZE(cmd) IOCPARM_LEN(cmd)
+ #define	MAP_ANONYMOUS MAP_ANON
+ #define	MMAP2_PAGE_SHIFT 0
+-typedef off_t __off_t;
+-#endif
+-
+-#if defined(ANDROID)
+-typedef off_t __off_t;
+ #endif
+ 
+ #undef SYS_OPEN
+@@ -95,15 +90,15 @@ typedef off_t __off_t;
+ #if defined(__FreeBSD__)
+ #define SYS_MMAP(addr, len, prot, flags, fd, off) \
+ 	__syscall(SYS_mmap, (void *)(addr), (size_t)(len), \
+-			(int)(prot), (int)(flags), (int)(fd), (__off_t)(off))
++			(int)(prot), (int)(flags), (int)(fd), (off_t)(off))
+ #elif defined(__FreeBSD_kernel__)
+ #define SYS_MMAP(addr, len, prot, flags, fd, off) \
+ 	syscall(SYS_mmap, (void *)(addr), (size_t)(len), \
+-			(int)(prot), (int)(flags), (int)(fd), (__off_t)(off))
++			(int)(prot), (int)(flags), (int)(fd), (off_t)(off))
+ #else
+ #define SYS_MMAP(addr, len, prot, flags, fd, off) \
+ 	syscall(SYS_mmap2, (void *)(addr), (size_t)(len), \
+-			(int)(prot), (int)(flags), (int)(fd), (__off_t)((off) >> MMAP2_PAGE_SHIFT))
++			(int)(prot), (int)(flags), (int)(fd), (off_t)((off) >> MMAP2_PAGE_SHIFT))
+ #endif
+ 
+ #define SYS_MUNMAP(addr, len) \
+-- 
+2.6.2
+
diff --git a/package/libv4l/0004-utils-Properly-use-ENABLE_NLS-for-locale-related-cod.patch b/package/libv4l/0004-utils-Properly-use-ENABLE_NLS-for-locale-related-cod.patch
new file mode 100644
index 0000000..8325234
--- /dev/null
+++ b/package/libv4l/0004-utils-Properly-use-ENABLE_NLS-for-locale-related-cod.patch
@@ -0,0 +1,107 @@
+From 12e5dded4747bf3a3f1eb392a17d10e46ecbc90b Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 28 Oct 2015 09:29:08 +0100
+Subject: [PATCH] utils: Properly use ENABLE_NLS for locale related code
+
+Various tools in utils/ use ENABLE_NLS to decide whether locale
+support is available or not, and only include <locale.h> if ENABLE_NLS
+is defined. However, they unconditionally use functions defined in
+<locale.h> such as setlocale(), bindtextdomain() or textdomain(),
+which causes build failures when the prototypes of such functions are
+not available due to <locale.h> not being included.
+
+In order to fix this, we add ENABLE_NLS conditionals around the calls
+to these functions.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ utils/dvb/dvb-fe-tool.c        | 2 ++
+ utils/dvb/dvb-format-convert.c | 2 ++
+ utils/dvb/dvbv5-scan.c         | 2 ++
+ utils/dvb/dvbv5-zap.c          | 2 ++
+ utils/keytable/keytable.c      | 2 ++
+ 5 files changed, 10 insertions(+)
+
+diff --git a/utils/dvb/dvb-fe-tool.c b/utils/dvb/dvb-fe-tool.c
+index efc2ebf..ba01aa9 100644
+--- a/utils/dvb/dvb-fe-tool.c
++++ b/utils/dvb/dvb-fe-tool.c
+@@ -276,9 +276,11 @@ int main(int argc, char *argv[])
+ 	struct dvb_v5_fe_parms *parms;
+ 	int fe_flags = O_RDWR;
+ 
++#ifdef ENABLE_NLS
+ 	setlocale (LC_ALL, "");
+ 	bindtextdomain (PACKAGE, LOCALEDIR);
+ 	textdomain (PACKAGE);
++#endif
+ 
+ 	argp_parse(&argp, argc, argv, ARGP_NO_HELP | ARGP_NO_EXIT, 0, 0);
+ 
+diff --git a/utils/dvb/dvb-format-convert.c b/utils/dvb/dvb-format-convert.c
+index e39df03..09451d4 100644
+--- a/utils/dvb/dvb-format-convert.c
++++ b/utils/dvb/dvb-format-convert.c
+@@ -132,9 +132,11 @@ int main(int argc, char **argv)
+ 		.args_doc = N_("<input file> <output file>"),
+ 	};
+ 
++#ifdef ENABLE_NLS
+ 	setlocale (LC_ALL, "");
+ 	bindtextdomain (PACKAGE, LOCALEDIR);
+ 	textdomain (PACKAGE);
++#endif
+ 
+ 	memset(&args, 0, sizeof(args));
+ 	argp_parse(&argp, argc, argv, ARGP_NO_HELP | ARGP_NO_EXIT, &idx, &args);
+diff --git a/utils/dvb/dvbv5-scan.c b/utils/dvb/dvbv5-scan.c
+index be1586d..1bb0ced 100644
+--- a/utils/dvb/dvbv5-scan.c
++++ b/utils/dvb/dvbv5-scan.c
+@@ -461,9 +461,11 @@ int main(int argc, char **argv)
+ 		.args_doc = N_("<initial file>"),
+ 	};
+ 
++#ifdef ENABLE_NLS
+ 	setlocale (LC_ALL, "");
+ 	bindtextdomain (PACKAGE, LOCALEDIR);
+ 	textdomain (PACKAGE);
++#endif
+ 
+ 	memset(&args, 0, sizeof(args));
+ 	args.sat_number = -1;
+diff --git a/utils/dvb/dvbv5-zap.c b/utils/dvb/dvbv5-zap.c
+index 2812166..848259b 100644
+--- a/utils/dvb/dvbv5-zap.c
++++ b/utils/dvb/dvbv5-zap.c
+@@ -758,9 +758,11 @@ int main(int argc, char **argv)
+ 		.args_doc = N_("<channel name> [or <frequency> if in monitor mode]"),
+ 	};
+ 
++#ifdef ENABLE_NLS
+ 	setlocale (LC_ALL, "");
+ 	bindtextdomain (PACKAGE, LOCALEDIR);
+ 	textdomain (PACKAGE);
++#endif
+ 
+ 	memset(&args, 0, sizeof(args));
+ 	args.sat_number = -1;
+diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
+index 3bf0618..d6d187f 100644
+--- a/utils/keytable/keytable.c
++++ b/utils/keytable/keytable.c
+@@ -1467,9 +1467,11 @@ int main(int argc, char *argv[])
+ 	static struct sysfs_names *names;
+ 	struct rc_device	  rc_dev;
+ 
++#ifdef ENABLE_NLS
+ 	setlocale (LC_ALL, "");
+ 	bindtextdomain (PACKAGE, LOCALEDIR);
+ 	textdomain (PACKAGE);
++#endif
+ 
+ 	argp_parse(&argp, argc, argv, ARGP_NO_HELP | ARGP_NO_EXIT, 0, 0);
+ 
+-- 
+2.6.2
+
diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index 16dc6bb..078a8c9 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -5,8 +5,6 @@ config BR2_PACKAGE_LIBV4L
 	depends on !BR2_STATIC_LIBS # dlopen()
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # media headers
-	# wait for libv4l 1.7+ for musl compatibility
-	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
@@ -40,8 +38,7 @@ config BR2_PACKAGE_LIBV4L_UTILS
 
 endif
 
-comment "libv4l needs an uClibc or (e)glibc toolchain w/ threads, dynamic library, C++ and headers >= 3.0"
+comment "libv4l needs a toolchain w/ threads, dynamic library, C++ and headers >= 3.0"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 \
-		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-- 
2.6.3
