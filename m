From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 21:50:19 +0200
Subject: [Buildroot] [git commit] qt5script: Check for QtGui before building
	the examples
Message-ID: <20140417201755.A91ED9C0C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c5e50dabf8121bb77444c2c0588f86bd47860d92
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding an upstream patch to fix an autobuild failure.

qsdbg and marshal examples need QtGui module. If QtGui is not installed
they fail to compile.

Upstream commit:
   https://github.com/qtproject/qtscript/commit/e4453c92ee41943a3a1d67a725804a44e747f64e

Fixes:
   http://autobuild.buildroot.net/results/0e6/0e63bc604f3ec422996eb0f5fd92f4437954ca04/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ck-for-QtGui-before-building-the-examples.patch |   46 ++++++++++++++++++++
 1 files changed, 46 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5script/qt5script-0001-Check-for-QtGui-before-building-the-examples.patch b/package/qt5/qt5script/qt5script-0001-Check-for-QtGui-before-building-the-examples.patch
new file mode 100644
index 0000000..b269740
--- /dev/null
+++ b/package/qt5/qt5script/qt5script-0001-Check-for-QtGui-before-building-the-examples.patch
@@ -0,0 +1,46 @@
+qt5script: Check for QtGui before building the examples
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From e4453c92ee41943a3a1d67a725804a44e747f64e Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Wed, 16 Apr 2014 12:19:17 +0100
+Subject: [PATCH] qtscript: Check for QtGui before building the examples
+
+qsdbg and marshal examples need QtGui module. If QtGui is not installed
+they fail to compile.
+
+Change-Id: I1af6a8b39a0848c8208fe94a26ee57409dfd9b41
+Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Reviewed-by: Allan Sandfeld Jensen <allan.jensen@digia.com>
+---
+ examples/script/script.pro | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/examples/script/script.pro b/examples/script/script.pro
+index 3e1eae6..cc97233 100644
+--- a/examples/script/script.pro
++++ b/examples/script/script.pro
+@@ -1,7 +1,7 @@
+ TEMPLATE = subdirs
+-SUBDIRS = \
+-    customclass \
+-    qsdbg
++SUBDIRS = customclass
++
++qtHaveModule(gui): SUBDIRS += qsdbg
+ 
+ qtHaveModule(widgets) {
+     SUBDIRS += \
+@@ -22,8 +22,7 @@ qtHaveModule(widgets) {
+ }
+ 
+ !wince {
+-    SUBDIRS += \
+-        marshal
++    qtHaveModule(gui): SUBDIRS += marshal
+ }
+ 
+ maemo5: CONFIG += qt_example
+-- 
+1.9.1
+
