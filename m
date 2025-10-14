Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC48BCCD184
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 18:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C69D612EB;
	Tue, 14 Oct 2025 18:49:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jsRg3_F10RoX; Tue, 14 Oct 2025 18:49:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4EAD612F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4EAD612F2;
	Tue, 14 Oct 2025 18:49:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D749B294
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE0D44067A
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:49:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fDRfBaXcXYrA for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 18:49:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A587240362
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A587240362
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A587240362
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:49:01 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3ece1102998so3728279f8f.2
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 11:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760467739; x=1761072539;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3ow0eC8T3Uth7Qz9vj0PbhW6IKxCWTNr3dHvwXae1zU=;
 b=Op36DztgczgnuWrEl5Yl7EmuadkINezDik+QCuEvxSgI6DCZGhilQeprr41VEtGWvH
 t/Lj94HSrKXSr03xS3SnzHwEZ73bfpGqpoNGtrn7BJFAn2uqwFiHBCue9jC6bc9+pCFA
 r3mWx//NTcywH/7RGgrTgDLivGglYVrYnDmI7lFnOLQK/sa8iH4Cn26Fg/c3fu65qTh3
 PjpZS1m6HrFx3IulnqS2NSgtOcvLW3t459NBkiz/NBwxiql13kWOgdZRAFQpuZnoWyKv
 UWz9Lmjnldh0gGZEyzKYOXZSYXeQMR2GKH6RViV30fByG68IX/JCZyPoiydtl3nJgD5s
 pESQ==
X-Gm-Message-State: AOJu0YyhOMopSNMPc3sAi1Y6LT6bb2GsngInMAwHr+edX30fwuhePQsP
 lbGPqrUGY+ZtaIRfsvvIIehggu98EOv6M3B0siRwgUkoYSyOCu6pHBZx4YOvOxNgz8nQRY11BhT
 DI71LznA=
X-Gm-Gg: ASbGncsm7PnR4D/1YJzx0IdpNBBitq6Q54kVwqo8LID/Mlo58AGzAJTvXSLbmzDhhcR
 hBHZwwgreoIUPYfu8sA3wakOikusELRcKBw4Yy020ljxtVcffwVknMg+EB/ujU7+uqDW6/eI+NP
 ysDvOSIJeWbsx3vWwEddD2hNvpbol+keSkTdhiHo+LjyhTvMC/6TtIRB5Ka0E+H73WsSwJrB8wV
 MKpygubYBQglf+EgP94boE4sMX9/ZzueMA51vjex0UL2y+ipAt0WmZ57qjLu9qZ+LeqOU5nsYWO
 3jGnUwhIB5tPkZUJnhayntnK3weRXHE8nJ+QezrylWYvhjLmX5JaRG1uUOLOe2SVqiwhALRh0Nu
 NzuIoBlwoIBUY8xgKgWy53ha7wEWeZqHOhPJWGMPCTCtVCFh8UJmhuW+wm+NrUc05UpP3LWQdkp
 nmow8N2U7Hpqdd2w==
X-Google-Smtp-Source: AGHT+IGnTb1hn9kyJTm2SDpkMW1o8RyJYDMUoPLiE3swiTJ8OFA/0tqRFyor3kC5LV6PJXR8DTHoiw==
X-Received: by 2002:a05:6000:2087:b0:425:86f1:5861 with SMTP id
 ffacd0b85a97d-4266e7dfb44mr14428832f8f.30.1760467739221; 
 Tue, 14 Oct 2025 11:48:59 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.97])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe69sm25539058f8f.32.2025.10.14.11.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 11:48:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 14 Oct 2025 20:48:46 +0200
Message-ID: <20251014184846.664895-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760467739; x=1761072539;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3ow0eC8T3Uth7Qz9vj0PbhW6IKxCWTNr3dHvwXae1zU=;
 b=Cw4EQhYHnqb1l9NuSi9Oo35q6Ki1tzvjYvfyQWa50K+9x+65X7NfyD6wjDSa6zcbLK
 vsBQBQE3HGIRWZqH7e0Vxho6/gufqLXObIzXs08XiB81BFCTA52u1kAd0BZfCnhc/WnQ
 dYrC9DeqmcZi80r2tMIavXO7J3vLOGbUCu/bY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Cw4EQhYH
Subject: [Buildroot] [PATCH 1/1] package/isl: bump to version 0.27
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://groups.google.com/g/isl-announce/c/8lpal5tZdgU

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/isl/isl.hash | 2 +-
 package/isl/isl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/isl/isl.hash b/package/isl/isl.hash
index 1f8c99823501..abffd7883111 100644
--- a/package/isl/isl.hash
+++ b/package/isl/isl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a0b5cb06d24f9fa9e77b55fabbe9a3c94a336190345c2555f9915bb38e976504  isl-0.26.tar.xz
+sha256  6d8babb59e7b672e8cb7870e874f3f7b813b6e00e6af3f8b04f7579965643d5c  isl-0.27.tar.xz
 sha256  3a2c398103f6bca0f50a9a9465deca9230b370b0212af5fdf31ed88a36215c30  LICENSE
diff --git a/package/isl/isl.mk b/package/isl/isl.mk
index 42830a26897c..122367e66580 100644
--- a/package/isl/isl.mk
+++ b/package/isl/isl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ISL_VERSION = 0.26
+ISL_VERSION = 0.27
 ISL_SOURCE = isl-$(ISL_VERSION).tar.xz
 ISL_SITE = https://libisl.sourceforge.io
 ISL_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
