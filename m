From: William A. Kennington III <wak@google.com>
Date: Thu,  8 Dec 2016 17:13:13 -0800
Subject: [Buildroot] [PATCH 3/3] pblog: Init at
	e2e17544950eedac4f3bc59926aed8604d755072
In-Reply-To: <20161209011313.9549-1-wak@google.com>
References: <20161209011313.9549-1-wak@google.com>
Message-ID: <20161209011313.9549-4-wak@google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using an unstable release as upstream has no release tags yet.

Google-Bug-Id: 33072942
Change-Id: Ieca458abea29de68fd9124a9782f3f27e71582d6
Signed-off-by: William A. Kennington III <wak@google.com>
---
  package/Config.in        |  1 +
  package/pblog/Config.in  |  8 ++++++++
  package/pblog/pblog.hash |  2 ++
  package/pblog/pblog.mk   | 27 +++++++++++++++++++++++++++
  4 files changed, 38 insertions(+)
  create mode 100644 package/pblog/Config.in
  create mode 100644 package/pblog/pblog.hash
  create mode 100644 package/pblog/pblog.mk

diff --git a/package/Config.in b/package/Config.in
index 2ffbcc1..122364d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1132,6 +1132,7 @@ menu "Logging"
  	source "package/log4cplus/Config.in"
  	source "package/log4cpp/Config.in"
  	source "package/log4cxx/Config.in"
+	source "package/pblog/Config.in"
  	source "package/zlog/Config.in"
  endmenu

diff --git a/package/pblog/Config.in b/package/pblog/Config.in
new file mode 100644
index 0000000..2ef77a8
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
index 0000000..e7f8dc5
--- /dev/null
+++ b/package/pblog/pblog.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 f5908706afe15041983f163da735db751dda82f20c84e60c0c59584d609f10eb  
pblog-e2e17544950eedac4f3bc59926aed8604d755072.tar.gz
diff --git a/package/pblog/pblog.mk b/package/pblog/pblog.mk
new file mode 100644
index 0000000..e5a2cd1
--- /dev/null
+++ b/package/pblog/pblog.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# pblog
+#
+################################################################################
+
+PBLOG_VERSION = e2e17544950eedac4f3bc59926aed8604d755072
+PBLOG_SITE = $(call github,google,pblog,$(PBLOG_VERSION))
+PBLOG_LICENSE = Apache-2.0
+PBLOG_LICENSE_FILES = LICENSE.txt
+# no configure script
+
+PBLOG_DEPENDENCIES = host-nanopb
+
+define PBLOG_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS)  
NANOPB_DIR=$(HOST_NANOPB_DIR) -C $(@D) all
+endef
+
+define PBLOG_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS)  
NANOPB_DIR=$(HOST_NANOPB_DIR) DESTDIR=$(STAGING_DIR) -C $(@D) install
+endef
+
+define PBLOG_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS)  
NANOPB_DIR=$(HOST_NANOPB_DIR) DESTDIR=$(TARGET_DIR) -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
2.8.0.rc3.226.g39d4020
