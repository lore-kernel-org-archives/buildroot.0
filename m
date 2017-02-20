From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 22:44:08 +0100
Subject: [Buildroot] [git commit branch/next] keepalived: new package
Message-ID: <20170220214439.5EF178220F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a7ac39605e1bf416db033b009e6c09f54f44fdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Ilias Apalodimas <apalos@gmail.com>
[Thomas:
 - rewrap Config.in help text
 - add dependency on !BR2_STATIC_LIBS since the code uses libdl.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                         |  3 +++
 package/Config.in                  |  1 +
 package/keepalived/Config.in       | 20 ++++++++++++++++++++
 package/keepalived/keepalived.hash |  3 +++
 package/keepalived/keepalived.mk   | 32 ++++++++++++++++++++++++++++++++
 5 files changed, 59 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ef96145..3784a28 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -766,6 +766,9 @@ F:	package/python-rpi-gpio/
 N:	Ignacy Gaw??dzki <ignacy.gawedzki@green-communications.fr>
 F:	package/angularjs/
 
+N:	Ilias Apalodimas <apalos@gmail.com>
+F:	package/keepalived/
+
 N:	James Knight <james.knight@rockwellcollins.com>
 F:	package/atkmm/
 F:	package/cairomm/
diff --git a/package/Config.in b/package/Config.in
index e78fb75..e6dbe58 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1547,6 +1547,7 @@ menu "Networking applications"
 	source "package/irssi/Config.in"
 	source "package/iw/Config.in"
 	source "package/janus-gateway/Config.in"
+	source "package/keepalived/Config.in"
 	source "package/kismet/Config.in"
 	source "package/knock/Config.in"
 	source "package/leafnode2/Config.in"
diff --git a/package/keepalived/Config.in b/package/keepalived/Config.in
new file mode 100644
index 0000000..efa745a
--- /dev/null
+++ b/package/keepalived/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_KEEPALIVED
+	bool "keepalived"
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS # uses libdl
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_POPT
+	help
+	  The main goal of the keepalived project is to add a strong &
+	  robust keepalive facility to the Linux Virtual Server
+	  project. It implements a multilayer TCP/IP stack
+	  checks. Keepalived implements a framework based on three
+	  family checks: Layer3, Layer4 & Layer5. This framework gives
+	  the daemon the ability of checking a LVS server pool
+	  states. Keepalived can be sumarize as a LVS driving daemon.
+
+	  http://www.keepalived.org/
+
+comment "keepalived needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
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
index 0000000..da5b5d8
--- /dev/null
+++ b/package/keepalived/keepalived.mk
@@ -0,0 +1,32 @@
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
+KEEPALIVED_DEPENDENCIES += ipset
+KEEPALIVED_CONF_OPTS += --enable-libipset
+else
+KEEPALIVED_CONF_OPTS += --disable-libipset
+endif
+
+ifeq ($(BR2_PACKAGE_IPTABLES),y)
+KEEPALIVED_DEPENDENCIES += iptables
+KEEPALIVED_CONF_OPTS += --enable-libiptc
+else
+KEEPALIVED_CONF_OPTS += --disable-libiptc
+endif
+
+$(eval $(autotools-package))
