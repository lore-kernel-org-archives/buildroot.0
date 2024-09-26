Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13AFCDE012
	for <buildroot@archiver.kernel.org>; Thu, 26 Sep 2024 15:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93FD741E7C;
	Thu, 26 Sep 2024 15:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e72ylR-UsTyu; Thu, 26 Sep 2024 15:15:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C384423C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C384423C3;
	Thu, 26 Sep 2024 15:15:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 878121BF30D
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 15:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76ED68203C
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 15:15:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qODtjVExJrrL for <buildroot@lists.busybox.net>;
 Thu, 26 Sep 2024 15:15:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7C12484584
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C12484584
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C12484584
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 15:15:46 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3a1a4870713so4219165ab.0
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 08:15:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727363745; x=1727968545;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EyiT3uC3wqbuijigT9YZlQFgL10Yn6UGmS+GD4sYips=;
 b=cX7Y9u80CfufrPr7+G6f5I7/6B2rCO5o7vwjDPIDPNn7ZDJIrkZXRRIUaRMncgs4gx
 oUTWv4Tsi5K8aCOdeTg6KLMCbsKt53HGml8fqYqqaWG4fokPFayA7Il3Fl5mx8UUnVeM
 Dyc5cuZKokZs0aBIp9unMLlJZx5NjNNePVh+vTstPbejgjnqcu+OHlKtlHNEHfoPwa17
 k3CaJnFTYY7FerrteZK4HCJa77a7wquAQZhstTG6xvuMBZe72hdJ0p4rD1h7A3yI3g7u
 0ZOF1qLlzrLpl2dsWS1EsObVaeOcUfTwoDtwEbqOx0tflIEIED6oMSjS0qdioC2S7hue
 TKZA==
X-Gm-Message-State: AOJu0Yzv0bcddwiLjK15kn+Eg4kCA2yB2k20YjR3WvPYFCAUQZgGyPNw
 Qs6S3x/5vpVGebc162k2khD/leUrK9QWcQUyc1UXjET+jHGtyQLJDaZQ6w==
X-Google-Smtp-Source: AGHT+IHMYSKTrbanVC4cQqmIO9vFkUgX9a3wl20+HalIgNCA8NUQG6q/B3OIAURcOPFT+rsau78nJA==
X-Received: by 2002:a05:6e02:1a6f:b0:3a0:beb4:e402 with SMTP id
 e9e14a558f8ab-3a26d6fc75cmr75806255ab.1.1727363744901; 
 Thu, 26 Sep 2024 08:15:44 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-34.hlrn.qwest.net.
 [71.33.156.34]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a1a5726364sm18443375ab.87.2024.09.26.08.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 08:15:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 26 Sep 2024 09:15:42 -0600
Message-Id: <20240926151542.7988-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727363745; x=1727968545; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EyiT3uC3wqbuijigT9YZlQFgL10Yn6UGmS+GD4sYips=;
 b=QrOHeIZ+Y57LRl2VKAFdRyPS8D6JhM0EPYD6Tp/AaC6NUee+pLLoaOHx6FawCohcN8
 IQSG5sDziFXOITuudEccZm7tvEvmZyZI6TXh5Lw0vJ6TUpE6O5cW7hd8FhfhPH3dYlQ2
 W8t+q1s0/1XDWQU3uah5vdE20PuBgJ0lE44o2c5l1gx2MlyfS2Ub7xhiDnoGBaNxA4ei
 mO8r4Ic9TUZ6s6KmKNgveggA41oUOeV/54lDwWhtt2C6+WGo7S7R1zOi4yN0Mon1C1fD
 NLnWSwuCXQ+/pMNCmPkqYTWcJI8t76VPvB9Ax+WLGW6BVw58N21ceEUHEiM/ZHT1ICpg
 tn+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QrOHeIZ+
Subject: [Buildroot] [PATCH v2 1/1] package/python-aiohttp-session: bump to
 version 2.12.1
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
Changes v1 -> v2:
  - fix typo
---
 package/python-aiohttp-session/python-aiohttp-session.hash | 4 ++--
 package/python-aiohttp-session/python-aiohttp-session.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiohttp-session/python-aiohttp-session.hash b/package/python-aiohttp-session/python-aiohttp-session.hash
index efdac39007..8559df057b 100644
--- a/package/python-aiohttp-session/python-aiohttp-session.hash
+++ b/package/python-aiohttp-session/python-aiohttp-session.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-session/json
-md5  b89bde69f6f3c61a991ff408d2733838  aiohttp-session-2.12.0.tar.gz
-sha256  0ccd11a7c77cb9e5a61f4daacdc9170d561112f9cfaf9e9a2d9867c0587d1950  aiohttp-session-2.12.0.tar.gz
+md5  ff7a0c880ed7cee24e0a141c201adb8b  aiohttp_session-2.12.1.tar.gz
+sha256  15e6e0288e9bcccd4b1d0c28aae9c20e19a252b12d0cb682223ca9c83180e899  aiohttp_session-2.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  7bc5dd2f229a6b922befb1427fd4ad2c0b255f12c1b1869370ba77520dc22bc7  LICENSE
diff --git a/package/python-aiohttp-session/python-aiohttp-session.mk b/package/python-aiohttp-session/python-aiohttp-session.mk
index 55bf0e87f3..8b8337e68e 100644
--- a/package/python-aiohttp-session/python-aiohttp-session.mk
+++ b/package/python-aiohttp-session/python-aiohttp-session.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_SESSION_VERSION = 2.12.0
-PYTHON_AIOHTTP_SESSION_SOURCE = aiohttp-session-$(PYTHON_AIOHTTP_SESSION_VERSION).tar.gz
-PYTHON_AIOHTTP_SESSION_SITE = https://files.pythonhosted.org/packages/34/87/8dbc1385c875497d6bc16c9d94e25dbd8ff62599843b73fb4048ba74c867
+PYTHON_AIOHTTP_SESSION_VERSION = 2.12.1
+PYTHON_AIOHTTP_SESSION_SOURCE = aiohttp_session-$(PYTHON_AIOHTTP_SESSION_VERSION).tar.gz
+PYTHON_AIOHTTP_SESSION_SITE = https://files.pythonhosted.org/packages/c2/c4/d73a7f19b1bd3149ba5bccd22e3ab580c19e4d9fcb83114309e8385ab807
 PYTHON_AIOHTTP_SESSION_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_SESSION_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_SESSION_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
