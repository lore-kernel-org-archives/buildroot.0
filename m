Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38E6C43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 12:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5593741A21;
	Wed, 20 Jul 2022 12:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5593741A21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UDT2kvcj585f; Wed, 20 Jul 2022 12:57:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 898BF419AF;
	Wed, 20 Jul 2022 12:57:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 898BF419AF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8661E1BF5A8
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 12:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 600C6419AF
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 12:57:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 600C6419AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PF7aZKgGJ0Yu for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 12:57:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E33341894
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E33341894
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 12:57:18 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 g19-20020a9d1293000000b0061c7bfda5dfso13714253otg.1
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 05:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UDxJqbyQav/RimIar1jYnxHNaGEFJant0wSGDmRxxQ4=;
 b=QC/UyMc5hws0fHNG37pZIbld/Y/KykQcpZn7CzxRqYjaJSgaPEa+Ts9fr2Hm6lIvLr
 dzuG8SryvTmww2dv3LgcSbcZlvnt1cPohkYwmgUOcrJGoYVOyp2PL/lBT09s8Ob8Cw7t
 4b27LyE9FyRL6woJgaYxLUDyxku42hebsuDC31C7Xe+TgZWS7fcZoXVnMnjA4UN0NOiW
 Hvnlb4uRRj9NteNzlMjUcz4ukHdyhz3uOVU6MNVAsJifphRpqRJTQ8oF8I27shwSjF0u
 l04AzXRgCfynGUY8wJkNj5cLIkZLRK/m+g0qVexKqoHEG7b11Pmny70mFHEclg/X6Is5
 vJRQ==
X-Gm-Message-State: AJIora/+arf+3iuytlBJNXTlGqBS6noNAB86ttVTFGsX0YKuq6hzlyMs
 3gv6RHW+XKYwWb0UdPURSjjD9mRh/TE=
X-Google-Smtp-Source: AGRyM1tiLAfZyLEMMUUdb6vXaUnhnIdk2/Wl6q4J/TEVVbKxgf+7se+Nzx7rmvgADZPx7X7rYJZ6Vw==
X-Received: by 2002:a05:6830:573:b0:61c:74e5:619b with SMTP id
 f19-20020a056830057300b0061c74e5619bmr14231807otc.376.1658321836611; 
 Wed, 20 Jul 2022 05:57:16 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:fdac:5513:311a:80ab])
 by smtp.gmail.com with ESMTPSA id
 m30-20020a4a391e000000b00420c4e021e8sm7300778ooa.38.2022.07.20.05.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 05:57:16 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Jul 2022 09:57:07 -0300
Message-Id: <20220720125707.1899437-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UDxJqbyQav/RimIar1jYnxHNaGEFJant0wSGDmRxxQ4=;
 b=LdZv8lSGINpZ8makRiHnn8Mzs+QoAfGuhoUiH0pfgflGYLNiTH4NItCkWyHTyvZrqu
 a5p9FrOaGxcQ/LW585pJapFQBqgXd1Bx0Q2OdX/vlgASOQW1xeQ2pi2Dm5QFhnwbobR2
 jJONs7I7VfW2283KRcc26AjzN77p1cHLxyPSYDXt+Jha1somJ4YzjWyHvhCmtR4YyJK7
 DTtnCvnGR/+vSva6Zk53SjhmsNNep9kskWyzoG4dsG2/3mHEsU707Fd7FZioZou2nFrQ
 OE9AaW/1aAolhqcNICXTGC2wyrK3G1vnlt0bNW8bG4UKnl2y5zbSVi8l7bJpc85io4ma
 3W1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LdZv8lSG
Subject: [Buildroot] [PATCH] package/crucible: Pass 'osusergo netgo' tags
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
Cc: andrea.barisani@withsecure.com, Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The 'osusergo netgo' tags need to be passed when CGO_ENABLED=1.

Fixes:

http://autobuild.buildroot.net/results/48a39341ca3dcb3675b2876e680718c3e43f55aa
http://autobuild.buildroot.net/results/897b4803f4f221c52899641a45708b49b7cb5f5c
http://autobuild.buildroot.net/results/3a75c6b73a1f583d6db666eacc45c4debd9218e9

Suggested-by: Andrea Barisani <andrea.barisani@withsecure.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/crucible/crucible.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/crucible/crucible.mk b/package/crucible/crucible.mk
index fdad709dde..fdcda109c2 100644
--- a/package/crucible/crucible.mk
+++ b/package/crucible/crucible.mk
@@ -9,5 +9,6 @@ CRUCIBLE_SITE = $(call github,usbarmory,crucible,v$(CRUCIBLE_VERSION))
 CRUCIBLE_LICENSE = GPL-3.0
 CRUCIBLE_LICENSE_FILES = LICENSE
 CRUCIBLE_GOMOD = ./cmd/crucible
+CRUCIBLE_TAGS += osusergo netgo
 
 $(eval $(golang-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
