Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E6BE77180
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 20:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0053B61323;
	Wed, 11 Dec 2024 20:12:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oamKGPTj4Xgt; Wed, 11 Dec 2024 20:12:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A4DE61324
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A4DE61324;
	Wed, 11 Dec 2024 20:12:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 56563113C
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 20:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 446D661324
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 20:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xmTpI-PrCQEj for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 20:11:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 831EA61323
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 831EA61323
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 831EA61323
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 20:11:59 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5401ab97206so3671515e87.3
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 12:11:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733947916; x=1734552716;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fXOXOop0fu10LfEthy5XOu7LTUZfPrmZeJ+5zzaxCxc=;
 b=mp/u/ZVY0tD5/sVlLPB8M406k36RJoOl3+0LDuT/g3pu5x4WGDeUYiP+qKNM5kbBpM
 IdL68LjG18/q0X2BMPUAc1GnWrOf9PXePk8hx+PWay/h9r5O48m3kM7TPQPFvz6aPa7W
 3tDkul3xmm+tmk1AAPwiRM3Ndordtof2JsAei/mp5VMOpKD26/jU52LmEHF2H934GAw6
 tlHACTAbwAn0UO8OvvzYG8LWM/dRsnYcm9XYg/JPyrBcFK3n9DglOGx2z4DeFN4/6emS
 ISzmTWeZGPiR1iGJiKz4cerf/7p/MnhCuFiPamxDyzSPQOwdsZrRow9JaMXtesQaJJez
 k6/w==
X-Gm-Message-State: AOJu0Yxth7qYF5Sxon3hpIf/t47x5M0sWC9eI84ZIqqlITnwHC+5g4hE
 kM56urYjBuZ64SP7rbfBmly0ACHqL7t9k1jsaBR67b9QvFRcl1As38fEZPEQ
X-Gm-Gg: ASbGncvCa4EkcGaKwT/T9DcOgRUYZD3LlFzeB1fnzdysnZyzBfljm4+iQEAklWPIfJb
 vJmEeWD/7UT5u0eEbrNMuLPcn1Zm3oK4pnzPvE289QNCJu/ebo4sLPZWCtpztKXPVIwtw7Rvukw
 FYQjTTEj0Z5TDdx+xtECW0QTfkrspa2Nad+w2Z84Siwf3hvryCTXX+S9oE1he2ycbViUCu+MqCL
 jPqCH6LdcUV8oMynMVmFj77IYVQUkhfS1LJthABFUCdzjOwjBd+Em/mWxlMTg==
X-Google-Smtp-Source: AGHT+IGlxasycip+3TwkoBwLbHGNyiVcRnSqJbj5OuLlbCWCrLUvgzYvgAi1oMcLRByTzdPyQg+4Aw==
X-Received: by 2002:a19:435d:0:b0:540:2a6e:37a8 with SMTP id
 2adb3069b0e04-5402a6e389bmr954329e87.39.1733947916350; 
 Wed, 11 Dec 2024 12:11:56 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.4])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-53e398cbf0dsm1638165e87.213.2024.12.11.12.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 12:11:54 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 11 Dec 2024 23:09:39 +0300
Message-ID: <20241211201146.4057892-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211201146.4057892-1-geomatsi@gmail.com>
References: <20241211201146.4057892-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733947916; x=1734552716; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fXOXOop0fu10LfEthy5XOu7LTUZfPrmZeJ+5zzaxCxc=;
 b=Ikj8k6W4T2imfNcxr9HJMyzi/13YfhYRdUROZfNd0kFGvJpbJCmqnpgxwmk+ppqjlW
 atKtJXwyle9J6/8TB0JN6CvRSQ9snX5nywfXS1NiIqb2dl2IW5jqZkJETjO0ByPgF2Ug
 Q8xILMqCwsGgg09qOuyq12DSx9aLs2mwlM/QSAJ+39mj4qhk8HAKfaqOP+ptk2X4AgCy
 MuDGcxprAaiuCosW/vDXfEde9MrVwTSxbH3+VT8asC+EUjrcBvt2203V/RXaZTY0s5Hv
 vwg0ateOkH4sjMGr45NZbvaxQ8GflhhLdoE9lqS1ftWukKn8Eszyy8yzBDesnEzWpVoM
 OeZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ikj8k6W4
Subject: [Buildroot] [PATCH 1/3] package/xr819-xradio: bump version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pull driver fixes for v6.9+ kernels.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/xr819-xradio/xr819-xradio.hash | 2 +-
 package/xr819-xradio/xr819-xradio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
index 388a3a3cd4..aec440c97a 100644
--- a/package/xr819-xradio/xr819-xradio.hash
+++ b/package/xr819-xradio/xr819-xradio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  8bc3d745ed08b7f3a9c0413c2635d0faf647362b41494d04edc98709b869deef  xr819-xradio-3a1f77fb2db248b7d18d93b67b16e0d6c91db184.tar.gz
+sha256  09cd694a9424e9fd61fbb323d52a9f721e0b2d364ccb40ed854a79bd927f5df2  xr819-xradio-180aafb14191c78c1529d5a28ca58c7c9dcf2c55.tar.gz
 # Locally computed
 sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  LICENSE
diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
index 8b576a347a..8a76570693 100644
--- a/package/xr819-xradio/xr819-xradio.mk
+++ b/package/xr819-xradio/xr819-xradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XR819_XRADIO_VERSION = 3a1f77fb2db248b7d18d93b67b16e0d6c91db184
+XR819_XRADIO_VERSION = 180aafb14191c78c1529d5a28ca58c7c9dcf2c55
 XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
 XR819_XRADIO_LICENSE = GPL-2.0
 XR819_XRADIO_LICENSE_FILES = LICENSE
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
