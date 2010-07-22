From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 22 Jul 2010 18:13:00 +0200
Subject: [Buildroot] [git commit master 1/1] busybox: additional 1.17.0 fixes
Message-ID: <20100722161658.0259482940@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e23ca1da6dd8ff423c13ef1eaae62dd37024998a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.17.0-ask_terminal.patch              |   50 +++
 .../busybox-1.17.0/busybox-1.17.0-depmod.patch     |  139 ++++++
 .../busybox-1.17.0/busybox-1.17.0-diff.patch       |   50 ++-
 .../busybox-1.17.0/busybox-1.17.0-top.patch        |   18 +
 .../busybox/busybox-1.17.0/busybox-1.17.0-vi.patch |   60 +++
 .../busybox-1.17.0/busybox-1.17.0-volumeid.patch   |  450 ++++++++++++++++++++
 6 files changed, 763 insertions(+), 4 deletions(-)
 create mode 100644 package/busybox/busybox-1.17.0/busybox-1.17.0-ask_terminal.patch
 create mode 100644 package/busybox/busybox-1.17.0/busybox-1.17.0-depmod.patch
 create mode 100644 package/busybox/busybox-1.17.0/busybox-1.17.0-top.patch
 create mode 100644 package/busybox/busybox-1.17.0/busybox-1.17.0-vi.patch
 create mode 100644 package/busybox/busybox-1.17.0/busybox-1.17.0-volumeid.patch

