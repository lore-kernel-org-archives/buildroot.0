Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D06C433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 22:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FA4941588;
	Mon,  2 May 2022 22:00:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D9gT3KZtu42M; Mon,  2 May 2022 22:00:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5450B4156D;
	Mon,  2 May 2022 22:00:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6624D1BF2C0
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52BDC81450
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:59:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ucJ9eDNg_5O9 for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:59:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51AC3813D8
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:59:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1B69184EC9; Mon,  2 May 2022 21:48:51 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 2 May 2022 23:56:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7db5af34f25cf9f3e8577c75ff290495c5724c6
X-Git-Newrev: 2d0e54ce86a39e5753f9a8314c543d0a2b9181dd
X-Patchwork-Hint: ignore
Message-Id: <20220502214851.1B69184EC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: fix build with mbedtls
 when h2-enabled
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d0e54ce86a39e5753f9a8314c543d0a2b9181dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bug was introduced by bumping libcurl to 7.83.0 in
https://git.busybox.net/buildroot/commit/?id=b0b25f145469a14e3d85becf19aaca0a40fd4e25

Fixes:
http://autobuild.buildroot.net/results/825/825b0ae84d5212200710628689079ec54a4bda3f/
http://autobuild.buildroot.net/results/881/8812ffdf42a3adf2df834c4b6e36316cd932821e/
http://autobuild.buildroot.net/results/3e8/3e840c896e4b8aacc9d784f16a6388eac4178246/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
