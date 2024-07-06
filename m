Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD8BC2BD09
	for <buildroot@archiver.kernel.org>; Sat,  6 Jul 2024 07:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23A38408A2;
	Sat,  6 Jul 2024 07:03:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hAIeU-R3r5on; Sat,  6 Jul 2024 07:03:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 869FE40879
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 869FE40879;
	Sat,  6 Jul 2024 07:03:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D62931BF3AA
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 07:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCC0560678
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 07:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id feB26HltBwSq for <buildroot@lists.busybox.net>;
 Sat,  6 Jul 2024 07:03:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 63A3F6066A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63A3F6066A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63A3F6066A
 for <buildroot@buildroot.org>; Sat,  6 Jul 2024 07:03:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a063f.dip0.t-ipconnect.de [91.58.6.63])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 12C78A4C0BFC
 for <buildroot@buildroot.org>; Sat,  6 Jul 2024 09:02:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55900)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sPzRi-000000001mq-2nTy
 for buildroot@buildroot.org; Sat, 06 Jul 2024 07:02:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  6 Jul 2024 09:02:58 +0200
Message-Id: <20240706070258.696552-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1720249379;
 bh=I7F60B94JdfptKc7EQ5WI3i8EPwB/3aDymTs9v1kKRs=;
 h=From:To:Subject:Date:From;
 b=tUEPQkAvnGrrfPjgTqdk4kV7ers+qCXqNogfv9Y6ftWT7HZwE4UnWGt2ynBFRzZoi
 mIz+6htRcnMU0iJMv9MTwwFUh3I1eVSZ5inp+m4IRhrIQ4hBfrX6RVwGN510wyzuet
 J8iPglJFnvurUmOkPJ5s7stJIGzmaaJ3RR5hNV+F1sOyq3mTohBqHMiFUTYIR3Qa9g
 stHT1vZ6xc2M3fpA7/WFbeUiFtpi0oxdN6lpQis42CHLMpFJwCMZ29B4TxHPka6hvK
 7ju0qISNZRRkgQqdi8dtsA/rkc+1eoGYWYMlPxtfzNByOqRtXVa6lnZgODeZYGEc5e
 /g/7d2Vaw4tzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=tUEPQkAv
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 4.19.x / 5.{4,
 10, 15}.x / 6.{1, 6, 9}.x series
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 865b7fd240..34057a4893 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.9.4" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.9.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 6ebd708bcb..d412aafa13 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  272800e0d1a7d01a78bce95a3aaf5c80816f50eb15c517d7003e58355760ecc2  linux-6.9.4.tar.xz
-sha256  a13ebc20dc2a75722699949af74aa86a4ce5d544d6daaa6a7de4e8c81b40de97  linux-6.6.33.tar.xz
-sha256  df31af2ef5923d61fadd68bfd991f50f2e42a913895eb4b03214ee78f8720bcf  linux-6.1.93.tar.xz
+sha256  f048267b7b88316c9ca708c68d15a9ae802dcfc943c3188c1273eb958c433281  linux-6.9.8.tar.xz
+sha256  f3976e77708694fe4a1f8d1307c315c8a36cbc58f038a38e006b91e29a1f3214  linux-6.6.37.tar.xz
+sha256  890b845f36452328716e62dd893b634584f607cdd44b4e685392d302d3be41af  linux-6.1.97.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  f41e718e33b88f269a6b6a7653e5e9824c4ba541f6ffe5bf26ecc37c540a1b05  linux-5.15.160.tar.xz
-sha256  9c36b243e8c3ec1d5963366618f336710b84340bf95be2037b26c452392cb2d6  linux-5.10.218.tar.xz
-sha256  7e1f5b28588e49ddfd18e7772476e4e8b52bdc9c3e19beafcbb7c103e6c01f51  linux-5.4.277.tar.xz
+sha256  91bfc0ea152ce7b102a0b79d35a7c92843874ebf085c99d2ba8b4d85e62b1a7c  linux-5.15.162.tar.xz
+sha256  da1dd47febac4f7856654038a47703666da3afba348b8e96e39584e0972e2725  linux-5.10.221.tar.xz
+sha256  b298436b26395b5c3ace6963836ba70d57cd61e01cff254b0e5443636c324a5e  linux-5.4.279.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  6c5e4d3c87feadbfdb9f7d2e46f3f120b00286ba380491c5956708e0b94232c8  linux-4.19.315.tar.xz
+sha256  062b70cc132378e1c685df44ddf7e05bab4752b690ada17b080655a63f993581  linux-4.19.317.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7b7928549c..8ae267c2c8 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -419,13 +419,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.19.315"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.277"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.218"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.160"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.93"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.33"	if BR2_KERNEL_HEADERS_6_6
-	default "6.9.4"		if BR2_KERNEL_HEADERS_6_9
+	default "4.19.317"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.279"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.221"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.162"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.97"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.37"	if BR2_KERNEL_HEADERS_6_6
+	default "6.9.8"		if BR2_KERNEL_HEADERS_6_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
