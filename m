From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Sep 2014 13:29:02 +0200
Subject: [Buildroot] [git commit] qwt: add optional opengl support
Message-ID: <20140915113037.9391D9D6A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6de4afc3b4353327eb5a2dc57b9f449a4d14a969
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qwt should only build the opengl support code if Qt is configured with
opengl support, so add a suboption for it similar to svg/mathml with the
needed dependencies.

Fixes http://autobuild.buildroot.net/results/597/5977bd77342e28ae9783f9f9edfcf84eefd081b6/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qwt/Config.in |    6 ++++++
 package/qwt/qwt.mk    |    6 ++++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/qwt/Config.in b/package/qwt/Config.in
index 3dc6f22..7718b59 100644
--- a/package/qwt/Config.in
+++ b/package/qwt/Config.in
@@ -16,6 +16,12 @@ config BR2_PACKAGE_QWT_SVG
 config BR2_PACKAGE_QWT_MATHML
 	bool "MathML support"
 
+config BR2_PACKAGE_QWT_OPENGL
+	bool "OpenGL support"
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_QT_OPENGL_ES
+
 endif
 
 comment "qwt depends on QT gui module"
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index 3007bf7..e75d217 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -26,6 +26,12 @@ else
 	QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtMathML.*$$/\# QWT_CONFIG += QwtMathML/'
 endif
 
+ifeq ($(BR2_PACKAGE_QWT_OPENGL),y)
+	QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtOpenGL.*$$/QWT_CONFIG += QwtOpenGL/'
+else
+	QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtOpenGL.*$$/\# QWT_CONFIG += QwtOpenGL/'
+endif
+
 define QWT_CONFIGURE_CMDS
 	$(SED) $(QWT_CONFIG) $(@D)/qwtconfig.pri
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT_QMAKE))
