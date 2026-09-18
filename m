Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEA5C982DF
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7EFB81330;
	Fri, 18 Sep 2026 19:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMSkFQ2bjmI5; Fri, 18 Sep 2026 19:35:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D210B81332
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789760144;
	b=hyWqxeGmBIGmRb1CNcfoGzUjf95U21KGZ6/q0gipETCQwbd2NN/ZEvsdxObq/SwIyNlq
	 Ao/9q3ZAZzJE+tdER8/QluEJyE2xxTjDwTbGOs1HeyxYbsADo/zleTBDgTgYPvvq+pmbp
	 ++24DV3V6CZJ2pU15JU3zn/x6OkRlz7J2CUskwtf8rDNTM6hd3rPyxE2LbvofVpMwplRr
	 NvQTevnWplC1fPbEIRSA4rz2XLD7bAAKLvNOVgxBv5Sr+5skmerzhvRDYFq4H6ZsbXTGT
	 VYpGDTqMoHPZ4rwvogtP7h5RbzE8a3n49IDtoUET1SKHEF5j7VbaykyzGaHgnUxGdRA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789760144;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=dj2yNsAeRaSFix26h4TjhBBe5PO3JrvVyFzrINz4DoQ=;
	b=M0kTLtio1uMFeNFtVPbUcShQqZUjehJ5pSAN0vB4D4z66ALCn5jKDvFJ8W1JfM0vIQFC
	 rQkH/VfWVGFfTpOGJWQoKakUiGPcMQom9sWPFhclrN7s5if7cSqv/BWZX+KNGbC8Qxhn/
	 lOJmj/HbtDaRKM58I2DlKqkMawV1xKHIzMvL2JKkCJzaM01xM8Av7tQtisTdFh1vc9s2G
	 4yYfYVzzt42l/Q4p88jW00e46FflE6mqh7Uu6vFvNtalxzyfx74xMbf5Mzt4z8OG/fwrk
	 iWt1tln39vHZRXTxCHbfR6wTWgcDRvqWfF8Fz2CE/s4ZI7M40ZfZp/GcuYnSrptVfYg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789760143;
	bh=dj2yNsAeRaSFix26h4TjhBBe5PO3JrvVyFzrINz4DoQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=c2HNL8t9cM9/T+Vc0innB7U/kShwkhaG46SRE/VhxZ/gOToM59HS43+MdIIVDXXBO
	 MbGvWOZOMYTaJ/vBVSELvkhuTMIm0pFxK0uVhFpiDS4za4GU7aKFxCBkZEpk4GyYui
	 usDnXXwK1yARckxBYWM7qixuF17h5W4D3VQxiLNJW9+tPgYTsKHob8mGEOCauMyraY
	 z/6WxqqKiOUTKPmIJX3sUeuIumJtE5n6mTX0wAhw5rsH70QYyuDxVPgLvwNDZm0wRn
	 W9mdJH+32PQvRDj+J2rGPdckYdwRRbd1HA1Jt+HrY4aX445mM9A1kx5MDXqtev5RHx
	 4uxBEGt8nLs6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D210B81332;
	Fri, 18 Sep 2026 19:35:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 94498784
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77C2960E16
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QlQEanuyi56F for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:35:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 85A1D60E02
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789760132;
 b=nsUVmHpWRQsuBvVBZ56b+2DatTmS2utTHnGjqDu1X26mYIQ2SoIgP3yAPcko9gUltrlr
 D74/wiRVE8mJ+1G0EbNLREyp0UDP20xc0yQpre/d+SuV5M6ErU4B6QjDpus7bDZDkgaXq
 N3A6sGNTc004Dc8QU3/GpYhZjFF5jy83usi1bCtxgg99p4u2+zYn8r2WOFLixhmc7e66E
 fhy2Y8tC8//qa/5mHgk2WNKGD/0hhlBd5vlU/LJtqgwaHf/WCRwsZozsEY7nMO4ldjXdV
 JRqaekd9B4OSRulPFzBhX+pEHMYvfcDEpnhBYadGOgJHDhHRvmFsaXCpr3CZNjfX6Mg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789760132;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=s5hmL6F8upzTAOVFqF23uDth191l6EhDZTAHtZ08zDc=;
 b=r8bJGlsU2z4p8O1QmRBUomkiY2kOWg+4dktILskmGxvSQTTcDkxiyPv8lcuOkaC4/4k0
 gauretHEEQBM7TgXnZKOP1aglUmsGYNRMMkaOtn7/fglnRR8Kb1aV55yS1VsxqG1WDByJ
 AlwekF0LpQWSIKEYrUid0v+QcK0V92FHUGbQsRBdGsncjH6cqvWjukpj1JFQDVh/CXWSV
 JKtOQbgcfUuaH4RWZbvePGdlT1ZP7pD7U8/1PuIDiyJC85N5NXB5LlRI9/2JBFJhESFcf
 rrsl4zaAdpdvhn3+3GcP8pGK0aYVu6++08TmHT6El1hhF3V2JJ0cHPn0+sAeaAV3EBw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85A1D60E02
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:35:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B6EB976A8; Fri, 18 Sep 2026 19:34:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 21:25:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93282f76a535ce54e9a853c72c01152a2c3a6805
X-Git-Newrev: 56cdcb8206f266fb944f327830db881ce1f7bee2
X-Patchwork-Hint: ignore
Message-Id: <20260918193425.1B6EB976A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencv4: update gcc version
 dependency related to protobuf
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/56cdcb8206f266fb944f327830db881ce1f7bee2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Another instance of libaseil-cpp requiring gcc >= 10, which means
protobuf needs >= 10, and that wasn't propagated to all reverse
dependencies of protobuf, in this commit: opencv4.

