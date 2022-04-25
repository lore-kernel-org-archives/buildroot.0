Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8403C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 22:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43ECA60F43;
	Mon, 25 Apr 2022 22:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TiQmVPIKzbga; Mon, 25 Apr 2022 22:08:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5129D60F35;
	Mon, 25 Apr 2022 22:08:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B13891BF314
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 22:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F6494161F
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 22:08:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id maN_Jiqjw-hD for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 22:08:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E6C8415E0
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 22:08:12 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 k36-20020a05600c1ca400b00393f18c8fc5so400343wms.4
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 15:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o3bbAfx/UcFxyq23Df1GqwLcU5ScFXD0nwCnVE/DW3U=;
 b=jpEEgLgaBHkSHq33aL7v/U1w26m0uMwpoHMNW2Yc+DPDCrn1FcDY5IP1DgHLE8KimT
 v8cV5o86jui2CHIGGFiX6stCSskpW61iUQuJqgeSRpV+ufQoOdAh3G1Q9oARw1416Z6y
 xFSfVUlKHxIK5JK0I7xUMzRiw4fRj6p6vAFXEIjut09M+EjZulsbe5KRa4S5SzvhXOS0
 WKAvB383zeyc0njyuFJzbPXbvb20E6FNbUXzoXjce7WsO6tIoIon7UtiHazR+7ZQhVnh
 k2qWOkZlSGb9Mt4DCTSWLVvF3PcPqgBZDC6YIsLYwpZ53mGFMB7ETNVLCOezjaTXh8CN
 rtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o3bbAfx/UcFxyq23Df1GqwLcU5ScFXD0nwCnVE/DW3U=;
 b=b/yHCagOwO6jKENO9N7f/SOcZNI3Q5vDPxZ9LAGBDSK9wsV7g5pzTcuQw5sfCUz+Nk
 +mz9S9qb+n0w55e5P6qKXZak1TOULOnDIo4zP3rxdIp6tJ6X6CY0Eflemgn7gp2QSDBd
 am2CBFUNWzi1vokkPyRToE0UY/jbTOz2vNCo6MYwkW2uR53Vrg4UAQDUdaweEbBt4LVC
 +CU9+/IwHMLTKt/c6krDQNd2DBvRxZ9pdg0Iunbwee9T6p4oAmOMSEnACzstUGZ3jQtq
 huWT6MK7p7NRJeEe1Zbb8A3i2pGt7wCraQGZT9RLwSnoL7CwmkpbmKY8CVxMGNvUDhXF
 1q2Q==
X-Gm-Message-State: AOAM533S3ydklcQk8SHAmVjNLy2bwAB9fAE1JzhyusxkwnxutiU0p6eC
 V05eFRCglzzNLIuV1nMJ6Vd2Pcc2y9Q=
X-Google-Smtp-Source: ABdhPJyyohQY4j6D5hfvz4sfSa/OX4Srab+0DSL10qvyLA/Qa7r1FnwEcnmiW7t8oSZS5IMN/14rIA==
X-Received: by 2002:a05:600c:4e4f:b0:392:ae18:2347 with SMTP id
 e15-20020a05600c4e4f00b00392ae182347mr25735100wmq.45.1650924490515; 
 Mon, 25 Apr 2022 15:08:10 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 h9-20020adfa4c9000000b0020ae2a771fdsm1067819wrb.72.2022.04.25.15.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 15:08:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Apr 2022 00:06:02 +0200
Message-Id: <20220425220602.1077854-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wtfutil: add CPE variables
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:wtfutil:wtf is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awtfutil%3Awtf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wtfutil/wtfutil.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/wtfutil/wtfutil.mk b/package/wtfutil/wtfutil.mk
index 6e841411a9..54fea09574 100644
--- a/package/wtfutil/wtfutil.mk
+++ b/package/wtfutil/wtfutil.mk
@@ -8,5 +8,7 @@ WTFUTIL_VERSION = 0.41.0
 WTFUTIL_SITE = $(call github,wtfutil,wtf,v$(WTFUTIL_VERSION))
 WTFUTIL_LICENSE = MPL-2.0
 WTFUTIL_LICENSE_FILES = LICENSE.md
+WTFUTIL_CPE_ID_VENDOR = wtfutil
+WTFUTIL_CPE_ID_PRODUCT = wtf
 
 $(eval $(golang-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
