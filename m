Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4012C433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 14:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A44741853;
	Sat,  2 Apr 2022 14:15:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vQjrZ2CtEaHJ; Sat,  2 Apr 2022 14:15:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2168F4184E;
	Sat,  2 Apr 2022 14:15:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D5741BF867
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 14:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6931A840F3
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 14:15:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LHc8PAIDM_hW for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 14:15:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A49E8840EB
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 14:15:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id AA68D60004;
 Sat,  2 Apr 2022 14:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1648908939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cbJSHaILGdOqGeG1S/OMy29h7KDLa+jkTgY8MT/JScw=;
 b=mduxTUIieyy3okt3I/6KibfAzc23msdWdnuZbjcRjQwz7FTVaKy+lB8Jz6bvqD+aCINmYf
 +7ljOHRzQTRPRAjpvG+hYLqXQ9BJxO9MK+nx8BcB91z4rW4z7T5PzNL+Wo+JKl43JHnIO5
 mt2HHl4F80wFF23NhgcKzZuhz9Op1Ft89Fc7q7jt61KDJMtR+rNwOZLjclInNLgL3qqZ0b
 w4I6QQb7y594wLOnJxo/OhnGFLfh/LNBBzqKNuVDizwnJDKvrbNJo5lNs/TbRET3A72ymm
 +SIRnoK/mXSBm8/13XxVtbkF/QRA1xWZ1ufjtxjoJIxWreURg2z2FmTA/zgOYg==
To: buildroot@buildroot.org
Date: Sat,  2 Apr 2022 16:15:29 +0200
Message-Id: <20220402141531.1320584-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220402141531.1320584-1-thomas.petazzoni@bootlin.com>
References: <20220402141531.1320584-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] support/scripts/pkg-stats: add a timeout on
 HTTP requests for upstream URLs
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some upstream sites are very slow to respond, and the default timeout
of 300 seconds of the aiohttp.ClientSession() is too long. Let's
reduce it to 15 seconds.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
