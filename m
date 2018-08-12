From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Aug 2018 22:38:34 +0200
Subject: [Buildroot] [PATCH/next v2 1/1] package/qt5/qt5base: fix statx
 support with glibc >= 2.28
Message-ID: <20180812203834.19840-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: git-formatted patch (Thomas)
    re-sent because it did not appear on patchworks

 ...02-Fix-statx-support-with-glibc-2.28.patch | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 package/qt5/qt5base/5.11.1/0002-Fix-statx-support-with-glibc-2.28.patch

diff --git a/package/qt5/qt5base/5.11.1/0002-Fix-statx-support-with-glibc-2.28.patch b/package/qt5/qt5base/5.11.1/0002-Fix-statx-support-with-glibc-2.28.patch
new file mode 100644
index 0000000000..d7857471de
--- /dev/null
+++ b/package/qt5/qt5base/5.11.1/0002-Fix-statx-support-with-glibc-2.28.patch
@@ -0,0 +1,64 @@
+From c41b7d021309e26456cb4e2f9dd6a13aa5cea538 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 12 Aug 2018 20:14:40 +0200
+Subject: [PATCH] Fix statx support with glibc >= 2.28
+
+Ported statx-related changes from
+https://src.fedoraproject.org/cgit/rpms/qt5-qtbase.git/plain/qt5-qtbase-glibc.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ mkspecs/linux-g++/qplatformdefs.h         | 2 ++
+ src/corelib/io/qfilesystemengine_unix.cpp | 6 +++++-
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/mkspecs/linux-g++/qplatformdefs.h b/mkspecs/linux-g++/qplatformdefs.h
+index 13523f0702..d32453162c 100644
+--- a/mkspecs/linux-g++/qplatformdefs.h
++++ b/mkspecs/linux-g++/qplatformdefs.h
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
+diff --git a/src/corelib/io/qfilesystemengine_unix.cpp b/src/corelib/io/qfilesystemengine_unix.cpp
+index be6ce48d0c..5c2d3a1324 100644
+--- a/src/corelib/io/qfilesystemengine_unix.cpp
++++ b/src/corelib/io/qfilesystemengine_unix.cpp
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
+@@ -91,7 +93,9 @@ extern "C" NSString *NSTemporaryDirectory();
+ #  include <sys/syscall.h>
+ #  include <sys/sendfile.h>
+ #  include <linux/fs.h>
++#if 0
+ #  include <linux/stat.h>
++#endif
+ 
+ // in case linux/fs.h is too old and doesn't define it:
+ #ifndef FICLONE
+@@ -111,7 +115,7 @@ static int renameat2(int oldfd, const char *oldpath, int newfd, const char *newp
+ { return syscall(SYS_renameat2, oldfd, oldpath, newfd, newpath, flags); }
+ #    endif
+ 
+-#    if !QT_CONFIG(statx) && defined(SYS_statx)
++#    if 0 && !QT_CONFIG(statx) && defined(SYS_statx)
+ static int statx(int dirfd, const char *pathname, int flag, unsigned mask, struct statx *statxbuf)
+ { return syscall(SYS_statx, dirfd, pathname, flag, mask, statxbuf); }
+ #    elif !QT_CONFIG(statx) && !defined(SYS_statx)
+-- 
+2.18.0
+
-- 
2.18.0
