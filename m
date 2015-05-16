From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 May 2015 15:13:58 +0200
Subject: [Buildroot] [git commit] qt5base: add patch to fix gold linker issue
Message-ID: <20150516131800.1BEEC7FD9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a138be5d701685a6e3122fb61f267c28f18c0771
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The newly added patch makes sure that gold linker functionality is not
used when doing host builds, since qt5 only tests the availability of
this feature with the target compiler.

Fixes:

  http://autobuild.buildroot.net/results/f403a76ac0abbf8488373c0dffb4487f5d98c55d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0005-no-gold-linker-for-host-build.patch       |   27 ++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5base/0005-no-gold-linker-for-host-build.patch b/package/qt5/qt5base/0005-no-gold-linker-for-host-build.patch
new file mode 100644
index 0000000..99d5928
--- /dev/null
+++ b/package/qt5/qt5base/0005-no-gold-linker-for-host-build.patch
@@ -0,0 +1,27 @@
+Use the gold linker only for target builds
+
+Availability of the gold linker is only tested with the
+cross-compiler, not the host compiler, so Qt shouldn't assume it's
+available when doing host builds.
+
+This fixes build failures occuring when cross-compiling Qt5 with a
+gold capable cross-compiler, on a host that has a too old compiler to
+support gold.
+
+Bug reported upstream at https://bugreports.qt.io/browse/QTBUG-46125.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/mkspecs/features/default_post.prf
+===================================================================
+--- a/mkspecs/features/default_post.prf
++++ b/mkspecs/features/default_post.prf
+@@ -62,7 +62,7 @@
+     QMAKE_LIBFLAGS += $$QMAKE_LIBFLAGS_RELEASE
+ }
+ 
+-use_gold_linker: QMAKE_LFLAGS += $$QMAKE_LFLAGS_USE_GOLD
++!host_build: use_gold_linker: QMAKE_LFLAGS += $$QMAKE_LFLAGS_USE_GOLD
+ 
+ dll:win32: QMAKE_LFLAGS += $$QMAKE_LFLAGS_DLL
+ static:mac: QMAKE_LFLAGS += $$QMAKE_LFLAGS_STATIC_LIB
