Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF552EB64DC
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 10:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63BCF41835;
	Thu,  6 Jul 2023 10:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63BCF41835
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kNP5tQRL9nQi; Thu,  6 Jul 2023 10:53:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69D634016B;
	Thu,  6 Jul 2023 10:53:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69D634016B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 335B61BF97D
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 10:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19F1981357
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 10:53:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19F1981357
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CZFiey7kZ64g for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 10:53:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADB158130C
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADB158130C
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 10:53:52 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-51d885b0256so851066a12.2
 for <buildroot@buildroot.org>; Thu, 06 Jul 2023 03:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688640830; x=1691232830;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=id5ttjj9tSHxxcDEQiex2IT29wjy30eP2179G7TWThE=;
 b=K4Fo6CLJrWUR2lX+krMofSVxEMDCM840Cs463J0wroydITwS3NkHB1t3AIIUGxzr4t
 FThggHVNTiV4J1mqilueZzIgtkTQTBip6FGRBPOlqtDogdaWXLNEVWxgx6oipDwyQRhE
 nKFklFveXliE9dlgwnPFQf3O89Au2MqcX0t8otKVG34yNwOo5NeLDKDrYkl58EYznt8T
 4r3vIcmiGNZ66tIXhwUAkueXLdolLVn+/lUZRxcapXk+C7iWbIVZ4B9RSAWGUxgaVlox
 3ZIfiEi3QBT3sSekztXZZW5Y/u6EbuloW9R27Aa18vaiCP2i4Z4R0DAaE1/jVjVRbuSu
 5THg==
X-Gm-Message-State: ABy/qLbbVY2fUid4o8totw1rM8Z6/5Z7oCMK7flbAH9AhAyb32/L0RZe
 CeZpbg8F2Q/P2s2y7BnTxVCNN3fGB1jFGq4v9Dg=
X-Google-Smtp-Source: APBJJlFl4QTeH2YwbLaFcMjgH/ThjBAY0aUiQL9rSoT8XQ+luROYxr5USprmslgshGAXMxxdumx2cA==
X-Received: by 2002:aa7:ce18:0:b0:51a:5c1d:5c06 with SMTP id
 d24-20020aa7ce18000000b0051a5c1d5c06mr1095229edv.42.1688640830574; 
 Thu, 06 Jul 2023 03:53:50 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-58-49-236.retail.telecomitalia.it. [82.58.49.236])
 by smtp.gmail.com with ESMTPSA id
 p4-20020aa7d304000000b0051ddfb4385asm630966edq.45.2023.07.06.03.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 03:53:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  6 Jul 2023 12:53:47 +0200
Message-Id: <20230706105347.229550-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1688640830; x=1691232830;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=id5ttjj9tSHxxcDEQiex2IT29wjy30eP2179G7TWThE=;
 b=PVuh5ujzBaHXj54YmqkngmzLPbStyUm69s/+S51pFGQv/tb4VYZs5M/idn6PMo35eV
 rTIdiwvwpJ1eZufFE+Lk/B5OdUlt65wBzsi8Tj2wW0PKoJhmwrrjm6VXLECeMYftGobs
 pGWjCC2dpx01tfgAdju+rEDSS4/nwfhTVdrDk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=PVuh5ujz
Subject: [Buildroot] [PATCH 1/1] board/bsh/imx8mn-bsh-smm-s2/readme.txt: fix
 typo
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It was a leftover from the copy-and-paste of the readme.txt file of its
almost twin sister BSH SMM S2 PRO.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/bsh/imx8mn-bsh-smm-s2/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/bsh/imx8mn-bsh-smm-s2/readme.txt b/board/bsh/imx8mn-bsh-smm-s2/readme.txt
index 37081091e849..6b8cd0319907 100644
--- a/board/bsh/imx8mn-bsh-smm-s2/readme.txt
+++ b/board/bsh/imx8mn-bsh-smm-s2/readme.txt
@@ -2,7 +2,7 @@ i.MX8MN BSH SMM S2
 ==================
 
 This tutorial describes how to use the predefined Buildroot
-configuration for the i.MX8MN BSH SMM S2 PRO board.
+configuration for the i.MX8MN BSH SMM S2 board.
 
 Building
 --------
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
