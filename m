Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3FCD43343
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84D4481698;
	Thu, 11 Dec 2025 19:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A4h6L6OpAfcL; Thu, 11 Dec 2025 19:57:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D117814EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765483054;
	bh=ibpW4xRrTo3jdkdwUS413+Kcw9vpoKK6BZJYM2ykDO8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EDRZWxjF5y/SfBELUBJt+wTzPT1jahXEwW+NFScXtbQSqEOSItpUWvaUlpv4Hnw7c
	 nD+rP0hZ5cwqnKoEQFxY+worcjCPGQhUa/3AiU3a9a5O34fouJHQAXcwEwPh1r/Z1p
	 yp6cYv5OaADgDsUxyvK1cKbVhtDYDiYadYGkq7GNjBIlvW0xzGSfenAFD80zTSTIlW
	 17o614IcGDklTTgt1gkuhq49Zr+tWFXw54h0Ea4dMJ7+2p7ZtxjK9dlex9jjBH2Qlw
	 FY0GOJXSUIA93Ty6lYwQ0bUbBh/LQByDAmqDdd8xK6UtIh0zg5jgFoQ76uZpspZPd9
	 Wrb1pCOHZyLYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D117814EA;
	Thu, 11 Dec 2025 19:57:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D5C6C2C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCF724097F
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2NHMHq3AT_nT for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:57:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A8CE540945
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8CE540945
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8CE540945
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:57:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4D8B2A4C38AB;
 Thu, 11 Dec 2025 20:55:36 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39350)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vTml6-000000008Hh-3Jmq;
 Thu, 11 Dec 2025 19:55:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:55:16 +0100
Message-ID: <20251211195527.3276900-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251211195527.3276900-1-bernd@kuhls.net>
References: <20251211195527.3276900-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765482936;
 bh=jlPzCuZkyZhv4gfme/6ywkrXKgX+NFm+67zhx4lcK2A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=LBdlEkzdwaOEmKKcRST5v5rrp8U/zkENejQGLZTM/f4vVW++1r9jhu32UfxDFFzbL
 zsOwUCvxAFKXY4Xdbe+5BJIwJigAL7Mh+QVmdnL/oTSvLnT7j315KT5L7pyRuTTETG
 1zgVlssjS7F5l+eEtLdcs46bHz9yGOhy3xWOuQtsk8FJ/GP3tRJ3kLyZtF9wStscB9
 pfOh1BHIklAm9NXwpPiJprR606Nt95ft0zEOErXDmKmDWP1EA7HKLrXwMQ5JTcpS3N
 fdFHuXThkYU0N99Ut08hb8w19QU1fYWn/76pLWJSXKVmh42PYhLP0T+a5GUEH/uQak
 YifgVQFV7gg4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=LBdlEkzd
Subject: [Buildroot] [PATCH/next 10/21] package/python-filelock: bump
 version to 3.20.0
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

https://github.com/tox-dev/filelock/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index a266762eea..f47e8fdb5a 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  32624573c1dcea186f907c78e4fb80a2  filelock-3.17.0.tar.gz
-sha256  ee4e77401ef576ebb38cd7f13b9b28893194acc20a8e68e18730ba9c0e54660e  filelock-3.17.0.tar.gz
+md5  0b9c4280769cd87d874711c13adf50bc  filelock-3.20.0.tar.gz
+sha256  711e943b4ec6be42e1d4e6690b48dc175c822967466bb31c0c293f34334c13f4  filelock-3.20.0.tar.gz
 # Locally computed sha256 checksums
 sha256  88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 44599ee865..8201fb1e66 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 3.17.0
+PYTHON_FILELOCK_VERSION = 3.20.0
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/dc/9c/0b15fb47b464e1b663b1acd1253a062aa5feecb07d4e597daea542ebd2b5
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/58/46/0028a82567109b5ef6e4d2a1f04a583fb513e6cf9527fcdd09afd817deeb
 PYTHON_FILELOCK_SETUP_TYPE = hatch
 PYTHON_FILELOCK_LICENSE = Public Domain
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
