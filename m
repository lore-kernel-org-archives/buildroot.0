Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6367FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 23:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 005144021C;
	Sat, 18 Dec 2021 23:11:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5uN0RCdOI1VM; Sat, 18 Dec 2021 23:11:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A9D940204;
	Sat, 18 Dec 2021 23:11:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B306B1BF306
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 23:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1B2981C44
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 23:11:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2p-tQFXainvF for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 23:11:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6259781448
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 23:11:22 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 b186-20020a1c1bc3000000b00345734afe78so3995660wmb.0
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 15:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G+y1bLUqjWoFgExAIroinXK9axlzTv2fIg1OsupEO2s=;
 b=YUWUc0BcTI1mI3a5gbhdWStUVMovwGLVvngnINfCldsI2nMiJWlV7gHKriw0EoppFe
 yptLYN40pNgfmyZTrKsest0Clyl8Ua6L2ZLGx2JmxzmSE+z+RFig8JlnC0NfiDAY+NiA
 7pDd6VQRaa+xWMgHt5dN4Q9KKKJ3ZK+sRcH0CxwC4yAvuvErdNAMsroPmfHep9UK6te+
 QFKBZAUIaIyKYa9Fkl35uBCD+Sl+60KfNCvzhEwZq3ZbrTeRLsOcRCanMn94SXJh06uf
 FgECqpBGWhPkzM2qN5qBCTAu4bOZDTUefJ+dLEEJS1Tey5+aV260s6N0zObHUuDR90/i
 RtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G+y1bLUqjWoFgExAIroinXK9axlzTv2fIg1OsupEO2s=;
 b=6FYwso4T/iuHDqTUJsfUmxSbZvBnIV/L5R+7SBeXXrFiz018nspxyufCWfYblsTC4A
 YktslLTczP2NeFlTIT/Tv3+UaFvWNtSjkZTRYrYRIFOxn1o7Az/A9NpOfc8Ogk0qowDz
 crPmFxb1giExSJ1A378VBBxNFKoZzoKCOUwUDRq0CXCk/gGu04rmBVLVx27j6bJlThLE
 w/1aK6yq+0RWD7VHkkq5ayNeLRHS66PsTBPxVPINeGX/TvFX5yzaZYc4sw8laER2S4uH
 4AUpJRWyGCSEhlc7EEDWMroMENzEg9dX81E2Qfqz0X52Sua96u0BrJtRY5JWAZ1qnEjE
 Pgrw==
X-Gm-Message-State: AOAM533tnQJ0jYfaY0L/0iCLK3o4h9c5CHfizS++ULMLuDuxO20Ymcgc
 h8zevRPus4O84SLisLTtpjMjr2V5RBuUSQ==
X-Google-Smtp-Source: ABdhPJxLXGjztM3zLNTik1+DUQBMIWSl96s7ZjoA4Q6LeQFELKS5R0P8mn6D38VfEKXsnVj5qmT2rQ==
X-Received: by 2002:a1c:ac46:: with SMTP id v67mr15331954wme.182.1639869080370; 
 Sat, 18 Dec 2021 15:11:20 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id l5sm14833342wms.16.2021.12.18.15.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 15:11:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Dec 2021 00:10:46 +0100
Message-Id: <20211218231047.665943-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/imagemagick: fix dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS dependency was wrongly added to
BR2_PACKAGE_HOST_IMAGEMAGICK by commit
df20e4546384d1c249a6a0541183590671e83d77, indeed host-librsvg is only
needed by BR2_PACKAGE_HOST_IMAGEMAGICK_SVG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/imagemagick/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/imagemagick/Config.in.host b/package/imagemagick/Config.in.host
index e12d82939a..671b0995dc 100644
--- a/package/imagemagick/Config.in.host
+++ b/package/imagemagick/Config.in.host
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_HOST_IMAGEMAGICK
 	bool "host imagemagick"
-	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # host-librsvg
 	help
 	  ImageMagick(R) is a software suite to create, edit, and
 	  compose bitmap images. It can read, convert and write images
@@ -17,6 +16,7 @@ if BR2_PACKAGE_HOST_IMAGEMAGICK
 
 config BR2_PACKAGE_HOST_IMAGEMAGICK_SVG
 	bool "SVG support"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # host-librsvg
 	help
 	  Say 'y' here is you need ImageMagick tools (like convert)
 	  to support SVG.
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
