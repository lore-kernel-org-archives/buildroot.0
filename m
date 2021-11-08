Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EEACC433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:07:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2330C61038
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2330C61038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEF75402E7;
	Mon,  8 Nov 2021 16:07:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f2QMZ20o5kdZ; Mon,  8 Nov 2021 16:07:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CB5C402E0;
	Mon,  8 Nov 2021 16:07:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E306F1BF868
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C94E1402D0
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:07:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uIGshWlztMJf for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 16:07:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9CE8402D5
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 16:07:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D960C8B6B8; Mon,  8 Nov 2021 16:03:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 15:04:56 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 22bf059f43aa4e5e02be45e21fb49f59e594b4ff
X-Git-Newrev: f8eb447022883b0de0312ad6c69ffb9149279b19
X-Patchwork-Hint: ignore
Message-Id: <20211108160317.D960C8B6B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/openjdk{-bin}:
 bump version to 17.0.1+12
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f8eb447022883b0de0312ad6c69ffb9149279b19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
[Peter: add Config.in.legacy, use BR2_PACKAGE_OPENJDK_ prefix]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a610bf996798949f047c1f84f5617be26c3682c6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     | 16 ++++++++++++++++
 package/openjdk-bin/openjdk-bin.hash |  4 ++--
 package/openjdk-bin/openjdk-bin.mk   |  6 +++---
 package/openjdk/Config.in            | 14 +++++++-------
 package/openjdk/openjdk.hash         |  2 +-
 package/openjdk/openjdk.mk           |  6 +++---
 6 files changed, 32 insertions(+), 16 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index dbf271f249..3f3b42a2a9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,22 @@ endif
 
 comment "Legacy options removed in 2021.02"
 
+config BR2_OPENJDK_VERSION_LTS
+	bool "OpenJDK LTS version was renamed to OpenJDK 11"
+	select BR2_LEGACY
+	select BR2_PACKAGE_OPENJDK_VERSION_11
+	help
+	  The LTS version option was renamed to OpenJDK 11 to make it
+	  clear what LTS version is.
+
+config BR2_OPENJDK_VERSION_LATEST
+	bool "OpenJDK latest version (16.x) was removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_OPENJDK_VERSION_17
+	help
+	  OpenJDK 16.x is no longer mainted, so the option has been
+	  removed. Use OpenJDK 17.x instead.
+
 config BR2_PACKAGE_GNURADIO_PAGER
 	bool "gnuradio gr-flex support removed"
 	select BR2_LEGACY
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
index 01d3a3b88f..266c93d363 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ifeq ($(BR2_OPENJDK_VERSION_LATEST),y)
-HOST_OPENJDK_BIN_VERSION_MAJOR = 16
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.2_7
+ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_17),y)
+HOST_OPENJDK_BIN_VERSION_MAJOR = 17
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.1_12
 else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 11
 HOST_OPENJDK_BIN_VERSION_MINOR = 0.13_8
diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index a0d04e5725..2aad1dcea3 100644
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
+	default BR2_PACKAGE_OPENJDK_VERSION_17
 	help
 	  Select the version of OpenJDK you wish to use.
 
-config BR2_OPENJDK_VERSION_LTS
-	bool "LTS (OpenJDK 11)"
+config BR2_PACKAGE_OPENJDK_VERSION_11
+	bool "OpenJDK 11"
 
-config BR2_OPENJDK_VERSION_LATEST
-	bool "latest (OpenJDK 16)"
+config BR2_PACKAGE_OPENJDK_VERSION_17
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
index 27809ba282..5fccdaa7ac 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ifeq ($(BR2_OPENJDK_VERSION_LATEST),y)
-OPENJDK_VERSION_MAJOR = 16
-OPENJDK_VERSION_MINOR = 0.2+7
+ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_17),y)
+OPENJDK_VERSION_MAJOR = 17
+OPENJDK_VERSION_MINOR = 0.1+12
 else
 OPENJDK_VERSION_MAJOR = 11
 OPENJDK_VERSION_MINOR = 0.13+8
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
