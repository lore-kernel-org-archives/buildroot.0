Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF351C83F12
	for <buildroot@archiver.kernel.org>; Mon, 28 Aug 2023 18:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5079F4049C;
	Mon, 28 Aug 2023 18:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5079F4049C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id knLl9FlnmgkN; Mon, 28 Aug 2023 18:56:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9DEC4054C;
	Mon, 28 Aug 2023 18:56:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9DEC4054C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 744411BF4E2
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 18:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D78840A5B
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 18:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D78840A5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tydv1r44bvek for <buildroot@lists.busybox.net>;
 Mon, 28 Aug 2023 18:56:34 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 257F04041C
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 18:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 257F04041C
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1bc8a2f71eeso20590845ad.0
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 11:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693248993; x=1693853793;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=79xyMySM7F45IDXOM9Hiw/PYJ6UYgEnaFMTKbRTJoTg=;
 b=Cbu1q7ZkgAJ7Ctl1ued11tyY1fMhzb7yrldE9iXPUF4y8nCSYoxgQox4u5CQ3hb41c
 3yc0rQZ4v6qYB9vnW5GsWGwiCGWiIquACOS/zyrHAzyhOOa4A3sGA28yZun6nHffN5jC
 ehJ5gSCwULoPn8Nehnn+Ui/zdLUQ57sG5uL32v3tKmNpxSNlvsD6Ct+ai4IXzfHCOrnp
 QnyTfQN4e9rkaWAxouQpO10PVaZEL9ZJoHOvcNLdBkdmjj9oaEAtpWv5lZxiLol9bbjp
 s+FT/ttU+PKGfxiL5To62+VnX8H5Wt8wYUTa10biS9/MRTXl2ppwWiOi3OzuUz+GxjlV
 2LGg==
X-Gm-Message-State: AOJu0YzF1SS8qP3qsVsDuF3hISZRkwUrVnaba4qzQOFmuHYlDAgTwrhW
 CeZJyFGZOcD/pY00tps7rT7UfU6TSyE=
X-Google-Smtp-Source: AGHT+IEelsjiouW1D9942lz2TL8tay72E7f9QFqX+V1qglBWK6pcyTM9WxeXTd+5hu6MvO4nBKHZBw==
X-Received: by 2002:a17:903:41c8:b0:1b3:a928:18e7 with SMTP id
 u8-20020a17090341c800b001b3a92818e7mr25303264ple.59.1693248993058; 
 Mon, 28 Aug 2023 11:56:33 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.202])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a170902868400b001b9ecee459csm7718798plo.34.2023.08.28.11.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Aug 2023 11:56:32 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 28 Aug 2023 12:56:28 -0600
Message-ID: <20230828185628.946326-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693248993; x=1693853793;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=79xyMySM7F45IDXOM9Hiw/PYJ6UYgEnaFMTKbRTJoTg=;
 b=SXm2xEG5W52E5aMH+4yb4THnWwFs2gsyaOYBsSfOuFR8SO1KU+Q22v3DYhqLm4ypV/
 VTeEX4qQ95R1izYVU0eRr2DKBH/vBlA9xBZjCVLi0awejqD8VaSp3YhioCuTTDG2G9zD
 vkpsRNHABbfM0A4EVWLCROCvKidUIFNDYbFSAQc55dQR5L8M6SWfhTcEhkOmsJehnbz4
 VIIlpQDE1oab74E1O4ORzI/jVAwESJlm1PGzg9f9+BxgTgK+yYrK2GW9vTUVCNn4Tv2W
 m5LQ8n7VWo6HKYqkljaFm9JKz6AJY9bU06Af8h/T57NuXRJ2OPA9AqYKVRAWGC104CfU
 lM4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=SXm2xEG5
Subject: [Buildroot] [PATCH v2 1/1] package/openjdk{-bin}: security bump
 versions to 11.0.19+7 and 17.0.7+7
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
Cc: Tudor Holton <buildroot@tudorholton.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

* CVEs
  - CVE-2023-21930
  - CVE-2023-21937
  - CVE-2023-21938
  - CVE-2023-21939
  - CVE-2023-21954
  - CVE-2023-21967
  - CVE-2023-21968
