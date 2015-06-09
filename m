From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Tue, 9 Jun 2015 11:57:30 +0530
Subject: [Buildroot] [PATCH 2/2] glog: new package
In-Reply-To: <1433831250-31968-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1433831250-31968-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1433831250-31968-3-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Reviewed-by: Abhimanyu Vishwakarma <abhimanyu.v@imgtec.com>
Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 package/Config.in      |  1 +
 package/glog/Config.in | 11 +++++++++++
 package/glog/glog.hash |  2 ++
 package/glog/glog.mk   | 17 +++++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/glog/Config.in
 create mode 100644 package/glog/glog.hash
 create mode 100644 package/glog/glog.mk

diff --git a/package/Config.in b/package/Config.in
index 84248c4..1d9c972 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -892,6 +892,7 @@ menu "JSON/XML"
 endmenu
 
 menu "Logging"
+	source "package/glog/Config.in"
 	source "package/liblog4c-localtime/Config.in"
 	source "package/liblogging/Config.in"
 	source "package/log4cplus/Config.in"
diff --git a/package/glog/Config.in b/package/glog/Config.in
new file mode 100644
index 0000000..aed0a3e
--- /dev/null
+++ b/package/glog/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_GLOG
+	bool "glog"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  C++ implementation of the Google logging module
+
+	  https://github.com/google/glog
+
+comment "glog needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/glog/glog.hash b/package/glog/glog.hash
new file mode 100644
index 0000000..dad1543
--- /dev/null
+++ b/package/glog/glog.hash
@@ -0,0 +1,2 @@
+# No hash for v0.3.4, comes from the github-helper:
+none	xxx	glog-v0.3.4.tar.gz
diff --git a/package/glog/glog.mk b/package/glog/glog.mk
new file mode 100644
index 0000000..8a84094
--- /dev/null
+++ b/package/glog/glog.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# glog
+#
+################################################################################
+
+GLOG_VERSION = v0.3.4
+GLOG_SITE = $(call github,google,glog,$(GLOG_VERSION))
+GLOG_INSTALL_STAGING = YES
+GLOG_LICENSE = BSD-3c
+GLOG_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_GFLAGS),y)
+GLOG_DEPENDENCIES = gflags
+endif
+
+$(eval $(autotools-package))
-- 
1.9.1
