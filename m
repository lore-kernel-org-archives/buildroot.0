From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 13 Nov 2008 08:32:56 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20081113163256.D28F83C8A1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-13 08:32:56 -0800 (Thu, 13 Nov 2008)
New Revision: 24031

Log:
busybox: add 1.13.x, mark older as deprecated

Added:
   trunk/buildroot/package/busybox/busybox-1.13.0-getopt.patch
   trunk/buildroot/package/busybox/busybox-1.13.0-lineedit.patch
   trunk/buildroot/package/busybox/busybox-1.13.0-modprobe.patch

Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2008-11-13 16:32:52 UTC (rev 24030)
+++ trunk/buildroot/package/busybox/Config.in	2008-11-13 16:32:56 UTC (rev 24031)
@@ -12,7 +12,7 @@
 choice
 	prompt "BusyBox Version"
 	depends on BR2_PACKAGE_BUSYBOX
-	default BR2_BUSYBOX_VERSION_1_12_X
+	default BR2_BUSYBOX_VERSION_1_13_X
 	help
 	  Select the version of BusyBox you wish to use.
 
@@ -38,14 +38,19 @@
 
 	config BR2_BUSYBOX_VERSION_1_10_X
 		bool "BusyBox 1.10.x"
-		depends on BR2_DEPRECATED || BR2_RECENT
+		depends on BR2_DEPRECATED
 
 	config BR2_BUSYBOX_VERSION_1_11_X
 		bool "BusyBox 1.11.x"
+		depends on BR2_DEPRECATED
 
 	config BR2_BUSYBOX_VERSION_1_12_X
 		bool "BusyBox 1.12.x"
+		depends on BR2_DEPRECATED || BR2_RECENT
 
+	config BR2_BUSYBOX_VERSION_1_13_X
+		bool "BusyBox 1.13.x"
+
 	config BR2_PACKAGE_BUSYBOX_SNAPSHOT
 		bool "daily snapshot"
 
@@ -61,6 +66,7 @@
 	default "1.10.4"	if BR2_BUSYBOX_VERSION_1_10_X
 	default "1.11.3"	if BR2_BUSYBOX_VERSION_1_11_X
 	default "1.12.2"	if BR2_BUSYBOX_VERSION_1_12_X
+	default "1.13.0"	if BR2_BUSYBOX_VERSION_1_13_X
 
 config BR2_PACKAGE_BUSYBOX_FULLINSTALL
 	bool "Run BusyBox's own full installation"
@@ -87,6 +93,7 @@
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_10_X
 	default "package/busybox/busybox-1.11.x.config" if BR2_BUSYBOX_VERSION_1_11_X
 	default "package/busybox/busybox-1.11.x.config" if BR2_BUSYBOX_VERSION_1_12_X
+	default "package/busybox/busybox-1.11.x.config" if BR2_BUSYBOX_VERSION_1_13_X
 	help
 	  Some people may wish to use their own modified BusyBox configuration
 	  file, and will specify their config file location with this option.

Added: trunk/buildroot/package/busybox/busybox-1.13.0-getopt.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.0-getopt.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.13.0-getopt.patch	2008-11-13 16:32:56 UTC (rev 24031)
@@ -0,0 +1,22 @@
+--- busybox-1.13.0/libbb/getopt32.c	Thu Oct 30 08:41:34 2008
++++ busybox-1.13.0-getopt/libbb/getopt32.c	Wed Nov 12 23:04:01 2008
+@@ -515,6 +515,19 @@
+ 		}
+ 	}
+ 
++	/* In case getopt32 was already called:
++	 * reset the libc getopt() function, which keeps internal state.
++	 * run_nofork_applet_prime() does this, but we might end up here
++	 * also via gunzip_main() -> gzip_main(). Play safe.
++	 */
++#ifdef __GLIBC__
++	optind = 0;
++#else /* BSD style */
++	optind = 1;
++	/* optreset = 1; */
++#endif
++	/* optarg = NULL; opterr = 0; optopt = 0; - do we need this?? */
++
+ 	pargv = NULL;
+ 
+ 	/* Note: just "getopt() <= 0" will not work well for

Added: trunk/buildroot/package/busybox/busybox-1.13.0-lineedit.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.0-lineedit.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.13.0-lineedit.patch	2008-11-13 16:32:56 UTC (rev 24031)
@@ -0,0 +1,13 @@
+--- busybox-1.13.0/libbb/lineedit.c	Wed Nov  5 22:39:54 2008
++++ busybox-1.13.0-lineedit/libbb/lineedit.c	Wed Nov 12 23:18:05 2008
+@@ -1415,8 +1415,10 @@
+ 	if ((state->flags & SAVE_HISTORY) && state->hist_file)
+ 		load_history(state->hist_file);
+ #endif
++#if MAX_HISTORY > 0
+ 	if (state->flags & DO_HISTORY)
+ 		state->cur_history = state->cnt_history;
++#endif
+ 
+ 	/* prepare before init handlers */
+ 	cmdedit_y = 0;  /* quasireal y, not true if line > xt*yt */

Added: trunk/buildroot/package/busybox/busybox-1.13.0-modprobe.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.0-modprobe.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.13.0-modprobe.patch	2008-11-13 16:32:56 UTC (rev 24031)
@@ -0,0 +1,47 @@
+--- busybox-1.13.0/modutils/modprobe-small.c	Thu Oct 30 08:41:28 2008
++++ busybox-1.13.0-modprobe/modutils/modprobe-small.c	Mon Nov 10 22:19:03 2008
+@@ -600,18 +600,22 @@
+ 	free(deps);
+ 
+ 	/* modprobe -> load it */
+-	if (!is_rmmod && (options && !strstr(options, "blacklist"))) {
+-		errno = 0;
+-		if (load_module(info->pathname, options) != 0) {
+-			if (EEXIST != errno) {
+-				bb_error_msg("'%s': %s",
++	if (!is_rmmod) {
++		if (!options || strstr(options, "blacklist") == NULL) {
++			errno = 0;
++			if (load_module(info->pathname, options) != 0) {
++				if (EEXIST != errno) {
++					bb_error_msg("'%s': %s",
+ 						info->pathname,
+ 						moderror(errno));
+-			} else {
+-				dbg1_error_msg("'%s': %s",
++				} else {
++					dbg1_error_msg("'%s': %s",
+ 						info->pathname,
+ 						moderror(errno));
++				}
+ 			}
++		} else {
++			dbg1_error_msg("'%s': blacklisted", info->pathname);
+ 		}
+ 	}
+  ret:
+--- busybox-1.13.0/modutils/modutils-24.c	Thu Oct 30 08:41:28 2008
++++ busybox-1.13.0-modprobe/modutils/modutils-24.c	Wed Nov 12 01:02:54 2008
+@@ -3236,8 +3236,10 @@
+ 	}
+ 
+ 	shnum = f->header.e_shnum;
+-	f->sections = xmalloc(sizeof(struct obj_section *) * shnum);
+-	memset(f->sections, 0, sizeof(struct obj_section *) * shnum);
++	/* Growth of ->sections vector will be done by
++	 * xrealloc_vector(..., 2, ...), therefore we must allocate
++	 * at least 2^2 = 4 extra elements here. */
++	f->sections = xzalloc(sizeof(f->sections[0]) * (shnum + 4));
+ 
+ 	section_headers = alloca(sizeof(ElfW(Shdr)) * shnum);
+ 	fseek(fp, f->header.e_shoff, SEEK_SET);
