Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B04FA3755
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2F14809D1;
	Fri,  2 Jan 2026 22:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pTy3dHkV7yvg; Fri,  2 Jan 2026 22:36:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C9C58098A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767393360;
	bh=iR/MJGekt7gPjdJQG2C2zTX7afukZesQyQeRnCtUIEw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=i3DUPYl0DRxTRaHAeGAQgCFyrO4jxRkyYWBWmZX1+O3LXCGQlgHlTq9ot7ZcClvF/
	 +wAZWV4KiQkwyhQJXwNPDtWx+rYvOW/Y1ongwfzmkPIjzt4fhA9SPWulzbraI7dVZO
	 FMkOzwfZ3XTf6T0B6JPM2zYoAjBxpMZUMtlpKoQiZQ4fropq5/N+GDDll7qcmjKll1
	 yZ8sayhus0fIx+t+yRH2yjiQL7KoW8miKDF7z4t6oKInEtS77BaJmoV/91z3uyC+6q
	 vkkSJy5VI5amtyqOYixxtVaRaJ9G/OafxzbcTF/1FQxh8hG7Q/qkimA6L5JeHEYIHe
	 6OXm4i+21dCZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C9C58098A;
	Fri,  2 Jan 2026 22:36:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC5DC19D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA6EF8098A
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tsTWdo0XrYhT for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:35:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D3398097B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D3398097B
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D3398097B
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:35:57 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-7cae2330765so210884a34.0
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 14:35:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767393356; x=1767998156;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ObgTNlvcTY1hvHaORu/s4cbw6a8pnW+glHuEFCfWYQw=;
 b=ZX7n/21DhpI8PByVMnr1mQqBIUbe430W1NEHiJo+kvGviKuPaj/zMh7ZV3Lw9KUFXD
 nDXTyXG4qVmzP3WMwdvhGdNRj24T1FfShPq0jcW4NSd3wDAvERcVF0aHhSG4xLPj+k9Q
 Y2Et92Ks7vCgUsJN9UbB039LI6G3IECVGSzEMZPdyZPEhcLj5W4WCtloU55UCopEtMLP
 TxU1qH42dqEeeGqVpCLkX84vbvgAQOy1R0FbkGfTPS63PZfPXQQxfCWMScu6ddPaQQy8
 uS2YPMUi3hchRVChlvfYTRJi86gx5jIj6jOKUnTu/wh1gb1BvJSiFuhv4OC370c3+pNq
 C3rw==
X-Gm-Message-State: AOJu0YwZOcSwFvztWibqWf1oYcIRnmK0PrgPd0PrfQTBmbS4E3sJn6BV
 bWO1WSE8zVl3u67emhqRC5SrOfe14UJ8X7UtAc78MwndF5SH6+2G2gBjq7c/xJSbUHQ=
X-Gm-Gg: AY/fxX6OGU0ktGicOfZk/+lK/R2GSehrfT+eb+F+agQ0QGfDVbblWT4bRmzKONCNhkS
 j00DeeCcEhAyvujGsnEpTK7outgC+vAoCxGs4PZ7rpVxKH1utA+ilgKdAjnFz39OR/4AW2EOqpV
 9SVV9IhFK0sB1EHB2bcqjEPCfU1wTdy2Xh+EabxaUrzNjpW/cgF50bbAXLPcJ6lidLkLCThyYAY
 f3S3mi6evSDBnSsbiiHMD1czYXOej3Vbg7CU9VE62AwXemry2vjh9lSdfUfPF/wGE8mWOj28Ojn
 4anE4qM52vDCIkQotkL/x3GXbHqUOvKgiLo0DEfxxlgT78Qnv80TT4fjua7lDhTFdmvTEvBPNpm
 quvDZIyEF0u+M3eCHvvEoAZbqjwJmO3p47xJQNrkH+IZqLXzrAUO0tyYhwmLx4RXiHnF06oxpFG
 wjD9mQK39XLuFVy19iVOBLxPcouE2p8FE91VPPPxjNGev0u5jAOpHKK4Xkb3LVFFWzjf1/GRqgU
 m5Axs/kHzlGgDgXItrDl9TXF0IOzCpOtuuPDqik7j4hSN8z5+0e7nnqRbNpAxU64g==