Fixes: 76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c ("package/libabseil-cpp: bump to version 20260817.0")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/opencv4/Config.in | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index e4a15f742b..10b2c54b70 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -34,16 +34,16 @@ config BR2_PACKAGE_OPENCV4_LIB_DNN
 	# dnn needs fenv.h which is not provided by uclibc
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_PACKAGE_OPENCV4_WITH_PROTOBUF
 	help
 	  Include opencv_dnn (Deep Neural Networks) module into the
 	  OpenCV build.
 
-comment "dnn needs a glibc or musl toolchain, gcc >= 8"
+comment "dnn needs a glibc or musl toolchain, gcc >= 10"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
-		!BR2_HOST_GCC_AT_LEAST_8
+		!BR2_HOST_GCC_AT_LEAST_10
 
 config BR2_PACKAGE_OPENCV4_LIB_FEATURES2D
 	bool "features2d"
@@ -147,7 +147,7 @@ config BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
 	bool "objdetect"
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # dnn support
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # dnn support
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # dnn support
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # dnn support
 	# opencv_core dependency is already enabled
 	select BR2_PACKAGE_OPENCV4_LIB_CALIB3D
 	select BR2_PACKAGE_OPENCV4_LIB_DNN
@@ -157,10 +157,10 @@ config BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
 	  Include opencv_objdetect (object detection) module into the
 	  OpenCV build.
 
-comment "objdetect needs a glibc or musl toolchain w/ gcc 8"
+comment "objdetect needs a glibc or musl toolchain w/ gcc 10"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10
 
 config BR2_PACKAGE_OPENCV4_LIB_PHOTO
 	bool "photo"
@@ -198,7 +198,7 @@ config BR2_PACKAGE_OPENCV4_LIB_SHAPE
 config BR2_PACKAGE_OPENCV4_LIB_STITCHING
 	bool "stitching"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # objdetect
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # objdetect
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # objdetect
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # objdetect
 	select BR2_PACKAGE_OPENCV4_LIB_CALIB3D
 	select BR2_PACKAGE_OPENCV4_LIB_FEATURES2D
@@ -208,10 +208,10 @@ config BR2_PACKAGE_OPENCV4_LIB_STITCHING
 	  Include opencv_stitching (images stitching) module into the
 	  OpenCV build.
 
-comment "stitching needs a glibc or musl toolchain w/ gcc >= 8"
+comment "stitching needs a glibc or musl toolchain w/ gcc >= 10"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10
 
 config BR2_PACKAGE_OPENCV4_LIB_SUPERRES
 	bool "superres"
@@ -329,14 +329,14 @@ config BR2_PACKAGE_OPENCV4_WITH_PNG
 config BR2_PACKAGE_OPENCV4_WITH_PROTOBUF
 	bool "protobuf support"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # protobuf
 	select BR2_PACKAGE_PROTOBUF
 	help
 	  Use shared protobuf from the target system.
 
-comment "protobuf support needs a toolchain w/ gcc >= 8"
+comment "protobuf support needs a toolchain w/ gcc >= 10"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 
 config BR2_PACKAGE_OPENCV4_WITH_TBB
 	bool "tbb support"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
