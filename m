Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7673EE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 15:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3237C41259;
	Sat, 11 Jan 2025 15:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AKq6wUWIXZFA; Sat, 11 Jan 2025 15:07:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0627841252
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0627841252;
	Sat, 11 Jan 2025 15:07:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 39B6C940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B42960E80
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kRHuajXc_PiS for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 15:07:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2E1FF60B63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E1FF60B63
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E1FF60B63
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:07:11 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3a77bd62fdeso19928795ab.2
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 07:07:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736608030; x=1737212830;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=66DbPhdjp+CpF2q+a6IkAQqbv/jXG9R/nsemmSW64oI=;
 b=eaNZXhQiTl7gxvZYPh3IWoLXP/jbNjsLDP8XXthn7ZFwIODMs1+GDs5WNBLHVIKbAs
 w0aqnJiX8da0v8uvwKRE5bQ4vFJPTnKA/QeCEozfosBFfskb4ZJ7C3OgJ2/AcV6nMPA8
 h8cM5RfkzcIDukdIX4M7iWKnULCDiOehFRjzEUJB+oJgfLh90qvPz07ayVrJTg3q8K/e
 24ObzXucRdj6HJfXZ+tNOMwI7CtFR6/TdsmXauup0WS+vHnoMq93YoicDn+yjP5y5IHX
 1rVizuSn0+aDUid0sm+Nd1H5Mcc5pY25WlEhbQJk566op3tL9XzIwnI48QQuPH4JUsPs
 dPIQ==
X-Gm-Message-State: AOJu0YwZQHe2QvyavuePCmh13xU4kaSUovwJN+RuiGYZi2ucnTUVr3FH
 JLK/an5MoS1dNrSCJWEI/odFllmYzYga79r05urfJCV7BgdxHsy/OWLNDQZoGo4=
X-Gm-Gg: ASbGnctCaD6w25g7CVx4xpBo+knzf/MleBuZpvVpCtZOkSWCymJeH5ic/A7oQrDN/nS
 KhR0qppB9qbDRb/PdG0indATewxYdlzCInkruMM3Gxr7pILTJ+6cXUT7cSLVD8hqhWmlpH+XQKd
 zwYBCVtdNm17+CjeLFJ1I2iMSQT1ta1CAzj3HfOt2CCnrdQThuxvQ1/w4B4HutoYZrVQvKlJnvr
 t9u4HuNsGMptz7DxlJ3nxjAjrimbluXRrkR/++eUpCJGhdckaNURkM95xtdJOveqcdSElCxW/Ix
 emWilfdv4gNLajrRYyZe7fgWVOcQe1E=
X-Google-Smtp-Source: AGHT+IHVS/GvsMvBjDepq/Qq4fHPamQPNqTz8VSkof2FGPbtz+IH26KkI5I5wgroM9DmC4z/TDhKlw==
X-Received: by 2002:a05:6e02:160e:b0:3a7:e732:471b with SMTP id
 e9e14a558f8ab-3ce3a88ace0mr110199135ab.11.1736608029730; 
 Sat, 11 Jan 2025 07:07:09 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3ce4ad93ea8sm15921125ab.9.2025.01.11.07.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 07:07:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 08:07:07 -0700
Message-Id: <20250111150707.2826032-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736608030; x=1737212830; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=66DbPhdjp+CpF2q+a6IkAQqbv/jXG9R/nsemmSW64oI=;
 b=myJ76csB5V7PJqan+3z9jE4QuM9mM5ddfvlbWlNTxSKR6oL+QvmANwtaHrzBezj2fn
 peApo+T9k8v6e7t2ksOabp/+R9Y23RmKNYfIVZjPNnpv+paAvflYcTfWvibt7KT5t9Ul
 N4egG8hq0iarNEJxK0DvLP6cyBa4H4TCHwfO+5UigizPSMztnhV0R/ZqgcWKKOT94JDv
 oIpJjvHz2Cn47kEeJXoeUVv9IppzOuSEmN0ewC3pvralPzndnvFRfl4nYuJBTvgY/7DC
 uOpnuEQRD143heByNYSvsNFBNvoZ6KIrFEgFm1lrAJBLVfOFGHzYW9Ae2rIb5V+Zon4E
 qoNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=myJ76csB
Subject: [Buildroot] [PATCH 1/1] package/python-poetry-core: bump to version
 2.0.0
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
 package/python-poetry-core/python-poetry-core.hash | 4 ++--
 package/python-poetry-core/python-poetry-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-poetry-core/python-poetry-core.hash b/package/python-poetry-core/python-poetry-core.hash
index eaed4dc728..40574723ec 100644
--- a/package/python-poetry-core/python-poetry-core.hash
+++ b/package/python-poetry-core/python-poetry-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/poetry-core/json
-md5  64e2c60933b5647f274151ebb1c968f0  poetry_core-1.9.1.tar.gz
-sha256  7a2d49214bf58b4f17f99d6891d947a9836c9899a67a5069f52d7b67217f61b8  poetry_core-1.9.1.tar.gz
+md5  4e538b8fd6f05bd3be0a29c90d9cfb0b  poetry_core-2.0.0.tar.gz
+sha256  3317a3cc3932011a61114236b2d49883f4fb1403d2f5e97771ac0d077cfa396f  poetry_core-2.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  f1978133782b90f4733bc308ddb19267c3fe04797c88d9ed3bc219032495a982  LICENSE
diff --git a/package/python-poetry-core/python-poetry-core.mk b/package/python-poetry-core/python-poetry-core.mk
index 107ad1bebb..c9e80bc155 100644
--- a/package/python-poetry-core/python-poetry-core.mk
+++ b/package/python-poetry-core/python-poetry-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_POETRY_CORE_VERSION = 1.9.1
+PYTHON_POETRY_CORE_VERSION = 2.0.0
 PYTHON_POETRY_CORE_SOURCE = poetry_core-$(PYTHON_POETRY_CORE_VERSION).tar.gz
-PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/c7/5c/3609519b7d890ced542fe327ea26a7c8ea55ef298c323c46cca2a011c1cb
+PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/db/ec/dbd9cedc8b68309f1f4c0160355890b4f65f51901b31b1831dbf8c93d6c0
 PYTHON_POETRY_CORE_SETUP_TYPE = pep517
 PYTHON_POETRY_CORE_LICENSE = MIT
 PYTHON_POETRY_CORE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
