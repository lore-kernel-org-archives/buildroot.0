Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50B2E6F06F
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 17:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AED6F6063F;
	Fri,  1 Nov 2024 17:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WwXnQUApGzjy; Fri,  1 Nov 2024 17:10:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE97B6071D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE97B6071D;
	Fri,  1 Nov 2024 17:10:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC2A2AF2
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 17:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B60D40376
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 17:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id epC6JthSzD9j for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 17:10:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D617D4042C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D617D4042C
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D617D4042C
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 17:10:49 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4319399a411so18634075e9.2
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 10:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730481048; x=1731085848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H7B/sbW6nr2lotPSYgNfOZkHn34nI+nEkbuZH0xTixc=;
 b=LuLvDfIpps8lTlYiOvvEBy0XsCSZKvhLEovnpNRHoYT4b2yrF5FJ3GgzRciYr0+KGA
 SpyN6qCV98hNWUb+3fAfjZpM80dJziokw7dqtfdgsba8crNkNd8QSkrNX7R9W9EXLNKS
 sREYMrbGCuPXj4A9Muax//SIRKASoTKexWmuyyFxMdtLGnCtfc4pqLwFCTOPm29SbxVs
 BesQW0LQZOfj7Vi/DjEpXYIx+09AeoOX/vUncvz984x5MJA3phsrTtiwCcC8iZuQMBBh
 ZO+W/i8rXADb9ELTDBxeMRUfTuoOesYeGYYawpOFEkmHfFEdy6Wu/ARP7ui9EU0+I0M+
 EBzw==
X-Gm-Message-State: AOJu0YypYdmB+gB2ES2zuzXVD0QjSHtdVcdIH8mcDMqDUztLSF4/mAeC
 +lUxa+X8HUI0+EGYgY3DWs7PFHQv2qYa3AyxJ6tcZ57LqIRDTFuLGnowe7QFp7Tx7qiEBQQ6wDt
 Z
X-Google-Smtp-Source: AGHT+IHO6hDwWDP1YYhfl8/2u8R1jTMm3CriYLqZyMCxz8l4BR2ZoKYMe6vn40OCjmnWEM25tH+f7Q==
X-Received: by 2002:a05:600c:350b:b0:42c:e0da:f15c with SMTP id
 5b1f17b1804b1-4319acbb947mr184240255e9.20.1730481047644; 
 Fri, 01 Nov 2024 10:10:47 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd9a9fb9sm101489355e9.33.2024.11.01.10.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 10:10:47 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Fri,  1 Nov 2024 18:10:43 +0100
Message-ID: <20241101171044.3320155-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241101171044.3320155-1-romain.naour@smile.fr>
References: <20241101171044.3320155-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730481048; x=1731085848; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H7B/sbW6nr2lotPSYgNfOZkHn34nI+nEkbuZH0xTixc=;
 b=LNi7AwljSu5BaPcf3F369+jRfUO010EqjNi6Nmx4/Sxo4h/Sj/oVSbzORzlLsF9uQH
 Mjd+z6pmKPaRs6Y7uNU9P3z/frISA715kK+81dYOXoh5k55qYRk9MsyYrOhfpUj+m5kq
 bQiQCdXFnPWAgh5NYTDTmA28MYnqsjsV13Pcc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=LNi7Awlj
Subject: [Buildroot] [PATCHv2 2/3] package/python-twisted: add missing
 python3-xml dependency
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently the test TestPythonTwisted is not broken [1] since it doesn't
test all modules provided by python-twisted package.

But TestPythonTwisted should have failed due to missing xml in
twisted/web module.

Due to this, TestPythonPy3MagicWormhole runtime test is currently
broken.

Add missing python3-xml dependency and update
sample_python_twisted.py to load twisted/web that uses xml
module.

Fixes (partially due to missing python setuptool in
python-magic-wormhole-mailbox-server):
https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992646

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/python-twisted/Config.in                       | 1 +
 support/testing/tests/package/sample_python_twisted.py | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
index 2d2bc30972..3254278fe9 100644
--- a/package/python-twisted/Config.in
+++ b/package/python-twisted/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_PYTHON_TWISTED
 	select BR2_PACKAGE_PYTHON_HYPERLINK # runtime
 	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  Twisted is an event-driven networking engine written in
diff --git a/support/testing/tests/package/sample_python_twisted.py b/support/testing/tests/package/sample_python_twisted.py
index b5540522fc..ec5ce2a31c 100644
--- a/support/testing/tests/package/sample_python_twisted.py
+++ b/support/testing/tests/package/sample_python_twisted.py
@@ -1,5 +1,6 @@
 from twisted.internet import protocol, reactor, endpoints
 from twisted.web.client import readBody  # noqa: F401
+from twisted.web import xmlrpc, server  # noqa: F401
 
 
 class F(protocol.Factory):
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
