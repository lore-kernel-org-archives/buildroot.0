From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 21 Dec 2020 11:42:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/mutt: fix CVE-2020-28896
Message-ID: <20201221104224.57712-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mutt before 2.0.2 and NeoMutt before 2020-11-20 did not ensure that
$ssl_force_tls was processed if an IMAP server's initial server response
was invalid. The connection was not properly closed, and the code could
continue attempting to authenticate. This could result in authentication
credentials being exposed on an unencrypted connection, or to a
machine-in-the-middle.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...n-is-closed-after-a-connection-error.patch | 48 +++++++++++++++++++
 package/mutt/mutt.mk                          |  3 ++
 2 files changed, 51 insertions(+)
 create mode 100644 package/mutt/0001-Ensure-IMAP-connection-is-closed-after-a-connection-error.patch

diff --git a/package/mutt/0001-Ensure-IMAP-connection-is-closed-after-a-connection-error.patch b/package/mutt/0001-Ensure-IMAP-connection-is-closed-after-a-connection-error.patch
new file mode 100644
index 0000000000..7afc736085
--- /dev/null
+++ b/package/mutt/0001-Ensure-IMAP-connection-is-closed-after-a-connection-error.patch
@@ -0,0 +1,48 @@
+From 04b06aaa3e0cc0022b9b01dbca2863756ebbf59a Mon Sep 17 00:00:00 2001
+From: Kevin McCarthy <kevin@8t8.us>
+Date: Mon, 16 Nov 2020 10:20:21 -0800
+Subject: [PATCH] Ensure IMAP connection is closed after a connection error.
+
+During connection, if the server provided an illegal initial response,
+Mutt "bailed", but did not actually close the connection.  The calling
+code unfortunately relied on the connection status to decide to
+continue with authentication, instead of checking the "bail" return
+value.
+
+This could result in authentication credentials being sent over an
+unencrypted connection, without $ssl_force_tls being consulted.
+
+Fix this by strictly closing the connection on any invalid response
+during connection.  The fix is intentionally small, to ease
+backporting.  A better fix would include removing the 'err_close_conn'
+label, and perhaps adding return value checking in the caller (though
+this change obviates the need for that).
+
+This addresses CVE-2020-28896.  Thanks to Gabriel Salles-Loustau for
+reporting the problem, and providing test cases to reproduce.
+
+[Retrieved from:
+https://gitlab.com/muttmua/mutt/-/commit/04b06aaa3e0cc0022b9b01dbca2863756ebbf59a]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ imap/imap.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/imap/imap.c b/imap/imap.c
+index b24e8a3f..b13dd54d 100644
+--- a/imap/imap.c
++++ b/imap/imap.c
+@@ -561,9 +561,9 @@ int imap_open_connection (IMAP_DATA* idata)
+ 
+ #if defined(USE_SSL)
+ err_close_conn:
+-  imap_close_connection (idata);
+ #endif
+ bail:
++  imap_close_connection (idata);
+   FREE (&idata->capstr);
+   return -1;
+ }
+-- 
+GitLab
+
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 0ff03724c1..58c80d445d 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -11,6 +11,9 @@ MUTT_LICENSE_FILES = GPL
 MUTT_DEPENDENCIES = ncurses
 MUTT_CONF_OPTS = --disable-doc --disable-smtp
 
+# 0001-Ensure-IMAP-connection-is-closed-after-a-connection-error.patch
+MUTT_IGNORE_CVES += CVE-2020-28896
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 MUTT_DEPENDENCIES += libiconv
 MUTT_CONF_OPTS += --enable-iconv
-- 
2.29.2
