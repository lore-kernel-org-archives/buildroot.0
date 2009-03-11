From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 11 Mar 2009 10:10:58 +0000 (UTC)
Subject: [Buildroot] svn commit: [25605] trunk/buildroot/package/busybox
Message-ID: <20090311101058.D5D927645B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-11 10:10:58 +0000 (Wed, 11 Mar 2009)
New Revision: 25605

Log:
busybox: bump 1.13.x version

Removed:
   trunk/buildroot/package/busybox/busybox-1.13.2-awk.patch
   trunk/buildroot/package/busybox/busybox-1.13.2-depmod.patch
   trunk/buildroot/package/busybox/busybox-1.13.2-init.patch
   trunk/buildroot/package/busybox/busybox-1.13.2-killall.patch
   trunk/buildroot/package/busybox/busybox-1.13.2-mdev.patch
   trunk/buildroot/package/busybox/busybox-1.13.2-modprobe.patch
   trunk/buildroot/package/busybox/busybox-1.13.2-tar.patch
   trunk/buildroot/package/busybox/busybox-1.13.2-unzip.patch
   trunk/buildroot/package/busybox/busybox-1.13.2-wget.patch

Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2009-03-11 10:10:54 UTC (rev 25604)
+++ trunk/buildroot/package/busybox/Config.in	2009-03-11 10:10:58 UTC (rev 25605)
@@ -66,7 +66,7 @@
 	default "1.10.4"	if BR2_BUSYBOX_VERSION_1_10_X
 	default "1.11.3"	if BR2_BUSYBOX_VERSION_1_11_X
 	default "1.12.4"	if BR2_BUSYBOX_VERSION_1_12_X
-	default "1.13.2"	if BR2_BUSYBOX_VERSION_1_13_X
+	default "1.13.3"	if BR2_BUSYBOX_VERSION_1_13_X
 
 config BR2_PACKAGE_BUSYBOX_FULLINSTALL
 	bool "Run BusyBox's own full installation"

