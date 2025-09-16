Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BBDCAC597
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 01:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 257528148D;
	Tue, 16 Sep 2025 01:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sycavF8w1xpq; Tue, 16 Sep 2025 01:28:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44E4B81494
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44E4B81494;
	Tue, 16 Sep 2025 01:28:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F581199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 01:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B9AA60A99
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 01:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 89gur67R1j8R for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 01:28:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 641DC60A95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 641DC60A95
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 641DC60A95
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 01:28:09 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-424081ae9f2so6717255ab.0
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 18:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757986088; x=1758590888;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LyOv83znOsEtqGoTdHJTYLVkIttYnqJdiN9Fv9tkhhM=;
 b=SUK9iMU0QsS+fGJ3TS7mRpAnUhxUB1JPalQE0c26WU716ni+632O6u83gfdHSgLCHx
 lV5SsqQgb8oeVdWjqT6ZE9eKCdJ6iZVfA9Y3t3C0uR8WYkKighs1FlkZGnM+j/mv7H27
 /G+vvCenTaCb2VWOkVk6dUMLaK5dT71Vldvjcx6v65HBEVFLBUCToXp8/2eQuBolv2dB
 r/zSzsZ+UN3nJeD2yo423wcVK3npJ8VCztO+YYoKxoNLFJ/QHFLqXn7aowgaN07W4tYy
 Y4+Cjmz45A/OTyNDBMMl4InNLUtNOWMq7N60Du/PKkrJ41laR8hG+5FQbXAzp4oJqsez
 xX7Q==
X-Gm-Message-State: AOJu0Yy0Xtc+Hl8uXASZE9fyTi51xFWqcIf1lwDy1PUw8s5B9ulIF4Oz
 ipDe2i9qLG/eNFNtgo1e3BVh3+pcTJIS+M9yjS0DVsPoG4wDeHWh0XKy3koAMQ==
X-Gm-Gg: ASbGncsEDbZVQkaE2jI7+M+fhMexjTtTf6Da1nkyaa/+NFvFcne0BdwYLWx1HnB6u51
 rVoD4VrHWj/22pToH6DpSQg8+0lHGiG39wULpSxcyme4F49tHNqF71aUE0fvhyUeVKrLDJMZZUI
 Ids+67mYIEZyGUJ0bH49QX6wb3wYH4FEJP+BpgEfLqbfb7O1ahB0UFMYDesgmSRBmMxSG4L8Hkv
 mjbdg6nelONBJvh3R8QBozRfXoiDZT2Mot/UmQfNAe7CWv4e66Sd+aBhgqnihUNg5PhPA6P5wMq
 2yUlpO4pDEft4s4X2+kymxn9iH6rebFYCdaPcIs0viyCcfHDdMIJ87gQgJOuOJJhMCl3V5/ZXZO
 6VFurGdIukJlf1Na+8z6Iz0xHEvGUK6PsamDQ3AJIgVWh0ocA2ZLTFACRCWNxKyEjqdggsFcrWa
 GD
X-Google-Smtp-Source: AGHT+IHs0wix/4Z3Jed6tMFGVkhYn6PoOqGBwIjoMYmPdi2UznQb7BxmcDyUmqMD7adTvZgF+fVCIg==
X-Received: by 2002:a05:6e02:b47:b0:41a:85a4:cbe2 with SMTP id
 e9e14a558f8ab-4209d31b91emr133589125ab.7.1757986087689; 
 Mon, 15 Sep 2025 18:28:07 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5120f738582sm3480403173.9.2025.09.15.18.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 18:28:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 19:28:06 -0600
Message-ID: <20250916012806.2581367-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757986088; x=1758590888; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LyOv83znOsEtqGoTdHJTYLVkIttYnqJdiN9Fv9tkhhM=;
 b=hNYScmPuDJOGPK9VCt100xcqom2Z9B5ogESo/Hk6FlYHOFOm+6nfOsqTUE+yTipKVj
 xkfYOTk3eKLzojl8STObCN9dHJdXSMC3C7hljTSjcjR1JNhIvQK6EgPoKWsst2jfGlIB
 tm2PoR0kTIB19cJYZ5DZagKOVsHXtSflkwAkNmt2uVZf37MZ9GuzZqTrdbh2LJY4sKvQ
 fO8rAwZyP6s7UztlhPNuAqhzwOBRdrd362ahqYvVl0ErXVRWfioQn/rShW69AiC4ceoZ
 SYby2LFJNIS8pq39ioYksCU0S1Ruo4lBGXLiE1brEe61MFN/mUp1AzDhRTpXN08oj6FJ
 23+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hNYScmPu
Subject: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 1.9.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>
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
index fd7ef77adf..f439f5d9b9 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  344b213648e4954b157132ba8a3b5158576af7499bbd68712f42c5d314a13b40  python-maturin-1.9.1-cargo4.tar.gz
+sha256  32ed28b14691d95daf862ec78cc26fcf01ce55eafd4b22b0c27c02f8d4530806  python-maturin-1.9.4-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index 313dedf114..aab4ccef6f 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 1.9.1
+PYTHON_MATURIN_VERSION = 1.9.4
 PYTHON_MATURIN_SOURCE_PYPI = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/94/f7/73cf2ae0d6db943a627d28c09f5368735fce6b8b2ad1e1f6bcda2632c80a
+PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/13/7c/b11b870fc4fd84de2099906314ce45488ae17be32ff5493519a6cddc518a
 PYTHON_MATURIN_SITE = $(PYTHON_MATURIN_SITE_PYPI)/$(PYTHON_MATURIN_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
