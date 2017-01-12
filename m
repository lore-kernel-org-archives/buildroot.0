From: William A. Kennington III <wak@google.com>
Date: Thu, 12 Jan 2017 11:15:23 -0800
Subject: [Buildroot] [PATCH v2 3/3] pblog: new package
In-Reply-To: <20170112191523.23814-1-wak@google.com>
References: <20161209011313.9549-1-wak@google.com>
 <20170112191523.23814-1-wak@google.com>
Message-ID: <20170112191523.23814-4-wak@google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using an unstable release as upstream has no release tags yet.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 package/Config.in        |  1 +
 package/pblog/Config.in  |  8 ++++++++
 package/pblog/pblog.hash |  2 ++
 package/pblog/pblog.mk   | 34 ++++++++++++++++++++++++++++++++++
 4 files changed, 45 insertions(+)
 create mode 100644 package/pblog/Config.in
 create mode 100644 package/pblog/pblog.hash
 create mode 100644 package/pblog/pblog.mk

diff --git a/package/Config.in b/package/Config.in
index 625315c1c..5f22bb100 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1146,6 +1146,7 @@ menu "Logging"
 	source "package/log4cplus/Config.in"
 	source "package/log4cpp/Config.in"
 	source "package/log4cxx/Config.in"
+	source "package/pblog/Config.in"
 	source "package/zlog/Config.in"
 endmenu
 
diff --git a/package/pblog/Config.in b/package/pblog/Config.in
new file mode 100644
index 000000000..2ef77a850
--- /dev/null
+++ b/package/pblog/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PBLOG
+	bool "pblog"
+	depends BR2_PACKAGE_HOST_NANOPB
+	select BR2_PACKAGE_HOST_NANOPB
+	help
+	  Pblog is a protobuf based logging library.
+
+	  https://github.com/google/pblog
diff --git a/package/pblog/pblog.hash b/package/pblog/pblog.hash
new file mode 100644
index 000000000..abae6d33f
--- /dev/null
+++ b/package/pblog/pblog.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 6d3ca5bfdaa16dc788876ac90fb025514b2b285b39251425e480d546ef044f13 pblog-93b05307000ee3d6b7e4276f1cbb51d71fee4b09.tar.gz
diff --git a/package/pblog/pblog.mk b/package/pblog/pblog.mk
new file mode 100644
index 000000000..4cbc41819
--- /dev/null
+++ b/package/pblog/pblog.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# pblog
+#
+################################################################################
+
+PBLOG_VERSION = 93b05307000ee3d6b7e4276f1cbb51d71fee4b09
+PBLOG_SITE = $(call github,google,pblog,$(PBLOG_VERSION))
+PBLOG_LICENSE = Apache-2.0
+PBLOG_LICENSE_FILES = LICENSE.txt
+
+PBLOG_DEPENDENCIES = host-nanopb
+
+define PBLOG_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		NANOPB_DIR=$(HOST_NANOPB_DIR) \
+		-C $(@D) all
+endef
+
+define PBLOG_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		NANOPB_DIR=$(HOST_NANOPB_DIR) \
+		DESTDIR=$(STAGING_DIR) \
+		-C $(@D) install
+endef
+
+define PBLOG_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		NANOPB_DIR=$(HOST_NANOPB_DIR) \
+		DESTDIR=$(TARGET_DIR) \
+		-C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
2.11.0
