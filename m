From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 23 Jun 2008 04:53:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lm-sensors
Message-ID: <20080623115347.4802E3C651@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-23 04:53:47 -0700 (Mon, 23 Jun 2008)
New Revision: 22477

Log:
lm-sensors: remove unused legacy patch


Removed:
   trunk/buildroot/package/lm-sensors/lm-sensors.01.susv3-legacy.patch.not


Changeset:
Deleted: trunk/buildroot/package/lm-sensors/lm-sensors.01.susv3-legacy.patch.not
===================================================================
--- trunk/buildroot/package/lm-sensors/lm-sensors.01.susv3-legacy.patch.not	2008-06-23 11:53:41 UTC (rev 22476)
+++ trunk/buildroot/package/lm-sensors/lm-sensors.01.susv3-legacy.patch.not	2008-06-23 11:53:47 UTC (rev 22477)
@@ -1,57 +0,0 @@
-diff -rdup lm_sensors-2.10.4.oorig/lib/proc.c lm_sensors-2.10.4/lib/proc.c
---- lm_sensors-2.10.4.oorig/lib/proc.c	2007-07-17 06:53:06.000000000 +0200
-+++ lm_sensors-2.10.4/lib/proc.c	2007-09-20 13:30:39.000000000 +0200
-@@ -93,16 +93,16 @@ int sensors_read_proc_bus(void)
-   while (fgets(line,255,f)) {
-     if (strlen(line) > 0)
-       line[strlen(line)-1] = '\0';
--    if (! (border = rindex(line,'\t')))
-+    if (! (border = strrchr(line,'\t')))
-       goto ERROR;
-     /* Skip algorithm name */
-     *border='\0';
--    if (! (border = rindex(line,'\t')))
-+    if (! (border = strrchr(line,'\t')))
-       goto ERROR;
-     if (! (entry.adapter = strdup(border + 1)))
-       goto FAT_ERROR;
-     *border='\0';
--    if (! (border = rindex(line,'\t')))
-+    if (! (border = strrchr(line,'\t')))
-       goto ERROR;
-     *border='\0';
-     if (strncmp(line,"i2c-",4))
-@@ -155,8 +155,8 @@ int sensors_read_proc(sensors_chip_name 
- 		strcpy(n, name.busname);
- 		strcat(n, "/");
- 		strcpy(altn, n);
--		/* use rindex to append sysname to n */
--		getsysname(the_feature, rindex(n, '\0'), &mag, rindex(altn, '\0'));
-+		/* use strrchr to append sysname to n */
-+		getsysname(the_feature, strrchr(n, '\0'), &mag, strrchr(altn, '\0'));
- 		if ((f = fopen(n, "r")) != NULL
- 		 || (f = fopen(altn, "r")) != NULL) {
- 			int res = fscanf(f, "%lf", value);
-@@ -198,8 +198,8 @@ int sensors_write_proc(sensors_chip_name
- 		strcpy(n, name.busname);
- 		strcat(n, "/");
- 		strcpy(altn, n);
--		/* use rindex to append sysname to n */
--		getsysname(the_feature, rindex(n, '\0'), &mag, rindex(altn, '\0'));
-+		/* use strrchr to append sysname to n */
-+		getsysname(the_feature, strrchr(n, '\0'), &mag, strrchr(altn, '\0'));
- 		if ((f = fopen(n, "w")) != NULL
- 		 || (f = fopen(altn, "w")) != NULL) {
- 			for (; mag > 0; mag --)
-diff -rdup lm_sensors-2.10.4.oorig/prog/dump/i2cbusses.c lm_sensors-2.10.4/prog/dump/i2cbusses.c
---- lm_sensors-2.10.4.oorig/prog/dump/i2cbusses.c	2007-07-17 06:53:10.000000000 +0200
-+++ lm_sensors-2.10.4/prog/dump/i2cbusses.c	2007-09-20 13:29:19.000000000 +0200
-@@ -185,7 +185,7 @@ found:
- 				fprintf(stderr, "%s: read error\n", n);
- 				continue;
- 			}
--			if((border = index(x, '\n')) != NULL)
-+			if((border = strchr(x, '\n')) != NULL)
- 				*border = 0;
- 			if(count++ == 0 && !procfmt)
- 				fprintf(stderr,"  Installed I2C busses:\n");
