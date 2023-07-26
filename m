Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E81C001DF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 20:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AF9F40A59;
	Wed, 26 Jul 2023 20:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AF9F40A59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YGnxdE_aiwoo; Wed, 26 Jul 2023 20:29:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 659B24151A;
	Wed, 26 Jul 2023 20:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 659B24151A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17C5F1BF40D
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 20:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70D5141E4B
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 20:28:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70D5141E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pn0BqmBPXi-4 for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 20:28:44 +0000 (UTC)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB4E641E54
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 20:28:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB4E641E54
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-26814e27a9eso182461a91.0
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 13:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690403324; x=1691008124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fbi0ojYExVF8Pg3a5D07UV6hR3I7v9Y/RWp/h4bxr2c=;
 b=LjoGKsXfnldDCpT0LVES/Fw3K5fyrQzl4+VzrFFt9rDCRRPgp64Q89Urx8mYi34Ncm
 HZIsdrOPE3eTL5neAIa1z1GqI8OBBS2Bcx90ePGDTFrLawleyW8Yfy8qtIm0bappmD3W
 k9G7i3zBOk5GTpqaClBLUeasv0fArCxRANQ/lCr73XAL0zwA3/od6GmFcYZo2FPiDFJ3
 6qg/saE50FpiFbzj3l72kLFOeimIfa5FOTrG+zz2kpjhjMkqapZZWAgFyzcpqJFBkDqM
 hTmzO1BKz+DLKLfkmqpzMm2lhFYiqrPfamab/6wQxl/Ju176oW4NcIlAyJCZY1pq7H9L
 SrdA==
X-Gm-Message-State: ABy/qLZTMjk7SyK+nBr8w7aTR+SJWY9SYNv+uFeu7INuwil87B98oIWs
 Aj5CTROUchaodjMGFjIS2fEgTzdrbTU+kjCX9DsK/g==
X-Google-Smtp-Source: APBJJlFT8VP8F6616SlJphTFp2kExiBNaA2Roik9sOBFDNwCvjr499nONsTux4KfHsAWY7JnHKPuUg==
X-Received: by 2002:a17:90a:7041:b0:268:3f2d:66e4 with SMTP id
 f59-20020a17090a704100b002683f2d66e4mr2407437pjk.37.1690403324002; 
 Wed, 26 Jul 2023 13:28:44 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 v20-20020a17090a899400b00260a5ecd273sm29600pjn.1.2023.07.26.13.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 13:28:43 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 26 Jul 2023 13:28:38 -0700
Message-ID: <20230726202838.1931660-3-christian@aperture.us>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726202838.1931660-1-christian@aperture.us>
References: <20230726202838.1931660-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1690403324; x=1691008124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fbi0ojYExVF8Pg3a5D07UV6hR3I7v9Y/RWp/h4bxr2c=;
 b=0slAO9dwx6GK2VkCOd9VhjL2fLPgXTvFX1oQD9g41IeT8RqGomIsjYmIWOBB41Z4mM
 E7IiTyrfk6kDLfgm9w2CgIch7vpqQJtDWFwunRU+fDqlNgWuRbSg9JiYeUDmpZe/WrVN
 5O9XDKULpkJkC07/7IsyphIt1o/dYjqDwk85dlSlIpS0hIsewQcSbTDcZ9dJZiMwT762
 kvykV9jVtSThTKuSPIgP5pQlEVvQRmQoxRyzCsXyJn87NOYdEBax1M57QVGpmu96GZrl
 YUU2jRf2hqOTYmt3Ge0bH1cyPZrCfLBOlazxyObVaXFBUwpNau6yz4mt6ACczA0siHRP
 o2OQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=0slAO9dw
Subject: [Buildroot] [PATCH v1 3/3] boot/uboot: add host-python-pylibfdt
 dependency if needed
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
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If BR2_TARGET_UBOOT_NEEDS_PYLIBFDT is set, add a dependency on
host-python-pylibfdt.

Fixes a build failure with uboot 2023.07:

$ make uboot
error: pylibfdt does not seem to be available with python3

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 1a6e70a792..73ef204292 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -217,7 +217,7 @@ UBOOT_DEPENDENCIES += host-python3 host-python-setuptools
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)
-UBOOT_DEPENDENCIES += host-swig
+UBOOT_DEPENDENCIES += host-swig host-python-pylibfdt
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS),y)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
