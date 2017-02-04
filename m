From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Feb 2017 12:44:15 +0100
Subject: [Buildroot] [PATCH v3 02/38] package/libdvdread: add Kodi-specific
	patches
In-Reply-To: <20170204114451.20935-1-bernd.kuhls@t-online.de>
References: <20170204114451.20935-1-bernd.kuhls@t-online.de>
Message-ID: <20170204114451.20935-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Downloaded from
https://github.com/xbmc/libdvdread/commits/master

The Kodi build system needs .a files to create
usr/lib/kodi/system/players/VideoPlayer/libdvdnav-i486-linux.so

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...01-xbmc-libdvdread-added-defines-includes.patch | 49 ++++++++++++++++++++++
 ...dread-don-t-do-symlink-resolution-on-kodi.patch | 31 ++++++++++++++
 ...read-kodi-VFS-doesn-t-support-opendir-use.patch | 46 ++++++++++++++++++++
 package/libdvdread/libdvdread.mk                   |  6 +++
 4 files changed, 132 insertions(+)
 create mode 100644 package/libdvdread/0001-xbmc-libdvdread-added-defines-includes.patch
 create mode 100644 package/libdvdread/0002-xbmc-libdvdread-don-t-do-symlink-resolution-on-kodi.patch
 create mode 100644 package/libdvdread/0003-xbmc-libdvdread-kodi-VFS-doesn-t-support-opendir-use.patch

