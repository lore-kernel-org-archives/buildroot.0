From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Oct 2018 09:53:55 +0200
Subject: [Buildroot] [git commit] gstreamer1-editing-services: fix libgtk3
 compile
Message-ID: <20181014075244.62801835FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c37d5c171c39f0bf859ba397c34f2122d655bf8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream patches fixing examples/c/ges-ui.c for libgtk3.

Fixes [1]:

  ges-ui.c:109:34: error: unknown type name 'GtkObject'; did you mean 'AtkObject'?
   gboolean window_delete_event_cb (GtkObject * window, GdkEvent * event,
                                    ^~~~~~~~~
                                    AtkObject

[1] http://autobuild.buildroot.net/results/92010fb84fb7eda3881fa54c6b55e27c8913bb2f

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-examples-ges-ui-fix-some-gtk2-ism.patch   | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/package/gstreamer1/gstreamer1-editing-services/0001-examples-ges-ui-fix-some-gtk2-ism.patch b/package/gstreamer1/gstreamer1-editing-services/0001-examples-ges-ui-fix-some-gtk2-ism.patch
new file mode 100644
index 0000000000..5a074941fd
--- /dev/null
+++ b/package/gstreamer1/gstreamer1-editing-services/0001-examples-ges-ui-fix-some-gtk2-ism.patch
@@ -0,0 +1,66 @@
+From 76f3dcb8f11a240fc7147ab556c57f10abc9e957 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim-Philipp=20M=C3=BCller?= <tim@centricular.com>
+Date: Sun, 20 May 2018 23:46:42 +0100
+Subject: [PATCH] examples: ges-ui: fix some gtk2-ism
+
+Still lots of deprecated API to update.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=796243
+
+Upstream: https://cgit.freedesktop.org/gstreamer/gst-editing-services/commit/?id=76f3dcb8f11a240fc7147ab556c57f10abc9e957
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ examples/c/ges-ui.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/examples/c/ges-ui.c b/examples/c/ges-ui.c
+index 4acd1ee9..45694a6b 100644
+--- a/examples/c/ges-ui.c
++++ b/examples/c/ges-ui.c
+@@ -106,7 +106,7 @@ static int n_instances = 0;
+  * These are declared non-static for signal auto-connection
+  */
+ 
+-gboolean window_delete_event_cb (GtkObject * window, GdkEvent * event,
++gboolean window_delete_event_cb (GtkWidget * window, GdkEvent * event,
+     App * app);
+ void new_activate_cb (GtkMenuItem * item, App * app);
+ void open_activate_cb (GtkMenuItem * item, App * app);
+@@ -1076,14 +1076,14 @@ gboolean
+ add_effect_dlg_delete_event_cb (GtkWidget * widget, GdkEvent * event,
+     gpointer * app)
+ {
+-  gtk_widget_hide_all (((App *) app)->add_effect_dlg);
++  gtk_widget_hide (((App *) app)->add_effect_dlg);
+   return TRUE;
+ }
+ 
+ void
+ on_cancel_add_effect_cb (GtkButton * button, App * app)
+ {
+-  gtk_widget_hide_all (app->add_effect_dlg);
++  gtk_widget_hide (app->add_effect_dlg);
+ }
+ 
+ void
+@@ -1103,7 +1103,7 @@ on_apply_effect_cb (GtkButton * button, App * app)
+ 
+   gtk_entry_set_text (GTK_ENTRY (app->audio_effect_entry), "");
+ 
+-  gtk_widget_hide_all (app->add_effect_dlg);
++  gtk_widget_hide (app->add_effect_dlg);
+ }
+ 
+ static void
+@@ -1347,7 +1347,7 @@ app_new_from_uri (gchar * uri)
+ /* UI callbacks  ************************************************************/
+ 
+ gboolean
+-window_delete_event_cb (GtkObject * window, GdkEvent * event, App * app)
++window_delete_event_cb (GtkWidget * window, GdkEvent * event, App * app)
+ {
+   app_dispose (app);
+   return FALSE;
+-- 
+2.19.0
+
