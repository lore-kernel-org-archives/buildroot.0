Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8612CCCA470
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 19:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B5F960F68;
	Wed,  8 Oct 2025 19:14:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FwpmDVGriGO0; Wed,  8 Oct 2025 19:14:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CE8D60F6E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CE8D60F6E;
	Wed,  8 Oct 2025 19:14:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 52DBC119
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 19:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 438C240CFD
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 19:13:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mbYp4xrk6TV5 for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 19:13:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4125C40CFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4125C40CFB
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4125C40CFB
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 19:13:58 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b3c2db014easo36870066b.0
 for <buildroot@buildroot.org>; Wed, 08 Oct 2025 12:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759950836; x=1760555636;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GRa3GlESJizbFjb3/v2uadaAyuIDMBIm93XUmqh6uaE=;
 b=O5OJPUz0jVydRZYtAHyX/WvFUmVQRxZZyjLjGRr2BNM0mtD+x+Wux73QnLVKW6RgsT
 1htwOEtkFsTZWDHyhLluNRTi5T6idBHi9TaiHEdNOr7VFLErVp4SHeUZSUWsJaCQuX84
 chttYtA70GD8DoL52rfaTtUvYH6Vy0c+XxZyYBLIKpDNFdjhfOXRdFSeFsvHYZ5K1JOD
 y8wtdxEUmSGa1gQHpMHKs1SI1grRPLlAsHMcHuJRkFk78rOKzGVY/C4Y/iTRvjy2vjGi
 z3jju60O743ljRLd5Onxp+M0bHpyiw25QA0BxKTtH1KU7Gff1Sph0BkzeCH3TjdLKYg7
 sbmQ==
X-Gm-Message-State: AOJu0YxZXxJNgOmSnsDdpr6ZYdpm/CApqnu/xCIzosP6c8i+/oXuHUKn
 DX5QhZ8JgMo4gEklhKTnRgsXHm07an1fcbzBH99vS7U2gXu7i9P0sFcsDaCOKIdEgAOLwE8oN0a
 wXWOQWc4=
X-Gm-Gg: ASbGncsfCfWN9/Ws4cGDLfxikPl9l0mNmgDJqc0TYUh6QjAThN/7Brm1FGlZAyNOHjZ
 7ASYOzaYYfF0oh1tUH3l8Yp1xmozKbhT7/9omkbIBgG+UROaqpUyBdbLKzUltORiJZ0kD6hfNvD
 EgRRQ++TXzFgJHdvcbwABJLtgDtMCYGA3gBpEYQCpjbjzdpNYYCLnNtY7l/vHvaMVQY8/zwVo31
 GOGypw5Zq8Gfy84i3wgB4pPMMnstkqqs/G3Ba6hIi6IWjEDR2SqKLq0zFk4H+ymraE7NN12FVIq
 kI9CzZsHhRbyk0ASGyUlSMzoieGSw6JtUy6Hu+YqcMxCKFhxf9Wnvtb5N5ZRLmauuyLEGLfUBHS
 KliB4dsl2hH2ur6DzTOxsJhcH/5KQxMkrtksUT+sXuo2hS5pgTmVNOG99ghy8l//9VQBbemV1pF
 CL49+g7mqeXOFdHzlaeHNxmJww9ydzi5D7uQcod90c3Y/Srx5duuoi5EdYKVy8yrYcfX3N1ORUT
 7KxtPSr+Uubt5Lq9RuYTip2Lw==
X-Google-Smtp-Source: AGHT+IGuXxNGDMTnMRaIU5Zj1mNGYpGHFXpLbrlmxViLNmnCfTJ0Vf78xEbbuH2qx2kH0lLf9di74A==
X-Received: by 2002:a17:907:ea5:b0:b3f:f822:2db2 with SMTP id
 a640c23a62f3a-b50a9c5b35emr510609366b.11.1759950835800; 
 Wed, 08 Oct 2025 12:13:55 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-25-27-158.retail.telecomitalia.it. [79.25.27.158])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4865a83482sm1732115266b.26.2025.10.08.12.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 12:13:55 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed,  8 Oct 2025 21:13:46 +0200
Message-ID: <20251008191346.2159282-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1759950836; x=1760555636;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GRa3GlESJizbFjb3/v2uadaAyuIDMBIm93XUmqh6uaE=;
 b=J6OEABXJe27QFBki0eDqTF1zCmlpV/s6Dc4fS7ji+NmjHjQ/4SpiuquZqydaen+yl9
 9PUW2klCPPJI2bPMxW0xWyVrqryNDhlNLu1Ln717dmLJgUKdtQqtVlL1bQaI2rJrwL05
 ieJ0fYke/kuHwupEtx31oqxH/R8OPWlOg0Zc8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=J6OEABXJ
Subject: [Buildroot] [PATCH 1/1] package/gawk: bump to version 5.3.2
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

Release notes:
https://cgit.git.savannah.gnu.org/cgit/gawk.git/tree/ChangeLog?h=gawk-5.3.2

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/gawk/gawk.hash | 4 ++--
 package/gawk/gawk.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gawk/gawk.hash b/package/gawk/gawk.hash
index b029ab330dd8..b65835925795 100644
--- a/package/gawk/gawk.hash
+++ b/package/gawk/gawk.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/gawk/gawk-5.3.1.tar.xz.sig
+# https://ftp.gnu.org/gnu/gawk/gawk-5.3.2.tar.xz.sig
 # Primary key fingerprint: D196 7C63 7887 1317 7D86  1ED7 DF59 7815 937E C0D2
-sha256  694db764812a6236423d4ff40ceb7b6c4c441301b72ad502bb5c27e00cd56f78  gawk-5.3.1.tar.xz
+sha256  f8c3486509de705192138b00ef2c00bbbdd0e84c30d5c07d23fc73a9dc4cc9cc  gawk-5.3.2.tar.xz
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index fbb620be7d6b..40b0672da25a 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GAWK_VERSION = 5.3.1
+GAWK_VERSION = 5.3.2
 GAWK_SOURCE = gawk-$(GAWK_VERSION).tar.xz
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
