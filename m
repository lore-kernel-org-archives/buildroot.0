Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B747ED0BB5F
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 05:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 828F780CD6;
	Thu, 24 Oct 2024 05:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2r5L1Wha_DC7; Thu, 24 Oct 2024 05:16:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C03C810D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C03C810D3;
	Thu, 24 Oct 2024 05:16:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 990AF2073
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7535E6066B
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id naXXBXK7wceY for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 05:16:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A04EB60664
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A04EB60664
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A04EB60664
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:16:41 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3a4dc2fff04so2476315ab.0
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729747000; x=1730351800;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qkjOT9op6x1rYZ1DkP2g6E4cpOyI5MeNQjSQeIqFSi4=;
 b=vbA7pkEiaOF3VJgkXLWtqNXLX3gyMaMCM4gQ0rjKzRQFwXpj2ARwGlpKo2Z2C0ZF1k
 r+ST5/54bYVla2LHqxHWA2HCxSZl66WOmaNYjIHfIb+9/z/O1Dq9y8E4WuTFzyUycPLS
 0OdH78ihSs53IS47R119KGMsNFDC2qO8Qb3a1CpZcDUmPdWFgVtLNgrXSriz1J/hkTuI
 4dILwOin/vYbu9G+lD8z053gSsrXLlK0mw8I7lfjbHUoHNujpJIQSyQtwAjoYt4koCH4
 Ee3EHqU3trqFM2ah6KOA2HCtHHd4RwnfFcNU0HxNYhxaSpHAz2CJ7mdRGOzS2IGQO0Uj
 vVoA==
X-Gm-Message-State: AOJu0YzZjIa19LnE4XY6+okUNQVOMkRTir9+bEIb0YLONqoqWpuy/R8I
 TDT5kQ1BGqLu30M3MsPrHau8EjUKAXSfsMEhnT0SEbAeA8vO77eNxMc00Q==
X-Google-Smtp-Source: AGHT+IHcaqhXaly95EDsMQLhRJQrt0Gr+Jmm+yrLIDAWPjBREyr1f3+6d9GO+6ldJbhe5eWoO1GSmg==
X-Received: by 2002:a05:6e02:20ef:b0:3a0:9f85:d74f with SMTP id
 e9e14a558f8ab-3a4d59be11cmr55194985ab.16.1729747000231; 
 Wed, 23 Oct 2024 22:16:40 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a400ad88cesm28937695ab.44.2024.10.23.22.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 22:16:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 23:16:38 -0600
Message-Id: <20241024051638.3393779-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729747000; x=1730351800; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qkjOT9op6x1rYZ1DkP2g6E4cpOyI5MeNQjSQeIqFSi4=;
 b=CFsSI11PD/Wzm5KhEbHBIEWypcoASoz/x65M1zE/xvqptY4yLEVxW4U+DdQtNR/hdh
 BIrXYSD+KQRQTqOKNOkChuDVznkvfa/1HwUyfUGne/Vzl7MxUqVgvjbh7leJZX0Viife
 gcHi12mhOeDJz0TFWniTdHQmdnZlhi8fBQn3H072GIcil43cYNtRfmSH2u3MC+WdZfcn
 YntudH76h3OfyLgX5tQzfbqtMoeG1bwkgZQEhbkmdbBHlY0o8Gh5xNBFOo578Dcm+H2G
 CFfOp0NLHY7znpjy7aPydAC2fhoR4wUNYdnTQwLitPU8pMNPegkdPNJKrISFF3AL3G9d
 8rlw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CFsSI11P
Subject: [Buildroot] [PATCH 1/1] package/python-docker: use hatch setup type
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-docker/python-docker.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-docker/python-docker.mk b/package/python-docker/python-docker.mk
index 55ba405f7c..582d9ee1d0 100644
--- a/package/python-docker/python-docker.mk
+++ b/package/python-docker/python-docker.mk
@@ -7,11 +7,11 @@
 PYTHON_DOCKER_VERSION = 7.1.0
 PYTHON_DOCKER_SOURCE = docker-$(PYTHON_DOCKER_VERSION).tar.gz
 PYTHON_DOCKER_SITE = https://files.pythonhosted.org/packages/91/9b/4a2ea29aeba62471211598dac5d96825bb49348fa07e906ea930394a83ce
-PYTHON_DOCKER_SETUP_TYPE = pep517
+PYTHON_DOCKER_SETUP_TYPE = hatch
 PYTHON_DOCKER_LICENSE = Apache-2.0
 PYTHON_DOCKER_LICENSE_FILES = LICENSE
 PYTHON_DOCKER_CPE_ID_VENDOR = docker
 PYTHON_DOCKER_CPE_ID_PRODUCT = docker-py
-PYTHON_DOCKER_DEPENDENCIES = host-python-hatchling host-python-hatch-vcs
+PYTHON_DOCKER_DEPENDENCIES = host-python-hatch-vcs
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
