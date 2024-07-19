Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5D5C3DA59
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 03:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78397409F7;
	Fri, 19 Jul 2024 03:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y8KFMaO7enyh; Fri, 19 Jul 2024 03:33:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9D99409EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9D99409EA;
	Fri, 19 Jul 2024 03:33:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE3101BF315
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 03:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9AD681F65
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 03:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qPs1oUesY8Df for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 03:33:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CDFD581F64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDFD581F64
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDFD581F64
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 03:33:36 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-70b09cb7776so396728b3a.1
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721360016; x=1721964816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GuVLYp00/NOcwORGkZRan5wLv87yeMkxvCCAyw92kPo=;
 b=nBqLMmec9txifXKWZczugQZ/Pp+aUdevCrHsMntUFUev2at7xGw0LSPUd7680NMKMA
 OX3/uFXA0DASi5MQZCwkyN+0grWdApiaoYwO7P3NKvxFX1fP2iFmvi6LLK6UcTFizHkM
 ypWgnsouEopnJc6jjIMaLsMeFRagMkD34P9DJ7/uq/6XlQgLZez4aDG9sAOwy4yFkxyV
 A+mS2kaIpvpB9Sp1MCon+tcEYyynKwWSdpWzmjXOvgF0+s3JYMEES+qRsDZTTJWBHZD8
 v7R0UZJjpkD4dul1QV/mUIJ44pjZBWd5xCpjzSLPKjztggYg7kefAKKTamfWlDMlLQhZ
 W6FQ==
X-Gm-Message-State: AOJu0YyLGlchKNlzhTobViDXQ6jN7Hw9+iMNey1opaYiNXYelqIJLHoJ
 wxysc2vWX+mD+t0WT6eaG7pIBnYD/JsZL1oT9SdZjZxBVh/eswOhmEHQbzB4cK+izb/jEcFsFyt
 5J182/Q==
X-Google-Smtp-Source: AGHT+IFVIao65143jLds5beqaR35GcERxyhYJn4GhyPsK9BvWgTV5TRaHBuhM/KYPPxfKyDEBiBO+Q==
X-Received: by 2002:aa7:9301:0:b0:70b:18f:45dd with SMTP id
 d2e1a72fcca58-70ce4f3ed7amr6530039b3a.32.1721360015623; 
 Thu, 18 Jul 2024 20:33:35 -0700 (PDT)
Received: from localhost ([157.97.134.29]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-70cff59e05bsm279485b3a.156.2024.07.18.20.33.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 20:33:35 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 18 Jul 2024 20:33:31 -0700
Message-ID: <20240719033331.13606-2-christian@aperture.us>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240719033331.13606-1-christian@aperture.us>
References: <20240719033331.13606-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1721360016; x=1721964816; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GuVLYp00/NOcwORGkZRan5wLv87yeMkxvCCAyw92kPo=;
 b=DCvWFlZETdDi79o0QjyADk0mvKtgoRgvy6N4/k8NQRPwEemrVMUy22ZmMqmOrJKx+u
 H+KP1fM3AF01KaeL493KWeagyVyb7v6iBGy2wixpxXzgvuvzKjvpJdkLlDlveoM2Nwfw
 xdEEspVD+Kewmh+1Ya74xwpRib0mEpfyFlQacvq4ZtC1BhtG6mFgBcvOZnHXal9A3bpC
 liUaZavBler+w9Ey5k3f/3ccpr+o8ffuHkX+wieBYPrgSFNF6o3Y2bUy89nBZRl+yecc
 gosmPxzI5CzMwMkhGLcs0WLXjR8L+pJVmZjcbjOVM4fLCJJMbq6mS/PngGJgtW7CVbrd
 dGmw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=DCvWFlZE
Subject: [Buildroot] [PATCH v1 2/2] package/docker-cli: bump version to
 27.0.3
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/docker/cli/releases/tag/v27.0.3

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index af26294378..78e7311296 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a2b31d4c8143c8b126e98a359639f51727fc83fc1e61670efbdeaa7dea92fd5a  docker-cli-27.0.2-go2.tar.gz
+sha256  f992e895c949852686abef9a6fa9efd622826c4f4d70b83876569a4641c4c8fc  docker-cli-27.0.3-go2.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 1e29f008b6..1478bdca2e 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 27.0.2
+DOCKER_CLI_VERSION = 27.0.3
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
