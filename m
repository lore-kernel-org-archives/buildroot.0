Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A442CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36E57418B9;
	Wed,  3 Apr 2024 19:54:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pjGMh8-3ih8e; Wed,  3 Apr 2024 19:54:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACA74418A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACA74418A7;
	Wed,  3 Apr 2024 19:54:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA80D1BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97703607E7
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5lWkyOXulMpP for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:54:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 854C960751
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 854C960751
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 854C960751
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:54:09 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3438f079ff5so116163f8f.2
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 12:54:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712174047; x=1712778847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kjkx1G1Z9V1cO7Wriss47M8Lw39FZhZROiaI4y2hCfg=;
 b=CpLGL/1PRmAKhLtAVB5ceTabaJ/505YTiKxzUYAY0Kv4ASAqNoHkRkTkKlOgtDhQzd
 sxIzy8t7Q4MeyhJrpLkUmlN0hWluNRvU6tVeH2XdQGdlB3ToYSGGZo5y7yRWDvZlAfxh
 rGHXFkYfU0Ty3MTRnk5pdjSlh4muzDwX5+zPZqbv4BQbUFY146Rq/P28kpdLlrljXW60
 +z29t8ggQftzLmgRSfW97ifGer5Xvab6wERWjG9sdgkgr8ZIcWaMuRaQiVBJKgrvN0g/
 o6RbRMHRNBjiAhgM77DXjlKSWMQ7hIv0C2M7NaHjnB/rkphRC2xV2hJg0DPNAwVkbEfA
 P6VQ==
X-Gm-Message-State: AOJu0YwihSJGklwHZXuIAI4RSa1DS7SZXaJu6kF3oGgy8imvXGfk5q2b
 skM/prI6IEHXTiUAHpUWgCq3JCknAdXGbAUlHOqCNDeyANYiJf/LzZGLEGWSvqwTxYIKPiu5v80
 T
X-Google-Smtp-Source: AGHT+IEqxRtT828KzRL3xmbxIBpxZNnHyDTh3+FmKuPUYRof2GG4ri1WDR3MJheW4Nu4u6h9B3pJLA==
X-Received: by 2002:a5d:6385:0:b0:33e:c389:69ff with SMTP id
 p5-20020a5d6385000000b0033ec38969ffmr323156wru.68.1712174047412; 
 Wed, 03 Apr 2024 12:54:07 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 cc13-20020a5d5c0d000000b00341b8edbe8csm15595571wrb.87.2024.04.03.12.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 12:54:07 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 21:53:36 +0200
Message-ID: <20240403195403.1359007-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403195403.1359007-1-romain.naour@smile.fr>
References: <20240403195403.1359007-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712174047; x=1712778847;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kjkx1G1Z9V1cO7Wriss47M8Lw39FZhZROiaI4y2hCfg=;
 b=DgxcATPgiYhMK1uyK9xYV/e3cnnOKjBodBZSdUNph1nRB29F4UC4I0c21dGIYO3glW
 0Na56xo/38tiuw0XHtazd8UmLGFfAGb/y8tmcHXC7ySdm4QrsbVew4cBLm7TOb1HyTCB
 wgg5LGb29l+Rn2S1dm2jsyD6YaGlFsX3YWGMHTf1+1j0q2Lthf+JN4jOMLLV8w94ZRoq
 eVo3PG5y0MAq1Tk4LjAKOhR/AIKIRltFSzuFVL/g4PkYN02pA7aL44Pj5nuqWfsNpQhe
 9TbPs0B4qiT4oXTL7Aebd2QV7772PCbspQpmvwh8YoskzrlN/srzEt4dLrYAu9J4C5gZ
 MGig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=DgxcATPg
Subject: [Buildroot] [PATCH v11 02/17] board/ti/am6{2,
 4}x-sk: add arm-trusted-firmware v2.7 hash
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We are going to enable BR2_DOWNLOAD_FORCE_CHECK_HASHES by default
to enforce downloads to have at least one valid hash including
those that use a custom version.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash      | 2 ++
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash      | 2 ++
 2 files changed, 4 insertions(+)
 create mode 100644 board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 100644 board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash

diff --git a/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..74fe35c9bc
--- /dev/null
+++ b/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  327c65b1bc231608a7a808b068b00c1a22310e9fc86158813cd10a9711d5725e  arm-trusted-firmware-v2.7.tar.gz
diff --git a/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..74fe35c9bc
--- /dev/null
+++ b/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  327c65b1bc231608a7a808b068b00c1a22310e9fc86158813cd10a9711d5725e  arm-trusted-firmware-v2.7.tar.gz
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
