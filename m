Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87042CAC590
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 23:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3245060781;
	Tue, 17 Sep 2024 23:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4XAcqhfYr3CA; Tue, 17 Sep 2024 23:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2353660782
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2353660782;
	Tue, 17 Sep 2024 23:58:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2639C1BF842
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 23:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 139114041C
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 23:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id siJj3qujCcJH for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 23:58:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC5E74013B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC5E74013B
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC5E74013B
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 23:58:43 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3a07bd770e2so33688375ab.0
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 16:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726617522; x=1727222322;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wq1ddqowYO40/TLHfXTlIK0+GRNZcRPVJGnTeNC2zaA=;
 b=iDJ0y8l/GXJSVSKJmhES+SYL4MHH2E0OkYbEqYihlo+882jSZTj2jvtKF5ZwX283WW
 5k3YRCe3PUQpYXKHM7aTdosWeNuTDhlCk7gaqYcQVt+gVkhnUcujHjUmyziPArZ+/SvC
 nDcXeSeLYS5hJsIpffzOuSUp4GPTnWBi8Y+pNgsZb8joaDwAZ5RM7VF2ik1UerrgVAef
 RuJpzpPi9+3cZLVocqXHwEYCRoKdZVcs7Ti08PYTnpF1GIRU781zKm2sNE1Q1lJixg0s
 FZDihCBZMJ3tEzMx97A7kaLZIKLXNTv7u5fkASVfw1i9rrig1h1lGhL0nbu0Qhhu+DOd
 5U8g==
X-Gm-Message-State: AOJu0Yx2Er4aIEoIEkHVlolPanYzfRxUfUtJx+wh7OF8WrPr4m/SD1Sf
 i4KlXJJwNcoKjcef0WWaiBcNIAUcDRN3loFsLt0dQFAXw2RgtKzB6ocfUzsg
X-Google-Smtp-Source: AGHT+IGASn491IoMbB9w8oNnSvN5oht672T44NumwQ9s6atdQc5uD/y0lGuK6xOKW0EIaAKjbLGa9w==
X-Received: by 2002:a05:6e02:1d16:b0:3a0:9b56:a69 with SMTP id
 e9e14a558f8ab-3a09b560c2cmr107443865ab.7.1726617522069; 
 Tue, 17 Sep 2024 16:58:42 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed33fd1sm2216748173.122.2024.09.17.16.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 16:58:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 17:58:40 -0600
Message-Id: <20240917235840.410166-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726617522; x=1727222322; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wq1ddqowYO40/TLHfXTlIK0+GRNZcRPVJGnTeNC2zaA=;
 b=XfbC+gwpuVXIxSiYAM0UY2uJ9WXq2ASRsqOR5wjmZ4+bUKRTIrOscUS8eFLcELKqst
 YYoxR95sSz52Rz9IjhOZbOdH/uuwtTqQy73Y8AFr6Xt5BrBgY1GplGY1pyOPTdJqjhLQ
 ELnabn9D9vdxOyUWWSGhdTf+nrOiAr5CM1JonP2FIBAQh8SlmAKMBPYm3si9+bmD26n3
 HmASa0nzOOSkXsnyDnWmfg6THB4fHERS7co4nJqlLCaXRFoeHjbYkN+W6IinwPJt+IDI
 oPizAqrXPfgn6VL29FwYAfvELXXAiSlONO7MzmzskWrwHqReAb/5cS1PqG8pynmH84Im
 PNOw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XfbC+gwp
Subject: [Buildroot] [PATCH 1/1] package/python-pysmi: bump to version 1.5.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-jinja2 and python-requests runtime dependencies.

Migrate from setuptools to poetry build backend.

License hash changed due to formatting changes:
https://github.com/lextudio/pysmi/commit/8341b2e13421739cb3f284c1bf725ab56f7af15a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pysmi/Config.in         | 2 ++
 package/python-pysmi/python-pysmi.hash | 6 +++---
 package/python-pysmi/python-pysmi.mk   | 7 ++++---
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/python-pysmi/Config.in b/package/python-pysmi/Config.in
index 2e4453d886..d30e24afd1 100644
--- a/package/python-pysmi/Config.in
+++ b/package/python-pysmi/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PYTHON_PYSMI
 	bool "python-pysmi"
+	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
 	select BR2_PACKAGE_PYTHON_PLY # runtime
+	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
 	help
 	  SNMP SMI/MIB Parser.
 
diff --git a/package/python-pysmi/python-pysmi.hash b/package/python-pysmi/python-pysmi.hash
index bb13f0ef00..729b980032 100644
--- a/package/python-pysmi/python-pysmi.hash
+++ b/package/python-pysmi/python-pysmi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysmi/json
-md5  10a9dd140ad512eed9f37344df83ce9d  pysmi-0.3.4.tar.gz
-sha256  bd15a15020aee8376cab5be264c26330824a8b8164ed0195bd402dd59e4e8f7c  pysmi-0.3.4.tar.gz
+md5  f99b37bb4a31a9cfaedc8b7f269ad7b8  pysmi-1.5.0.tar.gz
+sha256  e42bcd3961de71d58186f7a7fa6adac133701ae74cd19e6376289d89593b0af2  pysmi-1.5.0.tar.gz
 # Locally computed sha256 checksums
-sha256  c43704eafcfa2bc33e56168f2b498c3c34a1d7865855626a52b5af411fc5837f  LICENSE.rst
+sha256  46aa9a218d0f066d2565b826b08872227480e93f561eadf4d994213b08882b8a  LICENSE.rst
diff --git a/package/python-pysmi/python-pysmi.mk b/package/python-pysmi/python-pysmi.mk
index 2aee27b186..f747864def 100644
--- a/package/python-pysmi/python-pysmi.mk
+++ b/package/python-pysmi/python-pysmi.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_PYSMI_VERSION = 0.3.4
+PYTHON_PYSMI_VERSION = 1.5.0
 PYTHON_PYSMI_SOURCE = pysmi-$(PYTHON_PYSMI_VERSION).tar.gz
-PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/52/42/ddaeb06ff551672b17b77f81bc2e26b7c6060b28fe1552226edc6476ce37
-PYTHON_PYSMI_SETUP_TYPE = setuptools
+PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/59/d9/136ca19b66a917377a3b40f390f525eeeb21122dba7562a726bfb2d3629e
+PYTHON_PYSMI_SETUP_TYPE = pep517
 PYTHON_PYSMI_LICENSE = BSD-2-Clause
 PYTHON_PYSMI_LICENSE_FILES = LICENSE.rst
+PYTHON_PYSMI_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
