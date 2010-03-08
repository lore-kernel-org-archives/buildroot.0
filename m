From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Mar 2010 23:07:52 +0100
Subject: [Buildroot] [git commit master] busybox: additional 1.16.0 fixes
Message-ID: <20100308220821.2532877708@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=32ae5854dd1a1c77c9019932f248eb2dc1f1d565
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                      |    3 +-
 package/busybox/busybox-1.16.0-POLLHUP.patch |   93 ++++++++++++++++++++++++++
 package/busybox/busybox-1.16.0-wc.patch      |   12 +++
 3 files changed, 107 insertions(+), 1 deletions(-)
 create mode 100644 package/busybox/busybox-1.16.0-POLLHUP.patch
 create mode 100644 package/busybox/busybox-1.16.0-wc.patch

diff --git a/CHANGES b/CHANGES
index 9746c60..1a95412 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,8 @@
 
 	 X.org updated to 7.5.
 
-	 Updated/fixed packages: dosfstools, e2fsprogs, mtd-utils, squashfs
+	 Updated/fixed packages: busybox, dosfstools, e2fsprogs,
+	 mtd-utils, squashfs
 
 2010.02, Release February 26th, 2010:
 
diff --git a/package/busybox/busybox-1.16.0-POLLHUP.patch b/package/busybox/busybox-1.16.0-POLLHUP.patch
new file mode 100644
index 0000000..04ceb16
--- /dev/null
+++ b/package/busybox/busybox-1.16.0-POLLHUP.patch
@@ -0,0 +1,93 @@
+diff -urpN busybox-1.16.0/miscutils/microcom.c busybox-1.16.0-POLLHUP/miscutils/microcom.c
+--- busybox-1.16.0/miscutils/microcom.c	2010-03-08 22:49:23.000000000 +0100
++++ busybox-1.16.0-POLLHUP/miscutils/microcom.c	2010-03-08 22:50:34.000000000 +0100
+@@ -119,7 +119,7 @@ int microcom_main(int argc UNUSED_PARAM,
+ 	nfd = 2;
+ 	// Not safe_poll: we want to exit on signal
+ 	while (!bb_got_signal && poll(pfd, nfd, timeout) > 0) {
+-		if (nfd > 1 && (pfd[1].revents & POLLIN)) {
++		if (nfd > 1 && pfd[1].revents) {
+ 			char c;
+ 			// read from stdin -> write to device
+ 			if (safe_read(STDIN_FILENO, &c, 1) < 1) {
+@@ -143,7 +143,7 @@ int microcom_main(int argc UNUSED_PARAM,
+ 				safe_poll(pfd, 1, delay);
+ skip_write: ;
+ 		}
+-		if (pfd[0].revents & POLLIN) {
++		if (pfd[0].revents) {
+ #define iobuf bb_common_bufsiz1
+ 			ssize_t len;
+ 			// read from device -> write to stdout
+diff -urpN busybox-1.16.0/networking/httpd.c busybox-1.16.0-POLLHUP/networking/httpd.c
+--- busybox-1.16.0/networking/httpd.c	2010-03-08 22:49:32.000000000 +0100
++++ busybox-1.16.0-POLLHUP/networking/httpd.c	2010-03-08 22:50:39.000000000 +0100
+@@ -1167,7 +1167,7 @@ static NOINLINE void cgi_io_loop_and_exi
+ 			break;
+ 		}
+ 
+-		if (pfd[TO_CGI].revents & POLLOUT) {
++		if (pfd[TO_CGI].revents) {
+ 			/* hdr_cnt > 0 here due to the way pfd[TO_CGI].events set */
+ 			/* Have data from peer and can write to CGI */
+ 			count = safe_write(toCgi_wr, hdr_ptr, hdr_cnt);
+@@ -1184,7 +1184,7 @@ static NOINLINE void cgi_io_loop_and_exi
+ 			}
+ 		}
+ 
+-		if (pfd[0].revents & POLLIN) {
++		if (pfd[0].revents) {
+ 			/* post_len > 0 && hdr_cnt == 0 here */
+ 			/* We expect data, prev data portion is eaten by CGI
+ 			 * and there *is* data to read from the peer
+@@ -1202,7 +1202,7 @@ static NOINLINE void cgi_io_loop_and_exi
+ 			}
+ 		}
+ 
+-		if (pfd[FROM_CGI].revents & POLLIN) {
++		if (pfd[FROM_CGI].revents) {
+ 			/* There is something to read from CGI */
+ 			char *rbuf = iobuf;
+ 
+diff -urpN busybox-1.16.0/networking/telnet.c busybox-1.16.0-POLLHUP/networking/telnet.c
+--- busybox-1.16.0/networking/telnet.c	2010-03-08 22:49:32.000000000 +0100
++++ busybox-1.16.0-POLLHUP/networking/telnet.c	2010-03-08 22:50:38.000000000 +0100
+@@ -618,7 +618,7 @@ int telnet_main(int argc UNUSED_PARAM, c
+ 		default:
+ 
+ #ifdef USE_POLL
+-			if (ufds[0].revents & POLLIN)
++			if (ufds[0].revents)
+ #else
+ 			if (FD_ISSET(STDIN_FILENO, &rfds))
+ #endif
+@@ -631,7 +631,7 @@ int telnet_main(int argc UNUSED_PARAM, c
+ 			}
+ 
+ #ifdef USE_POLL
+-			if (ufds[1].revents & POLLIN)
++			if (ufds[1].revents)
+ #else
+ 			if (FD_ISSET(netfd, &rfds))
+ #endif
+diff -urpN busybox-1.16.0/util-linux/script.c busybox-1.16.0-POLLHUP/util-linux/script.c
+--- busybox-1.16.0/util-linux/script.c	2010-03-08 22:49:23.000000000 +0100
++++ busybox-1.16.0-POLLHUP/util-linux/script.c	2010-03-08 22:50:34.000000000 +0100
+@@ -119,7 +119,7 @@ int script_main(int argc UNUSED_PARAM, c
+ 				 * for example, try "script -c true" */
+ 				break;
+ 			}
+-			if (pfd[0].revents & POLLIN) {
++			if (pfd[0].revents) {
+ 				errno = 0;
+ 				count = safe_read(pty, buf, sizeof(buf));
+ 				if (count <= 0 && errno != EAGAIN) {
+@@ -143,7 +143,7 @@ int script_main(int argc UNUSED_PARAM, c
+ 					}
+ 				}
+ 			}
+-			if (pfd[1].revents & POLLIN) {
++			if (pfd[1].revents) {
+ 				count = safe_read(STDIN_FILENO, buf, sizeof(buf));
+ 				if (count <= 0) {
+ 					/* err/eof from stdin: don't read stdin anymore */
diff --git a/package/busybox/busybox-1.16.0-wc.patch b/package/busybox/busybox-1.16.0-wc.patch
new file mode 100644
index 0000000..5116fe2
--- /dev/null
+++ b/package/busybox/busybox-1.16.0-wc.patch
@@ -0,0 +1,12 @@
+diff -urpN busybox-1.16.0/coreutils/wc.c busybox-1.16.0-wc/coreutils/wc.c
+--- busybox-1.16.0/coreutils/wc.c	2010-03-08 22:49:32.000000000 +0100
++++ busybox-1.16.0-wc/coreutils/wc.c	2010-03-08 22:51:29.310086707 +0100
+@@ -88,6 +88,8 @@ int wc_main(int argc UNUSED_PARAM, char 
+ 	if (!argv[0]) {
+ 		*--argv = (char *) bb_msg_standard_input;
+ 		fname_fmt = "\n";
++	}
++	if (!argv[1]) { /* zero or one filename? */
+ 		if (!((print_type-1) & print_type)) /* exactly one option? */
+ 			start_fmt = "%"COUNT_FMT;
+ 	}
-- 
1.6.3.3
