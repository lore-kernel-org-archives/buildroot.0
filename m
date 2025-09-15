Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71ADACAC592
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 14:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 297BB42311;
	Mon, 15 Sep 2025 14:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wg-vm8MkTp4d; Mon, 15 Sep 2025 14:45:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28E114230D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28E114230D;
	Mon, 15 Sep 2025 14:45:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FCF312D
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 14:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CDE14230B
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 14:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fhxkju8--ZbM for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 14:45:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=kazemi.ms@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A22FA4230C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A22FA4230C
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A22FA4230C
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 14:45:52 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6228de280ccso8732792a12.3
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 07:45:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757947550; x=1758552350;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eWdUXNwaHNg/6BdBmkBF3Efv1KQxS9RHCMoLN8XVfRI=;
 b=T/bGvDMTOfgFO7YKPKKGoeQcHDpb7soplQn5SBqmt5Quau4rYtBdW+MVfqhRziz9Q9
 ZChn4PSLPLW1xyNG0LFYpNleylygQpGEz10xwNZI3f1XiPW53bdcqIhbATuFj7HAAufl
 J3/BOBFX8iU3pvYdQp7hBBDGxtsOlQp/E/Eul+qMojT+f88SGEqLY9Tkv2+coWfKO0xM
 UeKB91007w2a4MsVr+m3ogKSXyZD5bJMf2X9IWY5JS5kQKFEEjjaKVIS2fXpAuyN+fcn
 ukVZCaVNJ/2+/5EQngQyQh/k6ewITvLaWSsZrf8ZNddGxZkq9OHV44vfMRI1DK3+ux1l
 v8WQ==
X-Gm-Message-State: AOJu0YyweuoUD7uk4REZBqgaV4+G9/FGFrynq78rEdXsK2Mn0JBuEXH7
 bVUKkoCLXEROv8hFIJZ1bAhtJuXAIgbCfSyIGTlQEmMJ4enaLck/QWBLG+7IjWfy
X-Gm-Gg: ASbGncv4f5yAmFy4+lLZs8ylh8USiRM3vo8lABNBdGRiQ54ojttOJn/Zm3QUNzxGt93
 SqtY7PHxa2i2uZVZ3XJxYzwmfzEvPfTAKnwoz7hEoWORdJo8zv01bH25uvshK5c6n2LmF7L5VUf
 TOelibGjWxpxoS5TIktCXFZ53NQO6rMEwVTwk0uEbSE0TvxD5r0/pel2K2lC5t3QpWdGNiIoQ6z
 9LP0bUKPNOGJYbaq04QmdXcrLp+Qq1CyxxuFZY97xBJRYm/5q4ZoasGknZYg1QzCQUcjyi0sGnn
 YXVfoKCpb1y+G+GHRvy/vABlqHP5IgPaA8eEohlMxypVuD3RjSLsrqrUrwHhfAAM8ihwCC9Gdun
 k6RfmdNTnEePsY7nVteWvplrDtbLH9H+++ptWiD8IO5O2Lms7ZXRjxVt8qYAxrlMfYlRLNa0gHc
 er3C+VbSeWogGucZ8HHEY0g1fET2oSDVOc1Cj4fQs/f+QLBy/Xe64wvHm+lFQtumH+M9iJW+nHa
 aHhYRdEvbGSUX+e2CY8xLvA
X-Google-Smtp-Source: AGHT+IEWlA0aPZqMuhB/tfR2yyVc3qU4gU8HlBp0CvmrGLj7NQSLZy0xXIt3YrLVJt5Y2azap+C7/Q==
X-Received: by 2002:a05:6402:40d5:b0:627:c739:ee36 with SMTP id
 4fb4d7f45d1cf-62ed82873a7mr11606132a12.14.1757947550132; 
 Mon, 15 Sep 2025 07:45:50 -0700 (PDT)
Received: from saeedkazemi-ThinkPad.home
 (2a02-a450-7a0e-0-d307-416a-de81-9106.fixed6.kpn.net.
 [2a02:a450:7a0e:0:d307:416a:de81:9106])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62ec551bf13sm9063642a12.53.2025.09.15.07.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 07:45:49 -0700 (PDT)
From: Saeed Kazemi <kazemi.ms@gmail.com>
To: buildroot@buildroot.org
Cc: Saeed Kazemi <kazemi.ms@gmail.com>
Date: Mon, 15 Sep 2025 16:45:47 +0200
Message-ID: <20250915144547.3727313-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757947550; x=1758552350; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eWdUXNwaHNg/6BdBmkBF3Efv1KQxS9RHCMoLN8XVfRI=;
 b=aLdOJfHid+wKktUYSo/IRrD5WLI/t9LXsijh3jzuLv8vf15Lb+6wI42Ox5M+1N1G/P
 iLpyeapylzTTo8CxTUD4P6u7mTBCDJQlRmLmG5DKOdpDEvHMil1uytYFOlLI0cruVXWd
 xCFXlkBfQMUYOx3EBol+5zsOZp0i2/ezpo+fsf+EDvqnLwwQh1H+9VfjyZaS3ddXxAkG
 SMABhdnraT/gUeH8qmvNIYONIrOhgrms+si40XEJyVRXjoIIXMF9wNFvIAdTLJkzuG7X
 +F0/C6lFHQgq9GrB7Psh4b1Hv5ETZ1yVu4lhXCmlZZqKqhAodcLJFKuHOEsnig5nJqtp
 vsnA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aLdOJfHi
Subject: [Buildroot] [PATCH 1/1] package/mxt-app: bump to version 1.45
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
https://github.com/atmel-maxtouch/mxt-app/releases/tag/v1.45

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
---
 package/mxt-app/mxt-app.hash | 2 +-
 package/mxt-app/mxt-app.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mxt-app/mxt-app.hash b/package/mxt-app/mxt-app.hash
index 2f5ea814d8..c808d0c35a 100644
--- a/package/mxt-app/mxt-app.hash
+++ b/package/mxt-app/mxt-app.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  38fdf7954d2184d122f6f1b1493fba1955c0e3c7dfd5196dbc3d536afc9c672a  mxt-app-1.38.tar.gz
+sha256  6676e18c4837b4adc6c4ee2287fb6a3fc7631b7454158fa04201c701493f0a41  mxt-app-1.45.tar.gz
 sha256  3682b125a40a4da00b6ab69bdbd38c25ed4beae69b3fe32458d2e32638477c4c  LICENSE
diff --git a/package/mxt-app/mxt-app.mk b/package/mxt-app/mxt-app.mk
index 4921803e4c..db7e25793d 100644
--- a/package/mxt-app/mxt-app.mk
+++ b/package/mxt-app/mxt-app.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MXT_APP_VERSION = 1.38
+MXT_APP_VERSION = 1.45
 MXT_APP_SITE = $(call github,atmel-maxtouch,mxt-app,v$(MXT_APP_VERSION))
 MXT_APP_LICENSE = BSD-2-Clause
 MXT_APP_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
