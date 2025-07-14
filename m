Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EF4C83F1B
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 20:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 978128218C;
	Mon, 14 Jul 2025 20:26:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DOO0CcCavK53; Mon, 14 Jul 2025 20:26:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C43AC821AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C43AC821AB;
	Mon, 14 Jul 2025 20:26:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30118AF7
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BA9F82135;
 Mon, 14 Jul 2025 20:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jpi-G7mc2bWt; Mon, 14 Jul 2025 20:26:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 70288820EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70288820EF
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70288820EF
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:16 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a57c8e247cso3161874f8f.1
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752524774; x=1753129574;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=k8rxeMCMKKnnpjx86dk/vXxoBj4yv397MX2KP8yLSu0=;
 b=HSVRKRXPL07ktiiHl6Kv1uryuMyWxxANa64Mt3PowcQqn7dDbQxxb6qIwk/hTs5HM2
 qahXWDmjgBwFCjvME/qJPNHskziXziHo5hCe/vVLJJ9i3y+RhN7NPY7nfaU+Gi3Y+HS0
 /22Qj79WEH6gB0QIrPJQ6htbr38lAZWw6shZFkyBRtCyg6vLG15xV9xUcSV+wkxv++C1
 P2aM0oi/T20u5QBu8VGa9knZ4+LafGaF9/kW8hYJwLx+jcpDsV+EtJ0dfq/ZQLKepSOQ
 mCWKU9sD2QIURkW34FReurOMjoI/G8sGF3MYrD3Fu7Qyyklv8BMQfMD7mfTg/+3BqpQL
 o34w==
X-Gm-Message-State: AOJu0YyeoysKAEzjcRHTzNjRf3X+1p2C0VoyQ8MAW5xfCuMpFb5KENq4
 zPkMkowKry6uYmnRVQYaUPZnc6qpQ+RG1fXbiEj7RSg26gSLzu8pL6LplpIJag==
X-Gm-Gg: ASbGncvLEAeQxn3rdcJisS5cMuO3Qa91nwXrXZbXlgh7R5Jv1FUw40bZTDHreUcRq6b
 CQYL2MXhrmd1JZkxCg585TM3nAcV9Rhc5P54LWzfhFA8LdlpJbw5dIpb291/Lu5//Hk3tydTp3k
 u7UmA1eXpbyFA+dFSa0+HqQOWA2bXPbLVAqSB6e/LKX0a076sP/iTMGWQXSgteei2FdFXqbZHr3
 b4eiPJYZM9iKzA27hoqWsgkyM5VtNK6sKcb5EI+MWA5XWInYdj2u6GPbUFlpAhd3QjM05u6BNUL
 NVNJqoUO8zCg3+X7CeGPTEcKeW6b+kaqi/LBYtyIWa2wAKk5G6ptNyaQEHBzNLd4IoypsvW84It
 QtFW1PYby2f2YZqfZQoMMyo6X0iMz3eG7GeA3V47Tbrk=
X-Google-Smtp-Source: AGHT+IHBuzUsvtITX6iRsqSbpDxvb7ZIs+Oo2001OKM3isFY97/nxrp26cihK0NPC8Ykon57xo1JxQ==
X-Received: by 2002:a5d:588f:0:b0:3b3:9c94:eff8 with SMTP id
 ffacd0b85a97d-3b5f2e1b635mr10677862f8f.27.1752524774285; 
 Mon, 14 Jul 2025 13:26:14 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc91e3sm13144838f8f.43.2025.07.14.13.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 13:26:13 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "Yann E. MORIN" <yann.morin@orange.com>
Date: Mon, 14 Jul 2025 22:26:02 +0200
Message-ID: <a6832ffbb872906680cc07eb6b8a86c6f7fe4221.1752524763.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752524763.git.yann.morin.1998@free.fr>
References: <cover.1752524763.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752524774; x=1753129574; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k8rxeMCMKKnnpjx86dk/vXxoBj4yv397MX2KP8yLSu0=;
 b=c96TOhas93rWr1VnOG81iNlxi2j2nILYOAas2NfGV4/GKjRW8mYAy9HApJa6di2o9G
 qT+eBlhIUaURiuL/v0W3EJxUuYq11AydOjtRwlXVYqai3dQxBv3DtEkYYiRk1SzbqYSS
 TozxnKgJvCxzE+XEM6MAgDX4iYK6cUkcHV+zHmcwXRJx2v13gbiDtyeJ6omuxvsHdedk
 yNYPWjK6Hd4HabFF9kOVEL1IPbv8hCIwsj1R/6RXnGDe1IkfiXr4CITqfSomoSyNmQHh
 eHDVc4ezisIktMJlRZMVraw5Y8V57BKnf1a3W7T7kWoP7XiZLbNxeX2X4iHrjzZmcZyP
 I7fQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=c96TOhas
Subject: [Buildroot] [PATCH 08/13] package/docker-credentials-gcr: bump to
 version 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yann E. MORIN <yann.morin@orange.com>
---
 package/docker-credential-gcr/docker-credential-gcr.hash | 2 +-
 package/docker-credential-gcr/docker-credential-gcr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-credential-gcr/docker-credential-gcr.hash b/package/docker-credential-gcr/docker-credential-gcr.hash
index b2ad975851..469e8d6b17 100644
--- a/package/docker-credential-gcr/docker-credential-gcr.hash
+++ b/package/docker-credential-gcr/docker-credential-gcr.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  126fdbf7351d2c7aaee6c525d9660738519eae53eeef77920b105fd4d1bc5dbd  docker-credential-gcr-v2.1.26-git4-go2.tar.gz
+sha256  a327753270232cb7f112b98328d5b56ae2da095ad74399b769aa5dad4393c8ae  docker-credential-gcr-v2.1.30-git4-go2.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/docker-credential-gcr/docker-credential-gcr.mk b/package/docker-credential-gcr/docker-credential-gcr.mk
index 658e9baf33..f889eb56c9 100644
--- a/package/docker-credential-gcr/docker-credential-gcr.mk
+++ b/package/docker-credential-gcr/docker-credential-gcr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CREDENTIAL_GCR_VERSION = v2.1.26
+DOCKER_CREDENTIAL_GCR_VERSION = v2.1.30
 DOCKER_CREDENTIAL_GCR_SITE = https://github.com/GoogleCloudPlatform/docker-credential-gcr
 DOCKER_CREDENTIAL_GCR_SITE_METHOD = git
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