diff --git a/package/busybox/busybox-1.17.0/busybox-1.17.0-ask_terminal.patch b/package/busybox/busybox-1.17.0/busybox-1.17.0-ask_terminal.patch
new file mode 100644
index 0000000..3b1a99a
--- /dev/null
+++ b/package/busybox/busybox-1.17.0/busybox-1.17.0-ask_terminal.patch
@@ -0,0 +1,50 @@
+diff -urpN busybox-1.17.0/libbb/lineedit.c busybox-1.17.0-ask_terminal/libbb/lineedit.c
+--- busybox-1.17.0/libbb/lineedit.c	2010-06-24 04:40:43.000000000 +0200
++++ busybox-1.17.0-ask_terminal/libbb/lineedit.c	2010-07-18 22:38:47.000000000 +0200
+@@ -151,6 +151,7 @@ struct lineedit_statics {
+ 	CHAR_T delbuf[DELBUFSIZ];  /* a place to store deleted characters */
+ #endif
+ #if ENABLE_FEATURE_EDITING_ASK_TERMINAL
++	smallint unknown_width;
+ 	smallint sent_ESC_br6n;
+ #endif
+ 
+@@ -1612,14 +1613,16 @@ static void ask_terminal(void)
+ 	 * poll([{fd=0, events=POLLIN}], 1, 4294967295) = 1 ([{fd=0, revents=POLLIN}])
+ 	 * read(0, "\n", 1)      = 1  <-- oh crap, user's input got in first
+ 	 */
+-	struct pollfd pfd;
++	if (S.unknown_width) { /* only if window size is not known */
++		struct pollfd pfd;
+ 
+-	pfd.fd = STDIN_FILENO;
+-	pfd.events = POLLIN;
+-	if (safe_poll(&pfd, 1, 0) == 0) {
+-		S.sent_ESC_br6n = 1;
+-		fputs("\033" "[6n", stdout);
+-		fflush_all(); /* make terminal see it ASAP! */
++		pfd.fd = STDIN_FILENO;
++		pfd.events = POLLIN;
++		if (safe_poll(&pfd, 1, 0) == 0) {
++			S.sent_ESC_br6n = 1;
++			fputs("\033" "[6n", stdout);
++			fflush_all(); /* make terminal see it ASAP! */
++		}
+ 	}
+ }
+ #else
+@@ -1765,11 +1768,13 @@ static void cmdedit_setwidth(unsigned w,
+ 
+ static void win_changed(int nsig)
+ {
++	int sv_errno = errno;
+ 	unsigned width;
+-	get_terminal_width_height(0, &width, NULL);
++	IF_FEATURE_EDITING_ASK_TERMINAL(S.unknown_width =) get_terminal_width_height(0, &width, NULL);
+ 	cmdedit_setwidth(width, nsig /* - just a yes/no flag */);
+ 	if (nsig == SIGWINCH)
+ 		signal(SIGWINCH, win_changed); /* rearm ourself */
++	errno = sv_errno;
+ }
+ 
+ static int lineedit_read_key(char *read_key_buffer)
diff --git a/package/busybox/busybox-1.17.0/busybox-1.17.0-depmod.patch b/package/busybox/busybox-1.17.0/busybox-1.17.0-depmod.patch
new file mode 100644
index 0000000..105cd17
--- /dev/null
+++ b/package/busybox/busybox-1.17.0/busybox-1.17.0-depmod.patch
@@ -0,0 +1,139 @@
+diff -urpN busybox-1.17.0/modutils/depmod.c busybox-1.17.0-depmod/modutils/depmod.c
+--- busybox-1.17.0/modutils/depmod.c	2010-06-24 04:40:43.000000000 +0200
++++ busybox-1.17.0-depmod/modutils/depmod.c	2010-07-19 00:28:22.000000000 +0200
+@@ -28,16 +28,6 @@ typedef struct module_info {
+ 	struct module_info *dnext, *dprev;
+ } module_info;
+ 
+-enum {
+-	ARG_a = (1<<0), /* All modules, ignore mods in argv */
+-	ARG_A = (1<<1), /* Only emit .ko that are newer than modules.dep file */
+-	ARG_b = (1<<2), /* base directory when modules are in staging area */
+-	ARG_e = (1<<3), /* with -F, print unresolved symbols */
+-	ARG_F = (1<<4), /* System.map that contains the symbols */
+-	ARG_n = (1<<5), /* dry-run, print to stdout only */
+-	ARG_r = (1<<6)  /* Compat dummy. Linux Makefile uses it */
+-};
+-
+ static int FAST_FUNC parse_module(const char *fname, struct stat *sb UNUSED_PARAM,
+ 				  void *data, int depth UNUSED_PARAM)
+ {
+@@ -58,7 +48,7 @@ static int FAST_FUNC parse_module(const 
+ 	*first = info;
+ 
+ 	info->dnext = info->dprev = info;
+-	info->name = xasprintf("/%s", fname);
++	info->name = xstrdup(fname + 2); /* skip "./" */
+ 	info->modname = xstrdup(filename2modname(fname, modname));
+ 	for (ptr = image; ptr < image + len - 10; ptr++) {
+ 		if (strncmp(ptr, "depends=", 8) == 0) {
+@@ -134,10 +124,44 @@ static void xfreopen_write(const char *f
+ 		bb_perror_msg_and_die("can't open '%s'", file);
+ }
+ 
++/* Usage:
++ * [-aAenv] [-C FILE or DIR] [-b BASE] [-F System.map] [VERSION] [MODFILES]...
++ *	-a --all
++ *		Probe all modules. Default if no MODFILES.
++ *	-A --quick
++ *		Check modules.dep's mtime against module files' mtimes.
++ *	-b --basedir BASE
++ *		Use $BASE/lib/modules/VERSION
++ *	-C --config FILE or DIR
++ *		Path to /etc/depmod.conf or /etc/depmod.d/
++ *	-e --errsyms
++ *		When combined with the -F option, this reports any symbols which
++ *		which are not supplied by other modules or kernel.
++ *	-F --filesyms System.map
++ *	-n --dry-run
++ *		Print modules.dep etc to standard output
++ *	-v --verbose
++ *		Print to stdout all the symbols each module depends on
++ *		and the module's file name which provides that symbol.
++ *	-r	No-op
++ *
++ * So far we only support: [-rn] [-b BASE] [VERSION] [MODFILES]...
++ * -aAeF are accepted but ignored. -vC are not accepted.
++ */
++enum {
++	//OPT_a = (1 << 0), /* All modules, ignore mods in argv */
++	//OPT_A = (1 << 1), /* Only emit .ko that are newer than modules.dep file */
++	OPT_b = (1 << 2), /* base directory when modules are in staging area */
++	//OPT_e = (1 << 3), /* with -F, print unresolved symbols */
++	//OPT_F = (1 << 4), /* System.map that contains the symbols */
++	OPT_n = (1 << 5), /* dry-run, print to stdout only */
++	OPT_r = (1 << 6)  /* Compat dummy. Linux Makefile uses it */
++};
++
+ int depmod_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
+ int depmod_main(int argc UNUSED_PARAM, char **argv)
+ {
+-	module_info *modules = NULL, *m, *dep;
++	module_info *modules, *m, *dep;
+ 	const char *moddir_base = "/";
+ 	char *moddir, *version;
+ 	struct utsname uts;
+@@ -152,36 +176,30 @@ int depmod_main(int argc UNUSED_PARAM, c
+ 	/* If a version is provided, then that kernel version's module directory
+ 	 * is used, rather than the current kernel version (as returned by
+ 	 * "uname -r").  */
+-	if (*argv && sscanf(*argv, "%d.%d.%d", &tmp, &tmp, &tmp) == 3) {
++	if (*argv && sscanf(*argv, "%u.%u.%u", &tmp, &tmp, &tmp) == 3) {
+ 		version = *argv++;
+ 	} else {
+ 		uname(&uts);
+ 		version = uts.release;
+ 	}
+ 	moddir = concat_path_file(&CONFIG_DEFAULT_MODULES_DIR[1], version);
++	xchdir(moddir);
++	if (ENABLE_FEATURE_CLEAN_UP)
++		free(moddir);
+ 
+ 	/* Scan modules */
++	modules = NULL;
+ 	if (*argv) {
+-		char *modfile;
+-		struct stat sb;
+ 		do {
+-			modfile = concat_path_file(moddir, *argv);
+-			xstat(modfile, &sb);
+-			parse_module(modfile, &sb, &modules, 0);
+-			free(modfile);
+-		} while (*(++argv));
++			parse_module(*argv, /*sb (unused):*/ NULL, &modules, 0);
++		} while (*++argv);
+ 	} else {
+-		recursive_action(moddir, ACTION_RECURSE,
++		recursive_action(".", ACTION_RECURSE,
+ 				 parse_module, NULL, &modules, 0);
+ 	}
+ 
+-	/* Prepare for writing out the dep files */
+-	xchdir(moddir);
+-	if (ENABLE_FEATURE_CLEAN_UP)
+-		free(moddir);
+-
+ 	/* Generate dependency and alias files */
+-	if (!(option_mask32 & ARG_n))
++	if (!(option_mask32 & OPT_n))
+ 		xfreopen_write(CONFIG_DEFAULT_DEPMOD_FILE, stdout);
+ 	for (m = modules; m != NULL; m = m->next) {
+ 		printf("%s:", m->name);
+@@ -200,7 +218,7 @@ int depmod_main(int argc UNUSED_PARAM, c
+ 	}
+ 
+ #if ENABLE_FEATURE_MODUTILS_ALIAS
+-	if (!(option_mask32 & ARG_n))
++	if (!(option_mask32 & OPT_n))
+ 		xfreopen_write("modules.alias", stdout);
+ 	for (m = modules; m != NULL; m = m->next) {
+ 		const char *fname = bb_basename(m->name);
+@@ -218,7 +236,7 @@ int depmod_main(int argc UNUSED_PARAM, c
+ 	}
+ #endif
+ #if ENABLE_FEATURE_MODUTILS_SYMBOLS
+-	if (!(option_mask32 & ARG_n))
++	if (!(option_mask32 & OPT_n))
+ 		xfreopen_write("modules.symbols", stdout);
+ 	for (m = modules; m != NULL; m = m->next) {
+ 		const char *fname = bb_basename(m->name);
diff --git a/package/busybox/busybox-1.17.0/busybox-1.17.0-diff.patch b/package/busybox/busybox-1.17.0/busybox-1.17.0-diff.patch
index ba3da8d..9830900 100644
--- a/package/busybox/busybox-1.17.0/busybox-1.17.0-diff.patch
+++ b/package/busybox/busybox-1.17.0/busybox-1.17.0-diff.patch
@@ -1,20 +1,62 @@
 diff -urpN busybox-1.17.0/editors/diff.c busybox-1.17.0-diff/editors/diff.c
 --- busybox-1.17.0/editors/diff.c	2010-06-24 04:40:43.000000000 +0200
-+++ busybox-1.17.0-diff/editors/diff.c	2010-07-10 03:52:33.000000000 +0200
-@@ -760,9 +760,11 @@ static int FAST_FUNC add_to_dirlist(cons
++++ busybox-1.17.0-diff/editors/diff.c	2010-07-19 00:27:45.000000000 +0200
+@@ -121,6 +121,7 @@ typedef struct FILE_and_pos_t {
+ struct globals {
+ 	smallint exit_status;
+ 	int opt_U_context;
++	const char *other_dir;
+ 	char *label[2];
+ 	struct stat stb[2];
+ };
+@@ -760,9 +761,11 @@ static int FAST_FUNC add_to_dirlist(cons
  		void *userdata, int depth UNUSED_PARAM)
  {
  	struct dlist *const l = userdata;
 +	const char *file = filename + l->len;
++	while (*file == '/')
++		file++;
  	l->dl = xrealloc_vector(l->dl, 6, l->e);
 -	/* + 1 skips "/" after dirname */
 -	l->dl[l->e] = xstrdup(filename + l->len + 1);
-+	while (*file == '/')
-+		file++;
 +	l->dl[l->e] = xstrdup(file);
  	l->e++;
  	return TRUE;
  }
+@@ -778,6 +781,25 @@ static int FAST_FUNC skip_dir(const char
+ 		add_to_dirlist(filename, sb, userdata, depth);
+ 		return SKIP;
+ 	}
++	if (!(option_mask32 & FLAG(N))) {
++		/* -r without -N: no need to recurse into dirs
++		 * which do not exist on the "other side".
++		 * Testcase: diff -r /tmp /
++		 * (it would recurse deep into /proc without this code) */
++		struct dlist *const l = userdata;
++		filename += l->len;
++		if (filename[0]) {
++			struct stat osb;
++			char *othername = concat_path_file(G.other_dir, filename);
++			int r = stat(othername, &osb);
++			free(othername);
++			if (r != 0 || !S_ISDIR(osb.st_mode)) {
++				/* other dir doesn't have similarly named
++				 * directory, don't recurse */
++				return SKIP;
++			}
++		}
++	}
+ 	return TRUE;
+ }
+ 
+@@ -791,6 +813,7 @@ static void diffdir(char *p[2], const ch
+ 		/*list[i].s = list[i].e = 0; - memset did it */
+ 		/*list[i].dl = NULL; */
+ 
++		G.other_dir = p[1 - i];
+ 		/* We need to trim root directory prefix.
+ 		 * Using list.len to specify its length,
+ 		 * add_to_dirlist will remove it. */
 diff -urpN busybox-1.17.0/testsuite/diff.tests busybox-1.17.0-diff/testsuite/diff.tests
 --- busybox-1.17.0/testsuite/diff.tests	2010-06-24 04:40:43.000000000 +0200
 +++ busybox-1.17.0-diff/testsuite/diff.tests	2010-07-10 01:31:51.000000000 +0200
diff --git a/package/busybox/busybox-1.17.0/busybox-1.17.0-top.patch b/package/busybox/busybox-1.17.0/busybox-1.17.0-top.patch
new file mode 100644
index 0000000..84c91f3
--- /dev/null
+++ b/package/busybox/busybox-1.17.0/busybox-1.17.0-top.patch
@@ -0,0 +1,18 @@
+diff -urpN busybox-1.17.0/procps/top.c busybox-1.17.0-top/procps/top.c
+--- busybox-1.17.0/procps/top.c	2010-06-24 04:40:43.000000000 +0200
++++ busybox-1.17.0-top/procps/top.c	2010-07-19 00:27:04.000000000 +0200
+@@ -686,10 +686,10 @@ static int topmem_sort(char *a, char *b)
+ 	n = offsetof(topmem_status_t, vsz) + (sort_field * sizeof(mem_t));
+ 	l = *(mem_t*)(a + n);
+ 	r = *(mem_t*)(b + n);
+-//	if (l == r) {
+-//		l = a->mapped_rw;
+-//		r = b->mapped_rw;
+-//	}
++	if (l == r) {
++		l = ((topmem_status_t*)a)->dirty;
++		r = ((topmem_status_t*)b)->dirty;
++	}
+ 	/* We want to avoid unsigned->signed and truncation errors */
+ 	/* l>r: -1, l=r: 0, l<r: 1 */
+ 	n = (l > r) ? -1 : (l != r);
diff --git a/package/busybox/busybox-1.17.0/busybox-1.17.0-vi.patch b/package/busybox/busybox-1.17.0/busybox-1.17.0-vi.patch
new file mode 100644
index 0000000..cc61c87
--- /dev/null
+++ b/package/busybox/busybox-1.17.0/busybox-1.17.0-vi.patch
@@ -0,0 +1,60 @@
+diff -urpN busybox-1.17.0/editors/vi.c busybox-1.17.0-vi/editors/vi.c
+--- busybox-1.17.0/editors/vi.c	2010-07-04 04:17:40.000000000 +0200
++++ busybox-1.17.0-vi/editors/vi.c	2010-07-21 12:19:36.827970040 +0200
+@@ -504,20 +504,17 @@ static int init_text_buffer(char *fn)
+ }
+ 
+ #if ENABLE_FEATURE_VI_WIN_RESIZE
+-static void query_screen_dimensions(void)
++static int query_screen_dimensions(void)
+ {
+-# if ENABLE_FEATURE_VI_ASK_TERMINAL
+-	if (!G.get_rowcol_error)
+-		G.get_rowcol_error =
+-# endif
+-			get_terminal_width_height(STDIN_FILENO, &columns, &rows);
++	int err = get_terminal_width_height(STDIN_FILENO, &columns, &rows);
+ 	if (rows > MAX_SCR_ROWS)
+ 		rows = MAX_SCR_ROWS;
+ 	if (columns > MAX_SCR_COLS)
+ 		columns = MAX_SCR_COLS;
++	return err;
+ }
+ #else
+-# define query_screen_dimensions() ((void)0)
++# define query_screen_dimensions() (0)
+ #endif
+ 
+ static void edit_file(char *fn)
+@@ -536,7 +533,7 @@ static void edit_file(char *fn)
+ 	rows = 24;
+ 	columns = 80;
+ 	size = 0;
+-	query_screen_dimensions();
++	IF_FEATURE_VI_ASK_TERMINAL(G.get_rowcol_error =) query_screen_dimensions();
+ #if ENABLE_FEATURE_VI_ASK_TERMINAL
+ 	if (G.get_rowcol_error /* TODO? && no input on stdin */) {
+ 		uint64_t k;
+@@ -546,9 +543,12 @@ static void edit_file(char *fn)
+ 		if ((int32_t)k == KEYCODE_CURSOR_POS) {
+ 			uint32_t rc = (k >> 32);
+ 			columns = (rc & 0x7fff);
++			if (columns > MAX_SCR_COLS)
++				columns = MAX_SCR_COLS;
+ 			rows = ((rc >> 16) & 0x7fff);
++			if (rows > MAX_SCR_ROWS)
++				rows = MAX_SCR_ROWS;
+ 		}
+-		query_screen_dimensions();
+ 	}
+ #endif
+ 	new_screen(rows, columns);	// get memory for virtual screen
+@@ -2797,7 +2797,7 @@ static void refresh(int full_screen)
+ 	int li, changed;
+ 	char *tp, *sp;		// pointer into text[] and screen[]
+ 
+-	if (ENABLE_FEATURE_VI_WIN_RESIZE) {
++	if (ENABLE_FEATURE_VI_WIN_RESIZE IF_FEATURE_VI_ASK_TERMINAL(&& !G.get_rowcol_error) ) {
+ 		unsigned c = columns, r = rows;
+ 		query_screen_dimensions();
+ 		full_screen |= (c - columns) | (r - rows);
diff --git a/package/busybox/busybox-1.17.0/busybox-1.17.0-volumeid.patch b/package/busybox/busybox-1.17.0/busybox-1.17.0-volumeid.patch
new file mode 100644
index 0000000..5fc0cf0
--- /dev/null
+++ b/package/busybox/busybox-1.17.0/busybox-1.17.0-volumeid.patch
@@ -0,0 +1,450 @@
+diff -urpN busybox-1.17.0/util-linux/Config.src busybox-1.17.0-volumeid/util-linux/Config.src
+--- busybox-1.17.0/util-linux/Config.src	2010-06-24 04:40:43.000000000 +0200
++++ busybox-1.17.0-volumeid/util-linux/Config.src	2010-07-14 07:12:19.000000000 +0200
+@@ -470,221 +470,6 @@ config FEATURE_USE_TERMIOS
+ 	  will be unable to determine the current screen size, and will be
+ 	  unable to move the cursor.
+ 
+-config VOLUMEID
+-	bool #No description makes it a hidden option
+-	default n
+-
+-config FEATURE_VOLUMEID_EXT
+-	bool "Ext filesystem"
+-	default y
+-	depends on VOLUMEID
+-	help
+-	  TODO
+-
+-config FEATURE_VOLUMEID_BTRFS
+-	bool "btrfs filesystem"
+-	default y
+-	depends on VOLUMEID
+-	help
+-	  TODO
+-
+-config FEATURE_VOLUMEID_REISERFS
+-	bool "Reiser filesystem"
+-	default y
+-	depends on VOLUMEID
+-	help
+-	  TODO
+-
+-config FEATURE_VOLUMEID_FAT
+-	bool "fat filesystem"
+-	default y
+-	depends on VOLUMEID
+-	help
+-	  TODO
+-
+-config FEATURE_VOLUMEID_HFS
+-	bool "hfs filesystem"
+-	default y
+-	depends on VOLUMEID
+-	help
+-	  TODO
+-
+-config FEATURE_VOLUMEID_JFS
+-	bool "jfs filesystem"
+-	default y
+-	depends on VOLUMEID
+-	help
+-	  TODO
+-
+-### config FEATURE_VOLUMEID_UFS
+-###	bool "ufs filesystem"
+-###	default y
+-###	depends on VOLUMEID
+-###	help
+-###	  TODO
+-
+-config FEATURE_VOLUMEID_XFS
+-	bool "xfs filesystem"
+-	default y
+-	depends on VOLUMEID
+-	help
+-	  TODO
+-
+-config FEATURE_VOLUMEID_NTFS
+-	bool "ntfs filesystem"
+-	default y
+-	depends on VOLUMEID
+-	help
+-	  TODO
+-
+-config FEATURE_VOLUMEID_ISO9660
+-	bool "iso9660 filesystem"
+-	default y
+-	depends on VOLUMEID
+-	help
+-	  TODO
+-
+-config FEATURE_VOLUMEID_UDF
+-	bool "udf filesystem"
+-	default y
+-	depends on VOLUMEID
+-	help
+-	  TODO
+-
+-config FEATURE_VOLUMEID_LUKS
+-	bool "luks filesystem"
+-	default y
+-	depends on VOLUMEID
+-	help
+-	  TODO
+-
+-config FEATURE_VOLUMEID_LINUXSWAP
+-	bool "linux swap filesystem"
+-	default y
+-	depends on VOLUMEID
+-	help
+-	  TODO
+-
+-### config FEATURE_VOLUMEID_LVM
+-###	bool "lvm"
+-###	default y
+-###	depends on VOLUMEID
+-###	help
+-###	  TODO
+-
+-config FEATURE_VOLUMEID_CRAMFS
+-	bool "cramfs filesystem"
+-	default y
+-	depends on VOLUMEID
+-	help
+-	  TODO
+-
+-### config FEATURE_VOLUMEID_HPFS
+-###	bool "hpfs filesystem"
+-###	default y
+-###	depends on VOLUMEID
+-###	help
+-###	  TODO
+-
+-config FEATURE_VOLUMEID_ROMFS
+-	bool "romfs filesystem"
+-	default y
+-	depends on VOLUMEID
+-	help
+-	  TODO
+-
+-config FEATURE_VOLUMEID_SYSV
+-	bool "sysv filesystem"
+-	default y
+-	depends on VOLUMEID
+-	help
+-	  TODO
+-
+-### config FEATURE_VOLUMEID_MINIX
+-###	bool "minix filesystem"
+-###	default y
+-###	depends on VOLUMEID
+-###	help
+-###	  TODO
+-
+-### These only detect partition tables - not used (yet?)
+-### config FEATURE_VOLUMEID_MAC
+-###	bool "mac filesystem"
+-###	default y
+-###	depends on VOLUMEID
+-###	help
+-###	  TODO
+-###
+-### config FEATURE_VOLUMEID_MSDOS
+-###	bool "msdos filesystem"
+-###	default y
+-###	depends on VOLUMEID
+-###	help
+-###	  TODO
+-
+-config FEATURE_VOLUMEID_OCFS2
+-	bool "ocfs2 filesystem"
+-	default y
+-	depends on VOLUMEID
+-	help
+-	  TODO
+-
+-### config FEATURE_VOLUMEID_HIGHPOINTRAID
+-###	bool "highpoint raid"
+-###	default y
+-###	depends on VOLUMEID
+-###	help
+-###	  TODO
+-
+-### config FEATURE_VOLUMEID_ISWRAID
+-###	bool "intel raid"
+-###	default y
+-###	depends on VOLUMEID
+-###	help
+-###	  TODO
+-
+-### config FEATURE_VOLUMEID_LSIRAID
+-###	bool "lsi raid"
+-###	default y
+-###	depends on VOLUMEID
+-###	help
+-###	  TODO
+-
+-### config FEATURE_VOLUMEID_VIARAID
+-###	bool "via raid"
+-###	default y
+-###	depends on VOLUMEID
+-###	help
+-###	  TODO
+-
+-### config FEATURE_VOLUMEID_SILICONRAID
+-###	bool "silicon raid"
+-###	default y
+-###	depends on VOLUMEID
+-###	help
+-###	  TODO
+-
+-### config FEATURE_VOLUMEID_NVIDIARAID
+-###	bool "nvidia raid"
+-###	default y
+-###	depends on VOLUMEID
+-###	help
+-###	  TODO
+-
+-### config FEATURE_VOLUMEID_PROMISERAID
+-###	bool "promise raid"
+-###	default y
+-###	depends on VOLUMEID
+-###	help
+-###	  TODO
+-
+-config FEATURE_VOLUMEID_LINUXRAID
+-	bool "linuxraid"
+-	default y
+-	depends on VOLUMEID
+-	help
+-	  TODO
+-
+ config MOUNT
+ 	bool "mount"
+ 	default y
+@@ -937,4 +722,224 @@ config FEATURE_MTAB_SUPPORT
+ 	  About the only reason to use this is if you've removed /proc from
+ 	  your kernel.
+ 
++config VOLUMEID
++	bool #No description makes it a hidden option
++	default n
++
++menu "Filesystem/Volume identification"
++	depends on VOLUMEID
++
++config FEATURE_VOLUMEID_EXT
++	bool "Ext filesystem"
++	default y
++	depends on VOLUMEID
++	help
++	  TODO
++
++config FEATURE_VOLUMEID_BTRFS
++	bool "btrfs filesystem"
++	default y
++	depends on VOLUMEID
++	help
++	  TODO
++
++config FEATURE_VOLUMEID_REISERFS
++	bool "Reiser filesystem"
++	default y
++	depends on VOLUMEID
++	help
++	  TODO
++
++config FEATURE_VOLUMEID_FAT
++	bool "fat filesystem"
++	default y
++	depends on VOLUMEID
++	help
++	  TODO
++
++config FEATURE_VOLUMEID_HFS
++	bool "hfs filesystem"
++	default y
++	depends on VOLUMEID
++	help
++	  TODO
++
++config FEATURE_VOLUMEID_JFS
++	bool "jfs filesystem"
++	default y
++	depends on VOLUMEID
++	help
++	  TODO
++
++### config FEATURE_VOLUMEID_UFS
++###	bool "ufs filesystem"
++###	default y
++###	depends on VOLUMEID
++###	help
++###	  TODO
++
++config FEATURE_VOLUMEID_XFS
++	bool "xfs filesystem"
++	default y
++	depends on VOLUMEID
++	help
++	  TODO
++
++config FEATURE_VOLUMEID_NTFS
++	bool "ntfs filesystem"
++	default y
++	depends on VOLUMEID
++	help
++	  TODO
++
++config FEATURE_VOLUMEID_ISO9660
++	bool "iso9660 filesystem"
++	default y
++	depends on VOLUMEID
++	help
++	  TODO
++
++config FEATURE_VOLUMEID_UDF
++	bool "udf filesystem"
++	default y
++	depends on VOLUMEID
++	help
++	  TODO
++
++config FEATURE_VOLUMEID_LUKS
++	bool "luks filesystem"
++	default y
++	depends on VOLUMEID
++	help
++	  TODO
++
++config FEATURE_VOLUMEID_LINUXSWAP
++	bool "linux swap filesystem"
++	default y
++	depends on VOLUMEID
++	help
++	  TODO
++
++### config FEATURE_VOLUMEID_LVM
++###	bool "lvm"
++###	default y
++###	depends on VOLUMEID
++###	help
++###	  TODO
++
++config FEATURE_VOLUMEID_CRAMFS
++	bool "cramfs filesystem"
++	default y
++	depends on VOLUMEID
++	help
++	  TODO
++
++### config FEATURE_VOLUMEID_HPFS
++###	bool "hpfs filesystem"
++###	default y
++###	depends on VOLUMEID
++###	help
++###	  TODO
++
++config FEATURE_VOLUMEID_ROMFS
++	bool "romfs filesystem"
++	default y
++	depends on VOLUMEID
++	help
++	  TODO
++
++config FEATURE_VOLUMEID_SYSV
++	bool "sysv filesystem"
++	default y
++	depends on VOLUMEID
++	help
++	  TODO
++
++### config FEATURE_VOLUMEID_MINIX
++###	bool "minix filesystem"
++###	default y
++###	depends on VOLUMEID
++###	help
++###	  TODO
++
++### These only detect partition tables - not used (yet?)
++### config FEATURE_VOLUMEID_MAC
++###	bool "mac filesystem"
++###	default y
++###	depends on VOLUMEID
++###	help
++###	  TODO
++###
++### config FEATURE_VOLUMEID_MSDOS
++###	bool "msdos filesystem"
++###	default y
++###	depends on VOLUMEID
++###	help
++###	  TODO
++
++config FEATURE_VOLUMEID_OCFS2
++	bool "ocfs2 filesystem"
++	default y
++	depends on VOLUMEID
++	help
++	  TODO
++
++### config FEATURE_VOLUMEID_HIGHPOINTRAID
++###	bool "highpoint raid"
++###	default y
++###	depends on VOLUMEID
++###	help
++###	  TODO
++
++### config FEATURE_VOLUMEID_ISWRAID
++###	bool "intel raid"
++###	default y
++###	depends on VOLUMEID
++###	help
++###	  TODO
++
++### config FEATURE_VOLUMEID_LSIRAID
++###	bool "lsi raid"
++###	default y
++###	depends on VOLUMEID
++###	help
++###	  TODO
++
++### config FEATURE_VOLUMEID_VIARAID
++###	bool "via raid"
++###	default y
++###	depends on VOLUMEID
++###	help
++###	  TODO
++
++### config FEATURE_VOLUMEID_SILICONRAID
++###	bool "silicon raid"
++###	default y
++###	depends on VOLUMEID
++###	help
++###	  TODO
++
++### config FEATURE_VOLUMEID_NVIDIARAID
++###	bool "nvidia raid"
++###	default y
++###	depends on VOLUMEID
++###	help
++###	  TODO
++
++### config FEATURE_VOLUMEID_PROMISERAID
++###	bool "promise raid"
++###	default y
++###	depends on VOLUMEID
++###	help
++###	  TODO
++
++config FEATURE_VOLUMEID_LINUXRAID
++	bool "linuxraid"
++	default y
++	depends on VOLUMEID
++	help
++	  TODO
++
++endmenu
++
+ endmenu
-- 
1.7.1
