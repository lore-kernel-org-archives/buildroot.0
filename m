Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042EDD5B87A
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 04:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8B8840568;
	Tue, 29 Oct 2024 04:48:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JRuL0tJSZ29R; Tue, 29 Oct 2024 04:48:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BF6E40580
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BF6E40580;
	Tue, 29 Oct 2024 04:48:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44C59112A
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 04:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 264F780F3A
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 04:48:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ShE2ybyCp4MP for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 04:48:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8322180F16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8322180F16
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8322180F16
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 04:48:54 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-20c8b557f91so46231335ad.2
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730177333; x=1730782133;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DO1APReufJep3R2LySHx5cDm2YTVDTuKJ+Np2Pt2v+k=;
 b=v0B68cW1wQt2ITya9KrOLS/lecgcVWCFt6/FZX/8N5QAQLyeV71WuFTR+sm33l2miN
 sf1cQBiFOF084qgAfa+9DtOxFTJU3iHxOhRG38Cke3wpnsMn3+9EgmiWh3j1QtJqt4y/
 J5o5XpCW286jwD6B5geqqJtwi35Wzh5C6l1lfx4XTa/Eq4XvS90rsWZIJVCKbB2lMXtC
 wBMer4QeJECi4mmDkp0J5+zFFVR9YYN1yz8kPAeqdwshCcnih3A18cGuZ168yfBeM0QB
 VX1/g9gTGMpFtYuJmvpije+kc5EuLcd1rUMgNYOtlpSrxyu8O3mzJXMmtm3aofVfL8YH
 YFJQ==
X-Gm-Message-State: AOJu0Yy2aNgYoQ01XLOLLX/icI7PSVcOwjkhQbkzxzkZPE93h8Ml7f27
 KTdfZS3xctsxB3yKiAqdbHOQPpC8gyW5g3y9NewhaXxlNZP0EKyQaebdkNC/
X-Google-Smtp-Source: AGHT+IGg4tyZOcqGmcippVrelhg6tNHIHavhsQwb0VOUd3sE0uU8g9EwtMC+eF032xVo5wirFWl3CA==
X-Received: by 2002:a17:902:db0f:b0:20c:9c09:8280 with SMTP id
 d9443c01a7336-210c6cc207amr129643865ad.54.1730177333239; 
 Mon, 28 Oct 2024 21:48:53 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bbf44313sm58657235ad.19.2024.10.28.21.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 21:48:52 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>
Date: Tue, 29 Oct 2024 12:48:38 +0800
Message-ID: <20241029044843.703796-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730177333; x=1730782133; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DO1APReufJep3R2LySHx5cDm2YTVDTuKJ+Np2Pt2v+k=;
 b=idIyJuzfwa7V9SlFuxFoYnP7x/rVMxuv3+CmSaKpBJVC6kpgYJlIeXqXr0b2KiJAP0
 dlSmHJbmAytqAQP2URUJIMmEMmOf2hbyBzONPP6dCK6pzWG5Gkjpk3FY9rlExfkm521f
 Or5DXZq9PWY4L+2CWGz0e0sZp6yRB+VUyE4++lnOalgvGw5TRN0QKCCPdF6eG4pxsEcY
 L0866Nm/lZdqAlx274amVJQtp2uV4SzYQ6aFR2VmrmHE+Rx7+4/zI8Vt6TzV9KuvRSGG
 tPIGs5rRt/ABIh3ge7I7J2+duTp7/vcwibwDoUS0zQxGIdcU3iFhcXTBExcKyAfLPzhQ
 huFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=idIyJuzf
Subject: [Buildroot] [PATCH] package/procps-ng: fix typos in config option
 and help text
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

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/procps-ng/Config.in    | 4 ++--
 package/procps-ng/procps-ng.mk | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/procps-ng/Config.in b/package/procps-ng/Config.in
index 4afd01699b..7af0e97fb4 100644
--- a/package/procps-ng/Config.in
+++ b/package/procps-ng/Config.in
@@ -11,10 +11,10 @@ config BR2_PACKAGE_PROCPS_NG
 
 if BR2_PACKAGE_PROCPS_NG
 
-config BR2_PACKAGE_PROCPS_NS_ORIGINAL_TOP
+config BR2_PACKAGE_PROCPS_NG_ORIGINAL_TOP
 	bool "Use original top layout"
 	help
 	  Disable modern top layout, return to original top with
-	  detail cpu usage.
+	  detailed cpu usage.
 
 endif
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 4ac82cf6f9..c5185c2c8a 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -56,7 +56,7 @@ else
 PROCPS_NG_CONF_OPTS += --enable-w
 endif
 
-ifeq ($(BR2_PACKAGE_PROCPS_NS_ORIGINAL_TOP),y)
+ifeq ($(BR2_PACKAGE_PROCPS_NG_ORIGINAL_TOP),y)
 PROCPS_NG_CONF_OPTS += --disable-modern-top
 endif
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
