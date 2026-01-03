Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F49C2A060
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 22:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4790608F1;
	Sat,  3 Jan 2026 22:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GH0RZR39cJVo; Sat,  3 Jan 2026 22:43:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2DEF606EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767480226;
	bh=TTPSOG3al1MxnehW98C9lsV0USSlLOC7VPKrTnOTzh0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=O7w776evdTZrBJ/qh52CixISBdKdixf5ZXya9TozUNL6z3c9hBI+mww+jfDFSVl0y
	 /9OLLrIqeDUaBzw4DAROujwQKf1zfTk3DUG7wLVs75aEzl/uMaW/LtEzHGABTSkp3W
	 erUSKeyHXhfHALFxh/GomRoaNP5r4rGrfifsDxIrqsJrpkd/3F3q67g8woetTXNGdO
	 R3jDs75HUZen0ti0O1tUygaxxORTQ+5XiLyojII4yuTjQmD3HOowewDaLhAYCaQpmB
	 gArIdtGUHbG6eJ5snK5TRaiCCpzgFIncUUuQPhaP0ENjIR0LRtbSiyx18zQUG+AVbf
	 nNvVHIypvy0iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2DEF606EA;
	Sat,  3 Jan 2026 22:43:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0339E70A
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDE42606EA
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tVT2a3PufUXP for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 22:43:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AAA4B60693
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAA4B60693
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AAA4B60693
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 05C69C1C95C;
 Sat,  3 Jan 2026 22:43:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DFD626072B;
 Sat,  3 Jan 2026 22:43:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 537BE113B06CD; Sat,  3 Jan 2026 23:43:40 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Sat,  3 Jan 2026 23:43:16 +0100
Message-ID: <20260103224330.2933161-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103224330.2933161-1-thomas.petazzoni@bootlin.com>
References: <20260103224330.2933161-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767480220; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=89Py0quoM6oJoBNrHj0zO6mTQaEdXYIyDqrqBKQvIpQ=;
 b=pIHTes0rE6hhtuELNn5PklquIR1IUA5VbnjMxixxMZ3ZyyH+Qhwo8CJ+r76AlyX+nRagNp
 0aJjU7mAv5VLbQ6BNRMxkj9qXjefcEMvIsp7SVbImgd+9nJ//3KT+eHRPuaggMDCuAvT+R
 7zbzpgYpgwH5P4TLcXVRDJhg/Fx7oMSgE/oMsGtCLQWqRldeZ0Yg6CTTXZuQhL23xQVAmW
 l4vT8XwHqcwyh9BXEJLM8lNfkOtRj/PBIDsiFTi6yTBGmUo6BJWg/j1aklqYfM4hglQczx
 8Wawof/02o39JGKky3+9hxs638DJAK0OGgw93AmBAaFgsrj/laxZRf4CgR48tQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=pIHTes0r
Subject: [Buildroot] [PATCH 03/11] package/opencv4-contrib: add missing gcc
 >= 8 dependencies
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit
75ab6cf93a3ba505897ae99b5ff4bffda55d3c7b ("package/{python-}protobuf:
bump to version 28.1") added a whole bunch of gcc >= 8 dependencies to
OpenCV 4 options, but forgot to propagate those to opencv4-contrib.

Fixes:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
  Depends on [n]: BR2_PACKAGE_OPENCV4 [=y] && !BR2_TOOLCHAIN_USES_UCLIBC [=n] && BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_8 [=n]
  Selected by [y]:
  - BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FACE [=y] && BR2_PACKAGE_OPENCV4_CONTRIB [=y] && BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS [=y] && !BR2_TOOLCHAIN_USES_UCLIBC [=n]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opencv4-contrib/Config.in | 36 ++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/package/opencv4-contrib/Config.in b/package/opencv4-contrib/Config.in
index ad61c3fbe8..529687dd96 100644
--- a/package/opencv4-contrib/Config.in
+++ b/package/opencv4-contrib/Config.in
@@ -76,28 +76,32 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_OBJDETECT
 	bool "dnn_objdetect"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 dnn
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # opencv4 dnn
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # opencv4 dnn
 	select BR2_PACKAGE_OPENCV4_LIB_DNN
 	help
 	  Object Detection using CNNs -- Implements compact CNN Model
 	  for object detection. Trained using Caffe but uses
 	  opencv_dnn module.
 
-comment "dnn_objdetect needs a glibc or musl toolchain"
+comment "dnn_objdetect needs a glibc or musl toolchain w/ gcc >= 8"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_SUPERRES
 	bool "dnn_superres"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 dnn
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # opencv4 dnn
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # opencv4 dnn
 	select BR2_PACKAGE_OPENCV4_LIB_DNN
 	help
 	  Superresolution using CNNs -- Contains four trained
 	  convolutional neural networks to upscale images.
 
-comment "dnn_superres needs a glibc or musl toolchain"
+comment "dnn_superres needs a glibc or musl toolchain w/ gcc >= 8"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNNS_EASILY_FOOLED
 	bool "dnns_easily_fooled"
@@ -109,27 +113,31 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DPM
 	bool "dpm"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # opencv4 objdetect
 	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
 	help
 	  Deformable Part Model -- Felzenszwalb's Cascade with
 	  deformable parts object recognition code.
 
-comment "dpm needs a glibc or musl toolchain"
-	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
-	depends on BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
+comment "dpm needs a glibc or musl toolchain w/ gcc >= 8"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FACE
 	bool "face"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # opencv4 objdetect
 	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
 	help
 	  Face Recognition -- Face recognition techniques: Eigen, Fisher
 	  and Local Binary Pattern Histograms LBPH methods.
 
-comment "face needs a glibc or musl toolchain"
-	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
-	depends on BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
+comment "face needs a glibc or musl toolchain w/ gcc >= 8"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FREETYPE
 	bool "freetype"
@@ -347,15 +355,17 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XOBJDETECT
 	bool "xobjdetect"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # opencv4 objdetect
 	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
 	help
 	  Boosted 2D Object Detection -- Uses a Waldboost cascade and
 	  local binary patterns computed as integral features for 2D
 	  object detection.
 
-comment "xobjdetect needs a glibc or musl toolchain"
-	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
-	depends on BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
+comment "xobjdetect needs a glibc or musl toolchain w/ gcc >= 8"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XPHOTO
 	bool "xphoto"
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
