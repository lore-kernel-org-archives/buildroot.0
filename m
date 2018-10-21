From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 18:01:28 +0200
Subject: [Buildroot] [git commit] package/mongoose: bump to version 6.13
Message-ID: <20181021155950.EB8B788384@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=951f15b16f6167f4205988e5dde4d13e2f560791
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For some reason, the hash of the Github-provided tarball for mongoose
6.7 has changed. The actual contents are the same between the old and
new tarballs, only the order of the files is changed.

However, changing the hash would break older Buildroot releases
(because sources.buildroot.net would pick up the tarball with the new
hash, and old Buildroot releases would no longer be able to pick up
the tarball with the old hash, neither from Github nor from the
Buildroot mirror).

So, we simply bump to a newer version of mongoose. This way, old
Buildroot releases will continue to fetch Mongoose 6.7 from the
Buildroot mirror, with the old hash matching. New Buildroot releases
will be using the new Mongoose version, with a correct hash that
allows to download from Github successfully.

The hash of the license file has changed, due to a change in the
copyright years.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-body-length-calculation-in-mg_handle_cgi.patch | 46 ----------------------
 package/mongoose/mongoose.hash                     |  4 +-
 package/mongoose/mongoose.mk                       |  2 +-
 3 files changed, 3 insertions(+), 49 deletions(-)

diff --git a/package/mongoose/0001-Fix-body-length-calculation-in-mg_handle_cgi.patch b/package/mongoose/0001-Fix-body-length-calculation-in-mg_handle_cgi.patch
deleted file mode 100644
index a696042436..0000000000
--- a/package/mongoose/0001-Fix-body-length-calculation-in-mg_handle_cgi.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 9e93f71556f8d5ba62fccec46ee5689e385d6d37 Mon Sep 17 00:00:00 2001
-From: Deomid Ryabkov <rojer@cesanta.com>
-Date: Mon, 13 Aug 2018 15:50:01 +0300
-Subject: [PATCH] Fix body length calculation in mg_handle_cgi
-
-Fixes https://nvd.nist.gov/vuln/detail/CVE-2018-10945
-
-CL: mg: Fix body length calculation in mg_handle_cgi
-
-PUBLISHED_FROM=0c30cf36fdb67c75f6148468701e23d6ee72d953
-
-[Thomas: backported from upstream commit
-f33d3a4e0225d6e009b90193402141025e9ea74d, dropping the changes in
-src/mg_http_cgi.c, because back in 6.7, the initial mongoose sources
-were not in the tree, only the amalgamated version.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- mongoose.c | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/mongoose.c b/mongoose.c
-index 7e55896..f5b0177 100644
---- a/mongoose.c
-+++ b/mongoose.c
-@@ -8308,7 +8308,6 @@ MG_INTERNAL void mg_handle_cgi(struct mg_connection *nc, const char *prog,
- 
-   if (mg_start_process(opts->cgi_interpreter, prog, blk.buf, blk.vars, dir,
-                        fds[1]) != 0) {
--    size_t n = nc->recv_mbuf.len - (hm->message.len - hm->body.len);
-     struct mg_connection *cgi_nc =
-         mg_add_sock(nc->mgr, fds[0], mg_cgi_ev_handler);
-     struct mg_http_proto_data *cgi_pd = mg_http_get_proto_data(cgi_nc);
-@@ -8316,8 +8315,8 @@ MG_INTERNAL void mg_handle_cgi(struct mg_connection *nc, const char *prog,
-     cgi_pd->cgi.cgi_nc->user_data = nc;
-     nc->flags |= MG_F_USER_1;
-     /* Push POST data to the CGI */
--    if (n > 0 && n < nc->recv_mbuf.len) {
--      mg_send(cgi_pd->cgi.cgi_nc, hm->body.p, n);
-+    if (hm->body.len > 0) {
-+      mg_send(cgi_pd->cgi.cgi_nc, hm->body.p, hm->body.len);
-     }
-     mbuf_remove(&nc->recv_mbuf, nc->recv_mbuf.len);
-   } else {
--- 
-2.14.4
-
diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index 20023382f5..86ebe8efbf 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	ccc971298db70963d3f13766c3246a3c36ae7e388acfab7ba2180149d9c8c64f  mongoose-6.7.tar.gz
-sha256	24a854f7af0b1b2bb0f3b7734fa5d2cef8c673f298697b86a6067dcdaa18bc88  LICENSE
+sha256	ec7956b8f2845f6c22e19ab38a0c32c9b379087f0038c7db661b34812f225911  mongoose-6.13.tar.gz
+sha256	fdc34eeea97327d75c83492abd34f1a3200c53dec04422ecda8071dc60a36d10  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index e2149e06e8..653c83c7d4 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 6.7
+MONGOOSE_VERSION = 6.13
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
