Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE3FECAAD5
	for <buildroot@archiver.kernel.org>; Fri,  2 Sep 2022 10:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28BF380C01;
	Fri,  2 Sep 2022 10:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28BF380C01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b_grNzwqcbwT; Fri,  2 Sep 2022 10:37:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E31C80BB5;
	Fri,  2 Sep 2022 10:37:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E31C80BB5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 265861BF35D
 for <buildroot@lists.busybox.net>; Fri,  2 Sep 2022 10:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CA0D418FD
 for <buildroot@lists.busybox.net>; Fri,  2 Sep 2022 10:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CA0D418FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o7gIhdM57dDF for <buildroot@lists.busybox.net>;
 Fri,  2 Sep 2022 10:37:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19362418DA
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 19362418DA
 for <buildroot@buildroot.org>; Fri,  2 Sep 2022 10:37:52 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 n17-20020a05600c501100b003a84bf9b68bso1147268wmr.3
 for <buildroot@buildroot.org>; Fri, 02 Sep 2022 03:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=dfofA12Exgm7ClmbwIDra8dQPQuM157cVOMX/G/wgDQ=;
 b=wYyvtw3xwW5XNnC8smqIrbZ8cH+r9JE0YGRgnx16TDoR4soaCTtoaynYaq4uZHSRPt
 p2PzWXcMkcFjH+2+sTEUDBP8NiSMS16mkYw6FcCOSC0EQqEsIKvfq8EntiOon4f6g1kG
 YzPzk2Vty1E5fABk+NMQiLnWVoRQ72ALfWoqTsPQQKc+svH5S/Hvxp39LWEgmoRyeFWW
 yc88mBAaJunNfvzXJ4UcIpUntXq2qi7IY4Np/Gd3N/I64QXEIFLamZQwLtGEm2sa65fi
 bA5NbIH58gn749Wi3d4JhRT0luhEajCYFGXGwRU8YAdP6Bf+ecZni/wgmpcIBt4FP0nl
 Fppg==
X-Gm-Message-State: ACgBeo1M0G3LqtL9NCBbjNHikHV5lTYlDM+7EHFawTBicKmi5cgU3Pql
 uLERaU3y/Tzj+oKJ3lVqbQz19WeJz+rs5A==
X-Google-Smtp-Source: AA6agR63bfo+aOO1bagnmbKLHzcfNj5cnvafOP0O9pf+7sQifBeiGQiilC4eVZuLFdtjr3UpdRdV7g==
X-Received: by 2002:a05:600c:22d2:b0:3a8:3e8c:d914 with SMTP id
 18-20020a05600c22d200b003a83e8cd914mr2352185wmg.128.1662115069807; 
 Fri, 02 Sep 2022 03:37:49 -0700 (PDT)
Received: from gsm.lan (lfbn-orl-1-1687-169.w90-107.abo.wanadoo.fr.
 [90.107.233.169]) by smtp.gmail.com with ESMTPSA id
 j38-20020a05600c1c2600b003a5c75bd36fsm8783656wms.10.2022.09.02.03.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Sep 2022 03:37:49 -0700 (PDT)
From: Guillaume Smaha <guillaume.smaha@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Sep 2022 12:34:34 +0200
Message-Id: <20220902103434.3768420-1-guillaume.smaha@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=dfofA12Exgm7ClmbwIDra8dQPQuM157cVOMX/G/wgDQ=;
 b=lI2bxs4ZesBEhQoMiptHoCr1HF+ZRXhyjmxSgUR3sUF2MTL5BXrZauq9E7p/f/JpAI
 G23WheuMfBAPNhszSiIVlf977navKRFtDpfOUibxIT3fH7xgwrT/r3xOIaVWYMDYAd7K
 TleLwjEfDoicSawLpuR2Ic+GRHlX7AdlCoR7CCoj16Brg58ZbGmeDduoaJbUAI8zQRop
 MeAQ0vnHccXgP/BSd18cUb/6AUkwjLrHd9kTeHnbkoJS8ypzAdFZdLFkLxcVzO5TyQcM
 69k7Yk/Mw6kInoSiKca3kht4wTirlmhcTu58Rz9fA5bypYoLwvlgKR3cbC7yUvn+4RlN
 PdrQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lI2bxs4Z
Subject: [Buildroot] [PATCH] package/glibc: fix usage of
 BR2_PACKAGE_GLIBC_KERNEL_COMPAT
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Guillaume Smaha <guillaume.smaha@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As explain in the commit 525ffc2bb17fa11fc128124d2d3a92d8698eaab8:
"Say 'y' here if you plan on running your system on a kernel older than
the version used for the toolchain headers."

Signed-off-by: Guillaume Smaha <guillaume.smaha@gmail.com>
---
 package/glibc/glibc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 5af539ca62..4e4417b45a 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -98,7 +98,7 @@ endif
 GLIBC_MAKE = $(BR2_MAKE)
 GLIBC_CONF_ENV += ac_cv_prog_MAKE="$(BR2_MAKE)"
 
-ifeq ($(BR2_PACKAGE_GLIBC_KERNEL_COMPAT),)
+ifeq ($(BR2_PACKAGE_GLIBC_KERNEL_COMPAT),y)
 GLIBC_CONF_OPTS += --enable-kernel=$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))
 endif
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
