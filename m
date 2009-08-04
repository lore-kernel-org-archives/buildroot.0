From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Aug 2009 17:05:48 +0200
Subject: [Buildroot] [git commit] busybox: bump 1.14.x version
Message-ID: <20090804150724.6003B77823@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1c559c3154e64bcdb5213a5e8f6ca754dbcea8e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes various problems.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/Config.in                   |    2 +-
 package/busybox/busybox-1.14.2-df.patch     |  134 -----------------------
 package/busybox/busybox-1.14.2-ls.patch     |  152 ---------------------------
 package/busybox/busybox-1.14.2-test.patch   |   64 -----------
 package/busybox/busybox-1.14.2-udhcpd.patch |   12 --
 5 files changed, 1 insertions(+), 363 deletions(-)
 delete mode 100644 package/busybox/busybox-1.14.2-df.patch
 delete mode 100644 package/busybox/busybox-1.14.2-ls.patch
 delete mode 100644 package/busybox/busybox-1.14.2-test.patch
 delete mode 100644 package/busybox/busybox-1.14.2-udhcpd.patch

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 4b821b4..d72ab3d 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -36,7 +36,7 @@ config BR2_BUSYBOX_VERSION
 	string
 	default "1.12.4"	if BR2_BUSYBOX_VERSION_1_12_X
 	default "1.13.4"	if BR2_BUSYBOX_VERSION_1_13_X
-	default "1.14.2"	if BR2_BUSYBOX_VERSION_1_14_X
+	default "1.14.3"	if BR2_BUSYBOX_VERSION_1_14_X
 
 config BR2_PACKAGE_BUSYBOX_FULLINSTALL
 	bool "Run BusyBox's own full installation"
