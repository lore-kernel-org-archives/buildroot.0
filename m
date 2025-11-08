Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB81CCFA18
	for <buildroot@archiver.kernel.org>; Sat,  8 Nov 2025 10:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F7E381191;
	Sat,  8 Nov 2025 10:57:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a6l0vz5lMdtX; Sat,  8 Nov 2025 10:57:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A2E481176
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A2E481176;
	Sat,  8 Nov 2025 10:57:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 80EBC2B8
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 10:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CC4240231
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 10:57:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u5FAFwmpQgzP for <buildroot@buildroot.org>;
 Sat,  8 Nov 2025 10:57:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5724B400C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5724B400C7
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5724B400C7
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 10:57:26 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b7291af7190so240213666b.3
 for <buildroot@buildroot.org>; Sat, 08 Nov 2025 02:57:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762599444; x=1763204244;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ddk2JkWsehhkr77IMjPVmcc1WSUC3iz9qPeuu3xsDoM=;
 b=HIdQkt7uvw3OPlSC4aZBP41+nK9vLQMllG/l1vfIXxT6LrWUHDXZNbD6xvCnhnhrHT
 gO4qzapiEuVro+58oOw6AQ2Kqvsh0jVmJ2VFoF0wE8vcib0cLZMdYkvIcYAqzYeRL42L
 XH3XYQ1llk1PpAJ6iPT90U35DQzQkPd+NrNVI5G4soGDrQ6It2/gp4/0OG9C8d4axIGa
 KQ1KE+EoTWRlS8+zXt2CLiHFJgRTpGJQq6+aY5G2qVZkk6DTmCuQuiyrdMh2slzRfRwN
 IxvnV89cGasCqkKge1/P6d/8ggm0iAy8aX51/sFbTmNQT86qNxCV9cRxUrW769G+py8J
 iglQ==
X-Gm-Message-State: AOJu0YzMQ8lWCzQUcXV0z01ecJFHTFrQ0BEXevy/RhFEr/YIZX5j25x+
 w7RyKGwu3sskjmC0oarXQCHD/BqDM2198a6a9YDwqzKMIlCfKzTLqXP7430+NzK2UUQEEAW7TqF
 pBbry73I=
X-Gm-Gg: ASbGnctFkinWdlc2S98ycRC3tDQ4gzkzymfknYHnZ7Q4JX7zEOzO76mzogWKaoG8jKO
 7lEJQHQPx2HRqcmVKs3EJMOhMEdU9SC/pqxn6IYwuSvwThIveO/1PXvGEywB4ILbtay8d2ZkUN+
 jtHgJWfXdu93AxSe+lAGQkuVu1SO4SPcOxOr7qMxpmkLG4L5yivGLJADgfbCksEWLRXsjN5snMN
 l2TIbAf5NtsV9eD04qJNj76ZI2CaGruCOE8FxX8zr9XSJGuZeSX9Qe6rvETF9ac1SL9fCTzWoxb
 tdoPgC/3+uoKpsA6mlxAfGYI+Pa9KVuJgc5Mo6dCII4xuVOAqoqFaCDD1CrNaBtSHeidCZ+29vF
 TBNAl+TXHoyruP2opecYiRI/u+VQ8GPPxw5incKqQE6/IG+JU4a21cpyL9MPWaaUicV6VPz0f7h
 htJ2rK0D5zRryFe+mHKKWDQViEfrCfZSlgpoFpCyoxLwv/Cc/HlUXXo7sIT8ahROXV3VQoSi2YN
 wHtx/ZsuVSLiBPTnK4W6ldzkZAI4nu7pl8Tui9lXg0aNkZhri6q
X-Google-Smtp-Source: AGHT+IGlbR3prrGB4T1WtdlJMFi2JTi4H65ujbID6qTElp0xf0nj/53eeWne1UwzPHti4FboqyjT0A==
X-Received: by 2002:a17:906:6a28:b0:b50:a389:7aa4 with SMTP id
 a640c23a62f3a-b72e02730b3mr216121366b.13.1762599444180; 
 Sat, 08 Nov 2025 02:57:24 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-9-99-245.retail.telecomitalia.it. [87.9.99.245])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bdbcea51sm495415366b.4.2025.11.08.02.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Nov 2025 02:57:23 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat,  8 Nov 2025 11:57:20 +0100
Message-ID: <20251108105720.2582873-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1762599444; x=1763204244;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ddk2JkWsehhkr77IMjPVmcc1WSUC3iz9qPeuu3xsDoM=;
 b=c70TvIgrLg22GVHWvrRgjT6x07+AQ2P/QiP3Y7DyDSZ4S5y6kWjY4xE35w1bk6QB9t
 i9h1NpSDP/TMcXV6QyPlopNX266UggipUquu4pPdm2USnozVBS4/v0M3WkkWcEdOy1KX
 Q1Kg5hWzUVaGedMDOf0IKex1UTGmiCOrq14vo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=c70TvIgr
Subject: [Buildroot] [PATCH 1/1] package/cctz: bump to version 2.5
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
https://github.com/google/cctz/releases/tag/v2.5

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/cctz/cctz.hash | 2 +-
 package/cctz/cctz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cctz/cctz.hash b/package/cctz/cctz.hash
index ac78cd611b94..6936921ac404 100644
--- a/package/cctz/cctz.hash
+++ b/package/cctz/cctz.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  e1a00957d472044808a24a26f1ba020f36dc26949a69c214562d96b74093adb3  cctz-2.4.tar.gz
+sha256  47d2d68e7cb5af3296dc7e69b0f4a765589f1b2f4af4b9c42e772414c428b421  cctz-2.5.tar.gz
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  LICENSE.txt
diff --git a/package/cctz/cctz.mk b/package/cctz/cctz.mk
index 7f5d960a42e9..14b8dcea8844 100644
--- a/package/cctz/cctz.mk
+++ b/package/cctz/cctz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCTZ_VERSION = 2.4
+CCTZ_VERSION = 2.5
 CCTZ_SITE = $(call github,google,cctz,v$(CCTZ_VERSION))
 CCTZ_LICENSE = Apache-2.0
 CCTZ_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
