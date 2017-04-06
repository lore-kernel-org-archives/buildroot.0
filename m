From: Semyon Kolganov <semenak94@mail.ru>
Date: Thu,  6 Apr 2017 18:41:17 +0300
Subject: [Buildroot] [PATCHv5] fmt: new package
In-Reply-To: <fmt: new package>
References: <fmt: new package>
Message-ID: <1491493277-19334-1-git-send-email-semenak94@mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Semyon Kolganov <semenak94@mail.ru>

Changes between v4 and v5:
 - added dependcy from LIBSTDCPP to fmt

Changes between v3 and v4:
 - fixed misprint

Changes between v2 and v3:
 - removed Staging section in fmt.mk file
 - formatting fixes
 - added dependency from w/ C++

Changes between v1 and v2:
 - formatting fixes
 - added right license
 - using Github helper to download
---
 package/Config.in     |  1 +
 package/fmt/Config.in | 10 ++++++++++
 package/fmt/fmt.hash  |  4 ++++
 package/fmt/fmt.mk    | 18 ++++++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/fmt/Config.in
 create mode 100755 package/fmt/fmt.hash
 create mode 100755 package/fmt/fmt.mk

diff --git a/package/Config.in b/package/Config.in
index 71bd44a..2bd55ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1433,6 +1433,7 @@ endmenu
 menu "Text and terminal handling"
 	source "package/augeas/Config.in"
 	source "package/enchant/Config.in"
+	source "package/fmt/Config.in"
 	source "package/icu/Config.in"
 	source "package/libcli/Config.in"
 	source "package/libedit/Config.in"
diff --git a/package/fmt/Config.in b/package/fmt/Config.in
new file mode 100644
index 0000000..4c68357
--- /dev/null
+++ b/package/fmt/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_FMT
+	bool "fmt"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  fmt is an open-source formatting library for C++. It can be used
+	  as a safe alternative to printf or as a fast alternative to
+	  IOStreams.
+
+comment "fmt needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
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
index 0000000..b7e3db0
--- /dev/null
+++ b/package/fmt/fmt.mk
@@ -0,0 +1,18 @@
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
+$(eval $(cmake-package))
-- 
2.7.4
