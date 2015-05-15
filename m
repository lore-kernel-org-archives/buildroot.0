From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 May 2015 20:23:53 +0200
Subject: [Buildroot] [PATCH 6/6] qt5base: add patch to fix gold linker issue
In-Reply-To: <1431714233-24324-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1431714233-24324-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1431714233-24324-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The newly added patch makes sure that gold linker functionality is not
used when doing host builds, since qt5 only tests the availability of
this feature with the target compiler.

Fixes:

  http://autobuild.buildroot.net/results/f403a76ac0abbf8488373c0dffb4487f5d98c55d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0005-no-gold-linker-for-host-build.patch       | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/qt5/qt5base/0005-no-gold-linker-for-host-build.patch

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
-- 
2.1.0
