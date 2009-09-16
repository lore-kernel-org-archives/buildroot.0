From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 16 Sep 2009 08:51:20 +0200
Subject: [Buildroot] [git commit master] busybox: bump 1.14.x version
Message-ID: <20090916065153.3C1BF7779F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b3ee84e4072279fda52c18fb7b3aa76a6b873c2d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/Config.in                          |    2 +-
 package/busybox/busybox-1.14.3-httpd.patch         |   61 --------------------
 package/busybox/busybox-1.14.3-modprobe.patch      |   11 ----
 .../busybox-1.14.3-trylink-gc-sections.patch       |   15 -----
 4 files changed, 1 insertions(+), 88 deletions(-)
 delete mode 100644 package/busybox/busybox-1.14.3-httpd.patch
 delete mode 100644 package/busybox/busybox-1.14.3-modprobe.patch
 delete mode 100644 package/busybox/busybox-1.14.3-trylink-gc-sections.patch

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 378f2c1..132e271 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -40,7 +40,7 @@ config BR2_BUSYBOX_VERSION
 	string
 	default "1.12.4"	if BR2_BUSYBOX_VERSION_1_12_X
 	default "1.13.4"	if BR2_BUSYBOX_VERSION_1_13_X
-	default "1.14.3"	if BR2_BUSYBOX_VERSION_1_14_X
+	default "1.14.4"	if BR2_BUSYBOX_VERSION_1_14_X
 	default "1.15.1"	if BR2_BUSYBOX_VERSION_1_15_X
 
 config BR2_PACKAGE_BUSYBOX_FULLINSTALL
diff --git a/package/busybox/busybox-1.14.3-httpd.patch b/package/busybox/busybox-1.14.3-httpd.patch
deleted file mode 100644
index 1ba1207..0000000
--- a/package/busybox/busybox-1.14.3-httpd.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-diff -urpN busybox-1.14.3/networking/httpd.c busybox-1.14.3-httpd/networking/httpd.c
---- busybox-1.14.3/networking/httpd.c	2009-08-02 20:16:36.000000000 +0200
-+++ busybox-1.14.3-httpd/networking/httpd.c	2009-09-09 01:54:40.000000000 +0200
-@@ -2101,8 +2101,12 @@ static void handle_incoming_and_exit(con
- 		}
- 		send_cgi_and_exit(urlcopy, prequest, length, cookie, content_type);
- 	}
-+#endif
-+
-+	if (urlp[-1] == '/')
-+		strcpy(urlp, index_page);
-+	if (stat(tptr, &sb) == 0) {
- #if ENABLE_FEATURE_HTTPD_CONFIG_WITH_SCRIPT_INTERPR
--	{
- 		char *suffix = strrchr(tptr, '.');
- 		if (suffix) {
- 			Htaccess *cur;
-@@ -2112,16 +2116,7 @@ static void handle_incoming_and_exit(con
- 				}
- 			}
- 		}
--	}
- #endif
--	if (prequest != request_GET && prequest != request_HEAD) {
--		send_headers_and_exit(HTTP_NOT_IMPLEMENTED);
--	}
--#endif  /* FEATURE_HTTPD_CGI */
--
--	if (urlp[-1] == '/')
--		strcpy(urlp, index_page);
--	if (stat(tptr, &sb) == 0) {
- 		file_size = sb.st_size;
- 		last_mod = sb.st_mtime;
- 	}
-@@ -2135,19 +2130,18 @@ static void handle_incoming_and_exit(con
- 			send_cgi_and_exit("/cgi-bin/index.cgi", prequest, length, cookie, content_type);
- 		}
- 	}
--#endif
--	/* else {
--	 *	fall through to send_file, it errors out if open fails
--	 * }
--	 */
-+	/* else fall through to send_file, it errors out if open fails: */
- 
-+	if (prequest != request_GET && prequest != request_HEAD) {
-+		/* POST for files does not make sense */
-+		send_headers_and_exit(HTTP_NOT_IMPLEMENTED);
-+	}
- 	send_file_and_exit(tptr,
--#if ENABLE_FEATURE_HTTPD_CGI
- 		(prequest != request_HEAD ? SEND_HEADERS_AND_BODY : SEND_HEADERS)
-+	);
- #else
--		SEND_HEADERS_AND_BODY
-+	send_file_and_exit(tptr, SEND_HEADERS_AND_BODY);
- #endif
--	);
- }
- 
- /*
diff --git a/package/busybox/busybox-1.14.3-modprobe.patch b/package/busybox/busybox-1.14.3-modprobe.patch
deleted file mode 100644
index 24f04d3..0000000
--- a/package/busybox/busybox-1.14.3-modprobe.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-diff -urpN busybox-1.14.3/modutils/modprobe-small.c busybox-1.14.3-modprobe/modutils/modprobe-small.c
---- busybox-1.14.3/modutils/modprobe-small.c	2009-08-02 20:16:36.000000000 +0200
-+++ busybox-1.14.3-modprobe/modutils/modprobe-small.c	2009-09-09 01:55:27.000000000 +0200
-@@ -218,6 +218,7 @@ static void parse_module(module_info *in
- 	bksp(); /* remove last ' ' */
- 	appendc('\0');
- 	info->aliases = copy_stringbuf();
-+	replace(info->aliases, '-', '_');
- 
- 	/* "dependency1 depandency2" */
- 	reset_stringbuf();
diff --git a/package/busybox/busybox-1.14.3-trylink-gc-sections.patch b/package/busybox/busybox-1.14.3-trylink-gc-sections.patch
deleted file mode 100644
index 52a7aef..0000000
--- a/package/busybox/busybox-1.14.3-trylink-gc-sections.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-diff -urpN busybox-1.14.3/scripts/trylink busybox-1.14.3-trylink-gc-sections/scripts/trylink
---- busybox-1.14.3/scripts/trylink	2009-08-02 20:16:36.000000000 +0200
-+++ busybox-1.14.3-trylink-gc-sections/scripts/trylink	2009-09-09 01:53:45.000000000 +0200
-@@ -99,6 +99,11 @@ else
- fi
- )`
- 
-+# The --gc-sections option is not supported by older versions of ld
-+if test -n "$GC_SECTIONS"; then
-+    GC_SECTIONS=`check_cc "$GC_SECTIONS" ""`
-+fi
-+
- # Sanitize lib list (dups, extra spaces etc)
- LDLIBS=`echo "$LDLIBS" | xargs -n1 | sort | uniq | xargs`
- 
-- 
1.6.3.3
