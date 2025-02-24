Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA5CC021BB
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 16:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1145440BE6;
	Mon, 24 Feb 2025 16:27:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9q7MaDgNj5c; Mon, 24 Feb 2025 16:27:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4FBF40BED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4FBF40BED;
	Mon, 24 Feb 2025 16:27:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3134B76C
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 16:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FF3B40BED
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 16:27:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7PQYT1O9AdKB for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 16:27:42 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::644; helo=mail-ej1-x644.google.com;
 envelope-from=bram.vlerick@openpixelsystems.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BC77140BE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC77140BE6
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC77140BE6
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 16:27:40 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id
 a640c23a62f3a-abb8045c3f3so568998066b.2
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 08:27:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740414458; x=1741019258;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mShXC6HBkUdLflAaumk6qrhxz92+WA+04Gp++5VT0lk=;
 b=pmc2KzW1q+Gckvj9lG3XWTWE6ZKipSJtD4IlVemPjER+5eP/wNFFHdhD4Bft253Y3u
 2j6uKzR7SyyW6B0+Cglvr2Ok8ZU/k+QswoyntTUwHZZtTqDO/SkSqQ3IeqBtm5auZClp
 D6sVKnV5GvUam2o6FXRMffA0Btaw1MPKiuirQUet45bbofYByTFFI1F1YgHq13Zfn1df
 gGzI91DSiBTWJN81HJtL5Ke6XNDXQypCKXwUg1Cp/Raucx7TXcZ8Hnl7bIDRkzHfBBNA
 mncWoaFmISxo6nXTY2huB0+oyxlqXZcX1y1jDqmzcaVidDJtDDRRdcsX0j1I01UUY19v
 xETg==
X-Gm-Message-State: AOJu0Yx8e962vb6erWPsWx6AKH/eRqPhnBT/etNc36+XhldDuk47hed/
 MpVz44F+DF/pyoQdA2Up1OSIZQ/hcYWD4HxBkaNVgvHWd77TPyP593eMSadxXJ0=
X-Gm-Gg: ASbGncvs7iedlKV67BsHTEFwKa+OT6bgLy/BFUwaCh8PfJ/BeCx7mUq6syzrOt1679O
 Up2p+R3luWyINFT80iNOKTLZCI+nQYBzBsdT5xSCYTPydjlij+V4ow00L3daAGqBHkqmXzUyWwx
 m9TC1t9KTozQcmprKW0sTFeW1myiJZrA1zmfd0CNIae5IPb2dMoFg+37EyEaoPnIzNFfDpE1lsE
 eSfo1umXzvP+iDN6TJCk82Nk1We6c7sjDA/zwYixwrUWoNWvVT29gKJXV2FXttHLK2CxTMmbILA
 xuz0qyf+Iy0rjCAJhVhybr2e9zmrwqGA60etY/tWCmoRZ1jjtoRsJ9Gcm1E8Pj+UHldR7otyni7
 Gsy41GLrOyQx/+XRP
X-Google-Smtp-Source: AGHT+IE8sNdGcd2mic2iDAFLeFUNms7FrWYttGHTdYXJMKmLFysM5W7lLpQKAcI+5OrDQCxyvUZR2w==
X-Received: by 2002:a17:906:30cf:b0:ab7:d537:91cb with SMTP id
 a640c23a62f3a-abc099bc179mr1014960766b.7.1740414457698; 
 Mon, 24 Feb 2025 08:27:37 -0800 (PST)
