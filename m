From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Feb 2018 10:05:12 +0100
Subject: [Buildroot] [git commit branch/next] iproute2: fix build with
 uclibc-ng
Message-ID: <20180215090534.6F80387F53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4081ee424a8a6d4d965d683437a28c72ceb9b90c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

ublibc-ng does not provide PF_VSOCK/AF_VSOCK definitions. Add them
locally until ucblibc-ng updates its headers.

Fixes:
http://autobuild.buildroot.net/results/3d5/3d5a29e3c61ff071628c2937844ea4156059b3dd/

Cc: Petr Vorel <petr.vorel@gmail.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...s-add-local-PF_VSOCK-AF_VSOCK-definitions.patch | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/package/iproute2/0002-ss-add-local-PF_VSOCK-AF_VSOCK-definitions.patch b/package/iproute2/0002-ss-add-local-PF_VSOCK-AF_VSOCK-definitions.patch
new file mode 100644
index 0000000000..bbd1f45de9
--- /dev/null
+++ b/package/iproute2/0002-ss-add-local-PF_VSOCK-AF_VSOCK-definitions.patch
@@ -0,0 +1,58 @@
+From ca5562864f3c45557ee96a6fd6036150066c6b58 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Thu, 15 Feb 2018 07:39:52 +0200
+Subject: [PATCH] ss: add local PF_VSOCK/AF_VSOCK definitions
+
+uclibc-ng does not provide these definitions yet. Add them locally to
+fix the build.
+
+Increase AF_MAX to cover AF_VSOCK.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: not upstreamable. uclibc-ng needs to update its Linux
+socket.h.
+---
+ misc/ss.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/misc/ss.c b/misc/ss.c
+index 29a250704c2d..b3f289ae358e 100644
+--- a/misc/ss.c
++++ b/misc/ss.c
+@@ -50,6 +50,14 @@
+ #define BUF_CHUNK (1024 * 1024)
+ #define LEN_ALIGN(x) (((x) + 1) & ~1)
+ 
++#ifndef PF_VSOCK
++#define PF_VSOCK 40
++#endif
++
++#ifndef AF_VSOCK
++#define AF_VSOCK PF_VSOCK
++#endif
++
+ #define DIAG_REQUEST(_req, _r)						    \
+ 	struct {							    \
+ 		struct nlmsghdr nlh;					    \
+@@ -298,7 +306,7 @@ static const struct filter default_dbs[MAX_DB] = {
+ 	},
+ };
+ 
+-static const struct filter default_afs[AF_MAX] = {
++static const struct filter default_afs[AF_MAX+1] = {
+ 	[AF_INET] = {
+ 		.dbs    = INET_DBM,
+ 		.states = SS_CONN,
+@@ -383,7 +391,7 @@ static void filter_merge_defaults(struct filter *f)
+ 		if (!(default_dbs[db].families & f->families))
+ 			f->families |= default_dbs[db].families;
+ 	}
+-	for (af = 0; af < AF_MAX; af++) {
++	for (af = 0; af < AF_MAX+1; af++) {
+ 		if (!(f->families & FAMILY_MASK(af)))
+ 			continue;
+ 
+-- 
+2.15.1
+
