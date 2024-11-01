Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDACCE6F070
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 17:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D81D406C6;
	Fri,  1 Nov 2024 17:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YZVacrE_-lNN; Fri,  1 Nov 2024 17:10:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EC45423AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EC45423AA;
	Fri,  1 Nov 2024 17:10:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9110C60
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 17:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EB71423A0
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 17:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JfNnT1PL79ri for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 17:10:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C8F07406C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8F07406C6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8F07406C6
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 17:10:49 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43159c9f617so16963935e9.2
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 10:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730481047; x=1731085847;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v5DexamfMAOqxr4YC+15zl/ArCWpXcgy8nQ7VEGGVMI=;
 b=VQA3dLV5ZmoMBwVpMoRHqVzawbyrYWPMdny+t1ItONraIHKG5qYwgGYZ0wczH4dmpY
 NsbW1SufKCbEsFni+ZV+AjF355oK1I7kucH+T3jklI8VehzBcZ7NsXTE16njT+AtbIow
 9obsYY9mae6QPGfilXL7638H/3wMN2KkICC3TO1L1jpVgs9XnBDg03aXbYsvwsm1OYQl
 7rZPRgnaXSDddOv3oiLXs/dy6JlaUuNSnCbwVaatcAwgZvr5L0+Tew1qgb28/QRWZDPO
 EvzwBQ57GBmASbjKrt14bD0Hwq3sZ9PhWna53eqtPMZneypoUX8LdX0/WiNjSA/L81Ew
 rv6A==
X-Gm-Message-State: AOJu0YzzBgLVwQchusVmmA87ZDqfiwc5Ssahxtf/xdS/Y1F0seGXw3bP
 FbIcxrPbVRXY7hzv91YKyeKUGgj/opE0U0xS2kOCLxrY2U9LvyWWat83QqZuFk4ld3XUvNNto2G
 Y
X-Google-Smtp-Source: AGHT+IESUJ1WUiGeRqGJe1DXMF+eKX0RJjrjCzULYqtidkCwVgR+hwvfY/h62Oy7wOoAEjtHETggXw==
X-Received: by 2002:a05:600c:4f4a:b0:431:50fa:89c4 with SMTP id
 5b1f17b1804b1-4319ac6fb17mr226695825e9.3.1730481047138; 
 Fri, 01 Nov 2024 10:10:47 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd9a9fb9sm101489355e9.33.2024.11.01.10.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 10:10:46 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Fri,  1 Nov 2024 18:10:42 +0100
Message-ID: <20241101171044.3320155-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730481047; x=1731085847; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v5DexamfMAOqxr4YC+15zl/ArCWpXcgy8nQ7VEGGVMI=;
 b=R2MlBKeAeNwhaNkYfIzebaWk0WVU18oqxKdleHZ/TPPpsbYcfMU7wS2Eus1rZj2bit
 ZDrFVieLuVtOUayZo6V7mhkyZIWtCHYXMsORP45iTRE8wtx3To8XLbgqULlRSJSGjeuh
 obGdIlQSEDx7WtMJxj+UZSXLWbhWcQLEaks1o=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=R2MlBKeA
Subject: [Buildroot] [PATCHv2 1/3] package/python-twisted: add missing
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

Currently the test TestPythonTwisted is not broken [1] since it doesn't
test all modules provided by python-twisted package.

But TestPythonTwisted should have failed due to missing zlib in
twisted/web/client.py and twisted/conch modules.

Due to this, other runtime test like TestPythonPy3MagicWormhole or
TestPythonPy3Txtorcon are currently broken [2][3].

Add missing python3-zlib dependency and update
sample_python_twisted.py to load twisted/web/client that uses zlib
module.

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992685
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992687
[3] https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992646

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992687 (TestPythonPy3Txtorcon)

Fixes (partially due to missing python xml dependency):
https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992646 (TestPythonPy3MagicWormhole)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>
---
It's not clear if all python-twisted modules really requires zlib,
but add python3-zlib to be on the safe side.

v2: update the commit log
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
