From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 12 Jun 2009 14:39:23 +0200
Subject: [Buildroot] [git commit] busybox: additional 1.14.1 fixes
Message-ID: <20090615112814.03C527781C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b6b2e34705ddb17cdcff87ba1cc9a5a896c0c91
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox-1.14.1-httpd.patch    |  224 ++++++++-----------------
 package/busybox/busybox-1.14.1-readlink.patch |   88 ++++++++++
 2 files changed, 161 insertions(+), 151 deletions(-)
 create mode 100644 package/busybox/busybox-1.14.1-readlink.patch

diff --git a/package/busybox/busybox-1.14.1-httpd.patch b/package/busybox/busybox-1.14.1-httpd.patch
index ff53f0d..3395cf0 100644
--- a/package/busybox/busybox-1.14.1-httpd.patch
+++ b/package/busybox/busybox-1.14.1-httpd.patch
@@ -1,6 +1,71 @@
+diff -urpN busybox-1.14.1/include/libbb.h busybox-1.14.1-httpd/include/libbb.h
+--- busybox-1.14.1/include/libbb.h	2009-05-27 18:01:37.000000000 +0200
++++ busybox-1.14.1-httpd/include/libbb.h	2009-06-12 09:07:39.000000000 +0200
+@@ -1099,6 +1099,8 @@ const char *get_signame(int number) FAST
+ void print_signames(void) FAST_FUNC;
+ 
+ char *bb_simplify_path(const char *path) FAST_FUNC;
++/* Returns ptr to NUL */
++char *bb_simplify_abs_path_inplace(char *path) FAST_FUNC;
+ 
+ #define FAIL_DELAY 3
+ extern void bb_do_delay(int seconds) FAST_FUNC;
+diff -urpN busybox-1.14.1/libbb/simplify_path.c busybox-1.14.1-httpd/libbb/simplify_path.c
+--- busybox-1.14.1/libbb/simplify_path.c	2009-05-27 18:00:23.000000000 +0200
++++ busybox-1.14.1-httpd/libbb/simplify_path.c	2009-06-03 12:50:48.000000000 +0200
+@@ -6,22 +6,13 @@
+  *
+  * Licensed under GPLv2 or later, see file LICENSE in this tarball for details.
+  */
+-
+ #include "libbb.h"
+ 
+-char* FAST_FUNC bb_simplify_path(const char *path)
++char* FAST_FUNC bb_simplify_abs_path_inplace(char *start)
+ {
+-	char *s, *start, *p;
++	char *s, *p;
+ 
+-	if (path[0] == '/')
+-		start = xstrdup(path);
+-	else {
+-		s = xrealloc_getcwd_or_warn(NULL);
+-		start = concat_path_file(s, path);
+-		free(s);
+-	}
+ 	p = s = start;
+-
+ 	do {
+ 		if (*p == '/') {
+ 			if (*s == '/') {	/* skip duplicate (or initial) slash */
+@@ -47,7 +38,22 @@ char* FAST_FUNC bb_simplify_path(const c
+ 	if ((p == start) || (*p != '/')) {	/* not a trailing slash */
+ 		++p;					/* so keep last character */
+ 	}
+-	*p = 0;
++	*p = '\0';
++	return p;
++}
++
++char* FAST_FUNC bb_simplify_path(const char *path)
++{
++	char *s, *p;
++
++	if (path[0] == '/')
++		s = xstrdup(path);
++	else {
++		p = xrealloc_getcwd_or_warn(NULL);
++		s = concat_path_file(p, path);
++		free(p);
++	}
+ 
+-	return start;
++	bb_simplify_abs_path_inplace(s);
++	return s;
+ }
 diff -urpN busybox-1.14.1/networking/httpd.c busybox-1.14.1-httpd/networking/httpd.c
 --- busybox-1.14.1/networking/httpd.c	2009-05-27 18:00:23.000000000 +0200
-+++ busybox-1.14.1-httpd/networking/httpd.c	2009-06-09 20:40:57.000000000 +0200
++++ busybox-1.14.1-httpd/networking/httpd.c	2009-06-12 08:53:46.000000000 +0200
 @@ -32,7 +32,7 @@
   *  foo=`httpd -d $foo`           # decode "Hello%20World" as "Hello World"
   *  bar=`httpd -e "<Hello World>"`  # encode as "&#60Hello&#32World&#62"
@@ -54,27 +119,6 @@ diff -urpN busybox-1.14.1/networking/httpd.c busybox-1.14.1-httpd/networking/htt
  	const char *home_httpd;
  	const char *index_page;
  
-@@ -250,13 +250,13 @@ struct globals {
- 	const char *found_moved_temporarily;
- 	Htaccess_IP *ip_a_d;    /* config allow/deny lines */
- 
--	USE_FEATURE_HTTPD_BASIC_AUTH(const char *g_realm;)
--	USE_FEATURE_HTTPD_BASIC_AUTH(char *remoteuser;)
--	USE_FEATURE_HTTPD_CGI(char *referer;)
--	USE_FEATURE_HTTPD_CGI(char *user_agent;)
--	USE_FEATURE_HTTPD_CGI(char *host;)
--	USE_FEATURE_HTTPD_CGI(char *http_accept;)
--	USE_FEATURE_HTTPD_CGI(char *http_accept_language;)
-+	IF_FEATURE_HTTPD_BASIC_AUTH(const char *g_realm;)
-+	IF_FEATURE_HTTPD_BASIC_AUTH(char *remoteuser;)
-+	IF_FEATURE_HTTPD_CGI(char *referer;)
-+	IF_FEATURE_HTTPD_CGI(char *user_agent;)
-+	IF_FEATURE_HTTPD_CGI(char *host;)
-+	IF_FEATURE_HTTPD_CGI(char *http_accept;)
-+	IF_FEATURE_HTTPD_CGI(char *http_accept_language;)
- 
- 	off_t file_size;        /* -1 - unknown */
- #if ENABLE_FEATURE_HTTPD_RANGES
 @@ -289,7 +289,7 @@ struct globals {
  #define rmt_ip            (G.rmt_ip           )
  #define bind_addr_or_port (G.bind_addr_or_port)
@@ -84,15 +128,6 @@ diff -urpN busybox-1.14.1/networking/httpd.c busybox-1.14.1-httpd/networking/htt
  #define home_httpd        (G.home_httpd       )
  #define index_page        (G.index_page       )
  #define found_mime_type   (G.found_mime_type  )
-@@ -326,7 +326,7 @@ enum {
- #define proxy             (G.proxy            )
- #define INIT_G() do { \
- 	SET_PTR_TO_GLOBALS(xzalloc(sizeof(G))); \
--	USE_FEATURE_HTTPD_BASIC_AUTH(g_realm = "Web Server Authentication";) \
-+	IF_FEATURE_HTTPD_BASIC_AUTH(g_realm = "Web Server Authentication";) \
- 	bind_addr_or_port = "80"; \
- 	index_page = "index.html"; \
- 	file_size = -1; \
 @@ -452,14 +452,6 @@ static int scan_ip_mask(const char *str,
  /*
   * Parse configuration file into in-memory linked list.
@@ -571,58 +606,6 @@ diff -urpN busybox-1.14.1/networking/httpd.c busybox-1.14.1-httpd/networking/htt
  #if ENABLE_FEATURE_HTTPD_RANGES
  	if (what == SEND_BODY)
  		range_start = 0; /* err pages and ranges don't mix */
-@@ -1587,14 +1599,14 @@ static NOINLINE void send_file_and_exit(
- 		while (1) {
- 			/* sz is rounded down to 64k */
- 			ssize_t sz = MAXINT(ssize_t) - 0xffff;
--			USE_FEATURE_HTTPD_RANGES(if (sz > range_len) sz = range_len;)
-+			IF_FEATURE_HTTPD_RANGES(if (sz > range_len) sz = range_len;)
- 			count = sendfile(STDOUT_FILENO, fd, &offset, sz);
- 			if (count < 0) {
- 				if (offset == range_start)
- 					break; /* fall back to read/write loop */
- 				goto fin;
- 			}
--			USE_FEATURE_HTTPD_RANGES(range_len -= sz;)
-+			IF_FEATURE_HTTPD_RANGES(range_len -= sz;)
- 			if (count == 0 || range_len == 0)
- 				log_and_exit();
- 		}
-@@ -1602,16 +1614,16 @@ static NOINLINE void send_file_and_exit(
- #endif
- 	while ((count = safe_read(fd, iobuf, IOBUF_SIZE)) > 0) {
- 		ssize_t n;
--		USE_FEATURE_HTTPD_RANGES(if (count > range_len) count = range_len;)
-+		IF_FEATURE_HTTPD_RANGES(if (count > range_len) count = range_len;)
- 		n = full_write(STDOUT_FILENO, iobuf, count);
- 		if (count != n)
- 			break;
--		USE_FEATURE_HTTPD_RANGES(range_len -= count;)
-+		IF_FEATURE_HTTPD_RANGES(range_len -= count;)
- 		if (range_len == 0)
- 			break;
- 	}
- 	if (count < 0) {
-- USE_FEATURE_HTTPD_USE_SENDFILE(fin:)
-+ IF_FEATURE_HTTPD_USE_SENDFILE(fin:)
- 		if (verbose > 1)
- 			bb_perror_msg("error");
- 	}
-@@ -1839,12 +1851,12 @@ static void handle_incoming_and_exit(con
- 
- 	/* Find end of URL and parse HTTP version, if any */
- 	http_major_version = '0';
--	USE_FEATURE_HTTPD_PROXY(http_minor_version = '0';)
-+	IF_FEATURE_HTTPD_PROXY(http_minor_version = '0';)
- 	tptr = strchrnul(urlp, ' ');
- 	/* Is it " HTTP/"? */
- 	if (tptr[0] && strncmp(tptr + 1, HTTP_200, 5) == 0) {
- 		http_major_version = tptr[6];
--		USE_FEATURE_HTTPD_PROXY(http_minor_version = tptr[8];)
-+		IF_FEATURE_HTTPD_PROXY(http_minor_version = tptr[8];)
- 	}
- 	*tptr = '\0';
- 
 @@ -2031,8 +2043,8 @@ static void handle_incoming_and_exit(con
  	/* We are done reading headers, disable peer timeout */
  	alarm(0);
@@ -643,7 +626,7 @@ diff -urpN busybox-1.14.1/networking/httpd.c busybox-1.14.1-httpd/networking/htt
  		cgi_io_loop_and_exit(proxy_fd, dup(proxy_fd), length);
  	}
  #endif
-@@ -2245,17 +2257,17 @@ static void mini_httpd_inetd(void)
+@@ -2245,7 +2257,7 @@ static void mini_httpd_inetd(void)
  
  static void sighup_handler(int sig UNUSED_PARAM)
  {
@@ -652,76 +635,15 @@ diff -urpN busybox-1.14.1/networking/httpd.c busybox-1.14.1-httpd/networking/htt
  }
  
  enum {
- 	c_opt_config_file = 0,
- 	d_opt_decode_url,
- 	h_opt_home_httpd,
--	USE_FEATURE_HTTPD_ENCODE_URL_STR(e_opt_encode_url,)
--	USE_FEATURE_HTTPD_BASIC_AUTH(    r_opt_realm     ,)
--	USE_FEATURE_HTTPD_AUTH_MD5(      m_opt_md5       ,)
--	USE_FEATURE_HTTPD_SETUID(        u_opt_setuid    ,)
-+	IF_FEATURE_HTTPD_ENCODE_URL_STR(e_opt_encode_url,)
-+	IF_FEATURE_HTTPD_BASIC_AUTH(    r_opt_realm     ,)
-+	IF_FEATURE_HTTPD_AUTH_MD5(      m_opt_md5       ,)
-+	IF_FEATURE_HTTPD_SETUID(        u_opt_setuid    ,)
- 	p_opt_port      ,
- 	p_opt_inetd     ,
- 	p_opt_foreground,
-@@ -2263,10 +2275,10 @@ enum {
- 	OPT_CONFIG_FILE = 1 << c_opt_config_file,
- 	OPT_DECODE_URL  = 1 << d_opt_decode_url,
- 	OPT_HOME_HTTPD  = 1 << h_opt_home_httpd,
--	OPT_ENCODE_URL  = USE_FEATURE_HTTPD_ENCODE_URL_STR((1 << e_opt_encode_url)) + 0,
--	OPT_REALM       = USE_FEATURE_HTTPD_BASIC_AUTH(    (1 << r_opt_realm     )) + 0,
--	OPT_MD5         = USE_FEATURE_HTTPD_AUTH_MD5(      (1 << m_opt_md5       )) + 0,
--	OPT_SETUID      = USE_FEATURE_HTTPD_SETUID(        (1 << u_opt_setuid    )) + 0,
-+	OPT_ENCODE_URL  = IF_FEATURE_HTTPD_ENCODE_URL_STR((1 << e_opt_encode_url)) + 0,
-+	OPT_REALM       = IF_FEATURE_HTTPD_BASIC_AUTH(    (1 << r_opt_realm     )) + 0,
-+	OPT_MD5         = IF_FEATURE_HTTPD_AUTH_MD5(      (1 << m_opt_md5       )) + 0,
-+	OPT_SETUID      = IF_FEATURE_HTTPD_SETUID(        (1 << u_opt_setuid    )) + 0,
- 	OPT_PORT        = 1 << p_opt_port,
- 	OPT_INETD       = 1 << p_opt_inetd,
- 	OPT_FOREGROUND  = 1 << p_opt_foreground,
-@@ -2280,10 +2292,10 @@ int httpd_main(int argc UNUSED_PARAM, ch
- 	int server_socket = server_socket; /* for gcc */
- 	unsigned opt;
- 	char *url_for_decode;
--	USE_FEATURE_HTTPD_ENCODE_URL_STR(const char *url_for_encode;)
--	USE_FEATURE_HTTPD_SETUID(const char *s_ugid = NULL;)
--	USE_FEATURE_HTTPD_SETUID(struct bb_uidgid_t ugid;)
--	USE_FEATURE_HTTPD_AUTH_MD5(const char *pass;)
-+	IF_FEATURE_HTTPD_ENCODE_URL_STR(const char *url_for_encode;)
-+	IF_FEATURE_HTTPD_SETUID(const char *s_ugid = NULL;)
-+	IF_FEATURE_HTTPD_SETUID(struct bb_uidgid_t ugid;)
-+	IF_FEATURE_HTTPD_AUTH_MD5(const char *pass;)
- 
- 	INIT_G();
- 
-@@ -2299,16 +2311,16 @@ int httpd_main(int argc UNUSED_PARAM, ch
- 	 * If user gives relative path in -h,
- 	 * $SCRIPT_FILENAME will not be set. */
- 	opt = getopt32(argv, "c:d:h:"
--			USE_FEATURE_HTTPD_ENCODE_URL_STR("e:")
--			USE_FEATURE_HTTPD_BASIC_AUTH("r:")
--			USE_FEATURE_HTTPD_AUTH_MD5("m:")
--			USE_FEATURE_HTTPD_SETUID("u:")
-+			IF_FEATURE_HTTPD_ENCODE_URL_STR("e:")
-+			IF_FEATURE_HTTPD_BASIC_AUTH("r:")
-+			IF_FEATURE_HTTPD_AUTH_MD5("m:")
-+			IF_FEATURE_HTTPD_SETUID("u:")
+@@ -2304,7 +2316,7 @@ int httpd_main(int argc UNUSED_PARAM, ch
+ 			USE_FEATURE_HTTPD_AUTH_MD5("m:")
+ 			USE_FEATURE_HTTPD_SETUID("u:")
  			"p:ifv",
 -			&configFile, &url_for_decode, &home_httpd
--			USE_FEATURE_HTTPD_ENCODE_URL_STR(, &url_for_encode)
--			USE_FEATURE_HTTPD_BASIC_AUTH(, &g_realm)
--			USE_FEATURE_HTTPD_AUTH_MD5(, &pass)
--			USE_FEATURE_HTTPD_SETUID(, &s_ugid)
 +			&opt_c_configFile, &url_for_decode, &home_httpd
-+			IF_FEATURE_HTTPD_ENCODE_URL_STR(, &url_for_encode)
-+			IF_FEATURE_HTTPD_BASIC_AUTH(, &g_realm)
-+			IF_FEATURE_HTTPD_AUTH_MD5(, &pass)
-+			IF_FEATURE_HTTPD_SETUID(, &s_ugid)
- 			, &bind_addr_or_port
- 			, &verbose
- 		);
+ 			USE_FEATURE_HTTPD_ENCODE_URL_STR(, &url_for_encode)
+ 			USE_FEATURE_HTTPD_BASIC_AUTH(, &g_realm)
+ 			USE_FEATURE_HTTPD_AUTH_MD5(, &pass)
 @@ -2375,7 +2387,7 @@ int httpd_main(int argc UNUSED_PARAM, ch
  	}
  #endif
diff --git a/package/busybox/busybox-1.14.1-readlink.patch b/package/busybox/busybox-1.14.1-readlink.patch
new file mode 100644
index 0000000..2e9da7e
--- /dev/null
+++ b/package/busybox/busybox-1.14.1-readlink.patch
@@ -0,0 +1,88 @@
+diff -urpN busybox-1.14.1/coreutils/readlink.c busybox-1.14.1-readlink/coreutils/readlink.c
+--- busybox-1.14.1/coreutils/readlink.c	2009-05-27 18:00:23.000000000 +0200
++++ busybox-1.14.1-readlink/coreutils/readlink.c	2009-06-12 13:18:13.000000000 +0200
+@@ -6,9 +6,31 @@
+  *
+  * Licensed under GPL v2 or later, see file LICENSE in this tarball for details.
+  */
+-
+ #include "libbb.h"
+ 
++/*
++ * # readlink --version
++ * readlink (GNU coreutils) 6.10
++ * # readlink --help
++ *   -f, --canonicalize
++ *      canonicalize by following every symlink in
++ *      every component of the given name recursively;
++ *      all but the last component must exist
++ *   -e, --canonicalize-existing
++ *      canonicalize by following every symlink in
++ *      every component of the given name recursively,
++ *      all components must exist
++ *   -m, --canonicalize-missing
++ *      canonicalize by following every symlink in
++ *      every component of the given name recursively,
++ *      without requirements on components existence
++ *   -n, --no-newline              do not output the trailing newline
++ *   -q, --quiet, -s, --silent     suppress most error messages
++ *   -v, --verbose                 report error messages
++ *
++ * bbox supports: -f -n -v (fully), -q -s (accepts but ignores)
++ */
++
+ int readlink_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
+ int readlink_main(int argc UNUSED_PARAM, char **argv)
+ {
+@@ -20,7 +42,7 @@ int readlink_main(int argc UNUSED_PARAM,
+ 		unsigned opt;
+ 		/* We need exactly one non-option argument.  */
+ 		opt_complementary = "=1";
+-		opt = getopt32(argv, "f");
++		opt = getopt32(argv, "fnvsq");
+ 		fname = argv[optind];
+ 	)
+ 	SKIP_FEATURE_READLINK_FOLLOW(
+@@ -30,9 +52,10 @@ int readlink_main(int argc UNUSED_PARAM,
+ 	)
+ 
+ 	/* compat: coreutils readlink reports errors silently via exit code */
+-	logmode = LOGMODE_NONE;
++	if (!(opt & 4)) /* not -v */
++		logmode = LOGMODE_NONE;
+ 
+-	if (opt) {
++	if (opt & 1) { /* -f */
+ 		buf = realpath(fname, pathbuf);
+ 	} else {
+ 		buf = xmalloc_readlink_or_warn(fname);
+@@ -40,7 +63,7 @@ int readlink_main(int argc UNUSED_PARAM,
+ 
+ 	if (!buf)
+ 		return EXIT_FAILURE;
+-	puts(buf);
++	printf((opt & 2) ? "%s" : "%s\n", buf);
+ 
+ 	if (ENABLE_FEATURE_CLEAN_UP && !opt)
+ 		free(buf);
+diff -urpN busybox-1.14.1/include/usage.h busybox-1.14.1-readlink/include/usage.h
+--- busybox-1.14.1/include/usage.h	2009-05-27 18:00:23.000000000 +0200
++++ busybox-1.14.1-readlink/include/usage.h	2009-06-12 13:18:13.000000000 +0200
+@@ -3404,12 +3404,15 @@
+        "files do not block on disk I/O"
+ 
+ #define readlink_trivial_usage \
+-	USE_FEATURE_READLINK_FOLLOW("[-f] ") "FILE"
++	USE_FEATURE_READLINK_FOLLOW("[-fnv] ") "FILE"
+ #define readlink_full_usage "\n\n" \
+        "Display the value of a symlink" \
+ 	USE_FEATURE_READLINK_FOLLOW( "\n" \
+      "\nOptions:" \
+-     "\n	-f	Canonicalize by following all symlinks") \
++     "\n	-f	Canonicalize by following all symlinks" \
++     "\n	-n	Don't add newline" \
++     "\n	-v	Verbose" \
++	) \
+ 
+ #define readprofile_trivial_usage \
+        "[OPTIONS]..."
-- 
1.6.0.6
