Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3944DC83F21
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 20:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 436DA8212C;
	Mon, 14 Jul 2025 20:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sziyOPq5OXkv; Mon, 14 Jul 2025 20:26:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E79F882178
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E79F882178;
	Mon, 14 Jul 2025 20:26:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 797755E
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28DCF8211A;
 Mon, 14 Jul 2025 20:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d8lUnPyxvy3c; Mon, 14 Jul 2025 20:26:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 81D58820E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81D58820E8
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81D58820E8
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:15 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so33269045e9.1
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752524773; x=1753129573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iLW8M/Sd2X/L0aG25Y7jD4JusQT3pBNe+yhlsFzpkb8=;
 b=BxBIrd3x3qk0a3SX6O6ngMpDRmGGiyHOow2NdTqE68iLvlbtVYgnRvKZRc8yUNrUZZ
 kb01dPjdZ2Srz9zNEDAFaakWMHJEfWwAfZczxydL1F0338ur1yduP5ZxHT/llWchiVRK
 cteniB97UePg3wk6BFuv8skFM/INMhrNuwTUONvB+G+/5zFOaIh3clGlZZPpQdYUCKHO
 kvW1PnX+lg/ETXD8S6uUWTOISsGIzdl8dxlNk9mIEy6SfGgfoG+xy8HWZNftyXgSRQ8q
 xhHTz7FYfDWYzMpmNmWigKeHPF4s0WcI11tfcakbtjqlJ9Zit0Z0thBFYBNZmJ8+IuN2
 YWcQ==
X-Gm-Message-State: AOJu0YzyW0Udnn93F0XUDOuEj++4HGqCEdwqcsvTAVQGH7vEHQzSOYMz
 16NH8qzCYXnJoCaPftDlhfRp25KnnHKh8JUZ2tdPADmas750OJwVklhBzyjSeA==
X-Gm-Gg: ASbGncvvm4OG4Jo3zW7z3cKwjyfAdYWFukYzY5amzGCSvK0ppemYyl5xkvlPgxaGPRS
 BJmttn3eIEDP49AdQ/vHpaiop/ElWbWWF9sc9ZypR/OOGYSFWcUqHVjzIBxEsPPKFDgRu/uaZPP
 Hd4IVk266BcnPfxL5AR5WgZAVA7U8yWt960p7mbBoFDA9V9ofB+fJlrb+tpmCKtMc414ggDTfIa
 8fNjooYGoo6/CciEcwTXSrIbGC7blVsY77GAK1i/Yu5Nr8M0IKT454WWeWvbpO1qjYFAClODCud
 bYSFNu6FPbvv3OYZaaC8JLYjSN92pi1DTPE5HSY/zWIR1uUFCH7/mNpaJd9gWpc2mjL8Y3ILvzH
 EyYWjqR/nV51zX/U5q48tDP8uKZanHEGW
X-Google-Smtp-Source: AGHT+IFpDJxjbRqMdkEYFd8QENU0aMmt7vHs8HmTkQB5pOSvMwq/nCPh9N8OfnS7+yRU9/x6o2i0+w==
X-Received: by 2002:a05:600c:37cc:b0:456:117b:94bc with SMTP id
 5b1f17b1804b1-456117b95bdmr74605235e9.17.1752524773399; 
 Mon, 14 Jul 2025 13:26:13 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc91e3sm13144838f8f.43.2025.07.14.13.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 13:26:12 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 14 Jul 2025 22:26:01 +0200
Message-ID: <87da28d0f8443a17ced8a7d6e611cf4d2668bee5.1752524763.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752524763.git.yann.morin.1998@free.fr>
References: <cover.1752524763.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752524773; x=1753129573; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iLW8M/Sd2X/L0aG25Y7jD4JusQT3pBNe+yhlsFzpkb8=;
 b=MMHbSQkKG/GxX3GRkO6aGFFhfMvfNgiaK7lHJHTO36fTHn+/QPoGjFXp0xfxvkqSI7
 6Ei92qSd382XzxQl6+2yW4sGskDOHaSYkkQa90KbyLlNY7efuhZPVTkFaYvQCP6QBVKq
 JXGlh1jdL1YwjYC510kmo+BonQfL4DFrduKG9cBxqVdjHvnfFuYQa7uYA1MelqoUER1C
 tDkgvtaIAajGwoUdsOMTp/ZLvVq/NagCVVZlb6PpTbhiZGGb9VNMRou7atAqwxvsDt8C
 OL3yB98msVulyQF6M+uhhQ2IACbP4zWznJ+V9n4OH55dbROMbjp+a1YSzONtuyiUF41A
 oZrw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MMHbSQkK
Subject: [Buildroot] [PATCH 07/13] package/docker-compose: bump to version
 2.38.2
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Christian Stewart <christian@aperture.us>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-compose/docker-compose.hash | 2 +-
 package/docker-compose/docker-compose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index e36011e7a9..a2ffadd31c 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  481fe93cc6bb76f62b9d2a10c0db67c662d0efad38c3a307b65dd250d8d6599a  docker-compose-2.32.4-go2.tar.gz
+sha256  0c0453729b7a37badcf530fc140b1b8b907cbdcecfdb6be6413f410c86665c70  docker-compose-2.38.2-go2.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
index cc98e24133..f70cf725df 100644
--- a/package/docker-compose/docker-compose.mk
+++ b/package/docker-compose/docker-compose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_COMPOSE_VERSION = 2.32.4
+DOCKER_COMPOSE_VERSION = 2.38.2
 DOCKER_COMPOSE_SITE = $(call github,docker,compose,v$(DOCKER_COMPOSE_VERSION))
 DOCKER_COMPOSE_LICENSE = Apache-2.0
 DOCKER_COMPOSE_LICENSE_FILES = LICENSE
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
