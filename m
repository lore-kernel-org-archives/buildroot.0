From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Nov 2020 14:46:22 +0100
Subject: [Buildroot] [git commit branch/next] package/qt5/qt5base: add
 -syslog option
Message-ID: <20201107133312.CE24F841BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=109df4deba86839704d902204d130714e32df0fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

QT can default to outputting the logs to syslog instead of to the
console with this compile time switch. That behavior can still be
overridden by setting the environment variable QT_LOGGING_TO_CONSOLE to
1.

Signed-off-by: Jeff Zignego <jzignego@hedcontrols.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5base/Config.in  | 5 +++++
 package/qt5/qt5base/qt5base.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index ce7230c728..ee7c757c60 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -263,6 +263,11 @@ config BR2_PACKAGE_QT5BASE_PNG
 
 endif
 
+config BR2_PACKAGE_QT5BASE_SYSLOG
+	bool "syslog support"
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
