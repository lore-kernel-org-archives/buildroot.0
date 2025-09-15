Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2450DCAC592
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 14:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5D464229B;
	Mon, 15 Sep 2025 14:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F0XHjgp6eLAe; Mon, 15 Sep 2025 14:08:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4ED842299
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4ED842299;
	Mon, 15 Sep 2025 14:08:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AFF4122F
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 14:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1B6942292
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 14:08:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HL8ldHgBN4Zw for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 14:08:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=kazemi.ms@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BAF684173B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAF684173B
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BAF684173B
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 14:08:55 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b07e081d852so368475066b.2
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 07:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757945333; x=1758550133;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YZqS1wDT/TqLpmj3G8ibS+mZyb/1ZmpthylezkrDMeM=;
 b=IWDV53p3GqVJPNXiVqErXAO2Pg+WwYOirjLd+i4e0LOQ4U6NxkBCyvNHqKivLqeu3M
 UchvdxI/6uV03vP2cxUCgL9GB18IvDsC+8S0VBSmSiRCwUqu2cqBSOSwwFTwABjXWq6i
 48FIFFT2qpJ0QxILQqOIa7YRGh3nuYTVXkE8aXzfU7g6S5aqWjd2iH/YrKC4KzD+DfD5
 B5ss/6i8kJBaxbX/5GkPMbOpKsdtQpJL+Y4OOlEvuWByhzTrvEzSSDZCAa9anF+fNNO8
 eUB3qdGsTPyCin9EmVEyKLePwPdiDgin6QvNF2FPqkbNh/zJYl7ddX18wpEcn3Bb9nQg
 c+iA==
X-Gm-Message-State: AOJu0YyV6QaP70YfEFPNKyjLx4LGOfEB7xaMssS1fwFFfn0VuShRPz3e
 zrGD1jq0h59TWXvqV3DJ3DQ8uz1jbCHlpysfadjv/mvNhBDUnpCtXPhiSrEEPVeM
X-Gm-Gg: ASbGncu2fy+xh3kmgMYo23ucogdIEs+zN+Mi3R0zlFQw6lXCsI/mPwqtO1fC5azkXvP
 czA5LfU0qJTEJmohKT0li2UqMPzIqMMoVDii+ZEwK8UXSJ+0AiR3z+bLYtHwy7+03wUuOwROQA1
 l9Lc2gOI2X+uTNeIiKvw4ppEqXhZ1BTM9OyUIbxb/gINjeR8HN/DmbWCit7l5lp3b+cLCuKyEaF
 6AaCP8qT3Vul3FrynOf9+dyh1JtMPLd2vWtdDqTTqaGamiJLRZP6fGrfdYj6MpwbtTvSc3M7JaZ
 8jtSfIxzx0ooiw8zUxRDh4ViaBP7aiuIIiES2P5W5Z/WDhPrweS0auAmp8eroXBpmv9OrVMhI1r
 FX4rlEXuq9BSOoJe/LZSM/2+k2tZCWODAF0rlmIhwvUznOSnFx0O9XOVkhVk72lNhra0DYB06HJ
 x3zXi83la4PFo7ZgaM2BYDWXy4uRN3KGWtGc5G/iODr/fry9SPtp2mezcltpBUXQFRvm2tZ3TGB
 v5Ltqicp7G8V5fmofAEnlZL
X-Google-Smtp-Source: AGHT+IGZrwDbZzZgNt8rKGgnpybzk15e0Nkd3Qeseb0y4WmeJ6hvJy2wSXLjgOqZrfYwp/cAN3Dfsg==
X-Received: by 2002:a17:907:6e8b:b0:b04:2452:e267 with SMTP id
 a640c23a62f3a-b07c3a76f4emr1374101466b.56.1757945332854; 
 Mon, 15 Sep 2025 07:08:52 -0700 (PDT)
Received: from saeedkazemi-ThinkPad.home
 (2a02-a450-7a0e-0-d307-416a-de81-9106.fixed6.kpn.net.
 [2a02:a450:7a0e:0:d307:416a:de81:9106])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07cc3f6642sm677105266b.93.2025.09.15.07.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 07:08:52 -0700 (PDT)
From: Saeed Kazemi <kazemi.ms@gmail.com>
To: buildroot@buildroot.org
Cc: Saeed Kazemi <kazemi.ms@gmail.com>
Date: Mon, 15 Sep 2025 16:08:49 +0200
Message-ID: <20250915140849.3312326-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757945333; x=1758550133; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YZqS1wDT/TqLpmj3G8ibS+mZyb/1ZmpthylezkrDMeM=;
 b=Q77XlP8PCd/x6ZpwHzdynlZH4PU53Y9EnZqMKxLES4aI1wNshNxJpiEekCu0r4KQlV
 yMVCcuORI+TlxQBdtB4AbBeXtwlz9vKoyouymhiwRr1xaXBSY9L93Pq0oVnhWyfEGYcl
 FCnrkzSfqmbJZriu1ucTzUMUplAJw9pkmpH5XB2CeYz6ubIv7IMG3CbeCdikZtsfar7v
 Qz7tg0IXj5SEXJC8udYpQtpqhsKDsQcz2KFDl8whwjeunPDRCAxrsMwxzDWFTOzTvwVG
 Iz5Z/pD0d1Ej9Dwry3a6jRKuMlU8of7oigqBoo7mInuepenbUxEkg6uDpyhYkvdkAyrA
 2YhA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Q77XlP8P
Subject: [Buildroot] [PATCH 1/1] package/fd: bump to version 10.3.0
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
https://github.com/sharkdp/fd/releases/tag/v10.3.0

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
---
 package/fd/fd.hash | 2 +-
 package/fd/fd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fd/fd.hash b/package/fd/fd.hash
index 5cad89cf31..991be349b8 100644
--- a/package/fd/fd.hash
+++ b/package/fd/fd.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  aeb949d3ab62960ebc4ff9c1b2d06065de9727c270f36020b8d95328d762688a  fd-10.2.0-cargo4.tar.gz
+sha256  4a32dbd98dab4faf307954bf854d0c0c5719816e1cd28fe49385b6925cc8c515  fd-10.3.0-cargo4.tar.gz
 sha256  73c83c60d817e7df1943cb3f0af81e4939a8352c9a96c2fd00451b1116fa635c  LICENSE-APACHE
 sha256  322cfc7aa0c774d0eca3b2610f1d414de3ddbd7d8dd4b9dea941a13a6eb07455  LICENSE-MIT
diff --git a/package/fd/fd.mk b/package/fd/fd.mk
index 9b6b305e77..c390b5221c 100644
--- a/package/fd/fd.mk
+++ b/package/fd/fd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FD_VERSION = 10.2.0
+FD_VERSION = 10.3.0
 FD_SITE = $(call github,sharkdp,fd,v$(FD_VERSION))
 FD_LICENSE = Apache-2.0 or MIT
 FD_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
