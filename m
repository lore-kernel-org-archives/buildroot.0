Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6182ED3B7E5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 05:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9A4A60AC5;
	Mon, 29 Dec 2025 05:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3arOq5qcftcO; Mon, 29 Dec 2025 05:34:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A385760AB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766986471;
	bh=YM37TEDIZ0KWwTFO/rLSe94v8qKY6pfgQUK8BBgom1c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=qaqcqTC0xzNTVx3+cTVr7jxv105mDdluvRQcl6ngxy+X2sfFB/PkxSJKZCxOtftvz
	 5eJAuMTbswForJwtnCa1NoE3TuFWRQ/DzHAg+7VTb793WAQzOC4mJ9o9ifqt2fuVVc
	 8ffN7xbMYbodtH/kw4BIyPXmMQQcre9iu/lf1VhOChX+qZl6EckogDSFUaql+QIE1H
	 pJmu8kYk1pj5VbYS8eZiFxVQZ56Rn+18DrUQQYVZ3vk2HFtfeT6DHLaUJJzJgmGzxq
	 5pPp6uL3k0iq7v1hZPWLc9O2AvuhtZu5CcQjZhEjRNlMONJ6Dn7IncANLdx65g30oz
	 U4IPgMwKYMYcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A385760AB1;
	Mon, 29 Dec 2025 05:34:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DE231E1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 05:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FE4D4074D
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 05:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o1wB7hTahCxa for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 05:34:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 571FE4074B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 571FE4074B
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 571FE4074B
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 05:34:29 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-450823a7776so5645848b6e.2
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:34:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766986468; x=1767591268;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BR7RwtH0VBDhN6+kuYtcZ7epauB9Sl7Z2GZpNK6Uw0I=;
 b=EnpkwmILrLaa3BTfnAw7YqPq3uNAfx8pbl1IhzfRQTtlugcGPy+qfbcT+qZ2sRgneA
 vvgv4J2Fyn/smNslZdScFGbb12CrxGbSfuRqaONSs+AptosFLNenppmXRK6L2f+5QgmN
 k9SZrcm2ArIJTADACkExyGNSf2HEgn9iRx0NCaP/JSCRlOlJy58WHY4eispUlwSlvT6W
 k8ItxOF3/LNDJ8+b8AHbZ5hBqNtMo6zaqDijtYYOWL/p+rRd/lDTm833hDUb9GqeJnXw
 PbTj2bWEd+N2A+Q/uHwFiDGPJ3aTYAGczMkgP37IpsOkiOytlbmCtGo/FhuUzGG8XJJK
 CrEA==
X-Gm-Message-State: AOJu0YyxPi4ysiVRRGFsS3ZkiJ1dqiiVDSK3ANpQxmjILGn6T5vhHHCk
 nJ7N/wtakGo2WAYE7K1456HabkfwVvPmXPdlpQtTolWe9/d88kd2eAcxflSCn8pW
X-Gm-Gg: AY/fxX4g0ybcVYCUIsu6J0v/Kk6TwqJqq+gxHzLQxzhqD0OF0kT9rNb5lJolG7Bw426
 A/Z8JxD+DphNmB5TVBhlyCaYSCEgDmKXWoGIqaG34O1Xrh/iJtjDljzo/rp8ynPU5fhkAHiEWEH
 WJxH4U2Az5KLAhHkk3iOpZZg3kMSV/9pPsigUqJnW3xnQxk704OmNWK155CMj25k3teSduakFB1
 AvkTC7uH0O3unJdVYNhXpaxs/4ECw4n3ncL8UCfyXaDbmgT23kWf+c6p9sverUrde1s2RR56U8j
 LDFYwleSHEt3FtvKfbZK3cThsK3RtBuyELFRy7RXSS0rqCe62rkIXz8TbvyHmC9m1y+yMTvaitP
 h9inM20SQmUEs2JoxIGLTfo97QHy5NyBZhmi4rBgvEklgMZ7uXy7EXEFtTwsOGamNbbdnXPRd+o
 0HzCMhSIuWXNo4fFGfnOFq9vxvCrG6xty00Z4YMfKEnKPonzjv7pKFs2C39OSiekOU1Nn0vHe4s
 hQ/+p5fuVyFjxnwrxnbIqBg2v7l2ccmyoTT8XzVSB8MGirin7E5mkg=
