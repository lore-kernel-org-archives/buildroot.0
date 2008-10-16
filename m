From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 16 Oct 2008 12:28:24 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/config
Message-ID: <20081016192824.7F6023C8D0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-16 12:28:23 -0700 (Thu, 16 Oct 2008)
New Revision: 23697

Log:
kconfig: only warn about long help lines, not other types of lines

We have some pretty long depends / default y|n lines in BR, which it
shouldn't complain about.

Modified:
   trunk/buildroot/package/config/lex.zconf.c_shipped
   trunk/buildroot/package/config/zconf.l


Changeset:
Modified: trunk/buildroot/package/config/lex.zconf.c_shipped
===================================================================
--- trunk/buildroot/package/config/lex.zconf.c_shipped	2008-10-16 13:29:13 UTC (rev 23696)
+++ trunk/buildroot/package/config/lex.zconf.c_shipped	2008-10-16 19:28:23 UTC (rev 23697)
@@ -815,7 +815,8 @@
 void append_string(const char *str, int size)
 {
 	int new_size = text_size + size + 1;
-	if (size > 70) {
+
+	if ((YY_START == 2 /* HELP */) && (size > 70)) {
 		fprintf (stderr, "%s:%d warning: Overlong line\n",
 		current_file->name, current_file->lineno);
 	}

Modified: trunk/buildroot/package/config/zconf.l
===================================================================
--- trunk/buildroot/package/config/zconf.l	2008-10-16 13:29:13 UTC (rev 23696)
+++ trunk/buildroot/package/config/zconf.l	2008-10-16 19:28:23 UTC (rev 23697)
@@ -49,7 +49,8 @@
 void append_string(const char *str, int size)
 {
 	int new_size = text_size + size + 1;
-	if (size > 70) {
+
+	if ((YY_START == 2 /* HELP */) && (size > 70)) {
 	        fprintf (stderr, "%s:%d warning: Overlong line\n",
 			 current_file->name, current_file->lineno);
 	}
