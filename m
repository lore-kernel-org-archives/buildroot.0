From: <bogus@does.not.exist.com>
Date: Mon, 14 Jul 2008 13:16:20 -0000
Subject: No subject
Message-ID: <mailman.5.1219868315.1340.buildroot@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Modified:
   trunk/buildroot/package/config/lex.zconf.c_shipped
   trunk/buildroot/package/config/zconf.l


Changeset:
Modified: trunk/buildroot/package/config/lex.zconf.c_shipped
===================================================================
--- trunk/buildroot/package/config/lex.zconf.c_shipped	2008-08-27 15:06:41 UTC (rev 23246)
+++ trunk/buildroot/package/config/lex.zconf.c_shipped	2008-08-27 20:18:33 UTC (rev 23247)
@@ -815,6 +815,11 @@
 void append_string(const char *str, int size)
 {
 	int new_size = text_size + size + 1;
+	if (size > 70) {
+		fprintf (stderr, "%s:%d warning: Overlong line\n",
+		current_file->name, current_file->lineno);
+	}
+
 	if (new_size > text_asize) {
 		new_size += START_STRSIZE - 1;
 		new_size &= -START_STRSIZE;

Modified: trunk/buildroot/package/config/zconf.l
===================================================================
--- trunk/buildroot/package/config/zconf.l	2008-08-27 15:06:41 UTC (rev 23246)
+++ trunk/buildroot/package/config/zconf.l	2008-08-27 20:18:33 UTC (rev 23247)
@@ -49,6 +49,10 @@
 void append_string(const char *str, int size)
 {
 	int new_size = text_size + size + 1;
+	if (size > 70) {
+	        fprintf (stderr, "%s:%d warning: Overlong line\n",
+			 current_file->name, current_file->lineno);
+	}
 	if (new_size > text_asize) {
 		new_size += START_STRSIZE - 1;
 		new_size &= -START_STRSIZE;
