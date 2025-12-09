Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775ADD3B992
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DC65401EB;
	Tue,  9 Dec 2025 19:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HpNISOpMDtJ3; Tue,  9 Dec 2025 19:42:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 635494026A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309377;
	bh=MnHTqiLkTFS9r7hM1fEyr8KSRTnmGY774sf2ZIe1Ckc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=I9f6wFwaH0V9z/GoUBVU0wpBHyqRj37Qe3Pxxjih9ufkw/fBiwFnkcj4F2F3Eda83
	 2d3fUG7StaIV6dJNXAtrE83gMyJDdrLts27syibB2m3soOrsjtNYlsWiwPYajDl20T
	 qRXMGGkPt82ydGBl6GLI8FlxdcoeAY52DEfjV9LEKgOPR0bibACF3NiMCFIWl21Brj
	 vuIcET6jal6B2itNFN2KT+UQPOHQQzKPg7/4Ppa0oM92Jgmfh4d9XGbqHjVMW3vyGE
	 fkj8/8keTYlC4NBxgEIZcEAntN4to+XTh+hh4y2LcC2/AHmSDTVW10yy4oGZgk3gHK
	 cD/QIicI18qtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 635494026A;
	Tue,  9 Dec 2025 19:42:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 360EF2C0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 281E24026A
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ShNFXY2xQysM for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:42:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 16919401EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16919401EB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16919401EB
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:42:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B2FBFA4C2CA3;
 Tue,  9 Dec 2025 20:40:15 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yv-000000006DN-0TsX;
 Tue, 09 Dec 2025 19:39:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:36 +0100
Message-ID: <20251209193951.1000100-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309215;
 bh=qJypTkakaQUGRKWwjkA8s6hH8tYN4xjByBYMZVcK608=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=qgbSZi4iiDZJLgFjrOLUXwiQHjGNl3KcTRHonSsZuMckLVSvSFAMlHQ5vTcZqHwUZ
 kdNS8ISk0KiyAWxBCRinLl1LGj5L7qK4+CPomSK9jgGvj3JgXO6GvZBQcIU7yiWfPs
 ylSbedjoKHDeQpot7PVP7I/1IYa3aYe+qAH+omU/9fAqcYdixqq/jfYR7TrJZzk+T5
 wm0fHOK1iKDsy1p48R8bUZwxlRVdtAuB01hEZmihW6W4pEe1ysWdYoPREGvawsCA7b
 brUCFXZCmHa0sk/Z9zaBHmagPEdse+44hYHfaXstfMwFlGNWxKcvATE4MLjpxwQhAd
 MpHcDYMEW9J3A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=qgbSZi4i
Subject: [Buildroot] [PATCH/next 16/31] package/{avro-c,
 python-avro}: bump to version 1.12.1
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

https://avro.apache.org/blog/2025/10/16/avro-1.12.1/

Updated help text URL.

Upstream does not provide hashes anymore for avro-c.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/avro-c/Config.in             | 2 +-
 package/avro-c/avro-c.hash           | 6 ++----
 package/avro-c/avro-c.mk             | 2 +-
 package/python-avro/Config.in        | 2 +-
 package/python-avro/python-avro.hash | 4 ++--
 package/python-avro/python-avro.mk   | 4 ++--
 6 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/package/avro-c/Config.in b/package/avro-c/Config.in
index 76d9123a4e..2789e12ad8 100644
--- a/package/avro-c/Config.in
+++ b/package/avro-c/Config.in
@@ -24,4 +24,4 @@ config BR2_PACKAGE_AVRO_C
 	  - Code generation as an optional optimization,
 	    only worth implementing for statically typed languages.
 
-	  http://avro.apache.org/
+	  https://avro.apache.org/
diff --git a/package/avro-c/avro-c.hash b/package/avro-c/avro-c.hash
index 8c6b4b625c..9a53346cd1 100644
--- a/package/avro-c/avro-c.hash
+++ b/package/avro-c/avro-c.hash
@@ -1,5 +1,3 @@
-# From https://downloads.apache.org/avro/avro-1.12.0/c/avro-c-1.12.0.tar.gz.sha512
-sha512  71f0a8b63e212a12d38c05ef0c8e17822af7eb38698e07550a15f49d3f976f015f31cd804784df76c16e6cf7129c0d1a5028cb78032ad0259b4d151dcf022099  avro-c-1.12.0.tar.gz
-
-# License files
+# Locally computed
+sha256  b64e31b94719499549622aa92f1d96d1742967ced261a0931b63be3bbe907f2c  avro-c-1.12.1.tar.gz
 sha256  d62488d6ba17132e92c23c03c80bfedc848267f96ab36489fec860f76cf6819a  LICENSE
diff --git a/package/avro-c/avro-c.mk b/package/avro-c/avro-c.mk
index 0f1ada72f8..3e41716836 100644
--- a/package/avro-c/avro-c.mk
+++ b/package/avro-c/avro-c.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update python-avro
-AVRO_C_VERSION = 1.12.0
+AVRO_C_VERSION = 1.12.1
 AVRO_C_SITE = https://www-eu.apache.org/dist/avro/avro-$(AVRO_C_VERSION)/c
 AVRO_C_LICENSE = Apache-2.0
 AVRO_C_LICENSE_FILES = LICENSE
diff --git a/package/python-avro/Config.in b/package/python-avro/Config.in
index 1f67732ce0..6a76c60f2d 100644
--- a/package/python-avro/Config.in
+++ b/package/python-avro/Config.in
@@ -16,4 +16,4 @@ config BR2_PACKAGE_PYTHON_AVRO
 	  - Code generation as an optional optimization,
 	    only worth implementing for statically typed languages.
 
-	  http://avro.apache.org/
+	  https://avro.apache.org/
diff --git a/package/python-avro/python-avro.hash b/package/python-avro/python-avro.hash
index 3556692398..f7a241b14d 100644
--- a/package/python-avro/python-avro.hash
+++ b/package/python-avro/python-avro.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/avro/json
-md5  03dbb66d68ad18a332a4f4bce0700ca9  avro-1.12.0.tar.gz
-sha256  cad9c53b23ceed699c7af6bddced42e2c572fd6b408c257a7d4fc4e8cf2e2d6b  avro-1.12.0.tar.gz
+md5  e2debe491ace30e479944ac4e8e832d9  avro-1.12.1.tar.gz
+sha256  c5b8dd2dd4c10816f0dc127cc29cfd43b5e405cf7e6840e89460a024bf3d098d  avro-1.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  avro/LICENSE
diff --git a/package/python-avro/python-avro.mk b/package/python-avro/python-avro.mk
index e1cbea8971..f13ea9d2ca 100644
--- a/package/python-avro/python-avro.mk
+++ b/package/python-avro/python-avro.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # When updating the version, please also update avro-c
-PYTHON_AVRO_VERSION = 1.12.0
+PYTHON_AVRO_VERSION = 1.12.1
 PYTHON_AVRO_SOURCE = avro-$(PYTHON_AVRO_VERSION).tar.gz
-PYTHON_AVRO_SITE = https://files.pythonhosted.org/packages/e6/73/48668732bbc8ae1e79b237f84e761204c8dd266c5e16e7601000aba471d3
+PYTHON_AVRO_SITE = https://files.pythonhosted.org/packages/60/00/af1eec633637e12d0945a97f05a429eed83ac45865af60cb453db4689d95
 PYTHON_AVRO_LICENSE = Apache-2.0
 PYTHON_AVRO_LICENSE_FILES = avro/LICENSE
 PYTHON_AVRO_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
