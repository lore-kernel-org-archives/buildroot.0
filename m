From: Sam <semenak94@mail.ru>
Date: Thu,  6 Apr 2017 08:50:12 +0300
Subject: [Buildroot] [PATCH] Added fmt package
In-Reply-To: <Adding fmt package>
References: <Adding fmt package>
Message-ID: <1491457812-19634-1-git-send-email-semenak94@mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sam <semenak94@mail.ru>
---
 package/Config.in     |  1 +
 package/fmt/Config.in |  6 ++++++
 package/fmt/fmt.hash  |  2 ++
 package/fmt/fmt.mk    | 28 ++++++++++++++++++++++++++++
 4 files changed, 37 insertions(+)
 create mode 100755 package/fmt/Config.in
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
new file mode 100755
index 0000000..9e085bc
--- /dev/null
+++ b/package/fmt/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_FMT
+	bool "fmt"
+
+	help
+		fmt is an open-source formatting library for C++. It can be used
+		as a safe alternative to printf or as a fast alternative to IOStreams.
\ No newline at end of file
diff --git a/package/fmt/fmt.hash b/package/fmt/fmt.hash
new file mode 100755
index 0000000..e865da4
--- /dev/null
+++ b/package/fmt/fmt.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	93d651a754bcf6f0124669646391dd5774c0fc4d407c384e3ae76ef9a60477e8 fmt-c03f55ec3a0511611fa7f0537f858544a0ed03bd.tar.gz
diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
new file mode 100755
index 0000000..20984d3
--- /dev/null
+++ b/package/fmt/fmt.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# fmt
+#
+################################################################################
+
+FMT_VERSION = 3.0.1
+FMT_SITE = git at github.com:fmtlib/fmt.git
+FMT_SITE_METHOD = git
+FMT_LICENSE = GPLv2
+FMT_LICENSE_FILES = COPYING
+FMT_DEPENDENCIES = host-cmake
+FMT_INSTALL_STAGING = YES
+FMT_INSTALL_TARGET = NO
+
+FMT_CONF_OPTS += -DBUILD_SHARED_LIBS=ON
+FMT_CONF_OPTS += -DHAVE_OPEN=ON
+FMT_CONF_OPTS += -DFMT_INSTALL=ON
+FMT_CONF_OPTS += -DFMT_TEST=OFF
+
+define FMT_INSTALL_STAGING_CMDS
+	rm -rf $(STAGING_DIR)/usr/include/fmt
+	mkdir -p $(STAGING_DIR)/usr/include/fmt
+	$(INSTALL) -D $(@D)/fmt/*.h $(STAGING_DIR)/usr/include/fmt
+	$(INSTALL) -D $(@D)/fmt/*.cc $(STAGING_DIR)/usr/include/fmt
+endef
+
+$(eval $(cmake-package))
-- 
2.7.4
