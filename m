Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF0AFF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 17:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84BBE61083;
	Tue, 28 Apr 2026 17:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z5Z8x9BeZCcY; Tue, 28 Apr 2026 17:21:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A303861088
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777396887;
	bh=jZ9rL+UYG54vk4hZiMD58iNKA3Fv/w12tfoXhNzA/Ac=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=HZJUxTvpBglFsAa1EgCvw+cSwKAobQsfEvIHtHMxaiVG1wM1Quhq7zIvLKDhfXf+D
	 AZ9UHoFEAGdtYW/IdSPFReHduQddiiokmzNTyR9W13Biw1/2aIk/eaX5AUxH9Zfcd4
	 NsRTFDYeDx3uECWgBheX/12thdFzvYHt3CN/8vsTM1ddevR9KYmrxnH/mqSlg3hK3F
	 GPXjvGDbVp9+iXqIXp6Wq7NL02bRWanTMvv9HCCIdTEZXlrbaJjs+8sPPwk9XbC1kf
	 2UAItkNEk+odixYWk1GPeEc8DrZDBZ13fjiydtDTAZ2T64qz2r4PHPJRAwz7nosEBb
	 TKcai8JQ9gJhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A303861088;
	Tue, 28 Apr 2026 17:21:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 71F5B231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5839540164
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tPmfBHWXaB4x for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 17:21:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=frcomdev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3EC0C40745
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EC0C40745
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3EC0C40745
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:21:25 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id
 af79cd13be357-8f15e900586so263118985a.1
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 10:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777396884; x=1778001684;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+iX/w/fEPqM8hKSbAzLo1IfZX7MJ5hy4K9L6As+AMjw=;
 b=PpBjxuvkSdZghuGOJRoyfMeQPaqqG3shK5hoRz22hm042Zjc3/ET3N1oR1UxO+z2Pi
 ic3vVOMjOGpJkyB5iC/MaVwW5kVPk4wBFpN9pjxEjuD6hB2OsYbZ2m/eQuieFtPFw8nf
 XbKFHxWopbbp+t8U0fkq0D63zp/MeWW91Tuo5tESugnh8tKyPqBKf8asinZc3IP7wBbP
 FFX8j+D/WbD93dYM1DDbT8JIP+it+18B/CwdrwjzKBn8WmVLKrjbPJaL6OvksvNxkSt7
 s8WOgmu69m9fEQe2xoSSIJXgnUmn+F5ntRMda2+T31JZiv1AUqCo1FRO2tiyuz1XuDeb
 sgpA==
X-Gm-Message-State: AOJu0YzruFL/ULUMySKZDgYkjVsYFFEVvKZgmrC0RazxPX51DA1rNn7Q
 inMpPCT+PwuoAE7+d5235AVu1FZZmVRdb/YXE97rMQNWjEWoZS19gDxZwC6vmJPbcBPcHsIy
X-Gm-Gg: AeBDiet5wQngP8iI5rI2EGgqObJ0uCXIpvWTXrBGT4b8fnjaNGJSSm/M8s+a7QoQkOK
 ShEmdvO0fcK5YplR9QHEkib4WcFusM4Zj/0uFKt+AqCv06PxzPtXwLZzpTNXZxW4Gz8nauzeBfx
 MMttn4gN+M9E7uNH2SLlrbIMJwWEJNCybUFufvzNbjttBr6nU7kEe8jxExW8LL5bR77rqK13M7j
 blEvTLetg3IJjIjKUaiUAG0NEUtVZJMXrzhsKdpwn9BEtdSoBwvvjE10ziKOlG6+O0rbVxAcG5s
 NK3Bpk+KyntBhWdmEQ/D/3YwiOTNQrEn0Jejx+stKHv/mJ34lnXxWuoCZf4QWSVm61NmFgMra+s
 rZzlXcEU7KoYL5/YYnCRnAsdEtZgOwKrl9rGSBq3MXcQ0JWfYarNwHEgVbtcx+ETAuTJr5RA0v7
 UKlbqG68cq0jH/hGxZkOtK6nca45II2MODUjXaEMjlz9rOQA9yKFipvXg7jp9fBOOr1gmOegIsm
 H9XRwL59HHCanZni7LG
X-Received: by 2002:a05:620a:489b:b0:8ef:3312:a150 with SMTP id
 af79cd13be357-8f8f3f03bbamr72784785a.17.1777396883632; 
 Tue, 28 Apr 2026 10:21:23 -0700 (PDT)
