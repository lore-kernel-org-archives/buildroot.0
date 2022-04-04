Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5685FC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 12:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C86240915;
	Mon,  4 Apr 2022 12:43:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hGwMgUMG9elC; Mon,  4 Apr 2022 12:43:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BA944091F;
	Mon,  4 Apr 2022 12:43:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7BC3C1BF3D1
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 798B182923
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YHvbeWq3pAhj for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 12:41:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC83582977
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 12:41:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CA98A861AB; Mon,  4 Apr 2022 12:32:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 14:38:50 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 1fe0e5d21d6b3f98aaecf0211c08e4457ed3ccdd
X-Git-Newrev: 745e02154582fe5b60739214c2bfa9c531e30101
X-Patchwork-Hint: ignore
Message-Id: <20220404123210.CA98A861AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 support/scripts/pkg-stats: add a timeout on HTTP requests for upstream URLs
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

commit: https://git.buildroot.net/buildroot/commit/?id=745e02154582fe5b60739214c2bfa9c531e30101
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Some upstream sites are very slow to respond, and the default timeout
of 300 seconds of the aiohttp.ClientSession() is too long. Let's
reduce it to 15 seconds.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 387c496b98895a3ad38d53554d45713a81d7a169)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 329b30a5ee..ae1a9aa5e4 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -451,7 +451,8 @@ async def check_url_status(session, pkg, npkgs, retry=True):
 async def check_package_urls(packages):
     tasks = []
     connector = aiohttp.TCPConnector(limit_per_host=5)
-    async with aiohttp.ClientSession(connector=connector, trust_env=True) as sess:
+    async with aiohttp.ClientSession(connector=connector, trust_env=True,
+                                     timeout=aiohttp.ClientTimeout(total=15)) as sess:
         packages = [p for p in packages if p.status['url'][0] == 'ok']
         for pkg in packages:
             tasks.append(asyncio.ensure_future(check_url_status(sess, pkg, len(packages))))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
