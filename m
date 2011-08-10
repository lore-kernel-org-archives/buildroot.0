From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 10 Aug 2011 10:41:05 +0200
Subject: [Buildroot] [PATCH 1/3] new package: gssdp
Message-ID: <1312965667-15157-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GSSDP implements resource discovery and announcement over SSDP.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/Config.in       |    1 +
 package/gssdp/Config.in |   11 +++++++++++
 package/gssdp/gssdp.mk  |   17 +++++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100755 package/gssdp/Config.in
 create mode 100755 package/gssdp/gssdp.mk

diff --git a/package/Config.in b/package/Config.in
index 7112e05..5d6b402 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -316,6 +316,7 @@ endmenu
 endif
 
 menu "Networking"
+source "package/gssdp/Config.in"
 source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"
 source "package/libcurl/Config.in"
diff --git a/package/gssdp/Config.in b/package/gssdp/Config.in
new file mode 100755
index 0000000..7287e69
--- /dev/null
+++ b/package/gssdp/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_GSSDP
+	bool "gssdp"
+	select BR2_PACKAGE_LIBSOUP
+	depends on BR2_USE_WCHAR
+	help
+          GSSDP implements resource discovery and announcement over SSDP.
+
+	  http://www.gupnp.org
+
+comment "gssdp requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
new file mode 100755
index 0000000..0094ecc
--- /dev/null
+++ b/package/gssdp/gssdp.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# gssdp
+#
+#############################################################
+
+GSSDP_VERSION = 0.8.2
+GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.gz
+GSSDP_SITE = http://www.gupnp.org/sites/all/files/sources
+GSSDP_INSTALL_STAGING = YES
+
+GSSDP_CONF_ENV = \
+	ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY)
+
+GSSDP_DEPENDENCIES = host-pkg-config host-libglib2 libsoup
+
+$(eval $(call AUTOTARGETS,package,gssdp))
-- 
1.7.4.1
