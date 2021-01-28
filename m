From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 20:10:23 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/libnpupnp: new
 package
Message-ID: <20210128200123.2FB9C83E2C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d14163707f5aae786ca6efc98bfa39fb11ad96b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

npupnp (new pupnp or not pupnp ?) is an UPnP library derived from the
venerable pupnp (https://github.com/pupnp/pupnp), based on its 1.6.x
branch (around 1.6.25).

https://www.lesbonscomptes.com/upmpdcli/libnpupnp.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d2f50391d79032fa3741b5d513588a511052af17)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/libnpupnp/Config.in      | 18 ++++++++++++++++++
 package/libnpupnp/libnpupnp.hash |  5 +++++
 package/libnpupnp/libnpupnp.mk   | 14 ++++++++++++++
 5 files changed, 39 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 50db0cc153..9446ed00fb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -836,6 +836,7 @@ F:	package/libmatroska/
 F:	package/libmpdclient/
 F:	package/libnetfilter_conntrack/
 F:	package/libnetfilter_queue/
+F:	package/libnpupnp/
 F:	package/liboping/
 F:	package/libpfm4/
 F:	package/libraw/
diff --git a/package/Config.in b/package/Config.in
index c328d9f153..958b9fb08e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1675,6 +1675,7 @@ menu "Networking"
 	source "package/libnftnl/Config.in"
 	source "package/libnice/Config.in"
 	source "package/libnl/Config.in"
+	source "package/libnpupnp/Config.in"
 	source "package/liboauth/Config.in"
 	source "package/liboping/Config.in"
 	source "package/libosip2/Config.in"
diff --git a/package/libnpupnp/Config.in b/package/libnpupnp/Config.in
new file mode 100644
index 0000000000..cea5bd5c06
--- /dev/null
+++ b/package/libnpupnp/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_LIBNPUPNP
+	bool "libnpupnp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBMICROHTTPD
+	help
+	  npupnp (new pupnp or not pupnp ?) is an UPnP library derived
+	  from the venerable pupnp (https://github.com/pupnp/pupnp),
+	  based on its 1.6.x branch (around 1.6.25).
+
+	  https://www.lesbonscomptes.com/upmpdcli/libnpupnp.html
+
+comment "libnpupnp needs a toolchain w/ C++, threads, gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libnpupnp/libnpupnp.hash b/package/libnpupnp/libnpupnp.hash
new file mode 100644
index 0000000000..41cc41955b
--- /dev/null
+++ b/package/libnpupnp/libnpupnp.hash
@@ -0,0 +1,5 @@
+# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-4.0.7.tar.gz.sha256
+sha256  30f15caa67dc83f76b0976438165aa4704a50c7e3e5444c50bb8cbad874877ca  libnpupnp-4.0.7.tar.gz
+
+# Hash for license file:
+sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libnpupnp/libnpupnp.mk b/package/libnpupnp/libnpupnp.mk
new file mode 100644
index 0000000000..abd80ab63b
--- /dev/null
+++ b/package/libnpupnp/libnpupnp.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libnpupnp
+#
+################################################################################
+
+LIBNPUPNP_VERSION = 4.0.7
+LIBNPUPNP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
+LIBNPUPNP_LICENSE = BSD-3-Clause
+LIBNPUPNP_LICENSE_FILES = COPYING
+LIBNPUPNP_INSTALL_STAGING = YES
+LIBNPUPNP_DEPENDENCIES = expat libcurl libmicrohttpd
+
+$(eval $(autotools-package))
