Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61ADD2A53B
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A27D040A16;
	Thu,  4 Dec 2025 20:39:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvCkG7ALiF35; Thu,  4 Dec 2025 20:39:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B970E40A17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764880767;
	bh=QITUlRaccX8J73stmMCLJjBWIVxy5w//HZzNKqT9V4A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gaYJRuo/BN3p0NFMGhHNpBW98f/x2xUvqGMdMdge6qQ++/avH1ZLC5ghKIQFJxkhc
	 JJbWPNjqmJ8ejwb0VPTHrVNQWLAe/ZqmYuMHH0G6yV9pT6tLelF5D/Ps1xohzVbAkT
	 cfILtQefAOkrAJ6vmTAZ4fp0XMhvYFhhGY/pQdZUStluwx2iYenAr536Nj0W0NTINJ
	 1iIK4w9Xa1XD539+N3tUghHIaHkVQlwHYQnfOfD5lVdR3h1Ty6U6NuggA/rvzWBr1G
	 bDeBjJGq23Ukf6UxS/LLjEVWt+wfnv5HetskDvVoqr3vEZ8C4cX1fFYHW/HRzSRPRh
	 GiHHTCxbZFfVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B970E40A17;
	Thu,  4 Dec 2025 20:39:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 116F41A9
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 027C64035B
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l1svRDydEN3w for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC61C41086
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC61C41086
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:39:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DAC9585FFC; Thu,  4 Dec 2025 20:39:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Dec 2025 13:22:32 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5c51dbaeacf3fd2e49ee55710413395c3eb8b9ae
X-Git-Newrev: 29f8d1133d9b0dc44fabe4690bf8662cba6eb44a
X-Patchwork-Hint: ignore
Message-Id: <20251204203917.DAC9585FFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libteam: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=29f8d1133d9b0dc44fabe4690bf8662cba6eb44a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
