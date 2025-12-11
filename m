Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D154D43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4784840196;
	Thu, 11 Dec 2025 19:57:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pE81HoAn1Lhl; Thu, 11 Dec 2025 19:57:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 685D84081F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765483030;
	bh=3KAm/IM0KPE6wFWs26RIZFRIcAjEf9YtvgHbnstghFU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PMZUfmx/9c29v2cdtye0+2qnw2cYm4qTx3n7xV/xbKPqgorTm8sfno2XPBvB8icoK
	 QdSkuK9eaKPEVeTS7czbpfXuGlbgrJYitBIwEQJk8ehl/WlAgGPjGVgqIUYcM5eHmj
	 U0Xg2dhJFnt0qIdZTwwEDQvM5KnpfWZWeXymaZ3lJ5ShXUM3a2BuultlyPqY/BwKkG
	 oaLWS2yDEhn50JOl559qkSrVgSf+wvfXZ/tMH3ZwZb4wNaZVVAx1gOKEz8St4ALtIi
	 0kNY3aKTgMXmOL32T5kLtIv6dHig9fi8/ysbBJxqyi4ls18jp+NmUAZj+mfB9//teT
	 Xf9S7RWlDgOlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 685D84081F;
	Thu, 11 Dec 2025 19:57:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E830B2C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE5A4816D7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:57:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cklpJfv0bH-z for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:57:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9992E8162F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9992E8162F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9992E8162F
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:57:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E3DEFA4C3869;
 Thu, 11 Dec 2025 20:55:35 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39350)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vTml6-000000008Hh-1XIx;
 Thu, 11 Dec 2025 19:55:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:55:11 +0100
Message-ID: <20251211195527.3276900-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251211195527.3276900-1-bernd@kuhls.net>
References: <20251211195527.3276900-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765482935;
 bh=WiLIW61uSpKNE41rhAQGLnTi9Y8nU2FHt4wgu6ZmvkQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Zg6FRq7cD35e1shat0MrNKZM26deHCmA4GfF02CSX0Qrrf+DEZ/qFdwQ0eX8oaL6S
 w5IjSJNaUHtfhWOf2cO9Br0ymL8Pe1CmwGP0exmwdohNAzWbZcutPFYBPhwgPsPp6m
 YAH0uYICrs/dpQ7/9FsQjokojMCjjIuxih7QlE092tQ7PC3QIkHlTM131B+xytHYul
 8WbEzWiYQVmj7kIQtviD8Jgj/yOvWKL/UOn0+QFdopnxQu/Pr+BZHrTEs9YRWaY9QN
 MrnsNJh+SmHuduRegBGmAlZk7BEzjMYMDWG5MKUWLyoPmqfRQujRzdy3FNELiLmLsv
 3dEn+3cGPRJ7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Zg6FRq7c
Subject: [Buildroot] [PATCH/next 05/21] package/python-dnspython: bump
 version to 2.8.0
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

https://dnspython.readthedocs.io/en/stable/whatsnew.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-dnspython/python-dnspython.hash | 4 ++--
 package/python-dnspython/python-dnspython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dnspython/python-dnspython.hash b/package/python-dnspython/python-dnspython.hash
index 4ed5a04270..01ef94b889 100644
--- a/package/python-dnspython/python-dnspython.hash
+++ b/package/python-dnspython/python-dnspython.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dnspython/json
-md5  7a8f6f15038a116598744517931420d0  dnspython-2.7.0.tar.gz
-sha256  ce9c432eda0dc91cf618a5cedf1a4e142651196bbcd2c80e89ed5a907e5cfaf1  dnspython-2.7.0.tar.gz
+md5  5f2ceb19b1c269f9e1ccef8bf2a1e8c5  dnspython-2.8.0.tar.gz
+sha256  181d3c6996452cb1189c4046c61599b84a5a86e099562ffde77d26984ff26d0f  dnspython-2.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c3ea3ff5654b329c19d3bc5f7481af623c3dded4a6145585499f843ad3d741cd  LICENSE
diff --git a/package/python-dnspython/python-dnspython.mk b/package/python-dnspython/python-dnspython.mk
index 2d3622110c..da3cf223fd 100644
--- a/package/python-dnspython/python-dnspython.mk
+++ b/package/python-dnspython/python-dnspython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DNSPYTHON_VERSION = 2.7.0
+PYTHON_DNSPYTHON_VERSION = 2.8.0
 PYTHON_DNSPYTHON_SOURCE = dnspython-$(PYTHON_DNSPYTHON_VERSION).tar.gz
-PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/b5/4a/263763cb2ba3816dd94b08ad3a33d5fdae34ecb856678773cc40a3605829
+PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/8c/8b/57666417c0f90f08bcafa776861060426765fdb422eb10212086fb811d26
 PYTHON_DNSPYTHON_LICENSE = ISC
 PYTHON_DNSPYTHON_LICENSE_FILES = LICENSE
 PYTHON_DNSPYTHON_SETUP_TYPE = hatch
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
