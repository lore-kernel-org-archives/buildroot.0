Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D7ED2A53A
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A3D761CCC;
	Thu,  4 Dec 2025 20:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rd7dCG410fPQ; Thu,  4 Dec 2025 20:40:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00C6D61CA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764880850;
	bh=tzaTQbIKyFz6UR8xwpcRiEFDLj6oB1oLreT3Bl5/jXg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dueFJy/1ZD+UHEvtOAsXL8e0lsblqyHkSExclYuJWVyKevBYe7k+U5voXUZNvYzSD
	 lApqSSBbUNzTmQ4xFeIWfBOfNP9n6SD9e8KPtw5pN5+KjSdeCre7Czf5Gjlq3De83R
	 5r/5Bhnh3vIdXFV1yjhfQsIzMrZ6LNy9CS35hfjwLO2U1q+y1K40stum5LM22Ji7/C
	 56kHPqUgxDtb63umo2jlqNannkg350WMeoecefcd76igEKXOPyOlDTlcBQ2wA12iQd
	 h8tJEAsFi6Q/lKd7V1xm5XPpy8evWSLib1Z5gySxmpfVruy9XaDSdFqqRjvWdg+FoT
	 DnYnGH482fnrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00C6D61CA4;
	Thu,  4 Dec 2025 20:40:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F144D3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E058340A09
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3jBXQqaeyGes for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:40:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F75E40A0A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F75E40A0A
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:40:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D96986511; Thu,  4 Dec 2025 20:40:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Dec 2025 13:22:35 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: c5b0f8c2b38f80c1ac629b03003475eb978686aa
X-Git-Newrev: b4bb9e507206a56712a8a70593c2305b88aaed57
X-Patchwork-Hint: ignore
Message-Id: <20251204204038.8D96986511@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/libteam: add
 upstream patch to fix build with newer gcc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b4bb9e507206a56712a8a70593c2305b88aaed57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Fixes:
https://autobuild.buildroot.net/results/a4c/a4c4c4135cffe607269cc0fdb36e4b2c86e7fe33/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fc98cd6b9cecccd5813741d3311f1adc099b3454)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...Pass-correct-parameter-type-to-accept-API.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/libteam/0001-teamd-Pass-correct-parameter-type-to-accept-API.patch b/package/libteam/0001-teamd-Pass-correct-parameter-type-to-accept-API.patch
new file mode 100644
index 0000000000..0d9cf9b8a0
--- /dev/null
+++ b/package/libteam/0001-teamd-Pass-correct-parameter-type-to-accept-API.patch
@@ -0,0 +1,40 @@
+From 4eb54a811bef43da2be9cc84009567e5d6ca9741 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 11 May 2024 23:15:59 -0700
+Subject: [PATCH] teamd: Pass correct parameter type to accept API
+
+accept() expects sockaddr as second parameter
+
+int accept (int, struct sockaddr *__restrict, socklen_t *__restrict);
+
+Fixes build with gcc-16 on musl systems
+| ../../git/teamd/teamd_usock.c: In function 'callback_usock':
+| ../../git/teamd/teamd_usock.c:280:40: error: passing argument 2 of 'accept' from incompatible pointer type [-Wincompatible-pointer-types]
+|   280 |         sock = accept(ctx->usock.sock, &addr, &alen);
+|       |                                        ^~~~~
+|       |                                        |
+|       |                                        struct sockaddr_un *
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Jiri Pirko <jiri@nvidia.com>
+
+Upstream: https://github.com/jpirko/libteam/commit/4eb54a811bef43da2be9cc84009567e5d6ca9741
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ teamd/teamd_usock.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/teamd/teamd_usock.c b/teamd/teamd_usock.c
+index 1adfdf8..5895124 100644
+--- a/teamd/teamd_usock.c
++++ b/teamd/teamd_usock.c
+@@ -277,7 +277,7 @@ static int callback_usock(struct teamd_context *ctx, int events, void *priv)
+ 	int err;
+ 
+ 	alen = sizeof(addr);
+-	sock = accept(ctx->usock.sock, &addr, &alen);
++	sock = accept(ctx->usock.sock, (struct sockaddr *)&addr, &alen);
+ 	if (sock == -1) {
+ 		teamd_log_err("usock: Failed to accept connection.");
+ 		return -errno;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
