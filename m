Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E608BC433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 17:07:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4E6E61177
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 17:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A4E6E61177
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48B3280F64;
	Tue,  9 Nov 2021 17:07:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CivQX3ELLrZE; Tue,  9 Nov 2021 17:07:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA58F80F18;
	Tue,  9 Nov 2021 17:07:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F3AE1BF37F
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 17:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BCA880F18
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 17:07:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qUGoti_EwnJ2 for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 17:07:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77E1980F14
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 17:07:53 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 b2-20020a1c8002000000b0032fb900951eso2461978wmd.4
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 09:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QGM/kKSNPiFcqdgVMW4wQHvoErn7jITv1Pvz+jtkD0c=;
 b=cx9OuC5gux+PuMLedFacYJyEfJcniO/5lhUuowzmsEkxFmv4NuumCrU6KUqdJF4vjh
 /fd12eXrJ548PIqNDD2uooD2cNOdwIQqfkkjEzaf7Sbacs9F1YscAdsJhQ9bmyVrSRkb
 t6e5MVbcShNyzpqr4wZ5ovh/CpsH4LCWYSHETLul0hGWMDcAxagRjfttL+8x/WJZSYTY
 oXNb5+ogWXcMFOnMdjvEAd7E2g6sweft2oy0DXHJFOHM9M00+aZ9up3taDd1bORa5f9f
 0Dn5RPPF0Si25/SggTp9EigSdN4Tk+hNQAhn0KSQlkooMipEmf1s/s9EUoPyBLis6Ed9
 5ujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=QGM/kKSNPiFcqdgVMW4wQHvoErn7jITv1Pvz+jtkD0c=;
 b=tWzvWAFWhMXXFuoGhkN44xo5kitmdLN7LtnZ7kcphRGTi/LQyDf2BQwLwr7UNGyNtG
 2v3/OPpQV2tivHLxlThxsvvinQWLZz4d5v/7c983mfFAeFj/P3BiCjt6iGjUywyzus8i
 h4iy3dcqNAUYg8YMHaKdPWpdj7UsJG8pGBMMMYcFejt0P+U1YkL2IXWGIMLFENbhXz8k
 ZrI8i2Vbc8gXfLYyGSo+1FGCwy1eoHD5z6lfG277pz/I3Qa2+6u+6CaQR31qAcXXT5iq
 TAG7YE0Ev69czSFXIxBj1Xs1/anVQa8XHB+R+HOSIzB24bmo62TYkxAFpPp6bsKco0Oo
 0c4Q==
X-Gm-Message-State: AOAM533TxjNKJrx5YKo5+x8QI87W9JcZI8QckIE5kxfuWOT0U0TP/I2V
 TO5dT+x3ftfle46zlxEyhJpS8iP2bbk30A==
X-Google-Smtp-Source: ABdhPJzBC1OzJSPiEglD8lXuiMZAKyi+7oKBHUlP/RS1M3uXCv1sChCnt4+XN1shnHPYUS9+QN9liA==
X-Received: by 2002:a7b:c7cd:: with SMTP id z13mr8533668wmk.172.1636477671860; 
 Tue, 09 Nov 2021 09:07:51 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:710f:610b:602a:e07])
 by smtp.gmail.com with ESMTPSA id o2sm21524762wrg.1.2021.11.09.09.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 09:07:51 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 18:07:47 +0100
Message-Id: <20211109170747.1950418-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] Makefile: really comment syntax colouring
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The unmatched escaped single-quote lies in the middle of a few
function calls, so they too must be fake-closed to properly fix
colour highlighting in some editors.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 4062883cc2..6f6bb72de3 100644
--- a/Makefile
+++ b/Makefile
@@ -1068,7 +1068,7 @@ printvars:
 		$(if $(QUOTED_VARS),\
 			$(info $V='$(subst ','\'',$(if $(RAW_VARS),$(value $V),$($V)))'), \
 			$(info $V=$(if $(RAW_VARS),$(value $V),$($V))))))
-# ' Syntax colouring...
+# ')))) # Syntax colouring...
 
 .PHONY: clean
 clean:
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
