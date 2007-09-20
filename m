From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 20 Sep 2007 04:38:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lm-sensors
Message-ID: <20070920113821.E6D1630065@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-20 04:38:19 -0700 (Thu, 20 Sep 2007)
New Revision: 19908

Log:
- don't use functions that are marked LEGACY in SUSv3


Added:
   trunk/buildroot/package/lm-sensors/lm-sensors.01.susv3-legacy.patch

Modified:
   trunk/buildroot/package/lm-sensors/lm-sensors.mk


Changeset:
Added: trunk/buildroot/package/lm-sensors/lm-sensors.01.susv3-legacy.patch
===================================================================
--- trunk/buildroot/package/lm-sensors/lm-sensors.01.susv3-legacy.patch	                        (rev 0)
+++ trunk/buildroot/package/lm-sensors/lm-sensors.01.susv3-legacy.patch	2007-09-20 11:38:19 UTC (rev 19908)
@@ -0,0 +1,57 @@
+diff -rdup lm_sensors-2.10.4.oorig/lib/proc.c lm_sensors-2.10.4/lib/proc.c
+--- lm_sensors-2.10.4.oorig/lib/proc.c	2007-07-17 06:53:06.000000000 +0200
++++ lm_sensors-2.10.4/lib/proc.c	2007-09-20 13:30:39.000000000 +0200
+@@ -93,16 +93,16 @@ int sensors_read_proc_bus(void)
+   while (fgets(line,255,f)) {
+     if (strlen(line) > 0)
+       line[strlen(line)-1] = '\0';
+-    if (! (border = rindex(line,'\t')))
++    if (! (border = strrchr(line,'\t')))
+       goto ERROR;
+     /* Skip algorithm name */
+     *border='\0';
+-    if (! (border = rindex(line,'\t')))
++    if (! (border = strrchr(line,'\t')))
+       goto ERROR;
+     if (! (entry.adapter = strdup(border + 1)))
+       goto FAT_ERROR;
+     *border='\0';
+-    if (! (border = rindex(line,'\t')))
++    if (! (border = strrchr(line,'\t')))
+       goto ERROR;
+     *border='\0';
+     if (strncmp(line,"i2c-",4))
+@@ -155,8 +155,8 @@ int sensors_read_proc(sensors_chip_name 
+ 		strcpy(n, name.busname);
+ 		strcat(n, "/");
+ 		strcpy(altn, n);
+-		/* use rindex to append sysname to n */
+-		getsysname(the_feature, rindex(n, '\0'), &mag, rindex(altn, '\0'));
++		/* use strrchr to append sysname to n */
++		getsysname(the_feature, strrchr(n, '\0'), &mag, strrchr(altn, '\0'));
+ 		if ((f = fopen(n, "r")) != NULL
+ 		 || (f = fopen(altn, "r")) != NULL) {
+ 			int res = fscanf(f, "%lf", value);
+@@ -198,8 +198,8 @@ int sensors_write_proc(sensors_chip_name
+ 		strcpy(n, name.busname);
+ 		strcat(n, "/");
+ 		strcpy(altn, n);
+-		/* use rindex to append sysname to n */
+-		getsysname(the_feature, rindex(n, '\0'), &mag, rindex(altn, '\0'));
++		/* use strrchr to append sysname to n */
++		getsysname(the_feature, strrchr(n, '\0'), &mag, strrchr(altn, '\0'));
+ 		if ((f = fopen(n, "w")) != NULL
+ 		 || (f = fopen(altn, "w")) != NULL) {
+ 			for (; mag > 0; mag --)
+diff -rdup lm_sensors-2.10.4.oorig/prog/dump/i2cbusses.c lm_sensors-2.10.4/prog/dump/i2cbusses.c
+--- lm_sensors-2.10.4.oorig/prog/dump/i2cbusses.c	2007-07-17 06:53:10.000000000 +0200
++++ lm_sensors-2.10.4/prog/dump/i2cbusses.c	2007-09-20 13:29:19.000000000 +0200
+@@ -185,7 +185,7 @@ found:
+ 				fprintf(stderr, "%s: read error\n", n);
+ 				continue;
+ 			}
+-			if((border = index(x, '\n')) != NULL)
++			if((border = strchr(x, '\n')) != NULL)
+ 				*border = 0;
+ 			if(count++ == 0 && !procfmt)
+ 				fprintf(stderr,"  Installed I2C busses:\n");

Modified: trunk/buildroot/package/lm-sensors/lm-sensors.mk
===================================================================
--- trunk/buildroot/package/lm-sensors/lm-sensors.mk	2007-09-20 11:14:47 UTC (rev 19907)
+++ trunk/buildroot/package/lm-sensors/lm-sensors.mk	2007-09-20 11:38:19 UTC (rev 19908)
@@ -6,7 +6,7 @@
 LM_SENSORS_VERSION:=2.10.4
 LM_SENSORS_SOURCE:=lm-sensors_$(LM_SENSORS_VERSION).orig.tar.gz
 LM_SENSORS_PATCH:=lm-sensors_$(LM_SENSORS_VERSION)-1.diff.gz
-LM_SENSORS_SITE:=ftp://ftp.debian.org/debian/pool/main/l/lm-sensors/
+LM_SENSORS_SITE:=http://ftp.debian.org/debian/pool/main/l/lm-sensors/
 LM_SENSORS_DIR:=$(BUILD_DIR)/lm_sensors-$(LM_SENSORS_VERSION)
 LM_SENSORS_CAT:=$(ZCAT)
 LM_SENSORS_BINARY:=prog/sensors/sensors
@@ -15,16 +15,20 @@
 $(DL_DIR)/$(LM_SENSORS_SOURCE):
 	$(WGET) -P $(DL_DIR) $(LM_SENSORS_SITE)/$(LM_SENSORS_SOURCE)
 
+ifneq ($(LM_SENSORS_PATCH),)
+LM_SENSORS_PATCH_FILE:=$(DL_DIR)/$(LM_SENSORS_PATCH)
 $(DL_DIR)/$(LM_SENSORS_PATCH):
 	$(WGET) -P $(DL_DIR) $(LM_SENSORS_SITE)/$(LM_SENSORS_PATCH)
+endif
 
-lm-sensors-source: $(DL_DIR)/$(LM_SENSORS_SOURCE) $(DL_DIR)/$(LM_SENSORS_PATCH)
+lm-sensors-source: $(DL_DIR)/$(LM_SENSORS_SOURCE) $(LM_SENSORS_PATCH_FILE)
 
 $(LM_SENSORS_DIR)/.unpacked: $(DL_DIR)/$(LM_SENSORS_SOURCE) $(DL_DIR)/$(LM_SENSORS_PATCH)
 	$(LM_SENSORS_CAT) $(DL_DIR)/$(LM_SENSORS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LM_SENSORS_DIR) package/lm-sensors/ lm-sensors\*.patch
 ifneq ($(LM_SENSORS_PATCH),)
-	(cd $(LM_SENSORS_DIR) && $(LM_SENSORS_CAT) $(DL_DIR)/$(LM_SENSORS_PATCH) | patch -p1)
+	(cd $(LM_SENSORS_DIR) && \
+	 $(LM_SENSORS_CAT) $(LM_SENSORS_PATCH_FILE) | patch -p1)
 	if [ -d $(LM_SENSORS_DIR)/debian/patches ]; then \
 		toolchain/patch-kernel.sh $(LM_SENSORS_DIR) $(LM_SENSORS_DIR)/debian/patches \*.patch; \
 	fi
