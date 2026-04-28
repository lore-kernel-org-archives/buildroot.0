Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF351FF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 17:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A3BA60EFA;
	Tue, 28 Apr 2026 17:21:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H41wf6C8JAFK; Tue, 28 Apr 2026 17:21:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 916CD6107C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777396861;
	bh=bF6giy8vzmPboaNC2lvpE0zByneFLyVZFrTQmkZSRMU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=MFwi+bW6TVRXX9/Bli1VkT6I2t6dqQVn1KHR0WPQF+QDE26NfSV9VL7ES69VzJs3J
	 fnlMrlVqt/TGTxTnPvjN/RDLA/DQn+/8aKTjbYSQyHAt/mW8wpXayrCZyMrGvk5EqR
	 ZycH0LZ9nafUPGi85kGwd4i/8JA9Ki1idrKML+aJLCkflzTiGSqGqJqgQYXCl21wlW
	 Q+nC0IjApZd4IW2/Ety66m4bo0s4boZDWKdOv9NGgTnfw7hmBMPvsIKRe4QXDddfU5
	 xPAAjvZNc35hwCQJzhuSFRMXq8vxoiYDEhiBoaBYAIMWeaxoQOHPU1m/EVvOTF2leW
	 mkvMbGKPiy+Jw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 916CD6107C;
	Tue, 28 Apr 2026 17:21:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6ECA01B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 613B783C50
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:21:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2NeJzxtnL7Il for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 17:20:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=frcomdev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 65FDD83C4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65FDD83C4F
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65FDD83C4F
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:20:59 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id
 af79cd13be357-8c70b5594f4so5970085a.1
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 10:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777396858; x=1778001658;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KFVp5+p+8JdwMBCwLBgy4Lcp8mCdJtHPoUF8sJebsqU=;
 b=iqUrHHQN6lhys42qytOVAmGzNQvyTQNYEjzQcphTh2TFZ1eMEd60eooA4r7cNVtukX
 9opCtGDcOp6iNpF9XVRf4VfaPVDuZwwIkTpH6j2eUCo/dwOYPmsOZ4eSTrxRy4CiU0+/
 JakFDjUU7YeTAAI1ZlrVQDlJOMZHSUhQjpgZCZlyTASjGWA4lWkAesfCXvGegWNIn4hH
 hEC68i64uGpreFRbx8HBvDixxc2O45kZtoBEYsYIP+EEOwzfERD3IHOXNEVxYqEkHEkk
 Jd2PR/OpOmGBae7lI89zdgLxargXIRwFl/tQDVTE/Ke9pCmRW5yhGQzxfP2gP2raaf/s
 tL2g==
X-Gm-Message-State: AOJu0YyuWScwX3h3ZSVpNklqHXO2ZHw4CS6rvpS9l1AW2Xj8Iiphi2br
 wRLJCvO3Z0DWIxPJArMT+jjczj5t3p8B5LHaK3mUtKorlXzZcpGQTkhiw2ElKQs7AtdXBppH
X-Gm-Gg: AeBDievQT2CuwbusS+D+YFhRWIGGvjZbV+XpY8EjrY7izwWKCAB6m8KuKltufu78wDL
 x5VSrC8FmwFGcCkL4lL62eF6dDvjBZTZBrFvvbd/t+wG1T+eOQSKgNmRa5FJtlnN1Tix51t3Efz
 3Aa+sILYMwpQpTJ89P+G2deFl98WLkHNn9yAoSuW0/MipQukOLgy3wKRVbleTARnlNilGuCPN7m
 3T6c9hcaPiVi+CA25vQhCfqjTO3ITHPVkrJUjvPNehL4zxcxucYA8iTnTlSlD/dPKR7+z9jUXg5
 73ehpm0ept5hF6DMU3a0Z5FzRaLgd3BG8wTpzw+Gpsg1SsI5WzV8BcPVOXveybeQFeyX6+zwEhM
 agnSVlxwUltxCfQpviFrJzy3im3xF6nInVhIYeZAhnJ4Ib7dyJ3QsxbZX/m3XKkj8jPWSV3nU8Y
 OO2TKiIWTg6ULi1OcldCpRKJ6ijQbTPUr9NGuWS4GkeYl52IjjAOdVbgNLfGKtPnYfqhUcf61Fd
 luS/8KqgaxK9RSG2BcO
X-Received: by 2002:a05:620a:4509:b0:8f8:eb90:b235 with SMTP id
 af79cd13be357-8f8eb90b3b0mr86950085a.26.1777396857953; 
 Tue, 28 Apr 2026 10:20:57 -0700 (PDT)
Received: from precialexwin
 (bras-base-mtrlpq0313w-grc-01-76-65-67-233.dsl.bell.ca. [76.65.67.233])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8f7c48c79b5sm248835185a.8.2026.04.28.10.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 10:20:57 -0700 (PDT)
