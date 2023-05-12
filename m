Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7C4C77B75
	for <buildroot@archiver.kernel.org>; Fri, 12 May 2023 16:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7F1384917;
	Fri, 12 May 2023 16:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7F1384917
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cYNTIj-A3S9i; Fri, 12 May 2023 16:43:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D982F84AEA;
	Fri, 12 May 2023 16:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D982F84AEA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C041E1BF297
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 16:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A56654208F
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 16:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A56654208F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8GorUqKG-KWQ for <buildroot@lists.busybox.net>;
 Fri, 12 May 2023 16:42:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D22D4204B
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D22D4204B
 for <buildroot@buildroot.org>; Fri, 12 May 2023 16:42:55 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f4271185daso60468965e9.2
 for <buildroot@buildroot.org>; Fri, 12 May 2023 09:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683909773; x=1686501773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w3kkLawHFmperl0Ln9h5TbegS0h8ynX1KyuaNzu8OFw=;
 b=e9vu6HKksoJTXi774Qn5Xfk0h4cOsdUMJnx46KW+cQWeeJVkkpdV9LU3iPrmvgAG5E
 VLAHtmgyVrZnIgp2zeHq45K3Hacff+fJBP3vLAAjQ5jAyvF7ugORp66YM3NEcXMlvryV
 pSh8z+QdhYltrIGNtqs61LwEGzh28WsqOLbuEUr1DtibE7Thlqx94reoOs+6l3/i8CUy
 ErcxOQ+sIQeCasBrQp9GhD2dH3LUF/qjjvVz/IzR9Y/lI5yXtM5Bq4ABtr1hm3FAdkzx
 BwDEf6C37KFABvK9ZU24s6TCNiIpmvd1gqeKUfDWEakOGxxGwDPecXZNY8ieMimgPQT5
 5KcQ==
X-Gm-Message-State: AC+VfDzUXu5hhjTTHV61Idbp+Nj/qjgXU8gvwKKZfSnnfXA7JWB113SZ
 MUXjKiSHHirZAt34jYWkCIf8jxvMBYE=
X-Google-Smtp-Source: ACHHUZ6U4xbFwAoWeMv+uH88g0ncR3oZmsnlNXS7SAPHDSvY+QZzaxvVKYn6veTF6wdbsiz+dJjnZA==
X-Received: by 2002:a05:6000:10d2:b0:307:8e1b:6ce2 with SMTP id
 b18-20020a05600010d200b003078e1b6ce2mr13352376wrx.16.1683909772923; 
 Fri, 12 May 2023 09:42:52 -0700 (PDT)
Received: from localhost.localdomain
 (aputeaux-652-1-54-113.w83-204.abo.wanadoo.fr. [83.204.213.113])
 by smtp.gmail.com with ESMTPSA id
 e12-20020adfe7cc000000b002c54c9bd71fsm23952068wrn.93.2023.05.12.09.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 09:42:52 -0700 (PDT)
From: Gary Bisson <bisson.gary@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 May 2023 18:42:46 +0200
Message-Id: <20230512164248.3179932-2-bisson.gary@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512164248.3179932-1-bisson.gary@gmail.com>
References: <20230512164248.3179932-1-bisson.gary@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683909773; x=1686501773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w3kkLawHFmperl0Ln9h5TbegS0h8ynX1KyuaNzu8OFw=;
 b=pH7EYCNkplyhOzbDHMe1NZleGLxU1cK5PH+XABXk+CuhIOungDpG/SvpJr8NVTEvKm
 txLXpoehvY6C7vg00m9TlkzvxQy0cDQ6Pl0xnsLs7AE8/zrpswTyGj21s/qXEse8cxgB
 unuERi5k2T1AB2I5pDKN5fwYeb3zlBKZ5mifEue6rRTTmkAMkdr/WeDlEU4evvcGiK4Y
 YCPfjZaZzZUqSBJQF/+Io+KQVuUvpK4rgrSLxCSdzSKWJE7xYjvhtU1BCNaC2/FJ6cRR
 yZ3sBYLzr+62XdrSMMaMxjMLUi2hQcu+gq5AviEjYdQ+B5BVfyT3XI1Jyj9Gg1WggDiM
 WIIg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=pH7EYCNk
Subject: [Buildroot] [PATCH 1/3]
 package/freescale-imx/kernel-module-imx-gpu-viv: bump to version
 6.4.11.p1.0
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
Cc: Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Same version as NXP release 6.1.1-1.0.0
- Tested on Nitrogen8MP device with Weston (DRM backend) as follows:

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash    | 2 +-
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
index 5079de9840..528a4d4d9d 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  0754114b3088a46b9fee9a5bd1c7b9ec94b6ca656ed930c4cad9e04382e8e372  kernel-module-imx-gpu-viv-00fe5a0bedc07337c873f93998da9025083116ed.tar.gz
+sha256  7d5102dfb99172f440e957ea23bb755d99655d179efb348c3f17a4ae387ffd56  kernel-module-imx-gpu-viv-8c864975607cf455c5e95d5313aa00e69f48d32f.tar.gz
 sha256  0754114b3088a46b9fee9a5bd1c7b9ec94b6ca656ed930c4cad9e04382e8e372  COPYING
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
index 5c96ba0390..56724a4a98 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KERNEL_MODULE_IMX_GPU_VIV_VERSION = 00fe5a0bedc07337c873f93998da9025083116ed
+KERNEL_MODULE_IMX_GPU_VIV_VERSION = 8c864975607cf455c5e95d5313aa00e69f48d32f
 KERNEL_MODULE_IMX_GPU_VIV_SITE = \
 	$(call github,Freescale,kernel-module-imx-gpu-viv,$(KERNEL_MODULE_IMX_GPU_VIV_VERSION))
 KERNEL_MODULE_IMX_GPU_VIV_LICENSE = GPL-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
