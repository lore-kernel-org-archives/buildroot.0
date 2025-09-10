Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8847FCA101F
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 20:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49A2441878;
	Wed, 10 Sep 2025 20:21:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hCNr8PjE9voa; Wed, 10 Sep 2025 20:21:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B0314180F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B0314180F;
	Wed, 10 Sep 2025 20:21:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D098F234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2B0C61430
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PaUL10Akm-GJ for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 20:21:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D8B4961376
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8B4961376
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D8B4961376
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:21:53 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-32d3e17d927so5193936a91.2
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 13:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757535713; x=1758140513;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=83nvg2kDH87Pvi7uZknqQfIO6q8wiUe102u4kfPlZOk=;
 b=eR1WzwxdLfOZ+5hU1LWxXOSCpOp4P6Lx1CTJ8en3ILtcZRxgJi0cL9a4kKLOb8lpyg
 suFC3HVzEq16mx9ymgpiB53N7aBFWddI7thgCs7/lJTzLuu42GE8j6dh7XzkSu7r6Rf2
 ZSktk6EbXwUZz6rRIZe6XXviH9L85UVdF5H5GNCcn4ToibI4Eh56UvcFO53QO78ZBiaq
 j/cxiGdFpEgFnJw50NjI3qsA7p+HbOm4ypoT/ThxNqanytpaOtr47jo79UECzqSfZILI
 RqyBBxlxtg5iEEwM1ZzSWbnDeRWybxIZXISyWlO7hFRlrs6wpvogP6sIOY6synu6guSa
 aA7Q==
X-Gm-Message-State: AOJu0YzaWTQzZbmXCHspuzCJfJDJrN80iVw7nbjiwp2qJzgikbroNm9e
 GN+sHEYoFqLEYqv8xwenha3Gs9Pwb01qe6OC92tm5jDqa8IR31aPF4snbdtZJGn910tT3aimZmR
 atHAJL0mqUA==
X-Gm-Gg: ASbGnctUxp11DNqI53JDH4UlmdywQx9cNt6kzE1rQ86gfnma7qj36wUC/LJjVDZFmRn
 GGoiB+nBsg/wjg1aehgbmTsyp3OpLzZbSXCnuvTEry9K9w5nDplujovZz7FTTP0UyJs4bXG6vFt
 +JRF7qJMk6pjr5TvntW9Ddvh1JjM9J9xFEkchWKmaTRyuf2KWNdZ2L6bXX5STOBl0r59x/+3s7C
 iRSJxGL5umD+f6igdRBIAvVU1Fr1atiAzt7Wp+jG0ENUgTcIgdNvou5S0nXfOX5fJrWX7WVmJS3
 PLz1pY5I5uy/HwAUHKZSPHfFLOg4wmAj5599NZuCt0fSOvglMPWlVTZ+78dUpZtKSPtJ1Vs1OgS
 7SwGVbySK8m+BYQ/kFrwO5owWulwjp+2OrG6YLkcruHSa7P41
X-Google-Smtp-Source: AGHT+IFEWY9yWxklQgy7HD+yEo54fNDownOU68DYCkcuHFIbBiaTPjmFhCERHi678UqX/KWicbGK/A==
X-Received: by 2002:a17:90b:3d81:b0:32b:8edb:12ce with SMTP id
 98e67ed59e1d1-32d43f18b0bmr26259802a91.15.1757535712889; 
 Wed, 10 Sep 2025 13:21:52 -0700 (PDT)
Received: from localhost.localdomain ([185.81.124.170])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32dbb5efe7asm3538296a91.17.2025.09.10.13.21.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 10 Sep 2025 13:21:52 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 10 Sep 2025 13:21:37 -0700
Message-ID: <20250910202138.13648-2-christian@aperture.us>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910202138.13648-1-christian@aperture.us>
References: <20250910202138.13648-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1757535713; x=1758140513; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=83nvg2kDH87Pvi7uZknqQfIO6q8wiUe102u4kfPlZOk=;
 b=hE5EpttnNaTNAeZCyApAIJOpwWG3y8/AUirEOSgoYlOR89DBb8bejgZ+thhxCkNdcO
 geoFM49Bu2OHk9OqqDzA9cW9NCeVVr0F7IBuLIimtHImwZItR8vWy/zipBtaCiGm/t3M
 WZL/5YWoKLa/BgyUBFgU8rAuyFv7+Ubvnm1VHcS3mmFU0szsdVrfHQ+AFZTTs+9KcF2J
 gsWFKfdiLZouElw1un+Fn9ZnziBd2xeQLIFRbpgamxzF5raEsVIded4rh/fEDFi14ZJq
 zd47d8K/Tn8Zk8RjOEX4GgfweyjKC4LQmh8Z9SbfgUmNqAy/6qV3giILxm2I2sHaYk8W
 idkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=hE5Epttn
