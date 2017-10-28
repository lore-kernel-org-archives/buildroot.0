From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Oct 2017 20:47:31 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] Revert "musl: add
	upstream security fix for CVE-2017-15650"
Message-ID: <20171028190913.BFF1B80E50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dce5ba6dcb9edd60c54a0e5a559191c248e46e3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

This reverts commit 5a9013c6d1203f107b64d7003e7621e75b3972af.

This patch was already added by commit 4c05a1fd669be68, no need to add it
twice.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ing-callback-enforce-MAXADDRS-to-preclude.patch | 35 ----------------------
 1 file changed, 35 deletions(-)

diff --git a/package/musl/0003-in-dns-parsing-callback-enforce-MAXADDRS-to-preclude.patch b/package/musl/0003-in-dns-parsing-callback-enforce-MAXADDRS-to-preclude.patch
deleted file mode 100644
index c6b5ef2..0000000
--- a/package/musl/0003-in-dns-parsing-callback-enforce-MAXADDRS-to-preclude.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 45ca5d3fcb6f874bf5ba55d0e9651cef68515395 Mon Sep 17 00:00:00 2001
-From: Rich Felker <dalias@aerifal.cx>
-Date: Wed, 18 Oct 2017 14:50:03 -0400
-Subject: [PATCH] in dns parsing callback, enforce MAXADDRS to preclude
- overflow
-
-MAXADDRS was chosen not to need enforcement, but the logic used to
-compute it assumes the answers received match the RR types of the
-queries. specifically, it assumes that only one replu contains A
-record answers. if the replies to both the A and the AAAA query have
-their answer sections filled with A records, MAXADDRS can be exceeded
-and clobber the stack of the calling function.
-
-this bug was found and reported by Felix Wilhelm.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/network/lookup_name.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/network/lookup_name.c b/src/network/lookup_name.c
-index 066be4d5..209c20f0 100644
---- a/src/network/lookup_name.c
-+++ b/src/network/lookup_name.c
-@@ -111,6 +111,7 @@ static int dns_parse_callback(void *c, int rr, const void *data, int len, const
- {
- 	char tmp[256];
- 	struct dpc_ctx *ctx = c;
-+	if (ctx->cnt >= MAXADDRS) return -1;
- 	switch (rr) {
- 	case RR_A:
- 		if (len != 4) return -1;
--- 
-2.11.0
-
