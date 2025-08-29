Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272AFCA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 11:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D531B822CF;
	Fri, 29 Aug 2025 11:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UrL3m3-rNX1H; Fri, 29 Aug 2025 11:05:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10F65822B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10F65822B3;
	Fri, 29 Aug 2025 11:05:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17DB2D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08F0F4188F
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FyX3OnE3dT6v for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 11:05:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F351C417A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F351C417A5
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F351C417A5
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:05:08 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-afe9f6caf9eso291203366b.3
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 04:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756465506; x=1757070306;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3oBqoeQlRP5GgZf7cYt4L8+RG9bYXgI5tiXLjo/UgVE=;
 b=KiJ+MDc1nud7U7DC5RBm5zkF/0c+w0ikDwwui4QHYHTetovyMghhvWEvdkNRSHtyth
 ZWZYjiVvIIe3PFG0Y0JQS2wHShkRk1StjuFTcPljjshz42BnMPVRC6okRwoP41Tkb6VB
 YhH4THlUNk07/6y7cuoM+PY+KGSfky3ZIsFLZHVD35PXgaRxbPTOKFDPaLVts8/unsPv
 2wHjI8E3ahB3Exq78QNfn5p/8FuQ51zSyCwvvifZzfguMDE1j64XYCXFfiMbASaOpuBB
 RbxsgzNc8tQAKhDrNsqx/V87plOrpYH81WN8fP7ue7T/jeYQiEY39UATUru3Kg7X0Lzl
 BEyA==
X-Gm-Message-State: AOJu0YwVm6YohwKhQrjnPONeLRC6L1ZSIYSfWUtt7Hin/7g8tywxiO2/
 A+OyQwQW2uufNlkwtzOF1IlQA3oa9vbVTT/mXO3v+8xZu9pEj9OxrMmaOBFdcg==
X-Gm-Gg: ASbGncvkntdw2jUKPkqmRSM/mDjezPNk85rT5QVs+6pC6qkMe4fUKDbY+DzmGgLzaOK
 gd1RF0z9V/TsGctVvxYyzuXCuNUC4+HPMowhYpGghVA4X6+O9qpbjtqZc/TFpB/rHCBlYSPZ/45
 gCgLgcbFEEEa0TZwWxthrZIN85aNk+v2shfPvx5japcRcR9smJSd9PVqTYtGjSzX7M0qKOYJGnx
 q8pLQkY/JrJNPlAkW8jo8fYMtwuizIEllVjF49jnOzcEZW7VQMCo9/9J4+yZ0rpgJ4jSc+wYUnJ
 y/jQm9iNGIdypsPF1/0GH5gFn+Xn6ibX8F0xWI4Lu2iG6arHRNKgJZESBzJa1HCYiqunVq2Z1+e
 cHrHy27Yngaz8oh4YpviExIEEFX1xHcTrDLIGaCD9bX0e+eS44R/x99PrrjTmhb84NW+wMqCmyR
 XFFQacaoNbb323DQ==
X-Google-Smtp-Source: AGHT+IHSjJ7aO9lzWUlDHwxLV1n+WXusDtSCovVUwknvMRzwNMib2W2WLcjyLZjd/Gl+tAZBJKETmQ==
X-Received: by 2002:a17:907:6e8c:b0:afe:e9ee:4ae0 with SMTP id
 a640c23a62f3a-afee9ee5741mr499970466b.59.1756465505770; 
 Fri, 29 Aug 2025 04:05:05 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefcc6631esm173451266b.95.2025.08.29.04.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 04:05:04 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 13:04:55 +0200
Message-Id: <20250829110455.2608767-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1756465506; x=1757070306; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3oBqoeQlRP5GgZf7cYt4L8+RG9bYXgI5tiXLjo/UgVE=;
 b=MmvJDoWqpyQwtJqZZdNrF7KQo78xpzOWd+YgOgFl5KeEMJMo6YkQFtWiLCrG9sOGaj
 JtVNNiSsgT6f9SmF5kB5uwC9jzVWn6WwDaeVKUUkOWhRcKGhMWcf1/m0S2j4PcXGR8a+
 5DXaBlzDXid8Fjpf7JGsbUPlyqVr37qTaP+/OZ+SfdaXyXT/BgODdq3v57zb5naN82Ic
 mbp3ON9B5U33rHeD25suOCtiqB0myRzwAYO5Oq9C4PsgXlw1Fc9NdWbiHm6zuPswjU0Q
 ZjvHcxbUJv/FjDR9p2hu7q6inkzlthrHUZulastB+Cbmfyxfap+6YHk73OoP1KMZCdzZ
 pI3w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MmvJDoWq
Subject: [Buildroot] [PATCH] package/libftdi1: enable static only build
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Daniel Sangue <daniel.sangue@sangue.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

libfdti1 provides configuration options SHAREDLIBS and STATICLIBS
that allow any combination of static/shared libraries.

Fixes:
https://autobuild.buildroot.org/results/d7b9a45ccffc1c9e3fd796c3e46ee396b7d88272/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libftdi1/libftdi1.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
index 31ffa1aca3..0595ccf963 100644
--- a/package/libftdi1/libftdi1.mk
+++ b/package/libftdi1/libftdi1.mk
@@ -13,6 +13,14 @@ LIBFTDI1_LICENSE_FILES = LICENSE COPYING.LIB
 LIBFTDI1_CONFIG_SCRIPTS = libftdi1-config
 LIBFTDI1_CONF_OPTS = -DDOCUMENTATION=OFF -DEXAMPLES=OFF
 
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBFTDI1_CONF_OPTS += -DSTATICLIBS=ON -DSHAREDLIBS=OFF
+else ifeq ($(BR2_SHARED_LIBS),y)
+LIBFTDI1_CONF_OPTS += -DSTATICLIBS=OFF -DSHAREDLIBS=ON
+else
+LIBFTDI1_CONF_OPTS += -DSTATICLIBS=ON -DSHAREDLIBS=ON
+endif
+
 ifeq ($(BR2_PACKAGE_LIBFTDI1_LIBFTDIPP1),y)
 LIBFTDI1_LICENSE += , GPL-2.0 with exception (libftdipp1)
 LIBFTDI1_LICENSE_FILES += COPYING.GPL
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
