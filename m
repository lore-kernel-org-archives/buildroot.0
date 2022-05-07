Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED8CC433EF
	for <buildroot@archiver.kernel.org>; Sat,  7 May 2022 20:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28A6C408C3;
	Sat,  7 May 2022 20:29:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cJHdKuT6G2en; Sat,  7 May 2022 20:29:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F5504017B;
	Sat,  7 May 2022 20:29:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A2FB1BF599
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 20:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1229F409B6
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 20:29:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bdwBRfMZM4iv for <buildroot@lists.busybox.net>;
 Sat,  7 May 2022 20:29:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A7F940A03
 for <buildroot@buildroot.org>; Sat,  7 May 2022 20:29:10 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id bu29so17791613lfb.0
 for <buildroot@buildroot.org>; Sat, 07 May 2022 13:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NaK/8Oxin0zSpC8z66c+UM85oQaRdqJh/2LaZP1tZBk=;
 b=Y+RNU+BhCcix3TAx+vFG6CdjsCGB283fRt5lJQplhd27Gq3S8XNxHWNzKlVdnDGRed
 KywqpoxCEEIhtxX4gWR5eG3TiF6FPpG4Nc1U5QTKYLPZSgh9yyqDGgFEmOyrluZZc6p2
 m7x1w8BjLbIgybQMUuhVWTQfGceYvYndVBKBp79bg2b+/7WP/nPUNJWno8InYiqr5Stw
 E/ELHQFKwd9FOY4RQo3ilyG0sCL17cPlgjFLwivYsLUl3LH3vBm5MMPXAW6TxFhauiHK
 fuvhosLEQVOzBYnE2vO5dIcxwJ5r0zEQ0GXYpWyEB/B53/cI/e9HsSnkM0oRFTvDTJrU
 lc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NaK/8Oxin0zSpC8z66c+UM85oQaRdqJh/2LaZP1tZBk=;
 b=qWCiOs/8ySxW9Q9hit3xAIdQhgoAa3nE3zEpLIoi4ymEKgEEivx+Wio7GTalhhHjzf
 rUfCjMB0b/2HpHIcgLfPUIeVfZAx6gE/VSGVBySE+pPqAtE2tklPxBiG0z1pXvlnvats
 JXvyNMgqGpu9u5O00y8/3xbUq+AAAmxoROq0FzZJlXf/rHMK/A8vSkmK7GcQX++A3cwE
 oSt/+YjTKaM3vmMVYLFHcQqge4kEDNnGzaudic5S+wc9BqF5zdfCpYLEc1mPQ2wq1ugk
 93RgTVApmdwzhQ0uO+mChoUR7Ag6qMNJo1BagbvT64qI4QmAlp6Wc9FOUXbl5DT2t/H3
 Z2YA==
X-Gm-Message-State: AOAM533D5hYY3kzd/5BNOU9fSGo5oyQWIJKpf1fY0VdBwRFgMSruh9A/
 jzeX7P+OL9zAwP1a+bkZvni50qXZj1A=
X-Google-Smtp-Source: ABdhPJwrTD01zIqmnAxOe/4lHPHtDbm7D5egMiSxE5gy7B0fsCeG9V02lOwa4OknkKef9uP8kPXMCg==
X-Received: by 2002:a05:6512:3f86:b0:44a:f5bf:ec9a with SMTP id
 x6-20020a0565123f8600b0044af5bfec9amr7401946lfa.490.1651955347818; 
 Sat, 07 May 2022 13:29:07 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 a17-20020a05651c031100b0024f3d1daea3sm1150028ljp.43.2022.05.07.13.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 13:29:07 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 May 2022 23:29:02 +0300
Message-Id: <20220507202905.397732-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/3] xr819-xradio: fixes for autobuild failures
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Here are several changes aimed at fixing recent xr819-xradio autobuild failures.

Regards,
Sergey

Sergey Matyukevich (3):
  package/xr819-xradio: bump version
  package/xr819-xradio: enable required kernel options
  package/xr819-xradio: enable for ARM only

 package/xr819-xradio/Config.in         |  1 +
 package/xr819-xradio/xr819-xradio.hash |  2 +-
 package/xr819-xradio/xr819-xradio.mk   | 10 +++++++++-
 3 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
