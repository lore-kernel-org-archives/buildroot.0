Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF1DD637A3
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 19:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4B596068B;
	Tue, 16 Dec 2025 19:41:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Umc-lNI2tPgx; Tue, 16 Dec 2025 19:41:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C978E60F83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765914097;
	bh=7JGxdDgvwp5bmzAveIUkAol4+FKban7g2nN2xUO+IdQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=leQbF3oOAHebi1/et+zIwUllarLKmAak/rjzJYFPHhFI2WV4tX/qfgkl0BERzRn3h
	 0zYNt3IJo1h6QNq4lA8iHY8h3yhZ3r9CY8yfnENtPhhm2LiN5MkMd52brbRv/A1Dyf
	 AFiIgEn+1ekHOP+c/S6CI23MOYsyj+elGFyWOzCU7RXXoIwe55K1/3MPpri0yG3GqQ
	 UipZDWY0i0Hk30GynqYTd9oRPda7AREZlXT4wN/9URV7/a+LabqWTOLTxIGUolxKyN
	 RtL8WOCygezDDGjmd3jrbUy3SxsdwO7U1NgczLGrhBGrSXuHoim5mvFeq6lXipzw5p
	 I7bQ2jJ0wgYbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C978E60F83;
	Tue, 16 Dec 2025 19:41:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BDB2364
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11F7A60F83
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:41:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UGyhgBEOMlWr for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 19:41:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 010C26068B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 010C26068B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 010C26068B
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:41:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A8EF6A4C4060;
 Tue, 16 Dec 2025 20:41:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVav9-000000000Bj-0Att;
 Tue, 16 Dec 2025 19:41:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 20:40:55 +0100
Message-ID: <20251216194119.3020421-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216194119.3020421-1-bernd@kuhls.net>
References: <20251216194119.3020421-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765914079;
 bh=GtUGOQLbFxGI4Au3Aly8uR4NXp1mdasQgU92gQob7+M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=QuubJmJA/Wq9fn0lAiALVmW+LznTQyfTIeuWNDKXxo5QoFrfkBgmcy4Jrq0ACZmkU
 hrSU3cXmBWBsqIWyhkHBFbQGeKxAuvcXbjYc9uPP2EvWUyUOHdV7gD9ePYXusnI3+/
 uF11c/KWmJX+AADR5sHTERoJbuSp4v6QtlTaMo4EMkUb1n1qcBlrOtKqt9kpY5rIPY
 q80wu5jzm4LljCCs/olyHegLpiu5vW3od23I+8wd4/yxAKmgcqi9hq95cGwW0BwVjS
 mWRbtepfqP168s/u13O66ibBJQzO+cqJZcHQWCy2Enp75ylLB7mdS7QlPx/GiLc5Q+
 9lD4q3IFy6MEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=QuubJmJA
Subject: [Buildroot] [PATCH 02/26] package/python-setuptools-scm: bump
 version to 9.2.2
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/pypa/setuptools-scm/blob/v9.2.2/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-setuptools-scm/python-setuptools-scm.hash | 4 ++--
 package/python-setuptools-scm/python-setuptools-scm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-scm/python-setuptools-scm.hash b/package/python-setuptools-scm/python-setuptools-scm.hash
index 9a1c6f0262..eaed490fc7 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.hash
+++ b/package/python-setuptools-scm/python-setuptools-scm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-scm/json
-md5  35e09656d091a94b27f9c50b383b32c5  setuptools_scm-8.3.1.tar.gz
-sha256  3d555e92b75dacd037d32bafdf94f97af51ea29ae8c7b234cf94b7a5bd242a63  setuptools_scm-8.3.1.tar.gz
+md5  72975fc3ec40a1ae06bb2d86ca8ac48d  setuptools_scm-9.2.2.tar.gz
+sha256  1c674ab4665686a0887d7e24c03ab25f24201c213e82ea689d2f3e169ef7ef57  setuptools_scm-9.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
index 8bf879082e..8c74a55335 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.mk
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_SCM_VERSION = 8.3.1
+PYTHON_SETUPTOOLS_SCM_VERSION = 9.2.2
 PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools_scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/b9/19/7ae64b70b2429c48c3a7a4ed36f50f94687d3bfcd0ae2f152367b6410dff
+PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/7b/b1/19587742aad604f1988a8a362e660e8c3ac03adccdb71c96d86526e5eb62
 PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = pep517
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
