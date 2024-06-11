Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2C2C27C65
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 18:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68CBB60B51;
	Tue, 11 Jun 2024 18:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h2Q2FhhzdVk0; Tue, 11 Jun 2024 18:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DB9360B54
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DB9360B54;
	Tue, 11 Jun 2024 18:01:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B2751BF312
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5729B60AF0
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:00:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D7Ls7FfEFQaD for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 18:00:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=cdimich2188@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D804D60A7B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D804D60A7B
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D804D60A7B
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 18:00:49 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-705959a2dfbso84592b3a.1
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 11:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718128849; x=1718733649;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rGl02WLdZxRPHlZlQOEflSTmuw6B7pJPmNhlHtqlnKY=;
 b=FrTQS9IvdMP1zNUW3j39OELtTiQYtlixu988L9ZWhnOuFKyRFSDUyRUvlkQGw0jMWU
 EHhFA13SvvZgFxEXHazxs6cWmjekf0cOCsE3rYqNX6eQppMo9xCvcvQDsoIXK1CaaZUa
 ivTepNWMVw5K55nKq7zROaCDLSyDSe88c288PU7BlPIImZZIYtGogiA/tCCAqxITHG28
 5YMr4BGnaNm2waHuaClE9etR/HSbuH1T7Mjqevq3Oct1lKqRNhG8zkodt8BgScGTi1CT
 cdR1+ewXVaoac0AreeJqoGiNp+QNe2OJosiLF1vYjNP991/Ikf3/RH+XRqtGZGcEsmCl
 P61w==
X-Gm-Message-State: AOJu0YyEzbbJ1zXMAi4NTAnOe0r+A67a+FQGVdmnOUHvg+zgDZZKtD+J
 QbaWOXPehX69mDcpbpVPPbOutEMdVBq79SJi3QCDY5Y+CRBKdAOtalgCgQ2X
X-Google-Smtp-Source: AGHT+IEwNoedq37npl5rnhkzHxf9TMSXtsyfbmh698m9JDwGc6ogxjMVR1G4e90DxK0+4iidPf//mA==
X-Received: by 2002:a05:6a00:4b10:b0:702:5514:4cb8 with SMTP id
 d2e1a72fcca58-705a846ac60mr5210161b3a.4.1718128848807; 
 Tue, 11 Jun 2024 11:00:48 -0700 (PDT)
Received: from chris-jammy.lan ([136.52.56.126])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7041cff68d0sm6670410b3a.185.2024.06.11.11.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 11:00:48 -0700 (PDT)
From: Chris Dimich <cdimich2188@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 11:00:03 -0700
Message-ID: <20240611180007.2127244-9-cdimich2188@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611180007.2127244-1-cdimich2188@gmail.com>
References: <20240611180007.2127244-1-cdimich2188@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718128849; x=1718733649; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rGl02WLdZxRPHlZlQOEflSTmuw6B7pJPmNhlHtqlnKY=;
 b=PbE+0v5+VcxEAHElMNrrqAFYgvkWLZKbCtg7JwZxK951YHq6betLhRVNnuv1ZYKwwd
 Fc6HXyCfVKJvvVgiTKpZ3ymcicdz7g2Wr3XznK3bp7log3mPJAneuDxC9wRxTEnJJF8Z
 vfAyShYbWPq3h8LmpFl8/HtRf5DJzeAfAOzJkzMJ0BCf3D/YBG9X8It6TfpQNaMsge2J
 Wn0nrxuoAwJF+ZD5UbE5N49jFDvF3ZSku6+2nqIjfbVgJF7tTmlSVrxEsypKcU5k/FMh
 qvHNaRq4qzlcCuZhdjiuGjvqNCgP6MjvGmD6LwyGTSoeN3fjbLICft44RH54Z4gzMBDp
 QbwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PbE+0v5+
Subject: [Buildroot] [PATCH 08/12] package/freescale-imx/imx-vpu-hantro-vc:
 bump to version 1.9.1
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
Cc: Chris Dimich <cdimich2188@gmail.com>, Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- To match NXP 6.1.55-2.2.0 release.
- EULA/COPYING: update to LA_OPT_NXP_Software_License v49.

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
---
 .../freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash  | 6 +++---
 .../freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk    | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash
index bd9bc37c1f..1148081c5e 100644
--- a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash
+++ b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  62b5ba3c4aab21d0d4be3eee9b204a9bb50b83b6140ee1a3b27c648809bdfbaa  imx-vpu-hantro-vc-1.9.0.bin
-sha256  5bd7aab9dc380a6f9577443b2e90bd5ca73d9528175fad04b6d17da43a05a48e  COPYING
-sha256  654f0c4ce6d08f9a6d74e29c58206742cb7469a6a7c25413028a9bdbe647aa13  EULA
+sha256  84fcefa0619def2f009ca6651c5cffcda57fed29cd7060ef68be48c5d0d7814b  imx-vpu-hantro-vc-1.9.1.bin
+sha256  de37a0bcbf1717b910c1a53ea6eab853c404e61e8143bb6c081d39f532571e54 COPYING
+sha256  b158adaac5e2d1c7fa6e739ff168ab498957e3303070f1c0b0e66d9a8f02a354  EULA
diff --git a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
index 3d266fb5bd..de88ebf32c 100644
--- a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
+++ b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_VPU_HANTRO_VC_VERSION = 1.9.0
+IMX_VPU_HANTRO_VC_VERSION = 1.9.1
 IMX_VPU_HANTRO_VC_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_HANTRO_VC_SOURCE = imx-vpu-hantro-vc-$(IMX_VPU_HANTRO_VC_VERSION).bin
 IMX_VPU_HANTRO_VC_DEPENDENCIES = linux
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
