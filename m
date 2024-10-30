Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B192D6B6DC
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 22:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC7404078B;
	Wed, 30 Oct 2024 22:11:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bp3OGt9oZFuo; Wed, 30 Oct 2024 22:11:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DB6A407A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DB6A407A0;
	Wed, 30 Oct 2024 22:11:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B3165E50
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 22:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C21340799
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 22:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rMPmBlfPE_1E for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 22:11:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8B4BE4078B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B4BE4078B
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B4BE4078B
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 22:11:45 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4314b316495so2589945e9.2
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 15:11:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730326303; x=1730931103;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nEZ79VKBGNQ/sdtFc5i8yKrSNQO4B6FKkVbxgNA8qRE=;
 b=Xlx1bnyfN1RWkKCvubbLt9Hbtzo8fPUxjkoWhLWE8kKu0JtTfSskir0Zpt7HmrvcEY
 eMoaKOIqCpjYQHeTTXNKO1GAq0ZB9HKs5m+aOrCacuwsEeWtLs3phfVzY7XHrj49ueAB
 4+BMbg33ypCVyVZcnBLGELOV6Vlqp2kc6s7eXAJ3bIIA+zF+ZfE3e7HLIb8VZGD+vsjC
 EbJ+7tblXa0nt01/o/GKnGpBuing++V8GwmnoFiorcEmN4bWnst08mGK05K2X3Sc/YIm
 oRFHZPh3DyXKL/iAvt9/tHNKTxiFDXVQxoqx5t/ruPQ3iOcZgaj/hrev83oagqZIE8TY
 GF0w==
X-Gm-Message-State: AOJu0YzROWHOhd4k8NvjnCsFiZWOZef+SJVl91ai4VJLkONCcdLkKRv4
 XDDVxcNX+Fwe+Qq9Iz/eDK9QNU81L9FupUD+CAA2XpkVMA2PmZ0ez3lfySn9EIZ3gsFIicDacr0
 9
X-Google-Smtp-Source: AGHT+IETpftPbQkEMJpMMqaBQP3hF9+qQr3TB/8MnPMkFlLujyQPghcneucx/JZzQ7apkSiKgURWow==
X-Received: by 2002:a05:600c:1d28:b0:431:6060:8b16 with SMTP id
 5b1f17b1804b1-4327b80055dmr10141445e9.30.1730326303057; 
 Wed, 30 Oct 2024 15:11:43 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10b7bb7sm214710f8f.3.2024.10.30.15.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 15:11:42 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 30 Oct 2024 23:11:40 +0100
Message-ID: <20241030221140.2520388-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730326303; x=1730931103; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nEZ79VKBGNQ/sdtFc5i8yKrSNQO4B6FKkVbxgNA8qRE=;
 b=q7YqoX9j1KAYJ+u2GssJipuqpDVIaF7Pb8ABlUd8H0Pwf5qrAmCqNxtuiWOexXrL5w
 UpjFraqNsbzvJFveQxK/Jaa6u5sWgweSuR6wL6dFLa+4wqUohQ1AHwHiGt6jZVUuNfvU
 k8H3x1cat0TMjLRYmQpzakCgRDkc9Ingin+Ko=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=q7YqoX9j
Subject: [Buildroot] [PATCH] package/python-twisted: add missing
 python3-zlib dependency
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

TestPythonTwisted doesn't try to import all python-twisted modules and
doesn't detect that zlib module is imported at least by
twisted/web/client.py and twisted/conch.

Add python3-zlib as runtime dependency.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992687 (TestPythonPy3Txtorcon)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>
---
It's not clear if all python-twisted modules really requires zlib,
but add python3-zlib to be on the safe side.
---
 package/python-twisted/Config.in                       | 1 +
 support/testing/tests/package/sample_python_twisted.py | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
index 84786689b7..2d2bc30972 100644
--- a/package/python-twisted/Config.in
+++ b/package/python-twisted/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_PYTHON_TWISTED
 	select BR2_PACKAGE_PYTHON_HYPERLINK # runtime
 	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  Twisted is an event-driven networking engine written in
 	  Python.
diff --git a/support/testing/tests/package/sample_python_twisted.py b/support/testing/tests/package/sample_python_twisted.py
index 47d6c5debc..b5540522fc 100644
--- a/support/testing/tests/package/sample_python_twisted.py
+++ b/support/testing/tests/package/sample_python_twisted.py
@@ -1,4 +1,5 @@
 from twisted.internet import protocol, reactor, endpoints
+from twisted.web.client import readBody  # noqa: F401
 
 
 class F(protocol.Factory):
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
