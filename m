From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:01:33 +0100
Subject: [Buildroot] [git commit] busybox: add 1.23.1 fixes for dc and wget
Message-ID: <20150219210139.E1A37817AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74aca655bbed965b33f9eff350e80fc4e4d99cf1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/0003-dc.patch   |  163 ++++++++++++++++++++++++++++++++++
 package/busybox/0004-wget.patch |  185 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 348 insertions(+), 0 deletions(-)

diff --git a/package/busybox/0003-dc.patch b/package/busybox/0003-dc.patch
new file mode 100644
index 0000000..db20cf5
--- /dev/null
+++ b/package/busybox/0003-dc.patch
@@ -0,0 +1,163 @@
+Fix dc inconsistency, see https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=538685
+From upstream: http://busybox.net/downloads/fixes-1.23.1/busybox-1.23.1-dc.patch
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- busybox-1.23.1/miscutils/dc.c
++++ busybox-1.23.1-dc/miscutils/dc.c
+@@ -196,14 +196,6 @@ struct op {
+ };
+ 
+ static const struct op operators[] = {
+-	{"+",   add},
+-	{"add", add},
+-	{"-",   sub},
+-	{"sub", sub},
+-	{"*",   mul},
+-	{"mul", mul},
+-	{"/",   divide},
+-	{"div", divide},
+ #if ENABLE_FEATURE_DC_LIBM
+ 	{"**",  power},
+ 	{"exp", power},
+@@ -216,28 +208,47 @@ static const struct op operators[] = {
+ 	{"not", not},
+ 	{"eor", eor},
+ 	{"xor", eor},
++	{"+",   add},
++	{"add", add},
++	{"-",   sub},
++	{"sub", sub},
++	{"*",   mul},
++	{"mul", mul},
++	{"/",   divide},
++	{"div", divide},
+ 	{"p", print_no_pop},
+ 	{"f", print_stack_no_pop},
+ 	{"o", set_output_base},
+ };
+ 
++/* Feed the stack machine */
+ static void stack_machine(const char *argument)
+ {
+ 	char *end;
+-	double d;
++	double number;
+ 	const struct op *o;
+ 
+-	d = strtod(argument, &end);
+-	if (end != argument && *end == '\0') {
+-		push(d);
+-		return;
++ next:
++	number = strtod(argument, &end);
++	if (end != argument) {
++		argument = end;
++		push(number);
++		goto next;
+ 	}
+ 
++	/* We might have matched a digit, eventually advance the argument */
++	argument = skip_whitespace(argument);
++
++	if (*argument == '\0')
++		return;
++
+ 	o = operators;
+ 	do {
+-		if (strcmp(o->name, argument) == 0) {
++		const size_t name_len = strlen(o->name);
++		if (strncmp(o->name, argument, name_len) == 0) {
++			argument += name_len;
+ 			o->function();
+-			return;
++			goto next;
+ 		}
+ 		o++;
+ 	} while (o != operators + ARRAY_SIZE(operators));
+@@ -254,25 +265,11 @@ int dc_main(int argc UNUSED_PARAM, char
+ 	if (!argv[0]) {
+ 		/* take stuff from stdin if no args are given */
+ 		char *line;
+-		char *cursor;
+-		char *token;
+ 		while ((line = xmalloc_fgetline(stdin)) != NULL) {
+-			cursor = line;
+-			while (1) {
+-				token = skip_whitespace(cursor);
+-				if (*token == '\0')
+-					break;
+-				cursor = skip_non_whitespace(token);
+-				if (*cursor != '\0')
+-					*cursor++ = '\0';
+-				stack_machine(token);
+-			}
++			stack_machine(line);
+ 			free(line);
+ 		}
+ 	} else {
+-		// why? it breaks "dc -2 2 + p"
+-		//if (argv[0][0] == '-')
+-		//	bb_show_usage();
+ 		do {
+ 			stack_machine(*argv);
+ 		} while (*++argv);
+--- busybox-1.23.1/testsuite/dc.tests
++++ busybox-1.23.1-dc/testsuite/dc.tests
+@@ -0,0 +1,56 @@
++#!/bin/sh
++# Copyright 2015 by Bernhard Reutner-Fischer
++# Licensed under GPLv2 or later, see file LICENSE in this source tree.
++
++. ./testing.sh
++
++# testing "test name" "command" "expected result" "file input" "stdin"
++
++testing "dc basic syntax (stdin, multiple args)" \
++	"dc" \
++	"30\n" \
++	"" "10 20+p"
++
++testing "dc basic syntax (argv, single arg)" \
++	"dc '10 20+p'" \
++	"30\n" \
++	"" ""
++
++testing "dc basic syntax (argv, multiple args)" \
++	"dc 10 20+p" \
++	"30\n" \
++	"" ""
++
++testing "dc complex with spaces (single arg)" \
++	"dc '8 8 * 2 2 + / p'" \
++	"16\n" \
++	"" ""
++
++testing "dc complex without spaces (single arg)" \
++	"dc '8 8*2 2+/p'" \
++	"16\n" \
++	"" ""
++
++testing "dc complex with spaces (multiple args)" \
++	"dc 8 8 \* 2 2 + / p" \
++	"16\n" \
++	"" ""
++
++testing "dc complex without spaces (multiple args)" \
++	"dc 8 8\*2 2+/p" \
++	"16\n" \
++	"" ""
++
++exit $FAILCOUNT
++
++# we do not support arguments
++testing "dc -e <exprs>" \
++	"dc -e '10 2+f'" \
++	"12\n" \
++	"" ""
++
++testing "dc -f <exprs-from-given-file>" \
++	"dc -f input" \
++	"12\n" \
++	"10 2+f" ""
++
diff --git a/package/busybox/0004-wget.patch b/package/busybox/0004-wget.patch
new file mode 100644
index 0000000..e1ba51c
--- /dev/null
+++ b/package/busybox/0004-wget.patch
@@ -0,0 +1,185 @@
+Fix broken --header handling, see: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=744725
+From upstream: http://busybox.net/downloads/fixes-1.23.1/busybox-1.23.1-wget.patch
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- busybox-1.23.1/networking/wget.c
++++ busybox-1.23.1-wget/networking/wget.c
+@@ -38,8 +38,14 @@
+ 
+ #if 0
+ # define log_io(...) bb_error_msg(__VA_ARGS__)
++# define SENDFMT(fp, fmt, ...) \
++	do { \
++		log_io("> " fmt, ##__VA_ARGS__); \
++		fprintf(fp, fmt, ##__VA_ARGS__); \
++	} while (0);
+ #else
+ # define log_io(...) ((void)0)
++# define SENDFMT(fp, fmt, ...) fprintf(fp, fmt, ##__VA_ARGS__)
+ #endif
+ 
+ 
+@@ -55,6 +61,36 @@ static const char P_FTP[] = "ftp";
+ static const char P_HTTP[] = "http";
+ static const char P_HTTPS[] = "https";
+ 
++#if ENABLE_FEATURE_WGET_LONG_OPTIONS
++/* User-specified headers prevent using our corresponding built-in headers.  */
++enum {
++	HDR_HOST          = (1<<0),
++	HDR_USER_AGENT    = (1<<1),
++	HDR_RANGE         = (1<<2),
++	HDR_AUTH          = (1<<3) * ENABLE_FEATURE_WGET_AUTHENTICATION,
++	HDR_PROXY_AUTH    = (1<<4) * ENABLE_FEATURE_WGET_AUTHENTICATION,
++};
++static const char wget_user_headers[] ALIGN1 =
++	"Host:\0"
++	"User-Agent:\0"
++	"Range:\0"
++# if ENABLE_FEATURE_WGET_AUTHENTICATION
++	"Authorization:\0"
++	"Proxy-Authorization:\0"
++# endif
++	;
++# define USR_HEADER_HOST       (G.user_headers & HDR_HOST)
++# define USR_HEADER_USER_AGENT (G.user_headers & HDR_USER_AGENT)
++# define USR_HEADER_RANGE      (G.user_headers & HDR_RANGE)
++# define USR_HEADER_AUTH       (G.user_headers & HDR_AUTH)
++# define USR_HEADER_PROXY_AUTH (G.user_headers & HDR_PROXY_AUTH)
++#else /* No long options, no user-headers :( */
++# define USR_HEADER_HOST       0
++# define USR_HEADER_USER_AGENT 0
++# define USR_HEADER_RANGE      0
++# define USR_HEADER_AUTH       0
++# define USR_HEADER_PROXY_AUTH 0
++#endif
+ 
+ /* Globals */
+ struct globals {
+@@ -69,6 +105,7 @@ struct globals {
+ #if ENABLE_FEATURE_WGET_LONG_OPTIONS
+ 	char *post_data;
+ 	char *extra_headers;
++	unsigned char user_headers; /* Headers mentioned by the user */
+ #endif
+ 	char *fname_out;        /* where to direct output (-O) */
+ 	const char *proxy_flag; /* Use proxies if env vars are set */
+@@ -830,43 +867,46 @@ static void download_one_url(const char
+ #endif
+ 		/* Send HTTP request */
+ 		if (use_proxy) {
+-			fprintf(sfp, "GET %s://%s/%s HTTP/1.1\r\n",
++			SENDFMT(sfp, "GET %s://%s/%s HTTP/1.1\r\n",
+ 				target.protocol, target.host,
+ 				target.path);
+ 		} else {
+-			fprintf(sfp, "%s /%s HTTP/1.1\r\n",
++			SENDFMT(sfp, "%s /%s HTTP/1.1\r\n",
+ 				(option_mask32 & WGET_OPT_POST_DATA) ? "POST" : "GET",
+ 				target.path);
+ 		}
+-
+-		fprintf(sfp, "Host: %s\r\nUser-Agent: %s\r\n",
+-			target.host, G.user_agent);
++		if (!USR_HEADER_HOST)
++			SENDFMT(sfp, "Host: %s\r\n", target.host);
++		if (!USR_HEADER_USER_AGENT)
++			SENDFMT(sfp, "User-Agent: %s\r\n", G.user_agent);
+ 
+ 		/* Ask server to close the connection as soon as we are done
+ 		 * (IOW: we do not intend to send more requests)
+ 		 */
+-		fprintf(sfp, "Connection: close\r\n");
++		SENDFMT(sfp, "Connection: close\r\n");
+ 
+ #if ENABLE_FEATURE_WGET_AUTHENTICATION
+-		if (target.user) {
+-			fprintf(sfp, "Proxy-Authorization: Basic %s\r\n"+6,
++		if (target.user && !USR_HEADER_AUTH) {
++			SENDFMT(sfp, "Proxy-Authorization: Basic %s\r\n"+6,
+ 				base64enc(target.user));
+ 		}
+-		if (use_proxy && server.user) {
+-			fprintf(sfp, "Proxy-Authorization: Basic %s\r\n",
++		if (use_proxy && server.user && !USR_HEADER_PROXY_AUTH) {
++			SENDFMT(sfp, "Proxy-Authorization: Basic %s\r\n",
+ 				base64enc(server.user));
+ 		}
+ #endif
+ 
+-		if (G.beg_range != 0)
+-			fprintf(sfp, "Range: bytes=%"OFF_FMT"u-\r\n", G.beg_range);
++		if (G.beg_range != 0 && !USR_HEADER_RANGE)
++			SENDFMT(sfp, "Range: bytes=%"OFF_FMT"u-\r\n", G.beg_range);
+ 
+ #if ENABLE_FEATURE_WGET_LONG_OPTIONS
+-		if (G.extra_headers)
++		if (G.extra_headers) {
++			log_io(G.extra_headers);
+ 			fputs(G.extra_headers, sfp);
++		}
+ 
+ 		if (option_mask32 & WGET_OPT_POST_DATA) {
+-			fprintf(sfp,
++			SENDFMT(sfp,
+ 				"Content-Type: application/x-www-form-urlencoded\r\n"
+ 				"Content-Length: %u\r\n"
+ 				"\r\n"
+@@ -876,7 +916,7 @@ static void download_one_url(const char
+ 		} else
+ #endif
+ 		{
+-			fprintf(sfp, "\r\n");
++			SENDFMT(sfp, "\r\n");
+ 		}
+ 
+ 		fflush(sfp);
+@@ -1093,7 +1133,9 @@ int wget_main(int argc UNUSED_PARAM, cha
+ #if ENABLE_FEATURE_WGET_LONG_OPTIONS
+ 	applet_long_options = wget_longopts;
+ #endif
+-	opt_complementary = "-1" IF_FEATURE_WGET_TIMEOUT(":T+") IF_FEATURE_WGET_LONG_OPTIONS(":\xfe::");
++	opt_complementary = "-1"
++			IF_FEATURE_WGET_TIMEOUT(":T+")
++			IF_FEATURE_WGET_LONG_OPTIONS(":\xfe::");
+ 	getopt32(argv, "csqO:P:Y:U:T:" /*ignored:*/ "t:",
+ 		&G.fname_out, &G.dir_prefix,
+ 		&G.proxy_flag, &G.user_agent,
+@@ -1106,16 +1148,32 @@ int wget_main(int argc UNUSED_PARAM, cha
+ 
+ #if ENABLE_FEATURE_WGET_LONG_OPTIONS
+ 	if (headers_llist) {
+-		int size = 1;
+-		char *cp;
++		int size = 0;
++		char *hdr;
+ 		llist_t *ll = headers_llist;
+ 		while (ll) {
+ 			size += strlen(ll->data) + 2;
+ 			ll = ll->link;
+ 		}
+-		G.extra_headers = cp = xmalloc(size);
++		G.extra_headers = hdr = xmalloc(size + 1);
+ 		while (headers_llist) {
+-			cp += sprintf(cp, "%s\r\n", (char*)llist_pop(&headers_llist));
++			int bit;
++			const char *words;
++
++			size = sprintf(hdr, "%s\r\n",
++					(char*)llist_pop(&headers_llist));
++			/* a bit like index_in_substrings but don't match full key */
++			bit = 1;
++			words = wget_user_headers;
++			while (*words) {
++				if (strstr(hdr, words) == hdr) {
++					G.user_headers |= bit;
++					break;
++				}
++				bit <<= 1;
++				words += strlen(words) + 1;
++			}
++			hdr += size;
+ 		}
+ 	}
+ #endif
