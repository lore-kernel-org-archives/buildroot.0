Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BA4C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 21:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F26AB81E69;
	Fri, 24 Jan 2025 21:14:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x33QG1qsN6ps; Fri, 24 Jan 2025 21:14:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2363881FCF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2363881FCF;
	Fri, 24 Jan 2025 21:14:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A482F941
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9114881FCF
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:14:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PlVjo8KPNIyD for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 21:14:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A127181E69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A127181E69
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A127181E69
 for <buildroot@busybox.net>; Fri, 24 Jan 2025 21:14:02 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so27030725e9.2
 for <buildroot@busybox.net>; Fri, 24 Jan 2025 13:14:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737753240; x=1738358040;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sLs5bTggAQVFRKmaBTCQlVoreqeGGioR95hCpBBbmrg=;
 b=TZxyb7FnmfnveajGmIfknhfWH3jObFizZOsS6BLHCggVjc86V1y5LTHZTmKEvkMXpZ
 yYXE8V3dbTbB4oWau2rK9bkDSFS5iwMFKd8G3CWGKgS9v5ar0wBlUEx7fDhpf4eM+3KP
 HgS2sg3X+j1ac7uhutB3oqMQ1mX1NGwiGJcrlCsdFTz2YgMIMgKn18d3QYwtaB8zhtXB
 AI4MVkU839dNO/jCvAjnzc8Lafe7LU0NoB0Uhxa7ItEZUUVbAVGDx6K1Wg6wcxGCirX/
 BQlCWH6OSFzYC/06hFa8B8lZvfUSrLAoT0YjKoFABo92+fyZkVfOIF9KIFusR4kfsAVK
 y9wQ==
X-Gm-Message-State: AOJu0YzAHjj7GVFkeq0A9BrcTI1pyRZXY/pjtYJ7LhpOrh91oHVoT1q+
 KOqzW9rDAdpGiKkWKcMibB62n36fKWIJIIfq6UVokSNEl/j8VxckG093XXWoTLtqg5dqk1olSYF
 NVg==
X-Gm-Gg: ASbGnct7OoNjmd4CuGonyrs2wpIGI9p1jF9rf0/NkgNUip8utODdKDoMMzsaQwLw9Qf
 FSl3PUWn98w1XZhivAD3eoQmuoFWgibl9T+bI2Rmik1juWJ3iF0xkZ2gE5AX+iHCVh+yQkCyL3o
 JUWNtipaBrs/oZ/XoEFF1cfTfYZn2wzvtSKWU+UVU/jtiTp0xWGGxrnMUKzFFgtlNnWlsSDMXSV
 U0uikRLw3K/WEo3NPI8FBi+Ay7Uk1E4wdiElbc7MCb8amEse0/h3pwvcLFR+yuckKWV1UxD+7/e
 tkwACcuTcZRmcSwBsYXzN4uCIBdjvtBcalYv8KM=
X-Google-Smtp-Source: AGHT+IFSGUBBGReYTTucqIa84PqviJFGeEhf6h245b3a3DME8rh7WjaBhHZgOe9ZyX4nWExbexBcIw==
X-Received: by 2002:a05:6000:1acc:b0:382:4ab4:b3e5 with SMTP id
 ffacd0b85a97d-38bf55bbddemr30396224f8f.0.1737753240215; 
 Fri, 24 Jan 2025 13:14:00 -0800 (PST)
Received: from vm-2404.. (75.184.66.37.rev.sfr.net. [37.66.184.75])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd48a145sm39118375e9.16.2025.01.24.13.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 13:13:59 -0800 (PST)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 24 Jan 2025 22:13:52 +0100
Message-ID: <20250124211353.3233770-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1737753240; x=1738358040; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sLs5bTggAQVFRKmaBTCQlVoreqeGGioR95hCpBBbmrg=;
 b=oKV5WW3EU3PuglMg+dbkR59AU7E2WaXSg4aNom/IwfZ/6e5WZNh1y1zdrqvc2K+qJu
 Bw2WMmszmESAeVq4Vo9UcM3NX/jvq0nP9xp23XdENuSPNA4ATiI81UKZsompWjMJyaNa
 DLveFfS9Lrikv0I/9CilymkJLF4qF2DYe6k/VRYBkOFO+pZ3RCfYVPnOyuo0Zg7XZzOO
 CH8CwDLbdgej8msaEMcKLnM/uuL7EPxM00EXqGd0PSRqpnHct2WeLv2mXmS1GKAL+f6w
 TXoiMVA4W2ZuociwOBitW1BcnlPJWF2ABUmpdVuEm8czroT1ESW1y773KTLxInxeS7pX
 2TIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=oKV5WW3E
Subject: [Buildroot] [PATCH] package/lua-lsdbus: bump to version
 3704232a634d1c866275b9a138b860421fd1c8ac
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-lsdbus/lua-lsdbus.hash | 2 +-
 package/lua-lsdbus/lua-lsdbus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-lsdbus/lua-lsdbus.hash b/package/lua-lsdbus/lua-lsdbus.hash
index 43029f61e..d6f30c052 100644
--- a/package/lua-lsdbus/lua-lsdbus.hash
+++ b/package/lua-lsdbus/lua-lsdbus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  33d14d52df702dbb2b1e5b7770cb4e4efb11df2da0b743c5f9a19e16a09783fe  lua-lsdbus-ae5e674e5e792dd72e4164c436ca7b064158e7c6.tar.gz
+sha256  fce5db789b18663c5c48010eaa0b3411f63a7f0b3c70c761535c0d5e3f9f5e11  lua-lsdbus-3704232a634d1c866275b9a138b860421fd1c8ac.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/lua-lsdbus/lua-lsdbus.mk b/package/lua-lsdbus/lua-lsdbus.mk
index 606fa16c5..d398af029 100644
--- a/package/lua-lsdbus/lua-lsdbus.mk
+++ b/package/lua-lsdbus/lua-lsdbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LSDBUS_VERSION = ae5e674e5e792dd72e4164c436ca7b064158e7c6
+LUA_LSDBUS_VERSION = 3704232a634d1c866275b9a138b860421fd1c8ac
 LUA_LSDBUS_SITE = $(call github,kmarkus,lsdbus,$(LUA_LSDBUS_VERSION))
 LUA_LSDBUS_DEPENDENCIES = luainterpreter mxml systemd
 LUA_LSDBUS_LICENSE = LGPL-2.1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
