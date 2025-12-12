Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC33CD44149
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 08:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3449860A48;
	Fri, 12 Dec 2025 08:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E4_5cxFOAIl4; Fri, 12 Dec 2025 08:49:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11DD660A44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765529388;
	bh=cyaP4kU3zvhkP1C0NfF6/H8cbztzkbLWkT/HERFDL+w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mGwyVs/J/rdUEYIsPlj4lHIpsaF+oxc2YgnE/GkGkEBRDFW0159bCgxfuV97BM+Uz
	 Zmxra11t8AU6dOgf7cLViULYDyDuy35DgfB5m5lEUuy0T+iVfYUXOns/qetSJD00c+
	 ZZv5Z6XYelu4wU5jmO2suQWSbeHmSr0iCfABhNDBSKsTF5pUIeOEtZN8/iH0XvMCgB
	 6RAKK1i+UxRzCS9Ucj2OkTC0yC4P2P6cFQEflKnJGuh8/m1WKUSEqxH8ARZYS+vKyw
	 RIjSk0xfC2maRiEpG+WLV2tYU/BByXLS+8ZD2XikteRZtUdS3Tykx/NozKx11VFMYA
	 ktKr7I1Dq2OQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11DD660A44;
	Fri, 12 Dec 2025 08:49:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 903232C6
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 08:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7307680B26
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 08:49:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mMOLh1uwEHeM for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 08:49:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 43E4880B22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43E4880B22
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43E4880B22
 for <buildroot@busybox.net>; Fri, 12 Dec 2025 08:49:44 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-42fb0fc5aa4so447359f8f.1
 for <buildroot@busybox.net>; Fri, 12 Dec 2025 00:49:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765529383; x=1766134183;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KFC5j0vDVccsAYInLTnD7IIQo0o0M5Hkm2NaySQQheo=;
 b=fqxA/dfrPkH6APMN5tnNQX3W4jfDG0M8FPdOkRSSq3ho9KW1MiIN9H4t7/q1+K3uQ8
 xAyZYXg+6VtvRa2Uel8RrO2Jf35H+oi7ffyW493d3l8ac3eDwS4uzkLBij6X4mxzR78D
 WfbabBgl7lnUTTaigKZ3uHBGWZ4uV8sNwh+7xjWjs5eVRVXZ7asRmUtAKL+xJyuPHoG3
 KMyrfb4C1RopiU8kbXX3ZPxfgaVf5U7NsAZ5WwdPFBXBmRITlHL8HJz2m4RAaCrA7PRW
 E3Xkdv7c4S5rljLjtuA8W0r/eFAOMffvMPSmUDVwdb28GTDtys163gRAL94esf61T0Kl
 nEzA==
X-Gm-Message-State: AOJu0YzefMNhNSE291Ue5x+cQov3FyuML6VvCrjYMqqZRbwrgt/tBll7
 rdu/p2Jr6+B3FApioLrf9OdQtR4eLw5Qwz5JPpcRzBtw7iDdKVrlR5Gjx2hwK6Pc1Kp19K55nv0
 43o4jtg==
X-Gm-Gg: AY/fxX4MKm7C5pwonspExk2PfQ161d280eXiCUSmmcKMd1HCVubHi0uvd7CaQtlG+0p
 KWBXAh3W5s9AfP/htm8eq9JtH9Z6jb2xwkiku5LrwQygL5k9z5J3Znz4TY+ZXsf4AfQUJSVNkYs
 XMQfT2Qpp6CHqZcebDTEuXT0tmNrxqEx3l6G4E4rNfXX64InvVGuOXQZOaK4Y4VQXQc7DJ9SUpc
 MH6eXmRsD5/KWaDBPojzUIeGkxYaDG0gyX8K/87wxFNpJVS9xy1ZCjrJTK8VVbxHWdV00nzmdh/
 d0kPw3g+Iwufh2yVt9P6H4fXd5X+iUBQhUrN4OcNtTeNYpDGRq0As8Z5uJTOgmH7IHUOVW4hup6
 CJ0YveJEt1oTUoiuB3bjzWwD3Nn1qOjDuePRfXgk67ipjzTCn4Ip4rBstVfOuOU3TmiQa9h4Q7q
 I9NUpMrbeZmyzlWoIRiRaZ+arsgGHSMQwTp3c=
X-Google-Smtp-Source: AGHT+IHNQwRKUYmdkQx8yooMG1DYP5FCSlqlKn8AGLxYJ8GctTd3glb8r2+Xh/I00ucb+RBlWjuRTA==
X-Received: by 2002:a5d:588d:0:b0:42b:5521:31ad with SMTP id
 ffacd0b85a97d-42fb48da471mr1339943f8f.49.1765529382745; 
 Fri, 12 Dec 2025 00:49:42 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fbab2d3b6sm55212f8f.23.2025.12.12.00.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 00:49:42 -0800 (PST)
To: buildroot@busybox.net
Date: Fri, 12 Dec 2025 09:49:36 +0100
Message-ID: <20251212084937.76206-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1765529383; x=1766134183; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KFC5j0vDVccsAYInLTnD7IIQo0o0M5Hkm2NaySQQheo=;
 b=mYSMQCaNVn63PkUuVqBkEGNcD3DP7c++zeh8ogza9oPxpkmK+GBGq5SAe/KLCp02dD
 33hCL4HK9IRpjQAWMxSZjMqXB531WFjmBile8gKKlRb98Q83/abEj2ieMLXSNVGNvuqJ
 QYTc2YqM86YTeFHfVencvW/RU5ALq9Bb+tJx3pPMR45iBkeuiZ4UCreQPjb74+vjSs7R
 OwHKoxi4S2c6M6svp2ywRI6ESslb5AJ3voz4KYPR9KiDKBIaUkkg8BO4wrS1WYjvoWho
 8hSsSCYFi8wGVBOHqjqhTGghEyXZYrdEZ7tQgCy0wnDrFxE6buj6HWaOwTBbSijyf4yo
 byog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=mYSMQCaN
Subject: [Buildroot] [PATCH] package/dialog: bump to version 1.3-20251001
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/dialog/Config.in   | 2 +-
 package/dialog/dialog.hash | 2 +-
 package/dialog/dialog.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dialog/Config.in b/package/dialog/Config.in
index 830427e53..169505a14 100644
--- a/package/dialog/Config.in
+++ b/package/dialog/Config.in
@@ -11,4 +11,4 @@ config BR2_PACKAGE_DIALOG
 	  allows a developer of a script to interact with the user in a
 	  much friendlier manner.
 
-	  http://invisible-island.net/dialog/dialog.html
+	  https://invisible-island.net/dialog/dialog.html
diff --git a/package/dialog/dialog.hash b/package/dialog/dialog.hash
index 3136d18b2..72e749e7f 100644
--- a/package/dialog/dialog.hash
+++ b/package/dialog/dialog.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  754cb6bf7dc6a9ac5c1f80c13caa4d976e30a5a6e8b46f17b3bb9b080c31041f  dialog-1.3-20220117.tgz
+sha256  bee47347a983312facc4dbcccd7fcc86608d684e1f119d9049c4692213db96c3  dialog-1.3-20251001.tgz
 # Locally computed
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index 681f8ec9f..1039d593c 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DIALOG_VERSION = 1.3-20220117
+DIALOG_VERSION = 1.3-20251001
 DIALOG_SOURCE = dialog-$(DIALOG_VERSION).tgz
 DIALOG_SITE = https://invisible-mirror.net/archives/dialog
 DIALOG_CONF_OPTS = --with-ncurses --with-curses-dir=$(STAGING_DIR)/usr \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
