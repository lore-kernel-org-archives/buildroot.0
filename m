Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D874AC47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 21:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 581C68294A;
	Sun,  7 Jan 2024 21:43:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 581C68294A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X1YQDyGI0_HM; Sun,  7 Jan 2024 21:43:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FF9782F11;
	Sun,  7 Jan 2024 21:43:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FF9782F11
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 342FF1BF2EF
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 21:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D354F40266
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 21:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D354F40266
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AjPfR5ZnBmcc for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 21:43:02 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0A364026F
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 21:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0A364026F
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7ba84a3cc96so75987639f.3
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 13:43:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704663780; x=1705268580;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zbAPnn5NhSRZXClDVih6eLUKXIIXelZqNj1xQaf3nuo=;
 b=ecD9H3o5T7vN6/T7aFYMdU5GQIwbmJDQBn8qcAUjix68LkAxIGoERYIsIlBgk1QAXX
 dQ14TZ6/gp03jSSLCughtSDeLn4suchDzxOFLunwUBBjKmMX0KMuRA4i5eLexTHO9NpJ
 UfuLaw+afLAudIuR2obXHkvwPpfvx28ToNZjSXrdv8ORiprGvGBFKjOjl5BSOss0WP+A
 /OZ7ZCg4O31oHYaVCOYHMqm90WmQWEHiA1Ub/P6f/omT/ViY/OOzapZ2l3xvU36xWkdv
 P2exesRGnY1ELjwSscIr2k3yknU2MIk0E5UF8+3Zv0IgFHiurL/NFNN6mzKz7Jbc3hps
 u8Jw==
X-Gm-Message-State: AOJu0Yz8Qp3qgzBJ9ptfvvTjxzS9dHizwEStRk7W6at/9xikadY58qRz
 IevE41lOOx7rJ35SYq0eciuuSfdmqZdFqQ==
X-Google-Smtp-Source: AGHT+IEuzdZcknsn2gspN0oKVUM1qayTMwR9OgKi1eYuc9acDui1/9mSyB3f1vqVgsGH0OReGgaU5w==
X-Received: by 2002:a05:6602:420d:b0:7ba:9a06:c1b1 with SMTP id
 cb13-20020a056602420d00b007ba9a06c1b1mr3884809iob.43.1704663780337; 
 Sun, 07 Jan 2024 13:43:00 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 bt9-20020a056638430900b0046da402ed29sm1878738jab.109.2024.01.07.13.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 13:42:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jan 2024 14:42:55 -0700
Message-Id: <20240107214255.3331708-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240107214255.3331708-1-james.hilliard1@gmail.com>
References: <20240107214255.3331708-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704663780; x=1705268580; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zbAPnn5NhSRZXClDVih6eLUKXIIXelZqNj1xQaf3nuo=;
 b=FYM/G3aUAkyMJ3GP9uXQZzD951zMnZTTBBB/wEDo2wKbZLtQ7q+9333+apb5syz9RM
 sRPtFmOEy5MGj/tQzWMp6KW+vLjBCzKS6p0xPNF0UpTCScul23EnuEDv/RDAtiyA3oKg
 VMkOHUcpYQjV+YmsYoYAMZce1FZE7eoO0k+NizFRDwcSup5AF/GDxavuN7jr/hiMeN5H
 SBY6QM5YIKLYFlYYlyyJ1/aiAcgxn5wGPAoie8L9HY6F6dOJvgdyoYEhsT6jpQnMdzLT
 AFUz8Oog1MbB4dN4nzBEnNBgKxW1u6PaVdZQzs0nbm8aCMVWGPPK3xwX7U9mQDuJwXYw
 rjeg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FYM/G3aU
Subject: [Buildroot] [PATCH 2/2] package/python-aiohttp: bump to version
 3.9.1
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

Drop python-chardet/python-cchardet runtime dependencies.

Drop python-typing-extensions runtime dependencies.

Add new python-brotli runtime dependency.

Add new python-frozenlist runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiohttp/Config.in           | 5 ++---
 package/python-aiohttp/python-aiohttp.hash | 4 ++--
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/python-aiohttp/Config.in b/package/python-aiohttp/Config.in
index 35c162b948..0507106fe7 100644
--- a/package/python-aiohttp/Config.in
+++ b/package/python-aiohttp/Config.in
@@ -4,10 +4,9 @@ config BR2_PACKAGE_PYTHON_AIOHTTP
 	select BR2_PACKAGE_PYTHON_AIOSIGNAL # runtime
 	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
-	select BR2_PACKAGE_PYTHON_CCHARDET if BR2_INSTALL_LIBSTDCPP # runtime
-	select BR2_PACKAGE_PYTHON_CHARDET if !BR2_INSTALL_LIBSTDCPP # runtime
+	select BR2_PACKAGE_PYTHON_BROTLI # runtime
+	select BR2_PACKAGE_PYTHON_FROZENLIST # runtime
 	select BR2_PACKAGE_PYTHON_MULTIDICT # runtime
-	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	select BR2_PACKAGE_PYTHON_YARL # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index 35c899cb0f..374e66ae8d 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  bdf57b82c0d1804f458e10320bb0dcd5  aiohttp-3.8.6.tar.gz
-sha256  b0cf2a4501bff9330a8a5248b4ce951851e415bdcce9dc158e76cfd55e15085c  aiohttp-3.8.6.tar.gz
+md5  264e1b4fbe9f09050523c03f4d9b5ee2  aiohttp-3.9.1.tar.gz
+sha256  8fc49a87ac269d4529da45871e2ffb6874e87779c3d0e2ccd813c0899221239d  aiohttp-3.9.1.tar.gz
 # Locally computed sha256 checksums
 sha256  9f80d0db7d755a941db4572172c270ecbd8f082ba215ddd095985942ed94a9eb  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index e814fc9224..2cb9058b97 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.8.6
+PYTHON_AIOHTTP_VERSION = 3.9.1
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/fd/01/f180d31923751fd20185c96938994823f00918ee5ac7b058edc005382406
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/54/07/9467d3f8dae29b14f423b414d9e67512a76743c5bb7686fb05fe10c9cc3e
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
