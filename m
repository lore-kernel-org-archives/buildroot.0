Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9CFC7EE23
	for <buildroot@archiver.kernel.org>; Fri, 12 May 2023 16:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5230A84914;
	Fri, 12 May 2023 16:42:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5230A84914
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26MP2G07LXXm; Fri, 12 May 2023 16:42:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8686A847C2;
	Fri, 12 May 2023 16:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8686A847C2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 132A91BF297
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 16:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9ED641596
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 16:42:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9ED641596
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X6FpVcld8wkB for <buildroot@lists.busybox.net>;
 Fri, 12 May 2023 16:42:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 868AF404DB
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 868AF404DB
 for <buildroot@buildroot.org>; Fri, 12 May 2023 16:42:54 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3078cc99232so7042464f8f.3
 for <buildroot@buildroot.org>; Fri, 12 May 2023 09:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683909772; x=1686501772;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P6LjNYNuwohjbYTbIBKSdjTmjv79s+xu3BPi1N8KEGA=;
 b=JFY4tZuDPbytGu6ae2b/Dy9+CULROs9TQh2nKkn8BMr65K27Yb3gm4wscDr6P2aujE
 GqR1Kx2DLxiuHWbjNmDnVD7JXiiv896Om0TniICTINo0A5z0m8gw7vOMqoAfzbx9Lt5o
 BFpyDqWJbNLmMnyJohrLnc6uTDEe9V9STZRLBIruoisGm3SsMR5KYOpp/S6jE4NUvTrU
 VUzOE+0EjomoGCfzqmSy8ssdkNsXCIm588892RrLNExyg9NxJkYRh6hur536FLU2qSbd
 SOZZlaSDfdP/jJ8dDY1AtVXnSFpBwFKyP7H2EL8aLLReLegV9igdmY8JGQS+2B8CMyYV
 q3SA==
X-Gm-Message-State: AC+VfDzAj9n7kHvjQxKI8upueU7a5NG7ctd3yGzi6YR7aCXWPqjkcqnS
 raB9SCmURPBXT5ZXjOOXLo23lbnzCag=
X-Google-Smtp-Source: ACHHUZ76H92Wy+5AgVhYt1kfUQa4L0Bd0uWbieo3eBB1Jlnu9bkRWoinlxPypjGDnDPuXRX3vK+ddA==
X-Received: by 2002:a05:6000:124d:b0:307:8800:bbdd with SMTP id
 j13-20020a056000124d00b003078800bbddmr18228515wrx.64.1683909772378; 
 Fri, 12 May 2023 09:42:52 -0700 (PDT)
Received: from localhost.localdomain
 (aputeaux-652-1-54-113.w83-204.abo.wanadoo.fr. [83.204.213.113])
 by smtp.gmail.com with ESMTPSA id
 e12-20020adfe7cc000000b002c54c9bd71fsm23952068wrn.93.2023.05.12.09.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 09:42:51 -0700 (PDT)
From: Gary Bisson <bisson.gary@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 May 2023 18:42:45 +0200
Message-Id: <20230512164248.3179932-1-bisson.gary@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683909772; x=1686501772;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P6LjNYNuwohjbYTbIBKSdjTmjv79s+xu3BPi1N8KEGA=;
 b=of1q1y9O3Prc6IZFR3yqV3FJWjs8tivZza5vZSMnty39g9jtThpHQNX3YePxHinWZh
 CsS4hUJm0uqXfdNJ5jKlqeoGSS18gp2zJJr1OXSD4mV+OYp6HwmnG731Vmh1VwnuI0Go
 azwRaqN0flgrjBH1EzY7kfxLyjt4kJ2hGORqh5/T2g/KxWdeITceUcncx7kyL+Izq1JY
 Fsg8wfxkRFOE0KZjt0QZCb3FKNdOkWczWhuLkF8KcsUjxwTu9so+K6MhNhk8pf2Q1Wvq
 uNzg9Z3Tjv7Nbjy4oqZ10HHbWegqjv0el4TK4pf7U7qM/QihGh0XEKzZxs7AQ74LjSTy
 dmFw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=of1q1y9O
Subject: [Buildroot] [PATCH 0/3] Update NXP graphics libraries to
 v6.4.11.p1.0
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
Cc: Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

This series updates the 3D & 2D GPU suppot for the NXP i.MX processors.

The version v6.4.11.p1.0 aligns with NXP release 6.1.1-1.0.0 (Yocto
Langdale).

Regards,
Gary

Gary Bisson (3):
  package/freescale-imx/kernel-module-imx-gpu-viv: bump to version
    6.4.11.p1.0
  package/freescale-imx/imx-gpu-viv: bump to version 6.4.11.p1.0
  package/freescale-imx/imx-gpu-g2d: bump to version 6.4.11.p1.0

 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash        | 8 ++++----
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk          | 4 ++--
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash        | 8 ++++----
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk          | 4 ++--
 .../kernel-module-imx-gpu-viv.hash                        | 2 +-
 .../kernel-module-imx-gpu-viv.mk                          | 2 +-
 6 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
