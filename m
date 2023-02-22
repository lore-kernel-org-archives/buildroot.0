Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3985C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 17:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8039E4178A;
	Wed, 22 Feb 2023 17:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8039E4178A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I_0aoYR2oTFX; Wed, 22 Feb 2023 17:14:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BCED41776;
	Wed, 22 Feb 2023 17:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BCED41776
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B87021BF364
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5157282011
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5157282011
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id weCcO5BhNpVa for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 900A5813AE
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 900A5813AE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80416867D2; Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:43:46 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: f4236802adc320e130c3838a9225584bfc0bf57c
X-Git-Newrev: a6d8ee54041bd23af01064d125b37cad99f6e68d
X-Patchwork-Hint: ignore
Message-Id: <20230222170818.80416867D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/live555: fix
 build config with locale
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

commit: https://git.buildroot.net/buildroot/commit/?id=a6d8ee54041bd23af01064d125b37cad99f6e68d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
(cherry picked from commit 04a4b86a982e307268d660a38d231315134572fb)
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
