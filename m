Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02A9D3B992
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5F3E84722;
	Tue,  9 Dec 2025 19:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 76pieH6EK1pO; Tue,  9 Dec 2025 19:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF19F84723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309281;
	bh=JPdw0q6+up3vg8WNdKuxCOfbEbhNAL2MXMoBAPBKXkE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EyXhwaY2WX9W9MljhS5CmzO/1L8Frzc+HU/1qdWzq+balOwP80DTQAw61VsB3s/AZ
	 CyB5Ygk8n0J+ipNjujhKwqJzP6/QWZjKqE472qGQSYQBUWbqbPCK2MbgfCZINqyVWP
	 PjWnYJ6LO+AhhybgmYoWLJb46J4P+FbWDg/WMa2r2Q8mGzSVbMsTOy66sDAz9btOsS
	 0dT14nxSBLbWwmPVUvoD0iqu7LxHKqBxkdyVIZSIH3Vm0E/moWLIKxSvI6JWKRxb4y
	 HYvrO8dNC0aC2mer3C4MeKJq9ZIxCrEv4s/SOHPIuKxCtSZ8q3jfGNdHmlNH7WXXwK
	 XaA2wE/lr6CAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF19F84723;
	Tue,  9 Dec 2025 19:41:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA1572C0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90C526136F
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r7ojLOpuINhv for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:41:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7764A612BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7764A612BC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7764A612BC
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:41:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 148D1A4C2C39;
 Tue,  9 Dec 2025 20:40:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yu-000000006DN-2f0C;
 Tue, 09 Dec 2025 19:39:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:29 +0100
Message-ID: <20251209193951.1000100-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309214;
 bh=e3yT9+cJYawPIBPH9Z5dLsrLxpY0l1l8tIgrtX8m0+k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=SHSAxl1kzHNA7p3EProP/AE8QxD3ETqS6oGDW5trColAYJe+l0p4BZA3cD7jQO7Yl
 QTf91zuagBwEHYSyDePlsAPcVMhZLCsk5zoqpqgWzb9FopAXl0YT6Gn7ZqhpE99Yik
 ZDW07qd9QQvsBx6bNwHh4kxiZOl2IDNZzkMLdwqge6E7c65SZXmYNdzdz9Mq1FQsW4
 av8wpPdFOaB46IUZOQPpxqv0HUCvNnqsVPICBv9nGeHaahOBGqB7fRfkJeZt12awze
 T7bik0guxMy/BG6+HB1M4cCeXDXwFZFfOmasI+xp9OCc5H/9PuOG9neusJo7TdJfwD
 lDmpWHn8Gktcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=SHSAxl1k
Subject: [Buildroot] [PATCH/next 09/31] package/python-argon2-cffi-bindings:
 bump version to 25.1.0
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

https://github.com/hynek/argon2-cffi-bindings/blob/25.1.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../python-argon2-cffi-bindings.hash                        | 4 ++--
 .../python-argon2-cffi-bindings.mk                          | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.hash b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.hash
index e088d3dad1..9237741eb4 100644
--- a/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.hash
+++ b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/argon2-cffi-bindings/json
-md5  f1591e1af7dea9ef3e5b982e2c196c1d  argon2-cffi-bindings-21.2.0.tar.gz
-sha256  bb89ceffa6c791807d1305ceb77dbfacc5aa499891d2c55661c6459651fc39e3  argon2-cffi-bindings-21.2.0.tar.gz
+md5  135e9e3b3a166e602bc0512899254894  argon2_cffi_bindings-25.1.0.tar.gz
+sha256  b957f3e6ea4d55d820e40ff76f450952807013d361a65d7f28acc0acbf29229d  argon2_cffi_bindings-25.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  9c158d4f433627f48ac24b6b4d37970afe4172514673c5318014d7cca157c6df  LICENSE
diff --git a/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk
index f0d71e803a..b9a28f6908 100644
--- a/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk
+++ b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ARGON2_CFFI_BINDINGS_VERSION = 21.2.0
-PYTHON_ARGON2_CFFI_BINDINGS_SOURCE = argon2-cffi-bindings-$(PYTHON_ARGON2_CFFI_BINDINGS_VERSION).tar.gz
-PYTHON_ARGON2_CFFI_BINDINGS_SITE = https://files.pythonhosted.org/packages/b9/e9/184b8ccce6683b0aa2fbb7ba5683ea4b9c5763f1356347f1312c32e3c66e
+PYTHON_ARGON2_CFFI_BINDINGS_VERSION = 25.1.0
+PYTHON_ARGON2_CFFI_BINDINGS_SOURCE = argon2_cffi_bindings-$(PYTHON_ARGON2_CFFI_BINDINGS_VERSION).tar.gz
+PYTHON_ARGON2_CFFI_BINDINGS_SITE = https://files.pythonhosted.org/packages/5c/2d/db8af0df73c1cf454f71b2bbe5e356b8c1f8041c979f505b3d3186e520a9
 PYTHON_ARGON2_CFFI_BINDINGS_SETUP_TYPE = setuptools
 PYTHON_ARGON2_CFFI_BINDINGS_LICENSE = MIT
 PYTHON_ARGON2_CFFI_BINDINGS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
