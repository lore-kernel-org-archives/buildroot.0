From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Mon,  4 Dec 2006 18:16:04 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: module-init-tools
	procps util-linux
Message-ID: <20061205021604.A897A48573@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2006-12-04 18:16:03 -0800 (Mon, 04 Dec 2006)
New Revision: 16782

Log:
Patch packages to remove legacy and deprecated functions. All of these patches have been sent upstream to the various maintainers.


Added:
   trunk/buildroot/package/module-init-tools/module-init-tools-remove-index.patch
   trunk/buildroot/package/procps/procps-remove-index.patch
   trunk/buildroot/package/util-linux/util-linux-remove-deprecated-functions.patch


Changeset:
Added: trunk/buildroot/package/module-init-tools/module-init-tools-remove-index.patch
===================================================================
--- trunk/buildroot/package/module-init-tools/module-init-tools-remove-index.patch	2006-12-04 16:04:50 UTC (rev 16781)
+++ trunk/buildroot/package/module-init-tools/module-init-tools-remove-index.patch	2006-12-05 02:16:03 UTC (rev 16782)
@@ -0,0 +1,12 @@
+diff -ur module-init-tools-3.2.2/modprobe.c module-init-tools-3.2.2-patched/modprobe.c
+--- module-init-tools-3.2.2/modprobe.c	2005-12-01 17:42:09.000000000 -0600
++++ module-init-tools-3.2.2-patched/modprobe.c	2006-12-04 19:50:50.353237649 -0600
+@@ -270,7 +270,7 @@
+ 	char *modname;
+ 
+ 	/* Ignore lines without : or which start with a # */
+-	ptr = index(line, ':');
++	ptr = strchr(line, ':');
+ 	if (ptr == NULL || line[strspn(line, "\t ")] == '#')
+ 		return 0;
+ 

Added: trunk/buildroot/package/procps/procps-remove-index.patch
===================================================================
--- trunk/buildroot/package/procps/procps-remove-index.patch	2006-12-04 16:04:50 UTC (rev 16781)
+++ trunk/buildroot/package/procps/procps-remove-index.patch	2006-12-05 02:16:03 UTC (rev 16782)
@@ -0,0 +1,21 @@
+diff -ur procps-3.2.5/sysctl.c procps-3.2.5-patched/sysctl.c
+--- procps-3.2.5/sysctl.c	2005-01-05 15:00:47.000000000 -0600
++++ procps-3.2.5-patched/sysctl.c	2006-12-04 19:51:36.272843000 -0600
+@@ -272,7 +272,7 @@
+       return 0;
+    } /* end if */
+ 
+-   equals = index(setting, '=');
++   equals = strchr(setting, '=');
+  
+    if (!equals) {
+       fprintf(stderr, ERR_NO_EQUALS, setting);
+@@ -498,7 +498,7 @@
+          if (NameOnly && Quiet)   // nonsense
+             return Usage(me);
+          SwitchesAllowed = false;
+-         if (WriteMode || index(*argv, '='))
++         if (WriteMode || strchr(*argv, '='))
+             ReturnCode = WriteSetting(*argv);
+          else
+             ReturnCode = ReadSetting(*argv);

Added: trunk/buildroot/package/util-linux/util-linux-remove-deprecated-functions.patch
===================================================================
--- trunk/buildroot/package/util-linux/util-linux-remove-deprecated-functions.patch	2006-12-04 16:04:50 UTC (rev 16781)
+++ trunk/buildroot/package/util-linux/util-linux-remove-deprecated-functions.patch	2006-12-05 02:16:03 UTC (rev 16782)
@@ -0,0 +1,49 @@
+diff -ur util-linux-2.12r/misc-utils/logger.c util-linux-2.12r-patched/misc-utils/logger.c
+--- util-linux-2.12r/misc-utils/logger.c	2004-09-06 16:13:49.000000000 -0500
++++ util-linux-2.12r-patched/misc-utils/logger.c	2006-12-04 19:52:24.068596984 -0600
+@@ -198,7 +198,7 @@
+ 			} else {
+ 				if (p != buf)
+ 					*p++ = ' ';
+-				bcopy(*argv++, p, len);
++				memcpy(p, *argv++, len);
+ 				*(p += len) = '\0';
+ 			}
+ 		}
+diff -ur util-linux-2.12r/misc-utils/whereis.c util-linux-2.12r-patched/misc-utils/whereis.c
+--- util-linux-2.12r/misc-utils/whereis.c	2001-03-15 04:09:58.000000000 -0600
++++ util-linux-2.12r-patched/misc-utils/whereis.c	2006-12-04 19:52:43.210100415 -0600
+@@ -323,14 +323,14 @@
+ 	char dirbuf[1024];
+ 	struct stat statbuf;
+ 
+-	dd = index(dir, '*');
++	dd = strchr(dir, '*');
+ 	if (!dd)
+ 		goto noglob;
+ 
+ 	l = strlen(dir);
+ 	if (l < sizeof(dirbuf)) { 	/* refuse excessively long names */
+ 		strcpy (dirbuf, dir);
+-		d = index(dirbuf, '*');
++		d = strchr(dirbuf, '*');
+ 		*d = 0;
+ 		dirp = opendir(dirbuf);
+ 		if (dirp == NULL)
+diff -ur util-linux-2.12r/mount/mount.c util-linux-2.12r-patched/mount/mount.c
+--- util-linux-2.12r/mount/mount.c	2004-12-21 16:00:36.000000000 -0600
++++ util-linux-2.12r-patched/mount/mount.c	2006-12-04 19:54:16.317414647 -0600
+@@ -488,11 +488,11 @@
+ 
+    /* Accept a comma-separated list of types, and try them one by one */
+    /* A list like "nonfs,.." indicates types not to use */
+-   if (*types && strncmp(*types, "no", 2) && index(*types,',')) {
++   if (*types && strncmp(*types, "no", 2) && strchr(*types,',')) {
+       char *t = strdup(*types);
+       char *p;
+ 
+-      while((p = index(t,',')) != NULL) {
++      while((p = strchr(t,',')) != NULL) {
+ 	 *p = 0;
+ 	 args.type = *types = t;
+ 	 if(do_mount_syscall (&args) == 0)
