Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A618DC25B08
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 20:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B3A860B97;
	Fri, 12 Aug 2022 20:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B3A860B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cMKsVMDbYqnE; Fri, 12 Aug 2022 20:56:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58BF860B74;
	Fri, 12 Aug 2022 20:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58BF860B74
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 622C81BF354
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 20:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37FD04181A
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 20:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37FD04181A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QdpAdLYGU8ek for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 20:56:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 025E3417DC
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 025E3417DC
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 20:56:33 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id z17so2352541wrq.4
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 13:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=MfvoVcosWksr7MAOyicV6V/gEedgkgvW/D/KhXr6F9k=;
 b=Red2fo9NpOD1pLgmr5X5F/vK7o7CwSd8S0tNTTgDFHyKYf5Bj7euyzntQ3C3PX3GZJ
 ipZoDamWEKJQrCJk5eu1rnLbzsEQqq/4uQA4uAL4sp/kbAqvisbCNy0c0g6vR5zuj2np
 i5cip+wpiLKn2gPHWUiQJj5wMsAD1wQE/DXmBvaULDCtPONFXv/p76BTUSNfgR+c7pWl
 kMzakRYTZVA1z7ynpu9tcblGnypyH52t0kdto9FF79ArBH8QPWBMYznPht6CyUVutndS
 /yBRDqd16fm6M+vWmUnno96dyd3zpsq3Har9G7LwKT3Q+jZGTtWKjEqAZSJSW/1TnqSW
 t7bA==
X-Gm-Message-State: ACgBeo3E8Mu8//qQ6pN7usUCknB2CjLptc9OLZe4+6g+wCjAtsCBRMJV
 /bdikmm802D+LvVPPK3x67+SdJmSXWg=
X-Google-Smtp-Source: AA6agR5cMMqbwbJ9Zmg3wrFQw/op7B582xBnQr4xGBEt80loygiCfPczv13/ecVdiTPH4y3amqAfhA==
X-Received: by 2002:a5d:6c6f:0:b0:222:cdb9:f002 with SMTP id
 r15-20020a5d6c6f000000b00222cdb9f002mr3057881wrz.198.1660337791889; 
 Fri, 12 Aug 2022 13:56:31 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b0001a8063f329e0108.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:1a8:63f:329e:108])
 by smtp.gmail.com with ESMTPSA id
 d3-20020adfe843000000b0021edb2d07bbsm371034wrn.33.2022.08.12.13.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 13:56:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Aug 2022 22:56:23 +0200
Message-Id: <20220812205623.175869-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=MfvoVcosWksr7MAOyicV6V/gEedgkgvW/D/KhXr6F9k=;
 b=SiPDyXRJxjKc/UfdkvuWrGnRX54oR2jiwgj0o+j+DrSFA6/0vmKQ0cDZM+N3avWJad
 2rjoucpyoU/6uk50F0SjatSA8a09FlqLvojCVTznYL94/Va6iPG+HLk1gvAxON2diUUi
 kQQ8F2cc2WYTMZwvAILHAhJZ2JpdbHMvSBh+iaOsxp55FH9Nt8gE+Spj5vN6tR/zofCr
 cDctRsKl8n6HVAwukIVuy5GvA/236yK2vvxXbUCDddgffdbzMhS9wSqNlgmXqre25P2m
 cxoephm5+jI+oQYU++ChT2C1LNHUaXkxUneES8Gzztekxq3MC9aNbUTStLc7px/BLd68
 vaWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SiPDyXRJ
Subject: [Buildroot] [PATCH 1/1] package/jack2: add host-pkgconf dependency
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure:

Checking for program 'pkg-config'        : not found
The above check failed, but the checkee is required for --alsa.

Fixes:
 - http://autobuild.buildroot.org/results/cbdc251980f5571f75281202ebffc04ddecbf28d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jack2/jack2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 9e56dcdfd8..9d6a3b6479 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -9,7 +9,7 @@ JACK2_SITE = $(call github,jackaudio,jack2,v$(JACK2_VERSION))
 JACK2_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 JACK2_LICENSE_FILES = COPYING
 JACK2_CPE_ID_VENDOR = jackaudio
-JACK2_DEPENDENCIES = alsa-lib
+JACK2_DEPENDENCIES = host-pkgconf alsa-lib
 JACK2_INSTALL_STAGING = YES
 
 JACK2_CONF_OPTS = --alsa --example-tools=no
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
