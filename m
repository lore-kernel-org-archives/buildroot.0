Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4945C433F5
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 18:47:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 121CE61157
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 18:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 121CE61157
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2FB7400B9;
	Thu,  4 Nov 2021 18:47:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1bMYfXAlXlzq; Thu,  4 Nov 2021 18:47:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9202840114;
	Thu,  4 Nov 2021 18:47:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A7B691BF3AD
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 18:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95E1740114
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 18:47:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dutxUfGiS8zY for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 18:47:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 426A5400B9
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 18:47:30 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id l12so4543816qtx.7
 for <buildroot@buildroot.org>; Thu, 04 Nov 2021 11:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hELtT1LF7sIcr8TydL+zooo1AGJ2gfL+KMf7gZcNpNc=;
 b=TF3gK+F8rdDOf9QK5MYe1YRfZKGHYV0F5rZNK23KeTCDKsT6BT4EEBLE9fpOh5MUd1
 3qiTkNA7yiSJklzCoECNj8s+hVK2KFsSCkuvUz8kdhxv+dYuvUhsLOZ4A3N53NvBvv30
 ZeypbGH3WMBIvwrnQS1AvnqPxyP2yamjme8k6SZfknXDIR1oEhXSCTRH4VjfuKXOomxM
 EfF6oHa571w1RxLYLwvDPHGZdT4xupZmeLuMPzttzE/66yXi+1on1d2b3tEdKdGOUMfO
 YGjvXcNCIROc2eX7O9RK4Vtbt1IH2Mo7QOnsB03kcNcOYSnpQGuAJgp7smRCuTyOMe0j
 UVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hELtT1LF7sIcr8TydL+zooo1AGJ2gfL+KMf7gZcNpNc=;
 b=2UC/+rYmqghfYF1XUyNkVuXvVULb7EJL7hjWXpO8LvWOAXu4Cm4fu7n+t+HqEbgUVV
 iRBv8zPFqHXUiL+mIHXYLgsUEYj/UFjs6nqVuCSBW/DrN3WF6V7IIb6JQKUXYNMYJ+cH
 SSy7I/mqK8FfkZdwzV/gbtZo+CWpQ6yxLwRi9daCst/dPtZkvudOgVIWZuIGFL+ysgVj
 2LMrjCvlRVe/sdcHLmGypF6076XOFQTO0vVqOnUn2kzyByACAEHlCLQNLlNjAwzVmzgh
 +a7ouPATDsK4rec7KJgbXrsiThHRr+IzajPFPboh16G3ur3K4l+aLMWqBsrt8syjRyAp
 MrMQ==
X-Gm-Message-State: AOAM530mZsPNFEtL/E/HiMXgp16dppxRxiKWyovYBYv/888RuDw4I5ae
 OTVwimm08VLmQNbnFgPp69yb+8TZsXw=
X-Google-Smtp-Source: ABdhPJwQm6v/gJUSevspwhzX1gMg7hlojRAj4she0JmuV+VrPnZfQR8lT0OoNzcxMXUUsMal2d/Msg==
X-Received: by 2002:a05:622a:1883:: with SMTP id
 v3mr19260587qtc.21.1636051648863; 
 Thu, 04 Nov 2021 11:47:28 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id x188sm4001262qkd.31.2021.11.04.11.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 11:47:28 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Nov 2021 11:47:26 -0700
Message-Id: <20211104184726.1317347-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/openjdk{-bin}: bump version to
 17.0.1+12
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

OpenJDK 17 is a new LTS release, which leaves the Buildroot Config option of
"LTS" and "LATEST" as a misnomer because both 11 and 17 are LTS releases.

There are two options in this case:

1) Remove "LATEST" and update OpenJDK 11 to 17, and only support 17.
2) Change "LTS" to "11" and "LATEST" to "17" and only support the latest 2 LTS
OpenJDK releases.

After some discussion with Thomas Petazzoni and Peter Korsgaard, and testing,
option 2 is the best course of action for a few reasons:

  - OpenJDK 11 and 17 have very long support cycles:
  - OpenJDK 11 has two years of Active and five years of security support left.
  - OpenJDK 17 has five years of Active and ten years of security support left.
  - Both OpenJDK versions build with the same parameters.
  - The maintenance cost of both versions is meager.
  - Both versions pass tests.package.test_openjdk without issue.

