From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 May 2015 21:34:17 +0200
Subject: [Buildroot] [git commit] python-pyqt: fix opengl build failure
Message-ID: <20150506193442.F19BD81DC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c95c7f84d23b527dda6e266c57a4f469f978874
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix:
http://autobuild.buildroot.net/results/206/2062208c171207428c9121215971e00c52bf306a/

According to configure-ng.py, PyQt_NoOpenGLES must be added to qtdetail when
QT_OPENGL_ES is set.

[Thomas: add comment to explain the double negation.]

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyqt/python-pyqt.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/python-pyqt/python-pyqt.mk b/package/python-pyqt/python-pyqt.mk
index 2445567..292398d 100644
--- a/package/python-pyqt/python-pyqt.mk
+++ b/package/python-pyqt/python-pyqt.mk
@@ -40,6 +40,12 @@ ifeq ($(BR2_PACKAGE_QT_OPENSSL),)
 PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES += PyQt_OpenSSL
 endif
 
+# Yes, this looks a bit weird: when OpenGL ES is available, we have to
+# disable the feature that consists in not having OpenGL ES support.
+ifeq ($(BR2_PACKAGE_QT_OPENGL_ES),y)
+PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES += PyQt_NoOpenGLES
+endif
+
 # PyQt_qreal_double must be disabled on a number of architectures that
 # use float for qreal.
 ifeq ($(BR2_PACKAGE_PYTHON_PYQT_ARCH_USES_QREAL_FLOAT),y)