* Security fixes
  - JDK-8287404: Improve ping times
  - JDK-8288436: Improve Xalan supports
  - JDK-8294474: Better AES support
  - JDK-8295304: Runtime support improvements
  - JDK-8296676, JDK-8296622: Improve String platform support
  - JDK-8296684: Improve String platform support
  - JDK-8296692: Improve String platform support
  - JDK-8296832: Improve Swing platform support
  - JDK-8297371: Improve UTF8 representation redux
  - JDK-8298191: Enhance object reclamation process
  - JDK-8298310: Enhance TLS session negotiation
  - JDK-8298667: Improved path handling
  - JDK-8299129: Enhance NameService lookups

For details, see the announcements:
https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-April/021900.html
https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-April/021899.html

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
v1 -> v2:
  - Add missing openjdk-bin updates

 package/openjdk-bin/openjdk-bin.hash                      | 8 ++++----
 package/openjdk-bin/openjdk-bin.mk                        | 4 ++--
 .../0001-Add-ARCv2-ISA-processors-support-to-Zero.patch   | 0
 package/openjdk/openjdk.hash                              | 4 ++--
 package/openjdk/openjdk.mk                                | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)
 rename package/openjdk/{17.0.7+7 => 17.0.8+7}/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch (100%)

diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
index eb9d7396e3..401e83e75e 100644
--- a/package/openjdk-bin/openjdk-bin.hash
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -1,10 +1,10 @@
 # https://github.com/adoptium/temurin17-binaries/releases
-sha256  e9458b38e97358850902c2936a1bb5f35f6cffc59da9fcd28c63eab8dbbfbc3b  OpenJDK17U-jdk_x64_linux_hotspot_17.0.7_7.tar.gz
-sha256  0084272404b89442871e0a1f112779844090532978ad4d4191b8d03fc6adfade  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.7_7.tar.gz
+sha256  aa5fc7d388fe544e5d85902e68399d5299e931f9b280d358a3cbee218d6017b0  OpenJDK17U-jdk_x64_linux_hotspot_17.0.8_7.tar.gz
+sha256  c43688163cfdcb1a6e6fe202cc06a51891df746b954c55dbd01430e7d7326d00  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.8_7.tar.gz
 
 # From https://github.com/adoptium/temurin11-binaries/releases
-sha256  5f19fb28aea3e28fcc402b73ce72f62b602992d48769502effe81c52ca39a581  OpenJDK11U-jdk_x64_linux_hotspot_11.0.19_7.tar.gz
-sha256  0c7763a19b4af4ef5fbae831781b5184e988d6f131d264482399eeaf51b6e254  OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.19_7.tar.gz
+sha256  7a99258af2e3ee9047e90f1c0c1775fd6285085759501295358d934d662e01f9  OpenJDK11U-jdk_x64_linux_hotspot_11.0.20_8.tar.gz
+sha256  eb821c049c2d2f7c3fbf8ddcce2d608d3aa7d488700e76bfbbebabba93021748  OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.20_8.tar.gz
 
 # Locally calculated
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index dad846534b..616c8d917d 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -6,10 +6,10 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_17),y)
 HOST_OPENJDK_BIN_VERSION_MAJOR = 17
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.7_7
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.8_7
 else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 11
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.19_7
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.20_8
 endif
 
 ifeq ($(HOSTARCH),x86_64)
diff --git a/package/openjdk/17.0.7+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/17.0.8+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
similarity index 100%
rename from package/openjdk/17.0.7+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
rename to package/openjdk/17.0.8+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 3b36289628..ba398b84be 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  43b80a5aec5fce908e80858e9b34efdf1b49255a12ce303650325af65141d3e8  openjdk-17.0.7+7.tar.gz
-sha256  25fd9ab3042a284aa4e6348969403016404bc2706a4a02c149a0054fbe477337  openjdk-11.0.19+7.tar.gz
+sha256  643ff42dcdf8751e0fee716c1a1914ddc7348b174e871a5eb2636578a181f20d  openjdk-17.0.8+7.tar.gz
+sha256  b2a37ef209ae7eaf8f34182b7c9aa3252af20a214d02970f96ce62242c805479  openjdk-11.0.20+8.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 39d461a87c..d1a2fa23ee 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -6,10 +6,10 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_17),y)
 OPENJDK_VERSION_MAJOR = 17
-OPENJDK_VERSION_MINOR = 0.7+7
+OPENJDK_VERSION_MINOR = 0.8+7
 else
 OPENJDK_VERSION_MAJOR = 11
-OPENJDK_VERSION_MINOR = 0.19+7
+OPENJDK_VERSION_MINOR = 0.20+8
 endif
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
 OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
