Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B155CA1005
	for <buildroot@archiver.kernel.org>; Tue,  2 Sep 2025 21:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67FAF417FF;
	Tue,  2 Sep 2025 21:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RtiR0Dwdga8V; Tue,  2 Sep 2025 21:02:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E31541822
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E31541822;
	Tue,  2 Sep 2025 21:02:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C7FA3D2
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 21:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C529C40670
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 21:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ybTnuHESUVBO for <buildroot@buildroot.org>;
 Tue,  2 Sep 2025 21:02:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BE73F4066E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE73F4066E
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE73F4066E
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 21:02:12 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b04679375f6so7503166b.2
 for <buildroot@buildroot.org>; Tue, 02 Sep 2025 14:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756846931; x=1757451731;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qg4RTNoQMiOg5vJNmCmagkE3c4+HlqREEah6r9petMo=;
 b=sdp5EQEnWJMinN5EzGAo/pefcJX013w3qu4iyhBvBc7MYSkQukIylpY8QpP5EoBcT9
 dpqelcfQaeTaFbpL6ZVZTHnFxv0tkKsCF/07P9gRrQg9uOGiM9R2+xLjJrORbgu7VjMP
 oLHOQPbI/FTAfLkmNOMDg0rFS8CDUaGfMbvci5DXh7hsdAe5TJk4uD3nTiJkKVwRu+i4
 jhBeVnRIT549ItyG6F5c3P8heQDKa8w2HhYmLYyZS/U6a87kvBHf+f1f1H2/mw+y/yq4
 9XP7ctTQZkcPfaEfPnrqaREO3iUHXKHH/rQy0lo+GhwYm1wPjpQiVUt7CMSU06Q6GcpH
 Suhg==
X-Gm-Message-State: AOJu0YyR9O9lVXYVXlwazIvynwfxSDUj0GssPpID1t3PpuNHNUfLRNMf
 RCwId5ptZsBKoByQTZa83z+ZZAfTKXKaG0k16zR5ibkN9fWEdHvevFYpPVCTVWfU1bZEt9+4LVz
 uRiv3
X-Gm-Gg: ASbGnctggu9USVoGZFHRk/V6h2Q0WzSyASbmImtAs7jERUdSuFjp0bjzMryzpM5/FYG
 F46fmCdzO8HEKu7cJpdXnoFpDKKYT+ZV3T3ILf32SZBDNUGEaDAEePaS3W72SHFQbBkttt2YJqe
 XY8f+NFkUG75Glv+b6jHtABPr2m5d/TyYuo7XqISSfF3Y29ltDBGod0gMsE/Zn/MPi5zs2oKOGa
 ocfzTHd+Ze5tLOcxDVd1pXnMO4Y2dzHwpLYos4mztNLtC6s0bZTHvuHI/H1Rw1CvD7gR+zV+NDi
 C+sdf10bppjEiAcZ7VpvCOsOY7CimjYG8fSDQfil1l9HJ4/SMKRfjiOhw+8ds3NrxGOc1dziDIM
 YvJeEmVek+mLx2rimnQVlwQcE9uMyTxOALusU7sU79QjktAo36GqPJZDeZtX4rabQBxQAejctHZ
 pIewDdP/DVK01+4mvI3Aj6lyL5mLdbP4jq9XaTjuMc/tL6DOUT9ewc6OH2aw54k6W+P4S7CQ==
X-Google-Smtp-Source: AGHT+IFJvQqK1bKetWYPVedQHc6kU68eB8YK1X3UMCCs2APJgd+XDpWfy2ZfoONQCXEAuQA4HJkJQw==
X-Received: by 2002:a17:906:d551:b0:b04:4975:e648 with SMTP id
 a640c23a62f3a-b044975e81cmr444368966b.35.1756846930355; 
 Tue, 02 Sep 2025 14:02:10 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b03fa921a32sm859540666b.31.2025.09.02.14.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 14:02:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Tue,  2 Sep 2025 23:02:06 +0200
Message-ID: <20250902210206.668712-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1756846931; x=1757451731;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Qg4RTNoQMiOg5vJNmCmagkE3c4+HlqREEah6r9petMo=;
 b=YfdaYNqP+COcoLYYoxdtpl1w9lfDXmGciSGHfqmIPqPh2fnlpSbuPjLri1L4gKNeFL
 g/Xxeu6CrvnVsOo3WVTxLzBrn58P03nPVcjJmhiatuY+++Dns45VU3L19p5rQYf421TW
 SxtcXXa7gUoQkBsn4PXiWtj4Vl4OvO62+fDWE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=YfdaYNqP
Subject: [Buildroot] [next 1/1] package/armadillo: bump to version 15.0.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index 75f7837cbbef..54082447598f 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  ad1e2aa5b90a389ab714e2d00972ce64da42582b17dd89c18935358551e6e205  armadillo-14.6.3.tar.xz
+sha256  f520a0d50bbafccd7b9e793321cd7ffed374695c2e38bbdfd428841745e04c37  armadillo-15.0.1.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index d70601365197..5a125b99b34e 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 14.6.3
+ARMADILLO_VERSION = 15.0.1
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
