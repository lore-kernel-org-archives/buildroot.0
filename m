Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866E7C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 09:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50529606C0;
	Sat, 13 Jul 2024 09:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O1Rri6aH-8Bl; Sat, 13 Jul 2024 09:37:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC64A60FFE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC64A60FFE;
	Sat, 13 Jul 2024 09:37:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B93C1BF4D6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57B9341885
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MY5uvPU8xCaC for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 09:37:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=antoine.coutant@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6482241886
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6482241886
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6482241886
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 09:37:31 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52e9c55febcso3618314e87.2
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 02:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720863449; x=1721468249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s7FWdFbfpahe2pcQGjhCTU7XesyqMQiy2fQBxB7ydKg=;
 b=OBjLFU7FbSrAp2qM+QDlAOITFe/6A7wEnT9R1kdPHG00xxuvmaCsPyBfrQ/LHlen/G
 2Z76UDnK2i2vN96DqlETngCIK1/hWI96xpdK8X9a52f4pesvwXibSA9cfKoK2CP1uiTx
 kLQmp1y8iaxmxD+jCEQvx83tEOnsPtozdFmp318kPXLv9p8RLZjVKb5D3BoOv4rMCuhZ
 rIHg72ar6PqF0r/kn1nlRmvvJs0cdFI4+7UvRShizHPbDjRwJLK90zwALG7NVVBEf5NT
 V5amOKUVqmJ/7eC82lhZFo9csVWK8vJlZNmEFxJXwzdZMKiY5cJOAuhJ7xJryE+UixPe
 /4WQ==
X-Gm-Message-State: AOJu0YzHFpu8ETyW/FkkKJpSNZRd5MyY2F30Q8G0kw/MK/s3p+CtrbAS
 AXuQ2/FqBD/zR2pq//JLKD3k5O0wrpJB9cYKC9tA4fVChatEXvR3KH0wxXOBpd8Bw0xWb0YgLrq
 9
X-Google-Smtp-Source: AGHT+IHwq0s35SLy4YT0UAM2cwzSHKOC9zo+9dwB6hkSnPvCBDYwALMfTBw5gwEwhlli28Xq9sL1gg==
X-Received: by 2002:a05:6512:3b20:b0:52c:c9ce:be8d with SMTP id
 2adb3069b0e04-52eb99d6de0mr9537014e87.57.1720863449211; 
 Sat, 13 Jul 2024 02:37:29 -0700 (PDT)
Received: from antco-7390.home
 (2a01cb08994fdf00389d87faa24d1c32.ipv6.abo.wanadoo.fr.
 [2a01:cb08:994f:df00:389d:87fa:a24d:1c32])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f25abf0sm49065935e9.14.2024.07.13.02.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 02:37:28 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 11:37:00 +0200
Message-Id: <20240713093700.13981-8-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240713093700.13981-1-antoine.coutant@smile.fr>
References: <20240713093700.13981-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720863449; x=1721468249; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s7FWdFbfpahe2pcQGjhCTU7XesyqMQiy2fQBxB7ydKg=;
 b=lAvblkc8M32goYbZByWGAz6HuKQzAUKObIhAzJmQk8pdWW63uBuNQ+S2uwTA3T+4tq
 2gjTC7OwPRp5NHCVRiETu4DTOFyPV0ouflYikTqXJbhXUSqCwqXl/REc1rv9orEuPiTk
 +q8ABVdmteR8kkDuyxbtMqfTEyayp1CePuowM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=lAvblkc8
Subject: [Buildroot] [PATCH 7/7] package/mesa3d: remove the dependency on
 Clover and build it in ICD mode
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
From: Antoine Coutant via buildroot <buildroot@buildroot.org>
Reply-To: Antoine Coutant <antoine.coutant@smile.fr>
Cc: Antoine Coutant <antoine.coutant@smile.fr>, romain.naour@smile.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RustiCL can't be built in standalone mode. That shows that we can rely
on icd mode for Clover too.

This change adds more consistency between the two OpenCL
implementations.

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
 package/mesa3d/mesa3d.mk | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 7b1fc93a26..22ea19f401 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -54,14 +54,9 @@ ifeq ($(BR2_PACKAGE_MESA3D_OPENCL),y)
 MESA3D_PROVIDES += libopencl
 MESA3D_DEPENDENCIES += clang libclc opencl-headers
 ifeq ($(BR2_PACKAGE_MESA3D_CLOVER),y)
-ifeq ($(BR2_PACKAGE_OPENCL_ICD_LOADER),y)
 MESA3D_CONF_OPTS += -Dgallium-opencl=icd
 MESA3D_DEPENDENCIES +=  opencl-icd-loader
-else
-# Disable opencl-icd: OpenCL lib will be named libOpenCL instead of
-# libMesaOpenCL and CL headers are installed
-MESA3D_CONF_OPTS += -Dgallium-opencl=standalone
-endif
+# Always build clover in icd as it is done for RustiCL
 else
 MESA3D_CONF_OPTS += -Dgallium-opencl=disabled
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