X-Google-Smtp-Source: AGHT+IGPNs9Y4ALJopjn260mL+vA9jYjqcU22EtxryYsbPyWcg5d9IN2fdvJRI0NkABx0pecF4t12A==
X-Received: by 2002:a05:6808:2182:b0:44d:ae60:6606 with SMTP id
 5614622812f47-457b20eb694mr14403856b6e.13.1766986467988; 
 Sun, 28 Dec 2025 21:34:27 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-457b3be228asm13710856b6e.9.2025.12.28.21.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 21:34:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 22:34:11 -0700
Message-ID: <20251229053411.3468160-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766986468; x=1767591268; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BR7RwtH0VBDhN6+kuYtcZ7epauB9Sl7Z2GZpNK6Uw0I=;
 b=gPMuNHUADi1GRU8UGIYjP8TIEoqEFIyEu0Ebrdihjpe85bWiYC9RdIVvzDei7BzMNN
 qgqWj7/2EgqUIQ51mogBfXj+EnP6opuC6gU9yyZ/T0RAZkK3IW2yi+Xq1oj2W+dpMCED
 GH2Xbr0eSPh0g12SEajOt+RXMOFG0+s3fGnLp1aGu5xnj2I0RjErjHKMbR0J2JWQd9m2
 78gwADdK4QM3KLFy330blZYPBTTu7SMZEsBjDsvP4f2gonlpZ7BnIyMNMJarQE53MT+Y
 SMyYYhufntSB6fdvcrteCq8dVhPMqx/2M1hKk6s6NwlceIiMm/koXkJ83VeDERsRpJex
 X3gg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gPMuNHUA
Subject: [Buildroot] [PATCH 1/1] package/python-secretstorage: bump to
 version 3.5.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to copyright year update.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-secretstorage/python-secretstorage.hash | 6 +++---
 package/python-secretstorage/python-secretstorage.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-secretstorage/python-secretstorage.hash b/package/python-secretstorage/python-secretstorage.hash
index ae0a5be347..a722571bea 100644
--- a/package/python-secretstorage/python-secretstorage.hash
+++ b/package/python-secretstorage/python-secretstorage.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/secretstorage/json
-md5  c6ff1cc866d2f1d274b75c6490726b1b  SecretStorage-3.3.3.tar.gz
-sha256  2403533ef369eca6d2ba81718576c5e0f564d5cca1b58f73a8b23e7d4eeebd77  SecretStorage-3.3.3.tar.gz
+md5  e9de49f6474fc3734fde4209e594e7d9  secretstorage-3.5.0.tar.gz
+sha256  f04b8e4689cbce351744d5537bf6b1329c6fc68f91fa666f60a380edddcd11be  secretstorage-3.5.0.tar.gz
 # Locally computed sha256 checksums
-sha256  70f6bfca77633c35efa218328eda5486d7054c2914d61820980e378797520a25  LICENSE
+sha256  e700357592bb93704cb040ce4a6663a85292716a4041b6a267f598f21658466f  LICENSE
diff --git a/package/python-secretstorage/python-secretstorage.mk b/package/python-secretstorage/python-secretstorage.mk
index 81487aa8fb..0f1c3c62f1 100644
--- a/package/python-secretstorage/python-secretstorage.mk
+++ b/package/python-secretstorage/python-secretstorage.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SECRETSTORAGE_VERSION = 3.3.3
-PYTHON_SECRETSTORAGE_SOURCE = SecretStorage-$(PYTHON_SECRETSTORAGE_VERSION).tar.gz
-PYTHON_SECRETSTORAGE_SITE = https://files.pythonhosted.org/packages/53/a4/f48c9d79cb507ed1373477dbceaba7401fd8a23af63b837fa61f1dcd3691
+PYTHON_SECRETSTORAGE_VERSION = 3.5.0
+PYTHON_SECRETSTORAGE_SOURCE = secretstorage-$(PYTHON_SECRETSTORAGE_VERSION).tar.gz
+PYTHON_SECRETSTORAGE_SITE = https://files.pythonhosted.org/packages/1c/03/e834bcd866f2f8a49a85eaff47340affa3bfa391ee9912a952a1faa68c7b
 PYTHON_SECRETSTORAGE_SETUP_TYPE = setuptools
 PYTHON_SECRETSTORAGE_LICENSE = BSD-3-Clause
 PYTHON_SECRETSTORAGE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
