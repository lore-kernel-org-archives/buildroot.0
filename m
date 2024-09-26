Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18794CDE02A
	for <buildroot@archiver.kernel.org>; Thu, 26 Sep 2024 18:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1D7B40167;
	Thu, 26 Sep 2024 18:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B__vNorUjhOv; Thu, 26 Sep 2024 18:15:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C32A40230
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C32A40230;
	Thu, 26 Sep 2024 18:15:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 88CAD1BF2FC
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 18:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77D2F813C3
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 18:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r6v9SQ7yN721 for <buildroot@lists.busybox.net>;
 Thu, 26 Sep 2024 18:15:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 960DF81309
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 960DF81309
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 960DF81309
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 18:15:11 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3a1a7c0f612so5644665ab.3
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 11:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727374510; x=1727979310;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o6jNSUAyxiMQI3Tcs1qfs++yuCqIPeKjeZeRvQoJiBI=;
 b=dznAuz40KTqkXL+qdNZu09yJnDjlWbAqWKKx3/Onjs2FOMf7i2sC3Mdarf84YtrNX3
 PrXbwdO3E6QmcFTWPR7ze2mLGBZrll7bOa/4On3XK3VVlD/uS4I9duPFlhT95pL6AGgp
 KFdBgVWwwdtp/ibmYlDOeHPD3CP2ivkBLiYszUvX3NejokVivLLj1VV1cXigP+NslGxo
 zmBDXI866sp75pKLmrPzMohtLa79bV79Oedc+zh0lymPjQvFKqJvzRXOGmFCXZ+LQETd
 y7A0d98xh7ojqN43rvo1b+H10XNMDdnvwr3rZ+9RySD9HL6fN3hILQ0QF+n6bkr0ZdFX
 EAhg==
X-Gm-Message-State: AOJu0YyOl0v4WJB+mahpQBoGAfY2jOBK+9O/W91Le6QbimyiJgykDJK1
 AxfMECJ/EzWnd2PcvpouLb6jd7t/1HEDQcap6CZdhQR0NIRztSXJI8MNgQ==
X-Google-Smtp-Source: AGHT+IHeXdWli/jwU/MlikYRMj3ekfUiOoxBZw2GALD544ZRTMbAxTnZASUAaFiS4VK3BblAOAs7VQ==
X-Received: by 2002:a05:6e02:1562:b0:3a0:a224:eb3a with SMTP id
 e9e14a558f8ab-3a3451650famr3054865ab.6.1727374509530; 
 Thu, 26 Sep 2024 11:15:09 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-34.hlrn.qwest.net.
 [71.33.156.34]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a344de1f99sm589545ab.53.2024.09.26.11.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 11:15:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 26 Sep 2024 12:15:07 -0600
Message-Id: <20240926181507.196624-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727374510; x=1727979310; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o6jNSUAyxiMQI3Tcs1qfs++yuCqIPeKjeZeRvQoJiBI=;
 b=kM0tYvzlsuG1VjyZTWUG56YF34jgjBH7YaMcWV55HJXaGtQzuAEzstOEHQfj7Ry5Fi
 1RUEn+nPHRtGXkz7cRN5D8IOppPFFFXjzp+nFOpiFKEnVhgYnzQ59gPOhnz5r4as4mLW
 ey2UGZUfgrgH0p7pxdfHov4OHvFmqmMem1sGqPcBRyd25mo7ktugO8SvaQvuFXHPkNk9
 FB439Bop7Xb75jpm0oVjsfRVQi7htlKaIF3wFfLEUax1fiI8yx8AKD3zi30HfJSXTh7F
 cCSFAN87TAa6CIdykCcaHlyrz7pYrUAmgVF6kQjSkCPQHT1McDM5X/pfOJ0NdTV13Zvy
 RgZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kM0tYvzl
Subject: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 1.7.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index 2b601d6ee9..218b789295 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  92c5fc2a24f32623a6994334b523a587dca63ebb5b46ae14a255a2ebc25fd3f7  python-maturin-1.7.1-cargo2.tar.gz
+sha256  1595a7bdc135888ed0f2c595819f010738196392e3d42569af4bdfe718654899  python-maturin-1.7.4-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index 76f136826a..2e59538212 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 1.7.1
+PYTHON_MATURIN_VERSION = 1.7.4
 PYTHON_MATURIN_SOURCE_PYPI = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/1d/ec/1f688d6ad82a568fd7c239f1c7a130d3fc2634977df4ef662ee0ac58a153
+PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/51/28/31a650d9209d873b6aec759c944bd284155154d7a01f7f541786d7c435ca
 PYTHON_MATURIN_SITE = $(PYTHON_MATURIN_SITE_PYPI)/$(PYTHON_MATURIN_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
