From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 27 Apr 2019 12:58:50 +0300
Subject: [Buildroot] [PATCH 1/1] spdlog: new package
Message-ID: <20190427095851.25375-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Very fast, header only, C++ logging library.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/spdlog/Config.in   | 10 ++++++++++
 package/spdlog/spdlog.hash |  3 +++
 package/spdlog/spdlog.mk   | 17 +++++++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 package/spdlog/Config.in
 create mode 100644 package/spdlog/spdlog.hash
 create mode 100644 package/spdlog/spdlog.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 56556413aa..8a4b90d276 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -222,6 +222,7 @@ F:	package/stress/
 N:	Asaf Kahlon <asafka7@gmail.com>
 F:	package/libuv/
 F:	package/python*
+F:	package/spdlog/
 F:	package/uftp/
 F:	package/zeromq/
 
diff --git a/package/Config.in b/package/Config.in
index f592e74a99..e822807a01 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1476,6 +1476,7 @@ menu "Logging"
 	source "package/log4cpp/Config.in"
 	source "package/log4cxx/Config.in"
 	source "package/opentracing-cpp/Config.in"
+	source "package/spdlog/Config.in"
 	source "package/zlog/Config.in"
 endmenu
 
diff --git a/package/spdlog/Config.in b/package/spdlog/Config.in
new file mode 100644
index 0000000000..30cccba785
--- /dev/null
+++ b/package/spdlog/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_SPDLOG
+	bool "spdlog"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Very fast, header only, C++ logging library.
+
+	  https://github.com/gabime/spdlog
+
+comment "spdlog needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/spdlog/spdlog.hash b/package/spdlog/spdlog.hash
new file mode 100644
index 0000000000..9cbf5b22a0
--- /dev/null
+++ b/package/spdlog/spdlog.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 160845266e94db1d4922ef755637f6901266731c4cb3b30b45bf41efa0e6ab70  spdlog-1.3.1.tar.gz
+sha256 7d40b1967fca203d22b0eaf75f54566167ded823863abedf4de869fcea057038  LICENSE
diff --git a/package/spdlog/spdlog.mk b/package/spdlog/spdlog.mk
new file mode 100644
index 0000000000..e711c72961
--- /dev/null
+++ b/package/spdlog/spdlog.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# spdlog
+#
+################################################################################
+
+SPDLOG_VERSION = 1.3.1
+SPDLOG_SITE = $(call github,gabime,spdlog,v$(SPDLOG_VERSION))
+SPDLOG_LICENSE = MIT
+SPDLOG_LICENSE_FILES = LICENSE
+SPDLOG_CONF_OPTS += -DSPDLOG_BUILD_TESTS=NO -DSPDLOG_BUILD_EXAMPLES=NO -DSPDLOG_BUILD_BENCH=NO
+
+# Header-only library
+SPDLOG_INSTALL_STAGING = YES
+SPDLOG_INSTALL_TARGET = NO
+
+$(eval $(cmake-package))
-- 
2.20.1
