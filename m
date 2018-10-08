From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 17:47:32 +0200
Subject: [Buildroot] [git commit] package/qt5base: drop remnants patches
 from previous version
Message-ID: <20181008154637.0090E8E431@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=197b4768c901f2182c1fb001dea467bc6b665e1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the bump to 5.11.2 was applied, master gained a new patch for 5.11.1
in-between the bump submission and the moment it was applied. That patch
still lingers around now.

Since that patch has been applied upstream (it is detected as a revert
when applied to 5.11.2), we simply drop it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0003-Fix-qmake-build-with-glibc-2.28.patch     | 74 ----------------------
 1 file changed, 74 deletions(-)

diff --git a/package/qt5/qt5base/5.11.1/0003-Fix-qmake-build-with-glibc-2.28.patch b/package/qt5/qt5base/5.11.1/0003-Fix-qmake-build-with-glibc-2.28.patch
deleted file mode 100644
index 6d8bb28992..0000000000
--- a/package/qt5/qt5base/5.11.1/0003-Fix-qmake-build-with-glibc-2.28.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 25feee4e061b99edab79503d81f5bd045c6c8e3d Mon Sep 17 00:00:00 2001
-From: Thiago Macieira <thiago.macieira@intel.com>
-Date: Tue, 7 Aug 2018 09:38:42 -0700
-Subject: [PATCH] Fix qmake build with glibc 2.28
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-We haven't yet run the configure checks to see if statx and renameat2
-are present in glibc, so this fails when we redefine the structures and
-functions.
-
-linux/stat.h:56:8: error: redefinition of 'struct statx_timestamp'
-bits/statx.h:25:8: note: previous definition of 'struct statx_timestamp'
-qfilesystemengine_unix.cpp:110:12: error: 'int renameat2(int, const char*, int, const char*, unsigned int)' was declared 'extern' and later 'static' [-fpermissive]
-
-Change-Id: Ia741b559c24d46c78fb2fffd1548a792d22e3368
-Reviewed-by: Oswald Buddenhagen <oswald.buddenhagen@qt.io>
-Reviewed-by: J??ri Valdmann <juri.valdmann@qt.io>
-
-Downloaded from upstream commit
-http://code.qt.io/cgit/qt/qtbase.git/commit/?id=25feee4e061b99edab79503d81f5bd045c6c8e3d
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/corelib/global/qconfig-bootstrapped.h | 12 ++++++++++--
- src/corelib/io/qfilesystemengine_unix.cpp |  2 +-
- 2 files changed, 11 insertions(+), 3 deletions(-)
-
-diff --git a/src/corelib/global/qconfig-bootstrapped.h b/src/corelib/global/qconfig-bootstrapped.h
-index 3469ebe5e6..c5585ea32a 100644
---- a/src/corelib/global/qconfig-bootstrapped.h
-+++ b/src/corelib/global/qconfig-bootstrapped.h
-@@ -98,10 +98,18 @@
- #define QT_NO_QOBJECT
- #define QT_FEATURE_process -1
- #define QT_FEATURE_regularexpression -1
--#define QT_FEATURE_renameat2 -1
-+#ifdef __GLIBC_PREREQ
-+# define QT_FEATURE_renameat2 (__GLIBC_PREREQ(2, 28) ? 1 : -1)
-+#else
-+# define QT_FEATURE_renameat2 -1
-+#endif
- #define QT_FEATURE_sharedmemory -1
- #define QT_FEATURE_slog2 -1
--#define QT_FEATURE_statx -1
-+#ifdef __GLIBC_PREREQ
-+# define QT_FEATURE_statx (__GLIBC_PREREQ(2, 28) ? 1 : -1)
-+#else
-+# define QT_FEATURE_statx -1
-+#endif
- #define QT_FEATURE_syslog -1
- #define QT_NO_SYSTEMLOCALE
- #define QT_FEATURE_systemsemaphore -1
-diff --git a/src/corelib/io/qfilesystemengine_unix.cpp b/src/corelib/io/qfilesystemengine_unix.cpp
-index 0c9cdb8667..deb4a9f220 100644
---- a/src/corelib/io/qfilesystemengine_unix.cpp
-+++ b/src/corelib/io/qfilesystemengine_unix.cpp
-@@ -91,7 +91,6 @@ extern "C" NSString *NSTemporaryDirectory();
- #  include <sys/syscall.h>
- #  include <sys/sendfile.h>
- #  include <linux/fs.h>
--#  include <linux/stat.h>
- 
- // in case linux/fs.h is too old and doesn't define it:
- #ifndef FICLONE
-@@ -112,6 +111,7 @@ static int renameat2(int oldfd, const char *oldpath, int newfd, const char *newp
- #    endif
- 
- #    if !QT_CONFIG(statx) && defined(SYS_statx)
-+#      include <linux/stat.h>
- static int statx(int dirfd, const char *pathname, int flag, unsigned mask, struct statx *statxbuf)
- { return syscall(SYS_statx, dirfd, pathname, flag, mask, statxbuf); }
- #    elif !QT_CONFIG(statx) && !defined(SYS_statx)
