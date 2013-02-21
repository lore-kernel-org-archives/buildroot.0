From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 21 Feb 2013 19:33:12 +0200
Subject: [Buildroot] [PATCH] new package: consolekit
Message-ID: <1361467992-9438-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ConsoleKit

ConsoleKit is a framework for defining and tracking users,
login sessions, and seats.

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---

Most of the stuff here are from Gentoo ebuild file
http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-auth/consolekit/
consolekit-0.4.5_p20120320-r1.ebuild

 package/Config.in                                  |    1 +
 package/consolekit/90-consolekit                   |   32 +++++++++
 package/consolekit/Config.in                       |   14 ++++
 package/consolekit/S35consolekit                   |   26 +++++++
 .../consolekit-cleanup_console_tags.patch          |   72 ++++++++++++++++++++
 .../consolekit/consolekit-polkit-automagic.patch   |   35 ++++++++++
 ...nsolekit-shutdown-reboot-without-policies.patch |   31 +++++++++
 package/consolekit/consolekit.mk                   |   40 +++++++++++
 package/consolekit/pam-foreground-compat.ck        |   18 +++++
 package/consolekit/system-session                  |    6 ++
 10 files changed, 275 insertions(+), 0 deletions(-)
 create mode 100644 package/consolekit/90-consolekit
 create mode 100644 package/consolekit/Config.in
 create mode 100755 package/consolekit/S35consolekit
 create mode 100644 package/consolekit/consolekit-cleanup_console_tags.patch
 create mode 100644 package/consolekit/consolekit-polkit-automagic.patch
 create mode 100644 package/consolekit/consolekit-shutdown-reboot-without-policies.patch
 create mode 100644 package/consolekit/consolekit.mk
 create mode 100755 package/consolekit/pam-foreground-compat.ck
 create mode 100644 package/consolekit/system-session

diff --git a/package/Config.in b/package/Config.in
index 8588951..0db321c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -777,6 +777,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bootutils/Config.in"
 endif
 source "package/bwm-ng/Config.in"
+source "package/consolekit/Config.in"
 source "package/cpuload/Config.in"
 source "package/htop/Config.in"
 source "package/keyutils/Config.in"
