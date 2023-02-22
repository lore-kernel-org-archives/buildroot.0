Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D94C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 17:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0136C4053D;
	Wed, 22 Feb 2023 17:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0136C4053D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 60AYBI384mpc; Wed, 22 Feb 2023 17:08:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 389FB416F2;
	Wed, 22 Feb 2023 17:08:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 389FB416F2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D6EC1BF97A
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12F1D81418
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12F1D81418
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RG3UlQJ5QZ4L for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FB6F81423
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FB6F81423
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E3E8867D2; Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:38:02 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0a54bc3316155ae95eefc597d5780cb5d3078e13
X-Git-Newrev: fa019b8d64d549541d8f4a754b5d418017a14b85
X-Patchwork-Hint: ignore
Message-Id: <20230222170816.2E3E8867D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/live555: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa019b8d64d549541d8f4a754b5d418017a14b85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
