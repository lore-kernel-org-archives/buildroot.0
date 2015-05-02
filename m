From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 May 2015 17:13:54 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/vlc: Fix strerror_l related
	compile error
Message-ID: <1430579634-32527-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

strerror_l is not implemented by uClibc.

Fixes
http://autobuild.buildroot.net/results/ae3/ae31f4585d2c2f850473c446f1ccfba7699c711b/
http://autobuild.buildroot.net/results/504/504cf78a08315e2fc6eaeb9a29ae791972753830/
http://autobuild.buildroot.net/results/092/09280c5d63da9b8b58916c32e6040a98f7ff0ee8/
http://autobuild.buildroot.net/results/da6/da62d97ea060ce03db94f59a91d84a235d03e8f0/
http://autobuild.buildroot.net/results/7a4/7a40f66b3be8cd71a27df04415c4851cd4426cc3/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: add configure check for strerror_l (Thomas)

 package/vlc/0007-strerror.patch |   43 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/vlc/0007-strerror.patch

diff --git a/package/vlc/0007-strerror.patch b/package/vlc/0007-strerror.patch
new file mode 100644
index 0000000..e9f3141
--- /dev/null
+++ b/package/vlc/0007-strerror.patch
@@ -0,0 +1,43 @@
+Fix compile error
+
+  CCLD     vlc
+/home/br/br3/output/build/vlc-2.2.1/src/.libs/libvlccore.so: undefined reference to `strerror_l'
+
+Code for #else condition was taken from
+http://patches.osdyson.org/patch/series/view/vlc/2.2.0~rc2-1+dyson2/dyson.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr vlc-2.2.1.org/configure.ac vlc-2.2.1/configure.ac
+--- vlc-2.2.1.org/configure.ac	2015-04-13 09:57:54.000000000 +0200
++++ vlc-2.2.1/configure.ac	2015-05-02 16:13:22.800448380 +0200
+@@ -534,7 +534,7 @@
+ 
+ dnl Check for usual libc functions
+ AC_CHECK_DECLS([nanosleep],,,[#include <time.h>])
+-AC_CHECK_FUNCS([daemon fcntl fstatvfs fork getenv getpwuid_r isatty lstat memalign mmap open_memstream openat pread posix_fadvise posix_madvise setlocale stricmp strnicmp strptime uselocale])
++AC_CHECK_FUNCS([daemon fcntl fstatvfs fork getenv getpwuid_r isatty lstat memalign mmap open_memstream openat pread posix_fadvise posix_madvise setlocale strerror_l stricmp strnicmp strptime uselocale])
+ AC_REPLACE_FUNCS([atof atoll dirfd fdopendir flockfile fsync getdelim getpid gmtime_r lldiv localtime_r nrand48 poll posix_memalign rewind setenv strcasecmp strcasestr strdup strlcpy strndup strnlen strsep strtof strtok_r strtoll swab tdestroy strverscmp])
+ AC_CHECK_FUNCS(fdatasync,,
+   [AC_DEFINE(fdatasync, fsync, [Alias fdatasync() to fsync() if missing.])
+diff -uNr vlc-2.2.1.org/src/posix/error.c vlc-2.2.1/src/posix/error.c
+--- vlc-2.2.1.org/src/posix/error.c	2014-08-14 09:20:04.000000000 +0200
++++ vlc-2.2.1/src/posix/error.c	2015-05-02 16:25:24.075378369 +0200
+@@ -31,6 +31,7 @@
+ 
+ static const char *vlc_strerror_l(int errnum, const char *lname)
+ {
++#ifdef HAVE_STRERROR_L
+     int saved_errno = errno;
+     locale_t loc = newlocale(LC_MESSAGES_MASK, lname, (locale_t)0);
+ 
+@@ -51,6 +52,9 @@
+     const char *buf = strerror_l(errnum, loc);
+ 
+     freelocale(loc);
++#else
++    const char *buf = strerror(errnum);
++#endif
+     return buf;
+ }
+ 
-- 
1.7.10.4
