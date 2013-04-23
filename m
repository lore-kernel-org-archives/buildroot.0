From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 23 Apr 2013 22:18:10 +0200
Subject: [Buildroot] [git commit] zyre: new package
Message-ID: <20130423201911.967949B7F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e2a547fc53fe6c345d873ba19d9975d96b3ef484
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add comment about toolchain dependencies, fix license]
Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in      |    1 +
 package/zyre/Config.in |   17 +++++++++++++++++
 package/zyre/zyre.mk   |   22 ++++++++++++++++++++++
 3 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ad070f4..f1a3cc5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -547,6 +547,7 @@ source "package/slirp/Config.in"
 source "package/usbredir/Config.in"
 source "package/zeromq/Config.in"
 source "package/zmqpp/Config.in"
+source "package/zyre/Config.in"
 endmenu
 
 menu "Other"
diff --git a/package/zyre/Config.in b/package/zyre/Config.in
new file mode 100644
index 0000000..f181ac8
--- /dev/null
+++ b/package/zyre/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_ZYRE
+	bool "zyre"
+	depends on BR2_INSTALL_LIBSTDCPP # filemq
+	depends on BR2_INET_IPV6 # filemq
+	depends on BR2_LARGEFILE # filemq
+	depends on BR2_USE_WCHAR # filemq
+	depends on BR2_TOOLCHAIN_HAS_THREADS # filemq
+	select BR2_PACKAGE_FILEMQ
+	help
+	  An open-source framework for proximity-based peer-to-peer
+	  applications.
+
+	  http://zyre.org
+
+comment "zyre requires a toolchain with C++, IPv6, LARGEFILE, WCHAR & thread support"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
+		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/zyre/zyre.mk b/package/zyre/zyre.mk
new file mode 100644
index 0000000..5b4fadb
--- /dev/null
+++ b/package/zyre/zyre.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# zyre
+#
+#############################################################
+
+ZYRE_VERSION = 44a57a449a
+ZYRE_SITE = git://github.com/zeromq/zyre.git
+ZYRE_LICENSE = LGPLv3+
+ZYRE_LICENSE_FILES = COPYING COPYING.LESSER
+ZYRE_INSTALL_STAGING = YES
+ZYRE_DEPENDENCIES = filemq
+ZYRE_AUTORECONF = YES
+ZYRE_AUTORECONF_OPT = --install --force --verbose
+
+define ZYRE_CREATE_CONFIG_DIR
+	mkdir -p $(@D)/config
+endef
+
+ZYRE_POST_PATCH_HOOKS += ZYRE_CREATE_CONFIG_DIR
+
+$(eval $(autotools-package))
