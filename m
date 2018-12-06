From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  6 Dec 2018 23:39:09 +0100
Subject: [Buildroot] [PATCH 1/1] liboping: fix format-truncation error
Message-ID: <20181206223909.23161-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

liboping.c: In function 'ping_host_add':
liboping.c:207:9: error: '%s' directive output may be truncated writing
up to 255 bytes into a region of size 243 [-Werror=format-truncation=]
    "%s: %s", function, message);
         ^~
liboping.c:1644:40:
    ping_set_error (obj, "getaddrinfo", errmsg);
                                        ~~~~~~
liboping.c:206:2: note: 'snprintf' output between 14 and 269 bytes into
a destination of size 256
  snprintf (obj->errmsg, sizeof (obj->errmsg),
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    "%s: %s", function, message);

Fixes:
 - http://autobuild.buildroot.org/results/b12d86388b495a96194e0bcbb5c19a4e35cbc53d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...size-to-make-GCC-s-truncation-check-happy.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/liboping/0001-ping_host_add-Decrease-buffer-size-to-make-GCC-s-truncation-check-happy.patch

diff --git a/package/liboping/0001-ping_host_add-Decrease-buffer-size-to-make-GCC-s-truncation-check-happy.patch b/package/liboping/0001-ping_host_add-Decrease-buffer-size-to-make-GCC-s-truncation-check-happy.patch
new file mode 100644
index 0000000000..b0aca8a715
--- /dev/null
+++ b/package/liboping/0001-ping_host_add-Decrease-buffer-size-to-make-GCC-s-truncation-check-happy.patch
@@ -0,0 +1,31 @@
+From 18ca43507b351f339ff23062541ee8d58e813a53 Mon Sep 17 00:00:00 2001
+From: Florian Forster <ff@octo.it>
+Date: Sun, 29 Jul 2018 14:34:19 +0200
+Subject: [PATCH] ping_host_add: Decrease buffer size to make GCC's truncation
+ check happy.
+
+Fixes: #38
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/octo/liboping/commit/18ca43507b351f339ff23062541ee8d58e813a53]
+---
+ src/liboping.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/src/liboping.c b/src/liboping.c
+index 5253e8c..2470988 100644
+--- a/src/liboping.c
++++ b/src/liboping.c
+@@ -1636,10 +1636,8 @@ int ping_host_add (pingobj_t *obj, const char *host)
+ 		}
+ 		else
+ 		{
+-			char errmsg[PING_ERRMSG_LEN];
+-
+-			snprintf (errmsg, PING_ERRMSG_LEN, "Unknown `ai_family': %i", ai_ptr->ai_family);
+-			errmsg[PING_ERRMSG_LEN - 1] = '\0';
++			char errmsg[64];
++			snprintf (errmsg, sizeof(errmsg), "Unknown `ai_family': %d", ai_ptr->ai_family);
+ 
+ 			dprintf ("%s", errmsg);
+ 			ping_set_error (obj, "getaddrinfo", errmsg);
-- 
2.14.1
