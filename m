Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC1BECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 967DE610F7;
	Fri, 26 Aug 2022 12:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 967DE610F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xu52Og8Ii8Xw; Fri, 26 Aug 2022 12:55:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA96360B9E;
	Fri, 26 Aug 2022 12:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA96360B9E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A28E1BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11D69610F7
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11D69610F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J1jDBfEq-IPR for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4211760761
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4211760761
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:08 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id u6so1960610eda.12
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=VBqbq+jnE1/s8q3g5PGrifeTSpkNpMsdEjCZNxHyNCM=;
 b=yQaVI9S4vm3PzTYAJEcQ0QXMJaxUQq9SFkbPk/Lp+M2uzL9exk54WwuXMCk3zF5s+y
 O4MmGWYuxUtbAae1Wdl4vohXygkobOSvbHJhtKNorGhFIgpe1ZdPkI3VqAMTWt08MSOI
 4S1gNmH5ZgKLW3SeZikmayOHIG/8wzoHTYWzh87JK4iUSZkshaiq0qddO8G28fiaj8Jr
 EIxSqvQu53lxynNUsazCINYpZb3B5+3pRdmnnPqA81oczZ5smrSat2LkDHRgJxcd9Pu7
 V1NcaXOSgVA7W8RD0aeJTNijjSL4vG7Q8G0wV9CpbFvyg6/8hW0di046R8bszlGPprmY
 9XuQ==
X-Gm-Message-State: ACgBeo0/5ne84Lzx34PI8IMrxlNSW04Eucaoi9Uy7QYDr35RuZ0aCkVl
 wv2p3/fhl4yV83/3m5HDarLVm9L4wIoZkGJF
X-Google-Smtp-Source: AA6agR6vjhqEmx1xkPaXkhK9DDlzG0vhcoReiPz/RBp7QhrTM232VM5B2JgPW1DscQpcL9qBEDG+2A==
X-Received: by 2002:a05:6402:350b:b0:43e:f4be:c447 with SMTP id
 b11-20020a056402350b00b0043ef4bec447mr6845567edd.427.1661518387348; 
 Fri, 26 Aug 2022 05:53:07 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:53:06 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:34 +0200
Message-Id: <20220826125252.16782-12-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=VBqbq+jnE1/s8q3g5PGrifeTSpkNpMsdEjCZNxHyNCM=;
 b=JP7f+6R+JkcRKmt1IYBBp5d0qa7nnScBDu4MFuKBqk4GQ9r8voHGS7HJmB12zbqsjS
 eC0/61/pm4LA6v5uMVwqKpH6OAdZn+ix8sn1QqPX594EotwpzVDzVYSZJb9Da/btbSyG
 AU3PJOlr4QjeX6Rn/AYWgy9/ddwjgnFHzQyhC2z0pStGG2FGX1JrpLf7DREoNbczx2Xm
 vKVnCsxpU9Gfkx8FJqF6M3O7gviNI1Y+O/dW+zwecaxL8G2PzlpO385EcRTzoqi+GX2n
 uJQ5lomiwPtaF0/5i2WE90uaHN+Kp8GT079iL/tPNQ1OAo+EQcVCrwEjTYtMNMTKZVSv
 4vQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JP7f+6R+
Subject: [Buildroot] [PATCH v3 11/29] package/qt6/qt6base: add qt support
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
