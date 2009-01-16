From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 16 Jan 2009 22:06:50 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/alsa-utils
Message-ID: <20090116220650.ED9C377580@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-16 22:06:49 +0000 (Fri, 16 Jan 2009)
New Revision: 24890

Log:
Fix legacy strings for alsa-utils & remove man pages

Added:
   trunk/buildroot/package/multimedia/alsa-utils/alsa-utils-1.0.18-fix_sysv_legacy.patch
   trunk/buildroot/package/multimedia/alsa-utils/alsa-utils-1.0.18-remove_man.patch


Changeset:
Added: trunk/buildroot/package/multimedia/alsa-utils/alsa-utils-1.0.18-fix_sysv_legacy.patch
===================================================================
--- trunk/buildroot/package/multimedia/alsa-utils/alsa-utils-1.0.18-fix_sysv_legacy.patch	                        (rev 0)
+++ trunk/buildroot/package/multimedia/alsa-utils/alsa-utils-1.0.18-fix_sysv_legacy.patch	2009-01-16 22:06:49 UTC (rev 24890)
@@ -0,0 +1,20 @@
+--- a/alsactl/init_parse.c	2009-01-15 10:44:48.000000000 +0000
++++ b/alsactl/init_parse.c	2009-01-15 10:46:41.000000000 +0000
+@@ -381,7 +381,7 @@ static int set_ctl_value(struct space *s
+ 				snd_ctl_elem_value_set_integer(space->ctl_value, idx, val);
+ 			} else if (items > 2 && value[items-2] == 'd' && value[items-1] == 'B') {
+ 				val = strtol(value, NULL, 0) * 100;
+-				if ((pos2 = index(value, '.')) != NULL) {
++				if ((pos2 = strchr(value, '.')) != NULL) {
+ 					if (isdigit(*(pos2-1)) && isdigit(*(pos2-2))) {
+ 						if (val < 0)
+ 							val -= strtol(pos2 + 1, NULL, 0);
+@@ -1253,7 +1253,7 @@ static char *new_root_dir(const char *fi
+ 
+ 	res = strdup(filename);
+ 	if (res) {
+-		tmp = rindex(res, '/');
++		tmp = strrchr(res, '/');
+ 		if (tmp)
+ 			*tmp = '\0';
+ 	}

Added: trunk/buildroot/package/multimedia/alsa-utils/alsa-utils-1.0.18-remove_man.patch
===================================================================
--- trunk/buildroot/package/multimedia/alsa-utils/alsa-utils-1.0.18-remove_man.patch	                        (rev 0)
+++ trunk/buildroot/package/multimedia/alsa-utils/alsa-utils-1.0.18-remove_man.patch	2009-01-16 22:06:49 UTC (rev 24890)
@@ -0,0 +1,11 @@
+--- a/alsactl/Makefile.in	2009-01-15 10:59:38.000000000 +0000
++++ b/alsactl/Makefile.in	2009-01-15 10:59:34.000000000 +0000
+@@ -204,7 +204,7 @@ sharedstatedir = @sharedstatedir@
+ sysconfdir = @sysconfdir@
+ target_alias = @target_alias@
+ SUBDIRS = init
+-man_MANS = alsactl.1 alsactl_init.7
++man_MANS = alsactl.1
+ EXTRA_DIST = alsactl.1 alsactl_init.xml
+ alsactl_SOURCES = alsactl.c state.c utils.c init_parse.c
+ noinst_HEADERS = alsactl.h list.h init_sysdeps.c init_utils_string.c init_utils_run.c init_sysfs.c
