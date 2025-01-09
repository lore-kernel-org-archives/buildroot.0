Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BE1E77199
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 21:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 955A6606C8;
	Thu,  9 Jan 2025 21:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1MLWtz8XHAQe; Thu,  9 Jan 2025 21:42:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90D3560AD9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90D3560AD9;
	Thu,  9 Jan 2025 21:42:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C236E942
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93E4760AD9
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W4thqaw1AscV for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 21:42:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8FCDE600CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FCDE600CC
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8FCDE600CC
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:42:02 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-844e7bc6d84so45397239f.0
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 13:42:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736458921; x=1737063721;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nv35TDkJa8IPkrumDy9drwSOovy03uV6X9RXb7WCrhc=;
 b=JFftcLhl2kTmD8x2bpY3FCwm37J0DgKVUuoHsz3BY/3gblMtydge+5K6xEQCEEi8YD
 9WskJi4O0EVpDREp927JAcMm8Iz+zSWS39HTYkkF5VqB4tT4xcZPnLEPO25XHECNWDGK
 X2uUvuIqWDFvsQQXMPuWR0YUnLD+BxMUGewTnzrzeuHGP0R37wT0zJDipKxLYSxn78Mi
 8i12VY/v5Sjrx0+BrtwmilH9bYXDyE6cUXcpnmmjkx1ucIusvL66X1aMbINLCVepU2vl
 7mxplFx6eTxcYuLz+efBRiU+UP5PAo+b++8tC5Qf1Hf9M+FVRJ41DpoUEaB7EM4+cjmY
 yW/A==
X-Gm-Message-State: AOJu0YwGfmlukJTO4/w5cJl9C3y4WQIEv2tQlK3zqF07kBkPHn3yvoJc
 9S9IuXkugcm4gOa4uJA1DnGJP37k8cqj3228KClbJadZz0FAk4jevL5k33RK1BQ=
X-Gm-Gg: ASbGnctUomptBWVcVge1Ip+UlLEUuNxcMNFO+tL1KwlQ2xXGljlMRZR7chrUHjKz1sv
 4Yvu6qEGb4tzmdH84D/VV/Jjl/KwTpntwO6ilDzJgTLGs5WtJuL3SJs5Neyx5mq1P/kWb6dtoXL
 jVW86YJyuJacdmL7PgGdeENLXWxpVMnXPMEkwcpVbraPdzbPZeRYA4ZPbq4gK7bu548RE+s/56A
 iwVpZgTHFDbdpSoeBQc4H0KXPu0IB/UGhqatxPAz/NEL4XZcEcOh9QpTcMkMuoIJVM+onPXAhj/
 gMdcJy6VmclQRdZzSlyDnTEKxjmKr0o=
X-Google-Smtp-Source: AGHT+IGKT3dSKZQPQUOPAwoX5wIhargI1blIxe+RrwSkdzaH59jo5sgDOzSFbY4MU1zQ4fV8Gcr67A==
X-Received: by 2002:a05:6602:488f:b0:83b:5306:d24d with SMTP id
 ca18e2360f4ac-84cebef5590mr351792239f.6.1736458921242; 
 Thu, 09 Jan 2025 13:42:01 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-84d4fb1b4besm52432639f.17.2025.01.09.13.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 13:42:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 14:41:58 -0700
Message-Id: <20250109214158.2413259-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736458921; x=1737063721; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nv35TDkJa8IPkrumDy9drwSOovy03uV6X9RXb7WCrhc=;
 b=B9Rxokc7SCtF3tfp0K/zKAbQ6SAXgcXgu5uAgAWDjx/3brhaWVVMorIN4QjgyPiyYA
 qRAWkh55SL87Fhe96Cc60Cykdv2uzEryac/5xiD4QrOb0BCXhqYgFDjh+7jYcNBycD8U
 YXpSUgg56Gs5dM839QnDwjrnm+rowGJIg2iSy93vEZcO/9MX2+6l9kBJb2nWPzQ435oC
 OHPyPA7FZtG5LNW1G3cXIZ2eJKCe0TboSRJji21/FhA+hw3jRS29b5kN5jDX6AERnuJa
 yMaH9iWZoBSciq7NH/6aAk1gIdnt5Hp1zpYcj+tyEKU3QLu0fbjL8ejOUGkaj46Zaror
 SA3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=B9Rxokc7
Subject: [Buildroot] [PATCH 1/1] package/python-jc: bump to version 1.25.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-pygments runtime dependency.

Add new python-ruamel-yaml runtime dependency.

Add new python-xmltodict runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jc/Config.in      | 3 +++
 package/python-jc/python-jc.hash | 4 ++--
 package/python-jc/python-jc.mk   | 4 ++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/python-jc/Config.in b/package/python-jc/Config.in
index b88150e069..1933db253b 100644
--- a/package/python-jc/Config.in
+++ b/package/python-jc/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_PYTHON_JC
 	bool "python-jc"
+	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
+	select BR2_PACKAGE_PYTHON_RUAMEL_YAML # runtime
+	select BR2_PACKAGE_PYTHON_XMLTODICT # runtime
 	help
 	  Converts the output of popular command-line tools and file-
 	  types to JSON.
diff --git a/package/python-jc/python-jc.hash b/package/python-jc/python-jc.hash
index 75d64da7bf..d8ee918ac7 100644
--- a/package/python-jc/python-jc.hash
+++ b/package/python-jc/python-jc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jc/json
-md5  7e9454e01eafa7c8c6e415fddc7d2638  jc-1.25.3.tar.gz
-sha256  fa3140ceda6cba1210d1362f363cd79a0514741e8a1dd6167db2b2e2d5f24f7b  jc-1.25.3.tar.gz
+md5  77e798f2c3fbe89c0dbf7b31dc35fc69  jc-1.25.4.tar.gz
+sha256  a32eaf029c56b582dadae48895f20784d0f84f2fa28a8e2b32f377a8bffa8b39  jc-1.25.4.tar.gz
 # Locally computed sha256 checksums
 sha256  6493f2db400f4166ca0956cf192a41aa092bd1396ff463e7fdaf51f257c10497  LICENSE.md
diff --git a/package/python-jc/python-jc.mk b/package/python-jc/python-jc.mk
index 202884f3dc..9a3754a0fa 100644
--- a/package/python-jc/python-jc.mk
+++ b/package/python-jc/python-jc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JC_VERSION = 1.25.3
+PYTHON_JC_VERSION = 1.25.4
 PYTHON_JC_SOURCE = jc-$(PYTHON_JC_VERSION).tar.gz
-PYTHON_JC_SITE = https://files.pythonhosted.org/packages/a5/82/bfb1ec7d9667bc2f922254bc62e12fd460a5de3b711518f5089df0a17180
+PYTHON_JC_SITE = https://files.pythonhosted.org/packages/5b/82/146ef4c94297ef87c6a732c92dd57761bea2c2179e1b8ca8a6b9b8dd6ff7
 PYTHON_JC_SETUP_TYPE = setuptools
 PYTHON_JC_LICENSE = MIT, BSD-3-Clause (bundled pbPlist)
 PYTHON_JC_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
