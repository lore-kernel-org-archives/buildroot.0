From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 11:47:24 +0100
Subject: [Buildroot] [git commit] woff2: new package
Message-ID: <20180324105507.6D14781524@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70afd4afa765183032fd0c335b6855fd02e30745
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the woff2 package to Builroot. This is needed by webkitgtk from
version 2.20.0 onwards. WebKitGTK+ used to bundle a copy of the library,
but it stopped doing so now that the upstream is has been making
releases.

[Peter: fix license hash]
Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/woff2/Config.in  |  9 +++++++++
 package/woff2/woff2.hash |  5 +++++
 package/woff2/woff2.mk   | 17 +++++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2d5f2108a8..031af3cdd0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -65,6 +65,7 @@ N:	Adrian Perez de Castro <aperez@igalia.com>
 F:	package/brotli/
 F:	package/libepoxy/
 F:	package/webkitgtk/
+F:	package/woff2/
 
 N:	Adrien Gallou??t <adrien@gallouet.fr>
 F:	package/glorytun/
diff --git a/package/Config.in b/package/Config.in
index 26ded5ebb2..ae5a09bd5b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1186,6 +1186,7 @@ menu "Graphics"
 	source "package/waylandpp/Config.in"
 	source "package/webkitgtk/Config.in"
 	source "package/webp/Config.in"
+	source "package/woff2/Config.in"
 	source "package/zbar/Config.in"
 	source "package/zxing-cpp/Config.in"
 endmenu
diff --git a/package/woff2/Config.in b/package/woff2/Config.in
new file mode 100644
index 0000000000..48672570dd
--- /dev/null
+++ b/package/woff2/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_WOFF2
+	bool "woff2"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_BROTLI
+	help
+	  Reference implementation for the WOFF2 font file format,
+	  typically used for Web fonts
+
+	  https://github.com/google/woff2
diff --git a/package/woff2/woff2.hash b/package/woff2/woff2.hash
new file mode 100644
index 0000000000..469071e3c2
--- /dev/null
+++ b/package/woff2/woff2.hash
@@ -0,0 +1,5 @@
+# Locally generated:
+sha512  c788bba1530aec463e755e901f9342f4b599e3a07f54645fef1dc388ab5d5c30625535e5dd38e9e792e04a640574baa50eeefb6b7338ab403755f4a4e0c3044d  v1.0.2.tar.gz
+
+# Hash for license files:
+sha512  8ee924da3fb5d16135adcf6a8fbe9e2e8f3d2d80468617e72ca4fa059a60f8455c9a5f68a8dc381b1297c8bf39c887a912d0f69246d2604ada74d3da9e8e490b  LICENSE
diff --git a/package/woff2/woff2.mk b/package/woff2/woff2.mk
new file mode 100644
index 0000000000..23b88a5e9a
--- /dev/null
+++ b/package/woff2/woff2.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# woff2
+#
+################################################################################
+
+WOFF2_VERSION = 1.0.2
+WOFF2_SOURCE = v$(WOFF2_VERSION).tar.gz
+WOFF2_SITE = https://github.com/google/woff2/archive
+WOFF2_LICENSE = MIT
+WOFF2_LICENSE_FILES = LICENSE
+WOFF2_INSTALL_STAGING = YES
+WOFF2_DEPENDENCIES = brotli
+WOFF2_CONF_OPTS = \
+	-DNOISY_LOGGING=OFF
+
+$(eval $(cmake-package))
