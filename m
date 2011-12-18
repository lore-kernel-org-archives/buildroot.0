From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Dec 2011 22:00:33 +0100
Subject: [Buildroot] [git commit] busybox: add 1.19.3 for wget redirect
	handling
Message-ID: <20111218210431.B66A98FA96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d7d697fbfc2273ed1decd3b1c13411ba7ba24a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.19.3/busybox-1.19.3-wget.patch       |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox-1.19.3/busybox-1.19.3-wget.patch b/package/busybox/busybox-1.19.3/busybox-1.19.3-wget.patch
new file mode 100644
index 0000000..e98a506
--- /dev/null
+++ b/package/busybox/busybox-1.19.3/busybox-1.19.3-wget.patch
@@ -0,0 +1,29 @@
+--- busybox-1.19.3/networking/wget.c
++++ busybox-1.19.3-wget/networking/wget.c
+@@ -552,6 +552,7 @@ static void download_one_url(const char 
+ 	FILE *dfp;                      /* socket to ftp server (data)      */
+ 	char *proxy = NULL;
+ 	char *fname_out_alloc;
++	char *redirected_path = NULL;
+ 	struct host_info server;
+ 	struct host_info target;
+ 
+@@ -794,8 +795,8 @@ However, in real world it was observed t
+ 					bb_error_msg_and_die("too many redirections");
+ 				fclose(sfp);
+ 				if (str[0] == '/') {
+-					free(target.allocated);
+-					target.path = target.allocated = xstrdup(str+1);
++					free(redirected_path);
++					target.path = redirected_path = xstrdup(str+1);
+ 					/* lsa stays the same: it's on the same server */
+ 				} else {
+ 					parse_url(str, &target);
+@@ -850,6 +851,7 @@ However, in real world it was observed t
+ 	free(server.allocated);
+ 	free(target.allocated);
+ 	free(fname_out_alloc);
++	free(redirected_path);
+ }
+ 
+ int wget_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
