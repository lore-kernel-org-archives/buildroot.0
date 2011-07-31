From: Sven Neumann <s.neumann@raumfeld.com>
Date: Sun, 31 Jul 2011 22:18:39 +0200
Subject: [Buildroot] [PATCH] libsoup: add patch to fix CVE-2011-2054
Message-ID: <1312143519-5030-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a security hole that caused some SoupServer users to
unintentionally allow accessing the entire local filesystem when
they thought they were only providing access to a single directory.

This is the change from libsoup-2.34.3 backported to 2.32.2. It
doesn't include the changes to the test suite though.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/libsoup/libsoup-CVE-2011-2054.patch |   32 +++++++++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 package/libsoup/libsoup-CVE-2011-2054.patch

diff --git a/package/libsoup/libsoup-CVE-2011-2054.patch b/package/libsoup/libsoup-CVE-2011-2054.patch
new file mode 100644
index 0000000..0dc5ecc
--- /dev/null
+++ b/package/libsoup/libsoup-CVE-2011-2054.patch
@@ -0,0 +1,32 @@
+From 4617b6ef6dd21931a0153070c5b5ff7ef21b46f8 Mon Sep 17 00:00:00 2001
+From: Dan Winship <danw@gnome.org>
+Date: Wed, 29 Jun 2011 10:04:06 -0400
+Subject: [PATCH] SoupServer: fix to not allow smuggling ".." into path
+
+When SoupServer:raw-paths was set (the default), it was possible to
+sneak ".." segments into the path passed to the SoupServerHandler,
+which could then end up tricking some handlers into retrieving
+arbitrary files from the filesystem. Fix that.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=653258
+
+diff --git a/libsoup/soup-server.c b/libsoup/soup-server.c
+index d56efd1..7225337 100644
+--- a/libsoup/soup-server.c
++++ b/libsoup/soup-server.c
+@@ -779,6 +779,15 @@ got_headers (SoupMessage *req, SoupClientContext *client)
+ 
+ 		uri = soup_message_get_uri (req);
+ 		decoded_path = soup_uri_decode (uri->path);
++
++		if (strstr (decoded_path, "/../") ||
++		    g_str_has_suffix (decoded_path, "/..")) {
++			/* Introducing new ".." segments is not allowed */
++			g_free (decoded_path);
++			soup_message_set_status (req, SOUP_STATUS_BAD_REQUEST);
++			return;
++		}
++
+ 		soup_uri_set_path (uri, decoded_path);
+ 		g_free (decoded_path);
+ 	}
-- 
1.7.4.1
