From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Mon, 5 Jul 2010 23:12:14 +0200
Subject: [Buildroot] [PATCH v5] package: Add support for pidgin/finch
	instant messenger (2.7.1)
In-Reply-To: <20100625091927.4c67886b@surf>
References: <201005140300.25098.PeterHuewe@gmx.de>
	<201006241726.25775.PeterHuewe@gmx.de>
	<20100625091927.4c67886b@surf>
Message-ID: <201007052312.16391.PeterHuewe@gmx.de>
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
 package/Config.in                |    1 +
 package/pidgin/Config.in         |   15 +++++++++++
 package/pidgin/README-ISSUES.txt |    9 ++++++
 package/pidgin/pidgin.mk         |   52 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 77 insertions(+), 0 deletions(-)
 create mode 100644 package/pidgin/Config.in
 create mode 100644 package/pidgin/README-ISSUES.txt
 create mode 100644 package/pidgin/pidgin.mk

diff --git a/package/Config.in b/package/Config.in
index eba21da..f292bc6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -404,6 +404,7 @@ source "package/olsr/Config.in"
 source "package/openntpd/Config.in"
 source "package/openssh/Config.in"
 source "package/openvpn/Config.in"
+source "package/pidgin/Config.in"
 source "package/portmap/Config.in"
 source "package/pppd/Config.in"
 source "package/radvd/Config.in"
diff --git a/package/pidgin/Config.in b/package/pidgin/Config.in
new file mode 100644
index 0000000..76b3cc2
--- /dev/null
+++ b/package/pidgin/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PIDGIN
+	bool "pidgin/finch"
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_NCURSES_TARGET_PANEL
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	help
+	  Pidgin is a multi-protocol Instant Messaging client that allows you
+	  to use all of your IM accounts at once.
+	  
+	  Finch is the ncurses based version of pidgin.
+	  
+	  This builds only the ncurses based client! with support for
+	  jabber (works), irc(works) and icq/aim (broken, by locale)
+	  
+	  For more details see http://pidgin.im/
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
index 0000000..af445c0
--- /dev/null
+++ b/package/pidgin/pidgin.mk
@@ -0,0 +1,52 @@
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
+                --disable-doxygen \
+                --disable-dot \
+                --without-x \
+                --with-static-prpls=oscar,jabber,irc \
+                --without-python \
+                --disable-plugins \
+                --disable-debug \
+
+PIDGIN_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) libintl libglib2 ncurses libxml2
+$(eval $(call AUTOTARGETS,package,pidgin))
-- 
1.7.1
