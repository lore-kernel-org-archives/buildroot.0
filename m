Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99472D10BE4
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 05:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FAC340BC3;
	Sat, 26 Oct 2024 05:09:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Q3DqW_CzgWp; Sat, 26 Oct 2024 05:09:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37DD040BC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37DD040BC7;
	Sat, 26 Oct 2024 05:09:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A66A5C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 05:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 790B581FF5
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 05:09:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i2mSCP64iFmZ for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 05:09:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7F3C080DF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F3C080DF4
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F3C080DF4
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 05:09:03 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-71e5ae69880so1928295b3a.2
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 22:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729919342; x=1730524142;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WaiNrvDrM6YSNitdbeLeOXJd8F5HVzv7SeDus4NnpYM=;
 b=F9S4vOCQbBSrCOcOifF4+mzgYo7JSAwFVn+J2/tEZnqXQdr4Z2YEjg8Qki2r8opbq4
 ZjXsU+uq+5EH7mkK9KTvFIeop9OgVcoyWvKVVflXgipQRba0JOEYPcNj0Aht5EzBzelz
 wSBwySHR+H4bjEANe3V2ZMcJ96PsxIJ7+iqEI/GLG1ir89G/Fp5xgKgV9Ltjg957LBmb
 wsi21IGXeGg9uNYrfyRW3HG/l++LJm79loGiOd+eOCQO8ns083nfdyUmdeJBBj05vSIP
 jxD4J3ILQ2AL9XE9g2KGJciBuGUO18Zuh7rfd7H+mH8UEcpuTiHldNaQi2lCjV5fboDg
 dyxA==
X-Gm-Message-State: AOJu0Yzrf/UHCqO5VBl0YWz0NGJCr9xuO8KZHZrr0z4yM6SQNPtRxa/X
 SopzllBu13kJnPB2GSYbE83V3bQtWL+3CWWt6ON4VePjH4hdrLWdfif/7lgWoUw4abboa3xWbMw
 ZLS4=
X-Google-Smtp-Source: AGHT+IE1isVDutmnu0ZKgbR8OhiHjh2pGANCGylXf4atWeFGACKpMaxzo1CK1jCsJ8NCfGhg5clB2Q==
X-Received: by 2002:a05:6a21:58b:b0:1d9:275b:4ee1 with SMTP id
 adf61e73a8af0-1d9a840d206mr2269292637.24.1729919342664; 
 Fri, 25 Oct 2024 22:09:02 -0700 (PDT)
Received: from localhost.localdomain ([192.145.118.141])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72057921daasm2004329b3a.37.2024.10.25.22.09.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 25 Oct 2024 22:09:02 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 25 Oct 2024 22:08:54 -0700
Message-ID: <20241026050854.51101-1-christian@aperture.us>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1729919342; x=1730524142; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WaiNrvDrM6YSNitdbeLeOXJd8F5HVzv7SeDus4NnpYM=;
 b=DoIiWv/LEC9V6DAfP8o1BwXvVxW4VxIuyyjlw/vspErrZah9cVNkhYyC8fCTE2H5tH
 7EwEqd1Bw+Sd3MqTmRfCdT8lgm3huIqY99SNDCARtwTIjrI424fWjbNBCCRiFuNUCwxs
 o/vWsMPC9auiog3X+mUiE3MVwIDuZyUPi03orsbds5krRUXLknLJ/dOjY4wbCMuQpSAT
 xqm6JMFoJ6UisYzg2yRCMbUCwUzQ8kpxYzY5lc+PCgnx8k5m0dyOD8rRukNhAHKXqKMe
 wf++S954oiNbFaJJQl6onMi0tDrM2ELbuMAp2mIShq93++V1oVYeLgCtYrykuiLm18UO
 GC3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=DoIiWv/L
Subject: [Buildroot] [PATCH v1 1/1] package/docker-cli: bump version to
 v27.3.1
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>,
 Joachim Wiberg <troglobit@gmail.com>, Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a major version bump to v27.

https://github.com/moby/moby/releases/tag/v27.3.1

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 78e7311296..c70d274f96 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f992e895c949852686abef9a6fa9efd622826c4f4d70b83876569a4641c4c8fc  docker-cli-27.0.3-go2.tar.gz
+sha256  df7d44387166d90954e290dfbe0a278649bf71d0e89933615bdc0757580b68e4  docker-cli-27.3.1-go2.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 1478bdca2e..39e1367908 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 27.0.3
+DOCKER_CLI_VERSION = 27.3.1
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
