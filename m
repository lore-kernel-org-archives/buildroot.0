From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  2 Feb 2017 20:08:08 +0100
Subject: [Buildroot] [PATCH v2] libv4l: qv4l2 needs c++11 (since Qt5.7)
Message-ID: <20170202190808.25242-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  .../host/usr/arm-buildroot-linux-gnueabihf/include/c++/5.4.0/bits/c++0x_warning.h:32:2: error: #error This file requires compiler and library support for the ISO C++ 2011 standard. This support must be enabled with the -std=c++11 or -std=gnu++11 compiler options.
   #error This file requires compiler and library support \
    ^
  In file included from .../host/usr/arm-buildroot-linux-gnueabihf/include/c++/5.4.0/type_traits:35:0,
                   from .../host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtCore/qglobal.h:45,

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Based on the 'qt5 bump to 5.8.0' patch series by Julien Corjon, Andreas Naumann
and Zoltan Gyarmati (see [1])

[1] http://lists.busybox.net/pipermail/buildroot/2017-January/182603.html
---
 package/libv4l/libv4l.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index d55741426..2bb088576 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -66,6 +66,10 @@ LIBV4L_CONF_ENV += \
 	ac_cv_prog_MOC=$(HOST_DIR)/usr/bin/moc \
 	ac_cv_prog_RCC=$(HOST_DIR)/usr/bin/rcc \
 	ac_cv_prog_UIC=$(HOST_DIR)/usr/bin/uic
+# since Qt5.7.x c++11 is needed (LTS Qt5.6.x is the last one without this requirement)
+ifneq ($(BR2_QT5_VERSION_5_6),y)
+LIBV4L_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+endif
 else ifeq ($(BR2_PACKAGE_QT_OPENGL_GL_DESKTOP),y)
 LIBV4L_CONF_OPTS += --enable-qv4l2
 LIBV4L_DEPENDENCIES += qt
-- 
2.11.0
