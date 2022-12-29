Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC30C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 16:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81C8C81911;
	Thu, 29 Dec 2022 16:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81C8C81911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IhP1MFvS9BoT; Thu, 29 Dec 2022 16:31:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E180281826;
	Thu, 29 Dec 2022 16:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E180281826
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 87FB61BF39A
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 16:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6296381826
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 16:30:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6296381826
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id umRzzhY1mziq for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 16:30:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A83381259
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A83381259
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 16:30:54 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso3331468wmq.1
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 08:30:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G8F7xTWB0f72ppfSqQDSx9ZyZmifT93+itgD8geM42U=;
 b=BCqdeXUXcnZevZCcZXoXrrciOZeYmMTiJWOHCPKkEXN2pl7KX9UNCjJ9cNKb+dQgpx
 GRnGHBqicu/NvO9KaEenbioWf7K9FG81KISPrFgUsAl3GioTrHebVNaPFlfasxo25xZc
 coT34QBPb7mJ11gz1Z1BdbPlYlEUcp+of4eoNCmxxMwxzZdd+FrYQa7NxcfZDwXZ+mvX
 7EDFJfUp8aWfV6ifiFKItNtH7y0U3MXiIcREyArxHUssV4CnQCUCieWszj4dQRGHuzq1
 4bSIsogi/lp/8rRblg0mzeUOAdaikFYWbfGw0Oo54uLnnh82GzsBrNy/cJ3dJqU3TzkU
 oU7Q==
X-Gm-Message-State: AFqh2krTrzmkOJ+og1RrA0YzLi/tfltArdKgmOCLKCbHKWMFuXoxrgF4
 R33gUhn0brpVvY30EZd/Knz42SllNFo=
X-Google-Smtp-Source: AMrXdXs5xwMsqO/DyzvKpbYjpru7tTYFv2DWzwSmk42XJYlvU5xyDWjvdHOXvInOuONLYvi6xJKF4A==
X-Received: by 2002:a05:600c:358e:b0:3d9:9755:d659 with SMTP id
 p14-20020a05600c358e00b003d99755d659mr3295390wmq.22.1672331452400; 
 Thu, 29 Dec 2022 08:30:52 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 f6-20020a05600c154600b003d98a7aa12csm12008020wmg.16.2022.12.29.08.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 08:30:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 17:30:46 +0100
Message-Id: <20221229163046.355738-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221229163046.355738-1-fontaine.fabrice@gmail.com>
References: <20221229163046.355738-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G8F7xTWB0f72ppfSqQDSx9ZyZmifT93+itgD8geM42U=;
 b=R6HPhr3SKmdoBKRrkCG1mEIVUuelX59FzpCwPpCJtLnG2Js7cUlBfX5KJXvmVm/tmt
 GhAXzqwY96pXRBWK82IP+5qRyBDNHiIvvltRi82NNo6JRZRttKXzhCKAtuRCDIYevPzD
 gY8cNyqAmD21gmP1jy6+pL7PWucrXo4YG58/GJQ8FgHC7VVr0gPG+dBAA8QETAWfh3fs
 G6r5TqLYBGH0YF97sBhWMliov+7fBL2HXQi+rKUzzjYShnGCNE4Be9deUxIlGLJnmjrh
 W93rGqJhbrzPh/ulgcUSpkaaySuX6m3WbB9Ela5/CZGAU6E/KlF3PBbSyF17925lpLrv
 TWKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=R6HPhr3S
Subject: [Buildroot] [PATCH v2,2/2] package/tiff: explicitly disable webp
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

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Explicitly disable webp

 package/tiff/tiff.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index f0b56150b1..d3ab50b79e 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -12,9 +12,12 @@ TIFF_CPE_ID_VENDOR = libtiff
 TIFF_CPE_ID_PRODUCT = libtiff
 TIFF_INSTALL_STAGING = YES
 
+# webp has a (optional) dependency on tiff, so we can't have webp
+# support in tiff, or that would create a circular dependency.
 TIFF_CONF_OPTS = \
 	--disable-contrib \
 	--disable-tests \
+	--disable-webp \
 	--without-x
 
 TIFF_DEPENDENCIES = host-pkgconf
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
