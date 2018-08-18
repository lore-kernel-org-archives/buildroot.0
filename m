From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Aug 2018 23:02:08 +0200
Subject: [Buildroot] [PATCH] python-pyqt5: add Qt 5.11 compatibility patch
Message-ID: <20180818210208.23097-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a patch to python-pyqt5 to make it build properly
against Qt 5.11.

PyQt5 is using a dual-licensing model, and the commercial company
behind it (RiverBank) only provides release tarballs, and no public
Git repository, so we cannot see the individual changes they make. By
diffing the PyQt5 5.10 and 5.11 releases, we could see that they opted
for dropping entirely support for the waitForEvents() method, rather
than keeping it for Qt < 5.11. We take the same approach in the below
patch, since this is anyway what will happen when we will bump to
PyQt5 5.11.

The patch is not Git-formatted, because there is no upstream Git
repository for this project.

Fixes:

  http://autobuild.buildroot.net/results/1f1e92374fe71a1d4343243db5f530c33db06698/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0004-drop-qttest-qtestmouse-waitforevents.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/python-pyqt5/0004-drop-qttest-qtestmouse-waitforevents.patch

diff --git a/package/python-pyqt5/0004-drop-qttest-qtestmouse-waitforevents.patch b/package/python-pyqt5/0004-drop-qttest-qtestmouse-waitforevents.patch
new file mode 100644
index 0000000000..352be9aee0
--- /dev/null
+++ b/package/python-pyqt5/0004-drop-qttest-qtestmouse-waitforevents.patch
@@ -0,0 +1,32 @@
+Drop waitForEvents() method from qtestmouse
+
+This method was dropped in Qt 5.11:
+
+  https://github.com/qt/qtbase/commit/75e583b3fcbdbbb999633eb5f2267720dd695cfa
+
+However, Python PyQt5 still generates a wrapper for it, causing a
+build failure. The upstream PyQt5 maintainers have not kept
+waitForEvents() support for older Qt versions, and instead entirely
+dropped it unconditionally. This can be verified by diffing PyQt 5.10
+and PyQt 5.11. We take the same approach, and drop waitForEvents()
+unconditionally, even when PyQt5 is built against the older Qt 5.6.
+
+Fedora is using a similar solution:
+https://src.fedoraproject.org/rpms/python-qt5/c/47fb7fdc5d16582772f9c3fc8a6a674a41a7f605?branch=master.
+
+This patch can be dropped when PyQt5 is bumped to its 5.11 version.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+
+Index: b/sip/QtTest/qtestmouse.sip
+===================================================================
+--- a/sip/QtTest/qtestmouse.sip
++++ b/sip/QtTest/qtestmouse.sip
+@@ -41,7 +41,6 @@
+     void mousePress(QWidget *widget, Qt::MouseButton button, Qt::KeyboardModifiers modifier = 0, QPoint pos = QPoint(), int delay = -1);
+     void mouseRelease(QWidget *widget, Qt::MouseButton button, Qt::KeyboardModifiers modifier = 0, QPoint pos = QPoint(), int delay = -1);
+     void mouseEvent(QTest::MouseAction action, QWidget *widget, Qt::MouseButton button, Qt::KeyboardModifiers modifier, QPoint pos, int delay = -1);
+-    void waitForEvents() /ReleaseGIL/;
+     void mouseEvent(QTest::MouseAction action, QWindow *window, Qt::MouseButton button, Qt::KeyboardModifiers modifier, QPoint pos, int delay = -1);
+     void mousePress(QWindow *window, Qt::MouseButton button, Qt::KeyboardModifiers modifier = Qt::KeyboardModifiers(), QPoint pos = QPoint(), int delay = -1);
+     void mouseRelease(QWindow *window, Qt::MouseButton button, Qt::KeyboardModifiers modifier = Qt::KeyboardModifiers(), QPoint pos = QPoint(), int delay = -1);
-- 
2.14.4
