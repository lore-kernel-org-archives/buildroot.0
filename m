From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jul 2016 09:46:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/inotify-tools: Fix compilation with
	gcc6
Message-ID: <1469951201-1866-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/abc/abcaf70523863a4cd096a1b063be2e742355849f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/inotify-tools/0001-gcc6.patch | 49 +++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/inotify-tools/0001-gcc6.patch

diff --git a/package/inotify-tools/0001-gcc6.patch b/package/inotify-tools/0001-gcc6.patch
new file mode 100644
index 0000000..aae622e
--- /dev/null
+++ b/package/inotify-tools/0001-gcc6.patch
@@ -0,0 +1,49 @@
+From 5fe3ba82134d8b85adc69cf1d6c5742b4bde20b4 Mon Sep 17 00:00:00 2001
+From: James Knight <james.d.knight@live.com>
+Date: Thu, 16 Jun 2016 00:00:57 -0400
+Subject: [PATCH] correct code alignment
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The following replaces the indented section of code from spaces to tabs.
+No functional changes. Aside from consistency, this resolves a GCC 6
+build issue with the flag `-Werror=misleading-indentation` enabled:
+
+    inotifywait.c: In function ?output_event_csv?:
+    inotifywait.c:126:5: error: this ?if? clause does not guard...
+                                [-Werror=misleading-indentation]
+         if (filename != NULL)
+         ^~
+    inotifywait.c:129:2: note: ...this statement, but the latter is
+                               misleadingly indented as if it is guarded
+                               by the ?if?
+      printf("%s,", csv_escape( inotifytools_event_to_str( event->mask )
+                                                                    ) );
+      ^~~~~~
+
+Signed-off-by: James Knight <james.d.knight@live.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(downloaded from upstream pull request
+ https://github.com/rvoicilas/inotify-tools/pull/65)
+---
+ src/inotifywait.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/inotifywait.c b/src/inotifywait.c
+index c5ce5e3..404a85b 100644
+--- a/src/inotifywait.c
++++ b/src/inotifywait.c
+@@ -122,9 +122,9 @@ void validate_format( char * fmt ) {
+ 
+ 
+ void output_event_csv( struct inotify_event * event ) {
+-    char *filename = csv_escape(inotifytools_filename_from_wd(event->wd));
+-    if (filename != NULL)
+-        printf("%s,", filename);
++	char *filename = csv_escape(inotifytools_filename_from_wd(event->wd));
++	if (filename != NULL)
++		printf("%s,", filename);
+ 
+ 	printf("%s,", csv_escape( inotifytools_event_to_str( event->mask ) ) );
+ 	if ( event->len > 0 )
-- 
2.8.1