diff --git a/package/consolekit/90-consolekit b/package/consolekit/90-consolekit
new file mode 100644
index 0000000..358fc24
--- /dev/null
+++ b/package/consolekit/90-consolekit
@@ -0,0 +1,32 @@
+# -*- sh -*-
+# Xsession.d script for ck-launch-session.
+#
+#
+# This file is sourced by Xsession(5), not executed.
+
+CK_LAUNCH_SESSION=/usr/bin/ck-launch-session
+
+is_on_console() {
+	session=$(dbus-send --system --dest=org.freedesktop.ConsoleKit \
+		--type=method_call --print-reply --reply-timeout=2000 \
+		/org/freedesktop/ConsoleKit/Manager \
+		org.freedesktop.ConsoleKit.Manager.GetCurrentSession \
+		| grep path | awk '{print $3}' | sed s/\"//g)
+	x11_display=$(dbus-send --system --dest=org.freedesktop.ConsoleKit \
+		--type=method_call --print-reply --reply-timeout=2000 \
+		$session org.freedesktop.ConsoleKit.Session.GetX11Display \
+		| grep string | awk '{print $2}' | sed s/\"//g)
+
+	if [ -z "$x11_display" ] ; then
+		return 0
+	else
+		return 1
+	fi
+}
+
+# gdm already creates a CK session for us, so do not run the expensive D-Bus
+# calls if we have $GDMSESSION
+if [ -z "$GDMSESSION" ] && [ -x "$CK_LAUNCH_SESSION" ] && \
+ ( [ -z "$XDG_SESSION_COOKIE" ] || is_on_console ) ; then
+    command="$CK_LAUNCH_SESSION $command"
+fi
diff --git a/package/consolekit/Config.in b/package/consolekit/Config.in
new file mode 100644
index 0000000..905dada
--- /dev/null
+++ b/package/consolekit/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_CONSOLEKIT
+	bool "consolekit"
+	select BR2_PACKAGE_DBUS_GLIB
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_LIBXSLT
+	select BR2_PACKAGE_LINUX_PAM
+	select BR2_PACKAGE_POLKIT
+	select BR2_PACKAGE_ZLIB
+	help
+	  ConsoleKit is a framework for defining and tracking users, 
+	  login sessions, and seats.
+
+	  http://www.freedesktop.org/wiki/software/ConsoleKit
diff --git a/package/consolekit/S35consolekit b/package/consolekit/S35consolekit
new file mode 100755
index 0000000..000f719
--- /dev/null
+++ b/package/consolekit/S35consolekit
@@ -0,0 +1,26 @@
+#!/bin/sh
+#
+# Start the ConsoleKit....
+#
+
+case "$1" in
+  start)
+ 	echo "Starting ConsoleKit daemon..."
+	start-stop-daemon --start --pidfile /var/run/ConsoleKit/pid \
+			  --exec /usr/sbin/console-kit-daemon --
+	;;
+  stop)
+	echo -n "Stopping ConsoleKit daemon..."
+	start-stop-daemon --stop --pidfile /var/run/ConsoleKit/pid
+	;;
+  restart|reload)
+	"$0" stop
+	"$0" start
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
+
diff --git a/package/consolekit/consolekit-cleanup_console_tags.patch b/package/consolekit/consolekit-cleanup_console_tags.patch
new file mode 100644
index 0000000..27e9cc3
--- /dev/null
+++ b/package/consolekit/consolekit-cleanup_console_tags.patch
@@ -0,0 +1,72 @@
+http://bugs.gentoo.org/257761
+http://patches.ubuntu.com/by-release/extracted/ubuntu/c/consolekit/
+
+Upstream-Status:	Pending
+URL:			http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/
+			sys-auth/consolekit/files/
+			console-cleanup_console_tags.patch
+
+--- ConsoleKit-0.4.5.org/src/main.c	2013-02-21 17:05:13.997353177 +0200
++++ ConsoleKit-0.4.5/src/main.c	2013-02-21 17:14:20.767844895 +0200
+@@ -148,6 +148,43 @@
+         unlink (CONSOLE_KIT_PID_FILE);
+ }
+ 
++#define CONSOLE_TAGS_DIR "/var/run/console"
++
++static void
++delete_console_tags (void)
++{
++	GDir *dir;
++	GError *error = NULL;
++	const gchar *name;
++
++	g_debug ("Cleaning up %s", CONSOLE_TAGS_DIR);
++
++	dir = g_dir_open (CONSOLE_TAGS_DIR, 0, &error);
++	if (dir == NULL) {
++		g_debug ("Couldn't open directory %s: %s", CONSOLE_TAGS_DIR,
++		           error->message);
++		g_error_free (error);
++		return;
++	}
++	while ((name = g_dir_read_name (dir)) != NULL) {
++		gchar *file;
++		file = g_build_filename (CONSOLE_TAGS_DIR, name, NULL);
++
++		g_debug ("Removing tag file: %s", file);
++		if (unlink (file) == -1) {
++			g_warning ("Couldn't delete tag file: %s", file);
++		}
++		g_free (file);
++	}
++}
++
++static void
++cleanup (void)
++{
++	delete_console_tags ();
++	delete_pid ();
++}
++
+ /* copied from nautilus */
+ static int debug_log_pipes[2];
+ 
+@@ -228,7 +265,7 @@
+                 snprintf (pid, sizeof (pid), "%lu\n", (long unsigned) getpid ());
+                 written = write (pf, pid, strlen (pid));
+                 close (pf);
+-                g_atexit (delete_pid);
++                g_atexit (cleanup);
+         } else {
+                 g_warning ("Unable to write pid file %s: %s",
+                            CONSOLE_KIT_PID_FILE,
+@@ -317,6 +354,8 @@
+                 goto out;
+         }
+ 
++	delete_console_tags ();
++
+         create_pid_file ();
+ 
+         loop = g_main_loop_new (NULL, FALSE);
diff --git a/package/consolekit/consolekit-polkit-automagic.patch b/package/consolekit/consolekit-polkit-automagic.patch
new file mode 100644
index 0000000..4100acd
--- /dev/null
+++ b/package/consolekit/consolekit-polkit-automagic.patch
@@ -0,0 +1,35 @@
+http://bugs.freedesktop.org/show_bug.cgi?id?47587
+
+Upstream-Status:	Pending
+URL:			http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86
+			/sys-auth/consolekit/files/
+			consolekit-0.4.5-polit-automagic.patch
+
+--- ConsoleKit-0.4.5.org/configure.ac	2013-02-21 17:05:13.991352412 +0200
++++ ConsoleKit-0.4.5/configure.ac	2013-02-21 17:19:00.431388684 +0200
+@@ -55,10 +55,21 @@
+   gthread-2.0 >= $GLIB_REQUIRED_VERSION
+ )
+ 
+-PKG_CHECK_MODULES(POLKIT,
+-  polkit-gobject-1 >= $POLKIT_REQUIRED_VERSION,
+-  have_polkit=yes,
+-  have_polkit=no)
++AC_ARG_ENABLE([polkit],
++  AC_HELP_STRING([--enable-polkit], [Enable PolicyKit support (default auto)]),
++  enable_polkit=$enableval,
++  enable_polkit=auto)
++
++if test "x$enable_polkit" != "xno"; then
++  PKG_CHECK_MODULES(POLKIT,
++    polkit-gobject-1 >= $POLKIT_REQUIRED_VERSION,
++    have_polkit=yes,
++    have_polkit=no)
++  if test "x$enable_polkit"  = "xyes" -a "x$have_polkit" = "xno"; then
++    AC_MSG_ERROR([PolicyKit support explicitly requested but dependencies not found])
++  fi
++fi
++
+ if test "x$have_polkit" = "xyes" ; then
+        AC_DEFINE(HAVE_POLKIT, [], [Define if we have polkit])
+ fi
diff --git a/package/consolekit/consolekit-shutdown-reboot-without-policies.patch b/package/consolekit/consolekit-shutdown-reboot-without-policies.patch
new file mode 100644
index 0000000..1d9bd8a
--- /dev/null
+++ b/package/consolekit/consolekit-shutdown-reboot-without-policies.patch
@@ -0,0 +1,31 @@
+From: Romain Perier <mrpouet@gentoo.org>
+Date: Sat, 24 Oct 2009 18:43:43 +0200
+Subject: [PATCH] Be able to shutdown or reboot even without polkit or RBAC
+supports
+
+Ck does NOTHING at the origin if its built without polkit or RBAC supports, 
+except display a warning using g_warning() (which does not make sense).
+The trick is to to call do_stop()/do_restart() in the #else directive :)
+
+Upstream-Status:	Pending
+URL:			http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86
+			/sys-auth/consolekit-shutdown-reboot-without-policies.patch
+
+--- ConsoleKit-0.4.5.org/src/ck-manager.c	2013-02-21 17:05:13.999353431 +0200
++++ ConsoleKit-0.4.5/src/ck-manager.c	2013-02-21 17:09:08.290130585 +0200
+@@ -1131,6 +1131,7 @@
+         check_rbac_permissions (manager, context, RBAC_SHUTDOWN_KEY, do_restart);
+ #else
+         g_warning ("Compiled without PolicyKit or RBAC support!");
++        do_restart(manager, context);
+ #endif
+ 
+         return TRUE;
+@@ -1207,6 +1208,7 @@
+         check_rbac_permissions (manager, context, RBAC_SHUTDOWN_KEY, do_stop);
+ #else
+         g_warning ("Compiled without PolicyKit or RBAC support!");
++        do_stop(manager, context);
+ #endif
+ 
+         return TRUE;
diff --git a/package/consolekit/consolekit.mk b/package/consolekit/consolekit.mk
new file mode 100644
index 0000000..25b552c
--- /dev/null
+++ b/package/consolekit/consolekit.mk
@@ -0,0 +1,40 @@
+#############################################################
+#
+# ConsoleKit
+#
+#############################################################
+
+CONSOLEKIT_VERSION = 0.4.5
+CONSOLEKIT_SOURCE = ConsoleKit-$(CONSOLEKIT_VERSION).tar.bz2
+CONSOLEKIT_SITE = http://www.freedesktop.org/software/ConsoleKit/dist
+CONSOLEKIT_DEPENDENCIES = dbus-glib libglib2 linux-pam polkit xlib_libX11 \
+			  libxslt zlib
+CONSOLEKIT_INSTALL_STAGING = YES
+CONSOLEKIT_AUTORECONF = YES
+CONSOLEKIT_CONF_OPT += --disable-static --localstatedir=/var \
+			--libexecdir=/usr/lib/ConsoleKit \
+			--enable-pam-module --disable-udev-acl \
+			--with-dbus-services=/usr/share/dbus-1/services \
+			--with-pam-module-dir=/lib/security
+
+define	CONSOLEKIT_POST_INSTALL
+	# Append ConsoleKit Pam Module Configuration stuff to system-session
+	cat package/consolekit/system-session >> \
+	$(TARGET_DIR)/etc/pam.d/system-session
+	
+	# Helper script that creates a file in /var/run/console named as 
+	# the currently logged in user and that contains the D-Bus address of 
+	# the session
+	$(INSTALL) -m 755 -D package/consolekit/pam-foreground-compat.ck \
+	$(TARGET_DIR)/usr/lib/ConsoleKit/run-session.d/pam-foreground-compat.ck
+
+
+	$(INSTALL) -D package/consolekit/90-consolekit $(TARGET_DIR)/etc/X11/xinit/xinitrc.d/90-consolekit
+
+	# We start right after dbus which is included as /etc/init.d/S30dbus in buildroot
+	$(INSTALL) -m 755 -D package/consolekit/S35consolekit $(TARGET_DIR)/etc/init.d/S35consolekit
+endef
+
+CONSOLEKIT_POST_INSTALL_TARGET_HOOKS += CONSOLEKIT_POST_INSTALL 
+
+$(eval $(autotools-package))
diff --git a/package/consolekit/pam-foreground-compat.ck b/package/consolekit/pam-foreground-compat.ck
new file mode 100755
index 0000000..9688e87
--- /dev/null
+++ b/package/consolekit/pam-foreground-compat.ck
@@ -0,0 +1,18 @@
+#!/bin/sh
+
+TAGDIR=/var/run/console
+
+[ -n "$CK_SESSION_USER_UID" ] || exit 1
+
+
+TAGFILE="$TAGDIR/`getent passwd $CK_SESSION_USER_UID | cut -f 1 -d:`"
+
+if [ "$1" = "session_added" ]; then
+	mkdir -p "$TAGDIR"
+	echo "$CK_SESSION_ID" >> "$TAGFILE"
+fi
+
+if [ "$1" = "session_removed" ] && [ -e "$TAGFILE" ]; then
+	sed -i "\%^$CK_SESSION_ID\$%d" "$TAGFILE"
+	[ -s "$TAGFILE" ] || rm -f "$TAGFILE"
+fi
diff --git a/package/consolekit/system-session b/package/consolekit/system-session
new file mode 100644
index 0000000..3825efe
--- /dev/null
+++ b/package/consolekit/system-session
@@ -0,0 +1,6 @@
+# Begin ConsoleKit addition
+
+session   optional    pam_loginuid.so
+session   optional    pam_ck_connector.so nox11
+
+# End ConsoleKit addition
-- 
1.7.7.6
