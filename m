From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jun 2015 22:05:34 +0200
Subject: [Buildroot] [git commit] glog: new package
Message-ID: <20150612201536.B8F3A80411@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=082b6f2d92510a37e386b4a651137f3276353521
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Reviewed-by: Abhimanyu Vishwakarma <abhimanyu.v@imgtec.com>
Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in      |    1 +
 package/glog/Config.in |   11 +++++++++++
 package/glog/glog.hash |    2 ++
 package/glog/glog.mk   |   17 +++++++++++++++++
 4 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 6810bd6..6dbc32d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -896,6 +896,7 @@ menu "JSON/XML"
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
