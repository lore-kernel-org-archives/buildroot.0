From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 10 Apr 2014 18:46:36 +0400
Subject: [Buildroot] [PATCH] libglib2: fix compilation for aarch64 and arc
Message-ID: <1397141196-1316-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Copied from here - https://github.com/openembedded/oe-core/blob/master/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch

Initially posted here - http://lists.openembedded.org/pipermail/openembedded-core/2013-October/085174.html

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 ...ror-format-string-errors-from-mismatched-.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/libglib2/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch

diff --git a/package/libglib2/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch b/package/libglib2/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch
new file mode 100644
index 0000000..9b87d9d
--- /dev/null
+++ b/package/libglib2/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch
@@ -0,0 +1,56 @@
+From 0167c3340d8201dca8e9031b61703bbc5ed6ce33 Mon Sep 17 00:00:00 2001
+From: Jan Schmidt <thaytan@noraisin.net>
+Date: Wed, 25 Sep 2013 19:22:26 +1000
+Subject: [PATCH] gio: Fix -Werror format string errors from mismatched ints.
+
+Upstream-Status: Backport
+
+---
+ gio/gdbusmessage.c | 8 ++++----
+ gio/gdbusprivate.c | 4 ++--
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/gio/gdbusmessage.c b/gio/gdbusmessage.c
+index ac233a3..ad77aa6 100644
+--- a/gio/gdbusmessage.c
++++ b/gio/gdbusmessage.c
+@@ -3468,10 +3468,10 @@ g_dbus_message_print (GDBusMessage *message,
+                                           statbuf.st_mode);
+                   g_string_append_printf (fs, "%s" "ino=%" G_GUINT64_FORMAT, fs->len > 0 ? "," : "",
+                                           (guint64) statbuf.st_ino);
+-                  g_string_append_printf (fs, "%s" "uid=%d", fs->len > 0 ? "," : "",
+-                                          statbuf.st_uid);
+-                  g_string_append_printf (fs, "%s" "gid=%d", fs->len > 0 ? "," : "",
+-                                          statbuf.st_gid);
++                  g_string_append_printf (fs, "%s" "uid=%u", fs->len > 0 ? "," : "",
++                                          (guint) statbuf.st_uid);
++                  g_string_append_printf (fs, "%s" "gid=%u", fs->len > 0 ? "," : "",
++                                          (guint) statbuf.st_gid);
+                   g_string_append_printf (fs, "%s" "rdev=%d:%d", fs->len > 0 ? "," : "",
+                                           major (statbuf.st_rdev), minor (statbuf.st_rdev));
+                   g_string_append_printf (fs, "%s" "size=%" G_GUINT64_FORMAT, fs->len > 0 ? "," : "",
+diff --git a/gio/gdbusprivate.c b/gio/gdbusprivate.c
+index 0e5bef2..785a0c0 100644
+--- a/gio/gdbusprivate.c
++++ b/gio/gdbusprivate.c
+@@ -2155,7 +2155,7 @@ write_message_print_transport_debug (gssize bytes_written,
+   _g_dbus_debug_print_lock ();
+   g_print ("========================================================================\n"
+            "GDBus-debug:Transport:\n"
+-           "  >>>> WROTE %" G_GSIZE_FORMAT " bytes of message with serial %d and\n"
++           "  >>>> WROTE %" G_GSSIZE_FORMAT " bytes of message with serial %d and\n"
+            "       size %" G_GSIZE_FORMAT " from offset %" G_GSIZE_FORMAT " on a %s\n",
+            bytes_written,
+            g_dbus_message_get_serial (data->message),
+@@ -2206,7 +2206,7 @@ read_message_print_transport_debug (gssize bytes_read,
+     _g_dbus_debug_print_lock ();
+   g_print ("========================================================================\n"
+            "GDBus-debug:Transport:\n"
+-           "  <<<< READ %" G_GSIZE_FORMAT " bytes of message with serial %d and\n"
++           "  <<<< READ %" G_GSSIZE_FORMAT " bytes of message with serial %d and\n"
+            "       size %d to offset %" G_GSIZE_FORMAT " from a %s\n",
+            bytes_read,
+            serial,
+-- 
+1.8.3.1
+
-- 
1.9.0
