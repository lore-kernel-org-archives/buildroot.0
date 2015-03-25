From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Mar 2015 20:04:42 +0100
Subject: [Buildroot] [git commit] busybox: bump to version 1.23.2
Message-ID: <20150325190444.E479E81813@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5b49c79d999381ed7159fd5e144c35b2ab9e5d8a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patches.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/0002-modprobe-small.patch |  171 --------------------------
 package/busybox/0003-dc.patch             |  163 -------------------------
 package/busybox/0004-wget.patch           |  185 -----------------------------
 package/busybox/0005-modinfo.patch        |   17 ---
 package/busybox/busybox.hash              |    6 +-
 package/busybox/busybox.mk                |    2 +-
 6 files changed, 4 insertions(+), 540 deletions(-)

diff --git a/package/busybox/0002-modprobe-small.patch b/package/busybox/0002-modprobe-small.patch
deleted file mode 100644
index 1bed4cb..0000000
--- a/package/busybox/0002-modprobe-small.patch
+++ /dev/null
@@ -1,171 +0,0 @@
-Patch to fix busybox MODPROBE_SMALL from upstream:
-http://busybox.net/downloads/fixes-1.23.1/busybox-1.23.1-modprobe-small.patch
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- busybox-1.23.1/modutils/modprobe-small.c
-+++ busybox-1.23.1-modprobe-small/modutils/modprobe-small.c
-@@ -552,9 +552,23 @@ static int already_loaded(const char *na
- 	return ret;
- }
- #else
--#define already_loaded(name) is_rmmod
-+#define already_loaded(name) 0
- #endif
- 
-+static int rmmod(const char *filename)
-+{
-+	int r;
-+	char modname[MODULE_NAME_LEN];
-+
-+	filename2modname(filename, modname);
-+	r = delete_module(modname, O_NONBLOCK | O_EXCL);
-+	dbg1_error_msg("delete_module('%s', O_NONBLOCK | O_EXCL):%d", modname, r);
-+	if (r != 0 && !(option_mask32 & OPT_q)) {
-+		bb_perror_msg("remove '%s'", modname);
-+	}
-+	return r;
-+}
-+
- /*
-  * Given modules definition and module name (or alias, or symbol)
-  * load/remove the module respecting dependencies.
-@@ -571,26 +585,36 @@ static void process_module(char *name, c
- 	module_info **infovec;
- 	module_info *info;
- 	int infoidx;
--	int is_rmmod = (option_mask32 & OPT_r) != 0;
-+	int is_remove = (option_mask32 & OPT_r) != 0;
- 
- 	dbg1_error_msg("process_module('%s','%s')", name, cmdline_options);
- 
- 	replace(name, '-', '_');
- 
--	dbg1_error_msg("already_loaded:%d is_rmmod:%d", already_loaded(name), is_rmmod);
-+	dbg1_error_msg("already_loaded:%d is_remove:%d", already_loaded(name), is_remove);
-+
-+	if (applet_name[0] == 'r') {
-+		/* rmmod.
-+		 * Does not remove dependencies, no need to scan, just remove.
-+		 * (compat note: this allows and strips .ko suffix)
-+		 */
-+		rmmod(name);
-+		return;
-+	}
-+
- 	/*
--	 * We used to have "is_rmmod != already_loaded(name)" check here, but
-+	 * We used to have "is_remove != already_loaded(name)" check here, but
- 	 *  modprobe -r pci:v00008086d00007010sv00000000sd00000000bc01sc01i80
- 	 * won't unload modules (there are more than one)
- 	 * which have this alias.
- 	 */
--	if (!is_rmmod && already_loaded(name)) {
-+	if (!is_remove && already_loaded(name)) {
- 		dbg1_error_msg("nothing to do for '%s'", name);
- 		return;
- 	}
- 
- 	options = NULL;
--	if (!is_rmmod) {
-+	if (!is_remove) {
- 		char *opt_filename = xasprintf("/etc/modules/%s", name);
- 		options = xmalloc_open_read_close(opt_filename, NULL);
- 		if (options)
-@@ -624,7 +648,7 @@ static void process_module(char *name, c
- 			0 /* depth */
- 		);
- 		dbg1_error_msg("dirscan complete");
--		/* Module was not found, or load failed, or is_rmmod */
-+		/* Module was not found, or load failed, or is_remove */
- 		if (module_found_idx >= 0) { /* module was found */
- 			infovec = xzalloc(2 * sizeof(infovec[0]));
- 			infovec[0] = &modinfo[module_found_idx];
-@@ -637,7 +661,7 @@ static void process_module(char *name, c
- 
- 	if (!infovec) {
- 		/* both dirscan and find_alias found nothing */
--		if (!is_rmmod && applet_name[0] != 'd') /* it wasn't rmmod or depmod */
-+		if (!is_remove && applet_name[0] != 'd') /* it wasn't rmmod or depmod */
- 			bb_error_msg("module '%s' not found", name);
- //TODO: _and_die()? or should we continue (un)loading modules listed on cmdline?
- 		goto ret;
-@@ -651,29 +675,15 @@ static void process_module(char *name, c
- 	 * a *list* of modinfo pointers from find_alias().
- 	 */
- 
--	/* rmmod or modprobe -r? unload module(s) */
--	if (is_rmmod) {
-+	/* modprobe -r? unload module(s) */
-+	if (is_remove) {
- 		infoidx = 0;
- 		while ((info = infovec[infoidx++]) != NULL) {
--			int r;
--			char modname[MODULE_NAME_LEN];
--
--			filename2modname(
--				bb_get_last_path_component_nostrip(info->pathname), modname);
--			r = delete_module(modname, O_NONBLOCK | O_EXCL);
--			dbg1_error_msg("delete_module('%s', O_NONBLOCK | O_EXCL):%d", modname, r);
-+			int r = rmmod(bb_get_last_path_component_nostrip(info->pathname));
- 			if (r != 0) {
--				if (!(option_mask32 & OPT_q))
--					bb_perror_msg("remove '%s'", modname);
--				goto ret;
-+				goto ret; /* error */
- 			}
- 		}
--
--		if (applet_name[0] == 'r') {
--			/* rmmod: do not remove dependencies, exit */
--			goto ret;
--		}
--
- 		/* modprobe -r: we do not stop here -
- 		 * continue to unload modules on which the module depends:
- 		 * "-r --remove: option causes modprobe to remove a module.
-@@ -694,7 +704,7 @@ static void process_module(char *name, c
- 		}
- 		free(deps);
- 
--		if (is_rmmod)
-+		if (is_remove)
- 			continue;
- 
- 		/* We are modprobe: load it */
-@@ -897,10 +907,10 @@ int modprobe_main(int argc UNUSED_PARAM,
- 	}
- 
- #if ENABLE_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE
--	/* If not rmmod, parse possible module options given on command line.
-+	/* If not rmmod/-r, parse possible module options given on command line.
- 	 * insmod/modprobe takes one module name, the rest are parameters. */
- 	options = NULL;
--	if ('r' != applet0) {
-+	if (!(option_mask32 & OPT_r)) {
- 		char **arg = argv;
- 		while (*++arg) {
- 			/* Enclose options in quotes */
-@@ -911,7 +921,7 @@ int modprobe_main(int argc UNUSED_PARAM,
- 		}
- 	}
- #else
--	if ('r' != applet0)
-+	if (!(option_mask32 & OPT_r))
- 		argv[1] = NULL;
- #endif
- 
-@@ -935,10 +945,11 @@ int modprobe_main(int argc UNUSED_PARAM,
- 	}
- 
- 	/* Try to load modprobe.dep.bb */
--	load_dep_bb();
-+	if ('r' != applet0) /* not rmmod */
-+		load_dep_bb();
- 
- 	/* Load/remove modules.
--	 * Only rmmod loops here, modprobe has only argv[0] */
-+	 * Only rmmod/modprobe -r loops here, insmod/modprobe has only argv[0] */
- 	do {
- 		process_module(*argv, options);
- 	} while (*++argv);
diff --git a/package/busybox/0003-dc.patch b/package/busybox/0003-dc.patch
deleted file mode 100644
index db20cf5..0000000
--- a/package/busybox/0003-dc.patch
+++ /dev/null
@@ -1,163 +0,0 @@
-Fix dc inconsistency, see https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=538685
-From upstream: http://busybox.net/downloads/fixes-1.23.1/busybox-1.23.1-dc.patch
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- busybox-1.23.1/miscutils/dc.c
-+++ busybox-1.23.1-dc/miscutils/dc.c
-@@ -196,14 +196,6 @@ struct op {
- };
- 
- static const struct op operators[] = {
--	{"+",   add},
--	{"add", add},
--	{"-",   sub},
--	{"sub", sub},
--	{"*",   mul},
--	{"mul", mul},
--	{"/",   divide},
--	{"div", divide},
- #if ENABLE_FEATURE_DC_LIBM
- 	{"**",  power},
- 	{"exp", power},
-@@ -216,28 +208,47 @@ static const struct op operators[] = {
- 	{"not", not},
- 	{"eor", eor},
- 	{"xor", eor},
-+	{"+",   add},
-+	{"add", add},
-+	{"-",   sub},
-+	{"sub", sub},
-+	{"*",   mul},
-+	{"mul", mul},
-+	{"/",   divide},
-+	{"div", divide},
- 	{"p", print_no_pop},
- 	{"f", print_stack_no_pop},
- 	{"o", set_output_base},
- };
- 
-+/* Feed the stack machine */
- static void stack_machine(const char *argument)
- {
- 	char *end;
--	double d;
-+	double number;
- 	const struct op *o;
- 
--	d = strtod(argument, &end);
--	if (end != argument && *end == '\0') {
--		push(d);
--		return;
-+ next:
-+	number = strtod(argument, &end);
-+	if (end != argument) {
-+		argument = end;
-+		push(number);
-+		goto next;
- 	}
- 
-+	/* We might have matched a digit, eventually advance the argument */
-+	argument = skip_whitespace(argument);
-+
-+	if (*argument == '\0')
-+		return;
-+
- 	o = operators;
- 	do {
--		if (strcmp(o->name, argument) == 0) {
-+		const size_t name_len = strlen(o->name);
-+		if (strncmp(o->name, argument, name_len) == 0) {
-+			argument += name_len;
- 			o->function();
--			return;
-+			goto next;
- 		}
- 		o++;
- 	} while (o != operators + ARRAY_SIZE(operators));
-@@ -254,25 +265,11 @@ int dc_main(int argc UNUSED_PARAM, char
- 	if (!argv[0]) {
- 		/* take stuff from stdin if no args are given */
- 		char *line;
--		char *cursor;
--		char *token;
- 		while ((line = xmalloc_fgetline(stdin)) != NULL) {
--			cursor = line;
--			while (1) {
--				token = skip_whitespace(cursor);
--				if (*token == '\0')
--					break;
--				cursor = skip_non_whitespace(token);
--				if (*cursor != '\0')
--					*cursor++ = '\0';
--				stack_machine(token);
--			}
-+			stack_machine(line);
- 			free(line);
- 		}
- 	} else {
--		// why? it breaks "dc -2 2 + p"
--		//if (argv[0][0] == '-')
--		//	bb_show_usage();
- 		do {
- 			stack_machine(*argv);
- 		} while (*++argv);
---- busybox-1.23.1/testsuite/dc.tests
-+++ busybox-1.23.1-dc/testsuite/dc.tests
-@@ -0,0 +1,56 @@
-+#!/bin/sh
-+# Copyright 2015 by Bernhard Reutner-Fischer
-+# Licensed under GPLv2 or later, see file LICENSE in this source tree.
-+
-+. ./testing.sh
-+
-+# testing "test name" "command" "expected result" "file input" "stdin"
-+
-+testing "dc basic syntax (stdin, multiple args)" \
-+	"dc" \
-+	"30\n" \
-+	"" "10 20+p"
-+
-+testing "dc basic syntax (argv, single arg)" \
-+	"dc '10 20+p'" \
-+	"30\n" \
-+	"" ""
-+
-+testing "dc basic syntax (argv, multiple args)" \
-+	"dc 10 20+p" \
-+	"30\n" \
-+	"" ""
-+
-+testing "dc complex with spaces (single arg)" \
-+	"dc '8 8 * 2 2 + / p'" \
-+	"16\n" \
-+	"" ""
-+
-+testing "dc complex without spaces (single arg)" \
-+	"dc '8 8*2 2+/p'" \
-+	"16\n" \
-+	"" ""
-+
-+testing "dc complex with spaces (multiple args)" \
-+	"dc 8 8 \* 2 2 + / p" \
-+	"16\n" \
-+	"" ""
-+
-+testing "dc complex without spaces (multiple args)" \
-+	"dc 8 8\*2 2+/p" \
-+	"16\n" \
-+	"" ""
-+
-+exit $FAILCOUNT
-+
-+# we do not support arguments
-+testing "dc -e <exprs>" \
-+	"dc -e '10 2+f'" \
-+	"12\n" \
-+	"" ""
-+
-+testing "dc -f <exprs-from-given-file>" \
-+	"dc -f input" \
-+	"12\n" \
-+	"10 2+f" ""
-+
diff --git a/package/busybox/0004-wget.patch b/package/busybox/0004-wget.patch
deleted file mode 100644
index e1ba51c..0000000
--- a/package/busybox/0004-wget.patch
+++ /dev/null
@@ -1,185 +0,0 @@
-Fix broken --header handling, see: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=744725
-From upstream: http://busybox.net/downloads/fixes-1.23.1/busybox-1.23.1-wget.patch
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- busybox-1.23.1/networking/wget.c
-+++ busybox-1.23.1-wget/networking/wget.c
-@@ -38,8 +38,14 @@
- 
- #if 0
- # define log_io(...) bb_error_msg(__VA_ARGS__)
-+# define SENDFMT(fp, fmt, ...) \
-+	do { \
-+		log_io("> " fmt, ##__VA_ARGS__); \
-+		fprintf(fp, fmt, ##__VA_ARGS__); \
-+	} while (0);
- #else
- # define log_io(...) ((void)0)
-+# define SENDFMT(fp, fmt, ...) fprintf(fp, fmt, ##__VA_ARGS__)
- #endif
- 
- 
-@@ -55,6 +61,36 @@ static const char P_FTP[] = "ftp";
- static const char P_HTTP[] = "http";
- static const char P_HTTPS[] = "https";
- 
-+#if ENABLE_FEATURE_WGET_LONG_OPTIONS
-+/* User-specified headers prevent using our corresponding built-in headers.  */
-+enum {
-+	HDR_HOST          = (1<<0),
-+	HDR_USER_AGENT    = (1<<1),
-+	HDR_RANGE         = (1<<2),
-+	HDR_AUTH          = (1<<3) * ENABLE_FEATURE_WGET_AUTHENTICATION,
-+	HDR_PROXY_AUTH    = (1<<4) * ENABLE_FEATURE_WGET_AUTHENTICATION,
-+};
-+static const char wget_user_headers[] ALIGN1 =
-+	"Host:\0"
-+	"User-Agent:\0"
-+	"Range:\0"
-+# if ENABLE_FEATURE_WGET_AUTHENTICATION
-+	"Authorization:\0"
-+	"Proxy-Authorization:\0"
-+# endif
-+	;
-+# define USR_HEADER_HOST       (G.user_headers & HDR_HOST)
-+# define USR_HEADER_USER_AGENT (G.user_headers & HDR_USER_AGENT)
-+# define USR_HEADER_RANGE      (G.user_headers & HDR_RANGE)
-+# define USR_HEADER_AUTH       (G.user_headers & HDR_AUTH)
-+# define USR_HEADER_PROXY_AUTH (G.user_headers & HDR_PROXY_AUTH)
-+#else /* No long options, no user-headers :( */
-+# define USR_HEADER_HOST       0
-+# define USR_HEADER_USER_AGENT 0
-+# define USR_HEADER_RANGE      0
-+# define USR_HEADER_AUTH       0
-+# define USR_HEADER_PROXY_AUTH 0
-+#endif
- 
- /* Globals */
- struct globals {
-@@ -69,6 +105,7 @@ struct globals {
- #if ENABLE_FEATURE_WGET_LONG_OPTIONS
- 	char *post_data;
- 	char *extra_headers;
-+	unsigned char user_headers; /* Headers mentioned by the user */
- #endif
- 	char *fname_out;        /* where to direct output (-O) */
- 	const char *proxy_flag; /* Use proxies if env vars are set */
-@@ -830,43 +867,46 @@ static void download_one_url(const char
- #endif
- 		/* Send HTTP request */
- 		if (use_proxy) {
--			fprintf(sfp, "GET %s://%s/%s HTTP/1.1\r\n",
-+			SENDFMT(sfp, "GET %s://%s/%s HTTP/1.1\r\n",
- 				target.protocol, target.host,
- 				target.path);
- 		} else {
--			fprintf(sfp, "%s /%s HTTP/1.1\r\n",
-+			SENDFMT(sfp, "%s /%s HTTP/1.1\r\n",
- 				(option_mask32 & WGET_OPT_POST_DATA) ? "POST" : "GET",
- 				target.path);
- 		}
--
--		fprintf(sfp, "Host: %s\r\nUser-Agent: %s\r\n",
--			target.host, G.user_agent);
-+		if (!USR_HEADER_HOST)
-+			SENDFMT(sfp, "Host: %s\r\n", target.host);
-+		if (!USR_HEADER_USER_AGENT)
-+			SENDFMT(sfp, "User-Agent: %s\r\n", G.user_agent);
- 
- 		/* Ask server to close the connection as soon as we are done
- 		 * (IOW: we do not intend to send more requests)
- 		 */
--		fprintf(sfp, "Connection: close\r\n");
-+		SENDFMT(sfp, "Connection: close\r\n");
- 
- #if ENABLE_FEATURE_WGET_AUTHENTICATION
--		if (target.user) {
--			fprintf(sfp, "Proxy-Authorization: Basic %s\r\n"+6,
-+		if (target.user && !USR_HEADER_AUTH) {
-+			SENDFMT(sfp, "Proxy-Authorization: Basic %s\r\n"+6,
- 				base64enc(target.user));
- 		}
--		if (use_proxy && server.user) {
--			fprintf(sfp, "Proxy-Authorization: Basic %s\r\n",
-+		if (use_proxy && server.user && !USR_HEADER_PROXY_AUTH) {
-+			SENDFMT(sfp, "Proxy-Authorization: Basic %s\r\n",
- 				base64enc(server.user));
- 		}
- #endif
- 
--		if (G.beg_range != 0)
--			fprintf(sfp, "Range: bytes=%"OFF_FMT"u-\r\n", G.beg_range);
-+		if (G.beg_range != 0 && !USR_HEADER_RANGE)
-+			SENDFMT(sfp, "Range: bytes=%"OFF_FMT"u-\r\n", G.beg_range);
- 
- #if ENABLE_FEATURE_WGET_LONG_OPTIONS
--		if (G.extra_headers)
-+		if (G.extra_headers) {
-+			log_io(G.extra_headers);
- 			fputs(G.extra_headers, sfp);
-+		}
- 
- 		if (option_mask32 & WGET_OPT_POST_DATA) {
--			fprintf(sfp,
-+			SENDFMT(sfp,
- 				"Content-Type: application/x-www-form-urlencoded\r\n"
- 				"Content-Length: %u\r\n"
- 				"\r\n"
-@@ -876,7 +916,7 @@ static void download_one_url(const char
- 		} else
- #endif
- 		{
--			fprintf(sfp, "\r\n");
-+			SENDFMT(sfp, "\r\n");
- 		}
- 
- 		fflush(sfp);
-@@ -1093,7 +1133,9 @@ int wget_main(int argc UNUSED_PARAM, cha
- #if ENABLE_FEATURE_WGET_LONG_OPTIONS
- 	applet_long_options = wget_longopts;
- #endif
--	opt_complementary = "-1" IF_FEATURE_WGET_TIMEOUT(":T+") IF_FEATURE_WGET_LONG_OPTIONS(":\xfe::");
-+	opt_complementary = "-1"
-+			IF_FEATURE_WGET_TIMEOUT(":T+")
-+			IF_FEATURE_WGET_LONG_OPTIONS(":\xfe::");
- 	getopt32(argv, "csqO:P:Y:U:T:" /*ignored:*/ "t:",
- 		&G.fname_out, &G.dir_prefix,
- 		&G.proxy_flag, &G.user_agent,
-@@ -1106,16 +1148,32 @@ int wget_main(int argc UNUSED_PARAM, cha
- 
- #if ENABLE_FEATURE_WGET_LONG_OPTIONS
- 	if (headers_llist) {
--		int size = 1;
--		char *cp;
-+		int size = 0;
-+		char *hdr;
- 		llist_t *ll = headers_llist;
- 		while (ll) {
- 			size += strlen(ll->data) + 2;
- 			ll = ll->link;
- 		}
--		G.extra_headers = cp = xmalloc(size);
-+		G.extra_headers = hdr = xmalloc(size + 1);
- 		while (headers_llist) {
--			cp += sprintf(cp, "%s\r\n", (char*)llist_pop(&headers_llist));
-+			int bit;
-+			const char *words;
-+
-+			size = sprintf(hdr, "%s\r\n",
-+					(char*)llist_pop(&headers_llist));
-+			/* a bit like index_in_substrings but don't match full key */
-+			bit = 1;
-+			words = wget_user_headers;
-+			while (*words) {
-+				if (strstr(hdr, words) == hdr) {
-+					G.user_headers |= bit;
-+					break;
-+				}
-+				bit <<= 1;
-+				words += strlen(words) + 1;
-+			}
-+			hdr += size;
- 		}
- 	}
- #endif
diff --git a/package/busybox/0005-modinfo.patch b/package/busybox/0005-modinfo.patch
deleted file mode 100644
index 0a221f7..0000000
--- a/package/busybox/0005-modinfo.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Fix broken modinfo.
-
-From upstream: http://busybox.net/downloads/fixes-1.23.1/busybox-1.23.1-modinfo.patch
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- busybox-1.23.1/modutils/modinfo.c
-+++ busybox-1.23.1-modinfo/modutils/modinfo.c
-@@ -154,7 +154,7 @@ int modinfo_main(int argc UNUSED_PARAM,
- 		if (colon == NULL)
- 			continue;
- 		*colon = '\0';
--		filename2modname(tokens[0], name);
-+		filename2modname(bb_basename(tokens[0]), name);
- 		for (i = 0; argv[i]; i++) {
- 			if (fnmatch(argv[i], name, 0) == 0) {
- 				modinfo(tokens[0], uts.release, &env);
diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index 42d8bde..cfd4937 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,3 +1,3 @@
-# From http://busybox.net/downloads/busybox-1.23.1.tar.bz2.sign
-md5	5c94d6301a964cd91619bd4d74605245	busybox-1.23.1.tar.bz2
-sha1	d84d2858f53fa85e70207e812a8003dd0933bad9	busybox-1.23.1.tar.bz2
+# From http://busybox.net/downloads/busybox-1.23.2.tar.bz2.sign
+md5	7925683d7dd105aabe9b6b618d48cc73	busybox-1.23.2.tar.bz2
+sha1	7f37193cb249f27630e0b2a2c6c9bbb7b1d24c16	busybox-1.23.2.tar.bz2
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index a3ac7e7..7412ce0 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.23.1
+BUSYBOX_VERSION = 1.23.2
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPLv2
