From: Peter Huewe <PeterHuewe@gmx.de>
Date: Fri, 14 May 2010 03:00:24 +0200
Subject: [Buildroot] package: Add support for pidgin/finch instant messenger
Message-ID: <201005140300.25098.PeterHuewe@gmx.de>
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

This patch adds support for Finch 2.7.0 to the buildroot buildsystem.
Finch is compiled with support for ICQ, IRC and Jabber;
However other protocols might be added to the script too / script can be
converted to a more modular style.

Tested on and compiled with atmel ngw100_defconfig.

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
Filed under Pidgin, not finch as Pidgin is the main app.
This makes it easier to add support for pidgin later 
(by someone who has X running on his board :)
 
 package/Config.in                                  |    1 +
 package/pidgin/Config.in                           |   13 +++++
 package/pidgin/README-ISSUES.txt                   |    9 +++
 .../pidgin-2.7.0-fix-build-without-gst.patch       |   22 ++++++++
 package/pidgin/pidgin.mk                           |   54 ++++++++++++++++++++
 5 files changed, 99 insertions(+), 0 deletions(-)
 create mode 100644 package/pidgin/Config.in
 create mode 100644 package/pidgin/README-ISSUES.txt
 create mode 100644 package/pidgin/pidgin-2.7.0-fix-build-without-gst.patch
 create mode 100644 package/pidgin/pidgin.mk

diff --git a/package/Config.in b/package/Config.in
index d3c4316..3749f5a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -391,6 +391,7 @@ source "package/olsr/Config.in"
 source "package/openntpd/Config.in"
 source "package/openssh/Config.in"
 source "package/openvpn/Config.in"
+source "package/pidgin/Config.in"
 source "package/portmap/Config.in"
 source "package/pppd/Config.in"
 source "package/radvd/Config.in"
diff --git a/package/pidgin/Config.in b/package/pidgin/Config.in
new file mode 100644
index 0000000..00202f4
--- /dev/null
+++ b/package/pidgin/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PIDGIN
+	bool "pidgin/finch"
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_NCURSES_TARGET_PANEL
+	help
+		Pidgin is a multi-protocol Instant Messaging client that allows you to
+		use all of your IM accounts at once.
+		
+		Finch is the ncurses based version of pidgin.
+		This builds only the ncurses based client (finch)!
+		
+		with support for jabber irc(works) and icq/aim
+		http://pidgin.im/
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
diff --git a/package/pidgin/pidgin-2.7.0-fix-build-without-gst.patch b/package/pidgin/pidgin-2.7.0-fix-build-without-gst.patch
new file mode 100644
index 0000000..feb380d
--- /dev/null
+++ b/package/pidgin/pidgin-2.7.0-fix-build-without-gst.patch
@@ -0,0 +1,22 @@
+See http://developer.pidgin.im/ticket/11850 for details.
+
+Author: Polynomial-C
+---
+--- pidgin-2.7.0/libpurple/media/backend-fs2.h
++++ pidgin-2.7.0/libpurple/media/backend-fs2.h
+@@ -55,6 +55,7 @@
+  */
+ GType purple_media_backend_fs2_get_type(void);
+ 
++#ifdef USE_GSTREAMER
+ /*
+  * Temporary function in order to be able to test while
+  * integrating with PurpleMedia
+@@ -71,6 +72,7 @@
+ void purple_media_backend_fs2_set_output_volume(PurpleMediaBackendFs2 *self,
+ 		const gchar *sess_id, const gchar *who, double level);
+ /* end tmp */
++#endif /* USE_GSTREAMER */
+ 
+ G_END_DECLS
+ 
diff --git a/package/pidgin/pidgin.mk b/package/pidgin/pidgin.mk
new file mode 100644
index 0000000..6a3e27d
--- /dev/null
+++ b/package/pidgin/pidgin.mk
@@ -0,0 +1,54 @@
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
+PIDGIN_VERSION = 2.7.0
+PIDGIN_SOURCE = pidgin-$(PIDGIN_VERSION).tar.bz2
+PIDGIN_SITE = http://puzzle.dl.sourceforge.net/sourceforge/pidgin/
+PIDGIN_CONF_ENV = ac_cv_path_pythonpath=''
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
+                $(DISABLE_NLS) \
+                $(DISABLE_LARGEFILE) \
+
+PIDGIN_DEPENDENCIES = uclibc gettext libintl libglib2
+$(eval $(call AUTOTARGETS,package,pidgin))
-- 
1.6.4.4
