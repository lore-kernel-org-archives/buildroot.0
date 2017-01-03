From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Jan 2017 23:48:56 +0100
Subject: [Buildroot] [git commit] riemann-c-client: new package
Message-ID: <20170103225412.8102A8180B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d68b3b957f470ce3a9a6ba4ba0dff03d8317895
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Riemann-c-client is a C client library for the Riemann monitoring system,
providing a convenient and simple API, high test coverage and a copyleft
license, along with API and ABI stability.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                              |  1 +
 package/riemann-c-client/Config.in             | 17 +++++++++++++++++
 package/riemann-c-client/riemann-c-client.hash |  2 ++
 package/riemann-c-client/riemann-c-client.mk   | 18 ++++++++++++++++++
 4 files changed, 38 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 59fa851..6511c98 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1364,6 +1364,7 @@ endif
 	source "package/protobuf-c/Config.in"
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
+	source "package/riemann-c-client/Config.in"
 	source "package/shapelib/Config.in"
 	source "package/skalibs/Config.in"
 	source "package/sphinxbase/Config.in"
diff --git a/package/riemann-c-client/Config.in b/package/riemann-c-client/Config.in
new file mode 100644
index 0000000..e9982b2
--- /dev/null
+++ b/package/riemann-c-client/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_RIEMANN_C_CLIENT
+	bool "riemann-c-client"
+	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
+	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf-c
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # protobuf-c
+	select BR2_PACKAGE_PROTOBUF_C
+	help
+	  Riemann-c-client is a C client library for the Riemann
+	  monitoring system, providing a convenient and simple API,
+	  high test coverage and a copyleft license, along with API
+	  and ABI stability.
+
+	  https://github.com/algernon/riemann-c-client
+
+comment "riemann-c-client needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
diff --git a/package/riemann-c-client/riemann-c-client.hash b/package/riemann-c-client/riemann-c-client.hash
new file mode 100644
index 0000000..0902881
--- /dev/null
+++ b/package/riemann-c-client/riemann-c-client.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 4b18804f489834fa953f4af887290173c745b471a5993bb108a9142c867de457 riemann-c-client-1.9.1.tar.xz
diff --git a/package/riemann-c-client/riemann-c-client.mk b/package/riemann-c-client/riemann-c-client.mk
new file mode 100644
index 0000000..027898b
--- /dev/null
+++ b/package/riemann-c-client/riemann-c-client.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# riemann-c-client
+#
+################################################################################
+
+RIEMANN_C_CLIENT_VERSION = 1.9.1
+RIEMANN_C_CLIENT_SOURCE = riemann-c-client-$(RIEMANN_C_CLIENT_VERSION).tar.xz
+RIEMANN_C_CLIENT_SITE = https://github.com/algernon/riemann-c-client/releases/download/riemann-c-client-$(RIEMANN_C_CLIENT_VERSION)
+RIEMANN_C_CLIENT_LICENSE = LGPLv3+
+RIEMANN_C_CLIENT_LICENSE_FILES = LICENSE
+RIEMANN_C_CLIENT_INSTALL_STAGING = YES
+RIEMANN_C_CLIENT_DEPENDENCIES = \
+	host-pkgconf protobuf-c \
+	$(if $(BR2_PACKAGE_GNUTLS),gnutls) \
+	$(if $(BR2_PACKAGE_JSON_C),json-c)
+
+$(eval $(autotools-package))