X-Google-Smtp-Source: AGHT+IHqJ7tRvqNwGbPFLJl4jQgXE91Jr3xhlHd5G0hK1C/9X17rjNaRgl+sPXeMZInxNSqrKT1Rhw==
X-Received: by 2002:a05:6830:2b09:b0:7c7:6a56:cfb5 with SMTP id
 46e09a7af769-7ce2bfe49bamr629599a34.11.1767393356591; 
 Fri, 02 Jan 2026 14:35:56 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc667ebea3sm28914891a34.22.2026.01.02.14.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 14:35:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 15:35:54 -0700
Message-ID: <20260102223554.481649-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767393356; x=1767998156; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ObgTNlvcTY1hvHaORu/s4cbw6a8pnW+glHuEFCfWYQw=;
 b=myT/EJF4YoV+bSOv/8TjqMXz4g/rGKg7DutJxZIxWT5n9j78bfK5xAGXvFnkzmYzut
 p7Driq4IBp4K9Ez4ZX8vLl62yLxLjD/Dh3wtc7cR9lOqrVOSYGORcPGjddgrE/a66mdV
 cKX7btdODnZ64PysmZcC20iSiLi7gFGyNagB3SdPzIetHYnISHVQpEQFF8OsOM6cRA3B
 pzkCDoeAue6je13zwBICpaOCAWQIan6ojL2+niKFsIv7eL4/fGdyCuDF/OMkHBCr4dc6
 SR/LJyTzzPmVaeNRQ4OU49XiHsf1BnTqaEQ6Rk6zVZJsbWueavXdCwJuZnUDU+e29u5h
 dwLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=myT/EJF4
Subject: [Buildroot] [PATCH 1/1] package/python-jaraco-functools: bump to
 version 4.4.0
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

License hash changed due to move to license file autogeneration:
https://github.com/jaraco/jaraco.functools/commit/9a81db3c77bc106017dcd4b0853a5a94f43ae33c
https://github.com/jaraco/jaraco.functools/commit/d2b8d7750f78e870def98c4e04053af4acc86e29

Add new python-coherent-licensed build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-jaraco-functools/python-jaraco-functools.hash  | 6 +++---
 .../python-jaraco-functools/python-jaraco-functools.mk    | 8 +++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-jaraco-functools/python-jaraco-functools.hash b/package/python-jaraco-functools/python-jaraco-functools.hash
index 69edc2384b..f43efcfd84 100644
--- a/package/python-jaraco-functools/python-jaraco-functools.hash
+++ b/package/python-jaraco-functools/python-jaraco-functools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco.functools/json
-md5  b8a8d165da986efa1966abd91c45348e  jaraco_functools-4.1.0.tar.gz
-sha256  70f7e0e2ae076498e212562325e805204fc092d7b4c17e0e86c959e249701a9d  jaraco_functools-4.1.0.tar.gz
+md5  501918900674199182b1bfa39db200b6  jaraco_functools-4.4.0.tar.gz
+sha256  da21933b0417b89515562656547a77b4931f98176eb173644c0d35032a33d6bb  jaraco_functools-4.4.0.tar.gz
 # Locally computed sha256 checksums
-sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
+sha256  5a57cb4db85e2a2dd88c290628908add57e3451449e0a9a71fdfb38776fd759d  LICENSE
diff --git a/package/python-jaraco-functools/python-jaraco-functools.mk b/package/python-jaraco-functools/python-jaraco-functools.mk
index e72a062fa8..397d5122bf 100644
--- a/package/python-jaraco-functools/python-jaraco-functools.mk
+++ b/package/python-jaraco-functools/python-jaraco-functools.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-PYTHON_JARACO_FUNCTOOLS_VERSION = 4.1.0
+PYTHON_JARACO_FUNCTOOLS_VERSION = 4.4.0
 PYTHON_JARACO_FUNCTOOLS_SOURCE = jaraco_functools-$(PYTHON_JARACO_FUNCTOOLS_VERSION).tar.gz
-PYTHON_JARACO_FUNCTOOLS_SITE = https://files.pythonhosted.org/packages/ab/23/9894b3df5d0a6eb44611c36aec777823fc2e07740dabbd0b810e19594013
+PYTHON_JARACO_FUNCTOOLS_SITE = https://files.pythonhosted.org/packages/0f/27/056e0638a86749374d6f57d0b0db39f29509cce9313cf91bdc0ac4d91084
 PYTHON_JARACO_FUNCTOOLS_LICENSE = MIT
 PYTHON_JARACO_FUNCTOOLS_LICENSE_FILES = LICENSE
 PYTHON_JARACO_FUNCTOOLS_SETUP_TYPE = setuptools
-PYTHON_JARACO_FUNCTOOLS_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_JARACO_FUNCTOOLS_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
