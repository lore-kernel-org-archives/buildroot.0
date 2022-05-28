Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45816C433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 07:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC4F24198F;
	Sat, 28 May 2022 07:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cVN7o2gpuk5H; Sat, 28 May 2022 07:10:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5B174198D;
	Sat, 28 May 2022 07:10:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 288661BF2C4
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 07:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DEEB404F3
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 07:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ElMbPg0-TDCB for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 07:08:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E00341991
 for <buildroot@buildroot.org>; Sat, 28 May 2022 07:08:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6220B83CD9; Sat, 28 May 2022 06:57:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 08:50:28 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: b59bd92a5cedb5832cbcf69be338ed814b2ceb84
X-Git-Newrev: f80caa4efc7e1e9abe94cac4bc5a46237ddf7254
X-Patchwork-Hint: ignore
Message-Id: <20220528065730.6220B83CD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libcurl: fix
 build with mbedtls when h2-enabled
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f80caa4efc7e1e9abe94cac4bc5a46237ddf7254
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Bug was introduced by bumping libcurl to 7.83.0 in
https://git.busybox.net/buildroot/commit/?id=b0b25f145469a14e3d85becf19aaca0a40fd4e25

Fixes:
http://autobuild.buildroot.net/results/825/825b0ae84d5212200710628689079ec54a4bda3f/
http://autobuild.buildroot.net/results/881/8812ffdf42a3adf2df834c4b6e36316cd932821e/
http://autobuild.buildroot.net/results/3e8/3e840c896e4b8aacc9d784f16a6388eac4178246/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 2d0e54ce86a39e5753f9a8314c543d0a2b9181dd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-mbedtls-fix-compile-when-h2-enabled.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/libcurl/0001-mbedtls-fix-compile-when-h2-enabled.patch b/package/libcurl/0001-mbedtls-fix-compile-when-h2-enabled.patch
new file mode 100644
index 0000000000..61cbabd84a
--- /dev/null
+++ b/package/libcurl/0001-mbedtls-fix-compile-when-h2-enabled.patch
@@ -0,0 +1,32 @@
+From 6eb7fb37d901ed1e4ce07cbd628ee11bf02db1f3 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 28 Apr 2022 17:11:50 +0200
+Subject: [PATCH] mbedtls: fix compile when h2-enabled
+
+Fixes #8766
+Reported-by: LigH-de on github
+Closes #8768
+
+Downloaded from upstream commit
+https://github.com/curl/curl/commit/6eb7fb37d901ed1e4ce07cbd628ee11bf02db1f3
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ lib/vtls/mbedtls.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/vtls/mbedtls.c b/lib/vtls/mbedtls.c
+index 64f57c5d8321..5f9b87e6b75b 100644
+--- a/lib/vtls/mbedtls.c
++++ b/lib/vtls/mbedtls.c
+@@ -815,8 +815,8 @@ mbed_connect_step2(struct Curl_easy *data, struct connectdata *conn,
+     if(next_protocol) {
+       infof(data, VTLS_INFOF_ALPN_ACCEPTED_1STR, next_protocol);
+ #ifdef USE_HTTP2
+-      if(!strncmp(next_protocol, ALPN_H2, ALPN_H2_LEN) &&
+-         !next_protocol[ALPN_H2_LEN]) {
++      if(!strncmp(next_protocol, ALPN_H2, ALPN_H2_LENGTH) &&
++         !next_protocol[ALPN_H2_LENGTH]) {
+         conn->negnpn = CURL_HTTP_VERSION_2;
+       }
+       else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
