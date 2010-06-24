From: Peter Huewe <PeterHuewe@gmx.de>
Date: Thu, 24 Jun 2010 13:47:01 +0200
Subject: [Buildroot] [PATCH v3] package: Add support for pidgin/finch
	instant messenger (2.7.1)
In-Reply-To: <201005141412.48421.PeterHuewe@gmx.de>
References: <201005140300.25098.PeterHuewe@gmx.de>
	<20100514110321.370b99b9@surf>
	<201005141412.48421.PeterHuewe@gmx.de>
Message-ID: <201006241347.01454.PeterHuewe@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Huewe <peterhuewe@gmx.de>

Pidgin is a free and open source instant multiprotocol (ICQ, IRC, Jabber
...) messenger.

Finch is a ncurses based console version of pidgin.

For more information visit http://pidgin.im

This patch adds support for Finch 2.7.1 to the buildroot buildsystem.
Finch is compiled with support for ICQ, IRC and Jabber;
However other protocols might be added to the script too / script can be
converted to a more modular style.

Tested on and compiled with atmel ngw100_defconfig.

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
Changes to v2:
- Version Bump to 2.7.1
- LIBTOOL_PATCH = NO, added
- added dependencies for ncurses and libxml2 to be build first

 package/Config.in                |    1 +
 package/pidgin/Config.in         |   10 +++++++
 package/pidgin/README-ISSUES.txt |    9 ++++++
 package/pidgin/pidgin.mk         |   53 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 73 insertions(+), 0 deletions(-)
 create mode 100644 package/pidgin/Config.in
 create mode 100644 package/pidgin/README-ISSUES.txt
 create mode 100644 package/pidgin/pidgin.mk

diff --git a/package/Config.in b/package/Config.in
index 5ce01a0..bd491b5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -403,6 +403,7 @@ source "package/olsr/Config.in"
 source "package/openntpd/Config.in"
 source "package/openssh/Config.in"
 source "package/openvpn/Config.in"
+source "package/pidgin/Config.in"
 source "package/portmap/Config.in"
 source "package/pppd/Config.in"
 source "package/radvd/Config.in"
diff --git a/package/pidgin/Config.in b/package/pidgin/Config.in
new file mode 100644
index 0000000..cc2f8ec
--- /dev/null
+++ b/package/pidgin/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PIDGIN
+	bool "pidgin/finch"
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_NCURSES_TARGET_PANEL
+	help
+		Pidgin is a multi-protocol Instant Messaging client that allows you to use all of your IM accounts at once.
+		Finch is the ncurses based version of pidgin.
+		This builds only the ncurses based client! with support for jabber (works), irc(works) and icq/aim (broken)
+		http://pidgin.im/
+
diff --git a/package/pidgin/README-ISSUES.txt b/package/pidgin/README-ISSUES.txt
new file mode 100644
index 0000000..2b33ec9
--- /dev/null
+++ b/package/pidgin/README-ISSUES.txt
@@ -0,0 +1,9 @@
+ISSUES:
+- TERM has to be set to xterm  -> TERM=xterm
+	(this is a little problem if I access the board via rs232 with kermit)
+
+TODOs:
+- Make buildscript more modular -> one should be able to select which
+  protocols shall be built
+
+Created 20100514 by Peter Huewe (peterhuewe at gmx.de)
diff --git a/package/pidgin/pidgin.mk b/package/pidgin/pidgin.mk
new file mode 100644
index 0000000..a3563e5
--- /dev/null
+++ b/package/pidgin/pidgin.mk
@@ -0,0 +1,53 @@
+#############################################################
+#
+# pidgin/finch
+#
+# "Pidgin is an easy to use and free chat client used by millions. 
+# Connect to ICQ, IRC, Jabber and more chat networks all at once."
+#
+# Finch is the ncurses based console version of this pidgin, 
+# which is provided by this package
+# http://pidgin.im
+#
+# Buildroot Script by Peter Huewe <peterhuewe -@- gmx.de>
+#############################################################
+PIDGIN_VERSION = 2.7.1
+PIDGIN_SOURCE = pidgin-$(PIDGIN_VERSION).tar.bz2
+PIDGIN_CONF_ENV = ac_cv_path_pythonpath=''
+PIDGIN_LIBTOOL_PATCH = NO
+PIDGIN_CONF_OPT= --disable-gtkui \
+                --enable-consoleui \
+                --disable-screensaver \
+                --disable-sm \
+                --disable-startup-notification \
+                --disable-gtkspell \
+                --disable-gestures   \
+                --disable-schemas-install \
+                --disable-gstreamer \
+                --disable-gstreamer-interfaces  \
+                --disable-farsight \
+                --disable-vv \
+                --disable-idn \
+                --disable-meanwhile \
+                --disable-avahi \
+                --disable-fortify \
+                --disable-dbus  \
+                --disable-nm  \
+                --disable-mono \
+                --disable-perl \
+                --enable-gnutls=no \
+                --enable-nss=no \
+                --disable-tcl \
+                --disable-tk \
+                --disable-pixmaps-install \
+                --enable-nls \
+                --disable-doxygen \
+                --disable-dot \
+                --without-x \
+                --with-static-prpls=oscar,jabber,irc \
+                --without-python \
+                --disable-plugins \
+                --disable-debug \
+
+PIDGIN_DEPENDENCIES = gettext libintl libglib2 ncurses libxml2
+$(eval $(call AUTOTARGETS,package,pidgin))
-- 
1.7.1
