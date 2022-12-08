Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AC2C4167B
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 20:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D00940396;
	Thu,  8 Dec 2022 20:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D00940396
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hUFSnjvlA-Di; Thu,  8 Dec 2022 20:26:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5631401B7;
	Thu,  8 Dec 2022 20:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5631401B7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DFD6E1BF591
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 20:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B77C5401B7
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 20:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B77C5401B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 29_Bow5LgSpI for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 20:26:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FB00400FE
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8FB00400FE
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 20:26:19 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d1so3050108wrs.12
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 12:26:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I/pVVvTULQQsP1f1TwYrCvlCqCK9MDb7FrK2EMn9OME=;
 b=3wwaatF+OVuLSJBlzYl8DJalOuuFp3HUYORcp7BD8yzH2vuSUQbzDpyq49FmMB9inT
 5Iv6mtSZtRTuej+JAJN5gz2VMOaqVOn6ise3Bev2B2i6Irtba2kDit7SyvVYzdL+FLJJ
 hWUHgUqeijURj9p4PK9ZHxDXXziSXqhtspCL8MTtrG/fE+WlJhXWLbdz3c839jCrOVqy
 EIrAXL/wZXJQYq4msjIkvpcztxxNk7ZwqKab8jm1eLiV1DCpxoPOH0XvvQqRZ8p2L0hn
 1LZ6/8775eGaLHtbfmbGua+jQH8U+ls8vWMxLf3vOAV+bfzSTyQLn/PLfquo/J3Kzvqj
 fBTA==
X-Gm-Message-State: ANoB5pngqJ8FqSSXBI+fsHyUoB70IdsZ+sm61c1ru6Vgain9ljZbIpga
 1R2r8wecrX9/dQ/NWH7dKZpWZyJ+kFs=
X-Google-Smtp-Source: AA0mqf56GL+0Tx5IHiKNnRfnUc0yuvAU+O3uwK20fUeuqWGB5d0Ss+eZaawe6LOnP5zSepO3pe28WQ==
X-Received: by 2002:a05:6000:1565:b0:242:8af9:b987 with SMTP id
 5-20020a056000156500b002428af9b987mr2927769wrz.13.1670531177340; 
 Thu, 08 Dec 2022 12:26:17 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 m18-20020adfe952000000b002421888a011sm22906487wrn.69.2022.12.08.12.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 12:26:16 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 21:26:10 +0100
Message-Id: <20221208202610.5018-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I/pVVvTULQQsP1f1TwYrCvlCqCK9MDb7FrK2EMn9OME=;
 b=PkXn3solDao1fc+Lxp9+gU9G7llZ9uiUwAOUVeGESMojNP7yvMs6GZcAf7v8QVlS+R
 6cEQLkHA41vNap7Rs5Jmsl/dt6Os0iW4N8VUYMNIvcibtvDRbATYbjER/yReVTL3AFVs
 g9B8xfFadjGDb1QlXRRl5vNAb34n2FkQRRWC+I9CTrJPAPtehUq0n66PAETplsop8SSA
 0epQs5cUmaBF21Ffo41S+4Pc5dljy6E8Qu5jKzJgJybkxO+bF7FxN9gurioGw8H8tVhJ
 snR5UjCNOTy5d9kGlezXlsPXDESa2pLVwX0SlSFm219+Hve7d4yw2Z7uRj3OJPXaykzW
 JkiQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PkXn3sol
Subject: [Buildroot] [PATCH 1/1] package/libuwsc: fix wolfssl build
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libuwsc needs BR2_PACKAGE_WOLFSSL_ALL (which enables openssl compat
layer) to avoid the following wolfssl build failure raised since the
addition of the package in commit
120c04775d7ebe5a2cfc14848f5d11f3a333970b:

/home/br-user/work/instance-1/output-1/build/libuwsc-3.3.5/src/ssl.c:62:5: error: unknown type name 'SSL_CTX'
   62 |     SSL_CTX *ctx;
      |     ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/6c2a6ed6fca1f92aab299f6ed9cd900b20e8d512

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libuwsc/libuwsc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libuwsc/libuwsc.mk b/package/libuwsc/libuwsc.mk
index cad351529d..051ea411fa 100644
--- a/package/libuwsc/libuwsc.mk
+++ b/package/libuwsc/libuwsc.mk
@@ -18,7 +18,7 @@ LIBUWSC_CONF_OPTS += \
 	-DUWSC_USE_MBEDTLS=OFF \
 	-DUWSC_USE_OPENSSL=ON \
 	-DUWSC_USE_WOLFSSL=OFF
-else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
+else ifeq ($(BR2_PACKAGE_WOLFSSL_ALL),y)
 LIBUWSC_DEPENDENCIES += wolfssl
 LIBUWSC_CONF_OPTS += \
 	-DUWSC_SSL_SUPPORT=ON \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
