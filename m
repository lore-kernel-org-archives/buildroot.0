Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A084C87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 15:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 078AF41012;
	Wed,  6 Aug 2025 15:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hypCUgD2G-nF; Wed,  6 Aug 2025 15:06:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3892A41094
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3892A41094;
	Wed,  6 Aug 2025 15:06:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A9519D79
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 15:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9042260B33
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 15:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N_CdtmJt7dw9 for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 15:06:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B26F460A80
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B26F460A80
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B26F460A80
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 15:06:45 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-459d4d7c745so121425e9.1
 for <buildroot@buildroot.org>; Wed, 06 Aug 2025 08:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754492804; x=1755097604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zEF3aoeTPVFC2QC3gBzQGmkVGQ3I/04r94fwmLY4aDY=;
 b=GcIguKJ/QWDhw4qZrEpXR7tuhu5eBnKCHQjK6zVh/NYkyXyd2CreDqwo0FfKoXKL03
 uCOwcieEUMzyvJmljF8UrkQeWOwLo2PvzbLVmf2FSOGJt89y7zCQDj7iDmqz3TjlP+uF
 Vq/mj212CWEet6UFNaswwRFqqOiOWOg9L+6AAN907mF9YpxOltNdzzkrl4lE1TgXbmDw
 7V/RQlPPWLNTvqLmvCPBiO2Bie8LwVaDExIgxxdjFOvuT14j8EOhbiMvUn85Uz55WT3o
 CRMTMS2C561+WAYY1NbJ/ao5klxMRRKjPIwqiES0kGMmbJhq9J/pq6FFyPws/pX4n2aO
 vNig==
X-Gm-Message-State: AOJu0Yy+OwtiHLOb0wLyHHw902ASlShTiJ+GbZoqlNVFx+S66KXf+BC7
 2usJ0wU8Z8Q2rINfh+3G8uluODNd5zahHrK+sKcwr1uiL5s4MTIc6gHryemvcg==
X-Gm-Gg: ASbGncuZSSuPUtiCgbuPRUl5fzUZdMzint7QIpiHvRbEOAr8NWAaZP+1yqj477I2M2q
 NxEJO0Vn99snuhcfHZN0ch+FHc3SwxuPVMUaHb3FMDZKViNYdmbQFgz907BVyO3INlHiYx5n/jG
 h8skmVzr88CKWtMgubOBOugIYdFvn1kGAXcRrnMZ1jw3m/BGJf76mprzFELj6XwAiHv5M9ITsuh
 CsV5ehNHpXJfRuhdBBQrvSxbyG2I5DNCu81UvIvLfzXEGLDPTJNuYY/CqG8Jqs6nSiOHMplHDdc
 P9ulOby2t7Wc4deyGQUDm28iUTDGoHtSmLwd2zZuSa9KJ0uu/zzqx3v8EutCvnPDlmBySP9GcTg
 qTq09MeQKvhX9+ro=
X-Google-Smtp-Source: AGHT+IHC5/kzX1icY8F/IziMf9tdxU/SQTFswWRgtPyYa3ZXXYJkAcU8sqbOeEf/0iJBT9cCntNjng==
X-Received: by 2002:a05:600c:1992:b0:459:d709:e5a1 with SMTP id
 5b1f17b1804b1-459e7440f15mr25836205e9.6.1754492803564; 
 Wed, 06 Aug 2025 08:06:43 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:5e58:cc24:6853:da7f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3b9160sm23456493f8f.21.2025.08.06.08.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 08:06:43 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Maxime Leroy <maxime@leroys.fr>
Date: Wed,  6 Aug 2025 17:06:36 +0200
Message-ID: <20250806150636.20937-2-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250806150636.20937-1-maxime@leroys.fr>
References: <20250806150636.20937-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754492804; x=1755097604; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zEF3aoeTPVFC2QC3gBzQGmkVGQ3I/04r94fwmLY4aDY=;
 b=D58uWNpyeBnaBogqntMjZlyqlB2dhVn/Z0SaRAiG2LI0+240win4eoIB86JxCD9O7x
 kHSfL8apcr6veBG9ybQQg3e9HTkIUUJoARlnIeqQT8ARLpyGJTkgHQlbtoYMhi5+H0lZ
 1SzCw/PDxaUetZH3asZ9D7YdfbdCzsFvOh6qlfEbo6dY6hUmzCsj3zz5Xy3uuuAehUzt
 aKlhSoJxog0ZHZd8vv7xk5ll6rDXB4AOFs1jliA6uO1mhI05jqJNjgGs1Jm8MWeSySnC
 8eSAH3EJmiL2OUeC8Rf06gcCca0LQdaFOjrX5+SCAUBc8p/K/dWQTbiL1lirayhb3SQn
 1o9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=D58uWNpy
Subject: [Buildroot] [PATCH 2/2] package/grout: bump to 0.11.0 version
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

See the release note of the new version:
https://github.com/DPDK/grout/releases/tag/v0.11.0

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/grout/grout.hash | 2 +-
 package/grout/grout.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/grout/grout.hash b/package/grout/grout.hash
index 063e518283..0c036b05f6 100644
--- a/package/grout/grout.hash
+++ b/package/grout/grout.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  9e07275f7d97e9a02f29ac5df2112ca34a0af579e5435d8990ff6339ab30c3ef  grout-0.10.3.tar.gz
+sha256  7bd7caecc3451aea3462a86c31d2ee953a9b7789975b5522dd5f09204558f99d  grout-0.11.0.tar.gz
 sha256  1e412aae8da58b718c78b3d7a52eb547004384d4347e4746a22ca6af7522930c  licenses/BSD-3-clause.txt
diff --git a/package/grout/grout.mk b/package/grout/grout.mk
index 53271dd913..5abf265f19 100644
--- a/package/grout/grout.mk
+++ b/package/grout/grout.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GROUT_VERSION = 0.10.3
+GROUT_VERSION = 0.11.0
 GROUT_SITE = $(call github,DPDK,grout,v$(GROUT_VERSION))
 GROUT_LICENSE = BSD-3-Clause
 GROUT_LICENSE_FILES = licenses/BSD-3-clause.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
