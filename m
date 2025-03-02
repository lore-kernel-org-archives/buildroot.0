Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9CBC19F32
	for <buildroot@archiver.kernel.org>; Sun,  2 Mar 2025 21:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29A1583F99;
	Sun,  2 Mar 2025 21:53:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 79sbSwhZn7Fc; Sun,  2 Mar 2025 21:53:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E88684025
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E88684025;
	Sun,  2 Mar 2025 21:53:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A4DCE182
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93F6460A7C
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aw_TGgqMmH24 for <buildroot@buildroot.org>;
 Sun,  2 Mar 2025 21:52:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B429360909
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B429360909
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B429360909
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:57 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43bba52bc1fso196765e9.3
 for <buildroot@buildroot.org>; Sun, 02 Mar 2025 13:52:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740952375; x=1741557175;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ts0QT2cJ5K8p1SPY7Iwq7r5CXPwr0RDmaQKb6oz87Bk=;
 b=QH1rHQA8h9R0OfEeM8n6umVNjUFVln7BZtt0wOBI5AplDb4ejNPTd5IkDbiUH0C2bl
 vlVlelnnmBajcPy7ByPJqP7qO/TYIy/85+1M5BZdFr17spy5vD5sQx0zJXSACSckTX0q
 v3GLGiVsYVDG2UbRKZWg4VYsU0GXOer/AkniGdWu0R+umOQ3H99ripYFGhjZ1RGknsbw
 80+4tQkKkw6FBPyTNlpInZmVh/rvZqMWoL5pjMX3yKXOMMxHyXrkW5GuuRTciH7syhCz
 HVmJkIR06MSf+w5mJcrzY7JOR5pzELPprIB2Gsbist06Zpj3D1sZB3Y3jrDjdT3Wdjk4
 Vfjw==
X-Gm-Message-State: AOJu0Yz4vsUEvqme8yJPAP9gg0Ld+sn4QTNGhXIrFGLa4JlAhsVsHv6F
 QMpCts2bylVyqPkzEjvhQ5rBH79jBBscMUpUxkyiLT/K2/rn45uSrqEB1NBI
X-Gm-Gg: ASbGncueofBs5cvYClhVrtAGh/wlMb915hnF810di9cbc2MineM4rK4/fDdVaI6eOSn
 wZT27/0SPfwdg78wlE9Y7VJXRWl79EAyVuoZ6U2T2Xhik3yyOD31M2XyT6lkd+/fH5YtnZUzqXk
 nNwPyGN/jhGbSJHB2q8QNURh/qnn8fYHTlmj+YXT/2+qOKJJaqVrsrSme5GL8UQ/x/0ijVVmHkW
 paS3eNeViYx3KW+JHxEDipOEaisPhMfujexJqhvAPzWMcLm+oIo8nx2GmXxHozL8Xm4APdnBGft
 IOPZC2b/18znZFqZNFYKsHzTQqkh4ZMCAIFWhg==
X-Google-Smtp-Source: AGHT+IH4hTJesDfpDjEFbUAuXO+vg32m/KBz4eO5fGtki1KG4qX2Gx8Co7ZRD/2NMcdCM6DXrytmog==
X-Received: by 2002:a05:600c:3149:b0:439:9ec5:dfa with SMTP id
 5b1f17b1804b1-43ba6760bf0mr37893425e9.7.1740952375205; 
 Sun, 02 Mar 2025 13:52:55 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab2cb1063sm113389645e9.2.2025.03.02.13.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 13:52:54 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Mar 2025 23:52:14 +0200
Message-ID: <20250302215219.1276480-11-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250302215219.1276480-1-olteanv@gmail.com>
References: <20250302215219.1276480-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740952375; x=1741557175; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ts0QT2cJ5K8p1SPY7Iwq7r5CXPwr0RDmaQKb6oz87Bk=;
 b=imJcWJJEu7eDM8mJT3WY+ZCW14InT0ENZWrbxsAyd9cHOEQQQvIaTzNamJ3k8zec6x
 cf8lAMDmNy+vMs9BIUErLvxiZNKs8aSvPymOK/V5inYpaKCJp8nFifXG8ECs2CK87qMa
 M5tlVgp95yndQurHHTvjj8eILLZK75K5G9y8J6A62TZQQKYHfK5XM6C1Yl1he1mVl5Tb
 XMAWbPAsASYpXM40BnpdNzU27BSHCkiDm/VsH3XMR8yM5qEMOO3rMA7T49Tz/9maPTjf
 +TRgJBgUzPW6MqmmjLjzeNp4apEfrC3Zmv2GA5Si6E+MjuVSFenHIHpGKg63dwXgplsF
 CRUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=imJcWJJE
Subject: [Buildroot] [PATCH 10/15] package/qoriq-fm-ucode: bump to tag
 lf-6.6.52-2.2.0
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
Cc: Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Same FMan microcode binaries, just doing this in order for all BSP tags
to be in sync.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
Change log:
- Break out FMan microcode changes out of larger "[PATCH v2 01/11]
  platform/layerscape: bump Linux Factory tag to lf-6.6.36-2.1.0" patch
- Bump to lf-6.6.52-2.2.0 instead of lf-6.6.36-2.1.0 (new tag appeared
  in between)

 package/qoriq-fm-ucode/qoriq-fm-ucode.hash | 2 +-
 package/qoriq-fm-ucode/qoriq-fm-ucode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
index 67efd675cc26..bf494b177bb0 100644
--- a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c994367c74dd2ff6cd70ea269cf1bc775c5f4e11294a8db414491ce6c2eb9dc3  qoriq-fm-ucode-lf-6.6.23-2.0.0.tar.gz
+sha256  6b9e2a5c383fb9288db1459821fc696f3abfeddd080b04c11cf9f712f0d36470  qoriq-fm-ucode-lf-6.6.52-2.2.0.tar.gz
 sha256  7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17  LICENSE
diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
index 84360533eb1d..71904e5b1376 100644
--- a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_FM_UCODE_VERSION = lf-6.6.23-2.0.0
+QORIQ_FM_UCODE_VERSION = lf-6.6.52-2.2.0
 QORIQ_FM_UCODE_SITE = $(call github,nxp-qoriq,qoriq-fm-ucode,$(QORIQ_FM_UCODE_VERSION))
 QORIQ_FM_UCODE_LICENSE = NXP Binary EULA
 QORIQ_FM_UCODE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
