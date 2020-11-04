From: jzignego at hedcontrols.com <jzignego@hedcontrols.com>
Date: Wed,  4 Nov 2020 12:12:21 -0600
Subject: [Buildroot] [PATCH v2 1/1] package/qt5/qt5base: add -syslog option
In-Reply-To: <20201103221817.213528-1-jzignego@hedcontrols.com>
References: <20201103221817.213528-1-jzignego@hedcontrols.com>
Message-ID: <20201104181221.390041-1-jzignego@hedcontrols.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jeff Zignego <jzignego@hedcontrols.com>

QT can default to outputting the logs to syslog instead of to the
console with this compile time switch. That behavior can still be
overridden by setting the environment variable QT_LOGGING_TO_CONSOLE to
1.

Signed-off-by: Jeff Zignego <jzignego@hedcontrols.com>

---
Changes v1 -> v2:
    - all v2 changes suggested by Peter Seiderer
    - create a BR2_PACKAGE_QT5BASE_SYSLOG config option
    - only control with config option and not previous method
---
 package/qt5/qt5base/Config.in  | 5 +++++
 package/qt5/qt5base/qt5base.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index ce7230c728..ce7b5f0770 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -263,6 +263,11 @@ config BR2_PACKAGE_QT5BASE_PNG
 
 endif
 
+config BR2_PACKAGE_QT5BASE_SYSLOG
+	bool "syslog"
+	help
+	  Logs to the standard UNIX logging mechanism.
+
 config BR2_PACKAGE_QT5BASE_DBUS
 	bool "DBus module"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index ed308c1fa2..fa92625738 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -254,6 +254,12 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-journald
 endif
 
+ifeq ($(BR2_PACKAGE_QT5BASE_SYSLOG),y)
+QT5BASE_CONIGURE_OPTS += -syslog
+else
+QT5BASE_CONFIGURE_OPTS += -no-syslog
+endif
+
 ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
 # use vivante backend
 QT5BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_viv
-- 
2.25.1
