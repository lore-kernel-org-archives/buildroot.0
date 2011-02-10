From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 Feb 2011 20:15:53 +0100
Subject: [Buildroot] [git commit master 1/1] busybox 1.18.3: add wget and
	build system patches
Message-ID: <20110210202907.83B0F8F43E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=85a9a4d01ef26343c2266cefc2d8a635caff7362
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.18.3/busybox-1.18.3-buildsys.patch   |   10 +++
 .../busybox-1.18.3/busybox-1.18.3-wget.patch       |   69 ++++++++++++++++++++
 2 files changed, 79 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.18.3/busybox-1.18.3-buildsys.patch
 create mode 100644 package/busybox/busybox-1.18.3/busybox-1.18.3-wget.patch

diff --git a/package/busybox/busybox-1.18.3/busybox-1.18.3-buildsys.patch b/package/busybox/busybox-1.18.3/busybox-1.18.3-buildsys.patch
new file mode 100644
index 0000000..330b73f
--- /dev/null
+++ b/package/busybox/busybox-1.18.3/busybox-1.18.3-buildsys.patch
@@ -0,0 +1,10 @@
+--- busybox-1.18.3/Config.in
++++ busybox-1.18.3-buildsys/Config.in
+@@ -126,7 +126,6 @@ config FEATURE_INSTALLER
+ config INSTALL_NO_USR
+ 	bool "Don't use /usr"
+ 	default n
+-	depends on FEATURE_INSTALLER
+ 	help
+ 	  Disable use of /usr. busybox --install and "make install"
+ 	  will install applets only to /bin and /sbin,
diff --git a/package/busybox/busybox-1.18.3/busybox-1.18.3-wget.patch b/package/busybox/busybox-1.18.3/busybox-1.18.3-wget.patch
new file mode 100644
index 0000000..c7ea736
--- /dev/null
+++ b/package/busybox/busybox-1.18.3/busybox-1.18.3-wget.patch
@@ -0,0 +1,69 @@
+--- busybox-1.18.3/networking/wget.c
++++ busybox-1.18.3-wget/networking/wget.c
+@@ -446,7 +446,7 @@ static FILE* prepare_ftp_session(FILE **
+ 
+ static void NOINLINE retrieve_file_data(FILE *dfp, int output_fd)
+ {
+-	char buf[512];
++	char buf[4*1024]; /* made bigger to speed up local xfers */
+ #if ENABLE_FEATURE_WGET_STATUSBAR || ENABLE_FEATURE_WGET_TIMEOUT
+ # if ENABLE_FEATURE_WGET_TIMEOUT
+ 	unsigned second_cnt;
+@@ -506,8 +506,11 @@ static void NOINLINE retrieve_file_data(
+ 			G.transferred += n;
+ 			progress_meter(PROGRESS_BUMP);
+ #endif
+-			if (G.got_clen)
++			if (G.got_clen) {
+ 				G.content_len -= n;
++				if (G.content_len == 0)
++					break;
++			}
+ 		}
+ 
+ 		if (!G.chunked)
+@@ -706,6 +709,11 @@ int wget_main(int argc UNUSED_PARAM, cha
+ 		fprintf(sfp, "Host: %s\r\nUser-Agent: %s\r\n",
+ 			target.host, user_agent);
+ 
++		/* Ask server to close the connection as soon as we are done
++		 * (IOW: we do not intend to send more requests)
++		 */
++		fprintf(sfp, "Connection: close\r\n");
++
+ #if ENABLE_FEATURE_WGET_AUTHENTICATION
+ 		if (target.user) {
+ 			fprintf(sfp, "Proxy-Authorization: Basic %s\r\n"+6,
+@@ -719,22 +727,25 @@ int wget_main(int argc UNUSED_PARAM, cha
+ 
+ 		if (G.beg_range)
+ 			fprintf(sfp, "Range: bytes=%"OFF_FMT"u-\r\n", G.beg_range);
++
+ #if ENABLE_FEATURE_WGET_LONG_OPTIONS
+ 		if (extra_headers)
+ 			fputs(extra_headers, sfp);
+ 
+ 		if (opt & WGET_OPT_POST_DATA) {
+ 			char *estr = URL_escape(post_data);
+-			fprintf(sfp, "Content-Type: application/x-www-form-urlencoded\r\n");
+-			fprintf(sfp, "Content-Length: %u\r\n" "\r\n" "%s",
+-					(int) strlen(estr), estr);
+-			/*fprintf(sfp, "Connection: Keep-Alive\r\n\r\n");*/
+-			/*fprintf(sfp, "%s\r\n", estr);*/
++			fprintf(sfp,
++				"Content-Type: application/x-www-form-urlencoded\r\n"
++				"Content-Length: %u\r\n"
++				"\r\n"
++				"%s",
++				(int) strlen(estr), estr
++			);
+ 			free(estr);
+ 		} else
+ #endif
+-		{ /* If "Connection:" is needed, document why */
+-			fprintf(sfp, /* "Connection: close\r\n" */ "\r\n");
++		{
++			fprintf(sfp, "\r\n");
+ 		}
+ 
+ 		fflush(sfp);
-- 
1.7.3.4
