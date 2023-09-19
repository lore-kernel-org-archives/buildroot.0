Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D07CD5BD6
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 15:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C095860BC4;
	Tue, 19 Sep 2023 15:28:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C095860BC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J0Y1sT3e6Hbv; Tue, 19 Sep 2023 15:28:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 179456160D;
	Tue, 19 Sep 2023 15:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 179456160D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 400C91BF28B
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 15:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 268CE836D5
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 15:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 268CE836D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aZtY2w9z8E5m for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 15:28:50 +0000 (UTC)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E49583657
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 15:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E49583657
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-52c4d3ff424so7260437a12.0
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 08:28:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695137328; x=1695742128;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HNyPEamMaApdPKC+VVk+2qj3qgPGHeJZuQe/wS+6AiI=;
 b=kvM9TiCJoe7P5emNq82tjmOJvmJwFvAAsE90YcNTFJYm7rDKSlDxhFv9fvUvTh/Cwb
 2D2t5hvVrnmIAreZv3S4CZISU7Zc2Ge2NbEqwH6OrXet4ojmL2vqDFMkAnSr6Tvxvu1M
 bVL5uCduJETLapfapmHiYSc4AJALFmfaiUtBnoyds85O3yqmJo7GNBt59abtRxf0r6MA
 coRGo6CLf3AXXXjfzDAuuiXzOFro70rBSC1Xj4OhejHJjCGrg2t8qzRrBCjxseSdGfcG
 q0pmo8XrIcx+z1201UFaxJgGz6lWqOgCJSf3008WFLgdcmfmeHQ6gsJX6sVseLVTHH0e
 HsbQ==
X-Gm-Message-State: AOJu0YxTdlG6pUfOOu0biXNEkepgmld+IK61njfW1eD+BTzfDokBt8JC
 dETBL420RgViKETrprpFDHJSa+6D5eiRgmMAUoMSuQ==
X-Google-Smtp-Source: AGHT+IHACHpya1haeDexCk/ukcpimQf8J+K6Lyi4fAtGxfo1fUvWzdxQbQADbd5CZNASBNjtW/qtKg==
X-Received: by 2002:aa7:d8d7:0:b0:52b:d169:b374 with SMTP id
 k23-20020aa7d8d7000000b0052bd169b374mr10091762eds.3.1695137327730; 
 Tue, 19 Sep 2023 08:28:47 -0700 (PDT)
Received: from angelo-ThinkPad-T470p.amarulasolutions.com
 (host185138219236.static.fidoka.tech. [185.138.219.236])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a056402510f00b005311e934765sm2698138edd.27.2023.09.19.08.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 08:28:47 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 19 Sep 2023 17:28:44 +0200
Message-Id: <20230919152844.2774368-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1695137328; x=1695742128;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HNyPEamMaApdPKC+VVk+2qj3qgPGHeJZuQe/wS+6AiI=;
 b=GPyZebPxljcdG97z5RJuO2ihSAzWF36Cl1EW/YMUAgnrftrKrD+iVxO+IrcYJP8gww
 AWJ0EEsB092ZOEvYlPSTIOaQwS7kqKRMwGS4KasZTQkXgqWi3jYjL7YMfr422Gt2fQ+A
 NthfJHI2+tPi4AN9BNE4miShgsv/G927rynSs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=GPyZebPx
Subject: [Buildroot] [PATCH] package/python-pillow: bump to version 10.0.1
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/python-pillow/python-pillow.hash | 4 ++--
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index bca66a7436..5f4b0d9492 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  2a8f327ba2250aad26ed101337c8fa56  Pillow-10.0.0.tar.gz
-sha256  9c82b5b3e043c7af0d95792d0d20ccf68f61a1fec6b3530e718b688422727396  Pillow-10.0.0.tar.gz
+md5  93a0585ab0ee9717a7576129bdabdf93  Pillow-10.0.0.tar.gz
+sha256  d72967b06be9300fed5cfbc8b5bafceec48bf7cdc7dab66b1d2549035287191d  Pillow-10.0.1.tar.gz
 
 # Locally computed sha256 checksums
 sha256  0fdb68ffb39062553be40be4e6eaea9700b4f5e870a720ae86b8925d67613ddd  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 95a67f304e..d9f6fba861 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 10.0.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/0f/8b/2ebaf9adcf4260c00f842154865f8730cf745906aa5dd499141fb6063e26
+PYTHON_PILLOW_VERSION = 10.0.1
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/64/9e/7e638579cce7dc346632f020914141a164a872be813481f058883ee8d421
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
