Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42575EE57C5
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 21:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F01C380DD8;
	Wed, 31 Dec 2025 21:31:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJOUMASauaJY; Wed, 31 Dec 2025 21:31:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18D4180DE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767216708;
	bh=HgM8u59jjPe2FS5xD5UkASIGpau9E7awWw5s7jGCo1g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=VhuG5FeerQ/n050x79ckCzGgfOIPI8mnIPp2YYpe/CHM3R/QXtStuI3B0uF+z3IFu
	 2E0JTe9fnkcCLyHZBQyp/+GO0pcfrSp61C1KZil94Lj+RQ9Q+W/2+BKppoB6WdZdEF
	 WofXxjb7v/ZoOPCyBUHzstbCFX2mPdrbFwlWmQnwd6DT+C9Fto1XQGg0TSb/2vaKFL
	 bL+2Rk9GQymXh4/i2TOU9NCEqsLeP0DH2Th9stnJ+UPahlHPp9NS7/XqaZk2XYtDGy
	 lSo2nXrME4Hto/Jzg7f2j5NuJrMqkMbWLCLOTOez0DXNdT2LA3EP2eBwRX2rnRU0M8
	 4pQPmF935CPHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18D4180DE6;
	Wed, 31 Dec 2025 21:31:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F19C249
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 21:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45F3780B9E
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 21:31:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V6jkmcYqIcps for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 21:31:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c30; helo=mail-oo1-xc30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 739B480B97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 739B480B97
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 739B480B97
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 21:31:45 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-65745a436f7so6582373eaf.3
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 13:31:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767216704; x=1767821504;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uVMvMPF1uNr/7ULy/xif33lKSA80SqwyeoomQ13C+Ig=;
 b=eOKTuEiuTdnR4yHnWxNJRoz1Y+Y5YK6WG2xFqQMeAbfLGoOZhz0JDnY2MklzxBkiCa
 LefeCWdYc/6B/ITddu+7yN2Dvr+1UrA2k3grSsnOvkPB8hoPprdXw9EV38OVrUdThp0S
 ++1QrKgxv3FhOUYQhV1ZGJPAJmC7FNM9GROUNUOwv2qw9x0+H7HC78FiA40+bdX7OXo+
 Qx+jG1mL5YX7JZO/wANw0F1KRMF6NYuQXQ5kvL1uQAdXmN2PWOJMX7ne7gIemClsZ4QX
 VxMo3QVrXGe8JMb0WWHcwb2YveM8ZmViiZdZiU24QxPPUjC9m0yqOHmxM8IkvysoB2wc
 h22w==
X-Gm-Message-State: AOJu0YwCxU+sMSzxp9AJMVya5NJSnqC772Kg9BP1v8KOXEdFz5Jh0SES
 tHK5xK8efN0EM6/SnWyfZHtEplCpSC01cVtwqA5CDkaNqighdbQA+8Z1O9mOxURR4tI=
X-Gm-Gg: AY/fxX6F6FQxvTRWuj2603PDRJyG4nv3xrVSmmv96oIFx2hD1lR4424Cm9+gPOFumU6
 S0FFLH7Yc1IT8DspyCnKXV7oPRVKm9mogRSnW6/AbYjUQoNIcFs/4iFPD3opsqsl3x4cDoiNnMU
 FBuGBPa/PigkAzdRPPYwdN664Zux1yfyMLJ/xwBmBpbvdMkbv22CNBWXBtxLfc54AsGFEDGJbid
 KARByA65iA+rGaI5eWkqF03zzht41VlkdOMYzT9ZRst4mNqZJp2J5q8uvRJRi6lB8MfoJeirctQ
 qEc0ExdM+jZdy7E64VW7aHTB3v+3BD5fERjSTVdG6te2/kGtYYzqLgNWC+Tcp/8zO6/WZ/into1
 55E3qxrvsepAvSZiiHci/a+XGYsvuEn6RexBo5FTrXK88ZmvdWoY2NenGD08IHp/fe0UiwJftPP
 FLA+QvdIKCINvpIH6bQpOgjUrHoMKJdGnH6cTTtDzphLo0ZQW+mQLRYtm7jXCnoQNRIcEpyXall
 sNRnVPxai9R7j3NZZwrWweMtOlAogBHZTsncF/LmenjvdVEStQQn6g=
