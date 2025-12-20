Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04860E67483
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D078B605E6;
	Sat, 20 Dec 2025 21:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o44FbP85CcyH; Sat, 20 Dec 2025 21:45:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3C48605F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766267158;
	bh=rAP8Dia/gwIatq91p39xe54CY/0+mCb67py+/J/Jfs0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=N6touC1mn2xQQ3DlMWJBfvrhDG3qcrUFLbSiodOGCl3yvBh6Cx/ckgxAXjRy0y8It
	 2eWgX5r1EcuiIjuGnnHV2ppqStIHgorRdObVi89AmrtEocFUchONPH2oxg45if39xb
	 HMOq4jVwgGQcrS5/dILX58i82FA+ApLGJVvXgTCoqhCXApoYcmgvn/oiMzd3ZzT5Q3
	 +Ar58h40uo13HJzkgMrtK8bfRSpCVy9NOPQBaSV7T/CfHS2U6TM0nnObL5jC4+6M+y
	 TVF3n9Uc1q6QYbTBRW8OCyknw8AgZoalaeE8KL1i9VGTCP7RwP1ydsJR+mcmbmc+pN
	 CCilIQ07f5BIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3C48605F5;
	Sat, 20 Dec 2025 21:45:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9ECE23D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A06A540471
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MSPX8igfy3lE for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:45:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8D56640442
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D56640442
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D56640442
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:45:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D3FC4A4C501E;
 Sat, 20 Dec 2025 22:42:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39116)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4iF-000000002DO-3i3n;
 Sat, 20 Dec 2025 21:42:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:42:04 +0100
Message-ID: <20251220214206.1089100-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220214206.1089100-1-bernd@kuhls.net>
References: <20251220214206.1089100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266931;
 bh=GpvRaPAfb8qFDqJGFjnHQZs5xcGxseobnwdUwZMo6hM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=g/qGt3b8VO9bkcBmgZfLwnfDbf2vuUbV5tbQmCm31SdC7ghmeZnZto0GWUuVGj1NG
 5UxiOe5vVHp+3UXAmp1Q7CAC2aVxGaajytjbH0dHNb3X/cnl+n9cPmGCOv7kX3T5D9
 5bXTCSveBa2I36CnvbCb5MTQQmginvfGZsZLlnaE57Qc9vtTCRFddyYcSWEk47ecmQ
 W7LQOLfCJmOqK8lXwH9HbCjIyb3qindcJlqlAmLth9GyoPZ89+9BkBYr9D11oKXUx5
 s/c4FcdXCxrbxHt9cziYSsk818C6KuPsoxB0jw4uLEDiJaGD0EK3PUwW27APqqXWHn
 DFqUJNb7q4C7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=g/qGt3b8
Subject: [Buildroot] [PATCH 16/18] package/python-markupsafe: bump version
 to 3.0.3
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
 Grzegorz Blach <grzegorz@blach.pl>, Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/pallets/markupsafe/blob/3.0.3/CHANGES.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-markupsafe/python-markupsafe.hash | 4 ++--
 package/python-markupsafe/python-markupsafe.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markupsafe/python-markupsafe.hash b/package/python-markupsafe/python-markupsafe.hash
index c5ba015592..639a8c10e0 100644
--- a/package/python-markupsafe/python-markupsafe.hash
+++ b/package/python-markupsafe/python-markupsafe.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markupsafe/json
-md5  cb0071711b573b155cc8f86e1de72167  markupsafe-3.0.2.tar.gz
-sha256  ee55d3edf80167e48ea11a923c7386f4669df67d7994554387f84e7d8b0a2bf0  markupsafe-3.0.2.tar.gz
+md5  13a73126d25afa72a1ff0daed072f5fe  markupsafe-3.0.3.tar.gz
+sha256  722695808f4b6457b320fdc131280796bdceb04ab50fe1795cd540799ebe1698  markupsafe-3.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.txt
diff --git a/package/python-markupsafe/python-markupsafe.mk b/package/python-markupsafe/python-markupsafe.mk
index 11e8708270..7732b9a7e1 100644
--- a/package/python-markupsafe/python-markupsafe.mk
+++ b/package/python-markupsafe/python-markupsafe.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKUPSAFE_VERSION = 3.0.2
+PYTHON_MARKUPSAFE_VERSION = 3.0.3
 PYTHON_MARKUPSAFE_SOURCE = markupsafe-$(PYTHON_MARKUPSAFE_VERSION).tar.gz
-PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/b2/97/5d42485e71dfc078108a86d6de8fa46db44a1a9295e89c5d6d4a06e23a62
+PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/7e/99/7690b6d4034fffd95959cbe0c02de8deb3098cc577c67bb6a24fe5d7caa7
 PYTHON_MARKUPSAFE_SETUP_TYPE = setuptools
 PYTHON_MARKUPSAFE_LICENSE = BSD-3-Clause
 PYTHON_MARKUPSAFE_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
