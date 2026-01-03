Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B771FC617E
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 18:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B21681150;
	Sat,  3 Jan 2026 18:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qkrimCI-B4kH; Sat,  3 Jan 2026 18:03:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 304918115A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767463382;
	bh=5dIGpn11sDoeXYx47rkT0debkSE5OvQgl9k8qanrsMM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Dg7ojjPSfeYObgMhkmuN/Pg4ALaWmTWTRou2sREw3Na+d5P9FFzaEjQtIR1cJsJYw
	 BTjtyIihWWEelYsBiwTGTerZbcBH3nEMtCNKIL9/N07bqRoo0aVDv62kMfV3bMIzF0
	 EySqN/fCyy2Xj8y2PrywIyYgt5PtRZWKIXX38OvwefBRx/YKgWA98Afd0q4++N7ily
	 cY2RlOZcqJwt0Ch8Gko5lPC6Luf2+OyJrdmfkvWWMWD9Bxk2HVVQZhiwfDuJaOU1SG
	 +vUY3pJexdLATQOg5KCdi9OpfN9GIWaLQrU9i2ghAinzOcAHWHIP1FuHi0rbd4T3VP
	 d653DEaYeJlQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 304918115A;
	Sat,  3 Jan 2026 18:03:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D2FA25B
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 18:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FCCB401B0
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 18:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L2F9W4_fR-v8 for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 18:02:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2d; helo=mail-oa1-x2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A62940168
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A62940168
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A62940168
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 18:02:59 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-3e12fd71984so9096020fac.2
 for <buildroot@buildroot.org>; Sat, 03 Jan 2026 10:02:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767463377; x=1768068177;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wyulIEPNHFw0u9HhB3/1SIO8LoXggDCxuzVDHdk056Y=;
 b=tCK5P2dw8DWT7FS/8017GY0K68AksH72rLGBr/SaTu92dcgzeUqgV8W+ausy1dQ6Bl
 WEhFe2NoeUVS8vVYMnk6qGA8cqbybMgQ0CAy8Dj1GUAduhyu07esuA6Wp9+8dlEvf8TC
 9hxsRpsmUrJmAm0zGdX3ClhK2idrClSTJuTGOuLUC2reDcv8l64M4vYDma/A/OkVnd8D
 RneAkI7y8/0O/MEPRl11mFDVJBm4rclSVzg3VxjTFdGlAf5cxFq39V/aovcAOYMTi+0u
 2j4uuBcvIKOzaHN8mfRBS5hZApmL8gnwv/zQjaAU9rCMw037H+FaXCnGGEUaJR/BCICD
 abLQ==
X-Gm-Message-State: AOJu0Yx6FA/o9IkqomnZ2LHD+GR+dp6jm6udSDrwRdfNVpLwbRhAygB4
 DU3dtJ8YyJxAKr6u3RSHqCYhCbb49jFQIPLMqARsIlm6qWnA3k5+J66afQ4+5KVP
X-Gm-Gg: AY/fxX7wLyE2V94a6ofWmJspcb5YqtEqBRgIgq+iQPzMVsQQmYjGfYFSuumgjJUcUWh
 5MqiWCohKZYct6F2AGWsb9nI/vFcnch2xaCaBEVSU8fDCUfzVn1D/4KX3BUQ14fFLac9heQrVpM
 SRqv8Bvz7Q/nD4XPbOtwWHyW0nQzz23kMWnnCNHupae4OvnuOmsJW7B5LFkej7ZR4HXneHwSXId
 ohdX+Gdv9Zc8JEfq+qMei/knz3eV44nft9iTllvsoYTL8xOUOFwR3jFlaZAuNgcH9yiJ88D9Zb9
 4ZEJYvhaV0u17G109zOIglAds3B7gLCsFNxBQ5DvJl+tSdMZ2Ye8WbQwAhyPSMWcfN14/gQ4BhA
 T0cT+cwaytBxcn4VwzFHCNqAPp8N/kae35KGLkEun2eXACtnfoe8T8MwW14TUnuYyvuW5YRYyjD
 Kck/ZyEakQsrvKkig3+PxyZ7O5IdmYEqW1rQLyjnJq7MQ8Hvz/OzZ38dSSVYcpMs69ykRhjbwP4
 FzWXDeeJIYzlrehKWg3FgAM5WEhwjfIUPKlmgQULdOc27VxnMNQh0k=
X-Google-Smtp-Source: AGHT+IH7TWbSzMKIICeSTIeo3LynaJmkGZfIw3e/VXx1dYaslNa0ySIsMTOw8eZTEPvHbVCD8m8Adg==
X-Received: by 2002:a05:6871:611:b0:3ec:42d2:66fd with SMTP id
 586e51a60fabf-3fda5727e36mr24750847fac.51.1767463376731; 
 Sat, 03 Jan 2026 10:02:56 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaabbf2e6sm27830324fac.17.2026.01.03.10.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jan 2026 10:02:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Jan 2026 11:02:54 -0700
Message-ID: <20260103180254.1999810-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767463377; x=1768068177; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wyulIEPNHFw0u9HhB3/1SIO8LoXggDCxuzVDHdk056Y=;
 b=U/Kjy5OxrGbU4JMoNPv8OKMsRkEP6iX6pmqbxqR02APK3hVMeMvyPcR1I+ETUxdRlL
 qDQXVXu2hWXmWAi/QM1CgQ/FagzOIIxCdzmC/KTBS2qZIDpDs9QttBV9WEfNUUgCN1PH
 l9JAE6WKd2eUY69Eqlv2yV7sUCY4vS5sGbaI4x/7GkMYvr+kdJSwPhBj9+k4evZy2Kk1
 jzqHI9mbfR5wDV17Nm6xVKhblsrGRAUySJtGMhO6hD/JoYDh7taWbXd6jgTepPHYfVpU
 gF1kWN9SWguX9WLNAzPukn4n11sakN9RERf0eJ/kwFVde5wWbmjwvANCXumQj+MRUnuN
 lXWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U/Kjy5Ox
Subject: [Buildroot] [PATCH 1/1] package/python-platformdirs: bump to
 version 4.5.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-platformdirs/python-platformdirs.hash | 4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index b35d10dba1..bbf94f6b6f 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  90aef8202386996ce2e4b560a9f1d3e6  platformdirs-4.3.8.tar.gz
-sha256  3d512d96e16bcb959a814c9f348431070822a6496326a4be0911c40b5a74c2bc  platformdirs-4.3.8.tar.gz
+md5  e1000e5728e36717b1832e77dc3590c9  platformdirs-4.5.1.tar.gz
+sha256  61d5cdcc6065745cdd94f0f878977f8de9437be93de97c1c12f853c9c0cdcbda  platformdirs-4.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index b24d6d78d8..e099c486c4 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.3.8
+PYTHON_PLATFORMDIRS_VERSION = 4.5.1
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/fe/8b/3c73abc9c759ecd3f1f7ceff6685840859e8070c4d947c93fae71f6a0bf2
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/cf/86/0248f086a84f01b37aaec0fa567b397df1a119f73c16f6c7a9aac73ea309
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
