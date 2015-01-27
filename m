From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Jan 2015 15:31:50 +0100
Subject: [Buildroot] [git commit] busybox: bump to version 1.23.1
Message-ID: <20150127144332.B297E8083C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf838d06ff00bcc52f2885ac691721367a49f6c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patches are upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/0002-ash.patch      |   39 -------
 package/busybox/0003-vi.patch       |   54 ---------
 package/busybox/0004-modprobe.patch |  208 -----------------------------------
 package/busybox/busybox.hash        |    6 +-
 package/busybox/busybox.mk          |    2 +-
 5 files changed, 4 insertions(+), 305 deletions(-)

diff --git a/package/busybox/0002-ash.patch b/package/busybox/0002-ash.patch
deleted file mode 100644
index fbd1fad..0000000
--- a/package/busybox/0002-ash.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Upstream http://busybox.net/downloads/fixes-1.23.0/busybox-1.23.0-ash.patch
-post-release hotfix patch for ash segfault.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- busybox-1.23.0/shell/ash.c
-+++ busybox-1.23.0-ash/shell/ash.c
-@@ -6746,6 +6746,14 @@ varvalue(char *name, int varflags, int f
- 		len = strlen(p);
- 		if (!(subtype == VSPLUS || subtype == VSLENGTH))
- 			memtodest(p, len, syntax, quotes);
-+#if ENABLE_UNICODE_SUPPORT
-+		if (subtype == VSLENGTH && len > 0) {
-+			reinit_unicode_for_ash();
-+			if (unicode_status == UNICODE_ON) {
-+				len = unicode_strlen(p);
-+			}
-+		}
-+#endif
- 		return len;
- 	}
- 
-@@ -6829,15 +6837,7 @@ evalvar(char *p, int flags, struct strli
- 		varunset(p, var, 0, 0);
- 
- 	if (subtype == VSLENGTH) {
--		ssize_t n = varlen;
--		if (n > 0) {
--			reinit_unicode_for_ash();
--			if (unicode_status == UNICODE_ON) {
--				const char *val = lookupvar(var);
--				n = unicode_strlen(val);
--			}
--		}
--		cvtnum(n > 0 ? n : 0);
-+		cvtnum(varlen > 0 ? varlen : 0);
- 		goto record;
- 	}
- 
diff --git a/package/busybox/0003-vi.patch b/package/busybox/0003-vi.patch
deleted file mode 100644
index be5457f..0000000
--- a/package/busybox/0003-vi.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-Upstream http://busybox.net/downloads/fixes-1.23.0/busybox-1.23.0-vi.patch
-post-release hotfix patch for vi crash when called without a filename.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- busybox-1.23.0/editors/vi.c
-+++ busybox-1.23.0-vi/editors/vi.c
-@@ -542,9 +542,6 @@ static void cookmode(void);	// return to
- static int mysleep(int);
- static int readit(void);	// read (maybe cursor) key from stdin
- static int get_one_char(void);	// read 1 char from stdin
--#if !ENABLE_FEATURE_VI_READONLY
--#define file_insert(fn, p, update_ro_status) file_insert(fn, p)
--#endif
- // file_insert might reallocate text[]!
- static int file_insert(const char *, char *, int);
- static int file_write(char *, char *, char *);
-@@ -1325,7 +1322,7 @@ static void colon(char *buf)
- 			q = next_line(q);
- 		{ // dance around potentially-reallocated text[]
- 			uintptr_t ofs = q - text;
--			size = file_insert(fn, q, /*update_ro:*/ 0);
-+			size = file_insert(fn, q, 0);
- 			q = text + ofs;
- 		}
- 		if (size < 0)
-@@ -2905,7 +2902,7 @@ static char *get_input_line(const char *
- }
- 
- // might reallocate text[]!
--static int file_insert(const char *fn, char *p, int update_ro_status)
-+static int file_insert(const char *fn, char *p, int initial)
- {
- 	int cnt = -1;
- 	int fd, size;
-@@ -2918,7 +2915,8 @@ static int file_insert(const char *fn, c
- 
- 	fd = open(fn, O_RDONLY);
- 	if (fd < 0) {
--		status_line_bold_errno(fn);
-+		if (!initial)
-+			status_line_bold_errno(fn);
- 		return cnt;
- 	}
- 
-@@ -2946,7 +2944,7 @@ static int file_insert(const char *fn, c
- 	close(fd);
- 
- #if ENABLE_FEATURE_VI_READONLY
--	if (update_ro_status
-+	if (initial
- 	 && ((access(fn, W_OK) < 0) ||
- 		/* root will always have access()
- 		 * so we check fileperms too */
diff --git a/package/busybox/0004-modprobe.patch b/package/busybox/0004-modprobe.patch
deleted file mode 100644
index df2a86b..0000000
--- a/package/busybox/0004-modprobe.patch
+++ /dev/null
@@ -1,208 +0,0 @@
-Upstream http://busybox.net/downloads/fixes-1.23.0/busybox-1.23.0-modprobe.patch
-post-release hotfix patch for several modutils crashes/failures.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- busybox-1.23.0/modutils/depmod.c
-+++ busybox-1.23.0-modprobe/modutils/depmod.c
-@@ -51,7 +51,11 @@ static int FAST_FUNC parse_module(const 
- 
- 	info->dnext = info->dprev = info;
- 	info->name = xstrdup(fname + 2); /* skip "./" */
--	info->modname = xstrdup(filename2modname(fname, modname));
-+	info->modname = xstrdup(
-+		filename2modname(
-+			bb_get_last_path_component_nostrip(fname),
-+			modname
-+	));
- 	for (ptr = image; ptr < image + len - 10; ptr++) {
- 		if (strncmp(ptr, "depends=", 8) == 0) {
- 			char *u;
-@@ -242,17 +246,18 @@ int depmod_main(int argc UNUSED_PARAM, c
- 	if (!(option_mask32 & OPT_n))
- 		xfreopen_write("modules.alias", stdout);
- 	for (m = modules; m != NULL; m = m->next) {
-+		char modname[MODULE_NAME_LEN];
- 		const char *fname = bb_basename(m->name);
--		int fnlen = strchrnul(fname, '.') - fname;
-+		filename2modname(fname, modname);
- 		while (m->aliases) {
- 			/* Last word can well be m->modname instead,
- 			 * but depmod from module-init-tools 3.4
- 			 * uses module basename, i.e., no s/-/_/g.
- 			 * (pathname and .ko.* are still stripped)
- 			 * Mimicking that... */
--			printf("alias %s %.*s\n",
-+			printf("alias %s %s\n",
- 				(char*)llist_pop(&m->aliases),
--				fnlen, fname);
-+				modname);
- 		}
- 	}
- #endif
-@@ -260,12 +265,13 @@ int depmod_main(int argc UNUSED_PARAM, c
- 	if (!(option_mask32 & OPT_n))
- 		xfreopen_write("modules.symbols", stdout);
- 	for (m = modules; m != NULL; m = m->next) {
-+		char modname[MODULE_NAME_LEN];
- 		const char *fname = bb_basename(m->name);
--		int fnlen = strchrnul(fname, '.') - fname;
-+		filename2modname(fname, modname);
- 		while (m->symbols) {
--			printf("alias symbol:%s %.*s\n",
-+			printf("alias symbol:%s %s\n",
- 				(char*)llist_pop(&m->symbols),
--				fnlen, fname);
-+				modname);
- 		}
- 	}
- #endif
---- busybox-1.23.0/modutils/modprobe.c
-+++ busybox-1.23.0-modprobe/modutils/modprobe.c
-@@ -229,26 +229,20 @@ static ALWAYS_INLINE struct module_entry
- {
- 	return helper_get_module(module, 1);
- }
--static ALWAYS_INLINE struct module_entry *get_modentry(const char *module)
-+/* So far this function always gets a module pathname, never an alias name.
-+ * The crucial difference is that pathname needs dirname stripping,
-+ * while alias name must NOT do it!
-+ * Testcase where dirname stripping is likely to go wrong: "modprobe devname:snd/timer"
-+ */
-+static ALWAYS_INLINE struct module_entry *get_modentry(const char *pathname)
- {
--	return helper_get_module(module, 0);
-+	return helper_get_module(bb_get_last_path_component_nostrip(pathname), 0);
- }
- 
- static void add_probe(const char *name)
- {
- 	struct module_entry *m;
- 
--	/*
--	 * get_or_add_modentry() strips path from name and works
--	 * on remaining basename.
--	 * This would make "rmmod dir/name" and "modprobe dir/name"
--	 * to work like "rmmod name" and "modprobe name",
--	 * which is wrong, and can be abused via implicit modprobing:
--	 * "ifconfig /usbserial up" tries to modprobe netdev-/usbserial.
--	 */
--	if (strchr(name, '/'))
--		bb_error_msg_and_die("malformed module name '%s'", name);
--
- 	m = get_or_add_modentry(name);
- 	if (!(option_mask32 & (OPT_REMOVE | OPT_SHOW_DEPS))
- 	 && (m->flags & MODULE_FLAG_LOADED)
-@@ -510,7 +504,7 @@ static void load_modules_dep(void)
- 		colon = last_char_is(tokens[0], ':');
- 		if (colon == NULL)
- 			continue;
--		*colon = 0;
-+		*colon = '\0';
- 
- 		m = get_modentry(tokens[0]);
- 		if (m == NULL)
-@@ -557,7 +551,6 @@ int modprobe_main(int argc UNUSED_PARAM,
- 
- 	if (opt & OPT_LIST_ONLY) {
- 		int i;
--		char name[MODULE_NAME_LEN];
- 		char *colon, *tokens[2];
- 		parser_t *p = config_open2(CONFIG_DEFAULT_DEPMOD_FILE, xfopen_for_read);
- 
-@@ -569,10 +562,14 @@ int modprobe_main(int argc UNUSED_PARAM,
- 			if (!colon)
- 				continue;
- 			*colon = '\0';
--			filename2modname(tokens[0], name);
- 			if (!argv[0])
- 				puts(tokens[0]);
- 			else {
-+				char name[MODULE_NAME_LEN];
-+				filename2modname(
-+					bb_get_last_path_component_nostrip(tokens[0]),
-+					name
-+				);
- 				for (i = 0; argv[i]; i++) {
- 					if (fnmatch(argv[i], name, 0) == 0) {
- 						puts(tokens[0]);
---- busybox-1.23.0/modutils/modprobe-small.c
-+++ busybox-1.23.0-modprobe/modutils/modprobe-small.c
-@@ -149,9 +149,13 @@ static void replace(char *s, char what, 
- static char *filename2modname(const char *filename, char *modname)
- {
- 	int i;
--	char *from;
-+	const char *from;
- 
--	from = bb_get_last_path_component_nostrip(filename);
-+	// Disabled since otherwise "modprobe dir/name" would work
-+	// as if it is "modprobe name". It is unclear why
-+	// 'basenamization' was here in the first place.
-+	//from = bb_get_last_path_component_nostrip(filename);
-+	from = filename;
- 	for (i = 0; i < (MODULE_NAME_LEN-1) && from[i] != '\0' && from[i] != '.'; i++)
- 		modname[i] = (from[i] == '-') ? '_' : from[i];
- 	modname[i] = '\0';
-@@ -631,6 +635,14 @@ static void process_module(char *name, c
- 		infovec = find_alias(name);
- 	}
- 
-+	if (!infovec) {
-+		/* both dirscan and find_alias found nothing */
-+		if (!is_rmmod && applet_name[0] != 'd') /* it wasn't rmmod or depmod */
-+			bb_error_msg("module '%s' not found", name);
-+//TODO: _and_die()? or should we continue (un)loading modules listed on cmdline?
-+		goto ret;
-+	}
-+
- 	/* There can be more than one module for the given alias. For example,
- 	 * "pci:v00008086d00007010sv00000000sd00000000bc01sc01i80" matches
- 	 * ata_piix because it has alias "pci:v00008086d00007010sv*sd*bc*sc*i*"
-@@ -646,7 +658,8 @@ static void process_module(char *name, c
- 			int r;
- 			char modname[MODULE_NAME_LEN];
- 
--			filename2modname(info->pathname, modname);
-+			filename2modname(
-+				bb_get_last_path_component_nostrip(info->pathname), modname);
- 			r = delete_module(modname, O_NONBLOCK | O_EXCL);
- 			dbg1_error_msg("delete_module('%s', O_NONBLOCK | O_EXCL):%d", modname, r);
- 			if (r != 0) {
-@@ -669,14 +682,6 @@ static void process_module(char *name, c
- 		 */
- 	}
- 
--	if (!infovec) {
--		/* both dirscan and find_alias found nothing */
--		if (!is_rmmod && applet_name[0] != 'd') /* it wasn't rmmod or depmod */
--			bb_error_msg("module '%s' not found", name);
--//TODO: _and_die()? or should we continue (un)loading modules listed on cmdline?
--		goto ret;
--	}
--
- 	infoidx = 0;
- 	while ((info = infovec[infoidx++]) != NULL) {
- 		/* Iterate thru dependencies, trying to (un)load them */
---- busybox-1.23.0/modutils/modutils.c
-+++ busybox-1.23.0-modprobe/modutils/modutils.c
-@@ -48,13 +48,17 @@ int FAST_FUNC string_to_llist(char *stri
- char* FAST_FUNC filename2modname(const char *filename, char *modname)
- {
- 	int i;
--	char *from;
-+	const char *from;
- 
- 	if (filename == NULL)
- 		return NULL;
- 	if (modname == NULL)
- 		modname = xmalloc(MODULE_NAME_LEN);
--	from = bb_get_last_path_component_nostrip(filename);
-+	// Disabled since otherwise "modprobe dir/name" would work
-+	// as if it is "modprobe name". It is unclear why
-+	// 'basenamization' was here in the first place.
-+	//from = bb_get_last_path_component_nostrip(filename);
-+	from = filename;
- 	for (i = 0; i < (MODULE_NAME_LEN-1) && from[i] != '\0' && from[i] != '.'; i++)
- 		modname[i] = (from[i] == '-') ? '_' : from[i];
- 	modname[i] = '\0';
diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index 5ec4b78..42d8bde 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,3 +1,3 @@
-# From http://busybox.net/downloads/busybox-1.23.0.tar.bz2.sign
-md5	6dffeb16044c6022476c64744492106a	busybox-1.23.0.tar.bz2
-sha1	c38285fc1458c19d0f7ca01515fc95c404bc596d	busybox-1.23.0.tar.bz2
+# From http://busybox.net/downloads/busybox-1.23.1.tar.bz2.sign
+md5	5c94d6301a964cd91619bd4d74605245	busybox-1.23.1.tar.bz2
+sha1	d84d2858f53fa85e70207e812a8003dd0933bad9	busybox-1.23.1.tar.bz2
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index f68a2f8..61f6a16 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.23.0
+BUSYBOX_VERSION = 1.23.1
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPLv2
