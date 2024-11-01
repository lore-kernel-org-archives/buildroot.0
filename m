Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3731EE6F08E
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 21:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1C864049F;
	Fri,  1 Nov 2024 21:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iFgla1oKkbfo; Fri,  1 Nov 2024 21:54:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97A3F404A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97A3F404A4;
	Fri,  1 Nov 2024 21:54:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 78236112A
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 736A780F12
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KcIJiD_JzI8c for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 21:54:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8E379804E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E379804E3
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E379804E3
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:54:14 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3a4e5e574b6so7965605ab.0
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 14:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730498053; x=1731102853;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U6Yy6cdfp7ZKh4Zlfwr0yLz0x3pNEnF5c9PNqR+PSdQ=;
 b=JSaM5Urd6QmbT8J32XdRL9fWhshumrfkPe3W/ei5Sv9zr9O15x31fbHQ7hCvpbMIeS
 O4bhBm4B1c8NzpEyIO479+FUjNHBmyI/nXIsKmkhdnZyjCys+m/7Q/BQq/0PJgOfj+dU
 S5vRjnNEgMm8eSN5cSmtquwPJwIVhPOh0CY2EEHUW4Ca1yLOg+coha2zlQDmeMxyspCx
 FcUyrFC3NAzAIt02n74jbIEwDGdEVz5D3F660+Mda34MViASIckia8NdMD+IocurqJvO
 avh47IseaR+8bS5ssEJRAj4CnjJH/HvRf6ytynrCsW7YxJEcLCFsGzOtrC3xWn3RPeXz
 OAtA==
X-Gm-Message-State: AOJu0YxL7SVPwCf5FLpAiqTpKPsKcberXAU7bk8GJbLH9HMylg6s5YyB
 iXlBEddhwm+TGGmvCcLc2tRtPegl7RmmvF6ASZ9DeXVCMkR3Ew/H96MeiA==
X-Google-Smtp-Source: AGHT+IHNcln1mioMNblaeUlUEBp1MhtfQwE3QWDLOOEGbWNcFDLQjq1v6KlxKv6du5xDlVYBm1EKFA==
X-Received: by 2002:a92:4b0b:0:b0:3a0:abd0:122 with SMTP id
 e9e14a558f8ab-3a6aff502e2mr38783515ab.8.1730498053318; 
 Fri, 01 Nov 2024 14:54:13 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de04977ce7sm899227173.119.2024.11.01.14.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 14:54:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 15:54:11 -0600
Message-Id: <20241101215411.1295564-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730498053; x=1731102853; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U6Yy6cdfp7ZKh4Zlfwr0yLz0x3pNEnF5c9PNqR+PSdQ=;
 b=OEcAMNAHyp9ul3oX1xfcGiNpVWA+uMj4ZQUo3/wIabeWwkvMo5bLVCmWqh/hN08iT4
 NGCjKbSIz8qEMmF+qHJ9QKCA/InNp04/QMzYHFGulwlunXhY/3mXQEZav7JVA5h+5xls
 PlvBkv2IiqLNRD9M3NpyBdTNP0k8kuQkWMqE0EWUHQB7l53IfSRHqICm3t9YCDrSiONm
 Vr4cEXJqBSkkZaRET3/2yh6/0VWLRyv9xd2VKXYxm0dFZEMqB897MBJI5AJXiMIglS0n
 CzhSpYfgI4MXXuKbGip6Tx0g+acyo7xkn1jg/YgATogw79hN0uPNHDKnygR8a6/dQXGi
 +9YA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OEcAMNAH
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to version
 75.3.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 272b2571f2..e99fc7d9b2 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools/json
-md5  4d69de91ce968f45825bf36d95f2a626  setuptools-75.2.0.tar.gz
-sha256  753bb6ebf1f465a1912e19ed1d41f403a79173a9acf66a42e7e6aec45c3c16ec  setuptools-75.2.0.tar.gz
+md5  ca5ea2d5e9622d6a7b9f6c6664821853  setuptools-75.3.0.tar.gz
+sha256  fba5dd4d766e97be1b1681d98712680ae8f2f26d7881245f2ce9e40714f1a686  setuptools-75.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index bd3da05488..d6b65a2b9e 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 75.2.0
+PYTHON_SETUPTOOLS_VERSION = 75.3.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/07/37/b31be7e4b9f13b59cde9dcaeff112d401d49e0dc5b37ed4a9fc8fb12f409
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/ed/22/a438e0caa4576f8c383fa4d35f1cc01655a46c75be358960d815bfbb12bd
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
