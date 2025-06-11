Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1F4C61CE7
	for <buildroot@archiver.kernel.org>; Wed, 11 Jun 2025 06:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C72E8131A;
	Wed, 11 Jun 2025 06:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wzHVC8wn_MfD; Wed, 11 Jun 2025 06:01:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C18E48130E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C18E48130E;
	Wed, 11 Jun 2025 06:01:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 066BE183
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 06:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E11578130E
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 06:01:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TXlf97BdKWet for <buildroot@buildroot.org>;
 Wed, 11 Jun 2025 06:01:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DCEC780E73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCEC780E73
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCEC780E73
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 06:01:05 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ad891bb0957so1032983666b.3
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 23:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749621663; x=1750226463;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ABEydESaPENjbCu5UaAAGD/soQSl4IrcUJOfH1eqYLo=;
 b=TYGzmYOjfkRqCuANoMrqIS9mtHC6c1/3teGEgFSK0bse6aYumVV0YStm+wupErUNaI
 gYMS5IOckb5YVNKH34hOW8il4RB+y1uxw+USNa6oI8wMhdV5CKPaEZJeaKKvwNBRMst/
 Az2oqV3jUanQQNbcOFI6GphYKEGDDo6JlzKIfe1fDYIUpkSilsH/BwUOMXqh0kpFANmB
 oTNi0kd0n73fngIWQ6vsUZx8PCU0S2TUVeZaIeNBLfZrzi0tau+FhM9DOVtcN1irHBmj
 eI6lmUDl5PktR+mtSbZG4qj8WGrGtQBcrACvkR18GcI/xwqda4KUb52BsENAQyvd5fXb
 dfeA==
X-Gm-Message-State: AOJu0Yz5TkZKngRcxL7/iSMkt+ZNBoq2sePnzohNaoZDVtVJDKDoAJVd
 PiwWfcT9gYNohy64kVHBhxAV96TEu9McfdsweA0ZDtcIH2wMl6DVm0NOi9p4PA==
X-Gm-Gg: ASbGncvU7/b9KJd/TAG+aGJnAoV0hTqkn0Zefi3b3LPOCqCj3be/qVbVy0w8rM0T7IU
 bXQTXOof5F1DXaGL0q8l0f6IEe48n3+m18P4kjzgiha8xvgsg2POevGAF7s7SuOPYBUANMFCHJ/
 TdVY6NeLlWlH32OhsCb2sZnQS5Dj0Ir3jlv4Xz4Xyb0q+rQuunEGJHCiKDENCAPAGIRlcO95+5g
 oalJoIR3eVYQ+ASQ8zdmq7p2k9GO2ntDa8Dz16lPYFVoROED+u5kbdbOKl/FAT1j2h+yUzFMzcD
 WLnw0T+lut3Lib3xtAj2DIosITdUC4SGxZCQOpJSYs5c3iqcWG2cW3b+fk5eS6N05XAoeqe2GRc
 DSAKT1SBFpP9CK7Xu2mHGSGjlo/pK94uaaY5KOwW34q2PCOQm6eO7qA==
X-Google-Smtp-Source: AGHT+IEcDmyz6YbrcwdyIvSthfQTXBHsIIaAXJ1MaBMa4JhFhBSayLoDIxRaz5+dh+3XvHertIGdQA==
X-Received: by 2002:a17:907:9803:b0:adb:4917:3c08 with SMTP id
 a640c23a62f3a-ade896e5ecfmr171189566b.34.1749621662579; 
 Tue, 10 Jun 2025 23:01:02 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1dc392b9sm827204466b.136.2025.06.10.23.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 23:01:02 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 11 Jun 2025 08:00:58 +0200
Message-Id: <20250611060058.3003917-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1749621663; x=1750226463; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ABEydESaPENjbCu5UaAAGD/soQSl4IrcUJOfH1eqYLo=;
 b=JVp9+8UJMIVELkDal15gKWGhPWARnDBhQS4So4Wnm7jkZvqSisK1PIlxr7WA4Gh3qz
 05wmTyIa2ArDC0bQwQ90kWiWqj/eaw4EhoJnHDNtiOkgypDo1cg+rOffLGgvxDb6CVuA
 ppYmtHRl8FeXcfxQd4Y70dloIcNUw+kA5A5XJyKLFwjDrl/MTzHPq/Je2CR7zykzD9f+
 rhgXxgz50+6sg+JtNPetgKW4QKwoLIVJrjoUThi6r9suP66JWxFV73TJGI3umNE8Eofq
 EPq5cuZ8knBrcnjE8Z68JjTj2KrfhiTh+01YzX/aCCNssk+0mU4LUOs+6o9YTiyj7sGm
 Hf6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JVp9+8UJ
Subject: [Buildroot] [PATCH] package/cannelloni: bump to version 2.0.0
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

For change log, see:

https://github.com/mguentner/cannelloni/releases/tag/v2.0.0

Bump GCC to at least GCC 8 due to the C++20 requirement.

Add TCP protocol to the package's description.

Fixes:
https://autobuild.buildroot.org/results/87d5ab39a84c51f340875ae365d4f39439e81645/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/cannelloni/Config.in       | 8 ++++----
 package/cannelloni/cannelloni.hash | 2 +-
 package/cannelloni/cannelloni.mk   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/cannelloni/Config.in b/package/cannelloni/Config.in
index e137e60c60..a2a15c0274 100644
--- a/package/cannelloni/Config.in
+++ b/package/cannelloni/Config.in
@@ -1,17 +1,17 @@
 config BR2_PACKAGE_CANNELLONI
 	bool "cannelloni"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++20
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # lksctp-tools
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lksctp-tools
 	depends on !BR2_STATIC_LIBS # lksctp-tools
 	help
-	  A SocketCAN over Ethernet tunnel. The tunnel supports both
+	  A SocketCAN over Ethernet tunnel. The tunnel supports TCP,
 	  UDP and SCTP protocols.
 
 	  https://github.com/mguentner/cannelloni
 
-comment "cannelloni needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
+comment "cannelloni needs a toolchain w/ C++, threads, dynamic library, gcc >= 8"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
diff --git a/package/cannelloni/cannelloni.hash b/package/cannelloni/cannelloni.hash
index 107415b0ac..625e43d157 100644
--- a/package/cannelloni/cannelloni.hash
+++ b/package/cannelloni/cannelloni.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  de44b7e327fbf38883f46e51a5afd07de5144f2e44c5f42b7f2f0741165f0b13  cannelloni-1.0.0.tar.gz
+sha256  3dde63727549d4a39154e78b95f4a5dad96af236ca6cef531f347c0b923c74d5  cannelloni-2.0.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
diff --git a/package/cannelloni/cannelloni.mk b/package/cannelloni/cannelloni.mk
index f97a091760..7978cfccf5 100644
--- a/package/cannelloni/cannelloni.mk
+++ b/package/cannelloni/cannelloni.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CANNELLONI_VERSION = 1.0.0
+CANNELLONI_VERSION = 2.0.0
 CANNELLONI_SITE = $(call github,mguentner,cannelloni,v$(CANNELLONI_VERSION))
 CANNELLONI_LICENSE = GPL-2.0
 CANNELLONI_LICENSE_FILES = gpl-2.0.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
