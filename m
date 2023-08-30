Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B57C6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 15:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9442C4177C;
	Wed, 30 Aug 2023 15:59:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9442C4177C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MLHhgYZsu9z2; Wed, 30 Aug 2023 15:59:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFF4D416A4;
	Wed, 30 Aug 2023 15:59:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFF4D416A4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E6C51BF2B1
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 15:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 117CA416A4
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 15:59:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 117CA416A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n3V1o-JgVnN2 for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 15:59:37 +0000 (UTC)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BCBF040025
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 15:59:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCBF040025
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-68a520dba33so4556939b3a.0
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 08:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693411176; x=1694015976;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D9h6FXlb3cryNl7PlhFskSJ56/LWbC1oGDzOtXwT/YA=;
 b=Wdu1TUO8v/MjsZoVolLwc4XN9p8yM0N1G2bLbUnkovDkQu9Lgs+5FCxyID7l0GhlIi
 VgntT+tViSLL6jIkFeQaQzJwg9OXOhJX6d7bLiaQ/WTixqk3jQqfEhfCJAzsfR5PkqRB
 Kq5gpKrh2isLCV8RvK5n0d1RYQSvk2/3Lrh449jyLTHUx3DcVG/HMqyF/mIoXMcmWvZ7
 9bPHXGjsy8Wb7a1Wggqu/oDi3I0AykcJ0lxV00lidU6BvUJSvFqEbvCPC6UWzL0ZFVrb
 2jDGDkZn9BkLZNENNQLXIU9dbAmkj+w1pCJCNGNxPFyW2nz2hqFWGsX28eV0agCWdusX
 w+Ug==
X-Gm-Message-State: AOJu0YyocYRcoTPclvBPbTa4fOYN63SFTrxrYl1EstSEYswZ4X2QV66b
 c7+pOFpsF9S2sEtwU+tqXtx4uKjWb58=
X-Google-Smtp-Source: AGHT+IF06LRaYa/vwBktEdwM2bUUgGouCxTkhfCwptlTz80lROv3VpTtyW8ZdAtamAkKgMzlNE6wbA==
X-Received: by 2002:a05:6a20:440b:b0:14b:ea0d:e313 with SMTP id
 ce11-20020a056a20440b00b0014bea0de313mr3750369pzb.0.1693411176474; 
 Wed, 30 Aug 2023 08:59:36 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.156])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a170902d3c600b001bdc664ecd3sm11210969plb.307.2023.08.30.08.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 08:59:35 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 09:59:26 -0600
Message-ID: <20230830155926.2831345-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693411176; x=1694015976; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D9h6FXlb3cryNl7PlhFskSJ56/LWbC1oGDzOtXwT/YA=;
 b=LtGcuN/hXvPL8H9t/75rPQYS3DaoTquyZr8nuwgrKdAIUdbUus076nt7phtC1KLLrL
 PxfgzoSCxYuIYwHKy2EEG3GPeAU2oxUNau3aYXAN+Sff5RfdUeXzsy4TvVib8PcTGILM
 bnhouF3jpNeu7bCTLwC0SQDKHqQrU8iaqa3pKiRkUlNSSEHLOLfCxX2FIE0/1XQ+pdN5
 Xq2DRZNbrM1MnE4HHSFJMgl7V+VWhbCzCqCJxsTiJpr9Hi7YFQZwCpC8yz5Xi94+9gvA
 IaOXMduvofSgUMcNz89/uEyFu7ii0ST3BdTGrYPzkLiVdlbl1ePLkCARhzuRPA6JFNhl
 nPww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=LtGcuN/h
Subject: [Buildroot] [PATCH 1/1] package/openjdk{-bin}: security bump
 versions to 11.0.20+8 and 17.0.8+7
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

Fixed the following security issues:

* CVEs
  - CVE-2023-22006
  - CVE-2023-22036
  - CVE-2023-22041
  - CVE-2023-22044
  - CVE-2023-22045
  - CVE-2023-22049
  - CVE-2023-25193
* Security fixes
  - JDK-8298676: Enhanced Look and Feel
  - JDK-8300285: Enhance TLS data handling
  - JDK-8300596: Enhance Jar Signature validation
  - JDK-8301998, JDK-8302084: Update HarfBuzz to 7.0.1
  - JDK-8302475: Enhance HTTP client file downloading
  - JDK-8302483: Enhance ZIP performance
  - JDK-8303376: Better launching of JDI
  - JDK-8304468: Better array usages
  - JDK-8305312: Enhanced path handling
  - JDK-8308682: Enhance AES performance

For details, see the announcements:
https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-July/024064.html
https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-July/024063.html

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
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
