Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D32CCD193
	for <buildroot@archiver.kernel.org>; Thu, 23 Oct 2025 18:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 703C5411CC;
	Thu, 23 Oct 2025 18:09:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZJlwyn2-n7xB; Thu, 23 Oct 2025 18:09:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8491B411D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8491B411D1;
	Thu, 23 Oct 2025 18:09:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D09E543F
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 18:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7729409BD
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 18:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jd5pVkFAheeG for <buildroot@buildroot.org>;
 Thu, 23 Oct 2025 18:09:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8B6C44083C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B6C44083C
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B6C44083C
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 18:09:13 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-63bdfd73e6eso4487532a12.0
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 11:09:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761242951; x=1761847751;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yjCwzzM1bZOHezxTRdQQQJY6umeuXEG1tu9bSJCTSqY=;
 b=iidWhYfTaUHotf22/fQ2KQPop/lMERkMKWMjzJnqyEDQh9Ki/3WQbBR2oAcFVo/eC9
 an1EnMxDyiqCx9rFGsvxJ86C6FRpW1eHxnwM53wWs83VfluawjQp7jbSPVmArihvQJ3G
 APmuemnHqNWPAQB0IcR9r+MwhP424wTL9H+XnfsFwFA7IJ/++T68c0H0NvVgrDOlg6pn
 tnRfw6QY/SyD8NA4l5p9Bkv6yNxYdihQBhWSXUnCucV/Slw4QiIUZTTcT6vv+KUKxzi3
 WSk7xg9JMjxHoCObEfEDGmkUwHKXnAASMsMD7tHEaSyuXGdbFGGKgOTvW3m4F6dJ9uHK
 qD1Q==
X-Gm-Message-State: AOJu0YxBSlxiJRjr+ubpWVMD32bJvDuSz9kQkOjYnjMEAZW6xpTgwyDt
 TBzeVvFOU8CG9zLzwuwxjk/S00EHNQdyPtbFx1ZxZmEt95UsLRf+ETzIcTkrx8GVeSeOAStJXJP
 0nEG8
X-Gm-Gg: ASbGncuG+jxjkWgk8sQt2Kio+KASuw2mJFHIOhh2MqIVbpW3ZskvNgjdqYdlLY+ggyu
 vKtXQ0DxExmC/4Xz5BU8oAEU+pSHpgW52M8C+Yavy2o0DuLZL10imYPCYOzTAlzjgBZnkqsophY
 U05QAZYjes+DxfzL6i9t3I8lLqVAcDzVVMcn/bRUHEtu6PYfMMkWUPC1yh7SFOwnc3OxJL1tiwT
 HqAnYoqcXrWZNxTNU00+qiqGmBwAJQJY1SC6w4HbGvF/zeVm7fOCUQeEL/IktNn7ue1Rp1BD7vf
 n4pHKq7EgT8mNfmFNb5J4DqFhz+Qb13LNQhLJOWxh/LYlTqc23KsHlHlbjzDk13QmVVGqnxFRXu
 hfUlylH+ZvNyUWrgCz/5mdb2B1vEUZb97Zx/0fpWznJWIu17YlD9wfr0hfsroNOIeWVouvRpxN5
 /FfAhsU8/f7MUuWjEzN0LlYfbhFsjxgvXP+dp1RDp+cDfqT21jkMR2Uu4LVhY0zN1NdgGUUV/Lw
 rL9yNoZmMDyaWXl7PqNGlPqofPndPXTG+dp4UYLC5MExK+eBNguc9M=
X-Google-Smtp-Source: AGHT+IHXwRAbxqf5pcF73FrW/rnkfLk5b5CuDE2Th5QefEwiO/Le4+JyjJhb5oDgc7DrecgrkFITJw==
X-Received: by 2002:a05:6402:741:b0:62f:8bad:76e5 with SMTP id
 4fb4d7f45d1cf-63e2707a08bmr4319402a12.5.1761242951097; 
 Thu, 23 Oct 2025 11:09:11 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-25-27-158.retail.telecomitalia.it. [79.25.27.158])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e3ebb3848sm2553367a12.1.2025.10.23.11.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 11:09:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 23 Oct 2025 20:09:08 +0200
Message-ID: <20251023180908.586944-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1761242951; x=1761847751;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yjCwzzM1bZOHezxTRdQQQJY6umeuXEG1tu9bSJCTSqY=;
 b=oFW+zPsoVLgaHgq6WxGY7RR76w12gHmixRZEX3XA2hfmROi0WqwdkObP/AD3kt7k+/
 pikRWsaDvNShYAVPPsSxSMznYBa05YropLPdCPyvjrYBoueRRnv7Rd3Bv8F4xE3PcMsa
 gblulVZJ5XLJO4ItX0Gb6d0ppNucvC6Vx5wq8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=oFW+zPso
Subject: [Buildroot] [PATCH 1/1] package/libgsasl: bump to version 2.2.2
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

Update COPYING.LESSER license hash due to postal address fix and
README to year update.

Release notes:
https://lists.gnu.org/archive/html/help-gsasl/2025-03/msg00000.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libgsasl/libgsasl.hash | 10 +++++-----
 package/libgsasl/libgsasl.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libgsasl/libgsasl.hash b/package/libgsasl/libgsasl.hash
index 81907f8875a5..de24d73c2dfd 100644
--- a/package/libgsasl/libgsasl.hash
+++ b/package/libgsasl/libgsasl.hash
@@ -1,11 +1,11 @@
-# From https://lists.gnu.org/archive/html/help-gsasl/2024-01/msg00003.html
-sha1  c238b3af05af3804808cbf734f049a06840d787c  gsasl-2.2.1.tar.gz
+# From https://lists.gnu.org/archive/html/help-gsasl/2025-03/msg00000.html
+sha1  8a845b7ec78e5f27bf69438074ad23867c00d4fe  gsasl-2.2.2.tar.gz
 sha256  d45b562e13bd13b9fc20b372f4b53269740cf6279f836f09ce11b9d32bcee075  gsasl-2.2.1.tar.gz
 
 # Locally calculated after checking pgp signature
-sha256  d45b562e13bd13b9fc20b372f4b53269740cf6279f836f09ce11b9d32bcee075  gsasl-2.2.1.tar.gz
+sha256  41e8e442648eccaf6459d9ad93d4b18530b96c8eaf50e3f342532ef275eff3ba  gsasl-2.2.2.tar.gz
 
 # Hash for license files:
-sha256  8908e3d66e17102a3b921e1f7f80be5dc9c905ad15561579d46a7074387e311b  README
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
+sha256  e3d1b8a82b97dc6083b2600a6beb0396bbefbe384fc1cd39d0e8cb04bbf2bd33  README
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LESSER
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/libgsasl/libgsasl.mk b/package/libgsasl/libgsasl.mk
index b8570058a41e..8670f43b6f22 100644
--- a/package/libgsasl/libgsasl.mk
+++ b/package/libgsasl/libgsasl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGSASL_VERSION = 2.2.1
+LIBGSASL_VERSION = 2.2.2
 LIBGSASL_SOURCE = gsasl-$(LIBGSASL_VERSION).tar.gz
 LIBGSASL_SITE = $(BR2_GNU_MIRROR)/gsasl
 LIBGSASL_LICENSE = LGPL-2.1+ (library), GPL-3.0+ (programs)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