Received: from precialexwin
 (bras-base-mtrlpq0313w-grc-01-76-65-67-233.dsl.bell.ca. [76.65.67.233])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8f7c8a9a92csm225191785a.45.2026.04.28.10.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 10:21:23 -0700 (PDT)
From: Alexandre Ondet <frcomdev@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 13:21:19 -0400
Message-ID: <20260428172119.2746-1-frcomdev@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777396884; x=1778001684; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+iX/w/fEPqM8hKSbAzLo1IfZX7MJ5hy4K9L6As+AMjw=;
 b=sMdNhpOdQ/o1IsRnz4I8vzyj146axiRNvF+waWiX+ObnfEtmsB8TGRfN0/I65RlHTp
 2WuCiuwwu5LxhFCGaHuTNUDra2uSFwzZaaRGb/H0mr0JBU/m5sL+F0TFBpk+G17pOFbk
 Z2WfuLes1jRiDSBT94+QKBYSMe9Hs2ZceLuLHfTyMpCvFG7fSjDAxIfN7Mp2uAX/LK3L
 J+3fco1WZPrphC4VFyOSfoIPQH4VQtdV67UGzCiTANqsEeitXKytIhwE2RLpPtDler6i
 02HEhTERdmKKnHlHOVahJUim9+RUGhBOgGcNFsvkjFMCVxjXp6IlcJXVGd36/I/g1CQi
 obTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=sMdNhpOd
Subject: [Buildroot] [PATCH 09/13] package/python-pypdf2: new package
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
 package/Config.in                        |  1 +
 package/python-pypdf2/Config.in          |  6 ++++++
 package/python-pypdf2/python-pypdf2.hash |  3 +++
 package/python-pypdf2/python-pypdf2.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/python-pypdf2/Config.in
 create mode 100644 package/python-pypdf2/python-pypdf2.hash
 create mode 100644 package/python-pypdf2/python-pypdf2.mk

diff --git a/package/Config.in b/package/Config.in
index 763ca02a06..3c89a2a480 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1342,6 +1342,7 @@ menu "External python modules"
 	source "package/python-pyopenssl/Config.in"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pyparted/Config.in"
+	source "package/python-pypdf2/Config.in"
 	source "package/python-pyphen/Config.in"
 	source "package/python-pypika-tortoise/Config.in"
 	source "package/python-pypng/Config.in"
diff --git a/package/python-pypdf2/Config.in b/package/python-pypdf2/Config.in
new file mode 100644
index 0000000000..9bf026aba3
--- /dev/null
+++ b/package/python-pypdf2/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYPDF2
+	bool "python-pypdf2"
+	help
+	  A pure Python PDF library capable of splitting, merging, and editing PDFs.
+
+	  https://pypi.org/project/PyPDF2/
\ No newline at end of file
diff --git a/package/python-pypdf2/python-pypdf2.hash b/package/python-pypdf2/python-pypdf2.hash
new file mode 100644
index 0000000000..c91ff45ad1
--- /dev/null
+++ b/package/python-pypdf2/python-pypdf2.hash
@@ -0,0 +1,3 @@
+# From https://pypi.org/pypi/pypdf2/3.0.1/json
+sha256  a74408f69ba6271f71b9352ef4ed03dc53a31aa404d29b5d31f53bfecfee1440  PyPDF2-3.0.1.tar.gz
+sha256  a97ac230e5f33ef10a5367a850eb01f91f1a0b064e34742c7794d2294557f524  LICENSE
\ No newline at end of file
diff --git a/package/python-pypdf2/python-pypdf2.mk b/package/python-pypdf2/python-pypdf2.mk
new file mode 100644
index 0000000000..45065e24ab
--- /dev/null
+++ b/package/python-pypdf2/python-pypdf2.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pypdf2
+#
+################################################################################
+
+PYTHON_PYPDF2_VERSION = 3.0.1
+PYTHON_PYPDF2_SOURCE = PyPDF2-$(PYTHON_PYPDF2_VERSION).tar.gz
+PYTHON_PYPDF2_SITE = https://files.pythonhosted.org/packages/source/p/pypdf2
+PYTHON_PYPDF2_SETUP_TYPE = setuptools
+PYTHON_PYPDF2_LICENSE = BSD-3-Clause
+PYTHON_PYPDF2_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
\ No newline at end of file
-- 
2.53.0.windows.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
