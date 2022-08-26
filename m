Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB14ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 13:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B94961116;
	Fri, 26 Aug 2022 13:57:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B94961116
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NdYQuEvd0xuB; Fri, 26 Aug 2022 13:57:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DBC461112;
	Fri, 26 Aug 2022 13:57:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DBC461112
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B2AD11BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98FF541A21
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98FF541A21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qWO_0XBW1Rh4 for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C70F41A0D
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C70F41A0D
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:19 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id r4so2195292edi.8
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=VBqbq+jnE1/s8q3g5PGrifeTSpkNpMsdEjCZNxHyNCM=;
 b=46S+ReGI7RdeNwvO5XIIwBE/b41/WecQJ5NRSFVPaamcJriO7NzbUlfes76HNWDy51
 MJb/yL4f0WWl1R3HM5Bpk2CDYg7onjacbXIAwtxLFOiVIQzSXMzavY4RS47epXwgdlsk
 /0PoCKdWWpCcsQiQbfOjWdmRn6/4gDpFgNOmTv/RfnjmfkqW69b4BHidF399745GjxBd
 GPtU9W5euBCGPv+1HpR/+R/0QWBoRGhegMxlvtCV1pqq2dJUQvmeIOTLMYMsuBtXDOPM
 3HBVmbuywYvBmEiVW9qeGxkAmiIqyiWOdv+nO6FS+isPo3n3fN6BbBG3WXikfKa00QCf
 MD3g==
X-Gm-Message-State: ACgBeo2M2KyypW3FAVDJP8UWrlTVYaALVEUbvZXRl7ygu8rB2Sr/seEb
 Rt/B+wEqoDToF7wX5dXdBYwye+FDEuKBfnYB
X-Google-Smtp-Source: AA6agR7Fl3b+55s3rLf71TvAn8BI/k1k0ZxlAmG1da2pFBbZBrqtrU/A0NdyxXe1ygH7nLtORgO5+Q==
X-Received: by 2002:a05:6402:447:b0:440:d482:495f with SMTP id
 p7-20020a056402044700b00440d482495fmr7191093edw.264.1661522117379; 
 Fri, 26 Aug 2022 06:55:17 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:16 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:54:45 +0200
Message-Id: <20220826135503.20612-12-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=VBqbq+jnE1/s8q3g5PGrifeTSpkNpMsdEjCZNxHyNCM=;
 b=ID3Tvg+Pi+oDEv8EaHyr+t9OblifPqVfiaDCGUuLd/5kmYrv40QcQodvuujdyS1K/2
 wUgQ7JZ9G3c8NiGa7YZWYchTEmwGoaUZvtoe4IybMroj6PF2FolnX9gyBukq/xYsgSJN
 SW4AqkvbYqnJs3Siw7LovrgnCEyc9HfyO9Ik+nOIBgrUAeYyjWZGnKZ7TGlT+lAssC3B
 fG+x9wyVcqf5KUJveMNtOhx36Ypm/E4TBa4GbQSIZ4eogtKGE62+yPg4asejbjJDtHuG
 snLPHXfMsv+bNi34iUUpmdLqad3cJ1JwawVC7eLVnT7+/zyHcDeUrZE8jh+jOe6H7eqs
 U+lA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ID3Tvg+P
Subject: [Buildroot] [PATCH v4 11/29] package/qt6/qt6base: add qt support
 for SSE/AVX SIMD extensions
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6base/qt6base.mk | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 21c15607d6..8bca29900e 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -35,6 +35,25 @@ QT6BASE_CONF_OPTS = \
 	-DFEATURE_system_zlib=ON \
 	-DFEATURE_system_libb2=ON
 
+QT6BASE_CONF_OPTS += -DFEATURE_sse2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF)
+QT6BASE_CONF_OPTS += -DFEATURE_sse3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF)
+QT6BASE_CONF_OPTS += -DFEATURE_sse4_1=$(if $(BR2_X86_CPU_HAS_SSE4),ON,OFF)
+QT6BASE_CONF_OPTS += -DFEATURE_sse4_2=$(if $(BR2_X86_CPU_HAS_SSE42),ON,OFF)
+QT6BASE_CONF_OPTS += -DFEATURE_ssse3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF)
+QT6BASE_CONF_OPTS += -DFEATURE_avx=$(if $(BR2_X86_CPU_HAS_AVX),ON,OFF)
+QT6BASE_CONF_OPTS += -DFEATURE_avx2=$(if $(BR2_X86_CPU_HAS_AVX2),ON,OFF)
+# no buildroot BR2_X86_CPU_HAS_AVX512 option yet
+QT6BASE_CONF_OPTS += \
+	-DFEATURE_avx512bw=OFF \
+	-DFEATURE_avx512cd=OFF \
+	-DFEATURE_avx512dq=OFF \
+	-DFEATURE_avx512er=OFF \
+	-DFEATURE_avx512f=OFF \
+	-DFEATURE_avx512ifma=OFF \
+	-DFEATURE_avx512pf=OFF \
+	-DFEATURE_avx512vbmi=OFF \
+	-DFEATURE_avx512vl=OFF
+
 define QT6BASE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(QT6BASE_BUILDDIR)
 endef
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
