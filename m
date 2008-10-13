From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 13 Oct 2008 05:42:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20081013124229.7FE713C8A1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-13 05:42:29 -0700 (Mon, 13 Oct 2008)
New Revision: 23667

Log:
busybox: add 1.12.1 modprobe fix

Added:
   trunk/buildroot/package/busybox/busybox-1.12.1-modprobe.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.12.1-modprobe.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.12.1-modprobe.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.12.1-modprobe.patch	2008-10-13 12:42:29 UTC (rev 23667)
@@ -0,0 +1,33 @@
+diff -urN busybox-1.12.1/modutils/modprobe.c busybox-1.12.1-modprobe/modutils/modprobe.c
+--- busybox-1.12.1/modutils/modprobe.c	2008-09-28 20:04:15.000000000 +0200
++++ busybox-1.12.1-modprobe/modutils/modprobe.c	2008-10-10 14:36:58.000000000 +0200
+@@ -263,9 +263,9 @@
+ 	return TRUE;
+ }
+ 
+-static int include_conf_recursive(struct include_conf_t *conf, const char *filename)
++static int include_conf_recursive(struct include_conf_t *conf, const char *filename, int flags)
+ {
+-	return recursive_action(filename, ACTION_RECURSE,
++	return recursive_action(filename, ACTION_RECURSE | flags,
+ 				include_conf_file_act,
+ 				include_conf_dir_act,
+ 				conf, 1);
+@@ -362,7 +362,7 @@
+ 			char *includefile;
+ 
+ 			includefile = skip_whitespace(line_buffer + 8);
+-			include_conf_recursive(conf, includefile);
++			include_conf_recursive(conf, includefile, 0);
+ 		} else if (ENABLE_FEATURE_MODPROBE_BLACKLIST &&
+ 				(is_conf_command(line_buffer, "blacklist"))) {
+ 			char *mod;
+@@ -559,7 +559,7 @@
+ 		if (ENABLE_FEATURE_2_6_MODULES) {
+ 			if (include_conf_file(&conf, "/etc/modprobe.conf"))
+ 				r = TRUE;
+-			if (include_conf_recursive(&conf, "/etc/modprobe.d"))
++			if (include_conf_recursive(&conf, "/etc/modprobe.d", ACTION_QUIET))
+ 				r = TRUE;
+ 		}
+ 		if (ENABLE_FEATURE_2_4_MODULES && !r)
