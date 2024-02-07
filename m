Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B82AC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 17:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DBBA80CCE;
	Wed,  7 Feb 2024 17:39:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z3y5w6FjIfbZ; Wed,  7 Feb 2024 17:39:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5251680D20
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5251680D20;
	Wed,  7 Feb 2024 17:39:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D80F1BF868
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4834560BD2
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:39:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kAGWuO_8Z2wH for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 17:39:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 24D2B60BB0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24D2B60BB0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 24D2B60BB0
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 17:39:24 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40fdc63f4feso8579965e9.3
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 09:39:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707327562; x=1707932362;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K2Fpr2xIZXj+yKniatnaEDvjFwG3YEYrdXFPktrVhdQ=;
 b=H+epUV56GoqRc2GUK13i2aTeCJ89q60VSMt8m4lrysyUstgu7Ovl9OMmf+HAKo2u6P
 w6NLrYDWKgck7BLG/Zo6NLaOAgVieMuq6qMT4CPvgJfVM3Bj1yx92M5D+T1eNayW9jmH
 zPkq5Kt+ZCzFP64OeYZbgY/f6I4fN0OvwtrnvOfNDwQtjUJz7CxARVMjpybrs5h9P/mN
 n3In3XBNfdXY6Vzllfi9Xx20zW6/MTRNNLaDQjhjOcjdSTTYhNXWqJLLaOoWfjjeuMsi
 UZqiydA/UFJ4Zp0/E+WQpVLdswVOkMtlyC0DUPViYo3vIET5xdAAGFegI/UINKA68OSf
 E54w==
X-Gm-Message-State: AOJu0YyqGWHy++EJwcwX77a2J0MC0FrtPb0HvtqAGWp8N1gpJeP9pb7q
 smVHyUVoIhuTmDvynOSOYaAKRFZ3ErDS6jnJ/6PNdcczRakeFxeNcv2cxKmvOiFXcyon8JagAk4
 C8dI=
X-Google-Smtp-Source: AGHT+IEvZ6Wd9qE/vBqfkvIRCBe3s0sEtfjDd5h12XO6TU4fZbQ6U1MMZ+YmLGLU5CG5BWHPfuR3bw==
X-Received: by 2002:adf:f886:0:b0:33b:457c:4cd4 with SMTP id
 u6-20020adff886000000b0033b457c4cd4mr3826396wrp.55.1707327562246; 
 Wed, 07 Feb 2024 09:39:22 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWGK7I10HdjFqvPWFjqlN+d3PbHre+tD8RMXTtJp099+hzZqn4G8sl/Aj0muLJKdXKdiMIlSUaoU/LmkntyCy94WJInFRz5CA==
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (mob-5-90-63-114.net.vodafone.it. [5.90.63.114])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a5d6dab000000b0033b495b1d10sm1995975wrs.8.2024.02.07.09.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 09:39:21 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 18:39:11 +0100
Message-ID: <20240207173911.3704142-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1707327562; x=1707932362;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K2Fpr2xIZXj+yKniatnaEDvjFwG3YEYrdXFPktrVhdQ=;
 b=qtIw/PqJj19TqThdLc6OnX+p6IJxWdy87SjQvsCH1DXzlk3um7HhkYHN9oZDMyQ3+5
 OkfyHaKruOVdFmeNOTPRhBqCezj6as0F7uAr/TDR5Bt3L1ndV1HJ5x66X/PHu31knMmv
 2qypq7J4G6wgUOgIxN425EGq5fe9V8hqKrJco=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=qtIw/PqJ
Subject: [Buildroot] [PATCH 1/1] package/uuu: drop README.md from license
 files
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch drops the file README.md from the license files. Indeed, the
licensing terms apply to third-party libraries that uuu links to, and
even though they are bundled in the source tree of uuu|mfgtools, they
are not used by Buildroot as we use the ones we build. Therefore, the
actual license file of the package is the file LICENSE.

Moreover, this also leads to simplifying the bump to new versions.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uuu/uuu.hash | 1 -
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index c231d5d729f0..e45cbb868078 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,4 +1,3 @@
 # locally computed
 sha256  6e65fc028afacc94b805ae376e3da3864dcb2570d425037820e716207ab70373  uuu_source-uuu_1.5.165.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
-sha256  1b3d030a1824d633f75194743bd92bc1ed2d9a4bf1915bc11e49bf4c0c54012d  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 80d5e1937a97..5800277b10d5 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -8,7 +8,7 @@ UUU_VERSION = 1.5.165
 UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
-UUU_LICENSE_FILES = LICENSE README.md
+UUU_LICENSE_FILES = LICENSE
 HOST_UUU_DEPENDENCIES = \
 	host-bzip2 \
 	host-libusb \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