diff --git a/package/busybox/busybox-1.14.2-df.patch b/package/busybox/busybox-1.14.2-df.patch
deleted file mode 100644
index 7829f5f..0000000
--- a/package/busybox/busybox-1.14.2-df.patch
+++ /dev/null
@@ -1,134 +0,0 @@
---- busybox-1.14.2/coreutils/df.c	Sun Jul  5 22:59:28 2009
-+++ busybox-1.14.2-df/coreutils/df.c	Sun Jul  5 23:00:09 2009
-@@ -44,7 +44,6 @@
- 	FILE *mount_table;
- 	struct mntent *mount_entry;
- 	struct statfs s;
--	static const char ignored_mounts[] ALIGN1 = "rootfs\0";
- 
- 	enum {
- 		OPT_KILO  = (1 << 0),
-@@ -120,7 +119,7 @@
- 			mount_point = *argv++;
- 			if (!mount_point)
- 				break;
--			mount_entry = find_mount_point(mount_point, bb_path_mtab_file);
-+			mount_entry = find_mount_point(mount_point);
- 			if (!mount_entry) {
- 				bb_error_msg("%s: can't find mount point", mount_point);
-  set_error:
-@@ -154,8 +153,8 @@
- 						) / (blocks_used + s.f_bavail);
- 			}
- 
--			/* GNU coreutils 6.10 skip certain mounts, try to be compatible.  */
--			if (index_in_strings(device, ignored_mounts) != -1)
-+			/* GNU coreutils 6.10 skips certain mounts, try to be compatible.  */
-+			if (strcmp(device, "rootfs") == 0)
- 				continue;
- 
- #ifdef WHY_WE_DO_IT_FOR_DEV_ROOT_ONLY
---- busybox-1.14.2/include/libbb.h	Sun Jul  5 22:59:31 2009
-+++ busybox-1.14.2-df/include/libbb.h	Sun Jul  5 23:00:09 2009
-@@ -1025,7 +1025,7 @@
- 
- #ifdef HAVE_MNTENT_H
- extern int match_fstype(const struct mntent *mt, const char *fstypes) FAST_FUNC;
--extern struct mntent *find_mount_point(const char *name, const char *table) FAST_FUNC;
-+extern struct mntent *find_mount_point(const char *name) FAST_FUNC;
- #endif
- extern void erase_mtab(const char * name) FAST_FUNC;
- extern unsigned int tty_baud_to_value(speed_t speed) FAST_FUNC;
---- busybox-1.14.2/libbb/find_mount_point.c	Sun Jul  5 22:59:24 2009
-+++ busybox-1.14.2-df/libbb/find_mount_point.c	Sun Jul  5 23:00:09 2009
-@@ -17,7 +17,7 @@
-  * Given any other file (or directory), find the mount table entry for its
-  * filesystem.
-  */
--struct mntent* FAST_FUNC find_mount_point(const char *name, const char *table)
-+struct mntent* FAST_FUNC find_mount_point(const char *name)
- {
- 	struct stat s;
- 	dev_t mountDevice;
-@@ -25,27 +25,35 @@
- 	struct mntent *mountEntry;
- 
- 	if (stat(name, &s) != 0)
--		return 0;
-+		return NULL;
- 
--	if ((s.st_mode & S_IFMT) == S_IFBLK)
-+	if (S_ISBLK(s.st_mode))
- 		mountDevice = s.st_rdev;
- 	else
- 		mountDevice = s.st_dev;
- 
- 
--	mountTable = setmntent(table ? table : bb_path_mtab_file, "r");
-+	mountTable = setmntent(bb_path_mtab_file, "r");
- 	if (!mountTable)
- 		return 0;
- 
--	while ((mountEntry = getmntent(mountTable)) != 0) {
-+	while ((mountEntry = getmntent(mountTable)) != NULL) {
-+		/* rootfs mount in Linux 2.6 exists always,
-+		 * and it makes sense to always ignore it.
-+		 * Otherwise people can't reference their "real" root! */
-+		if (strcmp(mountEntry->mnt_fsname, "rootfs") == 0)
-+			continue;
-+
- 		if (strcmp(name, mountEntry->mnt_dir) == 0
- 		 || strcmp(name, mountEntry->mnt_fsname) == 0
- 		) { /* String match. */
- 			break;
- 		}
--		if (stat(mountEntry->mnt_fsname, &s) == 0 && s.st_rdev == mountDevice)	/* Match the device. */
-+		/* Match the device. */
-+		if (stat(mountEntry->mnt_fsname, &s) == 0 && s.st_rdev == mountDevice)
- 			break;
--		if (stat(mountEntry->mnt_dir, &s) == 0 && s.st_dev == mountDevice)	/* Match the directory's mount point. */
-+		/* Match the directory's mount point. */
-+		if (stat(mountEntry->mnt_dir, &s) == 0 && s.st_dev == mountDevice)
- 			break;
- 	}
- 	endmntent(mountTable);
---- busybox-1.14.2/util-linux/mkfs_minix.c	Sun Jul  5 22:59:30 2009
-+++ busybox-1.14.2-df/util-linux/mkfs_minix.c	Sun Jul  5 23:00:09 2009
-@@ -624,7 +624,6 @@
- int mkfs_minix_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
- int mkfs_minix_main(int argc UNUSED_PARAM, char **argv)
- {
--	struct mntent *mp;
- 	unsigned opt;
- 	char *tmp;
- 	struct stat statbuf;
-@@ -683,11 +682,8 @@
- 		G.total_blocks = 65535;
- 
- 	/* Check if it is mounted */
--	mp = find_mount_point(G.device_name, NULL);
--	if (mp && strcmp(G.device_name, mp->mnt_fsname) == 0)
--		bb_error_msg_and_die("%s is mounted on %s; "
--				"refusing to make a filesystem",
--				G.device_name, mp->mnt_dir);
-+	if (find_mount_point(G.device_name))
-+		bb_error_msg_and_die("can't format mounted filesystem");
- 
- 	xmove_fd(xopen(G.device_name, O_RDWR), dev_fd);
- 	if (fstat(dev_fd, &statbuf) < 0)
---- busybox-1.14.2/util-linux/mkfs_vfat.c	Sun Jul  5 22:59:30 2009
-+++ busybox-1.14.2-df/util-linux/mkfs_vfat.c	Sun Jul  5 23:00:35 2009
-@@ -273,10 +273,10 @@
- 			device_num == 0x0d00 || // xd
- 			device_num == 0x1600 )  // hdc, hdd
- 		)
--			bb_error_msg_and_die("Will not try to make filesystem on full-disk device (use -I if wanted)");
-+			bb_error_msg_and_die("will not try to make filesystem on full-disk device (use -I if wanted)");
- 		// can't work on mounted filesystems
--		if (find_mount_point(device_name, NULL))
--			bb_error_msg_and_die("Can't format mounted filesystem");
-+		if (find_mount_point(device_name))
-+			bb_error_msg_and_die("can't format mounted filesystem");
- #endif
- 		// get true sector size
- 		// (parameter must be int*, not long* or size_t*)
diff --git a/package/busybox/busybox-1.14.2-ls.patch b/package/busybox/busybox-1.14.2-ls.patch
deleted file mode 100644
index 64e0a94..0000000
--- a/package/busybox/busybox-1.14.2-ls.patch
+++ /dev/null
@@ -1,152 +0,0 @@
-diff -urpN busybox-1.14.2/coreutils/ls.c busybox-1.14.2-ls/coreutils/ls.c
---- busybox-1.14.2/coreutils/ls.c	2009-06-22 00:40:29.000000000 +0200
-+++ busybox-1.14.2-ls/coreutils/ls.c	2009-07-03 12:46:16.000000000 +0200
-@@ -144,8 +144,7 @@ static const char ls_options[] ALIGN1 =
- 	USE_FEATURE_LS_FOLLOWLINKS("L")   /* 1, 24 */
- 	USE_FEATURE_LS_RECURSIVE("R")     /* 1, 25 */
- 	USE_FEATURE_HUMAN_READABLE("h")   /* 1, 26 */
--	USE_SELINUX("K") /* 1, 27 */
--	USE_SELINUX("Z") /* 1, 28 */
-+	USE_SELINUX("KZ") /* 2, 28 */
- 	USE_FEATURE_AUTOWIDTH("T:w:") /* 2, 30 */
- 	;
- enum {
-@@ -162,6 +161,16 @@ enum {
- 	OPT_Q = (1 << 10),
- 	//OPT_A = (1 << 11),
- 	//OPT_k = (1 << 12),
-+	OPTBIT_color = 13
-+		+ 4 * ENABLE_FEATURE_LS_TIMESTAMPS
-+		+ 4 * ENABLE_FEATURE_LS_SORTFILES
-+		+ 2 * ENABLE_FEATURE_LS_FILETYPES
-+		+ 1 * ENABLE_FEATURE_LS_FOLLOWLINKS
-+		+ 1 * ENABLE_FEATURE_LS_RECURSIVE
-+		+ 1 * ENABLE_FEATURE_HUMAN_READABLE
-+		+ 2 * ENABLE_SELINUX
-+		+ 2 * ENABLE_FEATURE_AUTOWIDTH,
-+	OPT_color = 1 << OPTBIT_color,
- };
- 
- enum {
-@@ -889,16 +898,6 @@ static int list_single(const struct dnod
- }
- 
- 
--/* colored LS support by JaWi, janwillem.janssen at lxtreme.nl */
--#if ENABLE_FEATURE_LS_COLOR
--/* long option entry used only for --color, which has no short option
-- * equivalent */
--static const char ls_color_opt[] ALIGN1 =
--	"color\0" Optional_argument "\xff" /* no short equivalent */
--	;
--#endif
--
--
- int ls_main(int argc UNUSED_PARAM, char **argv)
- {
- 	struct dnode **dnd;
-@@ -911,8 +910,25 @@ int ls_main(int argc UNUSED_PARAM, char 
- 	int dnfiles;
- 	int dndirs;
- 	int i;
-+#if ENABLE_FEATURE_LS_COLOR
-+	/* colored LS support by JaWi, janwillem.janssen@lxtreme.nl */
-+	/* coreutils 6.10:
-+	 * # ls --color=BOGUS
-+	 * ls: invalid argument 'BOGUS' for '--color'
-+	 * Valid arguments are:
-+	 * 'always', 'yes', 'force'
-+	 * 'never', 'no', 'none'
-+	 * 'auto', 'tty', 'if-tty'
-+	 * (and substrings: "--color=alwa" work too)
-+	 */
-+	static const char ls_longopts[] ALIGN1 =
-+		"color\0" Optional_argument "\xff"; /* no short equivalent */
-+	static const char color_str[] ALIGN1 =
-+		"always\0""yes\0""force\0"
-+		"auto\0""tty\0""if-tty\0";
- 	/* need to initialize since --color has _an optional_ argument */
--	USE_FEATURE_LS_COLOR(const char *color_opt = "always";)
-+	const char *color_opt = color_str; /* "always" */
-+#endif
- 
- 	INIT_G();
- 
-@@ -927,7 +943,7 @@ int ls_main(int argc UNUSED_PARAM, char 
- #endif
- 
- 	/* process options */
--	USE_FEATURE_LS_COLOR(applet_long_options = ls_color_opt;)
-+	USE_FEATURE_LS_COLOR(applet_long_options = ls_longopts;)
- #if ENABLE_FEATURE_AUTOWIDTH
- 	opt_complementary = "T+:w+"; /* -T N, -w N */
- 	opt = getopt32(argv, ls_options, &tabstops, &terminal_width
-@@ -966,13 +982,20 @@ int ls_main(int argc UNUSED_PARAM, char 
- 		if (!p || (p[0] && strcmp(p, "none") != 0))
- 			show_color = 1;
- 	}
--	if (opt & (1 << i)) {  /* next flag after short options */
--		if (strcmp("always", color_opt) == 0)
--			show_color = 1;
--		else if (strcmp("never", color_opt) == 0)
-+	if (opt & OPT_color) {
-+		if (color_opt[0] == 'n')
- 			show_color = 0;
--		else if (strcmp("auto", color_opt) == 0 && isatty(STDOUT_FILENO))
--			show_color = 1;
-+		else switch (index_in_substrings(color_str, color_opt)) {
-+		case 3:
-+		case 4:
-+		case 5:
-+			if (isatty(STDOUT_FILENO)) {
-+		case 0:
-+		case 1:
-+		case 2:
-+				show_color = 1;
-+			}
-+		}
- 	}
- #endif
- 
-diff -urpN busybox-1.14.2/testsuite/ls/ls-1-works busybox-1.14.2-ls/testsuite/ls/ls-1-works
---- busybox-1.14.2/testsuite/ls/ls-1-works	2009-06-22 00:32:00.000000000 +0200
-+++ busybox-1.14.2-ls/testsuite/ls/ls-1-works	2009-07-02 14:28:45.000000000 +0200
-@@ -1,4 +1,4 @@
- [ -n "$d" ] || d=..
--ls -1 "$d" > logfile.gnu
--busybox ls -1 "$d" > logfile.bb
--cmp logfile.gnu logfile.bb
-+LC_ALL=C ls -1 "$d" > logfile.gnu
-+LC_ALL=C busybox ls -1 "$d" > logfile.bb
-+diff -ubw logfile.gnu logfile.bb
-diff -urpN busybox-1.14.2/testsuite/ls/ls-h-works busybox-1.14.2-ls/testsuite/ls/ls-h-works
---- busybox-1.14.2/testsuite/ls/ls-h-works	2009-06-22 00:32:00.000000000 +0200
-+++ busybox-1.14.2-ls/testsuite/ls/ls-h-works	2009-07-02 14:28:45.000000000 +0200
-@@ -1,4 +1,4 @@
- [ -n "$d" ] || d=..
--ls -h "$d" > logfile.gnu
--busybox ls -h "$d" > logfile.bb
--cmp logfile.gnu logfile.bb
-+LC_ALL=C ls -h "$d" > logfile.gnu
-+LC_ALL=C busybox ls -h "$d" > logfile.bb
-+diff -ubw logfile.gnu logfile.bb
-diff -urpN busybox-1.14.2/testsuite/ls/ls-l-works busybox-1.14.2-ls/testsuite/ls/ls-l-works
---- busybox-1.14.2/testsuite/ls/ls-l-works	2009-06-22 00:32:00.000000000 +0200
-+++ busybox-1.14.2-ls/testsuite/ls/ls-l-works	2009-07-02 14:28:45.000000000 +0200
-@@ -1,4 +1,4 @@
- [ -n "$d" ] || d=..
- LC_ALL=C ls -l "$d" > logfile.gnu
--busybox ls -l "$d" > logfile.bb
--diff -w logfile.gnu logfile.bb
-+LC_ALL=C busybox ls -l "$d" > logfile.bb
-+diff -ubw logfile.gnu logfile.bb
-diff -urpN busybox-1.14.2/testsuite/ls/ls-s-works busybox-1.14.2-ls/testsuite/ls/ls-s-works
---- busybox-1.14.2/testsuite/ls/ls-s-works	2009-06-22 00:32:00.000000000 +0200
-+++ busybox-1.14.2-ls/testsuite/ls/ls-s-works	2009-07-02 14:28:45.000000000 +0200
-@@ -1,4 +1,4 @@
- [ -n "$d" ] || d=..
- LC_ALL=C ls -1s "$d" > logfile.gnu
--busybox ls -1s "$d" > logfile.bb
--cmp logfile.gnu logfile.bb
-+LC_ALL=C busybox ls -1s "$d" > logfile.bb
-+diff -ubw logfile.gnu logfile.bb
diff --git a/package/busybox/busybox-1.14.2-test.patch b/package/busybox/busybox-1.14.2-test.patch
deleted file mode 100644
index ce0d9a7..0000000
--- a/package/busybox/busybox-1.14.2-test.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-diff -urpN busybox-1.14.2/coreutils/test.c busybox-1.14.2-test/coreutils/test.c
---- busybox-1.14.2/coreutils/test.c	2009-07-05 22:59:28.000000000 +0200
-+++ busybox-1.14.2-test/coreutils/test.c	2009-07-17 01:46:28.000000000 +0200
-@@ -571,7 +571,14 @@ static number_t nexpr(enum token n)
- 
- 	nest_msg(">nexpr(%s)\n", TOKSTR[n]);
- 	if (n == UNOT) {
--		res = !nexpr(check_operator(*++args));
-+		n = check_operator(*++args);
-+		if (n == EOI) {
-+			/* special case: [ ! ], [ a -a ! ] are valid */
-+			/* IOW, "! ARG" may miss ARG */
-+			unnest_msg("<nexpr:1 (!EOI)\n");
-+			return 1;
-+		}
-+		res = !nexpr(n);
- 		unnest_msg("<nexpr:%lld\n", res);
- 		return res;
- 	}
-@@ -742,7 +749,7 @@ int test_main(int argc, char **argv)
- 		check_operator(argv[1]);
- 		if (last_operator->op_type == BINOP) {
- 			/* "test [!] arg1 <binary_op> arg2" */
--			args = &argv[0];
-+			args = argv;
- 			res = (binop() == 0);
- 			goto ret;
- 		}
-@@ -755,7 +762,7 @@ int test_main(int argc, char **argv)
- 		argv--;
- 	}
- #endif
--	args = &argv[0];
-+	args = argv;
- 	res = !oexpr(check_operator(*args));
- 
- 	if (*args != NULL && *++args != NULL) {
-diff -urpN busybox-1.14.2/testsuite/test.tests busybox-1.14.2-test/testsuite/test.tests
---- busybox-1.14.2/testsuite/test.tests	2009-07-05 22:59:22.000000000 +0200
-+++ busybox-1.14.2-test/testsuite/test.tests	2009-07-17 01:46:28.000000000 +0200
-@@ -21,6 +21,11 @@ testing "test '': should be false (1)" \
- 	"1\n" \
- 	"" ""
- 
-+testing "test !: should be true (0)" \
-+	"busybox test !; echo \$?" \
-+	"0\n" \
-+	"" ""
-+
- testing "test a: should be true (0)" \
- 	"busybox test a; echo \$?" \
- 	"0\n" \
-@@ -51,6 +56,11 @@ testing "test -lt = -gt: should be false
- 	"1\n" \
- 	"" ""
- 
-+testing "test a -a !: should be true (0)" \
-+	"busybox test a -a !; echo \$?" \
-+	"0\n" \
-+	"" ""
-+
- testing "test -f = a -o b: should be true (0)" \
- 	"busybox test -f = a -o b; echo \$?" \
- 	"0\n" \
diff --git a/package/busybox/busybox-1.14.2-udhcpd.patch b/package/busybox/busybox-1.14.2-udhcpd.patch
deleted file mode 100644
index a1502b4..0000000
--- a/package/busybox/busybox-1.14.2-udhcpd.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -urpN busybox-1.14.2/networking/udhcp/files.c busybox-1.14.2-udhcpd/networking/udhcp/files.c
---- busybox-1.14.2/networking/udhcp/files.c	2009-06-22 00:40:29.000000000 +0200
-+++ busybox-1.14.2-udhcpd/networking/udhcp/files.c	2009-07-07 14:58:39.000000000 +0200
-@@ -420,7 +420,7 @@ void FAST_FUNC read_leases(const char *f
- 				continue;
- 			/* NB: add_lease takes "relative time", IOW,
- 			 * lease duration, not lease deadline. */
--			if (!(add_lease(lease.chaddr, lease.yiaddr, expires, lease.hostname))) {
-+			if (!(add_lease(lease.chaddr, lease.yiaddr, expires, NULL /* was lease.hostname. bug in add_lease, disabled */ ))) {
- 				bb_error_msg("too many leases while loading %s", file);
- 				break;
- 			}
-- 
1.6.3.3
