Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CE3C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 683A482EB6;
	Mon, 20 Feb 2023 23:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 683A482EB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pTTF4wFYxfeO; Mon, 20 Feb 2023 23:32:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E70483E9A;
	Mon, 20 Feb 2023 23:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E70483E9A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E12581BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36A0A6107F
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36A0A6107F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KVXaL4aI8ofi for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B04861779
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B04861779
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46A46828C8; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 20:53:29 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 030cbe37033a3c179c5c51dbd0427cc443efb330
X-Git-Newrev: ef3052674a7104990037b7da60cbbcb9d316e764
X-Patchwork-Hint: ignore
Message-Id: <20230220205217.46A46828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rtl8192eu: fix build
 failure due to function and data types name conflict with Linux
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ef3052674a7104990037b7da60cbbcb9d316e764
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add local patch to rename local sha256 data types and functions that
conflict with Linux ones.

Fixes:
http://autobuild.buildroot.net/results/7a85a1e6df55bbb4dc6741821c849ad7ee5059af

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ailure-due-to-redefition-of-local-sha256-.patch | 108 +++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/package/rtl8192eu/0001-Fix-build-failure-due-to-redefition-of-local-sha256-.patch b/package/rtl8192eu/0001-Fix-build-failure-due-to-redefition-of-local-sha256-.patch
new file mode 100644
index 0000000000..52ef8c9005
--- /dev/null
+++ b/package/rtl8192eu/0001-Fix-build-failure-due-to-redefition-of-local-sha256-.patch
@@ -0,0 +1,108 @@
+From 1f968bd58656f200347bd398b34aa9f1b6393302 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 28 Dec 2022 18:54:48 +0100
+Subject: [PATCH] Fix build failure due to redefition of local sha256 data
+ types and functions
+
+Linux provides sha256_init() and 'struct sha256_state' in file
+include/crypto/sha2.h so this leads to a build failure due to redefinition.
+To avoid this let's prepend to all local exposed functions and data types
+rtl_. sha256_process() and sha256_done() are not required to be renamed but
+let's change them for consistency.
+
+[Upstream status: https://github.com/clnhub/rtl8192eu-linux/pull/69]
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ core/crypto/sha256-internal.c | 16 ++++++++--------
+ core/crypto/sha256_i.h        |  8 ++++----
+ 2 files changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/core/crypto/sha256-internal.c b/core/crypto/sha256-internal.c
+index 4d61cb1..537bb2e 100644
+--- a/core/crypto/sha256-internal.c
++++ b/core/crypto/sha256-internal.c
+@@ -26,17 +26,17 @@
+ int sha256_vector(size_t num_elem, const u8 *addr[], const size_t *len,
+ 		  u8 *mac)
+ {
+-	struct sha256_state ctx;
++	struct rtl_sha256_state ctx;
+ 	size_t i;
+ 
+ 	if (TEST_FAIL())
+ 		return -1;
+ 
+-	sha256_init(&ctx);
++	rtl_sha256_init(&ctx);
+ 	for (i = 0; i < num_elem; i++)
+-		if (sha256_process(&ctx, addr[i], len[i]))
++		if (rtl_sha256_process(&ctx, addr[i], len[i]))
+ 			return -1;
+-	if (sha256_done(&ctx, mac))
++	if (rtl_sha256_done(&ctx, mac))
+ 		return -1;
+ 	return 0;
+ }
+@@ -82,7 +82,7 @@ static const unsigned long K[64] = {
+ #endif
+ 
+ /* compress 512-bits */
+-static int sha256_compress(struct sha256_state *md, unsigned char *buf)
++static int sha256_compress(struct rtl_sha256_state *md, unsigned char *buf)
+ {
+ 	u32 S[8], W[64], t0, t1;
+ 	u32 t;
+@@ -125,7 +125,7 @@ static int sha256_compress(struct sha256_state *md, unsigned char *buf)
+ 
+ 
+ /* Initialize the hash state */
+-void sha256_init(struct sha256_state *md)
++void rtl_sha256_init(struct rtl_sha256_state *md)
+ {
+ 	md->curlen = 0;
+ 	md->length = 0;
+@@ -146,7 +146,7 @@ void sha256_init(struct sha256_state *md)
+    @param inlen  The length of the data (octets)
+    @return CRYPT_OK if successful
+ */
+-int sha256_process(struct sha256_state *md, const unsigned char *in,
++int rtl_sha256_process(struct rtl_sha256_state *md, const unsigned char *in,
+ 		   unsigned long inlen)
+ {
+ 	unsigned long n;
+@@ -186,7 +186,7 @@ int sha256_process(struct sha256_state *md, const unsigned char *in,
+    @param out [out] The destination of the hash (32 bytes)
+    @return CRYPT_OK if successful
+ */
+-int sha256_done(struct sha256_state *md, unsigned char *out)
++int rtl_sha256_done(struct rtl_sha256_state *md, unsigned char *out)
+ {
+ 	int i;
+ 
+diff --git a/core/crypto/sha256_i.h b/core/crypto/sha256_i.h
+index a502d2b..93a8858 100644
+--- a/core/crypto/sha256_i.h
++++ b/core/crypto/sha256_i.h
+@@ -11,15 +11,15 @@
+ 
+ #define SHA256_BLOCK_SIZE 64
+ 
+-struct sha256_state {
++struct rtl_sha256_state {
+ 	u64 length;
+ 	u32 state[8], curlen;
+ 	u8 buf[SHA256_BLOCK_SIZE];
+ };
+ 
+-void sha256_init(struct sha256_state *md);
+-int sha256_process(struct sha256_state *md, const unsigned char *in,
++void rtl_sha256_init(struct rtl_sha256_state *md);
++int rtl_sha256_process(struct rtl_sha256_state *md, const unsigned char *in,
+ 		   unsigned long inlen);
+-int sha256_done(struct sha256_state *md, unsigned char *out);
++int rtl_sha256_done(struct rtl_sha256_state *md, unsigned char *out);
+ 
+ #endif /* SHA256_I_H */
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
