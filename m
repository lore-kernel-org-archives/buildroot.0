Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB058CD3430
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 15:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E34F4169B;
	Mon,  4 May 2026 15:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-0zZTQSI4Pe; Mon,  4 May 2026 15:17:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACDD641688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777907836;
	bh=wJ5GEYqlrVLSs+2XiXv3WEs8zt9ju26uIvC/UnkdZRo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=SFpqjBbgLu+sT0wJOkP5VpSbJFzVycdOrcJwPcoXIfEhgwGqTbIWa6eS+yFN7tL8+
	 8NHxhKRAo6ka35wv2+Io8f6rQfOBxSXIjNddBcfygyv8dteEQMD4t367pNUPigBtxY
	 +PkpSLWRXsDi7WzW2ZdWKTthoqXSSbmzVifO9r9WD8e6zINgguQCFXWiTSdg169BCQ
	 GHQH666xVPdZDV5mnYEq8IEIdUOM7Xz+wbt34hDG0HUCND/7Su9g+tgAVm1RKLtSLj
	 IP1ZtVQulGnO4n+XITu9Z1eNs7KbYQ+1UVuQ0ZJK/c9HljkpIMQGvmLnE4Sl5ixSgm
	 2kxlJo3YBDWyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACDD641688;
	Mon,  4 May 2026 15:17:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EF2A190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 15:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14697614FA
 for <buildroot@buildroot.org>; Mon,  4 May 2026 15:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 61vSW_vFur-W for <buildroot@buildroot.org>;
 Mon,  4 May 2026 15:17:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::244; helo=mail-oi1-x244.google.com;
 envelope-from=frcomdev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 200C16136F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 200C16136F
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 200C16136F
 for <buildroot@buildroot.org>; Mon,  4 May 2026 15:17:13 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id
 5614622812f47-47c7b282d73so1523998b6e.3
 for <buildroot@buildroot.org>; Mon, 04 May 2026 08:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777907832; x=1778512632;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HDoRIvgvo9M9jAT76pxpZ+7BJCLML8wfPS8pzVhadGE=;
 b=WLfkf2bzqmr51Ki2Q4l+v1dZKiMkx+71clN/S95GlngACPf9k2NrkDqKk5roDr9Epj
 DJAMj+payh8VLg6g4qOl3tR3C6N09BEdIxT/PPb2T0fN5UoVAmY/mM4JLnTNX/FdafFS
 Y7g/bWmRnnh8sE0JCHSHwl+HVAqL/3NZMMuHL0pn0pLNZfNPnwaRTfVkMfa9bJ1eHEm/
 ivBVc7hytOX/VPkTgpiE7U/ZKMIL5d03NT8juFKaSWfwAF7OTiO3od4gCgpHBBQEwFA+
 WtEYCXGf0MGpuavHzI2mccJ2785YZcg4B4iRqOkyIv3CJhG86m47znXLBMEEuqVJsU7a
 w57w==
X-Gm-Message-State: AOJu0YylqzaOSrpBHl1gMTUbrciUug9VwGgO0useztur9Jk5U2B863AE
 0TxKVFThYh3AnW7zC5zN328P8dqvXJMhLEvM/joqmLR5fpqDEutgAJ9z5n0qXix9+Es=
X-Gm-Gg: AeBDievYg7WGMRomGD7kiebkXNYaeIRZOQiQ9tFbl/uyE7PgD2LDJh65fiTxDqtVHSh
 oJAuRfGP7OnVxsvBdYllkGJNz7UMAnxm9qFNcamN1WYnjn7gKrihfTKIersFowX986GXH7wQ1aY
 d/L93zUM7OEAaS4bLQWvAIQlo2Iqmx3NzTDuI/2/8K2TL+JT1EiaJB6O3/Wjhk+hvVyD35cXUqG
 DEdoXW8Pip3fFizbMOoRhoZMRb7BwEoecUGBSmINgjGGAbYcJUvlcPzzpSstu40LYVcVPOyCJXz
 WIETAwnEXQ/8DVmPqK/qbDwLtj9qZrGTgycrQQ68p951ztMpFb09ukR3lU8iOli4hl2bl1YZxv6
 bnK4+BR2Tst2AFV/rLEzdvfNWVBDyOzxUUYJOOB6LWQDei7wRF3BOTA55L5iOIE8q968TbDfAe8
 vEGARWFkSXHAAJxAZhAi133DFQmK0uO5GvB+gztDz6vR/2
X-Received: by 2002:a05:6808:181a:b0:479:d605:64a0 with SMTP id
 5614622812f47-47c88c2b0a4mr4739992b6e.0.1777907832131; 
 Mon, 04 May 2026 08:17:12 -0700 (PDT)