X-Google-Smtp-Source: AGHT+IFl39VPMhZBTmy5s7Gem8VW1kb0iHjFAKkrAJeAUSosyxolq+9L+JP8u89Ev7V8RnWWfzT5ng==
X-Received: by 2002:a05:6820:5295:b0:65f:1038:1316 with SMTP id
 006d021491bc7-65f10381427mr386244eaf.62.1767216704162; 
 Wed, 31 Dec 2025 13:31:44 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-65d0f69b9b0sm21917698eaf.11.2025.12.31.13.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 13:31:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 14:31:40 -0700
Message-ID: <20251231213140.5820-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767216704; x=1767821504; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uVMvMPF1uNr/7ULy/xif33lKSA80SqwyeoomQ13C+Ig=;
 b=BN2nW1eh/66hGRU15DFlL2ar+MkW6ODNr89KAcgQYeVOVmu5NMPoKJ9mls78lV5dxo
 iCUvdNusDg0nIE0mLrsSgjASKUBNM8xYxeEuRPE98FKqe1jwp8pThcbnOGfQO60GyB2X
 mqfO0nFuYVAcyEwBonsxlwwtOdkwJT1V4MezmvmrgbXA9u2uDK2O2stApJDn6gbGee2c
 lI1tnYN7b+LBKJZUnAvUKEwmvqd/z9BQq2+8s5zXzSSVI8qmDSaO4OEYspGvUtiI06Gu
 QxMLFI8lFinptawtxBEsYLqOM9+wwVUgvRkepiern4ZkV4lTYAldk2D59jKAu788NW6c
 mxLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BN2nW1eh
Subject: [Buildroot] [PATCH 1/1] package/python-pysnmp: bump to version
 7.1.22
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

Migrate from poetry to flit build backend.

License hash changed due to year update:
https://github.com/lextudio/pysnmp/commit/3a8cbfe6d22f7d159ce128058bc5d901a675bf6d

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pysnmp/python-pysnmp.hash | 6 +++---
 package/python-pysnmp/python-pysnmp.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pysnmp/python-pysnmp.hash b/package/python-pysnmp/python-pysnmp.hash
index cae02270b3..6019925c4b 100644
--- a/package/python-pysnmp/python-pysnmp.hash
+++ b/package/python-pysnmp/python-pysnmp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysnmp/json
-md5  a6c2189839202b7ab76144743d7824b8  pysnmp-7.1.16.tar.gz
-sha256  51581c70e410e456eb3faa24c42a094c82acfa961d16ad659b57c5818379dfcb  pysnmp-7.1.16.tar.gz
+md5  33203585898e346a35bd49c2344deb5b  pysnmp-7.1.22.tar.gz
+sha256  37ac595c7f0c1c00514505939b4dcf5b4fd5a9ffe51b0349f60bb640c11b0f77  pysnmp-7.1.22.tar.gz
 # Locally computed sha256 checksums
-sha256  4954453957449b5e6f797d070f4d91024dceb3e056c99d72350795b71db0fc70  LICENSE.rst
+sha256  1c372007e7b71c1773a8ccc4fa840061822cb8053000f232a51da830b9d6d287  LICENSE.rst
diff --git a/package/python-pysnmp/python-pysnmp.mk b/package/python-pysnmp/python-pysnmp.mk
index a04c3e4be7..e82ba2bdcb 100644
--- a/package/python-pysnmp/python-pysnmp.mk
+++ b/package/python-pysnmp/python-pysnmp.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PYSNMP_VERSION = 7.1.16
+PYTHON_PYSNMP_VERSION = 7.1.22
 PYTHON_PYSNMP_SOURCE = pysnmp-$(PYTHON_PYSNMP_VERSION).tar.gz
-PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/a2/b1/c94dac49a002eed96e2cb7aeb1d148b1c98826e5cd1f6e8eebb4a20f8d49
-PYTHON_PYSNMP_SETUP_TYPE = poetry
+PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/c5/f7/63a4833b675f3f85296d85f2fddaed93d76799f29a813a2d5ca2bbe7fc50
+PYTHON_PYSNMP_SETUP_TYPE = flit
 PYTHON_PYSNMP_LICENSE = BSD-2-Clause
 PYTHON_PYSNMP_LICENSE_FILES = LICENSE.rst
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
