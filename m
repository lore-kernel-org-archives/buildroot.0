Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1969BC433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 14:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C75E540639;
	Sat,  2 Apr 2022 14:42:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GvN-1dQybB43; Sat,  2 Apr 2022 14:42:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E639C408C0;
	Sat,  2 Apr 2022 14:42:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 376E81BF867
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 14:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A8C860E8B
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 14:42:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ryx0rDxqORcg for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 14:42:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CBBC60DB2
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 14:42:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 82D4185D3C; Sat,  2 Apr 2022 14:32:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 2 Apr 2022 16:36:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1adcf5659804c17859b2799c0c3edb6b6ce68eb5
X-Git-Newrev: 387c496b98895a3ad38d53554d45713a81d7a169
X-Patchwork-Hint: ignore
Message-Id: <20220402143246.82D4185D3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: add a timeout
 on HTTP requests for upstream URLs
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

commit: https://git.buildroot.net/buildroot/commit/?id=387c496b98895a3ad38d53554d45713a81d7a169
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some upstream sites are very slow to respond, and the default timeout
of 300 seconds of the aiohttp.ClientSession() is too long. Let's
reduce it to 15 seconds.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
