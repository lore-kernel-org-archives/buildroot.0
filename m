From: Damien Lanson <damien@kal-host.com>
Date: Wed,  8 Jun 2016 15:47:01 +0200
Subject: [Buildroot] [PATCH 1/1] log4cpp: new package
Message-ID: <1465393621-21251-1-git-send-email-damien@kal-host.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Damien Lanson <damien@kal-host.com>
---
 package/Config.in            |    1 +
 package/log4cpp/Config.in    |   11 +++++++++++
 package/log4cpp/log4cpp.hash |    3 +++
 package/log4cpp/log4cpp.mk   |   31 +++++++++++++++++++++++++++++++
 4 files changed, 46 insertions(+)
 create mode 100755 package/log4cpp/Config.in
 create mode 100755 package/log4cpp/log4cpp.hash
 create mode 100755 package/log4cpp/log4cpp.mk

diff --git a/package/Config.in b/package/Config.in
index 4072d65..8d7c17b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1078,6 +1078,7 @@ menu "Logging"
 	source "package/liblog4c-localtime/Config.in"
 	source "package/liblogging/Config.in"
 	source "package/log4cplus/Config.in"
+	source "package/log4cpp/Config.in"
 	source "package/log4cxx/Config.in"
 	source "package/zlog/Config.in"
 endmenu
diff --git a/package/log4cpp/Config.in b/package/log4cpp/Config.in
new file mode 100755
index 0000000..6877200
--- /dev/null
+++ b/package/log4cpp/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LOG4CPP
+	bool "log4cpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Log4cpp is library of C++ classes for flexible logging to files, syslog, IDSA and other destinations.
+	  It is modeled after the Log4j Java library, staying as close to their API as is reasonable. 
+
+	  http://log4cpp.sourceforge.net/
+	  
+comment "log4cpp needs a toolchain w/ C++"
+        depends on !BR2_INSTALL_LIBSTDCPP
\ No newline at end of file
diff --git a/package/log4cpp/log4cpp.hash b/package/log4cpp/log4cpp.hash
new file mode 100755
index 0000000..eb3ccda
--- /dev/null
+++ b/package/log4cpp/log4cpp.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/log4cpp/files/log4cpp-1.1.x%20%28new%29/log4cpp-1.1/
+md5		1e173df8ee97205f412ff84aa93b8fbe			log4cpp-1.1.1.tar.gz
+sha1	23aa5bd7d6f79992c92bad3e1c6d64a34f8fcf68	log4cpp-1.1.1.tar.gz
diff --git a/package/log4cpp/log4cpp.mk b/package/log4cpp/log4cpp.mk
new file mode 100755
index 0000000..b5e1e9f
--- /dev/null
+++ b/package/log4cpp/log4cpp.mk
@@ -0,0 +1,31 @@
+#############################################################
+#
+# log4cpp
+#
+#############################################################
+
+LOG4CPP_VERSION_MAJOR = 1.1
+LOG4CPP_VERSION = $(LOG4CPP_VERSION_MAJOR).1
+LOG4CPP_SOURCE = log4cpp-$(LOG4CPP_VERSION).tar.gz
+LOG4CPP_SITE = http://downloads.sourceforge.net/project/log4cpp/log4cpp-1.1.x%20%28new%29/log4cpp-$(LOG4CPP_VERSION_MAJOR)
+LOG4CPP_LICENSE = GLPLv2.1
+LOG4CPP_LICENSE_FILES = COPYING
+LOG4CPP_INSTALL_STAGING = YES
+
+define LOG4CPP_EXTRACT_CMDS
+	tar -xf $(DL_DIR)/$(LOG4CPP_SOURCE) -C $(@D)
+	mv $(@D)/log4cpp/* $(@D)/.
+	rm -rf $(@D)/log4cpp
+endef
+
+define LOG4CPP_REMOVE_BIN
+  rm -rf $(TARGET_DIR)/usr/bin/log4cpp-config
+endef
+
+LOG4CPP_POST_INSTALL_TARGET_HOOKS += LOG4CPP_REMOVE_BIN 
+
+$(eval $(autotools-package))
+
+
+ 
+ 
-- 
1.7.10.4
