From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 10 Sep 2009 10:51:38 +0200
Subject: [Buildroot] [git commit master] busybox: 1.14.3 fixes
Message-ID: <20090910085344.4C91E77590@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f39dbdea735743d6d8f3a9cac67a9c3c6a537826
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox-1.14.3-httpd.patch         |   61 ++++++++++++++++++++
 package/busybox/busybox-1.14.3-modprobe.patch      |   11 ++++
 .../busybox-1.14.3-trylink-gc-sections.patch       |   15 +++++
 3 files changed, 87 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.14.3-httpd.patch
 create mode 100644 package/busybox/busybox-1.14.3-modprobe.patch
 create mode 100644 package/busybox/busybox-1.14.3-trylink-gc-sections.patch

diff --git a/package/busybox/busybox-1.14.3-httpd.patch b/package/busybox/busybox-1.14.3-httpd.patch
new file mode 100644
index 0000000..1ba1207
--- /dev/null
+++ b/package/busybox/busybox-1.14.3-httpd.patch
@@ -0,0 +1,61 @@
+diff -urpN busybox-1.14.3/networking/httpd.c busybox-1.14.3-httpd/networking/httpd.c
+--- busybox-1.14.3/networking/httpd.c	2009-08-02 20:16:36.000000000 +0200
++++ busybox-1.14.3-httpd/networking/httpd.c	2009-09-09 01:54:40.000000000 +0200
+@@ -2101,8 +2101,12 @@ static void handle_incoming_and_exit(con
+ 		}
+ 		send_cgi_and_exit(urlcopy, prequest, length, cookie, content_type);
+ 	}
++#endif
++
++	if (urlp[-1] == '/')
++		strcpy(urlp, index_page);
++	if (stat(tptr, &sb) == 0) {
+ #if ENABLE_FEATURE_HTTPD_CONFIG_WITH_SCRIPT_INTERPR
+-	{
+ 		char *suffix = strrchr(tptr, '.');
+ 		if (suffix) {
+ 			Htaccess *cur;
+@@ -2112,16 +2116,7 @@ static void handle_incoming_and_exit(con
+ 				}
+ 			}
+ 		}
+-	}
+ #endif
+-	if (prequest != request_GET && prequest != request_HEAD) {
+-		send_headers_and_exit(HTTP_NOT_IMPLEMENTED);
+-	}
+-#endif  /* FEATURE_HTTPD_CGI */
+-
+-	if (urlp[-1] == '/')
+-		strcpy(urlp, index_page);
+-	if (stat(tptr, &sb) == 0) {
+ 		file_size = sb.st_size;
+ 		last_mod = sb.st_mtime;
+ 	}
+@@ -2135,19 +2130,18 @@ static void handle_incoming_and_exit(con
+ 			send_cgi_and_exit("/cgi-bin/index.cgi", prequest, length, cookie, content_type);
+ 		}
+ 	}
+-#endif
+-	/* else {
+-	 *	fall through to send_file, it errors out if open fails
+-	 * }
+-	 */
++	/* else fall through to send_file, it errors out if open fails: */
+ 
++	if (prequest != request_GET && prequest != request_HEAD) {
++		/* POST for files does not make sense */
++		send_headers_and_exit(HTTP_NOT_IMPLEMENTED);
++	}
+ 	send_file_and_exit(tptr,
+-#if ENABLE_FEATURE_HTTPD_CGI
+ 		(prequest != request_HEAD ? SEND_HEADERS_AND_BODY : SEND_HEADERS)
++	);
+ #else
+-		SEND_HEADERS_AND_BODY
++	send_file_and_exit(tptr, SEND_HEADERS_AND_BODY);
+ #endif
+-	);
+ }
+ 
+ /*
diff --git a/package/busybox/busybox-1.14.3-modprobe.patch b/package/busybox/busybox-1.14.3-modprobe.patch
new file mode 100644
index 0000000..24f04d3
--- /dev/null
+++ b/package/busybox/busybox-1.14.3-modprobe.patch
@@ -0,0 +1,11 @@
+diff -urpN busybox-1.14.3/modutils/modprobe-small.c busybox-1.14.3-modprobe/modutils/modprobe-small.c
+--- busybox-1.14.3/modutils/modprobe-small.c	2009-08-02 20:16:36.000000000 +0200
++++ busybox-1.14.3-modprobe/modutils/modprobe-small.c	2009-09-09 01:55:27.000000000 +0200
+@@ -218,6 +218,7 @@ static void parse_module(module_info *in
+ 	bksp(); /* remove last ' ' */
+ 	appendc('\0');
+ 	info->aliases = copy_stringbuf();
++	replace(info->aliases, '-', '_');
+ 
+ 	/* "dependency1 depandency2" */
+ 	reset_stringbuf();
diff --git a/package/busybox/busybox-1.14.3-trylink-gc-sections.patch b/package/busybox/busybox-1.14.3-trylink-gc-sections.patch
new file mode 100644
index 0000000..52a7aef
--- /dev/null
+++ b/package/busybox/busybox-1.14.3-trylink-gc-sections.patch
@@ -0,0 +1,15 @@
+diff -urpN busybox-1.14.3/scripts/trylink busybox-1.14.3-trylink-gc-sections/scripts/trylink
+--- busybox-1.14.3/scripts/trylink	2009-08-02 20:16:36.000000000 +0200
++++ busybox-1.14.3-trylink-gc-sections/scripts/trylink	2009-09-09 01:53:45.000000000 +0200
+@@ -99,6 +99,11 @@ else
+ fi
+ )`
+ 
++# The --gc-sections option is not supported by older versions of ld
++if test -n "$GC_SECTIONS"; then
++    GC_SECTIONS=`check_cc "$GC_SECTIONS" ""`
++fi
++
+ # Sanitize lib list (dups, extra spaces etc)
+ LDLIBS=`echo "$LDLIBS" | xargs -n1 | sort | uniq | xargs`
+ 
-- 
1.6.3.3
