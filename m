Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C87CCCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 15:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E69FD409CB;
	Fri,  1 May 2026 15:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8BnSy3_U2uRN; Fri,  1 May 2026 15:30:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC8944103D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777649432;
	bh=5n3GI0a/GvT09jeBX04Ai2UpPugKz+45lXydc/of3pg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Mf+wwMjYfJaEp0FeEylIMAezycX1wLSGgKX1mFIx2SgsONSEA8UEWPW6QSkFP9u3F
	 YPxZ18kWBHOCsiiSdSQC5KnLM+O4qrPZajwsTOtonqPktBbjJ7cd7AptOoTGIpAAt3
	 qCPj0+0A/DPRfRFkPGmMz0VR9AlzSqFyFFdtxtcAqSLt6a57Y4ETZnBvTHb4p/owyE
	 19FZyI2UtIZYK0J9f8TQ07JOh7MuOsslOjCv8pAbXBHSza9MXog/RX2PrM6xZgYcDC
	 pVMtJq0lfC2n3V/7nDNRCFbWhswK4QxOw21dfHZNIMeUP1l0bpxYvevv9AaOjOCUAp
	 fUr2f1Tr8BRDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC8944103D;
	Fri,  1 May 2026 15:30:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74FB9127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 15:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 598F36F761
 for <buildroot@buildroot.org>; Fri,  1 May 2026 15:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U8BxPPidZQwH for <buildroot@buildroot.org>;
 Fri,  1 May 2026 15:30:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 268326F753
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 268326F753
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 268326F753
 for <buildroot@buildroot.org>; Fri,  1 May 2026 15:30:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1B120A4C024D;
 Fri,  1 May 2026 17:28:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42324)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIpma-00000000172-3yYj;
 Fri, 01 May 2026 15:28:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 17:27:47 +0200
Message-ID: <20260501152758.2610763-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501152758.2610763-1-bernd@kuhls.net>
References: <20260501152758.2610763-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777649283;
 bh=jE+e7Gak+W74387tivrFbUX7BIqB0QMqOUfYuvRVXlg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=HI85i2dFDvWMbqpv4o6KduvdZvseSOouNCsQl8KkvKxF1bSaqylTW18rLXCIN06f7
 j0a09NaGVHOybVA+LWOnLGD9VP1riCF1eIFEhlede8Rzp+Sqj1mbuNeQoGNnuuf03L
 iRk48pi7ODcGl4R+MPKBOZIcpxywxPvJRm1M5fsGjjnX3h4Xakjmd4rgnqJwFNx6Om
 nCf9pJrkaBxyvW90LkD9tpGVSOzNbbVtE6RcOh7zKuTznFQcDSmDyJ3lZDdcQ1HjjY
 m0qvoa3ZsjLAfB2DvSaGNg7yUoFr3TZov+Dz0qXF7G5nfyimn2G6VJsyi39q97DGTA
 LjnWuWpvaYGXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=HI85i2dF
Subject: [Buildroot] [PATCH v4 11/21] package/openjdk{-bin}: bump versions
 to latest 17.x and 21.x series
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Tudor Holton <buildroot@tudorholton.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

utils/docker-run support/testing/run-tests -k -d dl -o output_folder \
  tests.package.test_openjdk.TestOpenJdk.test_run

passed without issue.

This bump fixes build errors with current gcc 16-snapshot.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../openjdk-bin/{17.0.12_7 => 17.0.18_8}/openjdk-bin.hash   | 4 ++--
 .../openjdk-bin/{21.0.4_7 => 21.0.10_7}/openjdk-bin.hash    | 4 ++--
 package/openjdk-bin/openjdk-bin.mk                          | 6 +++---
 .../0001-Add-ARCv2-ISA-processors-support-to-Zero.patch     | 0
 .../0002-awt-fix-HEADLESS-compilation-without-X11.patch     | 0
 .../0001-Add-ARCv2-ISA-processors-support-to-Zero.patch     | 0
 .../0002-awt-fix-HEADLESS-compilation-without-X11.patch     | 0
 ...toconf-libraries-drop-the-need-for-X11-in-headless.patch | 0
 package/openjdk/openjdk.hash                                | 4 ++--
 package/openjdk/openjdk.mk                                  | 6 +++---
 10 files changed, 12 insertions(+), 12 deletions(-)
 rename package/openjdk-bin/{17.0.12_7 => 17.0.18_8}/openjdk-bin.hash (53%)
 rename package/openjdk-bin/{21.0.4_7 => 21.0.10_7}/openjdk-bin.hash (53%)
 rename package/openjdk/{17.0.12+7 => 17.0.18+8}/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch (100%)
 rename package/openjdk/{17.0.12+7 => 17.0.18+8}/0002-awt-fix-HEADLESS-compilation-without-X11.patch (100%)
 rename package/openjdk/{21.0.4+7 => 21.0.10+7}/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch (100%)
 rename package/openjdk/{21.0.4+7 => 21.0.10+7}/0002-awt-fix-HEADLESS-compilation-without-X11.patch (100%)
 rename package/openjdk/{21.0.4+7 => 21.0.10+7}/0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch (100%)

diff --git a/package/openjdk-bin/17.0.12_7/openjdk-bin.hash b/package/openjdk-bin/17.0.18_8/openjdk-bin.hash
similarity index 53%
rename from package/openjdk-bin/17.0.12_7/openjdk-bin.hash
rename to package/openjdk-bin/17.0.18_8/openjdk-bin.hash
index 4a7c84eb87..c2169350c1 100644
--- a/package/openjdk-bin/17.0.12_7/openjdk-bin.hash
+++ b/package/openjdk-bin/17.0.18_8/openjdk-bin.hash
@@ -1,6 +1,6 @@
 # https://github.com/adoptium/temurin17-binaries/releases
