From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 14:00:51 +0200
Subject: [Buildroot] [git commit] libgtk3: bump to version 3.14.11
Message-ID: <20150331121057.D778B81E2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ef3745617ca48c683480223fe851eeb72f115ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstream patch.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...lug-is-conditionally-supported-on-X11-onl.patch |   57 --------------------
 package/libgtk3/libgtk3.hash                       |    4 +-
 package/libgtk3/libgtk3.mk                         |    2 +-
 3 files changed, 3 insertions(+), 60 deletions(-)

diff --git a/package/libgtk3/0006-window-GtkPlug-is-conditionally-supported-on-X11-onl.patch b/package/libgtk3/0006-window-GtkPlug-is-conditionally-supported-on-X11-onl.patch
deleted file mode 100644
index 081cd1e..0000000
--- a/package/libgtk3/0006-window-GtkPlug-is-conditionally-supported-on-X11-onl.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-window: GtkPlug is conditionally supported on X11 only
-
-Apply an upstream patch to fix a build regression in 3.14.5. This patch
-will be included in the next 3.14.6 release, so we can remove it in the 
-next version bump.
-
-Error message:
-
-./.libs/libgtk-3.so: undefined reference to `GTK_IS_PLUG'
-
-Bug report:
-  https://bugzilla.gnome.org/show_bug.cgi?id=739885
-
-Upstream commit:
-  https://git.gnome.org/browse/gtk+/commit/?id=36fedb0c4b373272afc2d76a7c790d696ed48034
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-From 36fedb0c4b373272afc2d76a7c790d696ed48034 Mon Sep 17 00:00:00 2001
-From: Emmanuele Bassi <ebassi@gnome.org>
-Date: Mon, 10 Nov 2014 14:08:20 +0000
-Subject: [PATCH] window: GtkPlug is conditionally supported on X11 only
-
-We cannot do a type check on it if we don't have the X11 backend
-compiled in.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=739885
----
- gtk/gtkwindow.c |    9 ++++++++-
- 1 files changed, 8 insertions(+), 1 deletions(-)
-
-diff --git a/gtk/gtkwindow.c b/gtk/gtkwindow.c
-index 0d0fb88..6cb355b 100644
---- a/gtk/gtkwindow.c
-+++ b/gtk/gtkwindow.c
-@@ -1610,10 +1610,17 @@ gtk_window_constructed (GObject *object)
- {
-   GtkWindow *window = GTK_WINDOW (object);
-   GtkWindowPrivate *priv = window->priv;
-+  gboolean is_plug;
- 
-   G_OBJECT_CLASS (gtk_window_parent_class)->constructed (object);
- 
--  if (priv->type == GTK_WINDOW_TOPLEVEL && !GTK_IS_PLUG (window))
-+#ifdef GDK_WINDOWING_X11
-+  is_plug = GTK_IS_PLUG (window);
-+#else
-+  is_plug = FALSE;
-+#endif
-+
-+  if (priv->type == GTK_WINDOW_TOPLEVEL && !is_plug)
-     {
-       priv->multipress_gesture = gtk_gesture_multi_press_new (GTK_WIDGET (object));
-       gtk_gesture_single_set_button (GTK_GESTURE_SINGLE (priv->multipress_gesture), 0);
--- 
-1.7.1
-
diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index dc5cf26..e9e900f 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,2 +1,2 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/gtk+/3.14/gtk+-3.14.5.sha256sum
-sha256	ba70f5ccde6646c6d8aa5a6398794b7bcf23fc45af22580a215d258f392dbbe2	gtk+-3.14.5.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.14/gtk+-3.14.11.sha256sum
+sha256	3fb59e99de38001b1b84a7f292553d0e2305991053d6989d6cd09acd1418f7c8	gtk+-3.14.11.tar.xz
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 07c669d..6badba3 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.14
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).5
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).11
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPLv2+
