Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966ECC07E9D
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 16:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 137494177A;
	Mon, 26 Sep 2022 16:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 137494177A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0GbgNOvF1bz2; Mon, 26 Sep 2022 16:09:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C94F5409E3;
	Mon, 26 Sep 2022 16:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C94F5409E3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4237F1BF327
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 16:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D33E40BDE
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 16:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D33E40BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EvXpcj64Pa-Y for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 16:09:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26F4740B9A
Received: from a1552.mx.srv.dfn.de (a1552.mx.srv.dfn.de [194.95.233.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26F4740B9A
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 16:09:04 +0000 (UTC)
Received: from jessica.hrz.tu-chemnitz.de (jessica.hrz.tu-chemnitz.de
 [IPv6:2001:638:911:b0e:134:109:228:65])
 by a1552.mx.srv.dfn.de (Postfix) with ESMTPS id 5585842005E;
 Mon, 26 Sep 2022 18:08:59 +0200 (CEST)
Received: from [2001:638:911:b01:134:109:133:20] (helo=mail.tu-chemnitz.de)
 by jessica.hrz.tu-chemnitz.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mario.haustein@hrz.tu-chemnitz.de>)
 id 1ocqfC-0099jx-T0; Mon, 26 Sep 2022 18:08:58 +0200
Received: from frettchen.hrz.tu-chemnitz.de ([134.109.228.189])
 by mail.tu-chemnitz.de with esmtps
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <mario.haustein@hrz.tu-chemnitz.de>)
 id 1ocqfC-00CGXr-JH; Mon, 26 Sep 2022 18:08:58 +0200
Received: by frettchen.hrz.tu-chemnitz.de (Postfix, from userid 53682)
 id DF137119; Mon, 26 Sep 2022 18:08:56 +0200 (CEST)
From: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>
To: buildroot@buildroot.org
Date: Mon, 26 Sep 2022 18:08:49 +0200
Message-Id: <20220926160849.1046939-1-mario.haustein@hrz.tu-chemnitz.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220902222849.1098641-1-mario.haustein@hrz.tu-chemnitz.de>
References: <20220902222849.1098641-1-mario.haustein@hrz.tu-chemnitz.de>
MIME-Version: 1.0
X-Scan-AV: mail.tu-chemnitz.de; 2022-09-26 18:08:58;
 cfc20aff379257d9faf91c8cb2b084f2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=tu-chemnitz.de; s=rsa-dkim2022; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lFgFrLaChx8UU4i4SuuP0sj1zmTvZzEZXNWXe0l9qoA=; b=A6YRmsK4G7MdRjVYY70CIlcsmz
 d1TM/FyGfLZ8i6ubBFno76mx7Q9aGSnDm//gcDa114ryh2JHb0d6eBHF1R/4gtiQi8+lDZsa0so2W
 w8yD8cP3Oyxcn9DyeesIkbc1YYbsQnZXCZfNo9uauoTnMRdO0ftPIjiOOqd6SRtlqecRojhz6I4Op
 1w2SmkKD8JkwmI7Rvdjh/Uw1Aa+5y/ylF5yzjADusWZ9Fosi4N1E0ukw4eAS8JR0iFwG/B3bJ3VLr
 Fh9Qyu/4GH187RAzR8BPPTdYJdXnOLTGVdLEI2vLeU+j1cMTvetlwjkdBnsAJzB1DYMlxJ2wDxnDF
 9qHRPLzA==;
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=tu-chemnitz.de; s=ec-dkim2022; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lFgFrLaChx8UU4i4SuuP0sj1zmTvZzEZXNWXe0l9qoA=; b=5NB7ljAqD86EA1V8Cni8imfJTH
 YCvYI03P4ZvpjcvU4VE3Wi++vf3R909osOmAPKN9iq+SgCkNkQB6onUBx4Aw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=tu-chemnitz.de header.i=@tu-chemnitz.de
 header.a=rsa-sha256 header.s=rsa-dkim2022 header.b=A6YRmsK4; 
 dkim=pass header.d=tu-chemnitz.de header.i=@tu-chemnitz.de
 header.a=ed25519-sha256 header.s=ec-dkim2022 header.b=5NB7ljAq
Subject: [Buildroot] [PATCH v2] package/dcron: fix /etc/cron.d/system cron
 jobs
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
Cc: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>,
 "Alvaro G. M" <alvaro.gamez@hazent.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jobs with the syntax @hourly, @daily, ... were not executed since the
version bump from `v4.5` to commit `1ba33c3325df48de46263276a43ed76cf9d81518`.
This patch fixes the bug downstream.

Signed-off-by: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>
---
Changes v1 -> v2:
  - Use `git format-patch` to export the patch
  - Specify the version bump which broke dcron in the commit message

Signed-off-by: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>
---
 package/dcron/0002-system-crontab.patch | 28 +++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/dcron/0002-system-crontab.patch

diff --git a/package/dcron/0002-system-crontab.patch b/package/dcron/0002-system-crontab.patch
new file mode 100644
index 0000000000..95d9606b7a
--- /dev/null
+++ b/package/dcron/0002-system-crontab.patch
@@ -0,0 +1,28 @@
+From 1fd99b71b063b1573beaf9f6b801ec5be2fbe24f Mon Sep 17 00:00:00 2001
+From: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>
+Date: Fri, 2 Sep 2022 23:20:14 +0200
+Subject: [PATCH] Make @hourly, @daily, ... work again
+
+closes #15
+
+Signed-off-by: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>
+[Upstream status: https://github.com/dubiousjim/dcron/pull/35]
+---
+ database.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/database.c b/database.c
+index 37cf17a..6ec720e 100644
+--- a/database.c
++++ b/database.c
+@@ -455,6 +455,8 @@ SynchronizeFile(const char *dpath, const char *fileName, const char *userName)
+ 							line.cl_Days[j] = 1;
+ 						for (j=0; j<12; ++j)
+ 							line.cl_Mons[j] = 1;
++						for (j=0; j<7; ++j)
++							line.cl_Dow[j] = ALL_DOW;
+ 					}
+ 
+ 					while (*ptr == ' ' || *ptr == '\t')
+-- 
+2.35.1
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