Received: from [172.0.1.2] (253.124-78-194.adsl-static.isp.belgacom.be.
 [194.78.124.253]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abec0324d4bsm142985266b.108.2025.02.24.08.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 08:27:37 -0800 (PST)
From: Bram Vlerick <bram.vlerick@openpixelsystems.org>
Date: Mon, 24 Feb 2025 17:27:35 +0100
MIME-Version: 1.0
Message-Id: <20250224-systemd-ukify-v1-1-e42872af25f6@openpixelsystems.org>
X-B4-Tracking: v=1; b=H4sIAPadvGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMT3eLK4pLU3BTd0uzMtEpd46TkpCQDC1MD81QTJaCegqLUtMwKsHn
 RsbW1AElqbWNfAAAA
X-Change-ID: 20250224-systemd-ukify-3bcbb08507e4
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>, 
 Bram Vlerick <bram.vlerick@openpixelsystems.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2600;
 i=bram.vlerick@openpixelsystems.org; h=from:subject:message-id;
 bh=ReRPtCJLeaQc9teCiKTFBFDkFOFEfmjcYNfU/QdaPBg=;
 b=owEBbQKS/ZANAwAIAblauka9BQbwAcsmYgBnvJ34UdwSVZ9aBbuQtBw0r+nXM6LwB/8ntTX2r
 QU2S9CA4K+JAjMEAAEIAB0WIQQO7PtG7b77XLxuay25WrpGvQUG8AUCZ7yd+AAKCRC5WrpGvQUG
 8J1yD/9wpwYuWKqsLJ6JB4+UU228SkL9w9GOp/8Ptrqsu75Z4h0GxThMRq9XgLRXtZ8sORgrRiK
 EsRti2pH+UJiNYO/8t7MghNG3d+ZjKK18NudX65/bBzLc+l7eEyPHgXT1/eKj2z8Uk990V02r5T
 xE1NECPnRgzMkDolp8k70Lf8DcMzR/elpU6YvlwiMhKYlZOwGgnXX09yh0RCypyUtWCri6O1b0m
 mUQvA624pMBkUXz8U2VAQH4PDGmhkBTbV0FLTIlDhP4JsGTGheAJY+68R49rUi6F1vDATyvSpF4
 dn2ovi4BUonPs0BIsFZ5bc9DknNIZoFNwGMom/3YO1e9uJqQn32GKfj68aM+4U0ayY7zmEExxlP
 J10KV48CWvCrkBPrCZNpZ+pLauH2r2mObqNtUcaIPny+X1/S+Thhfc2viBwR2KBY6IALD+LuiMn
 +xe5TAx0sy9QhBnDSvmJaXr2zbOzDXRrq+NZ9ddoCgVYk48KEOuKw+jzOAYCo7HCTfneOSsx7Z0
 cuH/VxSiJRXVl8dfp7Vp0j4lmTrb102t32zcoF5ej/kjrxWZVw18/dx17YfcvAK04XuqSEJP5q3
 CZXXZi/4C01T9zCiR6Mi0WAfSUD9zMaSxNyh3LINv/vbGoDCvWNBiCObHzGwcXLjy2X6YoTY0p4
 jkC5zS1VFQ2OV5g==
X-Developer-Key: i=bram.vlerick@openpixelsystems.org; a=openpgp;
 fpr=0EECFB46EDBEFB5CBC6E6B2DB95ABA46BD0506F0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openpixelsystems-org.20230601.gappssmtp.com; s=20230601; t=1740414458;
 x=1741019258; darn=buildroot.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mShXC6HBkUdLflAaumk6qrhxz92+WA+04Gp++5VT0lk=;
 b=AvR8eWLOegiGCQfpDFbb2HPdgTezIN9h+LUk69hqW/bAb3g0PBE4OWoGkK89+/Iglk
 mXHYznO/Sqeu3QMlowodwuhubp0wZN+8ekN/uQqH6OsYlcqxQv/Ifv3SEzO7wkrakpSQ
 M53K1IpMq1YtFgom+Xu7SQ7n7anLWpvlvFQ+AC12xlAtQvqnllKLsk0KOe1I3xk+aTZL
 1ZDb9sRfzNCAanSKDVkuSYF/iSaIcOlY5xQZD+e9b4T9l9UqwuI39PjfvHyQF4qcfWo5
 eY2O42UhmIcN4HOS6xKarjwgCsr1OxQS7WFF3y4jWyfSrm1MqH/ttMWLPu9tWdUdkdVn
 PxcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openpixelsystems.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openpixelsystems-org.20230601.gappssmtp.com
 header.i=@openpixelsystems-org.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=AvR8eWLO
Subject: [Buildroot] [PATCH] package/systemd: add BR2_PACKAGE_SYSTEMD_UKIFY
 option
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

Add option to enable or disable the build of systemd's ukify tool to
create unified kernel images.

Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
---
 package/systemd/Config.in  |  7 +++++++
 package/systemd/systemd.mk | 14 ++++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 851b91aeba70d0726cdc1ea411d7aca017f8fe68..eaeb245bb51f8ae6276273ef546115b1c1ae0f08 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -164,6 +164,13 @@ config BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH
 config BR2_PACKAGE_SYSTEMD_EFI
 	bool "enable EFI support"
 
+config BR2_PACKAGE_SYSTEMD_UKIFY
+	bool "systemd-ukify"
+	select BR2_PACKAGE_SYSTEMD_EFI
+	select BR2_PACKAGE_SYSTEMD_BOOT
+	help
+	  systemd-ukify is a tool to generate a Unified Kernel Image
+
 config BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE
 	bool "enable journal remote tools"
 	select BR2_PACKAGE_LIBCURL
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 28091a72a6d1d7d91fa18d4fe16c637c2112571b..50c466a105b808d0cf15207cf53e9fc4c48bde17 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -100,7 +100,6 @@ SYSTEMD_CONF_OPTS += \
 	-Dinstall-tests=false \
 	-Dlog-message-verification=disabled \
 	-Dtmpfiles=true \
-	-Dukify=disabled \
 	-Dbpf-framework=disabled \
 	-Dvmlinux-h=disabled \
 	-Dumount-path=/usr/bin/umount \
@@ -664,6 +663,12 @@ else
 SYSTEMD_CONF_OPTS += -Defi=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_UKIFY),y)
+SYSTEMD_CONF_OPTS += -Dukify=true
+else
+SYSTEMD_CONF_OPTS += -Dukify=false
+endif
+
 SYSTEMD_FALLBACK_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
 ifneq ($(SYSTEMD_FALLBACK_HOSTNAME),)
 SYSTEMD_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
@@ -978,7 +983,6 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dinitrd=false \
 	-Dxdg-autostart=false \
 	-Dkernel-install=false \
-	-Dukify=disabled \
 	-Danalyze=false \
 	-Dbpf-framework=disabled \
 	-Dvmlinux-h=disabled \
@@ -1012,6 +1016,12 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dlibfido2=disabled \
 	-Dpcre2=disabled
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_UKIFY),y)
+HOST_SYSTEMD_CONF_OPTS += -Dukify=true
+else
+HOST_SYSTEMD_CONF_OPTS += -Dukify=false
+endif
+
 HOST_SYSTEMD_DEPENDENCIES = \
 	$(BR2_COREUTILS_HOST_DEPENDENCY) \
 	host-util-linux \

---
base-commit: 544249ff7761db2df61783c8731e834574df957a
change-id: 20250224-systemd-ukify-3bcbb08507e4

Best regards,
-- 
Bram Vlerick <bram.vlerick@openpixelsystems.org>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
