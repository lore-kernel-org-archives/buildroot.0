Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2E7C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 13:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C92C140471;
	Mon,  6 Feb 2023 13:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C92C140471
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NsgUBYtApoRY; Mon,  6 Feb 2023 13:23:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95C334048B;
	Mon,  6 Feb 2023 13:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95C334048B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 02A8E1BF2A7
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEDF540482
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEDF540482
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x8hWIAScMPPO for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 13:23:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DDD6403B8
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 13:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DDD6403B8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B35483C25; Mon,  6 Feb 2023 13:23:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 14:22:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e6ae82531928662764536cadbe2d6f3c558e7de2
X-Git-Newrev: 04a4b86a982e307268d660a38d231315134572fb
X-Patchwork-Hint: ignore
Message-Id: <20230206132305.0B35483C25@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/live555: fix build config with
 locale
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

commit: https://git.buildroot.net/buildroot/commit/?id=04a4b86a982e307268d660a38d231315134572fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using current conditional code, added in 2014:

ifndef ($(BR2_ENABLE_LOCALE),y)
LIVE555_CFLAGS += -DLOCALE_NOT_USED
endif

the define LOCALE_NOT_USED is always passed on CFLAGS, because there is
no symbol with following names defined:
 "(y,y)" -> not defined when BR2_ENABLE_LOCALE=y
 "(,y)" -> not defined when BR2_ENABLE_LOCALE is not set

So fix the typo, switching ifndef to ifneq.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/live555/live555.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index effd4517cf..56ed705783 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -39,7 +39,7 @@ else
 LIVE555_CFLAGS += -DNO_OPENSSL
 endif
 
-ifndef ($(BR2_ENABLE_LOCALE),y)
+ifneq ($(BR2_ENABLE_LOCALE),y)
 LIVE555_CFLAGS += -DLOCALE_NOT_USED
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
