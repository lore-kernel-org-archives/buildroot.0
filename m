From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Thu, 19 Jun 2014 23:27:13 +0200
Subject: [Buildroot] [PATCH v2 1/3] libglib2: bump to version 2.40.0
In-Reply-To: <1403213235-16624-1-git-send-email-hadrien.boutteville@gmail.com>
References: <1403213235-16624-1-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <1403213235-16624-2-git-send-email-hadrien.boutteville@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
Changes v1 -> v2:
  - add comments to patches inside Buildroot (Thomas De S.)
---
 ...ror-format-string-errors-from-mismatched-.patch | 56 ----------------------
 package/libglib2/libglib2-0002-no-gtk-doc.patch    | 11 +++++
 package/libglib2/libglib2.mk                       |  4 +-
 3 files changed, 13 insertions(+), 58 deletions(-)
 delete mode 100644 package/libglib2/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch
 create mode 100644 package/libglib2/libglib2-0002-no-gtk-doc.patch

diff --git a/package/libglib2/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch b/package/libglib2/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch
deleted file mode 100644
index 9b87d9d..0000000
--- a/package/libglib2/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 0167c3340d8201dca8e9031b61703bbc5ed6ce33 Mon Sep 17 00:00:00 2001
-From: Jan Schmidt <thaytan@noraisin.net>
-Date: Wed, 25 Sep 2013 19:22:26 +1000
-Subject: [PATCH] gio: Fix -Werror format string errors from mismatched ints.
-
-Upstream-Status: Backport
-
----
- gio/gdbusmessage.c | 8 ++++----
- gio/gdbusprivate.c | 4 ++--
- 2 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/gio/gdbusmessage.c b/gio/gdbusmessage.c
-index ac233a3..ad77aa6 100644
---- a/gio/gdbusmessage.c
-+++ b/gio/gdbusmessage.c
-@@ -3468,10 +3468,10 @@ g_dbus_message_print (GDBusMessage *message,
-                                           statbuf.st_mode);
-                   g_string_append_printf (fs, "%s" "ino=%" G_GUINT64_FORMAT, fs->len > 0 ? "," : "",
-                                           (guint64) statbuf.st_ino);
--                  g_string_append_printf (fs, "%s" "uid=%d", fs->len > 0 ? "," : "",
--                                          statbuf.st_uid);
--                  g_string_append_printf (fs, "%s" "gid=%d", fs->len > 0 ? "," : "",
--                                          statbuf.st_gid);
-+                  g_string_append_printf (fs, "%s" "uid=%u", fs->len > 0 ? "," : "",
-+                                          (guint) statbuf.st_uid);
-+                  g_string_append_printf (fs, "%s" "gid=%u", fs->len > 0 ? "," : "",
-+                                          (guint) statbuf.st_gid);
-                   g_string_append_printf (fs, "%s" "rdev=%d:%d", fs->len > 0 ? "," : "",
-                                           major (statbuf.st_rdev), minor (statbuf.st_rdev));
-                   g_string_append_printf (fs, "%s" "size=%" G_GUINT64_FORMAT, fs->len > 0 ? "," : "",
-diff --git a/gio/gdbusprivate.c b/gio/gdbusprivate.c
-index 0e5bef2..785a0c0 100644
---- a/gio/gdbusprivate.c
-+++ b/gio/gdbusprivate.c
-@@ -2155,7 +2155,7 @@ write_message_print_transport_debug (gssize bytes_written,
-   _g_dbus_debug_print_lock ();
-   g_print ("========================================================================\n"
-            "GDBus-debug:Transport:\n"
--           "  >>>> WROTE %" G_GSIZE_FORMAT " bytes of message with serial %d and\n"
-+           "  >>>> WROTE %" G_GSSIZE_FORMAT " bytes of message with serial %d and\n"
-            "       size %" G_GSIZE_FORMAT " from offset %" G_GSIZE_FORMAT " on a %s\n",
-            bytes_written,
-            g_dbus_message_get_serial (data->message),
-@@ -2206,7 +2206,7 @@ read_message_print_transport_debug (gssize bytes_read,
-     _g_dbus_debug_print_lock ();
-   g_print ("========================================================================\n"
-            "GDBus-debug:Transport:\n"
--           "  <<<< READ %" G_GSIZE_FORMAT " bytes of message with serial %d and\n"
-+           "  <<<< READ %" G_GSSIZE_FORMAT " bytes of message with serial %d and\n"
-            "       size %d to offset %" G_GSIZE_FORMAT " from a %s\n",
-            bytes_read,
-            serial,
--- 
-1.8.3.1
-
diff --git a/package/libglib2/libglib2-0002-no-gtk-doc.patch b/package/libglib2/libglib2-0002-no-gtk-doc.patch
new file mode 100644
index 0000000..0c12ee4
--- /dev/null
+++ b/package/libglib2/libglib2-0002-no-gtk-doc.patch
@@ -0,0 +1,11 @@
+--- a/gtk-doc.make
++++ b/gtk-doc.make
+@@ -267,7 +267,7 @@
+ #
+ # Require gtk-doc when making dist
+ #
+-if HAVE_GTK_DOC
++if ENABLE_GTK_DOC
+ dist-check-gtkdoc: docs
+ else
+ dist-check-gtkdoc:
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 8df7c55..255b85d 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.38
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
+LIBGLIB2_VERSION_MAJOR = 2.40
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPLv2+
-- 
2.0.0
