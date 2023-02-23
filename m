Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06AEC636D6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 10:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8403B821BC;
	Thu, 23 Feb 2023 10:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8403B821BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cV4r1Rsj5Qt2; Thu, 23 Feb 2023 10:20:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1736821B6;
	Thu, 23 Feb 2023 10:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1736821B6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74B0B1BF35E
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 10:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CFED4049C
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 10:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CFED4049C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A2ktEc-7qn89 for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 10:20:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AF52401F1
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4AF52401F1
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 10:20:29 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id bo30so9692947wrb.0
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 02:20:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=avtrzPX35cx6ez6LvFrm9xOcGeSjo1O4V9AJam6FOnw=;
 b=U9wRv2HhEwD53IVvkksN+uEqgipJ6m5D/TycH7qTmiWeb8XAL1TuTDjja8EfgMLe3R
 X7jegNaiohNxxVQ/UXNDIchNAkq/MBy7Jkrj+Q9UiczZg2ENxsKFoQuqUlnBCYZWFtQ6
 xGRh8YXBE1CRRnNGmojav/ZFPlII/bTtUXr44VaBhV3KBSTJk6Te8hkWP9CKul7+pw5B
 HX8tzF/Ltf4gDrQaYDt0S3dkKNWRFTGQ0ecq4ATaGE3pyL43h5yd1KfoBh6AMpa90+ZY
 LwdihXX5dP27pYSwAJpkDFV8YTnSOU57v2Re9eRdvrd7OrcWk+uWWr5X57DEvDUkpXQj
 xKUg==
X-Gm-Message-State: AO0yUKXfkF0SvtGdJ4azf/Sefow9q4UbOELkaoiFqi0O7yN8yy3ctpSS
 ADTBTuzADlMC4A6Xhcx5HKmp96onacw=
X-Google-Smtp-Source: AK7set9O+veTik1AOA4b7xlCPO6qTt/vB4TrhBliV9n0Qhg7WgWB2tvsAwpILYYuawd17DZ4FZ6ezg==
X-Received: by 2002:a5d:5610:0:b0:2c5:8dac:fc5c with SMTP id
 l16-20020a5d5610000000b002c58dacfc5cmr10245332wrv.2.1677147627014; 
 Thu, 23 Feb 2023 02:20:27 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u13-20020a5d434d000000b002c55ec7f661sm8630944wrr.5.2023.02.23.02.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:20:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 11:20:23 +0100
Message-Id: <20230223102023.25489-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=avtrzPX35cx6ez6LvFrm9xOcGeSjo1O4V9AJam6FOnw=;
 b=b+kbuzq6WI5StKAA/LBu6tPcSZRqkOyvELEn4wka3AoCGyij5Ws9SC3n6fAdicn0/O
 KkeEWKfZmsPfhXq2IBzprjSE+jjdd/cOt7Rl3GaEfZcEXuQTWhogaWP6LEkoqSHxGbWz
 HLkLjaPujxlD5mB5QK7WEKGUqqvdLNXNx31GG9w3BgCoLmKq3qoJ0rqmoPgQIiukAMen
 RNF3M4VTegRCbuqAnH4HSy4OqK/0rkH/WgGtI6xRTDeuDjaNOLxbPslsYqYXVCvxRLnd
 ukBslB0kiYV0p4GKFS7Ae4tsy/Yfb0udc0hla6U0pB716O4tmIy76gp6m5NId9i5Qfoa
 zRwQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=b+kbuzq6
Subject: [Buildroot] [PATCH 1/1] package/multipath-tools: fix legal-info
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit b535fd2a093eca5e8967a5c8004da55f7295d101 forgot to update hash of
README.md (updates not related to license)

Fixes:
 - http://autobuild.buildroot.org/results/21bc3aa3e1b89ace5aebe771b8c34d5bd0cb9c3d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/multipath-tools/multipath-tools.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
index 3f01408c76..ecaad05e25 100644
--- a/package/multipath-tools/multipath-tools.hash
+++ b/package/multipath-tools/multipath-tools.hash
@@ -4,4 +4,4 @@ sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENS
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  LICENSES/LGPL-2.0
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1
-sha256  1e6095ac219062b8ddb2416d2a3cc40560619cd6b3ba609f5602bbd320413be0  README.md
+sha256  b8b4369c539d6a61ad2a5a359a1ecdfb9f630a89590216d490314e19bf07aa0c  README.md
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
