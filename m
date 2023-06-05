Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B25C7EE24
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 07:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C700822DA;
	Mon,  5 Jun 2023 07:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C700822DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6PiXiibmgmCj; Mon,  5 Jun 2023 07:47:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41EC681FD2;
	Mon,  5 Jun 2023 07:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41EC681FD2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F5351BF356
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC67260C03
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC67260C03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jSQ1glm2OYoD for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 07:47:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14D0160706
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14D0160706
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 07:47:36 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-33aa60f4094so13944095ab.1
 for <buildroot@buildroot.org>; Mon, 05 Jun 2023 00:47:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685951255; x=1688543255;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GYBAi4/YCtifXZJveqpq3kHTRsoktmoxSnL7SHaPeq4=;
 b=ZaWxJi0YPTrcgj3nh9l1AB9xDo5Mi0iuU+mBj3sZIv6layvk9yaT2AnPRAD7c4D5lM
 mF5LBZvOnH2lw2gdgYYlenY6mqdXgq4uc/R2vP6hsSrm4dmsgAvgBbUBJm4Xyu1ADy+9
 q0XotLNmUvz4eHv5xIY4Nki6z4Lsdadxh4FWdZ1ApO9qD7csyp7xdPntkanviMJOioZl
 C+xHr4AoX4iiLRBQ3eODPzQIk7UNwCHpz9yHn8exIVF4dzTFsdDX2YTj1P/xgnhvdjUF
 uEYDdavlwxCxbbAvU0ZpGFZsmadYP5L/GIpHrDYHGQ/9viwyYjJjVXu87zuuKi67nWri
 TaCg==
X-Gm-Message-State: AC+VfDyVDrebX0bbuEl/W0FCGtiUYRz0Gok0EAE0OPdJigMa2BGIR6to
 HjiaFamHn8WXMoC6H2tpNfjLlox8TOQa8Q==
X-Google-Smtp-Source: ACHHUZ4egTk1FXqy8Km1nJjdv8vGfJoHBB2pV5IOryEzcHeTgAdjPWOgvtC2OqVAvQR6PJfLCvewtw==
X-Received: by 2002:a92:2808:0:b0:331:acc9:b554 with SMTP id
 l8-20020a922808000000b00331acc9b554mr10671668ilf.14.1685951254945; 
 Mon, 05 Jun 2023 00:47:34 -0700 (PDT)
Received: from james-x399.localdomain (71-33-129-69.hlrn.qwest.net.
 [71.33.129.69]) by smtp.gmail.com with ESMTPSA id
 m16-20020a92c530000000b0033b2a123254sm2197237ili.61.2023.06.05.00.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 00:47:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jun 2023 01:47:32 -0600
Message-Id: <20230605074732.1899050-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685951255; x=1688543255;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GYBAi4/YCtifXZJveqpq3kHTRsoktmoxSnL7SHaPeq4=;
 b=Z+E4MutM81W5sbxwZbR0BSvQxKP+L6I5kzJ6WUhRUPhCBdAwOADG45OhcPVREVD7cy
 j2zqw3ZvopLdTC3OrbJY/H0JmDuIdTWh8jYLuhE+Rz0wozdXImNxbI5r8omLe3lTzrIc
 +9LVN6NW2opR/ZjrqQU01G/uXBqtn3k2APv3bp0c96Viiu8D330R7Bwp0krl0mqL7yjb
 vpgSFidWxhnIQnAyNvonZh60kwUj0wiOg67WwZ9yUVLEv/T3Hrc2CCDYP6bqLV+KCzty
 kZLpdRV4maCn+oHyFG/c6C4OKHe1rs3peEyoGR+Eys3q4M/YJI/k3KU1tiDsOGNNlHPP
 sXvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Z+E4MutM
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic: bump to version
 1.10.8
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index e73a3099a8..88b17f4575 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  2e036b5f993b93dd83f6a7009252ae78  pydantic-1.10.4.tar.gz
-sha256  b9a3859f24eb4e097502a3be1fb4b2abb79b6103dd9e2e0edb70613a4459a648  pydantic-1.10.4.tar.gz
+md5  f0e286c32f40ec45aba9603742739cd6  pydantic-1.10.8.tar.gz
+sha256  1410275520dfa70effadf4c21811d755e7ef9bb1f1d077a21958153a92c8d9ca  pydantic-1.10.8.tar.gz
 # Locally computed sha256 checksums
 sha256  9e3946690ac88b6b73e8f001a0586af13568be8852fd514e4393f39761764387  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index a1a4dc9b16..b800426d22 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 1.10.4
+PYTHON_PYDANTIC_VERSION = 1.10.8
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/53/17/34e54e352f6a3d304044e52d5ddd5cd621a62ec8fb7af08cc73af65dd3e1
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/23/65/2aa13873e9e0084ecaec00fbe6c6096b65e1ab99ba66bdbf7e4e7c4cc915
 PYTHON_PYDANTIC_SETUP_TYPE = setuptools
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
