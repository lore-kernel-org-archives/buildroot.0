From: jzignego at hedcontrols.com <jzignego@hedcontrols.com>
Date: Tue,  3 Nov 2020 16:18:17 -0600
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5base: add -syslog option
Message-ID: <20201103221817.213528-1-jzignego@hedcontrols.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jeff Zignego <jzignego@hedcontrols.com>

When using sysvinit (or the busybox implementation) qt5 can output log
messages to the traditional syslog with the -syslog compile time
option. This is very similar to the -journald compile time option
already being leveraged in qt5base.mk

Signed-off-by: Jeff Zignego <jzignego@hedcontrols.com>
---
 package/qt5/qt5base/qt5base.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index ed308c1fa2..d9b8ff279b 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -254,6 +254,20 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-journald
 endif
 
+ifeq ($(BR2_PACKAGE_SYSVINIT),y)
+QT5BASE_CONIGURE_OPTS += -syslog
+QT5BASE_DEPENDENCIES += sysvinit
+else
+QT5BASE_CONFIGURE_OPTS += -no-syslog
+endif
+
+ifeq ($(BR2_PACKAGE_INIT_BUSYBOX),y)
+QT5BASE_CONIGURE_OPTS += -syslog
+QT5BASE_DEPENDENCIES += busybox
+else
+QT5BASE_CONFIGURE_OPTS += -no-syslog
+endif
+
 ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
 # use vivante backend
 QT5BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_viv
-- 
2.25.1
