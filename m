From: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 20 Jan 2015 11:17:28 +0100
Subject: [Buildroot] [PATCH 1/2] qwt: compile as a static lib if QT_SHARED
	is not selected
Message-ID: <1421749049-1431-1-git-send-email-richard.genoud@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If Qt is compile as a static library, there's no point compiling qwt as
a shared library, otherwise, we will have a huge qwt lib and a huge Qt
application.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 package/qwt/qwt.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index a92d6b4b1540..d783314f7e40 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -32,6 +32,12 @@ else
 	QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtOpenGL.*$$/\# QWT_CONFIG += QwtOpenGL/'
 endif
 
+ifeq ($(BR2_PACKAGE_QT_SHARED),y)
+	QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtDll.*$$/QWT_CONFIG += QwtDll/'
+else
+	QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtDll.*$$/\# QWT_CONFIG += QwtDll/'
+endif
+
 define QWT_CONFIGURE_CMDS
 	$(SED) $(QWT_CONFIG) $(@D)/qwtconfig.pri
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT_QMAKE))
-- 
2.0.0
