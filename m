Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29764CDD0EA
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 20:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F13E480A85;
	Tue, 22 Oct 2024 20:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5IV859Jm7BhO; Tue, 22 Oct 2024 20:51:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 206BE80B02
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 206BE80B02;
	Tue, 22 Oct 2024 20:51:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 202412072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F58280A85
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:51:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mpAUlWlZ-TzN for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 20:51:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EBA5D80B02
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBA5D80B02
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBA5D80B02
 for <buildroot@busybox.net>; Tue, 22 Oct 2024 20:51:48 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43163667f0eso45481165e9.0
 for <buildroot@busybox.net>; Tue, 22 Oct 2024 13:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729630307; x=1730235107;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/CfxSU8npnmRy11euOuSB8ItQjxjVxd0408EUIsuTtk=;
 b=k4rejJQUcjIPOPtmtfDP1hpDcHridLMgUN2UPen1oURKsdyLmXr/rsC1f4DgB1Sqyi
 HqggwqdKioLfhBXsrEcP5KMfaNvM3cg8L51WPuLJtxgyNIWq3XypRXK9uPDQOa2y327a
 24SQ6kjAeH7ukKteCGr+/znPAvQjROzDZkq1kmrHBy/U7LyZMm2cwe5oB3nTtKGRwqIl
 koVKaRXK3n6UXhqpMEms+rT538nSH1Fv2CLNTBWZNWciTAXSmMthrHOghM2fFEgrkqZa
 LO8XZDS7QVjBGGrvjvjuPIaUafQBIFH/XKQUhrrcD0BPP0t3aUKIKTcFSLaMpiO6BgSk
 PoOg==
X-Gm-Message-State: AOJu0YwsOS8xPHGKH12X2Cv3AugKuANsvVV+MgGYPKoFCx/VETiCzWPQ
 WkcLzV0bhajmGmFKEXT4t848Z/Umb+pmN6uLjVowqWLAhQQveg0mXMuJssyzE9G0/P+6VA91W38
 L3A==
X-Google-Smtp-Source: AGHT+IHyMAsI0wdufhTOJLyO/LyiLuXv2tOcn5KMS94p0kvWwODTFZNMyyJuGFvJ20a7AhEk0/uPMQ==
X-Received: by 2002:a05:6000:4581:b0:37d:41c5:a527 with SMTP id
 ffacd0b85a97d-37efcf05d52mr144224f8f.13.1729630306943; 
 Tue, 22 Oct 2024 13:51:46 -0700 (PDT)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0b9bd6esm7358623f8f.104.2024.10.22.13.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 13:51:46 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 22 Oct 2024 22:51:43 +0200
Message-ID: <20241022205143.532229-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1729630307; x=1730235107; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/CfxSU8npnmRy11euOuSB8ItQjxjVxd0408EUIsuTtk=;
 b=Co+vuAW+92Vbp71HrfR9Fky+zELpEU+ZUpnpXPtgjBw8KOm9BVUF9cbogqHORlMWDg
 JIG5QzEuZtIV4YZKyIeftlZ4KqY3s8rcX9WFsfnC7Vgoy4MM3mNhosvuPwtLjjVFw98B
 KKhI7CnD963OGd2Rd6zlwzrAeZlgtZcVRmg+nHVtabskUUv7Y9C8iC6NrOixN2v+ngtu
 YDEXVUD0I6LkD06plCOZ/8RRQUaCS1LKHej+4ZnjS6VXAfC8fBh/qmbeZDjtyGwcrFKV
 COIIHrRQtXX3JhE4sl6sHFrJ+7D7yCLM5V866XYUNntAqa1TI3yPfp4rwuXAPrmwcJtk
 Y3ag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=Co+vuAW+
Subject: [Buildroot] [PATCH] package/xz: bump to version 5.6.3
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
 package/xz/xz.hash | 4 ++--
 package/xz/xz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 6012e1001..c403ea2be 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://github.com/tukaani-project/xz/releases/download/v5.6.2/xz-5.6.2.tar.bz2.sig
+# https://github.com/tukaani-project/xz/releases/download/v5.6.3/xz-5.6.3.tar.bz2.sig
 # using key 3690C240CE51B4670D30AD1C38EE757D69184620 Lasse Collin <lasse.collin@tukaani.org>
-sha256  e12aa03cbd200597bd4ce11d97be2d09a6e6d39a9311ce72c91ac7deacde3171  xz-5.6.2.tar.bz2
+sha256  a95a49147b2dbb5487517acc0adcd77f9c2032cf00664eeae352405357d14a6c  xz-5.6.3.tar.bz2
 
 # Hash for license files
 sha256  ee3b35b82f7bb0ba5fd9f13ca34ebbe757a59c05bfde5ab9d50ff4188ed33396  COPYING
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 3329d302e..b3f8c3002 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.6.2
+XZ_VERSION = 5.6.3
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
 XZ_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
