From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Aug 2018 11:08:40 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/qt5/qt5base: fix statx support
 with glibc >= 2.28
Message-ID: <20180812090840.23436-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../qt5base/5.11.1/0002-qtbase-glibc.patch    | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/qt5/qt5base/5.11.1/0002-qtbase-glibc.patch

diff --git a/package/qt5/qt5base/5.11.1/0002-qtbase-glibc.patch b/package/qt5/qt5base/5.11.1/0002-qtbase-glibc.patch
new file mode 100644
index 0000000000..d726bb027f
--- /dev/null
+++ b/package/qt5/qt5base/5.11.1/0002-qtbase-glibc.patch
@@ -0,0 +1,52 @@
+Fix statx support with glibc >= 2.28
+
+Ported statx-related changes from
+https://src.fedoraproject.org/cgit/rpms/qt5-qtbase.git/plain/qt5-qtbase-glibc.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -up qtbase-everywhere-src-5.11.1/mkspecs/linux-g++/qplatformdefs.h.glibc qtbase-everywhere-src-5.11.1/mkspecs/linux-g++/qplatformdefs.h
+--- qtbase-everywhere-src-5.11.1/mkspecs/linux-g++/qplatformdefs.h.glibc	2018-06-15 09:29:31.000000000 +0200
++++ qtbase-everywhere-src-5.11.1/mkspecs/linux-g++/qplatformdefs.h	2018-07-26 15:40:56.887961897 +0200
+@@ -72,7 +72,9 @@
+ #include <sys/time.h>
+ #include <sys/shm.h>
+ #include <sys/socket.h>
++#if 0
+ #include <sys/stat.h>
++#endif
+ #include <sys/wait.h>
+ #include <netinet/in.h>
+ 
+diff -up qtbase-everywhere-src-5.11.1/src/corelib/io/qfilesystemengine_unix.cpp.glibc qtbase-everywhere-src-5.11.1/src/corelib/io/qfilesystemengine_unix.cpp
+--- qtbase-everywhere-src-5.11.1/src/corelib/io/qfilesystemengine_unix.cpp.glibc	2018-06-15 09:29:31.000000000 +0200
++++ qtbase-everywhere-src-5.11.1/src/corelib/io/qfilesystemengine_unix.cpp	2018-07-26 16:34:54.346840184 +0200
+@@ -50,7 +50,9 @@
+ #include <pwd.h>
+ #include <stdlib.h> // for realpath()
+ #include <sys/types.h>
++#if 0
+ #include <sys/stat.h>
++#endif
+ #include <unistd.h>
+ #include <stdio.h>
+ #include <errno.h>
+@@ -91,7 +93,9 @@
+ #  include <sys/syscall.h>
+ #  include <sys/sendfile.h>
+ #  include <linux/fs.h>
++#if 0
+ #  include <linux/stat.h>
++#endif
+ 
+ // in case linux/fs.h is too old and doesn't define it:
+ #ifndef FICLONE
+@@ -111,7 +115,7 @@
+ { return syscall(SYS_renameat2, oldfd, oldpath, newfd, newpath, flags); }
+ #    endif
+ 
+-#    if !QT_CONFIG(statx) && defined(SYS_statx)
++#    if 0 && !QT_CONFIG(statx) && defined(SYS_statx)
+ static int statx(int dirfd, const char *pathname, int flag, unsigned mask, struct statx *statxbuf)
+ { return syscall(SYS_statx, dirfd, pathname, flag, mask, statxbuf); }
+ #    elif !QT_CONFIG(statx) && !defined(SYS_statx)
-- 
2.18.0
