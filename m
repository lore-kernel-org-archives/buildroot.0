Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08927FF886F
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 17:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEDE7610A9;
	Tue, 28 Apr 2026 17:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJYpd1Paosak; Tue, 28 Apr 2026 17:27:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBEF6610AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777397262;
	bh=pFkVAXUssUua8CVa8N+AYyuupY1rGKVxcSEURuW8HW0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=lw8RDGYuAp1OxpxvinagEa9vDO9NDGuwHgwddA86mHaqeVp2WOMr+0NFtcZakguiW
	 q/gORdOvmgapqTuquGh0bkT7UEchFFUdJYLf2z4lyseoilYzLmSEn7Cv4b0PHVKeZT
	 CAi3H+dGXjJDzc7Qj1PLtls2i99u6LKcc8Bu7Gsu0r7ylmAJrYXB2QekMpVFcWp0tR
	 KLN93c0fxQoswHi4OnQXJn4JMYUJfPgFpSk1FELmWIAHw+Zw+ObYTnywFYx2L2y2R0
	 3sEMU0Jf7X5k7hCsKjWrqJNtnaj+Wt0Iz1ij+TE4pKJy5EqoCF/IKq7xDBrf4npEZ5
	 0qh62k1BdCOow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBEF6610AA;
	Tue, 28 Apr 2026 17:27:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EFDC71B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D561C610AA
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:27:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Yu112QAUnEz for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 17:27:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=frcomdev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F14B6610A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F14B6610A9
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F14B6610A9
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:27:39 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id
 af79cd13be357-8dbbc6c16b2so10372085a.0
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 10:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777397258; x=1778002058;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eZ7kViU7PGV3WnbfP1a/qPp2vdC7kUD+I0kpLaHU7kY=;
 b=qskRzu4fY3ct7go97I01J18w21/yweGywlAkrY7ZlLXQhqB86DF7UfooiZ0xqFWwdI
 pdSvwN2Y9glZKaxnTlGViKDIoQMbvi6C4MRS9n0kTPtIGQGQKauTIsN5bM9VrqmdNsLj
 v540Y1G+SXoM7fc+SJZSk0l7LhBH3s4s8uM7SwaGfuiRPTCKbIID/heCOhwNp6gUpuFj
 RVEIlUXx1j4qNDdIJsK3OePndXuYfQzNIL7olyr8IX8jQwHVdbU9qZjelRkiSws2YtKe
 O9OMpBG6hfkfMrCdSl3fHXmDExWwrsmBLVraR6oHxruFNuiflhOeyRgDx46E7PLrw6a6
 oaMQ==
X-Gm-Message-State: AOJu0Yw/watn1Ulve7NReZcvs9m3uSv5TC+FC0PC/OSXWIqyFBJQ6hGc
 xvCIKcVNCDFtFNjCQmEx28qEJk6JHZva/VU9XFYJitOONvotXdcCbBYUljO+9eBB3akpfHsr
X-Gm-Gg: AeBDieslYw6beEs089Pn1XfGKL2yvInn+c10DIv0zntkzQECSPpVYJPXmjQL2brhOQ5
 TCrDBMmsRg2o0cF2TLdMZUdoFnNTT4rt40D0b9fIjMqorPVKibIzwZfcwR6BIBVbsTKWh3o9iUS
 6xTGRBp+LDqdHyAajZQjIJvUfQQZUlcB71s3ap6wau5XWR190DAAiV9IfJv+pSQZsKWXb2guwom
 ilrn1adJF8ujxHu5uKKfFkC0gfVLOSNzLJU9Im+lm72a6HNHt0FbNocDZxJg3mYLudg5pBu7LOs
 6DcQwSLbwY5Lxrlm4lH9lFsRbhrY6Fx1e0qgyGfnTgGEyE1b5CPhfgXZLIxXkExs1Tfwn6Z7b51
 5yU3D+C+UgsWUNxOZGw+IZURKOB9tcaUXXYhWvnO961PuwnwHiZJZ47RyWywI61d1bq0EQnYire
 z1XhOuyc+FhAM5YrMitgk8wKUXmrUH7wD4l96zhqEbfxzarAlzqVyuX01cGQMZXPle1B6U1CxM0
 mMnm4XRbaRNwtrkgQRM
X-Received: by 2002:a05:620a:19a7:b0:8d8:13c9:55cb with SMTP id
 af79cd13be357-8f7ccfa708amr495530185a.4.1777397258465; 
 Tue, 28 Apr 2026 10:27:38 -0700 (PDT)
