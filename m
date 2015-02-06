From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 6 Feb 2015 16:12:19 +0000
Subject: [Buildroot] [PATCH] qt5/qt5base: Fix build on MIPS without DSP
	support
Message-ID: <1423239139-56155-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The qt_memfill32_asm_mips_dsp function is only declared if
QT_COMPILER_SUPPORTS_MIPS_DSP is defined, so we can't reference it
unless the same macro is defined.

Backporting an upstream patch to fix this issue.

This is the error message:

qt-everywhere-enterprise-src-5.4.0-alpha/qtbase/src/gui/painting/qdrawhelper.cpp:
In function 'void qInitDrawhelperAsm()':
qt-everywhere-enterprise-src-5.4.0-alpha/qtbase/src/gui/painting/qdrawhelper.cpp:6843:
error: 'qt_memfill32_asm_mips_dsp' was not declared in this scope

Upstream commit:

  https://qt.gitorious.org/qt/qtbase/commit/2ca323ccd4f25f409eff8fc0c9804099b78c2bde

Fixes:

  http://autobuild.buildroot.net/results/254/254cf62bef8bc5d5ffe345d817d16aa9983baa15/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...cpp-Fix-build-on-mips-without-dsp-support.patch |   47 ++++++++++++++++++++
 1 files changed, 47 insertions(+), 0 deletions(-)
 create mode 100644 package/qt5/qt5base/0005-qdrawhelper.cpp-Fix-build-on-mips-without-dsp-support.patch

diff --git a/package/qt5/qt5base/0005-qdrawhelper.cpp-Fix-build-on-mips-without-dsp-support.patch b/package/qt5/qt5base/0005-qdrawhelper.cpp-Fix-build-on-mips-without-dsp-support.patch
new file mode 100644
index 0000000..ede4d80
--- /dev/null
+++ b/package/qt5/qt5base/0005-qdrawhelper.cpp-Fix-build-on-mips-without-dsp-support.patch
@@ -0,0 +1,47 @@
+qdrawhelper.cpp: Fix build on MIPS without DSP support
+
+The qt_memfill32_asm_mips_dsp function is only declared if 
+QT_COMPILER_SUPPORTS_MIPS_DSP is defined, so we can't reference it 
+unless the same macro is defined.
+
+Backporting an upstream patch to fix this issue.
+
+Upstream commit:
+
+  https://qt.gitorious.org/qt/qtbase/commit/2ca323ccd4f25f409eff8fc0c9804099b78c2bde
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From 2ca323ccd4f25f409eff8fc0c9804099b78c2bde Mon Sep 17 00:00:00 2001
+From: Eskil Abrahamsen Blomfeldt <eskil.abrahamsen-blomfeldt@theqtcompany.com>
+Date: Tue, 11 Nov 2014 13:11:54 +0100
+Subject: [PATCH] Android: Compile for MIPS
+
+The qt_memfill32_asm_mips_dsp function is only declared if
+QT_COMPILER_SUPPORTS_MIPS_DSP is defined, so we can't reference it
+unless the same macro is defined.
+
+Change-Id: Ib959b4b969b699ca78804394206266469b4ebf64
+Task-number: QTBUG-36017
+Reviewed-by: Paul Olav Tvete <paul.tvete@theqtcompany.com>
+Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
+---
+ src/gui/painting/qdrawhelper.cpp |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/src/gui/painting/qdrawhelper.cpp b/src/gui/painting/qdrawhelper.cpp
+index f2d27a0..6482cc5 100644
+--- a/src/gui/painting/qdrawhelper.cpp
++++ b/src/gui/painting/qdrawhelper.cpp
+@@ -6829,7 +6829,7 @@ void qInitDrawhelperAsm()
+     qt_fetch_radial_gradient = qt_fetch_radial_gradient_neon;
+ #endif
+ 
+-#ifdef Q_PROCESSOR_MIPS_32
++#if defined(Q_PROCESSOR_MIPS_32) && defined(QT_COMPILER_SUPPORTS_MIPS_DSP)
+     qt_memfill32 = qt_memfill32_asm_mips_dsp;
+ #endif // Q_PROCESSOR_MIPS_32
+ 
+-- 
+1.7.1
+
-- 
1.7.1
