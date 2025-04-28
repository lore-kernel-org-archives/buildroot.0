Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FE5C369D5
	for <buildroot@archiver.kernel.org>; Mon, 28 Apr 2025 13:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E4B860B57;
	Mon, 28 Apr 2025 13:29:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F-MLPAHeDBzk; Mon, 28 Apr 2025 13:29:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABF70608A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABF70608A6;
	Mon, 28 Apr 2025 13:29:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E1EDB31
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 13:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C81FB608A6
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 13:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eEzJGhQKeLVz for <buildroot@buildroot.org>;
 Mon, 28 Apr 2025 13:29:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=titouanchristophe@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7647D60794
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7647D60794
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7647D60794
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 13:29:37 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-39c1efbefc6so3270309f8f.1
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 06:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745846975; x=1746451775;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cJR6oKo1BhK+y+j8Cx0UCZNkQTxlD4nrNJCMg7BiWs0=;
 b=hOvJRioGLlkrGDRKdcjNgrIKWY0oKPayOOYZp3la472eSGUN9aN6j1gYDTsAlCjhZ3
 +t6RDDX41RdGU2WusmRN4g4bgumyU0/3PeSJ7K6VNS10GVGgImRBj+9rbY/B9HH6rQ3A
 kSYpsYFSQv1eYGpUgwLMrkaOc2hk5kJnUrk7JTCkTvIuXWTugy9EEr3266rARZdsEHBj
 WKkQl2kZoy4GEr0G3DjkbzRH82Mb1RBbvaOvuLyGGYY+AZsZiqvTeqtk79qV2d9TkjWp
 JdzsoApRAFVbuY1ER7M2x791KEI/Z3c2+RhMzuTY/qtstGnefSNJBkHO8M6D5yDf1k4B
 a7DQ==
X-Gm-Message-State: AOJu0YxbRQIBB6Lk7b0kc9iq3B9BvzKzh3OnPLBBoxPlGKtDSHaJPmSv
 uq2LmzsnZonyz4k/ZC4H94hVGOiHAUw3giP/JahwYuC6jHnUj/oDkNsjIGh9
X-Gm-Gg: ASbGncv/5COgivqsP85JWivT3QOosat1UKoSngzBhfdKgv7+JCjtN3+ovitR/ckcb+9
 r9Vq2tr/4+TMpNAOXW740inz0nERvT1cVkb1xiM2O/nAxSMd9dnJQMqUI3drdH3l7ESxCKANARD
 +QUasXD7heaJeReeP7O6Y7LdjJBYetRMYuXho6TfvfcHe4lxxWW930safQzKA7Lo+4eqFFSa3Or
 wXDa5Ji/5ckoy0V9Wc9TrIVV6FY0pth93umbgNiLP9dZrts8wWz3Mm8Qa9Vv/VOPBR9zGXR9MO6
 EKD2Jb5l0an66sBjV0Ji6KGUCWWr4gKsqPpBxmVmaLNJ9NNF99JfpMTg2NaP9T6f5ND1ut+syKr
 GZjur0VCEdD4/fRmIAnEMWhWsmAuRe/xOSlsTgA==
X-Google-Smtp-Source: AGHT+IGWMk7i9XAwoMUt404jc8Ogdh7csBpV4qG8OX+wwMIpU0OhKTpnofdSfRhryWWRLDbMCBZO7w==
X-Received: by 2002:a05:6000:1889:b0:39c:3107:c503 with SMTP id
 ffacd0b85a97d-3a074e373ebmr9769504f8f.31.1745846975128; 
 Mon, 28 Apr 2025 06:29:35 -0700 (PDT)
Received: from smartron.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073ca556bsm11237079f8f.37.2025.04.28.06.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 06:29:34 -0700 (PDT)
From: Titouan Christophe <titouanchristophe@gmail.com>
To: buildroot@buildroot.org
Cc: Titouan Christophe <titouan.christophe@mind.be>,
 Titouan Christophe <titouanchristophe@gmail.com>
Date: Mon, 28 Apr 2025 15:29:09 +0200
Message-ID: <20250428132909.878530-1-titouanchristophe@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745846975; x=1746451775; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cJR6oKo1BhK+y+j8Cx0UCZNkQTxlD4nrNJCMg7BiWs0=;
 b=bMKlRzHWu/+kL4Fhyk2f+huYVnze1AFQ6+Mhmzd1J8ue/O2IQNugS0TCvzJ5mwi3o6
 PxZLhf1GomVABfnz3pzyNCQpE5WayxBZb+KdGX11EjcjJPJNeui3MS+A7o+2oAJcazEI
 2WlqsqytZDLOL1RkzOX3qECERT+oxjAbC83xUSRjX4LiLy/8Pc34PVF5ydKR6gvZogLB
 QToaj0X0qsF4qW8rjlWGvQgVkzQBvERZIchUpU6BQ8iEWQax4qZ2KQOmwfm8zTyMoMH+
 dS/8G+2GllFwAVDeo0c6ypwT0DfL6saST3oJHRJ44gQX00JVEkTDa9/w7k3ftsr5sBfo
 Iryw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bMKlRzHW
Subject: [Buildroot] [PATCH 1/1] package/waf: bump to v2.1.5
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

From: Titouan Christophe <titouan.christophe@mind.be>

Tested with `./utils/test-pkg -p ntpsec` (ntpsec is a waf-package)

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/waf/waf.hash | 6 +++---
 package/waf/waf.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/waf/waf.hash b/package/waf/waf.hash
index 543bea5d7b..8255ed4f60 100644
--- a/package/waf/waf.hash
+++ b/package/waf/waf.hash
@@ -1,7 +1,7 @@
 # Locally computed
-sha1  9ee587d802ffd15a2e7cae579560d00754db4fad  waf-2.1.1
-sha256  2e66e01fd564f09106419389119c78143327c89a35f26ee3ed376f0ee410a14d  waf-2.1.1
+sha1  523f645690747501b19e0d107a044de514ba80b4  waf-2.1.5
+sha256  9d0b5d13e85f781b6976cfefb909b76cbc94a07419fa95d34216dca744257786  waf-2.1.5
 
 # The waf script also contains its license, but is renamed `waf` in the extract
 # step, so this is a synonym for the above, to check WAF_LICENSE
-sha256  2e66e01fd564f09106419389119c78143327c89a35f26ee3ed376f0ee410a14d  waf
+sha256  9d0b5d13e85f781b6976cfefb909b76cbc94a07419fa95d34216dca744257786  waf
diff --git a/package/waf/waf.mk b/package/waf/waf.mk
index a12d15a228..88b8d9096e 100644
--- a/package/waf/waf.mk
+++ b/package/waf/waf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAF_VERSION = 2.1.1
+WAF_VERSION = 2.1.5
 WAF_SOURCE = waf-$(WAF_VERSION)
 WAF_SITE = https://waf.io
 WAF_LICENSE = BSD-3-Clause
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