Received: from precialexwin
 (bras-base-mtrlpq0313w-grc-01-76-65-67-233.dsl.bell.ca. [76.65.67.233])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8f7c7cd2c0dsm242816185a.26.2026.04.28.10.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 10:27:38 -0700 (PDT)
From: Alexandre Ondet <frcomdev@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 13:27:32 -0400
Message-ID: <20260428172732.2815-1-frcomdev@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777397258; x=1778002058; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eZ7kViU7PGV3WnbfP1a/qPp2vdC7kUD+I0kpLaHU7kY=;
 b=s/I4/njj1IsMlmz6J+5I8gjz3Xo+8zKQwzYWrpBm1v+lBaxxMkqf2LrLH2bjXs5TnK
 y3hzyA0JRLkd1C8x1THXf6ljhxxTEGq/B1VtDrmVhjECMbCcO2Em/HhJz2A0IllkDvtb
 JogGbp8fvxoguiK4YCYnBrRpko/FYMP2elssdseMs1mSFVUrCv8DjbQ7dZT0NBfrul/d
 TtPW55txE4IbacbrHo1cJew/dkKaV98gieke8ThAWQx6wYHTJwaRZABnC1FhmQzcYXBU
 MuQZ64+A2EsrYEpfXKfibQMiyElJ61Dhapjk/1QjmK+FCLjncpQ/Q5C2fkENQYYIwgtv
 jA1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=s/I4/njj
Subject: [Buildroot] [PATCH 11/13] package/python-azure-core: new package
 (1.39.0)
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
 package/Config.in                                |  1 +
 package/python-azure-core/Config.in              | 11 +++++++++++
 package/python-azure-core/python-azure-core.hash |  3 +++
 package/python-azure-core/python-azure-core.mk   | 12 ++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-azure-core/Config.in
 create mode 100644 package/python-azure-core/python-azure-core.hash
 create mode 100644 package/python-azure-core/python-azure-core.mk

diff --git a/package/Config.in b/package/Config.in
index 6513ffc4bb..e41224d086 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1012,6 +1012,7 @@ menu "External python modules"
 	source "package/python-autocommand/Config.in"
 	source "package/python-automat/Config.in"
 	source "package/python-avro/Config.in"
+	source "package/python-azure-core/Config.in"
 	source "package/python-babel/Config.in"
 	source "package/python-backcall/Config.in"
 	source "package/python-base58/Config.in"
diff --git a/package/python-azure-core/Config.in b/package/python-azure-core/Config.in
new file mode 100644
index 0000000000..0312962381
--- /dev/null
+++ b/package/python-azure-core/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_AZURE_CORE
+    bool "python-azure-core"
+    select BR2_PACKAGE_PYTHON_PIP
+    select BR2_PACKAGE_PYTHON_REQUESTS
+    select BR2_PACKAGE_PYTHON_SIX
+    select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS
+    help
+      Microsoft Azure Core library for Python.
+
+      https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/core/azure-core
+
diff --git a/package/python-azure-core/python-azure-core.hash b/package/python-azure-core/python-azure-core.hash
new file mode 100644
index 0000000000..1d82d567b6
--- /dev/null
+++ b/package/python-azure-core/python-azure-core.hash
@@ -0,0 +1,3 @@
+# From https://pypi.org/pypi/azure-core/json
+sha256  8a90a562998dd44ce84597590fff6249701b98c0e8797c95fcdd695b54c35d74  azure_core-1.39.0.tar.gz
+sha256  7c77a44a8acd9b41fdc209864a8016b3d430b5d0e09309818d5b7444336df744  LICENSE
diff --git a/package/python-azure-core/python-azure-core.mk b/package/python-azure-core/python-azure-core.mk
new file mode 100644
index 0000000000..b821e367d8
--- /dev/null
+++ b/package/python-azure-core/python-azure-core.mk
@@ -0,0 +1,12 @@
+PYTHON_AZURE_CORE_VERSION = 1.39.0
+PYTHON_AZURE_CORE_SOURCE = azure_core-$(PYTHON_AZURE_CORE_VERSION).tar.gz
+PYTHON_AZURE_CORE_SITE = https://files.pythonhosted.org/packages/34/83/bbde3faa84ddcb8eb0eca4b3ffb3221252281db4ce351300fe248c5c70b1
+PYTHON_AZURE_CORE_SETUP_TYPE = setuptools
+PYTHON_AZURE_CORE_LICENSE = MIT
+PYTHON_AZURE_CORE_LICENSE_FILES = LICENSE
+
+# Buildroot dependencies
+PYTHON_AZURE_CORE_DEPENDENCIES = python-requests python-six python-typing-extensions
+
+$(eval $(python-package))
+
-- 
2.53.0.windows.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
