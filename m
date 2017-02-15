From: Ilias Apalodimas <apalos@gmail.com>
Date: Wed, 15 Feb 2017 10:18:55 +0200
Subject: [Buildroot] [PATCH 2/2] keepalived: new package
In-Reply-To: <1487146735-12418-1-git-send-email-apalos@gmail.com>
References: <1487146735-12418-1-git-send-email-apalos@gmail.com>
Message-ID: <1487146735-12418-2-git-send-email-apalos@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ilias Apalodimas <apalos@gmail.com>
---
 DEVELOPERS                         |  3 +++
 package/Config.in                  |  1 +
 package/keepalived/Config.in       | 14 ++++++++++++++
 package/keepalived/keepalived.hash |  3 +++
 package/keepalived/keepalived.mk   | 30 ++++++++++++++++++++++++++++++
 5 files changed, 51 insertions(+)
 create mode 100644 package/keepalived/Config.in
 create mode 100644 package/keepalived/keepalived.hash
 create mode 100644 package/keepalived/keepalived.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7f65909..df2e747 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -765,6 +765,9 @@ F:	package/python-rpi-gpio/
 N:	Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
 F:	package/angularjs/
 
+N:	Ilias Apalodimas <apalos@gmail.com>
+F:	package/keepalived/
+
 N:	James Knight <james.knight@rockwellcollins.com>
 F:	package/atkmm/
 F:	package/cairomm/
diff --git a/package/Config.in b/package/Config.in
index deff0fe..5b3871c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1546,6 +1546,7 @@ menu "Networking applications"
 	source "package/irssi/Config.in"
 	source "package/iw/Config.in"
 	source "package/janus-gateway/Config.in"
+	source "package/keepalived/Config.in"
 	source "package/kismet/Config.in"
 	source "package/knock/Config.in"
 	source "package/leafnode2/Config.in"
diff --git a/package/keepalived/Config.in b/package/keepalived/Config.in
new file mode 100644
index 0000000..721eed5
--- /dev/null
+++ b/package/keepalived/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_KEEPALIVED
+	bool "keepalived"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_POPT
+	depends on BR2_USE_MMU
+	help
+	  The main goal of the keepalived project is to add a strong & robust
+	  keepalive facility to the Linux Virtual Server project.
+	  It implements a multilayer TCP/IP stack checks. Keepalived implements
+	  a framework based on three family checks : Layer3, Layer4 & Layer5.
+	  This framework gives the daemon the ability of checking a LVS server
+	  pool states. Keepalived can be sumarize as a LVS driving daemon.
+
+	  http://www.keepalived.org/
diff --git a/package/keepalived/keepalived.hash b/package/keepalived/keepalived.hash
new file mode 100644
index 0000000..e868587
--- /dev/null
+++ b/package/keepalived/keepalived.hash
@@ -0,0 +1,3 @@
+# From http://www.keepalived.org/download.html
+md5 744025d57c7f065c42fe925b0283897e	keepalived-1.3.2.tar.gz
+sha1	449f06dfce07e05c1ebd516d0545182e1416f264  keepalived-1.3.2.tar.gz
diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
new file mode 100644
index 0000000..4a8f1b1
--- /dev/null
+++ b/package/keepalived/keepalived.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# keepalived
+#
+################################################################################
+
+KEEPALIVED_VERSION = 1.3.2
+KEEPALIVED_SITE = http://www.keepalived.org/software
+KEEPALIVED_DEPENDENCIES = host-pkgconf openssl popt
+KEEPALIVED_LICENSE = GPLv2+
+KEEPALIVED_LICENSE_FILES = COPYING
+KEEPALIVED_CONF_OPTS += --disable-dbus
+
+ifeq ($(BR2_PACKAGE_LIBNL),y)
+KEEPALIVED_DEPENDENCIES += libnfnetlink
+endif
+
+ifeq ($(BR2_PACKAGE_IPSET),y)
+KEEPALIVED_CONF_OPTS += --enable-libipset
+else
+KEEPALIVED_CONF_OPTS += --disable-libipset
+endif
+
+ifeq ($(BR2_PACKAGE_IPTABLES),y)
+KEEPALIVED_CONF_OPTS += --enable-libiptc
+else
+KEEPALIVED_CONF_OPTS += --disable-libiptc
+endif
+
+$(eval $(autotools-package))
-- 
1.9.1