diff --git a/package/libdvdread/0001-xbmc-libdvdread-added-defines-includes.patch b/package/libdvdread/0001-xbmc-libdvdread-added-defines-includes.patch
new file mode 100644
index 000000000..c4abadd01
--- /dev/null
+++ b/package/libdvdread/0001-xbmc-libdvdread-added-defines-includes.patch
@@ -0,0 +1,49 @@
+From 9c1e962d20759a9b108ede7c08eb93687e54815c Mon Sep 17 00:00:00 2001
+From: Voyager1 <voyager@xbmc.org>
+Date: Sat, 20 Feb 2016 21:00:00 +0100
+Subject: [PATCH 1/3] [xbmc][libdvdread] added defines/includes
+
+Downloaded from
+https://github.com/xbmc/libdvdread/commit/9d47e8e4249187deda8c179c496c956bc475576f
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/dvd_input.h  | 7 +++++++
+ src/dvd_reader.c | 3 +++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/src/dvd_input.h b/src/dvd_input.h
+index f981d45..3d33eb1 100644
+--- a/src/dvd_input.h
++++ b/src/dvd_input.h
+@@ -34,6 +34,13 @@ typedef struct dvd_input_s *dvd_input_t;
+ #if defined( __MINGW32__ )
+ #   undef  lseek
+ #   define lseek  _lseeki64
++#   undef  fseeko
++#   define fseeko fseeko64
++#   undef  ftello
++#   define ftello ftello64
++#   define flockfile(...)
++#   define funlockfile(...)
++#   define getc_unlocked getc
+ #   undef  off_t
+ #   define off_t off64_t
+ #   undef  stat
+diff --git a/src/dvd_reader.c b/src/dvd_reader.c
+index 4e112d3..5cc06d6 100644
+--- a/src/dvd_reader.c
++++ b/src/dvd_reader.c
+@@ -33,6 +33,9 @@
+ #include <limits.h>         /* PATH_MAX */
+ #include <dirent.h>         /* opendir, readdir */
+ #include <ctype.h>          /* isalpha */
++#ifndef WIN32
++#include <paths.h>
++#endif
+ 
+ /* misc win32 helpers */
+ #ifdef WIN32
+-- 
+2.8.1
+
diff --git a/package/libdvdread/0002-xbmc-libdvdread-don-t-do-symlink-resolution-on-kodi.patch b/package/libdvdread/0002-xbmc-libdvdread-don-t-do-symlink-resolution-on-kodi.patch
new file mode 100644
index 000000000..6b54d4a1d
--- /dev/null
+++ b/package/libdvdread/0002-xbmc-libdvdread-don-t-do-symlink-resolution-on-kodi.patch
@@ -0,0 +1,31 @@
+From 1d0163563ad49eccfb855e0307a23f2ce936518d Mon Sep 17 00:00:00 2001
+From: Voyager1 <voyager@xbmc.org>
+Date: Sat, 20 Feb 2016 21:01:36 +0100
+Subject: [PATCH 2/3] [xbmc][libdvdread] don't do symlink resolution on kodi
+
+Downloaded from
+https://github.com/xbmc/libdvdread/commit/6b8858102577a06646635ed80ee03d93c6b380be
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/dvd_reader.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/dvd_reader.c b/src/dvd_reader.c
+index 5cc06d6..3c31a1c 100644
+--- a/src/dvd_reader.c
++++ b/src/dvd_reader.c
+@@ -432,8 +432,9 @@ static dvd_reader_t *DVDOpenCommon( const char *ppath,
+     if( !(path_copy = strdup( path ) ) )
+       goto DVDOpen_error;
+ 
+-#ifndef WIN32 /* don't have fchdir, and getcwd( NULL, ... ) is strange */
++#if !defined(WIN32) && !defined(_XBMC) /* don't have fchdir, and getcwd( NULL, ... ) is strange */
+               /* Also WIN32 does not have symlinks, so we don't need this bit of code. */
++              /* XBMC also doesn't need symlink resolution */
+ 
+     /* Resolve any symlinks and get the absolute dir name. */
+     {
+-- 
+2.8.1
+
diff --git a/package/libdvdread/0003-xbmc-libdvdread-kodi-VFS-doesn-t-support-opendir-use.patch b/package/libdvdread/0003-xbmc-libdvdread-kodi-VFS-doesn-t-support-opendir-use.patch
new file mode 100644
index 000000000..1264e8ac4
--- /dev/null
+++ b/package/libdvdread/0003-xbmc-libdvdread-kodi-VFS-doesn-t-support-opendir-use.patch
@@ -0,0 +1,46 @@
+From ef03bba862a026078c91675af1841ec7a25d762f Mon Sep 17 00:00:00 2001
+From: Voyager1 <voyager@xbmc.org>
+Date: Sat, 20 Feb 2016 21:02:53 +0100
+Subject: [PATCH 3/3] [xbmc][libdvdread] kodi VFS doesn't support opendir, use
+ stat instead
+
+Downloaded from
+https://github.com/xbmc/libdvdread/commit/17d99db97e7b8f23077b342369d3c22a6250affd
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/dvd_reader.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/src/dvd_reader.c b/src/dvd_reader.c
+index 3c31a1c..3c5ec90 100644
+--- a/src/dvd_reader.c
++++ b/src/dvd_reader.c
+@@ -692,6 +692,16 @@ static dvd_file_t *DVDOpenFileUDF( dvd_reader_t *dvd, const char *filename,
+  */
+ static int findDirFile( const char *path, const char *file, char *filename )
+ {
++#if defined(_XBMC)
++  struct stat fileinfo;
++
++	// no emulated opendir function in xbmc, so we'll
++	// check if the file exists by stat'ing it ...
++  sprintf(filename, "%s%s%s", path, ((path[strlen(path) - 1] == '/') ? "" : "/"), file);
++
++  if (stat(filename, &fileinfo) == 0) return 0;
++
++#else
+   DIR *dir;
+   struct dirent *ent;
+ 
+@@ -708,6 +718,7 @@ static int findDirFile( const char *path, const char *file, char *filename )
+     }
+   }
+   closedir(dir);
++#endif // _XBMC
+   return -1;
+ }
+ 
+-- 
+2.8.1
+
diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index adf79d852..63db0d5ac 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -13,4 +13,10 @@ LIBDVDREAD_LICENSE_FILES = COPYING
 LIBDVDREAD_CONF_OPTS = --with-libdvdcss
 LIBDVDREAD_DEPENDENCIES = libdvdcss host-pkgconf
 
+# enable Kodi-specific code
+ifeq ($(BR2_PACKAGE_KODI),y)
+LIBDVDREAD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -fPIC -D_XBMC"
+LIBDVDREAD_CONF_OPTS += --enable-static
+endif
+
 $(eval $(autotools-package))
-- 
2.11.0