-sha256  9d4dd339bf7e6a9dcba8347661603b74c61ab2a5083ae67bf76da6285da8a778  OpenJDK17U-jdk_x64_linux_hotspot_17.0.12_7.tar.gz
-sha256  8257de06bf37f0c8f19f8d542e2ab5a4e17db3ca5f29d041bd0b02ab265db021  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.12_7.tar.gz
+sha256  0c94cbb54325c40dcf026143eb621562017db5525727f2d9131a11250f72c450  OpenJDK17U-jdk_x64_linux_hotspot_17.0.18_8.tar.gz
+sha256  592a6702b3a07a0e0b82cb38aaab149bfce1b0c24d6b57ddb410bd9009333095  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.18_8.tar.gz
 
 # Locally calculated
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/21.0.4_7/openjdk-bin.hash b/package/openjdk-bin/21.0.10_7/openjdk-bin.hash
similarity index 53%
rename from package/openjdk-bin/21.0.4_7/openjdk-bin.hash
rename to package/openjdk-bin/21.0.10_7/openjdk-bin.hash
index a73bea1a77..8d9efacba1 100644
--- a/package/openjdk-bin/21.0.4_7/openjdk-bin.hash
+++ b/package/openjdk-bin/21.0.10_7/openjdk-bin.hash
@@ -1,6 +1,6 @@
 # From https://github.com/adoptium/temurin21-binaries/releases
-sha256  51fb4d03a4429c39d397d3a03a779077159317616550e4e71624c9843083e7b9  OpenJDK21U-jdk_x64_linux_hotspot_21.0.4_7.tar.gz
-sha256  d768eecddd7a515711659e02caef8516b7b7177fa34880a56398fd9822593a79  OpenJDK21U-jdk_aarch64_linux_hotspot_21.0.4_7.tar.gz
+sha256  ea3b9bd464d6dd253e9a7accf59f7ccd2a36e4aa69640b7251e3370caef896a4  OpenJDK21U-jdk_x64_linux_hotspot_21.0.10_7.tar.gz
+sha256  357fee29fb0d5c079f6730db98b28942df13a6eed426f6c61cd4ad703ab27b9a  OpenJDK21U-jdk_aarch64_linux_hotspot_21.0.10_7.tar.gz
 
 # Locally calculated
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index e6c74cf6d8..819bf9052b 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -6,12 +6,12 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
 HOST_OPENJDK_BIN_VERSION_MAJOR = 21
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.4
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.10
 HOST_OPENJDK_BIN_VERSION_BUILD = 7
 else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 17
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.12
-HOST_OPENJDK_BIN_VERSION_BUILD = 7
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.18
+HOST_OPENJDK_BIN_VERSION_BUILD = 8
 endif
 
 ifeq ($(HOSTARCH),x86_64)
diff --git a/package/openjdk/17.0.12+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/17.0.18+8/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
similarity index 100%
rename from package/openjdk/17.0.12+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
rename to package/openjdk/17.0.18+8/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
diff --git a/package/openjdk/17.0.12+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch b/package/openjdk/17.0.18+8/0002-awt-fix-HEADLESS-compilation-without-X11.patch
similarity index 100%
rename from package/openjdk/17.0.12+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch
rename to package/openjdk/17.0.18+8/0002-awt-fix-HEADLESS-compilation-without-X11.patch
diff --git a/package/openjdk/21.0.4+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/21.0.10+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
similarity index 100%
rename from package/openjdk/21.0.4+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
rename to package/openjdk/21.0.10+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
diff --git a/package/openjdk/21.0.4+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch b/package/openjdk/21.0.10+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch
similarity index 100%
rename from package/openjdk/21.0.4+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch
rename to package/openjdk/21.0.10+7/0002-awt-fix-HEADLESS-compilation-without-X11.patch
diff --git a/package/openjdk/21.0.4+7/0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch b/package/openjdk/21.0.10+7/0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch
similarity index 100%
rename from package/openjdk/21.0.4+7/0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch
rename to package/openjdk/21.0.10+7/0003-autoconf-libraries-drop-the-need-for-X11-in-headless.patch
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 209004a292..72a6ff2e27 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  b8b37fa6fcc284d91e7458c703ca4c893a1dd5a6e0f6b9e198e7d13cd8efd24d  openjdk-21.0.4+7.tar.gz
-sha256  ccb7d37c24f9f5808f9d25419d93680570dc600f292e68944032338cb4b2c51e  openjdk-17.0.12+7.tar.gz
+sha256  6500906cb7cc49268ce4ca368db3ddf3541b40afd25eecb378e13d5a72f43214  openjdk-21.0.10+7.tar.gz
+sha256  7ebfcc2aafd514c23df3fe5280e1a34630b9b1d429c65a80dd5a4b6e7f177bc3  openjdk-17.0.18+8.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 58b266c4e9..e5d9d5e630 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -6,13 +6,13 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
 OPENJDK_VERSION_MAJOR = 21
-OPENJDK_VERSION_MINOR = 0.4
+OPENJDK_VERSION_MINOR = 0.10
 OPENJDK_VERSION_BUILD = 7
 
 else
 OPENJDK_VERSION_MAJOR = 17
-OPENJDK_VERSION_MINOR = 0.12
-OPENJDK_VERSION_BUILD = 7
+OPENJDK_VERSION_MINOR = 0.18
+OPENJDK_VERSION_BUILD = 8
 endif
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)+$(OPENJDK_VERSION_BUILD)
 OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
