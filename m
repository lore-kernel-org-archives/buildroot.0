Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456D2C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 17:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6358D4020B;
	Sun,  3 Mar 2024 17:26:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fGDUZwcgcirW; Sun,  3 Mar 2024 17:26:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 146D440424
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 146D440424;
	Sun,  3 Mar 2024 17:26:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E1D141BF4D7
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 17:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFB2E81FB2
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 17:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lyyz2FNGMxkH for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 17:26:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B00B881FB1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B00B881FB1
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B00B881FB1
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 17:26:29 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33e122c8598so2103560f8f.1
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 09:26:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709486787; x=1710091587;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q/KeRkr00MXazynYFUnzSHmpkcfpohfGUP4z7ZQhl7g=;
 b=dML4NmoYZTrruU5cxAJe32UD4BSzH2/fXr9pWiuP47c1pwpWjmZor8tA1bK8GhlCoP
 BfV9jUh77dssEzFgq5flsIMk8LR6Wt1lr5/IeYkNn3viUPkihPKk61ot2rXlf5VhlDgm
 aaS17WkTiR3Q2kkuMA+oDY1n0DUKOrv+zGVXkqkaBfZzLVOrcseMNena/h3beM6f4qSN
 +Nzz2sxUR1WZ3Fn7fZGPR3L02/nRpVbfPBFws3Oy7fYy4LqmlcYCLw+39TkjMow0LjAM
 dv+kau4fp7c5MmMX6YF4BCWJ9STgG+WBH62TtqVpAaQMiatIOv/Q1uwgiDnzRrKV3bpw
 EiGQ==
X-Gm-Message-State: AOJu0YyPPBh6PkRg6KBZ7awJdDbFgHWdKUxeH3k+kfAUhQpGNqOe0+Vv
 w78d6z2atIY1ATPexrob6hJ8TvWz+lhQPxIqRRjM6DjpfiJk3dwkFfwlJymS
X-Google-Smtp-Source: AGHT+IH9zcO2wpHKWvWo0SpyPGKO34fidGiWxhZJrsxkALsS5BXcyNlJUb6zjeuAn+iCxhRKX0Xymw==
X-Received: by 2002:a5d:6310:0:b0:33e:834:13d5 with SMTP id
 i16-20020a5d6310000000b0033e083413d5mr4881289wru.69.1709486786486; 
 Sun, 03 Mar 2024 09:26:26 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u20-20020adfcb14000000b0033b7ce8b496sm10022914wrh.108.2024.03.03.09.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Mar 2024 09:26:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Mar 2024 18:26:22 +0100
Message-ID: <20240303172622.629998-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709486787; x=1710091587; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q/KeRkr00MXazynYFUnzSHmpkcfpohfGUP4z7ZQhl7g=;
 b=Aeq1ikpcRQ9oPqq2kgk9uulf1dbPGgyIuS8RxiYNkxTypga1OHrqat/8ICDMD6DspS
 anYoRnla+wT/QNyPD1EeVComgwc8OahE8CaqflXabxEO/Ve11S9X+GkcP3Z9VJtA7CYo
 H0cvrLlipacTdtGmjLJpPIui5DVyHa66OEDha/YnLAtnVsAzLg/rIF6wfokRoivVDCvS
 Noi1s2+tcAlGqqiHRvMlD3dacrhdzc90lMExB8XmPdEPJ+UtdcBee3CD1eYpr7gV5pep
 XXmuSCmbjZA2/AmRypzEDqCdI6i7Ynqi/vdEKSrZoYg55avC4j+mKjQNBglGTo/ONSaV
 yQbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Aeq1ikpc
Subject: [Buildroot] [PATCH 1/1] package/strongswan: drop
 BR2_PACKAGE_STRONGSWAN_SCEP
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

scepclient is unrecognized since bump to version 5.9.8 in commit
b79d735139282ecf052dc89d4c221bbd16447112 and
https://github.com/strongswan/strongswan/commit/8716f7c03c6193b1cb53837243177f36280ff4f7:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --disable-nls, --enable-scepclient

Fixes: b79d735139282ecf052dc89d4c221bbd16447112

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy                 | 10 ++++++++++
 package/strongswan/Config.in     |  3 ---
 package/strongswan/strongswan.mk |  1 -
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 576148c4af..5956ffcca5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,16 @@ endif
 
 comment "Legacy options removed in 2024.02"
 
+config BR2_PACKAGE_STRONGSWAN_SCEP
+	bool "strongswan SCEP client tool removed"
+	select BR2_LEGACY
+	help
+	  "ipsec scepclient" tool has been removed and replaced by the
+	  pki subcommands "pki --scep" and "pki --scepca" which
+	  implement the new SCEP RFC 8894 standard that was released in
+	  September 2020 and which supports trusted "certificate
+	  renewal" based on the existing client certificate.
+
 config BR2_PACKAGE_SHADOW_UTMPX
 	bool "shadow utmpx removed"
 	select BR2_LEGACY
diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index f2e597e016..5231e69ca8 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -204,9 +204,6 @@ config BR2_PACKAGE_STRONGSWAN_PKI
 	bool "Enable pki certificate utility"
 	default y
 
-config BR2_PACKAGE_STRONGSWAN_SCEP
-	bool "Enable SCEP client tool"
-
 config BR2_PACKAGE_STRONGSWAN_SCRIPTS
 	bool "Enable additional utilities (found in scripts directory)"
 	default y
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 36cb72f6be..5521fb7dd4 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -33,7 +33,6 @@ STRONGSWAN_CONF_OPTS += \
 	--enable-stroke=$(if $(BR2_PACKAGE_STRONGSWAN_STROKE),yes,no) \
 	--enable-sql=$(if $(BR2_PACKAGE_STRONGSWAN_SQL),yes,no) \
 	--enable-pki=$(if $(BR2_PACKAGE_STRONGSWAN_PKI),yes,no) \
-	--enable-scepclient=$(if $(BR2_PACKAGE_STRONGSWAN_SCEP),yes,no) \
 	--enable-scripts=$(if $(BR2_PACKAGE_STRONGSWAN_SCRIPTS),yes,no) \
 	--enable-vici=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
 	--enable-swanctl=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
