From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 22:03:44 +0200
Subject: [Buildroot] [git commit] qt5base: fix qt_open64 related compile
 failure
Message-ID: <20181009200315.24BA08188C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20648b21f5a3438f05176f861b1f72ce94474fc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream patch fixing ([1], [2]):

  .obj/qlinuxfbscreen.o: In function `QLinuxFbScreen::initialize()':
  qlinuxfbscreen.cpp:(.text+0xa6c): undefined reference to `qt_open64(char const*, int, unsigned int)'
  qlinuxfbscreen.cpp:(.text+0x1042): undefined reference to `qt_open64(char const*, int, unsigned int)'
  qlinuxfbscreen.cpp:(.text+0x10aa): undefined reference to `qt_open64(char const*, int, unsigned int)'
  qlinuxfbscreen.cpp:(.text+0x1746): undefined reference to `qt_open64(char const*, int, unsigned int)'

[1] http://autobuild.buildroot.net/results/66f55a311dcf9d54ca6148b232287973ba226999
[2] http://autobuild.buildroot.net/results/a4759e8cea09a597dbeb82f6c673ddc531d419e8

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../5.11.2/0005-Export-qt_open64-from-QtCore.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/qt5/qt5base/5.11.2/0005-Export-qt_open64-from-QtCore.patch b/package/qt5/qt5base/5.11.2/0005-Export-qt_open64-from-QtCore.patch
new file mode 100644
index 0000000000..2fd14a282f
--- /dev/null
+++ b/package/qt5/qt5base/5.11.2/0005-Export-qt_open64-from-QtCore.patch
@@ -0,0 +1,35 @@
+From 4fc4f7b0ce0e6ee186a7d7fe9b5dd20e94efe432 Mon Sep 17 00:00:00 2001
+From: Thiago Macieira <thiago.macieira@intel.com>
+Date: Fri, 21 Sep 2018 09:04:24 -0700
+Subject: [PATCH] Export qt_open64 from QtCore
+
+Other libs use qcore_unix_p.h.
+
+qopenglprogrambinarycache.cpp:function QOpenGLProgramBinaryCache::load(QByteArray const&, unsigned int): error: undefined reference to 'qt_open64(char const*, int, unsigned int)'
+
+Change-Id: I44e7d800c68141bdaae0fffd155675d15eded2e4
+Reviewed-by: Simon Hausmann <simon.hausmann@qt.io>
+Reviewed-by: Eric Lemanissier <eric.lemanissier@gmail.com>
+
+Upstream: http://code.qt.io/cgit/qt/qtbase.git/commit/?id=4fc4f7b0ce0e6ee186a7d7fe9b5dd20e94efe432
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/corelib/kernel/qcore_unix_p.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/corelib/kernel/qcore_unix_p.h b/src/corelib/kernel/qcore_unix_p.h
+index cb98bef347..5a2a29a327 100644
+--- a/src/corelib/kernel/qcore_unix_p.h
++++ b/src/corelib/kernel/qcore_unix_p.h
+@@ -178,7 +178,7 @@ inline void qt_ignore_sigpipe()
+ 
+ #if defined(Q_PROCESSOR_X86_32) && defined(__GLIBC__)
+ #  if !__GLIBC_PREREQ(2, 22)
+-int qt_open64(const char *pathname, int flags, mode_t);
++Q_CORE_EXPORT int qt_open64(const char *pathname, int flags, mode_t);
+ #    undef QT_OPEN
+ #    define QT_OPEN qt_open64
+ #  endif
+-- 
+2.19.0
+
