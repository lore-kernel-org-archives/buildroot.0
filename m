Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E8DC7EE39
	for <buildroot@archiver.kernel.org>; Sun, 29 Jun 2025 20:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6900261066;
	Sun, 29 Jun 2025 20:59:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ad7aXDCNAvbx; Sun, 29 Jun 2025 20:59:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9174760E06
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9174760E06;
	Sun, 29 Jun 2025 20:59:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 381821C9
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 20:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BC9540511
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 20:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xoSXwIIFEszn for <buildroot@buildroot.org>;
 Sun, 29 Jun 2025 20:59:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F348E40054
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F348E40054
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F348E40054
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 20:59:50 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4530921461aso24270555e9.0
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 13:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751230788; x=1751835588;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w7Q+ClEl6lyT9RbGnkK3q3haAHpRemkDksC9cj2qtLE=;
 b=oDv252zyQraygO2g9n5BmdmLMK+3qf57BKDN7aWV/j4inaQA8Gharg55PW8ZthVdnR
 TAkvXGpKB/bHkqtSfSyWe66NiPJYCltrHgS8eW5KCtX9r97aOuOnuf52mHxsx93NhHbd
 pRFoui42qgh8bADsKSzKEtoz0TwHjoX4ZRawcarydx4jA0GRneSK0LViLcPyvF90/BUX
 DoW95mugCgP+KpgcoD86ZnOEEflhMMclXgOgOyddoTSuSMKOF0BJOWXYYrLzgFf8n6xA
 tTuwmJxVfRU+7YUuLK/9WeDg8qveABStUj1UR3APjfsLpwe+CabtRTXniAU2a1Q+CwP/
 vnCA==
X-Gm-Message-State: AOJu0YwAO8Czt1JMrRq6jf5tMbS1Civ4uC/O3PDHfh+rMRV9rnSCMbh3
 LQm5yqDbwN7cWGN5EdhMvL0q6nWubMQRLfOJhkWSJmBWA+MQtzhw+/KcLnbT88otmdve1Q1HUuI
 zn4W5
X-Gm-Gg: ASbGncsyWrRuYaLIMaUbY0FupcgRhPXKO2s/6QtfpUD1oFDlYYWd2JZ4u6hHPnGz+JO
 g4x7rDHxpueqicVwlbi06GjkmZ4GK2MlH6oTFgKS01hgbLT7RwmxeMq0O/8FixHRPU2gFk7ryJD
 0cl48GohazqFn3aXt22Xcd7h0dop9S1XM6Rs8n7+H4tna38cz5ol19Dr9KFdzErkdsh4+ty1mR9
 5JMZA1lOEj65m0de45QiPtk7vIK1A1NVhSHPJCelC1Dad5xB6+5WcSSouDu4zG1AeYDgj6b/NlR
 oIg2jhfdZIDvwVZ78zZZ2pqfWfnqvvZi1dIRywRPZThKSnse8uIxPIZkhgqouC6lw7B20iHeE53
 Xt2ZPeS1WWQ==
X-Google-Smtp-Source: AGHT+IEwKLJofdcjM4kQD47TvjsIfRX+855FnwuNi2xrWdPzdWCEg2S5W9z1yGPhNp0sjYE4BCKfWA==
X-Received: by 2002:a05:600c:3482:b0:43b:c0fa:f9dd with SMTP id
 5b1f17b1804b1-4538ee9663fmr92033935e9.25.1751230788332; 
 Sun, 29 Jun 2025 13:59:48 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a3a72dasm114451855e9.16.2025.06.29.13.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:59:48 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 29 Jun 2025 22:59:47 +0200
Message-ID: <20250629205947.1033440-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751230788; x=1751835588; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w7Q+ClEl6lyT9RbGnkK3q3haAHpRemkDksC9cj2qtLE=;
 b=bHbkhzgNCzyk4x0LD8GeOZ98I86WS45IZ1cMUHgaDcF/OWIPfWrL2uBzi/oCTogRUM
 /ivlCvLngSqsLwxB+nf3VwPvQSvlUkr1Ik8kV5q5qfMd1STsOPowmtuTCi/Jw6EYt7GE
 HffSgHQPma8DtkjNkseREgktUKl6gI2Hef/E9VOX1AP7GSChIBzmzf5qfJ27ekwxM+la
 vdpHXAI2Rq0Gaxq92gRzsieQ+JfnN71Ubq5iu9t2hR5bkKpiwdb6tJtTCV6Q1YEF2LYj
 +/8T3hIkT/c+igxdSZ5UriG6o0bW0NjgCLBCBgzko9CqUZR4C6UAZtEXhclMEf8rPU2+
 zkUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bHbkhzgN
Subject: [Buildroot] [PATCH] package/libavif: security bump to v1.3.0
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

- CVE-2025-48174: makeRoom in stream.c has an integer overflow and
    resultant buffer overflow in stream->offset+size.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-48174
  - https://github.com/AOMediaCodec/libavif/pull/2768/commits

- CVE-2025-48175: avifImageRGBToYUV in reformat.c has integer overflows
    in multiplications involving rgbRowBytes, yRowBytes, uRowBytes, and
    vRowBytes.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-48175
  - https://github.com/AOMediaCodec/libavif/commit/64d956ed5a602f78cebf29da023280944ee92efd

For more details on the version bump, see:
  - https://github.com/AOMediaCodec/libavif/releases/tag/v1.3.0
  - https://github.com/AOMediaCodec/libavif/releases/tag/v1.2.1
  - https://github.com/AOMediaCodec/libavif/releases/tag/v1.2.0

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libavif/libavif.hash | 2 +-
 package/libavif/libavif.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libavif/libavif.hash b/package/libavif/libavif.hash
index b26e678abf..c53e0c9f50 100644
--- a/package/libavif/libavif.hash
+++ b/package/libavif/libavif.hash
@@ -1,3 +1,3 @@
-sha256  914662e16245e062ed73f90112fbb4548241300843a7772d8d441bb6859de45b  libavif-1.1.1.tar.gz
+sha256  0a545e953cc049bf5bcf4ee467306a2f113a75110edf59e61248873101cd26c1  libavif-1.3.0.tar.gz
 
 sha256  165abf92cc04b39e80d29cadea7a6a7e8fddf59407d4ad2616507a7ebe8216f9  LICENSE
diff --git a/package/libavif/libavif.mk b/package/libavif/libavif.mk
index 0c2a8e4dae..4357566ed1 100644
--- a/package/libavif/libavif.mk
+++ b/package/libavif/libavif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBAVIF_VERSION = 1.1.1
+LIBAVIF_VERSION = 1.3.0
 LIBAVIF_SITE = $(call github,AOMediaCodec,libavif,v$(LIBAVIF_VERSION))
 LIBAVIF_LICENSE = BSD-2-Clause, IJG, Apache-2.0
 LIBAVIF_LICENSE_FILES = LICENSE
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
