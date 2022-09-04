Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008E0ECAAD3
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 20:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 533FB81373;
	Sun,  4 Sep 2022 20:57:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 533FB81373
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5N5Do8rQGabn; Sun,  4 Sep 2022 20:57:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CDC381338;
	Sun,  4 Sep 2022 20:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CDC381338
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA9C01BF38B
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 20:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A543D81338
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 20:57:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A543D81338
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OQHgfpMZ-9EO for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 20:57:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A869E81317
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A869E81317
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 20:57:08 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id z25so10636387lfr.2
 for <buildroot@buildroot.org>; Sun, 04 Sep 2022 13:57:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=uwYJT8eUHrfScYhIptkRFjdh0WtK6+7qetddQUr0ZUA=;
 b=Irsi5Z3GkATx8tAuqG0ykDRugzuSo54FSWs2hM5vbSAgHXhk/I0Oe0JmpXW+DRagqh
 0i/VO6uGEeiN2V+0UuMaKNhNaJ578L5A8WzPpTIvXpF+U3oKFzZI+9f66wn71miOFS/X
 X+LDv73BYyMllodxTK5r8SyEwjtcsxCgzIJvcuXj7hjKE50x8TUjECs8fOBeLT7GwZje
 Pj+IFrAiZCjfhwi37sFkmFOx3BLEgNcY3AFtUKOaXNpBdxxpbTB7fIuPvT27nmWYbXif
 24BC5gzYjYuSujn5/8w6Gu5FzOvRPxWgUNhpyyXB7QinylF1jpcqbbijhINKoWnZC5/r
 K+7w==
X-Gm-Message-State: ACgBeo2WND4kjafWDOPh59M/00YqQEllQFud09C/kiDiLkiODR4Xcmwd
 XKvr6+XMCuQUK7M055EE9fXa49u84Ss=
X-Google-Smtp-Source: AA6agR4M3SwUeAVhiPdS1P8ubuR/Mk8UfOturu4tUVBEAcl2QpGTtUW050VnSpiBi3lNEhtj81Gllw==
X-Received: by 2002:a05:6512:3409:b0:48a:ef20:ddb with SMTP id
 i9-20020a056512340900b0048aef200ddbmr17142626lfr.597.1662325026178; 
 Sun, 04 Sep 2022 13:57:06 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020ac25e2c000000b0049468f9e697sm1013502lfg.236.2022.09.04.13.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 13:57:05 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Sep 2022 23:57:02 +0300
Message-Id: <20220904205702.1488199-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=uwYJT8eUHrfScYhIptkRFjdh0WtK6+7qetddQUr0ZUA=;
 b=DcfMPBTtS/NLPX+dQIbcv46WeDc11Qxo3TXzBExstfxinM9gmpEG5ShcCaKGGFd8/2
 ItAJ+fVdoYVZYk0ieoIq2dJS2dGiKEkR/pI0w2AxFob458Ml62BAgBDVLfqzA8KOYMOm
 cfGFRtywBzse/N2r6iXXVbpjyqhNih499WFNAlHejtRmr+P7VdHvaSZcWM01tBauWSpX
 zvbG7+a5xmELIghJS6ZptWyNFuzcdWxRr8d3MkGrFGXDqjh19/o5u0a8kpDdpySRW1H3
 9c/tpuA/61KMzzgJ4slhmPpNikLSda8AefonL/+k2aywzfXHHKu+DQsXykusyw7LJ2CJ
 lFBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DcfMPBTt
Subject: [Buildroot] [PATCH 1/1] package/linux-tools: perf: add host-python3
 dependency
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Linux kernel commit 00facc760903 ("perf jevents: Switch build to use
jevents.py") switched to auto-generation of arch-specific PMU events
using python script. Now custom PMU events for different platforms of
the selected target architecture are not embedded into perf binary if
an appropriate host python interpreter is not present. In practice it
means that perf is successfully built, but 'perf list pmu' will show
no custom events on a target platform even if those events are supported
and properly defined in tools/perf/pmu-events/arch/<target arch>
directory in the kernel source tree.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/linux-tools/linux-tool-perf.mk.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 057c6f80e7..44c1bbdf83 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -6,7 +6,7 @@
 
 LINUX_TOOLS += perf
 
-PERF_DEPENDENCIES = host-flex host-bison
+PERF_DEPENDENCIES = host-flex host-bison host-python3
 
 ifeq ($(NORMALIZED_ARCH),x86_64)
 PERF_ARCH=x86
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