Received: from precialexwin ([76.65.67.233]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-47c76935637sm6780489b6e.12.2026.05.04.08.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 08:17:10 -0700 (PDT)
From: Alexandre Ondet <frcomdev@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 May 2026 11:16:57 -0400
Message-ID: <20260504151657.1904-1-frcomdev@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777907832; x=1778512632; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HDoRIvgvo9M9jAT76pxpZ+7BJCLML8wfPS8pzVhadGE=;
 b=TNYlZ52zgoLTxx4IVYaBMnLkTkGaTMFKAtujhXyZLO2q/v7RiAWHd1EYnleClKL3I4
 DvBIv8JcSLXIeLypq3cpzVyZTigOirLFgAKmvmVtBdvUBjDiaVBVETZgFv4TqU76cQSX
 pFzA429aY49SddlTFbDU/fs/dNRXB5uKt7tABCXjhddr4XMDqxOuEMSwKdNm5SXnESZc
 uF6hDJZ+2OQQSSnsZA9lb2iX1iX9VYjbperd4LEC9Usi5+bjejhHcCC58OCFVz9tUpMH
 oQpkiD2nbqN1Z4+Cgfz5xZQhiF8lfIT5QJ+KAd4XUSY/Z5A7vHcKJyz5+E7KhYQQ12ES
 atVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=TNYlZ52z
Subject: [Buildroot] [PATCH 2/2] package/python-fpdf2: add build and runtime
 dependencies
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
Cc: Alexandre Ondet <frcomdev@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add PYTHON_FPDF2_DEPENDENCIES (host-python-fonttools for PEP 517 wheel
build per upstream pyproject.toml, target fonttools/defusedxml/Pillow)
and Kconfig selects for runtime packages.

Signed-off-by: Alexandre Ondet <frcomdev@gmail.com>
---
 package/python-fpdf2/Config.in         | 5 ++++-
 package/python-fpdf2/python-fpdf2.hash | 6 +++---
 package/python-fpdf2/python-fpdf2.mk   | 7 +++++--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/python-fpdf2/Config.in b/package/python-fpdf2/Config.in
index e10e141110..b521d0f056 100644
--- a/package/python-fpdf2/Config.in
+++ b/package/python-fpdf2/Config.in
@@ -1,6 +1,9 @@
 config BR2_PACKAGE_PYTHON_FPDF2
 	bool "python-fpdf2"
+	select BR2_PACKAGE_PYTHON_DEFUSEDXML # runtime
+	select BR2_PACKAGE_PYTHON_FONTTOOLS # PEP 517 build + runtime
+	select BR2_PACKAGE_PYTHON_PILLOW # runtime
 	help
 	  Simple and fast PDF generation for Python.
 
-	  https://pypi.org/project/fpdf2/
\ No newline at end of file
+	  https://pypi.org/project/fpdf2/
diff --git a/package/python-fpdf2/python-fpdf2.hash b/package/python-fpdf2/python-fpdf2.hash
index 2f1cfa6d21..73be730177 100644
--- a/package/python-fpdf2/python-fpdf2.hash
+++ b/package/python-fpdf2/python-fpdf2.hash
@@ -1,3 +1,3 @@
-# From https://pypi.org/pypi/fpdf2/2.8.1/json
-sha256  8866161396f942c8f7e3f022c4afb5e671b4d044745d4ed13c5d2ccc16ae5091  fpdf2-2.8.1.tar.gz
-sha256  f97bc4bb9b7ae8a653941073678b5c7775e8de44a01c3bcc21e7cdc148b90e61  LICENSE
\ No newline at end of file
+# From https://pypi.org/pypi/fpdf2/2.8.7/json
+sha256  7060ccee5a9c7ab0a271fb765a36a23639f83ef8996c34e3d46af0a17ede57f9  fpdf2-2.8.7.tar.gz
+sha256  f97bc4bb9b7ae8a653941073678b5c7775e8de44a01c3bcc21e7cdc148b90e61  LICENSE
diff --git a/package/python-fpdf2/python-fpdf2.mk b/package/python-fpdf2/python-fpdf2.mk
index 97eed64097..ea818b582c 100644
--- a/package/python-fpdf2/python-fpdf2.mk
+++ b/package/python-fpdf2/python-fpdf2.mk
@@ -4,11 +4,14 @@
 #
 ################################################################################
 
-PYTHON_FPDF2_VERSION = 2.8.1
+PYTHON_FPDF2_VERSION = 2.8.7
 PYTHON_FPDF2_SOURCE = fpdf2-$(PYTHON_FPDF2_VERSION).tar.gz
 PYTHON_FPDF2_SITE = https://files.pythonhosted.org/packages/source/f/fpdf2
 PYTHON_FPDF2_SETUP_TYPE = setuptools
 PYTHON_FPDF2_LICENSE = LGPL-3.0+
 PYTHON_FPDF2_LICENSE_FILES = LICENSE
 
-$(eval $(python-package))
\ No newline at end of file
+PYTHON_FPDF2_DEPENDENCIES = \
+	host-python-fonttools python-fonttools python-defusedxml python-pillow
+
+$(eval $(python-package))
-- 
2.53.0.windows.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
