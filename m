Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125A6E7719C
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D966260F74;
	Sat, 11 Jan 2025 16:26:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptSRXJSvBPeo; Sat, 11 Jan 2025 16:26:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD2EB60F34
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD2EB60F34;
	Sat, 11 Jan 2025 16:26:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 926F7942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7436A83B77
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:26:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eg07zOA3jJAc for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:26:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8106A83B57
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8106A83B57
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8106A83B57
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:26:17 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-844de072603so247357439f.0
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 08:26:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736612776; x=1737217576;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ue2JEuEaH2ONy3pShNbu/xcm0al/reX1EsFSNZ//bbQ=;
 b=nL+/oGWsuXDwJuJnhXdtebbKV1Zp9q3p/4T3OmXieO6JAnMBKUzy5niBSLFyOEuZKX
 osJkZu8+/2Br2hn8JG18pvrzpSdIHPTJr06GkTUilmq7Bgla0UPhjjFgrMepinrMsH1L
 o+sIGWEOLda4JEFhua7ajSldCfeAhSJ96GaDHTx/nozqDPiKsIx41R6W1dkP8unGN1FJ
 TZVWqWTspt28dTd1SC1ijBrl1Y3M/8A+HzavowgXaptOtcKeeJtM2D831f0MraAGtJuw
 Psvmjj+hDOh8LLpQ44xvtxZq+AM+C93xMfNwVw6eV6Hwmuoz67IaVcQ0v2ZB8DqCQgIl
 KhjA==
X-Gm-Message-State: AOJu0YxZvuNoOMqu0c9WAPH+JrNE6KtfMANTUxKkfZhq3gLzIYu7RZXf
 MtgHs/CoTCpRegpxmLiNDcPuD5aQd6KebEAzdCOj89zjDvpsQpvWMygoNBFFhEg=
X-Gm-Gg: ASbGncujWq4NaNzFAIdPswIkAvGUAe7V7ZToXVaEDjXWUMvLglwVVb+dq8MtyKB7R2W
 6Tt/w1StwpuxhkfpMYjCsW8QCAPqFcZ8L6XWsijmBkPIjaRQLXcEQ0X4LifjVXX/imOtkBGAoE8
 juCLLVM6Qirp3fAtTHPbv9IklL85z5dnSm2M/y0KfyhPfnbQjVZH512jBQcZdH/M5CI1Z54jPQL
 hnFeSCICfTVkmlMjDD8+Lx2MfLq/Ib9/FPQuZXgYVRngtuvUqdtewhBemfqSY5P09o8ciu6M9E0
 6H2NCdKakeWtWwyrGzJ3JEWkijStjEk=
X-Google-Smtp-Source: AGHT+IE2Y/roVjaW5gi9HBSeFHF9OcOnlrTr0nMbykfV5Vw3WsaAyZt4H2y07jFH80iXjpE4k3jTiA==
X-Received: by 2002:a05:6e02:12cd:b0:3a7:7ad4:fe78 with SMTP id
 e9e14a558f8ab-3ce3a8beb7emr113423415ab.19.1736612776292; 
 Sat, 11 Jan 2025 08:26:16 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b5f93desm1623317173.14.2025.01.11.08.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 08:26:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 09:26:13 -0700
Message-Id: <20250111162613.2877627-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736612776; x=1737217576; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ue2JEuEaH2ONy3pShNbu/xcm0al/reX1EsFSNZ//bbQ=;
 b=RQimB3d6609AuG8syE0ICQHfnsCFUv8pxm/rbdlPVG9yfv2Axl74dMg42vtKTujeAR
 OOCy2uJDGiOCC5zwOpPQZ6vueI/CYNfbjvtO/L0rgRzVd8e7ngEVr9jTvi4It0p1IT1f
 sRKNR42y95IusDHxEIPVENid5R4eAfckpYf/zX0eHe1O+T33pn2AKofmAmvLM13mOadG
 hQzeteib7MWS+LZ7pIOkzJT8FSNphzGS4hij4oAghXfvKf7XjdSO33NdpcYga4J3UASp
 wrOclPBEbTsy+hi/QMnkNx057NopiiLtqBSLR9CqB9mItuDHtRAVB0nz2HzGABt01x9W
 UwNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RQimB3d6
Subject: [Buildroot] [PATCH 1/1] package/python-pytest-asyncio: bump to
 version 0.25.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pytest-asyncio/python-pytest-asyncio.hash | 4 ++--
 package/python-pytest-asyncio/python-pytest-asyncio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.hash b/package/python-pytest-asyncio/python-pytest-asyncio.hash
index 1e5eafd86a..accff0557b 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.hash
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest-asyncio/json
-md5  cfec568101379ff7188b152e2f88a4c1  pytest_asyncio-0.25.0.tar.gz
-sha256  8c0610303c9e0442a5db8604505fc0f545456ba1528824842b37b4a626cbf609  pytest_asyncio-0.25.0.tar.gz
+md5  c00782dd936f55366c536a41184ef04a  pytest_asyncio-0.25.2.tar.gz
+sha256  3f8ef9a98f45948ea91a0ed3dc4268b5326c0e7bce73892acc654df4262ad45f  pytest_asyncio-0.25.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a8ad31b1c3f40dca5a84119351b8fa8ddc868edd77fad8a8ebf6d8f2d16fa4ae  LICENSE
diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.mk b/package/python-pytest-asyncio/python-pytest-asyncio.mk
index 52040df519..c21892d18c 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.mk
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_ASYNCIO_VERSION = 0.25.0
+PYTHON_PYTEST_ASYNCIO_VERSION = 0.25.2
 PYTHON_PYTEST_ASYNCIO_SOURCE = pytest_asyncio-$(PYTHON_PYTEST_ASYNCIO_VERSION).tar.gz
-PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/94/18/82fcb4ee47d66d99f6cd1efc0b11b2a25029f303c599a5afda7c1bca4254
+PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/72/df/adcc0d60f1053d74717d21d58c0048479e9cab51464ce0d2965b086bd0e2
 PYTHON_PYTEST_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_PYTEST_ASYNCIO_LICENSE = Apache-2.0
 PYTHON_PYTEST_ASYNCIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