Changes:
  - Change BR2_OPENJDK_VERSION_LATEST -> BR2_OPENJDK_VERSION_17
  - Change BR2_OPENJDK_VERSION_LTS -> BR2_OPENJDK_VERSION_11
Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/openjdk-bin/openjdk-bin.hash |  4 ++--
 package/openjdk-bin/openjdk-bin.mk   |  6 +++---
 package/openjdk/Config.in            | 14 +++++++-------
 package/openjdk/openjdk.hash         |  2 +-
 package/openjdk/openjdk.mk           |  6 +++---
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
index de17aa71fc..bbc939d4e8 100644
--- a/package/openjdk-bin/openjdk-bin.hash
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -1,5 +1,5 @@
-# From https://github.com/AdoptOpenJDK/openjdk16-binaries/releases
-sha256  323d6d7474a359a28eff7ddd0df8e65bd61554a8ed12ef42fd9365349e573c2c  OpenJDK16U-jdk_x64_linux_hotspot_16.0.2_7.tar.gz
+# https://github.com/adoptium/temurin17-binaries/releases
+sha256  6ea18c276dcbb8522feeebcfc3a4b5cb7c7e7368ba8590d3326c6c3efc5448b6  OpenJDK17U-jdk_x64_linux_hotspot_17.0.1_12.tar.gz
 
 # From https://github.com/adoptium/temurin11-binaries/releases
 sha256  3b1c0c34be4c894e64135a454f2d5aaa4bd10aea04ec2fa0c0efe6bb26528e30  OpenJDK11U-jdk_x64_linux_hotspot_11.0.13_8.tar.gz
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 01d3a3b88f..1a65123b99 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ifeq ($(BR2_OPENJDK_VERSION_LATEST),y)
-HOST_OPENJDK_BIN_VERSION_MAJOR = 16
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.2_7
+ifeq ($(BR2_OPENJDK_VERSION_17),y)
+HOST_OPENJDK_BIN_VERSION_MAJOR = 17
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.1_12
 else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 11
 HOST_OPENJDK_BIN_VERSION_MINOR = 0.13_8
diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index a0d04e5725..dc28bb5e6e 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -20,7 +20,7 @@ config BR2_PACKAGE_OPENJDK
 	depends on !BR2_STATIC_LIBS # glibc
 	depends on BR2_INSTALL_LIBSTDCPP # cups
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib, cups, libusb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb, C++14 for OpenJDK16
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb, C++14 for OpenJDK17
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_USE_MMU # cups
 	depends on BR2_PACKAGE_XORG7
@@ -51,18 +51,18 @@ if BR2_PACKAGE_OPENJDK
 
 choice
 	prompt "openjdk version"
-	default BR2_OPENJDK_VERSION_LATEST
+	default BR2_OPENJDK_VERSION_17
 	help
 	  Select the version of OpenJDK you wish to use.
 
-config BR2_OPENJDK_VERSION_LTS
-	bool "LTS (OpenJDK 11)"
+config BR2_OPENJDK_VERSION_11
+	bool "OpenJDK 11"
 
-config BR2_OPENJDK_VERSION_LATEST
-	bool "latest (OpenJDK 16)"
+config BR2_OPENJDK_VERSION_17
+	bool "OpenJDK 17"
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # C++14
 
-comment "OpenJDK 16 needs a host gcc >= 4.9"
+comment "OpenJDK 17 needs a host gcc >= 4.9"
 	depends on !BR2_HOST_GCC_AT_LEAST_4_9 # C++14
 
 endchoice
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 8788d02be0..2f46b044ad 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  b4a0e71e41a11175e8a7c1dba86ed5b0aa878413158c8d48813db1b64ac9536c  openjdk-16.0.2+7.tar.gz
+sha256  8c076203a6f85ab916b3e54de1992bcbcc5ffe580c52b1ac8d52ca7afb9f02d1  openjdk-17.0.1+12.tar.gz
 sha256  119c6233fe7ff5670c590e2f9d6686ac4d80c97b17065506998b75c547b54f2c  openjdk-11.0.13+8.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 27809ba282..350a234044 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ifeq ($(BR2_OPENJDK_VERSION_LATEST),y)
-OPENJDK_VERSION_MAJOR = 16
-OPENJDK_VERSION_MINOR = 0.2+7
+ifeq ($(BR2_OPENJDK_VERSION_17),y)
+OPENJDK_VERSION_MAJOR = 17
+OPENJDK_VERSION_MINOR = 0.1+12
 else
 OPENJDK_VERSION_MAJOR = 11
 OPENJDK_VERSION_MINOR = 0.13+8
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
