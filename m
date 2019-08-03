From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Aug 2019 19:39:33 +0200
Subject: [Buildroot] [git commit] package/spdlog: new package
Message-ID: <20190803173647.241998DF15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b2a4e23a4ceadab3d155130eaf9b7bfb8771e63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/spdlog/Config.in   | 12 ++++++++++++
 package/spdlog/spdlog.hash |  3 +++
 package/spdlog/spdlog.mk   | 22 ++++++++++++++++++++++
 5 files changed, 39 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5073541a97..44e3ae02af 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -229,6 +229,7 @@ F:	package/stress/
 N:	Asaf Kahlon <asafka7@gmail.com>
 F:	package/libuv/
 F:	package/python*
+F:	package/spdlog/
 F:	package/uftp/
 F:	package/zeromq/
 
diff --git a/package/Config.in b/package/Config.in
index 763616e70c..851809d80c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1494,6 +1494,7 @@ menu "Logging"
 	source "package/log4cpp/Config.in"
 	source "package/log4cxx/Config.in"
 	source "package/opentracing-cpp/Config.in"
+	source "package/spdlog/Config.in"
 	source "package/zlog/Config.in"
 endmenu
 
diff --git a/package/spdlog/Config.in b/package/spdlog/Config.in
new file mode 100644
index 0000000000..4b721774eb
--- /dev/null
+++ b/package/spdlog/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_SPDLOG
+	bool "spdlog"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR # fmt
+	select BR2_PACKAGE_FMT
+	help
+	  Very fast, header only, C++ logging library.
+
+	  https://github.com/gabime/spdlog
+
+comment "spdlog needs a toolchain w/ C++, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
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
index 0000000000..7c70f5b663
--- /dev/null
+++ b/package/spdlog/spdlog.mk
@@ -0,0 +1,22 @@
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
+SPDLOG_DEPENDENCIES = fmt
+SPDLOG_CONF_OPTS += \
+	-DSPDLOG_BUILD_TESTS=OFF \
+	-DSPDLOG_BUILD_EXAMPLES=OFF \
+	-DSPDLOG_BUILD_BENCH=OFF \
+	-DSPDLOG_FMT_EXTERNAL=ON
+
+# Header-only library
+SPDLOG_INSTALL_STAGING = YES
+SPDLOG_INSTALL_TARGET = NO
+
+$(eval $(cmake-package))
