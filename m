From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 19 Aug 2019 00:46:47 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-pyqt5: disable QtQuick
 module without opengl
In-Reply-To: <20190818224647.11920-1-fontaine.fabrice@gmail.com>
References: <20190818224647.11920-1-fontaine.fabrice@gmail.com>
Message-ID: <20190818224647.11920-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

QtQuick module can't be built without opengl support:

Generating the C++ source for the QtQuick module...
/home/buildroot/autobuild/run/instance-0/output/host/bin/sip -w -f -t WS_X11 -t Qt_5_12_4 -x PyQt_OpenGL -x PyQt_Desktop_OpenGL -B Qt_6_0_0 -P -y QtQuick.pyi -c /home/buildroot/autobuild/run/instance-0/output/build/python-pyqt5-5.7/QtQuick -I sip -I /home/buildroot/autobuild/run/instance-0/output/build/python-pyqt5-5.7/sip /home/buildroot/autobuild/run/instance-0/output/build/python-pyqt5-5.7/sip/QtQuick/QtQuickmod.sip
sip: QOpenGLFramebufferObject is undefined

Fixes:
 - http://autobuild.buildroot.org/results/cb69c5daa564aa9f3250faa395399cb00a445e85

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pyqt5/python-pyqt5.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
index c2398301f7..5226b1fda5 100644
--- a/package/python-pyqt5/python-pyqt5.mk
+++ b/package/python-pyqt5/python-pyqt5.mk
@@ -70,6 +70,11 @@ PYTHON_PYQT5_CONF_OPTS = \
 	--no-docstrings \
 	--no-sip-files
 
+# QtQuick module can't be built without opengl
+ifneq ($(BR2_PACKAGE_QT5BASE_OPENGL),y)
+PYTHON_PYQT5_CONF_OPTS += --disable=QtQuick
+endif
+
 define PYTHON_PYQT5_CONFIGURE_CMDS
 	$(call PYTHON_PYQT5_GENERATE_QTDETAIL,$(@D))
 	(cd $(@D); \
-- 
2.20.1
