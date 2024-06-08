Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D66C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 09:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D11E80CE3;
	Sat,  8 Jun 2024 09:43:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M_A4tITD4ZpP; Sat,  8 Jun 2024 09:43:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D3B281130
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D3B281130;
	Sat,  8 Jun 2024 09:43:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 890311BF420
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 09:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8359B606DB
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 09:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_G1aaOCYW1U for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 09:43:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=kazemi.ms@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7922B606D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7922B606D3
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7922B606D3
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 09:43:02 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-57c68327d1aso765841a12.3
 for <buildroot@buildroot.org>; Sat, 08 Jun 2024 02:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717839780; x=1718444580;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JME2welpoE9hhHfsO2cVoMJr7XLsDILlqJ/cprVtIKQ=;
 b=CSV/7i8LfqLsJhgX5nf852mL4iDDEkx/nEDL57t7SDolVnQgir0WiRBpmUP/ZdbHPT
 L+cSDTtw4dAM1By7pu8v5o5T9WR10TiYtI8vNYwErOAMEBCtf1+dO/wTVUd4UOJOdr+n
 qzewvMluDevL4L/I97Iij5NFgbHQqrDM8p2xKre7q+1PTJpfLmdKChsNe3NY7ykUNpSx
 UxjsUInLy160WPLFWpQFKk9uJtv7vT/pL6IigC1XALeKa/cMIL8pgfzU5MKHRarBu1b6
 plUjC3+b/fyr2aF3ctd7a+p7t2SH4nHFSPWNWZ1No8JMGsKWQ5GT45pSX3jNhIRAf0vR
 2Xyw==
X-Gm-Message-State: AOJu0YwHfspQM7Fhm7FcfsePw/q4ca+BcqXPeV1Yp9qQ9joc0agRJEP8
 6fJW9mHv0sB2qAIHETSP5OhspFFB4oONo76wimkcXJ/cXPsk4Xn6RNFgBA==
X-Google-Smtp-Source: AGHT+IHBUyim3clag+FOg7roACZmYK4g1jLBFRisgE8bNmTFEabeXzLnAM0OEDlcWIKecYyJFAxn+Q==
X-Received: by 2002:a17:907:7789:b0:a66:889f:dd with SMTP id
 a640c23a62f3a-a6cdbaec9cfmr308941066b.70.1717839779742; 
 Sat, 08 Jun 2024 02:42:59 -0700 (PDT)
Received: from saeedkazemi-ThinkPad.abbrnd.local
 (2001-1c00-0b13-1d00-1dcf-81d1-841f-8065.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:b13:1d00:1dcf:81d1:841f:8065])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6c805ca11asm359734166b.53.2024.06.08.02.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jun 2024 02:42:59 -0700 (PDT)
From: Saeed Kazemi <kazemi.ms@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jun 2024 11:42:44 +0200
Message-Id: <20240608094244.842147-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717839780; x=1718444580; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JME2welpoE9hhHfsO2cVoMJr7XLsDILlqJ/cprVtIKQ=;
 b=lwW41Fvt+kyXWfBDFXEQuy/J2qcDJWJY07dkL1GAYs+ZmEjoRfwHjan/WTSQYO3bgl
 yPGwEBCOT7LUmFZQybT6E9PxcWiN2G1nFd9QD4AxPxM0rOxQslLM2438DZuLu5yTLMf/
 nvnY+4ERJL/yb4lraBWSvXaKFVvQjlECgy85DieuDBy4paTy8nWeLJjKjfhJjsJwQSSs
 Up/ZbmWyEFsmw2tluaWI/5GXo24Apc7CCDIRn/ZGnor5u0gndlOQNKvDa6IZxMPlPnQK
 J4oTHZtkVqDVVNfU4g2x9L53se1PqMLGvz1rAs3/ddeME/Rw9KcrJlQYZH9AqZQmXbkU
 W7CQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lwW41Fvt
Subject: [Buildroot] [PATCH 1/1] package/eza: bump to version 0.18.17
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Saeed Kazemi <kazemi.ms@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/eza-community/eza/releases/tag/v0.18.17

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
---
 package/eza/eza.hash | 2 +-
 package/eza/eza.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/eza/eza.hash b/package/eza/eza.hash
index 8765261e7e..3bc55b26ef 100644
--- a/package/eza/eza.hash
+++ b/package/eza/eza.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  709507bd46c1e1c4c14d6e34266355d78ae21fe2525f8bf42089cab36ebf0134  eza-0.18.8-cargo2.tar.gz
+sha256  c01f11ba19956108e42244f0b094bbb6bc74c13ea2c68feecf6f0ff2f127df97  eza-0.18.17-cargo2.tar.gz
 sha256  2762990c7fbba9d550802a2593c1d857dcd52596bb0f9f192a97e9a7ac5f4f9e  LICENCE
diff --git a/package/eza/eza.mk b/package/eza/eza.mk
index 506e515566..5a44fd7826 100644
--- a/package/eza/eza.mk
+++ b/package/eza/eza.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EZA_VERSION = 0.18.8
+EZA_VERSION = 0.18.17
 EZA_SITE = $(call github,eza-community,eza,v$(EZA_VERSION))
 EZA_LICENSE = MIT
 EZA_LICENSE_FILES = LICENCE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
