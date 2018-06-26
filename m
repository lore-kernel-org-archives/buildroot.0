From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Jun 2018 23:36:54 +0200
Subject: [Buildroot] [git commit] package/dehydrated: new package
Message-ID: <20180626213408.9C1188352A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2257c18c259b52abf3dda0aea98a59cce29f3eab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dehydrated is an ACME client written in bash. It should be able to run
under zsh as well, but this hasn't been tested so it isn't enabled for
now.

Normally, we would want an init script to start dehydrated, and an
example configuration file. However, it is very difficult to do this
in a generic way in Buildroot:
- we normally don't have cron running;
- we have no standard location for webroot;
- we have no standard location for certificates;
- we have no standard way to restart/reload the webserver.
So instead, provide brief documentation of how to use dehydrated in the
help text.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/dehydrated/Config.in       | 33 +++++++++++++++++++++++++++++++++
 package/dehydrated/dehydrated.hash |  6 ++++++
 package/dehydrated/dehydrated.mk   | 18 ++++++++++++++++++
 5 files changed, 59 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 27e24896fb..8b1cb0c1d7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -185,6 +185,7 @@ F:	package/espeak/
 
 N:	Arnout Vandecappelle <arnout@mind.be>
 F:	package/arp-scan/
+F:	package/dehydrated/
 F:	package/freescale-imx/firmware-imx/
 F:	package/freescale-imx/imx-lib/
 F:	package/gstreamer/gst-fsl-plugins/
diff --git a/package/Config.in b/package/Config.in
index c5365547a4..b689017be5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1712,6 +1712,7 @@ menu "Networking applications"
 	source "package/cups-filters/Config.in"
 	source "package/dante/Config.in"
 	source "package/darkhttpd/Config.in"
+	source "package/dehydrated/Config.in"
 	source "package/dhcp/Config.in"
 	source "package/dhcpcd/Config.in"
 	source "package/dhcpdump/Config.in"
diff --git a/package/dehydrated/Config.in b/package/dehydrated/Config.in
new file mode 100644
index 0000000000..f14ae0f611
--- /dev/null
+++ b/package/dehydrated/Config.in
@@ -0,0 +1,33 @@
+config BR2_PACKAGE_DEHYDRATED
+	bool "dehydrated"
+	depends on BR2_USE_MMU # bash
+	select BR2_PACKAGE_BASH
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_CURL
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_BIN if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBRESSL_BIN if BR2_PACKAGE_LIBRESSL
+	help
+	  Dehydrated is a client for signing certificates with an
+	  ACME-server (e.g. Let's Encrypt) implemented as a relatively
+	  simple (zsh-compatible) bash-script. This client supports
+	  both ACME v1 and the new ACME v2 including support for
+	  wildcard certificates!
+
+	  To use this script in Buildroot:
+	    - Create /etc/dehydrated/domains.txt
+	    - Make sure that "dehydrated -c" is called regularly, e.g.
+	      from cron.
+	    - Make sure /etc/dehydrated is writable.
+	    - Configure the webserver to export the WELLKNOWN directory
+	      (/var/www/dehydrated) as /.well-known/acme-challenge
+	    - Configure the webserver to use the certificates under
+	      /etc/dehydrated/certs/<domain>
+	    - Register a HOOK to reload the webserver after the
+	      certificates have been renewed.
+
+	  You probably need to install a custom /etc/dehydrated/config
+	  with the rootfs overlay.
+
+	  https://github.com/lukas2511/dehydrated
diff --git a/package/dehydrated/dehydrated.hash b/package/dehydrated/dehydrated.hash
new file mode 100644
index 0000000000..1d194e5a7d
--- /dev/null
+++ b/package/dehydrated/dehydrated.hash
@@ -0,0 +1,6 @@
+# Locally computed after verifying
+# https://github.com/lukas2511/dehydrated/releases/download/v0.6.2/dehydrated-0.6.2.tar.gz.asc
+# with key 3C2F2605E078A1E18F4793909C4DBE6CF438F333 from https://keybase.io/lukas2511
+sha256  163384479199f06f59382ceb6291a299567a2f4f0b963b9b61f2db65a407e80e  dehydrated-0.6.2.tar.gz
+# License, locally computed
+sha256  b4583b7dd07e3e2a08906de38e7e329d41f921ed9dcb6310b3886e013a6b8723  LICENSE
diff --git a/package/dehydrated/dehydrated.mk b/package/dehydrated/dehydrated.mk
new file mode 100644
index 0000000000..b7de27a407
--- /dev/null
+++ b/package/dehydrated/dehydrated.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# dehydrated
+#
+################################################################################
+
+DEHYDRATED_VERSION = 0.6.2
+DEHYDRATED_SITE = https://github.com/lukas2511/dehydrated/releases/download/v$(DEHYDRATED_VERSION)
+
+DEHYDRATED_LICENSE = MIT
+DEHYDRATED_LICENSE_FILES = LICENSE
+
+define DEHYDRATED_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/dehydrated $(TARGET_DIR)/usr/bin/dehydrated
+	$(INSTALL) -D -m 0644 $(@D)/docs/examples/config $(TARGET_DIR)/etc/dehydrated/config
+endef
+
+$(eval $(generic-package))
