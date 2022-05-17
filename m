Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD016C4332F
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 10:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70A7940BE3;
	Tue, 17 May 2022 10:17:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3mHfuDTxWNtX; Tue, 17 May 2022 10:17:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95A7340BD1;
	Tue, 17 May 2022 10:17:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 216731BF28A
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 10:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EC7860FA0
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 10:17:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2crXt3nJzTSt for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 10:17:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8834060B61
 for <buildroot@buildroot.org>; Tue, 17 May 2022 10:17:20 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 t11-20020a17090a6a0b00b001df6f318a8bso1964375pjj.4
 for <buildroot@buildroot.org>; Tue, 17 May 2022 03:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RQmccILMRQKO4XweEc1yXaKwt2kqxG4n1c+uyu+fVmY=;
 b=4E6vzUUDl27OAzcwqy01HI5bN6t8GlyBu2cwj18bFAbtluVlMCyiO1sBy8w+P43uHS
 SKqyuA+x5jl0sBBwctpX+NmOMFnNGe9qsUGmi4RgZnha3On80MVbqS0yZbkrUNZKbLGH
 JkinDJrp0MprghsfZRAtIDjNiqnheWeXSnD4FpxxntFlZxDkxN5+xBFz8/C6PYIn1YP1
 NMVtwe0MCZkREZXCBA9SfIwAehXwCq8mL07swENOueJVhRiWI3hq1DwW/AlwdzYsF0BI
 CCvWYOPUiLG0QzB9qJshgS533I4f9bgr3IvqvawcXm2zB1nYlLDtaWu0Nl8x87pJK3+W
 5M1A==
X-Gm-Message-State: AOAM530wPNIJNZGV/pCS8G88Wn+hMyxV3nFbGPRII0s5hANdClthdldk
 gfh+dKrMdgena/eLEZigbp5yOe7ofJM5fQ==
X-Google-Smtp-Source: ABdhPJx1/9mbYwgqb+OKynDYZruPNknWEy3Lauw9LqTBF258aRGtcv/UsiCepkt4F3nRnIlYsGLU+Q==
X-Received: by 2002:a17:90b:4a4a:b0:1dc:4731:31a4 with SMTP id
 lb10-20020a17090b4a4a00b001dc473131a4mr24414624pjb.19.1652782639538; 
 Tue, 17 May 2022 03:17:19 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 c1-20020a170902c2c100b0015e8d4eb1easm8660653pla.52.2022.05.17.03.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 03:17:18 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 03:17:16 -0700
Message-Id: <20220517101716.3242793-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] boot/sun20i-d1-spl: update to latest commit
 882671
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Christian Stewart <christian@paral.in>
---
 boot/sun20i-d1-spl/sun20i-d1-spl.hash | 2 +-
 boot/sun20i-d1-spl/sun20i-d1-spl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/sun20i-d1-spl/sun20i-d1-spl.hash b/boot/sun20i-d1-spl/sun20i-d1-spl.hash
index bb2fd66c28..11d17a9a16 100644
--- a/boot/sun20i-d1-spl/sun20i-d1-spl.hash
+++ b/boot/sun20i-d1-spl/sun20i-d1-spl.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  3ef28affd35a37675d91d3ac50b85e3dfa356420005f69713df73c85798ff1d8  sun20i-d1-spl-4da9c518c124d6f6123bf274e449514863df3646.tar.gz
+sha256  08e2d0574e58c99734cd1d9ea89b86464242bf2db4f6769b23803bf9dcdac3c4  sun20i-d1-spl-882671fcf53137aaafc3a94fa32e682cb7b921f1.tar.gz
diff --git a/boot/sun20i-d1-spl/sun20i-d1-spl.mk b/boot/sun20i-d1-spl/sun20i-d1-spl.mk
index 3580ea4c25..6bcea0fa96 100644
--- a/boot/sun20i-d1-spl/sun20i-d1-spl.mk
+++ b/boot/sun20i-d1-spl/sun20i-d1-spl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Commit on the 'mainline' branch
-SUN20I_D1_SPL_VERSION = 4da9c518c124d6f6123bf274e449514863df3646
+SUN20I_D1_SPL_VERSION = 882671fcf53137aaafc3a94fa32e682cb7b921f1
 SUN20I_D1_SPL_SITE = $(call github,smaeul,sun20i_d1_spl,$(SUN20I_D1_SPL_VERSION))
 SUN20I_D1_SPL_INSTALL_TARGET = NO
 SUN20I_D1_SPL_INSTALL_IMAGES = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
