Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC6F3C4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 07:36:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 805E26104F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 07:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 805E26104F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2498580E35;
	Fri, 13 Aug 2021 07:36:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DecLkdqluGvM; Fri, 13 Aug 2021 07:36:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9443580E3B;
	Fri, 13 Aug 2021 07:36:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7005F1BF8C7
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 07:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F47F40521
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 07:36:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 64WHezc0y241 for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 07:36:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C26BF4052F
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 07:36:41 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q11so11968870wrr.9
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 00:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HqKAGsmSG1V18Kg9hAekf0YdXEKiIOsfe49nSdkhXZg=;
 b=CIS/RZQMagA/dBbCB9qT/EotiOwsrUlyUAOCINgM09ojEoTsKO+XTtufhZjCKRzp3m
 ez/I8xrgEk0T7Oby35dQAFH2AioR6GnEThA5VFPvn4sABjzxNHGKJZDwwkix6dOYLXzq
 dIHKoJggcB1HYV9qNeTFsADmKUJS6uTjf6dPvw4Vezsg/8xCyQHrLRspSgAsVgCIb4xn
 cHHNXH6w1fD4OS7otN0Q1bYimkIts9BraFkJQpnsmjMgK2qJ9kzraY0ee36GQGim/ixO
 nGq0GHF9OXV4lPqr+sLltCT0LKp61yciyaBGsRb9vQxZQDWQNV+ATZOn+/Li1r7SJDaI
 0ZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HqKAGsmSG1V18Kg9hAekf0YdXEKiIOsfe49nSdkhXZg=;
 b=bHW00xITHVKRKqoE43W3E2pa2RvVExH2cVuPpfuteRUukyh0Ufrnz7F5A9//oBMZWB
 sQqd+10YtM9hZlKlZ/akScrZI7NuQnvyRuKWvMJJriA2ZGPBEtRLWcgw0cpmJDKcCZs5
 gDUkaGOxsyI2bP2OFHqu6Dwll4yZ0TBn23DoA4h+EXtQIMxDF5VVG6MpsArbTKmoldr1
 FqHCfvNTyj+phBcFi1oLPPAX0daNE8t29WJdkNtelWeyjVcmM+GZitK2xEfeHUxCwzqu
 w0qS/Lg49pLcujS7mRBGqhyvv92q/+D5+fXSbe2WQaELzTIfiDN6XRgtqLQqC4F8wq8V
 vs/Q==
X-Gm-Message-State: AOAM531XAixXLCq586lT1+4QijD7bVKjOTdD0QhHoooDv9nUWqGojpMA
 0hX3hF9qJctVsBPlFCSgvc1acdZvwzON6oJg
X-Google-Smtp-Source: ABdhPJyU983fWyPy/I0qBQUzTEkg0ULSwIUbCBNLqjYluF+yQMOUepSVVbqletxSVsWBAwmE2G5QeQ==
X-Received: by 2002:a05:6000:92:: with SMTP id
 m18mr1397949wrx.277.1628840199810; 
 Fri, 13 Aug 2021 00:36:39 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:9884:cf6b:777d:2dcf])
 by smtp.gmail.com with ESMTPSA id t8sm837178wrx.27.2021.08.13.00.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 00:36:39 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 10:36:34 +0300
Message-Id: <20210813073634.389426-1-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pymupdf: depend on python3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

According to the package documentation, python 3.6 or newer
is needed.

Fixes:
 - http://autobuild.buildroot.net/results/f857986b8c9b6d4a843f3694cae8527760540ed0/

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pymupdf/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pymupdf/Config.in b/package/python-pymupdf/Config.in
index 54714eb3bf..64a81895ea 100644
--- a/package/python-pymupdf/Config.in
+++ b/package/python-pymupdf/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_PYMUPDF
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mupdf -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # mupdf -> harfbuzz
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_MUPDF
 	select BR2_PACKAGE_ZLIB
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
