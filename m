From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 May 2019 11:40:44 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/libglib2: avoid
 printing null strings
Message-ID: <20190510094009.84A9C83B7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=695d6fb864f4d9e4db19e775e82447ab1d283116
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

GCC 9 is being stricter about passing null string pointers
to printf-like functions.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a5601a6416ad7b9bea40abe4fbd03310d694af70)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-gdbus-Avoid-printing-null-strings.patch   | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/package/libglib2/0003-gdbus-Avoid-printing-null-strings.patch b/package/libglib2/0003-gdbus-Avoid-printing-null-strings.patch
new file mode 100644
index 0000000000..800d3609d6
--- /dev/null
+++ b/package/libglib2/0003-gdbus-Avoid-printing-null-strings.patch
@@ -0,0 +1,73 @@
+From 79492bb914e419c54298ba6324e3d595e51c16c3 Mon Sep 17 00:00:00 2001
+From: Ernestas Kulik <ekulik@redhat.com>
+Date: Tue, 29 Jan 2019 09:50:46 +0100
+Subject: [PATCH] gdbus: Avoid printing null strings
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This mostly affects the 2.56 branch, but, given that GCC 9 is being
+stricter about passing null string pointers to printf-like functions, it
+might make sense to proactively fix such calls.
+
+gdbusauth.c: In function '_g_dbus_auth_run_server':
+gdbusauth.c:1302:11: error: '%s' directive argument is null
+[-Werror=format-overflow=]
+ 1302 |           debug_print ("SERVER: WaitingForBegin, read '%s'",
+ line);
+       |
+
+gdbusmessage.c: In function ???g_dbus_message_to_blob???:
+gdbusmessage.c:2730:30: error: ???%s??? directive argument is null [-Werror=format-overflow=]
+ 2730 |       tupled_signature_str = g_strdup_printf ("(%s)", signature_str);
+      |
+
+Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
+---
+ gio/gdbusauth.c    | 2 +-
+ gio/gdbusmessage.c | 5 ++---
+ 2 files changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/gio/gdbusauth.c b/gio/gdbusauth.c
+index 1f8ea8057..752ec23fc 100644
+--- a/gio/gdbusauth.c
++++ b/gio/gdbusauth.c
+@@ -1272,9 +1272,9 @@ _g_dbus_auth_run_server (GDBusAuth              *auth,
+                                                     &line_length,
+                                                     cancellable,
+                                                     error);
+-          debug_print ("SERVER: WaitingForBegin, read '%s'", line);
+           if (line == NULL)
+             goto out;
++          debug_print ("SERVER: WaitingForBegin, read '%s'", line);
+           if (g_strcmp0 (line, "BEGIN") == 0)
+             {
+               /* YAY, done! */
+diff --git a/gio/gdbusmessage.c b/gio/gdbusmessage.c
+index 3221b925d..3a1a1f9e9 100644
+--- a/gio/gdbusmessage.c
++++ b/gio/gdbusmessage.c
+@@ -2731,7 +2731,6 @@ g_dbus_message_to_blob (GDBusMessage          *message,
+   if (message->body != NULL)
+     {
+       gchar *tupled_signature_str;
+-      tupled_signature_str = g_strdup_printf ("(%s)", signature_str);
+       if (signature == NULL)
+         {
+           g_set_error (error,
+@@ -2739,10 +2738,10 @@ g_dbus_message_to_blob (GDBusMessage          *message,
+                        G_IO_ERROR_INVALID_ARGUMENT,
+                        _("Message body has signature ???%s??? but there is no signature header"),
+                        signature_str);
+-          g_free (tupled_signature_str);
+           goto out;
+         }
+-      else if (g_strcmp0 (tupled_signature_str, g_variant_get_type_string (message->body)) != 0)
++      tupled_signature_str = g_strdup_printf ("(%s)", signature_str);
++      if (g_strcmp0 (tupled_signature_str, g_variant_get_type_string (message->body)) != 0)
+         {
+           g_set_error (error,
+                        G_IO_ERROR,
+--
+2.21.0
+
