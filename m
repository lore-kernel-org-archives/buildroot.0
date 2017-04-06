From: Semyon Kolganov <semenak94@mail.ru>
Date: Thu,  6 Apr 2017 13:30:19 +0300
Subject: [Buildroot] [PATCH] fmt: new package
In-Reply-To: <fmt: new package>
References: <fmt: new package>
Message-ID: <1491474619-11636-1-git-send-email-semenak94@mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Semyon Kolganov <semenak94@mail.ru>
---
 package/Config.in     |  1 +
 package/fmt/Config.in |  6 ++++++
 package/fmt/fmt.hash  |  4 ++++
 package/fmt/fmt.mk    | 23 +++++++++++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 package/fmt/Config.in
 create mode 100755 package/fmt/fmt.hash
 create mode 100755 package/fmt/fmt.mk

diff --git a/package/Config.in b/package/Config.in
index 71bd44a..6f3399f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1434,6 +1434,7 @@ menu "Text and terminal handling"
 	source "package/augeas/Config.in"
 	source "package/enchant/Config.in"
 	source "package/icu/Config.in"
+	source "package/fmt/Config.in"
 	source "package/libcli/Config.in"
 	source "package/libedit/Config.in"
 	source "package/libenca/Config.in"
diff --git a/package/fmt/Config.in b/package/fmt/Config.in
new file mode 100644
index 0000000..9ce2874
--- /dev/null
+++ b/package/fmt/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_FMT
+	bool "fmt"
+	help
+	  fmt is an open-source formatting library for C++. It can be used
+	  as a safe alternative to printf or as a fast alternative to
+	  IOStreams.
\ No newline at end of file
diff --git a/package/fmt/fmt.hash b/package/fmt/fmt.hash
new file mode 100755
index 0000000..31d4eaa
--- /dev/null
+++ b/package/fmt/fmt.hash
@@ -0,0 +1,4 @@
+# Calculated on http://onlinemd5.com/
+sha1	c7026a04f05331004888bf0ab8ef2ef3c002933c fmt-3.0.1.tar.gz
+# Calculated on http://onlinemd5.com/
+sha256	dce62ab75a161dd4353a98364feb166d35e7eea382169d59d9ce842c49c55bad fmt-3.0.1.tar.gz
diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
new file mode 100755
index 0000000..47a332d
--- /dev/null
+++ b/package/fmt/fmt.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# fmt
+#
+################################################################################
+
+FMT_VERSION = 3.0.1
+FMT_SITE = $(call github,fmtlib,fmt,$(FMT_VERSION))
+FMT_LICENSE = BSD-2-Clause
+FMT_LICENSE_FILES = LICENSE.rst
+FMT_INSTALL_STAGING = YES
+
+FMT_CONF_OPTS = \
+	-DHAVE_OPEN=ON \
+	-DFMT_INSTALL=ON \
+	-DFMT_TEST=OFF
+
+define FMT_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include/fmt
+	cp -dpfr $(@D)/fmt/*.h $(STAGING_DIR)/usr/include/fmt
+endef
+
+$(eval $(cmake-package))
-- 
2.7.4
