Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02DAC30653
	for <buildroot@archiver.kernel.org>; Sun,  7 Jul 2024 16:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D68A815C1;
	Sun,  7 Jul 2024 16:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7GCUwgqrOqxq; Sun,  7 Jul 2024 16:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9966F815CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9966F815CA;
	Sun,  7 Jul 2024 16:46:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CCB1B1BF3D7
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 16:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B992360748
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 16:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jlzpxr7tDXaz for <buildroot@lists.busybox.net>;
 Sun,  7 Jul 2024 16:46:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8DB9E60637
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DB9E60637
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DB9E60637
 for <buildroot@buildroot.org>; Sun,  7 Jul 2024 16:46:08 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a77c0b42a8fso429143766b.1
 for <buildroot@buildroot.org>; Sun, 07 Jul 2024 09:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720370766; x=1720975566;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=temUnmidK43wx2L9tvz6DwIxcl1zHZwNQrDc5X0+e6c=;
 b=ZeZY8x155qCCgo8GyGRdxwMHtRUXLjVAFm4fb0jLcUz/tJnVrMWKcQ2CLVIOb9Nqwn
 +8FwcxRHkygXj/FJZrFIPFRrZ+npeJ6z6ZxFJFIoNnbWiexgPWPGtuWEKi13ui3vAh4t
 adBjaW3B3wjr3imW5Jz2lNXAuYIHPYHc67AHJ728Fbl8wclm/kzLg6k96r9D6U4PXhcK
 c5m8Mxi1hDl2/57VUEeoSMcbOKBX8owznoPGqputsPjA+V6R/SiohUul36S7P/B6yPgc
 tAqoOZ9Tvwcvb90u5ZEoyConeDr257XrVnYn2cTmDEkdDBfG4sr70S0r/acuNQDHySu5
 kBOg==
X-Gm-Message-State: AOJu0Yy8+hWrtru/T0y51wL8tK1XuZ3/c851opyDXLE1PRLHdS4GUn7f
 aQY782qwUG1BRM1CmJdg7FJW2tMPd+XPlx/5aHW2pbctFIrncl4YZWVhTA8wfLJnQBH9ukt/NPD
 /qsY=
X-Google-Smtp-Source: AGHT+IFVLgpnqRMInR9YuKzsh4pMUn1d/N3S4Od+wZByG5qaZuzyc2M6Bfu/eUEPfrGcWarTSc85bg==
X-Received: by 2002:a17:907:9953:b0:a72:64f0:552e with SMTP id
 a640c23a62f3a-a77bda06ae2mr665270066b.19.1720370766361; 
 Sun, 07 Jul 2024 09:46:06 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77be903eb6sm298715466b.23.2024.07.07.09.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jul 2024 09:46:06 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jul 2024 18:46:02 +0200
Message-ID: <20240707164602.320774-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720370766; x=1720975566;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=temUnmidK43wx2L9tvz6DwIxcl1zHZwNQrDc5X0+e6c=;
 b=Cc45SX7/BL+hCB8/WfIKDIMh6AzfBE10ctjq4cbp4F/64xzOHs7O0W7+2nl7vU5dvX
 f2xW0/7Zz8iG8vhmtWR1bb0LMd3IibuQRXOP9kLufeI0xnlsmZmgOnVr/5wZKPFJjI5U
 MqPlc63xUPRz/HHpKjiH7SnyPmdvaTOkDG9+E=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Cc45SX7/
Subject: [Buildroot] [PATCH 1/1] package/mediastreamer: fix patch fuzz
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, mediastreamer fails to build with output:

    Applying 0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch using patch:
    patching file src/utils/ffmpeg-priv.h
    Hunk #1 FAILED at 102.
    1 out of 1 hunk FAILED -- saving rejects to file src/utils/ffmpeg-priv.h.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...e-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch b/package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch
index fc66e9a9f92d..9fd3fda2eccd 100644
--- a/package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch
+++ b/package/mediastreamer/0002-Use-AV_INPUT_BUFFER_PADDING_SIZE-to-determine-paddin.patch
@@ -19,6 +19,8 @@ https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=901735
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 [Fabrice: updated for 4.3.1]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  src/utils/ffmpeg-priv.h     | 4 ++++
  src/videofilters/nowebcam.c | 4 ++--
@@ -28,8 +30,8 @@ diff --git a/src/utils/ffmpeg-priv.h b/src/utils/ffmpeg-priv.h
 index c0745a9a..d59ea0e1 100644
 --- a/src/utils/ffmpeg-priv.h
 +++ b/src/utils/ffmpeg-priv.h
-@@ -102,6 +102,10 @@ static inline int avcodec_decode_video2(AVCodecContext *avctx, AVFrame *picture,
- #endif
+@@ -115,6 +115,10 @@
+ extern "C" {
  #endif
  
 +#ifndef AV_INPUT_BUFFER_PADDING_SIZE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
