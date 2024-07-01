Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A50C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 18:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A5C460AC6;
	Mon,  1 Jul 2024 18:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gf1UvxcHMuYl; Mon,  1 Jul 2024 18:17:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F369D60AD1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F369D60AD1;
	Mon,  1 Jul 2024 18:17:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BACF81BF33C
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 18:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7BE180EFC
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 18:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMEw0W3Z21tK for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 18:17:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9C5D180EDE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C5D180EDE
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C5D180EDE
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 18:17:19 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7f3cd2c0a79so117071839f.1
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 11:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719857838; x=1720462638;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1uUfNPxThLXHnedJuc+NowIFlq3aW9wkzrvnaSrWeVg=;
 b=Gg0qkFHwInZ2kmn3gh81zMkKYf/PLh96YZeTaKaepe660wiyk55n8352RX1B4/TwJY
 YCu4UmHj5hZArtzY9ul0P6Y07iVkaVvtIF7Rwz8YDYD0gyb/0v2NFv+CERzq7Re18rvQ
 Zyt6WwBXPuzBXHdZWUCEO0WQGqbW/BteiugHn7ceDPxnSk7A4GccoJXApy1ZNyH+z8qz
 3ek5qP3qZYMzJUP0nhtnkIRP1Tz48k7/GJliBMVnAq7rI9oj1UlbqkaF2kbPg6GpZvuq
 4q1xdWsZ9HKFGfIUmWcGKrEATpWzwckO3wZVa1jf/HM3G2TbVPmbmJZNGN4E3UrRE/Z3
 lfCQ==
X-Gm-Message-State: AOJu0YzYTJqhu51dvMU+adBqhywc1z2GmJH6JE/V1HkYMISOUFO/C3Ih
 cyXifkdsCkeZF/QsjVadN82sB8iGr/q+mSmza27K9uA4sijcFLti4DPy/Q==
X-Google-Smtp-Source: AGHT+IFzkCYNYILmd/Zm0l3OKwb/BJ2DEtdfyKlRg07P1vvfjH/+gdM9CsM/oNpFTRM+wh2Jh1+6Fw==
X-Received: by 2002:a6b:e513:0:b0:7f6:16ed:695f with SMTP id
 ca18e2360f4ac-7f62ee1c5a5mr744500939f.11.1719857838259; 
 Mon, 01 Jul 2024 11:17:18 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-7f61ce9d654sm210031739f.13.2024.07.01.11.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 11:17:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 12:17:16 -0600
Message-Id: <20240701181716.1738978-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719857838; x=1720462638; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1uUfNPxThLXHnedJuc+NowIFlq3aW9wkzrvnaSrWeVg=;
 b=WnJvkUO8E+Hr08JMgYirDUfEOK/9ACX4ZTgwaoqdMOYyjE8QkweoDzxN0J9fE8uvSR
 BBQXh2uq3FlYTxIHqQWaP27vlSA6+p8vfVErH/dJVoQOfhIcEkO13lkX0NCe1qfXavWA
 hP2NbTdpGb3VclZvRxXQXoOjgHkAzaQhWQCJnKsKeR2epfSmt4KSB1c2t04c+vJLykxZ
 fP1vKKQ5PqqXRgDyUgwBCLxfwMKvr2s0MpMJD14CV7JbfZYJF940vbJEBne+C1aVrfC/
 46H6JjOHM6nWgThpDr7AN0uzLG5gVjCtyXs4SCxO1adnBR7DvcXbR3uD4d3yvK3aFMLQ
 A9UA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WnJvkUO8
Subject: [Buildroot] [PATCH 1/1] package/python-anyio: bump to version 4.4.0
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
 package/python-anyio/python-anyio.hash | 4 ++--
 package/python-anyio/python-anyio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-anyio/python-anyio.hash b/package/python-anyio/python-anyio.hash
index e77d30249c..c1edeca10c 100644
--- a/package/python-anyio/python-anyio.hash
+++ b/package/python-anyio/python-anyio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/anyio/json
-md5  22e660fff1a584e72281f0d6a083e4e0  anyio-4.2.0.tar.gz
-sha256  e1875bb4b4e2de1669f4bc7869b6d3f54231cdced71605e6e64c9be77e3be50f  anyio-4.2.0.tar.gz
+md5  04346dd3631f405d0786ca0f441dace1  anyio-4.4.0.tar.gz
+sha256  5aadc6a1bbb7cdb0bede386cac5e2940f5e2ff3aa20277e991cf028e0585ce94  anyio-4.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5361ac9dc58f2ef5fd2e9b09c68297c17f04950909bbc8023bdb82eacf22c2b0  LICENSE
diff --git a/package/python-anyio/python-anyio.mk b/package/python-anyio/python-anyio.mk
index 32c2286157..4f9cbb78f7 100644
--- a/package/python-anyio/python-anyio.mk
+++ b/package/python-anyio/python-anyio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ANYIO_VERSION = 4.2.0
+PYTHON_ANYIO_VERSION = 4.4.0
 PYTHON_ANYIO_SOURCE = anyio-$(PYTHON_ANYIO_VERSION).tar.gz
-PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/2d/b8/7333d87d5f03247215d86a86362fd3e324111788c6cdd8d2e6196a6ba833
+PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/e6/e3/c4c8d473d6780ef1853d630d581f70d655b4f8d7553c6997958c283039a2
 PYTHON_ANYIO_SETUP_TYPE = setuptools
 PYTHON_ANYIO_LICENSE = MIT
 PYTHON_ANYIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
