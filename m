Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347CFC83F27
	for <buildroot@archiver.kernel.org>; Tue, 22 Jul 2025 11:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 259B66F554;
	Tue, 22 Jul 2025 11:10:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cN8KNzc3SK4m; Tue, 22 Jul 2025 11:10:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80ED66F53B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80ED66F53B;
	Tue, 22 Jul 2025 11:10:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A0B1E0
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 11:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F041F42A36
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 11:10:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hcT24oRG9Z4k for <buildroot@buildroot.org>;
 Tue, 22 Jul 2025 11:10:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 651E942A35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 651E942A35
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 651E942A35
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 11:10:13 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so58656515e9.1
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 04:10:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753182611; x=1753787411;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XMSvpVGvlMiuWkRky1nNwVoeEWeLaiFlr+acwQsJseQ=;
 b=I6j0DcIrXkplxDcYEX15+mEV8HL/3fhMAIFPco+n40eSHWLlb/VY0yqwKkXhWki3x7
 uPg+1hBplx7ZyzM6QkxG3e5HI0miYBdfukcPvaTxnkDJ9jBQ3VJjKE4swKDgcsbSFuzG
 vD8HZjI+5X+x8TkwtkTVc6Hrg3bwhD3/j5cL8bMehFO+vPk6Xr4LdkQO6chCW3WFz3CH
 33At5KRuX7+H3mMm4CybuwEfcY6nwpOF+Xmhi+8C0JvaUhC7z6RjDIcEgZQRrGrMcRK0
 lcIvYDSzTMgryQbuKL1wlhUHPgwCUCxw/lCXTv9Csc9vwrDvZEAQoSs6yYpFFsIBCG0V
 8h2Q==
X-Gm-Message-State: AOJu0YyX4A+PgmQmP2/HYcDbK6nn7K4xd3nxGIvc+rEus6TC/ck1XRny
 uyMs9W6sH6nr+GcB3hrGJ5cQuEWJeH1M26c52l6cdFj/qaJRkcRINtCv9+fhHs9NQLoPEIXM1O2
 aNAZc
X-Gm-Gg: ASbGncvz/rT69J/1CcsyEV/pHYaSpHCa9S0pIUreEM/wnk0ANMbjAvrpOukDZzzKZ8e
 nXPPBIt6f26wxNAgBxZJCBOXdZstMSk5feUNwpUfWoswfuoCpeGm91LrBjEMbDxk9FNkbyXd36l
 FkJ2/14TSVSI/B3axzXIWmWFSqX+zHP771qEAi+R2pd7W5wB3GjQV2PeYTfPUI1QV59fdptQ8SL
 e4fhYLPGv8BwhN2yzujwONo0VNM8ERqbNLciJf848PovOikaFTc7gr1g87/hpsCIPtrCOuL2+o7
 Cvrgzjaw6MGzz2xBClY+EsiEHRsTynWQ2wvCb1TncsNTvgi8W2ffOEfGe/cEHtVCTpzsGpCFYhR
 4dEB+KSUgV7/UhbHMUcXlu19icejKiz5R7sh+z7aIMnUtCpSVKT9HRw==
X-Google-Smtp-Source: AGHT+IEX/m3OaV3Df6TrEpHD09OcC8fe5ZHzxUcRZdn1vNEOtvyhpv+XDvW0wfRnHk3mODbhv0dulA==
X-Received: by 2002:a05:600c:6097:b0:456:302:6dc3 with SMTP id
 5b1f17b1804b1-4562e3c4b98mr187802215e9.26.1753182610510; 
 Tue, 22 Jul 2025 04:10:10 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca5c632sm13285393f8f.80.2025.07.22.04.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 04:10:10 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 22 Jul 2025 13:10:00 +0200
Message-ID: <20250722111000.88565-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1753182611; x=1753787411; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XMSvpVGvlMiuWkRky1nNwVoeEWeLaiFlr+acwQsJseQ=;
 b=TCSHZQlVbINgxkQG2RCDyg2j+KcI6QUzmbChOcia1areqQm/0dQ4Rk+IfIWWkv2fN6
 H7Wt9mx0D12BphRN4MRJC84shT/EPug/IeK/g2s7Tf2RGHIRjaX5twWJlM5P4MvlLtnr
 0dVI3QBftR+CLyVPupcN3fCIRzbxh2iI8JKJHCXxo6ixczH7oofGsSLrEWgzKV51Hx7N
 Y/nPZOs8K5xBXRUv8tuVRoYlIhNSrF0FV3UKZorYEpdaMyfQXPIwvaNl9M/MF+9+Ki79
 Bu6AMLLc7fZ1duSLVAqkb8eKBy1v6CFVwKw8kz4dP2SmwkZfhNVJIIuZ9F/32akoz3Qt
 1ysQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TCSHZQlV
Subject: [Buildroot] [PATCH] package/python-starlette: security bump to
 v0.47.2
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerability:

- CVE-2025-54121:
    Starlette is a lightweight ASGI (Asynchronous Server Gateway
    Interface) framework/toolkit, designed for building async web services
    in Python. In versions 0.47.1 and below, when parsing a multi-part
    form with large files (greater than the default max spool size)
    starlette will block the main thread to roll the file over to disk.
    This blocks the event thread which means the application can't accept
    new connections. The UploadFile code has a minor bug where instead of
    just checking for self._in_memory, the logic should also check if the
    additional bytes will cause a rollover. The vulnerability is fixed in
    version 0.47.2.
    https://www.cve.org/CVERecord?id=CVE-2025-54121

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index be23e4ccb1..5939eb198f 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  b876ddd8665f70bb74e45d1fda053699  starlette-0.47.1.tar.gz
-sha256  aef012dd2b6be325ffa16698f9dc533614fb1cebd593a906b90dc1025529a79b  starlette-0.47.1.tar.gz
+md5  b58c9f8d38df9946689cb3e9f94555da  starlette-0.47.2.tar.gz
+sha256  6ae9aa5db235e4846decc1e7b79c4f346adf41e9777aebeb49dfd09bbd7023d8  starlette-0.47.2.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index eb49230600..4037903cc5 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 0.47.1
+PYTHON_STARLETTE_VERSION = 0.47.2
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/0a/69/662169fdb92fb96ec3eaee218cf540a629d629c86d7993d9651226a6789b
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/04/57/d062573f391d062710d4088fa1369428c38d51460ab6fedff920efef932e
 PYTHON_STARLETTE_SETUP_TYPE = hatch
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