From: Alexandre Ondet <frcomdev@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 13:20:52 -0400
Message-ID: <20260428172052.2721-1-frcomdev@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777396858; x=1778001658; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KFVp5+p+8JdwMBCwLBgy4Lcp8mCdJtHPoUF8sJebsqU=;
 b=dTkkZnhVk7hKXDV7vJEJbJ1/yyEq8XPCP+JVEX06MsmysZRM3Oj7OGOBTw+LnyzRk2
 SfQVOyp1ngAYjqKXB230+0k8qFvxsVoOBmcNnGnD/OTjLXffIKTOT4Mo0FdQUCybv8ik
 wBKeIcg//H4Dk12K7qaxkdNMMFXxBj1cY6UxCJnWUvpDE3kMArnTp7cKf5YKv29aJKI6
 eCrV0CpeAgsF06cQo90ThMTCvTE3cnagMFxNhVCyuv0D0LrpOjl3Gq5O/h2hGL3SNohG
 DgLON2cnWXRgDqPwmw7JxNwa2mZE5HCeA0LME/PnK2ZPcsTdxPqpCmYzHMqSMw+Y+Y3m
 3SWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=dTkkZnhV
Subject: [Buildroot] [PATCH 08/13] package/python-opencanary: new package
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

Signed-off-by: Alexandre Ondet <frcomdev@gmail.com>
---
 package/Config.in                             |  1 +
 package/python-opencanary/Config.in           | 22 +++++++++++++
 .../python-opencanary/python-opencanary.hash  |  3 ++
 .../python-opencanary/python-opencanary.mk    | 32 +++++++++++++++++++
 4 files changed, 58 insertions(+)
 create mode 100644 package/python-opencanary/Config.in
 create mode 100644 package/python-opencanary/python-opencanary.hash
 create mode 100644 package/python-opencanary/python-opencanary.mk

diff --git a/package/Config.in b/package/Config.in
index 882459cefc..763ca02a06 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1266,6 +1266,7 @@ menu "External python modules"
 	source "package/python-ntlmlib/Config.in"
 	source "package/python-oauthlib/Config.in"
 	source "package/python-opcua-asyncio/Config.in"
+	source "package/python-opencanary/Config.in"
 	source "package/python-orjson/Config.in"
 	source "package/python-outcome/Config.in"
 	source "package/python-packaging/Config.in"
diff --git a/package/python-opencanary/Config.in b/package/python-opencanary/Config.in
new file mode 100644
index 0000000000..9d7d99ab6f
--- /dev/null
+++ b/package/python-opencanary/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_PYTHON_OPENCANARY
+	bool "python-opencanary"
+	select BR2_PACKAGE_PYTHON_BCRYPT
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
+	select BR2_PACKAGE_PYTHON_FPDF2   # voir note ci-dessous
+	select BR2_PACKAGE_PYTHON_HPFEEDS
+	select BR2_PACKAGE_PYTHON_JINJA2
+	select BR2_PACKAGE_PYTHON_NTLMLIB
+	select BR2_PACKAGE_PYTHON_PASSLIB
+	select BR2_PACKAGE_PYTHON_PYASN1
+	select BR2_PACKAGE_PYTHON_PYOPENSSL
+	select BR2_PACKAGE_PYTHON_PYPDF2
+	select BR2_PACKAGE_PYTHON_REQUESTS
+	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
+	select BR2_PACKAGE_PYTHON_SIMPLEJSON
+	select BR2_PACKAGE_PYTHON_TWISTED
+	select BR2_PACKAGE_PYTHON_URLLIB3
+	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE
+	help
+	  OpenCanary is a lightweight honeypot daemon written in Python.
+
+	  https://github.com/thinkst/opencanary
\ No newline at end of file
diff --git a/package/python-opencanary/python-opencanary.hash b/package/python-opencanary/python-opencanary.hash
new file mode 100644
index 0000000000..1e7020098c
--- /dev/null
+++ b/package/python-opencanary/python-opencanary.hash
@@ -0,0 +1,3 @@
+# From https://pypi.org/pypi/opencanary/0.9.7/json
+sha256  b10df22fa3f3b9300667811d2557dc89a8ba97c42524f8c8da076a7b7ffbe22e  opencanary-0.9.7.tar.gz
+sha256  4009cd65e5d4a0b1926c70c14a66d656ed1a05964879c668c8e868f8360c195a  LICENSE
\ No newline at end of file
diff --git a/package/python-opencanary/python-opencanary.mk b/package/python-opencanary/python-opencanary.mk
new file mode 100644
index 0000000000..b1696fee35
--- /dev/null
+++ b/package/python-opencanary/python-opencanary.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# python-opencanary
+#
+################################################################################
+
+PYTHON_OPENCANARY_VERSION = 0.9.7
+PYTHON_OPENCANARY_SOURCE = opencanary-$(PYTHON_OPENCANARY_VERSION).tar.gz
+PYTHON_OPENCANARY_SITE = https://files.pythonhosted.org/packages/source/o/opencanary
+PYTHON_OPENCANARY_SETUP_TYPE = setuptools
+PYTHON_OPENCANARY_LICENSE = BSD-2-Clause
+PYTHON_OPENCANARY_LICENSE_FILES = LICENSE
+
+PYTHON_OPENCANARY_DEPENDENCIES = \
+	python-bcrypt \
+	python-cryptography \
+	python-fpdf2 \
+	python-hpfeeds \
+	python-jinja2 \
+	python-ntlmlib \
+	python-passlib \
+	python-pyasn1 \
+	python-pyopenssl \
+	python-pypdf2 \
+	python-requests \
+	python-service-identity \
+	python-simplejson \
+	python-twisted \
+	python-urllib3 \
+	python-zope-interface
+
+$(eval $(python-package))
\ No newline at end of file
-- 
2.53.0.windows.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
