From: =?UTF-8?q?Micha=C3=ABl=20Burtin?= <michael.burtin@netgem.com>
Date: Wed, 18 Jul 2018 10:17:47 +0200
Subject: [Buildroot] [PATCH 1/2] libnghttp2: new package
Message-ID: <20180718081748.13364-1-michael.burtin@netgem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nghttp2 is an implementation of HTTP/2 and its header
compression algorithm HPACK in C.

Signed-off-by: Anisse Astier <anisse.astier.ext@netgem.com>
Signed-off-by: Micha?l Burtin <michael.burtin@netgem.com>
---
 package/Config.in                  |  1 +
 package/libnghttp2/Config.in       |  7 +++++++
 package/libnghttp2/libnghttp2.hash |  2 ++
 package/libnghttp2/libnghttp2.mk   | 22 ++++++++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/libnghttp2/Config.in
 create mode 100644 package/libnghttp2/libnghttp2.hash
 create mode 100644 package/libnghttp2/libnghttp2.mk

diff --git a/package/Config.in b/package/Config.in
index eedce83616..9f230afdee 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1454,6 +1454,7 @@ menu "Networking"
 	source "package/libnfnetlink/Config.in"
 	source "package/libnftnl/Config.in"
 	source "package/libnice/Config.in"
+	source "package/libnghttp2/Config.in"
 	source "package/libnl/Config.in"
 	source "package/liboauth/Config.in"
 	source "package/liboping/Config.in"
diff --git a/package/libnghttp2/Config.in b/package/libnghttp2/Config.in
new file mode 100644
index 0000000000..b7f4170d6d
--- /dev/null
+++ b/package/libnghttp2/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBNGHTTP2
+	bool "libnghttp2"
+	help
+		nghttp2 is an implementation of HTTP/2 and its header
+		compression algorithm HPACK in C.
+
+		https://nghttp2.org/
diff --git a/package/libnghttp2/libnghttp2.hash b/package/libnghttp2/libnghttp2.hash
new file mode 100644
index 0000000000..067e58cfbc
--- /dev/null
+++ b/package/libnghttp2/libnghttp2.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 f75e8f228217f23aa5eabfbab140e061cda00b7c21e34c891ecfb248d663303f  nghttp2-1.32.0.tar.gz
diff --git a/package/libnghttp2/libnghttp2.mk b/package/libnghttp2/libnghttp2.mk
new file mode 100644
index 0000000000..b8502dbe42
--- /dev/null
+++ b/package/libnghttp2/libnghttp2.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# nghttp2
+#
+################################################################################
+
+LIBNGHTTP2_VERSION = 1.32.0
+LIBNGHTTP2_SOURCE = nghttp2-$(LIBNGHTTP2_VERSION).tar.gz
+LIBNGHTTP2_SITE = https://github.com/nghttp2/nghttp2/releases/download/v$(LIBNGHTTP2_VERSION)
+LIBNGHTTP2_LICENSE = MIT
+LIBNGHTTP2_LICENSE_FILES = COPYING LICENSE
+LIBNGHTTP2_INSTALL_STAGING = YES
+LIBNGHTTP2_DEPENDENCIES = host-pkgconf
+LIBNGHTTP2_CONF_OPTS = --enable-lib-only
+
+define LIBNGHTTP2_INSTALL_CLEAN_HOOK
+       $(Q)rm -rf $(TARGET_DIR)/usr/share/nghttp2
+endef
+
+LIBNGHTTP2_POST_INSTALL_TARGET_HOOKS += LIBNGHTTP2_INSTALL_CLEAN_HOOK
+
+$(eval $(autotools-package))
-- 
2.13.6