Subject: [Buildroot] [PATCH v1 2/3] package/go: bump to version 1.24.7
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The latest Go release, version 1.24, arrives in February 2025, six months after
Go 1.23. Most of its changes are in the implementation of the toolchain,
runtime, and libraries. The release maintains the Go 1 promise of compatibility.

https://go.dev/doc/devel/release#go1.24.minor

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/go-src/go-src.mk |  2 +-
 package/go/go.hash          | 16 ++++++++--------
 package/go/go.mk            |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/go/go-src/go-src.mk b/package/go/go-src/go-src.mk
index c1f11a2262..6163e1d93f 100644
--- a/package/go/go-src/go-src.mk
+++ b/package/go/go-src/go-src.mk
@@ -16,7 +16,7 @@ GO_SRC_CPE_ID_PRODUCT = go
 
 HOST_GO_SRC_PROVIDES = host-go
 HOST_GO_SRC_DEPENDENCIES = \
-	host-go-bootstrap-stage3 \
+	host-go-bootstrap-stage4 \
 	$(HOST_GO_DEPENDENCIES_CGO)
 
 ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
diff --git a/package/go/go.hash b/package/go/go.hash
index dc88e9beab..8b61824d0d 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  e1cce9379a24e895714a412c7ddd157d2614d9edbe83a84449b6e1840b4f1226  go1.23.12.src.tar.gz
-sha256  3b2fd446e26642555d1446a38ccbefb2a30bba3179d3ef132ed64d3c63b0c42a  go1.23.12.linux-386.tar.gz
-sha256  d3847fef834e9db11bf64e3fb34db9c04db14e068eeb064f49af747010454f90  go1.23.12.linux-amd64.tar.gz
-sha256  52ce172f96e21da53b1ae9079808560d49b02ac86cecfa457217597f9bc28ab3  go1.23.12.linux-arm64.tar.gz
-sha256  9704eba01401a3793f54fac162164b9c5d8cc6f3cab5cee72684bb72294d9f41  go1.23.12.linux-armv6l.tar.gz
-sha256  1a7cc5f7baeaf39125dce5d660a39438e7f0e04d13d3498590d240aae976b565  go1.23.12.linux-ppc64le.tar.gz
-sha256  2f43708aa0922d692da0a1fc775475c343907610bec77002de1bbe37601ea338  go1.23.12.linux-s390x.tar.gz
-sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
+sha256  2a8f50db0f88803607c50d7ea8834dcb7bd483c6b428a91e360fdf8624b46464  go1.24.7.src.tar.gz
+sha256  1bdf0441ff9c50cceef289a72efecbb6bd60aea545aa9412ef85d8b12199c741  go1.24.7.linux-386.tar.gz
+sha256  da18191ddb7db8a9339816f3e2b54bdded8047cdc2a5d67059478f8d1595c43f  go1.24.7.linux-amd64.tar.gz
+sha256  fd2bccce882e29369f56c86487663bb78ba7ea9e02188a5b0269303a0c3d33ab  go1.24.7.linux-arm64.tar.gz
+sha256  eaff4aace921075da371b91a5911f0c0fbcb6f712a527a25113f971944b78c36  go1.24.7.linux-armv6l.tar.gz
+sha256  e50462c5ad6ae7600eed24414729d0e0ab63d166ff6e5da550afc3010dfa084c  go1.24.7.linux-ppc64le.tar.gz
+sha256  48caa1c5011f625bada49adea12a9693ffe9813196451e2d2b9120b3add50784  go1.24.7.linux-s390x.tar.gz
+sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 69ca746783..ad4ae35f06 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.23.12
+GO_VERSION = 1.24.7
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
