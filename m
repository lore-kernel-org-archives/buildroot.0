From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2020 18:35:22 +0200
Subject: [Buildroot] [git commit] package/gvfs: fix CVE-2019-12795
Message-ID: <20200329163444.2536C821C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9f38acbf2c28a9ec8c8e8e24e56b9ed4bc71778
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

daemon/gvfsdaemon.c in gvfsd from GNOME gvfs before 1.38.3, 1.40.x
before 1.40.2, and 1.41.x before 1.41.3 opened a private D-Bus server
socket without configuring an authorization rule. A local attacker could
connect to this server socket and issue D-Bus method calls. (Note that
the server socket only accepts a single connection, so the attacker
would have to discover the server and connect to the socket before its
owner does.)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...at-the-connecting-client-is-the-same-user.patch | 96 ++++++++++++++++++++++
 package/gvfs/gvfs.mk                               |  3 +
 2 files changed, 99 insertions(+)

diff --git a/package/gvfs/0006-gvfsdaemon-Check-that-the-connecting-client-is-the-same-user.patch b/package/gvfs/0006-gvfsdaemon-Check-that-the-connecting-client-is-the-same-user.patch
new file mode 100644
index 0000000000..56bef26b0f
--- /dev/null
+++ b/package/gvfs/0006-gvfsdaemon-Check-that-the-connecting-client-is-the-same-user.patch
@@ -0,0 +1,96 @@
+From 70dbfc68a79faac49bd3423e079cb6902522082a Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Wed, 5 Jun 2019 13:33:38 +0100
+Subject: [PATCH] gvfsdaemon: Check that the connecting client is the same user
+
+Otherwise, an attacker who learns the abstract socket address from
+netstat(8) or similar could connect to it and issue D-Bus method
+calls.
+
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+
+[Retrieved from:
+https://gitlab.gnome.org/GNOME/gvfs/commit/70dbfc68a79faac49bd3423e079cb6902522082a]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ daemon/gvfsdaemon.c | 36 +++++++++++++++++++++++++++++++++++-
+ 1 file changed, 35 insertions(+), 1 deletion(-)
+
+diff --git a/daemon/gvfsdaemon.c b/daemon/gvfsdaemon.c
+index 406d4f8e..be148a7b 100644
+--- a/daemon/gvfsdaemon.c
++++ b/daemon/gvfsdaemon.c
+@@ -79,6 +79,7 @@ struct _GVfsDaemon
+   
+   gint mount_counter;
+   
++  GDBusAuthObserver *auth_observer;
+   GDBusConnection *conn;
+   GVfsDBusDaemon *daemon_skeleton;
+   GVfsDBusMountable *mountable_skeleton;
+@@ -171,6 +172,8 @@ g_vfs_daemon_finalize (GObject *object)
+     }
+   if (daemon->conn != NULL)
+     g_object_unref (daemon->conn);
++  if (daemon->auth_observer != NULL)
++    g_object_unref (daemon->auth_observer);
+   
+   g_hash_table_destroy (daemon->registered_paths);
+   g_hash_table_destroy (daemon->client_connections);
+@@ -236,6 +239,35 @@ name_vanished_handler (GDBusConnection *connection,
+   daemon->lost_main_daemon = TRUE;
+ }
+ 
++/*
++ * Authentication observer signal handler that authorizes connections
++ * from the same uid as this process. This matches the behaviour of a
++ * libdbus DBusServer/DBusConnection when no DBusAllowUnixUserFunction
++ * has been set, but is not the default in GDBus.
++ */
++static gboolean
++authorize_authenticated_peer_cb (GDBusAuthObserver *observer,
++                                 G_GNUC_UNUSED GIOStream *stream,
++                                 GCredentials *credentials,
++                                 G_GNUC_UNUSED gpointer user_data)
++{
++  gboolean authorized = FALSE;
++
++  if (credentials != NULL)
++    {
++      GCredentials *own_credentials;
++
++      own_credentials = g_credentials_new ();
++
++      if (g_credentials_is_same_user (credentials, own_credentials, NULL))
++        authorized = TRUE;
++
++      g_object_unref (own_credentials);
++    }
++
++  return authorized;
++}
++
+ static void
+ g_vfs_daemon_init (GVfsDaemon *daemon)
+ {
+@@ -265,6 +297,8 @@ g_vfs_daemon_init (GVfsDaemon *daemon)
+ 
+   daemon->conn = g_bus_get_sync (G_BUS_TYPE_SESSION, NULL, NULL);
+   g_assert (daemon->conn != NULL);
++  daemon->auth_observer = g_dbus_auth_observer_new ();
++  g_signal_connect (daemon->auth_observer, "authorize-authenticated-peer", G_CALLBACK (authorize_authenticated_peer_cb), NULL);
+ 
+   daemon->daemon_skeleton = gvfs_dbus_daemon_skeleton_new ();
+   g_signal_connect (daemon->daemon_skeleton, "handle-get-connection", G_CALLBACK (handle_get_connection), daemon);
+@@ -876,7 +910,7 @@ handle_get_connection (GVfsDBusDaemon *object,
+   server = g_dbus_server_new_sync (address1,
+                                    G_DBUS_SERVER_FLAGS_NONE,
+                                    guid,
+-                                   NULL, /* GDBusAuthObserver */
++                                   daemon->auth_observer,
+                                    NULL, /* GCancellable */
+                                    &error);
+   g_free (guid);
+-- 
+2.24.1
+
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index a3308b713d..b3b18a3482 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -28,6 +28,9 @@ GVFS_IGNORE_CVES += CVE-2019-12447
 # 0005-admin-Ensure-correct-ownership-when-moving-to-file-uri.patch
 GVFS_IGNORE_CVES += CVE-2019-12449
 
+# 0006-gvfsdaemon-Check-that-the-connecting-client-is-the-same-user.patch
+GVFS_IGNORE_CVES += CVE-2019-12795
+
 # Export ac_cv_path_LIBGCRYPT_CONFIG unconditionally to prevent
 # build system from searching the host paths.
 GVFS_CONF_ENV = \
