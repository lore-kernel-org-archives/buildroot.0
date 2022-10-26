Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5EBC38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 21:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B017405FB;
	Wed, 26 Oct 2022 21:03:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B017405FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9fCGc909cFKN; Wed, 26 Oct 2022 21:03:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 434EC405F9;
	Wed, 26 Oct 2022 21:03:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 434EC405F9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 19BEF1BF2C2
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 21:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 028D660DF4
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 21:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 028D660DF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hNUCy92FagEQ for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 21:03:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5BF960DF0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5BF960DF0
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 21:03:51 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id z14so15036938wrn.7
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 14:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4ke59ZyEneugHf1I3AW6jFjwy5Qx+I3Nc9USxteVoXo=;
 b=12GF4dNbprm0CXtVZmW8DBo6A61fYtnphvod4Eud3iQ5EOgIDFVNCqXdDIeZrgEZwP
 XYZEvmLfYxZWmKkeNr1+MKAr9uQ31+EoaaRim5oYtySVQpumlrzP4dSBo8Kp2orCMILw
 og+foGLQ+XMwu7Wk2BCW2pRRsfyb1+3eB+NWHgaR0F2AYeja/LWn1jjQb9eWgD7CsXc/
 cT+bhmqiCrXYWbgeiKcf6YLmPxeqBXr3GSn7A0GqQhkpkqvYm4AUHZ5XwKU69rPcSzHZ
 MrN8Y6QihQMt0b2z6e/ZHhXM3IV8zLCJlNVJ6GXtoKTgcAdLISgSgm5H36Bi3nIJ/pLR
 HQgA==
X-Gm-Message-State: ACrzQf1/h6sazy8v3yr9zDyTB4m+nOINsmIkcSY9y1QembfljD+E0zwf
 dIi4hWIpTQDkizlLk5pUcru1QqrK2vA=
X-Google-Smtp-Source: AMsMyM4nxaTqu04V7vSA0/exyCVmaatVYoLsVCqDGPbYS9ODX3IjDght2+rFMomaWqkmktaZhZKqOQ==
X-Received: by 2002:adf:d23a:0:b0:236:467e:a3bc with SMTP id
 k26-20020adfd23a000000b00236467ea3bcmr22949686wrh.542.1666818229774; 
 Wed, 26 Oct 2022 14:03:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 u17-20020a05600c19d100b003a3442f1229sm2881718wmq.29.2022.10.26.14.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 14:03:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 23:03:33 +0200
Message-Id: <20221026210334.565454-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4ke59ZyEneugHf1I3AW6jFjwy5Qx+I3Nc9USxteVoXo=;
 b=FSmyyGT/DNMcWHpg47NrxdkB5CkOsOWUfeXJv/uJBDY0TRMCXO1SmLETIK6kyV8wxp
 DoJnfLAQpuEHDeft8AFfEbcAsBJyr8nk293/g1Mpg9HmdT+dbGmiGgShVjcNCp/ciIkq
 0wF37dKFPePtCoSx1A1ELUYc6CBdkt6rRaxQVAD/KtOMAWoDWl5V1MqD+UBoRQEmEP+l
 20/otxVTTSdI1bXVLkoFEcYf8CYNGGAmmVSPT7wmRNL661CYgmBqa1XQ9QVfPrtaGm+M
 QwYSiUgudylz7wTJmML94uKM08Y8tg7asqze6Kjgrw1955OkztBGEa8Buyg8tQIuNuFZ
 fDDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FSmyyGT/
Subject: [Buildroot] [PATCH 1/2] package/shapelib: add SHAPELIB_CPE_ID_VENDOR
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:osgeo:shapelib is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aosgeo%3Ashapelib

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/shapelib/shapelib.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/shapelib/shapelib.mk b/package/shapelib/shapelib.mk
index bedd15dc35..52f9584e19 100644
--- a/package/shapelib/shapelib.mk
+++ b/package/shapelib/shapelib.mk
@@ -8,6 +8,7 @@ SHAPELIB_VERSION = 1.5.0
 SHAPELIB_SITE = http://download.osgeo.org/shapelib
 SHAPELIB_LICENSE = MIT or LGPL-2.0
 SHAPELIB_LICENSE_FILES = web/license.html COPYING
+SHAPELIB_CPE_ID_VENDOR = osgeo
 SHAPELIB_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
