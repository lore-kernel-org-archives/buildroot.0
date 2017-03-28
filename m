From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 28 Mar 2017 22:29:49 +0200
Subject: [Buildroot] [PATCH v1] uhtppd: fix TCP_FASTOPEN related compile
	error
Message-ID: <20170328202949.1762-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]:

  .../uhttpd-a8bf9c00842224edb394e79909053f7628ee6a82/listen.c: In function 'uh_setup_listeners':
  .../uhttpd-a8bf9c00842224edb394e79909053f7628ee6a82/listen.c:120:30: error: 'TCP_FASTOPEN' undeclared (first use in this function)

[1] http://autobuild.buildroot.net/results/56e/56e0727ccd1255b05e03d1b79dc238bd88701230

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...02-Fix-TCP_FASTOPEN-related-compile-error.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/uhttpd/0002-Fix-TCP_FASTOPEN-related-compile-error.patch

diff --git a/package/uhttpd/0002-Fix-TCP_FASTOPEN-related-compile-error.patch b/package/uhttpd/0002-Fix-TCP_FASTOPEN-related-compile-error.patch
new file mode 100644
index 000000000..887e7d846
--- /dev/null
+++ b/package/uhttpd/0002-Fix-TCP_FASTOPEN-related-compile-error.patch
@@ -0,0 +1,44 @@
+From e6c53cca170388e97e2d25c4429e0fd16739778b Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Tue, 28 Mar 2017 22:22:02 +0200
+Subject: [PATCH] Fix TCP_FASTOPEN related compile error.
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ listen.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/listen.c b/listen.c
+index 2a54888..727bff8 100644
+--- a/listen.c
++++ b/listen.c
+@@ -107,18 +107,24 @@ void uh_setup_listeners(void)
+ 		/* TCP keep-alive */
+ 		if (conf.tcp_keepalive > 0) {
+ #ifdef linux
+-			int tcp_ka_idl, tcp_ka_int, tcp_ka_cnt, tcp_fstopn;
++			int tcp_ka_idl, tcp_ka_int, tcp_ka_cnt;
++#ifdef TCP_FASTOPEN
++			int tcp_fstopn;
++#endif
+ 
+ 			tcp_ka_idl = 1;
+ 			tcp_ka_cnt = 3;
+ 			tcp_ka_int = conf.tcp_keepalive;
++#ifdef TCP_FASTOPEN
+ 			tcp_fstopn = 5;
+-
++#endif
+ 			setsockopt(sock, SOL_TCP, TCP_KEEPIDLE,  &tcp_ka_idl, sizeof(tcp_ka_idl));
+ 			setsockopt(sock, SOL_TCP, TCP_KEEPINTVL, &tcp_ka_int, sizeof(tcp_ka_int));
+ 			setsockopt(sock, SOL_TCP, TCP_KEEPCNT,   &tcp_ka_cnt, sizeof(tcp_ka_cnt));
++#ifdef TCP_FASTOPEN
+ 			setsockopt(sock, SOL_TCP, TCP_FASTOPEN,  &tcp_fstopn, sizeof(tcp_fstopn));
+ #endif
++#endif
+ 
+ 			setsockopt(sock, SOL_SOCKET, SO_KEEPALIVE, &yes, sizeof(yes));
+ 		}
+-- 
+2.11.0
+
-- 
2.11.0
