From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 18:01:28 +0200
Subject: [Buildroot] [git commit] package/mongoose: add security patch
 fixing CVE-2018-10945
Message-ID: <20181021155950.DD50288397@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dea3ab68400503bebf4152277d63813508f43424
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-body-length-calculation-in-mg_handle_cgi.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/mongoose/0001-Fix-body-length-calculation-in-mg_handle_cgi.patch b/package/mongoose/0001-Fix-body-length-calculation-in-mg_handle_cgi.patch
new file mode 100644
index 0000000000..a696042436
--- /dev/null
+++ b/package/mongoose/0001-Fix-body-length-calculation-in-mg_handle_cgi.patch
@@ -0,0 +1,46 @@
+From 9e93f71556f8d5ba62fccec46ee5689e385d6d37 Mon Sep 17 00:00:00 2001
+From: Deomid Ryabkov <rojer@cesanta.com>
+Date: Mon, 13 Aug 2018 15:50:01 +0300
+Subject: [PATCH] Fix body length calculation in mg_handle_cgi
+
+Fixes https://nvd.nist.gov/vuln/detail/CVE-2018-10945
+
+CL: mg: Fix body length calculation in mg_handle_cgi
+
+PUBLISHED_FROM=0c30cf36fdb67c75f6148468701e23d6ee72d953
+
+[Thomas: backported from upstream commit
+f33d3a4e0225d6e009b90193402141025e9ea74d, dropping the changes in
+src/mg_http_cgi.c, because back in 6.7, the initial mongoose sources
+were not in the tree, only the amalgamated version.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ mongoose.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/mongoose.c b/mongoose.c
+index 7e55896..f5b0177 100644
+--- a/mongoose.c
++++ b/mongoose.c
+@@ -8308,7 +8308,6 @@ MG_INTERNAL void mg_handle_cgi(struct mg_connection *nc, const char *prog,
+ 
+   if (mg_start_process(opts->cgi_interpreter, prog, blk.buf, blk.vars, dir,
+                        fds[1]) != 0) {
+-    size_t n = nc->recv_mbuf.len - (hm->message.len - hm->body.len);
+     struct mg_connection *cgi_nc =
+         mg_add_sock(nc->mgr, fds[0], mg_cgi_ev_handler);
+     struct mg_http_proto_data *cgi_pd = mg_http_get_proto_data(cgi_nc);
+@@ -8316,8 +8315,8 @@ MG_INTERNAL void mg_handle_cgi(struct mg_connection *nc, const char *prog,
+     cgi_pd->cgi.cgi_nc->user_data = nc;
+     nc->flags |= MG_F_USER_1;
+     /* Push POST data to the CGI */
+-    if (n > 0 && n < nc->recv_mbuf.len) {
+-      mg_send(cgi_pd->cgi.cgi_nc, hm->body.p, n);
++    if (hm->body.len > 0) {
++      mg_send(cgi_pd->cgi.cgi_nc, hm->body.p, hm->body.len);
+     }
+     mbuf_remove(&nc->recv_mbuf, nc->recv_mbuf.len);
+   } else {
+-- 
+2.14.4
+
