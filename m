Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB15C88E75
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 21:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D65F9607B4;
	Tue, 15 Sep 2026 21:41:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2IM787UDaY0; Tue, 15 Sep 2026 21:41:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C65906079F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789508480;
	b=WAvHDxAkN34npF7i2hrx4tQHmDPhNxws/vX3JA9Yljy66JB8C7uOe+gC4MqavVlUmUXL
	 3QDHWXEEdsUQJr4tjuBCTykquqqjGD3ccVmoHqaYA1pdjuKbRddqzmwOwRJn5n5gewMfU
	 utwOvbP83s4KrICPzNf2JKPDW0HWhLMOSCjY5wZXUbnKBfzVIwWKwH2/ckzOcui53vAe9
	 aZnY0IZho/uv6hga/Pn4Tz1/iBWh2b8ruM1v+rA+wYiCc3d3fDthhv9zJTND84GqBX/NJ
	 LhM8TdqPtrvztlP/Zl00BAZOBp/ilmQYf1L6EHF08msXdzi1XZo9dEuCtOWCifrDOHA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789508480;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=wim66Nxei16KUTcvMj927LIIM5LP2WF5tw5pF7IneBc=;
	b=eDY+ooXgsiNTrn+Jt3U+UhSplU85/BK2EmIr9KqZPZm5p/yxO9+feSFyR708lxIzpxsE
	 aV2eoeOunD2n+8bJjca+05SY0NUrq602BAawvIU0K+d03suC+PZETCKugJE72i6TQk1A0
	 qzHYL4/mtO4L7Ii6bICWCIjJ4S1uUVmXtHoULzYYbH2U2qUajTdZS0Bido08Zk6uJklif
	 kvLlWw6Ys8xuB6PQUsXfiZI6VQRH2vogzUBlDJ58TQRELJrhZ9xwvKOHJ2EE55/F6Wdia
	 +QkycmOK9cBL8DGh4sT+IG3O9q1ppJo0k39BbK+Ku4oszfwjmQcClrz3nLTgm7h8eMg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789508480;
	bh=wim66Nxei16KUTcvMj927LIIM5LP2WF5tw5pF7IneBc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=cklYsjJHptpsckzbgndgnFIpaNpvhyhnET9HDdu5RglYYWaVqH9nirnhodB/X2e6z
	 QLaDTITrv/dbPY/mzkR+SRb/cC9MaIU3Dm3Ayeetn2LBlF8AIVp/U6taFM6+eYIy9y
	 z/o1AvpV4IKa30//iavbrYbBpOWtfLgEZv8LAbWs434g7ig/4Y+w07574Su7jnkeCa
	 sh3Zg8A8MpwFvz7VFhtD5+H7OGX6auebMZ2bHMOs/KCOqzQgpVupyvqauCpc3pdMUu
	 Hsz44BSTMxuO7ZGC+QdFAcf5Hhb/ZsZ3d4icQjMVTMIBg054ACPeOyb84ipt7tL09L
	 rDnsxC7nH2L4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C65906079F;
	Tue, 15 Sep 2026 21:41:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FE582D0
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 21:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 464E780C7A
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 21:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zwSFMFAP_k_V for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 21:41:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CD98280C9A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789508477;
 b=Ahwfw12lX3uNxCRVPRuf5F1P2k/GGScv5K5V909F6D3+ElUwQhpINq/lbKjiRFOmByjV
 a26HDGBGtA4wgxobJBS9v6WfrmAfUhDMrUz2VMUzGNRqGxdYy0pvV37jLaaB3V2pPxxhU
 7aBgckcpbcA7x71fV+9WinYobzg7d1XmQI7HML+AzXwDZNyw01R4itXngMjHlaoB8RyJX
 cF+nxls4f4DrrkJe5GnMOHCUxeXIyQ/5+EkHRO11NE6cCIEwH9s6V/XkvdrY7yy3Us67G
 KcjaVn5R/kLLT66HiOOtl6/fIANJJd/VXpQmrYe1oxy84TMX1oB7oCV4ct5UwfgxmrQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789508477;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=vIuwFNmq1oguNklJOIlVQmf0n1HxBT5TnI1Gp7kztGQ=;
 b=jiokYjndDFUQZrqJ5fd2GZuA6X7pmEfLctzPaZCSwwypyeEXWjlMlMekgfJAFXqwLDJq
 j6WezVfN91yTGYbQtoYmAXEsB12I3XFtgPFnWAW7joYeJYZMCucaBFsHe5oRY119aZEsF
 TLFj6O18M74yLSaRm5UH0JADV8wqHGoRKoClAekuhIllLwTY76SNtXxOtat8WvPXMUmqo
 e+DW8N86jtUf6LqAkD9gmxZrABw+fzsE7Ufm7gtSPktCrz2ryXoUqi1At39dagu7ycT/J
 xpms8mjoMS+rMMRrusUL55oEpVfohuyStaaNm9Bnuo51mTHMIgJAPR7iowJRpSBkOLw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=rhIGW8tz; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD98280C9A
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 21:41:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 17CF3C5CD55
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 21:41:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5C97E602B0;
 Tue, 15 Sep 2026 21:41:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E9ED511C7AFE7; 
 Tue, 15 Sep 2026 23:41:06 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Tue, 15 Sep 2026 23:41:04 +0200
Message-ID: <20260915214105.2026512-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/opencv4: update gcc version dependency
 related to protobuf
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

Another instance of libaseil-cpp requiring gcc >= 10, which means
protobuf needs >= 10, and that wasn't propagated to all reverse
dependencies of protobuf, in this commit: opencv4.

Fixes: 76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c ("package/libabseil-cpp: bump to version 20260817.0")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
