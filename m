From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 16:12:36 +0200
Subject: [Buildroot] [git commit] gupnp-tools: new package
Message-ID: <20160730143334.C548D81E16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6008f02fc82c3cfcb4bb6e8e6e99e5dd7396b500
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GUPnP Tools are free replacements of Intel UPnP tools that use
GUPnP. They provides client and server side tools which enable
one to easily test and debug one's UPnP devices and control
points.

http://www.gupnp.org/

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
[Thomas:
 - use "depends on BR2_PACKAGE_LIBGTK3" instead of a select, and
   simplify the Config.in comments consequently.
 - move from "Development tools" to "Networking applications"
 - license is GPLv2+, not LGPLv2+.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |  1 +
 package/gupnp-tools/Config.in        | 21 +++++++++++++++++++++
 package/gupnp-tools/gupnp-tools.hash |  2 ++
 package/gupnp-tools/gupnp-tools.mk   | 35 +++++++++++++++++++++++++++++++++++
 4 files changed, 59 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 875d755..00f3ffb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1453,6 +1453,7 @@ menu "Networking applications"
 	source "package/fmc/Config.in"
 	source "package/fping/Config.in"
 	source "package/freeswitch/Config.in"
+	source "package/gupnp-tools/Config.in"
 	source "package/gesftpserver/Config.in"
 	source "package/gutenprint/Config.in"
 	source "package/hans/Config.in"
diff --git a/package/gupnp-tools/Config.in b/package/gupnp-tools/Config.in
new file mode 100644
index 0000000..f9e645a
--- /dev/null
+++ b/package/gupnp-tools/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_GUPNP_TOOLS
+	bool "gupnp-tools"
+	# gssdp, gupnp, libsoup all select on libglib2, so they have
+	# the same dependencies as libgtk3, which we depend on. So for
+	# the same of simplicity, we don't replicate all those
+	# (complex) dependencies.
+	select BR2_PACKAGE_GSSDP
+	select BR2_PACKAGE_GUPNP
+	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_LIBXML2
+	depends on BR2_PACKAGE_LIBGTK3
+	help
+	  GUPnP Tools are free replacements of Intel UPnP tools that
+	  use GUPnP. They provides client and server side tools which
+	  enable one to easily test and debug one's UPnP devices and
+	  control points.
+
+	  http://www.gupnp.org/
+
+comment "gupnp-tools needs libgtk3"
+	depends on !BR2_PACKAGE_LIBGTK3
diff --git a/package/gupnp-tools/gupnp-tools.hash b/package/gupnp-tools/gupnp-tools.hash
new file mode 100644
index 0000000..0d37a87
--- /dev/null
+++ b/package/gupnp-tools/gupnp-tools.hash
@@ -0,0 +1,2 @@
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/0.8/gupnp-tools-0.8.12.sha256sum:
+sha256	658de96953608c4b1f47578ae563a7066d1f1983565daf22ad52b7b328ef97b1	gupnp-tools-0.8.12.tar.xz
diff --git a/package/gupnp-tools/gupnp-tools.mk b/package/gupnp-tools/gupnp-tools.mk
new file mode 100644
index 0000000..75920db
--- /dev/null
+++ b/package/gupnp-tools/gupnp-tools.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# gupnp-tools
+#
+################################################################################
+
+GUPNP_TOOLS_VERSION_MAJOR = 0.8
+GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).12
+GUPNP_TOOLS_SOURCE = gupnp-tools-$(GUPNP_TOOLS_VERSION).tar.xz
+GUPNP_TOOLS_SITE = \
+	http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/$(GUPNP_TOOLS_VERSION_MAJOR)
+GUPNP_TOOLS_LICENSE = GPLv2+
+GUPNP_TOOLS_LICENSE_FILES = COPYING
+GUPNP_TOOLS_INSTALL_STAGING = YES
+GUPNP_TOOLS_DEPENDENCIES = \
+	host-pkgconf \
+	libglib2 \
+	libxml2 \
+	gssdp \
+	gupnp \
+	libsoup \
+	libgtk3
+
+ifeq ($(BR2_PACKAGE_GUPNP_AV),y)
+GUPNP_TOOLS_CONF_OPTS += --with-av
+GUPNP_TOOLS_DEPENDENCIES += gupnp-av
+else
+GUPNP_TOOLS_CONF_OPTS += --without-av
+endif
+
+ifeq ($(BR2_PACKAGE_GTKSOURCEVIEW),y)
+GUPNP_TOOLS_DEPENDENCIES += gtksourceview
+endif
+
+$(eval $(autotools-package))
