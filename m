Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56956E7718A
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 02:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0429184F81;
	Thu, 19 Dec 2024 02:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6KqXPa0Jh8x2; Thu, 19 Dec 2024 02:16:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1735284F8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1735284F8D;
	Thu, 19 Dec 2024 02:16:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C03EE9
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6121140282
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rdd-lq81Xjc0 for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 02:16:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 48AF14025B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48AF14025B
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48AF14025B
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:16:28 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3a817ee9936so1024675ab.2
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 18:16:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734574587; x=1735179387;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Kcr8NJvuyfUqgXzoGr14XdBRsNKRxl2yNQwm1o4I3U=;
 b=sSjD1Iv3sLRSG2RTkYMJBgYDmYnRIe/sXYzOwB8StILrYL5SViL0Q++BKlHdEZAFmP
 tmaVx/rjS3o2m+3feEmvr63tuTK+Fdb2uCz3VYVcz6BmUH73FawB9+9XuWAIEnQoFOVf
 tH4T60gni1ITcxJg0w8IxvXaoVqVa2ePWDwnRvWX6Kai0yi9zvZ023fpE4rvCfSpu70+
 /DzcmCX1/Ds5UnoFxrynRTjL9nPTrNQurCIaoCumVB9m1IVwNctf0Am+fTYASwPpJf6j
 2avDFp9Zqri8aIdMU0GWkihHNcJDTJ91tcedOVkqDfWerLkSBKv1hvOkIoX/Sma6H+q6
 w0zQ==
X-Gm-Message-State: AOJu0YyenrjDH+zeFVDKuJM2JlaV3w5AkJR3HMj9tOVZTAKQ1WvUSXSE
 U7smaZ9gn6YM5jCk0wf1blRLRVxEWZ98wCFuLETJCM1icUq/uEAbtlFJNvVGiVg=
X-Gm-Gg: ASbGncuzm2gtl22CFIOnI2i+DoNaNpCd/Q/xAR97FniTlgQid5S6k1J0LzJGfOXaPmV
 EEGMmBDJVNc6nDVYf74IIwfDjv+LK8bmf7zDVWX5cL+CHHcSTCAn3JrUAvKb0Iih7isPMuyzjNj
 YudAuE3XsauL+VKUYPOQQ5ltPDu9QujbgoVU0AKtuCSxGec3+v2v9ylCJ7Q3tzsqm2bhTdgKco2
 ik975m044yTXe3Al3mEqNGF5SBS724BFLYb7i5nBfxAVDXrXI5jkce8ttv6usEaooXgXk3Vr7O7
 zS476f6GiIOuAUkAlFFrg57QrEOzzhfVFg==
X-Google-Smtp-Source: AGHT+IGJZ+HVg2FLSKiGw8ygj/3EzN3FX4p9dof5nbuaIvQXlEYU5Qzr4YdIfKJ4KgWQvUSNGKaFnw==
X-Received: by 2002:a05:6e02:1fc9:b0:3a7:a29b:c181 with SMTP id
 e9e14a558f8ab-3bdc174e846mr44905275ab.13.1734574586982; 
 Wed, 18 Dec 2024 18:16:26 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68c223818sm47510173.156.2024.12.18.18.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 18:16:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 19:16:24 -0700
Message-Id: <20241219021624.278382-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734574587; x=1735179387; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8Kcr8NJvuyfUqgXzoGr14XdBRsNKRxl2yNQwm1o4I3U=;
 b=MzBRWHYu6GJtst1mjY0hwm76k4drgEtFBE8E9Fmk9vt8NsjL5JjxeBfEnLSckknm5Y
 snm8ag9lmFvrmfCZZ9Q7r//TEOYFJJCwm8yZsGPRK2DbfGw4sZuTk9soBotCqoNQSIXB
 9qOR2CnjC3BCaHZSkG+DNkPzfBwSX4Xr2RDp+Y3ifNQDoYpvmHLH+dodSG3Vx0801eFd
 dFZ73r6xt+U78o91SeE2e2ABAEflFh+yw57cIbB/q2o8MQlQ/IjPUsWu/kOT+2hNT5c+
 Zf5JLfp9qFsQlwhHZDztvWIwdfF5oRZjyVFY5Vaxtkp3HTh3SwtgtbFH55PIWQ166Jsj
 XBZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MzBRWHYu
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic-core: bump to
 version 2.27.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index 76e05eb20e..d908d5cddc 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  c9a9e5970fbe54f24023635743dfe0f9a0adbebafb467729b674399f06a2d0b5  python-pydantic-core-2.26.0-cargo2.tar.gz
+sha256  d7e62e6331eb4e712b83dad434926440c7c94989e20d693cfae119b8777ce777  python-pydantic-core-2.27.2-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index 865c7d0c84..6a18421eee 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_CORE_VERSION = 2.26.0
+PYTHON_PYDANTIC_CORE_VERSION = 2.27.2
 PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
-PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/98/85/0ac4f8fc632fa1bb3f473e4dfb1cd520ede11179f76a028edfd2ca989ed4
+PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/fc/01/f3e5ac5e7c25833db5eb555f7b7ab24cd6f8c322d3a3ad2d67a952dc0abc
 PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
