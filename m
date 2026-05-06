Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661CCCD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 16:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AD1C812CA;
	Wed,  6 May 2026 16:34:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x20VoGBWE1X8; Wed,  6 May 2026 16:34:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30435812D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778085254;
	bh=5n3GI0a/GvT09jeBX04Ai2UpPugKz+45lXydc/of3pg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DDV6ZxqapkQOpNatanwfAxbR/ILfFARkUH2hta0Uw0bSXsYKpaa7SS/qjNSEGBzMc
	 wo1u/3aPKGgDxj2S6z53hDI9IIBO/mRfmK7rSCek+SaY0Tl957S1abx+FsNbf907Nm
	 V2oy5WrRK8NEhg39U/4mYNwM9eCla04GLorBz6rLlW1zONevtg5cN3phvYOIXcbEkU
	 zLCIyoVA1HGfGF3iolkQiYMjkEmB4djyi5Nu/W0bDmm16IFjobix5gUlEVljs5ylme
	 /02Mc7jZ6y9Nlp/kMOIsmlBMPTCyr3sGJzkPsqaJ8ZIjjuiX8aTu/um+htkG457/qp
	 +1H5sYcA7mRaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30435812D4;
	Wed,  6 May 2026 16:34:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 924C5317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8444C4086D
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:34:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XFMofM3C5w_9 for <buildroot@buildroot.org>;
 Wed,  6 May 2026 16:34:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F1DE406E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F1DE406E2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F1DE406E2
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:34:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc94.dip0.t-ipconnect.de [79.214.204.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A21D7A4C20BF;
 Wed,  6 May 2026 18:31:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51906)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKf9x-000000002XI-1aue;
 Wed, 06 May 2026 16:31:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 18:31:24 +0200
Message-ID: <20260506163136.1330722-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506163136.1330722-1-bernd@kuhls.net>
References: <20260506163136.1330722-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778085115;
 bh=jE+e7Gak+W74387tivrFbUX7BIqB0QMqOUfYuvRVXlg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ggKcc533HiZUtQq2UCOksF33h5nX+AXZbB++TTO5l97QMV2T2UppNPHBU37QqgjUZ
 n8itCbzgScoqxeVQ/nIuofNjP89ByQfMV6pTTeTtxcaCuwR29wu02engqXeYKGuCSt
 nVHNkrC0m0INrNvwKGZlIB8yUaNxaX3ndFtChr9jskhpb17TFvYkAUtqRzoTrz4m6u
 q7iYCZeGvxZF06dRxYhx3mEPkTo+vFJ9uwImUeJm+ExXz5jGfBs4y5vzwbtSEnZnaQ
 5UQ2MEn6XldvMSyfxViuPWdK6P7PmMXYkYPbQgcC5RMQbrHe1IObB9FteGg0ZIF6+F
 QqeHS4xMLkDEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ggKcc533
Subject: [Buildroot] [PATCH v5 11/22] package/openjdk{-bin}: bump versions
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
