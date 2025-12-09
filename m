Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D495BD3B993
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB35183CBA;
	Tue,  9 Dec 2025 19:41:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ky-vc7GcWrAG; Tue,  9 Dec 2025 19:41:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB28283FDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309304;
	bh=nuVczIs57KlczEBRf/x3M7kX+azCRyHB0bgVqJ2sZus=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=V1fp3GXKN6wonX0rttzgrqqtmUAagt4Qc6rUsE/l81wqWbVg2foCImDDV4qzE/TB7
	 jdh+81sAu5jeNh5bu0r9WG3xs/j7nO13UFLOr7mw2Dxy1U20962JOuit3Q3r5A9zQJ
	 ew2HuzgYqDGF2LRmTJ9ePL2t07/MjOD37vsBuYz8I8bsl+EGtv1OqI9hV8ez1pgnEO
	 DnoRFnBaJS35uN+mxT7YW6sFusNM7/X0+p/c4Vmr1q/Ixuly4FLL3CI9AaDgPJ7T8h
	 sP66RLRe5cuFeLjW5lgAOjJ80yZXDztTfcVM2tMCXj2FY5co80iJRH0a0Dm9CsyMPz
	 0A3pWRrGPLFEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB28283FDD;
	Tue,  9 Dec 2025 19:41:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 72754E7
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 646A46136A
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oGs4qqhgy43f for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:41:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5B0F9612BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B0F9612BC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B0F9612BC
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:41:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 784C3A4C2C71;
 Tue,  9 Dec 2025 20:40:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yu-000000006DN-2yJM;
 Tue, 09 Dec 2025 19:39:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:30 +0100
Message-ID: <20251209193951.1000100-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309214;
 bh=pj9yafJQGWlqxMUtd5Kyo9CsgbjmQS1bsgC14V3N1NY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pEm4k5ZphaO14AUWp+orDwbSS0yFGbHpvF7RSBPdWdnnuN6/RZVj4Bia3Ro4yjHW4
 lvOPotuZDatWSGIOf/h/Q0Vqih/VWvwFFxkkpWwS4QyxmvYUnzFqpCKb8lVZnYWrJA
 V0spyEbEgH7kZgUzLcCb8d0HRbnR0ZxwWie/+NxinfO9y5FaKCmhvf3meIsCzdx5N8
 LQw2WhPLyfYAAiQqcAW68kX2VccSK6Yst0c4sv8sKEtO+eNR2nX/EHoeXC8RB5zRxA
 GW/JtWh8AlpMVyjPPR9RCuiwQv6T+VZn3vC0yhOSHXMTQ+PTIKSSmBZXF15LZqL6b4
 RM7q3oaMxBJXQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=pEm4k5Zp
Subject: [Buildroot] [PATCH/next 10/31] package/python-argon2-cffi: bump
 version to 25.1.0
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/hynek/argon2-cffi/blob/25.1.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-argon2-cffi/python-argon2-cffi.hash | 4 ++--
 package/python-argon2-cffi/python-argon2-cffi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-argon2-cffi/python-argon2-cffi.hash b/package/python-argon2-cffi/python-argon2-cffi.hash
index e11195e1e2..a93be79927 100644
--- a/package/python-argon2-cffi/python-argon2-cffi.hash
+++ b/package/python-argon2-cffi/python-argon2-cffi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/argon2-cffi/json
-md5  7371c126f21a895b33c4fe7e00ac6fc1  argon2_cffi-23.1.0.tar.gz
-sha256  879c3e79a2729ce768ebb7d36d4609e3a78a4ca2ec3a9f12286ca057e3d0db08  argon2_cffi-23.1.0.tar.gz
+md5  fbf9e4302b32894a857a12ff0bf7c5f0  argon2_cffi-25.1.0.tar.gz
+sha256  694ae5cc8a42f4c4e2bf2ca0e64e51e23a040c6a517a85074683d3959e1346c1  argon2_cffi-25.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b6944d386e87ccf49d9632da083685a4b7624733e686a7fe283dd2d428341d77  LICENSE
diff --git a/package/python-argon2-cffi/python-argon2-cffi.mk b/package/python-argon2-cffi/python-argon2-cffi.mk
index 13559075b2..bad4d3ab0f 100644
--- a/package/python-argon2-cffi/python-argon2-cffi.mk
+++ b/package/python-argon2-cffi/python-argon2-cffi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ARGON2_CFFI_VERSION = 23.1.0
+PYTHON_ARGON2_CFFI_VERSION = 25.1.0
 PYTHON_ARGON2_CFFI_SOURCE = argon2_cffi-$(PYTHON_ARGON2_CFFI_VERSION).tar.gz
-PYTHON_ARGON2_CFFI_SITE = https://files.pythonhosted.org/packages/31/fa/57ec2c6d16ecd2ba0cf15f3c7d1c3c2e7b5fcb83555ff56d7ab10888ec8f
+PYTHON_ARGON2_CFFI_SITE = https://files.pythonhosted.org/packages/0e/89/ce5af8a7d472a67cc819d5d998aa8c82c5d860608c4db9f46f1162d7dab9
 PYTHON_ARGON2_CFFI_SETUP_TYPE = hatch
 PYTHON_ARGON2_CFFI_LICENSE = MIT
 PYTHON_ARGON2_CFFI_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
