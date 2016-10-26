From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Oct 2016 16:24:41 +0200
Subject: [Buildroot] [git commit] python-pyqt5: fix the build with Qt 5.6.2
Message-ID: <20161026142604.13E7581D8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c042622e1f1aeda4c6de8b04a5853657377302a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch to the python-pyqt5 package that fixes the
build with Qt 5.6.2.

It has been verified to fix:

  http://autobuild.buildroot.net/results/8ca61ec09cf0e6577d72fe5d809867aa284c8f1e/

And it should also fix:

  http://autobuild.buildroot.net/results/4e0c5776264a7382c842f04e333fe4ded7d14f8a/
  http://autobuild.buildroot.net/results/0306710e0f39591dba74f24aff40f7f094bcfa6e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyqt5/0002-fix-qt-5.6.2.patch | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/python-pyqt5/0002-fix-qt-5.6.2.patch b/package/python-pyqt5/0002-fix-qt-5.6.2.patch
new file mode 100644
index 0000000..a56af09
--- /dev/null
+++ b/package/python-pyqt5/0002-fix-qt-5.6.2.patch
@@ -0,0 +1,28 @@
+Fix the build with Qt 5.6.2
+
+Building PyQt 5.7 with versions of Qt older than Qt 5.7 is supposed to
+work, but currently fails in practice. In fact, this is due to the
+fact that the %Timeline variable in QtCoremod.sip didn't contain the
+5.6.2 Qt version, so if this version was used, PyQt was assuming it
+was the later version 5.7, and therefore started enabling APIs only
+available in Qt 5.7, causing build failures when building against Qt
+5.6.2.
+
+Adding Qt_5_6_2 to the timeline fixes this problem. This fix was
+suggested by Phil Thompson <phil@riverbankcomputing.com>.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: PyQt5_gpl-5.7/sip/QtCore/QtCoremod.sip
+===================================================================
+--- PyQt5_gpl-5.7.orig/sip/QtCore/QtCoremod.sip	2016-07-25 15:55:37.000000000 +0200
++++ PyQt5_gpl-5.7/sip/QtCore/QtCoremod.sip	2016-10-26 15:45:43.577153825 +0200
+@@ -22,7 +22,7 @@
+ 
+ %Module(name=PyQt5.QtCore, call_super_init=True, default_VirtualErrorHandler=PyQt5, keyword_arguments="Optional", version=1)
+ 
+-%Timeline {Qt_5_0_0 Qt_5_0_1 Qt_5_0_2 Qt_5_1_0 Qt_5_1_1 Qt_5_2_0 Qt_5_2_1 Qt_5_3_0 Qt_5_3_1 Qt_5_3_2 Qt_5_4_0 Qt_5_4_1 Qt_5_4_2 Qt_5_5_0 Qt_5_5_1 Qt_5_6_0 Qt_5_6_1 Qt_5_7_0}
++%Timeline {Qt_5_0_0 Qt_5_0_1 Qt_5_0_2 Qt_5_1_0 Qt_5_1_1 Qt_5_2_0 Qt_5_2_1 Qt_5_3_0 Qt_5_3_1 Qt_5_3_2 Qt_5_4_0 Qt_5_4_1 Qt_5_4_2 Qt_5_5_0 Qt_5_5_1 Qt_5_6_0 Qt_5_6_1 Qt_5_6_2 Qt_5_7_0}
+ 
+ %Platforms {WS_X11 WS_WIN WS_MACX}
+ 