Deleted: trunk/buildroot/package/busybox/busybox-1.13.2-awk.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.2-awk.patch	2009-03-11 10:10:54 UTC (rev 25604)
+++ trunk/buildroot/package/busybox/busybox-1.13.2-awk.patch	2009-03-11 10:10:58 UTC (rev 25605)
@@ -1,46 +0,0 @@
-diff -urpN busybox-1.13.2/editors/awk.c busybox-1.13.2-awk/editors/awk.c
---- busybox-1.13.2/editors/awk.c	2008-11-09 18:28:21.000000000 +0100
-+++ busybox-1.13.2-awk/editors/awk.c	2009-02-26 12:17:05.000000000 +0100
-@@ -392,8 +392,12 @@ static const uint16_t PRIMES[] ALIGN2 = 
- 
- 
- /* Globals. Split in two parts so that first one is addressed
-- * with (mostly short) negative offsets */
-+ * with (mostly short) negative offsets.
-+ * NB: it's unsafe to put members of type "double"
-+ * into globals2 (gcc may fail to align them).
-+ */
- struct globals {
-+	double t_double;
- 	chain beginseq, mainseq, endseq;
- 	chain *seq;
- 	node *break_ptr, *continue_ptr;
-@@ -442,16 +446,16 @@ struct globals2 {
- 	tsplitter exec_builtin__tspl;
- 
- 	/* biggest and least used members go last */
--	double t_double;
- 	tsplitter fsplitter, rsplitter;
- };
- #define G1 (ptr_to_globals[-1])
- #define G (*(struct globals2 *)ptr_to_globals)
- /* For debug. nm --size-sort awk.o | grep -vi ' [tr] ' */
--/* char G1size[sizeof(G1)]; - 0x6c */
--/* char Gsize[sizeof(G)]; - 0x1cc */
-+/*char G1size[sizeof(G1)]; - 0x74 */
-+/*char Gsize[sizeof(G)]; - 0x1c4 */
- /* Trying to keep most of members accessible with short offsets: */
--/* char Gofs_seed[offsetof(struct globals2, evaluate__seed)]; - 0x90 */
-+/*char Gofs_seed[offsetof(struct globals2, evaluate__seed)]; - 0x90 */
-+#define t_double     (G1.t_double    )
- #define beginseq     (G1.beginseq    )
- #define mainseq      (G1.mainseq     )
- #define endseq       (G1.endseq      )
-@@ -479,7 +483,6 @@ struct globals2 {
- #define t_info       (G.t_info      )
- #define t_tclass     (G.t_tclass    )
- #define t_string     (G.t_string    )
--#define t_double     (G.t_double    )
- #define t_lineno     (G.t_lineno    )
- #define t_rollback   (G.t_rollback  )
- #define intvar       (G.intvar      )

Deleted: trunk/buildroot/package/busybox/busybox-1.13.2-depmod.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.2-depmod.patch	2009-03-11 10:10:54 UTC (rev 25604)
+++ trunk/buildroot/package/busybox/busybox-1.13.2-depmod.patch	2009-03-11 10:10:58 UTC (rev 25605)
@@ -1,121 +0,0 @@
---- busybox-1.13.2/modutils/depmod.c	Sun Nov  9 18:28:03 2008
-+++ busybox-1.13.2-depmod/modutils/depmod.c	Mon Jan 12 23:12:59 2009
-@@ -33,7 +33,7 @@
- enum {
- 	ARG_a = (1<<0), /* All modules, ignore mods in argv */
- 	ARG_A = (1<<1), /* Only emit .ko that are newer than modules.dep file */
--	ARG_b = (1<<2), /* not /lib/modules/$(uname -r)/ but this base-dir */
-+	ARG_b = (1<<2), /* base directory when modules are in staging area */
- 	ARG_e = (1<<3), /* with -F, print unresolved symbols */
- 	ARG_F = (1<<4), /* System.map that contains the symbols */
- 	ARG_n = (1<<5)  /* dry-run, print to stdout only */
-@@ -57,7 +57,7 @@
- 	*first = info;
- 
- 	info->dnext = info->dprev = info;
--	info->name = xstrdup(fname);
-+	info->name = xasprintf("/%s", fname);
- 	info->modname = filename2modname(fname, NULL);
- 	for (ptr = image; ptr < image + len - 10; ptr++) {
- 		if (strncmp(ptr, "depends=", 8) == 0) {
-@@ -123,44 +123,61 @@
- 	}
- }
- 
-+static void xfreopen_write(const char *file, FILE *f)
-+{
-+	if (freopen(file, "w", f) == NULL)
-+		bb_perror_msg_and_die("can't open '%s'", file);
-+}
-+
- int depmod_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
- int depmod_main(int argc UNUSED_PARAM, char **argv)
- {
- 	module_info *modules = NULL, *m, *dep;
--	char *moddir_base = (char *)CONFIG_DEFAULT_MODULES_DIR;
-+	const char *moddir_base = "/";
-+	char *moddir, *version;
-+	struct utsname uts;
- 	int tmp;
- 
- 	getopt32(argv, "aAb:eF:n", &moddir_base, NULL);
- 	argv += optind;
- 
- 	/* goto modules location */
-+	xchdir(moddir_base);
- 
- 	/* If a version is provided, then that kernel version's module directory
- 	 * is used, rather than the current kernel version (as returned by
- 	 * "uname -r").  */
--	xchdir(moddir_base);
--	if (*argv && (sscanf(*argv, "%d.%d.%d", &tmp, &tmp, &tmp) == 3)) {
--		xchdir(*argv++);
-+	if (*argv && sscanf(*argv, "%d.%d.%d", &tmp, &tmp, &tmp) == 3) {
-+		version = *argv++;
- 	} else {
--		struct utsname uts;
- 		uname(&uts);
--		xchdir(uts.release);
-+		version = uts.release;
- 	}
--	/* If no modules are given on the command-line, -a is on per default.  */
--	option_mask32 |= *argv == NULL;
-+	moddir = concat_path_file(&CONFIG_DEFAULT_MODULES_DIR[1], version);
- 
- 	/* Scan modules */
--	moddir_base = xrealloc_getcwd_or_warn(NULL);
--	do {
--		recursive_action((option_mask32 & ARG_a) ? moddir_base : *argv,
--				ACTION_RECURSE, parse_module, NULL,  &modules, 0);
--	} while (!(option_mask32 & ARG_a) && *(++argv));
-+	if (*argv) {
-+		char *modfile;
-+		struct stat sb;
-+		do {
-+			modfile = concat_path_file(moddir, *argv);
-+			xstat(modfile, &sb);
-+			parse_module(modfile, &sb, &modules, 0);
-+			free(modfile);
-+		} while (*(++argv));
-+	} else {
-+		recursive_action(moddir, ACTION_RECURSE,
-+				 parse_module, NULL, &modules, 0);
-+	}
-+
-+	/* Prepare for writing out the dep files */
-+	xchdir(moddir);
- 	if (ENABLE_FEATURE_CLEAN_UP)
--		free(moddir_base);
-+		free(moddir);
- 
- 	/* Generate dependency and alias files */
- 	if (!(option_mask32 & ARG_n))
--		freopen(CONFIG_DEFAULT_DEPMOD_FILE, "w", stdout);
-+		xfreopen_write(CONFIG_DEFAULT_DEPMOD_FILE, stdout);
- 	for (m = modules; m != NULL; m = m->next) {
- 		printf("%s:", m->name);
- 
-@@ -174,12 +191,12 @@
- 			dep->dprev->dnext = dep->dnext;
- 			dep->dnext = dep->dprev = dep;
- 		}
--		puts("");
-+		bb_putchar('\n');
- 	}
- 
- #if ENABLE_FEATURE_MODUTILS_ALIAS
- 	if (!(option_mask32 & ARG_n))
--		freopen("modules.alias", "w", stdout);
-+		xfreopen_write("modules.alias", stdout);
- 	for (m = modules; m != NULL; m = m->next) {
- 		while (m->aliases) {
- 			printf("alias %s %s\n",
-@@ -190,7 +207,7 @@
- #endif
- #if ENABLE_FEATURE_MODUTILS_SYMBOLS
- 	if (!(option_mask32 & ARG_n))
--		freopen("modules.symbols", "w", stdout);
-+		xfreopen_write("modules.symbols", stdout);
- 	for (m = modules; m != NULL; m = m->next) {
- 		while (m->symbols) {
- 			printf("alias symbol:%s %s\n",

Deleted: trunk/buildroot/package/busybox/busybox-1.13.2-init.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.2-init.patch	2009-03-11 10:10:54 UTC (rev 25604)
+++ trunk/buildroot/package/busybox/busybox-1.13.2-init.patch	2009-03-11 10:10:58 UTC (rev 25605)
@@ -1,50 +0,0 @@
---- busybox-1.13.2/init/init.c	Wed Dec 31 04:06:45 2008
-+++ busybox-1.13.2-init/init/init.c	Thu Jan 29 03:02:13 2009
-@@ -671,15 +671,14 @@
-  */
- static void parse_inittab(void)
- {
-+#if ENABLE_FEATURE_USE_INITTAB
- 	char *token[4];
--	/* order must correspond to SYSINIT..RESTART constants */
--	static const char actions[] ALIGN1 =
--		"sysinit\0""respawn\0""askfirst\0""wait\0""once\0"
--		"ctrlaltdel\0""shutdown\0""restart\0";
-+	parser_t *parser = config_open2("/etc/inittab", fopen_for_read);
- 
--	parser_t *parser = config_open2(INITTAB, fopen_for_read);
--	/* No inittab file -- set up some default behavior */
--	if (parser == NULL) {
-+	if (parser == NULL)
-+#endif
-+	{
-+		/* No inittab file -- set up some default behavior */
- 		/* Reboot on Ctrl-Alt-Del */
- 		new_init_action(CTRLALTDEL, "reboot", "");
- 		/* Umount all filesystems on halt/reboot */
-@@ -699,11 +698,17 @@
- 		new_init_action(SYSINIT, INIT_SCRIPT, "");
- 		return;
- 	}
-+
-+#if ENABLE_FEATURE_USE_INITTAB
- 	/* optional_tty:ignored_runlevel:action:command
- 	 * Delims are not to be collapsed and need exactly 4 tokens
- 	 */
- 	while (config_read(parser, token, 4, 0, "#:",
- 				PARSE_NORMAL & ~(PARSE_TRIM | PARSE_COLLAPSE))) {
-+		/* order must correspond to SYSINIT..RESTART constants */
-+		static const char actions[] ALIGN1 =
-+			"sysinit\0""respawn\0""askfirst\0""wait\0""once\0"
-+			"ctrlaltdel\0""shutdown\0""restart\0";
- 		int action;
- 		char *tty = token[0];
- 
-@@ -727,6 +732,7 @@
- 				parser->lineno);
- 	}
- 	config_close(parser);
-+#endif
- }
- 
- #if ENABLE_FEATURE_USE_INITTAB

Deleted: trunk/buildroot/package/busybox/busybox-1.13.2-killall.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.2-killall.patch	2009-03-11 10:10:54 UTC (rev 25604)
+++ trunk/buildroot/package/busybox/busybox-1.13.2-killall.patch	2009-03-11 10:10:58 UTC (rev 25605)
@@ -1,17 +0,0 @@
---- busybox-1.13.2/include/libbb.h	Wed Dec 31 04:06:45 2008
-+++ busybox-1.13.2-killall/include/libbb.h	Sat Feb 14 02:41:18 2009
-@@ -1275,7 +1275,13 @@
- 	PSSCAN_UTIME    = 1 << 13,
- 	PSSCAN_TTY      = 1 << 14,
- 	PSSCAN_SMAPS	= (1 << 15) * ENABLE_FEATURE_TOPMEM,
--	PSSCAN_ARGVN    = (1 << 16) * (ENABLE_PGREP || ENABLE_PKILL || ENABLE_PIDOF),
-+	/* NB: used by find_pid_by_name(). Any applet using it
-+	 * needs to be mentioned here. */
-+	PSSCAN_ARGVN    = (1 << 16) * (ENABLE_KILLALL
-+				|| ENABLE_PGREP || ENABLE_PKILL
-+				|| ENABLE_PIDOF
-+				|| ENABLE_SESTATUS 
-+				),
- 	USE_SELINUX(PSSCAN_CONTEXT = 1 << 17,)
- 	PSSCAN_START_TIME = 1 << 18,
- 	PSSCAN_CPU      = 1 << 19,

Deleted: trunk/buildroot/package/busybox/busybox-1.13.2-mdev.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.2-mdev.patch	2009-03-11 10:10:54 UTC (rev 25604)
+++ trunk/buildroot/package/busybox/busybox-1.13.2-mdev.patch	2009-03-11 10:10:58 UTC (rev 25605)
@@ -1,39 +0,0 @@
---- busybox-1.13.2/testsuite/mdev.tests	Sun Nov  9 18:28:19 2008
-+++ busybox-1.13.2-mdev/testsuite/mdev.tests	Mon Jan 12 08:59:15 2009
-@@ -111,6 +111,22 @@
- 
- # continuing to use directory structure from prev test
- rm -rf mdev.testdir/dev/*
-+echo "sda 0:0 644 =block/ @echo @echo TEST" >mdev.testdir/etc/mdev.conf
-+testing "mdev move and command" \
-+	"env - PATH=$PATH ACTION=add DEVPATH=/block/sda chroot mdev.testdir /mdev 2>&1;
-+	ls -lnR mdev.testdir/dev | $FILTER_LS2" \
-+"\
-+ at echo TEST
-+mdev.testdir/dev:
-+drwxr-xr-x 2 0 0 block
-+
-+mdev.testdir/dev/block:
-+brw-r--r-- 1 0 0 sda
-+" \
-+	"" ""
-+
-+# continuing to use directory structure from prev test
-+rm -rf mdev.testdir/dev/*
- echo "@8,0 :1 644" >mdev.testdir/etc/mdev.conf
- testing "mdev #maj,min and no explicit uid" \
- 	"env - PATH=$PATH ACTION=add DEVPATH=/block/sda chroot mdev.testdir /mdev 2>&1;
---- busybox-1.13.2/util-linux/mdev.c	Sun Nov  9 18:28:22 2008
-+++ busybox-1.13.2-mdev/util-linux/mdev.c	Mon Jan 12 08:59:15 2009
-@@ -179,8 +179,9 @@
- 			unsigned i, n;
- #endif
- 			char *a = val;
--			s = strchr(val, ' ');
--			val = (s && s[1]) ? s+1 : NULL;
-+			s = strchrnul(val, ' ');
-+			val = (s[0] && s[1]) ? s+1 : NULL;
-+			s[0] = '\0';
- #if ENABLE_FEATURE_MDEV_RENAME_REGEXP
- 			/* substitute %1..9 with off[1..9], if any */
- 			n = 0;

Deleted: trunk/buildroot/package/busybox/busybox-1.13.2-modprobe.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.2-modprobe.patch	2009-03-11 10:10:54 UTC (rev 25604)
+++ trunk/buildroot/package/busybox/busybox-1.13.2-modprobe.patch	2009-03-11 10:10:58 UTC (rev 25605)
@@ -1,99 +0,0 @@
---- busybox-1.13.2/modutils/modutils-24.c	Sat Nov 29 07:48:56 2008
-+++ busybox-1.13.2-modprobe/modutils/modutils-24.c	Sun Feb  1 00:08:26 2009
-@@ -2150,7 +2150,7 @@
- 	sec->name = name;
- 	sec->idx = newidx;
- 	if (size)
--		sec->contents = xmalloc(size);
-+		sec->contents = xzalloc(size);
- 
- 	obj_insert_section_load_order(f, sec);
- 
-@@ -2165,7 +2165,7 @@
- 	int newidx = f->header.e_shnum++;
- 	struct obj_section *sec;
- 
--	f->sections = xrealloc(f->sections, (newidx + 1) * sizeof(sec));
-+	f->sections = xrealloc_vector(f->sections, 2, newidx);
- 	f->sections[newidx] = sec = arch_new_section();
- 
- 	sec->header.sh_type = SHT_PROGBITS;
-@@ -2175,7 +2175,7 @@
- 	sec->name = name;
- 	sec->idx = newidx;
- 	if (size)
--		sec->contents = xmalloc(size);
-+		sec->contents = xzalloc(size);
- 
- 	sec->load_next = f->load_order;
- 	f->load_order = sec;
-@@ -2571,8 +2571,7 @@
- 	/* Collect the modules' symbols.  */
- 
- 	if (nmod) {
--		ext_modules = modules = xmalloc(nmod * sizeof(*modules));
--		memset(modules, 0, nmod * sizeof(*modules));
-+		ext_modules = modules = xzalloc(nmod * sizeof(*modules));
- 		for (i = 0, mn = module_names, m = modules;
- 				i < nmod; ++i, ++m, mn += strlen(mn) + 1) {
- 			struct new_module_info info;
-@@ -2652,13 +2651,14 @@
- }
- 
- 
--static void  new_create_this_module(struct obj_file *f, const char *m_name)
-+static void new_create_this_module(struct obj_file *f, const char *m_name)
- {
- 	struct obj_section *sec;
- 
- 	sec = obj_create_alloced_section_first(f, ".this", tgt_sizeof_long,
- 			sizeof(struct new_module));
--	memset(sec->contents, 0, sizeof(struct new_module));
-+	/* done by obj_create_alloced_section_first: */
-+	/*memset(sec->contents, 0, sizeof(struct new_module));*/
- 
- 	obj_add_symbol(f, SPFX "__this_module", -1,
- 			ELF_ST_INFO(STB_LOCAL, STT_OBJECT), sec->idx, 0,
-@@ -2965,9 +2965,9 @@
- 		if (i == f->header.e_shnum) {
- 			struct obj_section *sec;
- 
-+			f->header.e_shnum++;
- 			f->sections = xrealloc_vector(f->sections, 2, i);
- 			f->sections[i] = sec = arch_new_section();
--			f->header.e_shnum = i + 1;
- 
- 			sec->header.sh_type = SHT_PROGBITS;
- 			sec->header.sh_flags = SHF_WRITE | SHF_ALLOC;
-@@ -3006,12 +3006,9 @@
- 	for (i = 0; i < f->header.e_shnum; ++i) {
- 		struct obj_section *s = f->sections[i];
- 		if (s->header.sh_type == SHT_NOBITS) {
-+			s->contents = NULL;
- 			if (s->header.sh_size != 0)
--				s->contents = memset(xmalloc(s->header.sh_size),
--						0, s->header.sh_size);
--			else
--				s->contents = NULL;
--
-+				s->contents = xzalloc(s->header.sh_size);
- 			s->header.sh_type = SHT_PROGBITS;
- 		}
- 	}
-@@ -3275,14 +3272,13 @@
- 			case SHT_SYMTAB:
- 			case SHT_STRTAB:
- 			case SHT_RELM:
-+				sec->contents = NULL;
- 				if (sec->header.sh_size > 0) {
--					sec->contents = xmalloc(sec->header.sh_size);
-+					sec->contents = xzalloc(sec->header.sh_size);
- 					fseek(fp, sec->header.sh_offset, SEEK_SET);
- 					if (fread(sec->contents, sec->header.sh_size, 1, fp) != 1) {
- 						bb_perror_msg_and_die("error reading ELF section data");
- 					}
--				} else {
--					sec->contents = NULL;
- 				}
- 				break;
- 

Deleted: trunk/buildroot/package/busybox/busybox-1.13.2-tar.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.2-tar.patch	2009-03-11 10:10:54 UTC (rev 25604)
+++ trunk/buildroot/package/busybox/busybox-1.13.2-tar.patch	2009-03-11 10:10:58 UTC (rev 25605)
@@ -1,11 +0,0 @@
---- busybox-1.13.2/archival/tar.c	Sun Nov  9 18:28:02 2008
-+++ busybox-1.13.2-tar/archival/tar.c	Tue Jan 20 03:52:04 2009
-@@ -591,8 +591,6 @@
- 	struct TarBallInfo tbInfo;
- 
- 	tbInfo.hlInfoHead = NULL;
--
--	fchmod(tar_fd, 0644);
- 	tbInfo.tarFd = tar_fd;
- 	tbInfo.verboseFlag = verboseFlag;
- 

Deleted: trunk/buildroot/package/busybox/busybox-1.13.2-unzip.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.2-unzip.patch	2009-03-11 10:10:54 UTC (rev 25604)
+++ trunk/buildroot/package/busybox/busybox-1.13.2-unzip.patch	2009-03-11 10:10:58 UTC (rev 25605)
@@ -1,12 +0,0 @@
-diff -urpN busybox-1.13.2/archival/unzip.c busybox-1.13.2-unzip/archival/unzip.c
---- busybox-1.13.2/archival/unzip.c	2008-11-09 18:28:02.000000000 +0100
-+++ busybox-1.13.2-unzip/archival/unzip.c	2009-02-26 12:17:21.000000000 +0100
-@@ -140,7 +140,7 @@ struct BUG_cde_header_must_be_16_bytes {
- };
- 
- #define FIX_ENDIANNESS_CDE(cde_header) do { \
--	(cde_header).formatted.cds_offset = SWAP_LE16((cde_header).formatted.cds_offset); \
-+	(cde_header).formatted.cds_offset = SWAP_LE32((cde_header).formatted.cds_offset); \
- } while (0)
- 
- enum { zip_fd = 3 };

Deleted: trunk/buildroot/package/busybox/busybox-1.13.2-wget.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.2-wget.patch	2009-03-11 10:10:54 UTC (rev 25604)
+++ trunk/buildroot/package/busybox/busybox-1.13.2-wget.patch	2009-03-11 10:10:58 UTC (rev 25605)
@@ -1,41 +0,0 @@
-diff -urpN busybox-1.13.2/networking/wget.c busybox-1.13.2-wget/networking/wget.c
---- busybox-1.13.2/networking/wget.c	2008-11-09 18:27:59.000000000 +0100
-+++ busybox-1.13.2-wget/networking/wget.c	2009-03-02 16:07:12.000000000 +0100
-@@ -417,15 +417,17 @@ int wget_main(int argc UNUSED_PARAM, cha
- 		KEY_content_length = 1, KEY_transfer_encoding, KEY_chunked, KEY_location
- 	};
- 	enum {
--		WGET_OPT_CONTINUE   = 0x1,
--		WGET_OPT_SPIDER	    = 0x2,
--		WGET_OPT_QUIET      = 0x4,
--		WGET_OPT_OUTNAME    = 0x8,
--		WGET_OPT_PREFIX     = 0x10,
--		WGET_OPT_PROXY      = 0x20,
--		WGET_OPT_USER_AGENT = 0x40,
--		WGET_OPT_PASSIVE    = 0x80,
--		WGET_OPT_HEADER     = 0x100,
-+		WGET_OPT_CONTINUE   = (1 << 0),
-+		WGET_OPT_SPIDER	    = (1 << 1),
-+		WGET_OPT_QUIET      = (1 << 2),
-+		WGET_OPT_OUTNAME    = (1 << 3),
-+		WGET_OPT_PREFIX     = (1 << 4),
-+		WGET_OPT_PROXY      = (1 << 5),
-+		WGET_OPT_USER_AGENT = (1 << 6),
-+		WGET_OPT_RETRIES    = (1 << 7),
-+		WGET_OPT_NETWORK_READ_TIMEOUT = (1 << 8),
-+		WGET_OPT_PASSIVE    = (1 << 9),
-+		WGET_OPT_HEADER     = (1 << 10),
- 	};
- #if ENABLE_FEATURE_WGET_LONG_OPTIONS
- 	static const char wget_longopts[] ALIGN1 =
-@@ -437,6 +439,10 @@ int wget_main(int argc UNUSED_PARAM, cha
- 		"directory-prefix\0" Required_argument "P"
- 		"proxy\0"            Required_argument "Y"
- 		"user-agent\0"       Required_argument "U"
-+		/* Ignored: */
-+		// "tries\0"            Required_argument "t"
-+		// "timeout\0"          Required_argument "T"
-+		/* Ignored (we always use PASV): */
- 		"passive-ftp\0"      No_argument       "\xff"
- 		"header\0"           Required_argument "\xfe"
- 		;
