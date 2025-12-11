Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99705D43343
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72962409DF;
	Thu, 11 Dec 2025 19:59:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6EAH52sgGxpR; Thu, 11 Dec 2025 19:59:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D26F4111C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765483167;
	bh=7KMQaS/HU4mLoYXmgWAHCMlHEu5ivQ0rsHTYiBS9h6I=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=X10PNvzi3HDSW0T86HHjRL9Mxt4/O2zSzX6lv10yhmqMLv6x0i/2OLgzrW/mYpFb/
	 GiXNpn1IaHqZpX+MOWIbksiFqtFd9rrzpfnexQmhbXqQWgN5mu5tz1ltua24DBpwTC
	 VkYRZLXupnxzHRSC9a1tj+/e7RL8zXV7mv1tWVnkq193aHTW2d/HHoB7PpWPGtz/sZ
	 Uak2VICIi9GFmc3MlNtdXYtcl/3WrzvrGVJ+hG6mq4+xYWzdikevLeycSU5KL02idb
	 LqaaJAhNG33qon/dPrKIlukmIpqo3YFvW6u7H0ilzjy6fVFEl/+NxQ8deRqXPfQFJX
	 4hEivjZRsW91w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D26F4111C;
	Thu, 11 Dec 2025 19:59:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A3E732C6
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8ACBF8097F
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:59:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FDUySlyLypxP for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:59:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 85214808A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85214808A1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85214808A1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:59:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D5060A4C3947;
 Thu, 11 Dec 2025 20:55:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39350)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vTml7-000000008Hh-22nA;
 Thu, 11 Dec 2025 19:55:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:55:25 +0100
Message-ID: <20251211195527.3276900-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251211195527.3276900-1-bernd@kuhls.net>
References: <20251211195527.3276900-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765482938;
 bh=Dl+7lvzdNZ4esZSoXUkf+pNY5/PqIr/r/Bc1dboEgc4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=dnWyyV8nCbrfFn/ejKiLrTYvlZWx6baRIi4qtWfkg/mzIoi0nmT+leJUCBLO3gFwa
 QCgnD54Emo7TAXgJfaUorUpQLMYEjIo7TWY0EBGTlW/wd38SGZnrjr0lE3AcIuGCWA
 igXHJ0LumknyJTO4gvNBpsRLYtrbJvVqIPQ2ma+mOEhX9qpwOSERvCVJpG9jpiI60N
 R3Aelmx6+h8SxHeKxJK8iUko+hl3wuOuq54xB2p6NnoaDj6pAAW69DAAYeJWmXL13M
 8kSQYFzXFKdR/Y0bSs98sQBiFwZZPCtCeHxXAqpioJl4UUyLbfkknp8oTaFt+Ha4+O
 D65okXMzsFN8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=dnWyyV8n
Subject: [Buildroot] [PATCH/next 19/21] package/python-hiredis: bump version
 to 3.3.0
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/redis/hiredis-py/releases/tag/v3.3.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-hiredis/python-hiredis.hash | 4 ++--
 package/python-hiredis/python-hiredis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hiredis/python-hiredis.hash b/package/python-hiredis/python-hiredis.hash
index e0215cb389..57e658e6e3 100644
--- a/package/python-hiredis/python-hiredis.hash
+++ b/package/python-hiredis/python-hiredis.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/hiredis/json
-md5  3bef98b3714e3944e452a158c7d61f39  hiredis-3.2.1.tar.gz
-sha256  5a5f64479bf04dd829fe7029fad0ea043eac4023abc6e946668cbbec3493a78d  hiredis-3.2.1.tar.gz
+md5  3dc0c18cedc67e6eb9027245157a29b3  hiredis-3.3.0.tar.gz
+sha256  105596aad9249634361815c574351f1bd50455dc23b537c2940066c4a9dea685  hiredis-3.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3256b5b77e98aa34ff31a4d2c2c10f7f177b0f3058753a6044430a168987353b  LICENSE
 sha256  dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  vendor/hiredis/COPYING
diff --git a/package/python-hiredis/python-hiredis.mk b/package/python-hiredis/python-hiredis.mk
index 6b365b8dc4..6cedbe0076 100644
--- a/package/python-hiredis/python-hiredis.mk
+++ b/package/python-hiredis/python-hiredis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HIREDIS_VERSION = 3.2.1
+PYTHON_HIREDIS_VERSION = 3.3.0
 PYTHON_HIREDIS_SOURCE = hiredis-$(PYTHON_HIREDIS_VERSION).tar.gz
-PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/f7/08/24b72f425b75e1de7442fb1740f69ca66d5820b9f9c0e2511ff9aadab3b7
+PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/65/82/d2817ce0653628e0a0cb128533f6af0dd6318a49f3f3a6a7bd1f2f2154af
 PYTHON_HIREDIS_SETUP_TYPE = setuptools
 PYTHON_HIREDIS_LICENSE = MIT, BSD-3-Clause
 PYTHON_HIREDIS_LICENSE_FILES = LICENSE vendor/hiredis/COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
