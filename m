Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B256CE6F06C
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 15:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E9BE6070F;
	Fri,  1 Nov 2024 15:43:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AQDLKuPkUD1d; Fri,  1 Nov 2024 15:43:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D801605D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D801605D8;
	Fri,  1 Nov 2024 15:43:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00D623B
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 15:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D470041E76
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 15:43:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1lExPa1sR9B2 for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 15:43:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AF55B4071E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF55B4071E
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF55B4071E
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 15:43:29 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3a3c00f2c75so7900855ab.2
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 08:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730475808; x=1731080608;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5ybko4QmDi4W/LY1kSIJhxt3xr3qXJnyJrbfr63BzC4=;
 b=r6qbwU595FhfDdBt3BqJ+TV7463cEHBS6JadSezQ01eniUBJBNb/AA/HurNgOO844D
 jnnkddYtlWxksy3FTgRFLE0s3mnJiwpkbDUBtWOWRlZgZgn5Q01AhEodwSRb2GtK8aKy
 l2a1ODUMrScuiO1/2Fl+Kg+cQVIfaWnN9RCa0d+apdQuze9CQPdNivveTehynJhm5oJb
 d+k+9+JjzmSiul8k9GOXpcxeB3/etr7ZRhwmJxi6UT561i4KOVNF4lYKH/8Dqbzqepd2
 ewtlwjy0ojlbZ8IH1wtTJvLla2ftkl1Pffscg0ZBSPH4+96W/BQDAntaT/1hDB5sab1K
 mo1g==
X-Gm-Message-State: AOJu0YzJAOxbqWe0e2GMMOZZdXu3aI9pPe4WKP8RmS1s+ImQt3+mfThL
 4B3e+yepgcA+IJxNMnrAPbmq89bBBQ9PgbnL/dZniButfDUz1evlvKPdWA==
X-Google-Smtp-Source: AGHT+IHpEwMouCfx5+RfCIrex9lSTgvHgFuw+emMQvQHloSeWKp8Q0iodMPinHzTMyvWRtjErlwAxQ==
X-Received: by 2002:a05:6e02:1a8b:b0:3a0:90c7:f1b with SMTP id
 e9e14a558f8ab-3a6b031cfc9mr43626525ab.12.1730475808233; 
 Fri, 01 Nov 2024 08:43:28 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6aae9fd73sm8082015ab.22.2024.11.01.08.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 08:43:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 09:43:26 -0600
Message-Id: <20241101154326.366638-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730475808; x=1731080608; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5ybko4QmDi4W/LY1kSIJhxt3xr3qXJnyJrbfr63BzC4=;
 b=bs4pDpGV0JAtbrShcY4pm0Mo9s2isT8w80kxFk0iaMS8aZ/5Ivo3ZMo1gsFQcItpg0
 wej6arI8tGYOMVgbzbF2lcOFTM/luQoiGqllP1qLhnnqJ2PGkIBD+L5skrRQxVyGjuxB
 7gf6YJZRVKLmCB2rILp8COOKbo9DNr3TMLaQu/RjZm/8AfkCw1MzBB/5nwNPAqpXW2z4
 7IJfx/Ft/Hs9TN/eSATQiYpz4CvJbY1rY21IpXIMK/P2Pkvi3SPMIWczdUUuev42QVcG
 iuifITEWzpP3Re5KUp32B0sEKZQD9w+ACkLI09g0JVx/F2rr7Q9qECrbSsDhjfzxn+26
 Ck6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bs4pDpGV
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic-settings: bump to
 version 2.6.1
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

Migrate from pep517 to hatch setup type.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-pydantic-settings/python-pydantic-settings.hash | 4 ++--
 .../python-pydantic-settings/python-pydantic-settings.mk   | 7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-pydantic-settings/python-pydantic-settings.hash b/package/python-pydantic-settings/python-pydantic-settings.hash
index 1a45f34cea..c1acb00dc2 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.hash
+++ b/package/python-pydantic-settings/python-pydantic-settings.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic-settings/json
-md5  38eecfeda26d332803c540fd86105509  pydantic_settings-2.5.2.tar.gz
-sha256  f90b139682bee4d2065273d5185d71d37ea46cfe57e1b5ae184fc6a0b2484ca0  pydantic_settings-2.5.2.tar.gz
+md5  eb50e2f88dfb5229d7319be57dcc4ed0  pydantic_settings-2.6.1.tar.gz
+sha256  e0f92546d8a9923cb8941689abf85d6601a8c19a23e97a34b2964a2e3f813ca0  pydantic_settings-2.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  eb355a753e020346d33d83bf9769135b89fc610568ac531a01c295bcee7fd998  LICENSE
diff --git a/package/python-pydantic-settings/python-pydantic-settings.mk b/package/python-pydantic-settings/python-pydantic-settings.mk
index 36add45527..90e982b3ff 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.mk
+++ b/package/python-pydantic-settings/python-pydantic-settings.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_SETTINGS_VERSION = 2.5.2
+PYTHON_PYDANTIC_SETTINGS_VERSION = 2.6.1
 PYTHON_PYDANTIC_SETTINGS_SOURCE = pydantic_settings-$(PYTHON_PYDANTIC_SETTINGS_VERSION).tar.gz
-PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/68/27/0bed9dd26b93328b60a1402febc780e7be72b42847fa8b5c94b7d0aeb6d1
-PYTHON_PYDANTIC_SETTINGS_SETUP_TYPE = pep517
+PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/b5/d4/9dfbe238f45ad8b168f5c96ee49a3df0598ce18a0795a983b419949ce65b
+PYTHON_PYDANTIC_SETTINGS_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_SETTINGS_LICENSE = MIT
 PYTHON_PYDANTIC_SETTINGS_LICENSE_FILES = LICENSE
-PYTHON_PYDANTIC_SETTINGS_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
