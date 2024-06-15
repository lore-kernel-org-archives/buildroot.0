Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBF9C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 11:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65B9D812B5;
	Sat, 15 Jun 2024 11:30:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gMeAbZX0hjpf; Sat, 15 Jun 2024 11:30:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD07E8128C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD07E8128C;
	Sat, 15 Jun 2024 11:30:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D5E31BF31F
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 11:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25574406CC
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 11:30:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WzLJ0U-Y6Vti for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 11:30:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 46FE4406C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46FE4406C8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46FE4406C8
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 11:30:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1beb3.dip0.t-ipconnect.de [84.161.190.179])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 307ACA4C05A8;
 Sat, 15 Jun 2024 13:30:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46656)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sIRcP-000000003xY-2Drb;
 Sat, 15 Jun 2024 11:30:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 13:30:46 +0200
Message-Id: <20240615113049.456274-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1718451050;
 bh=lDFSvitNm3BvtaxKIlFCtfuwsgAZZTjdwT416TTVPH4=;
 h=From:To:Cc:Subject:Date:From;
 b=ZUOgvSL5jSEaTSlAhJ53h3F6GLZo0mmcw/Zj1u294N+lmBi5/FiqSwdjjVWSjvhGU
 82ezOFaBkG+hxGM6LTGi124F9Tcfv/GScmwkbBxewLgl/CKcgPopE+qdl+iMO3lWjK
 itlXYvJ6LY5xuaFDmKPjx2BSn8ooOhsyMq57jk3BPQK9lSAjgmnE6ERMImyvCdpJEa
 KFfDQADOTV2eX2SnUaPclqrphECM56KwKJDFl5dc3PpHxFpS3Y81mVyZxTsPchLEPS
 7DnANW0cv1jMY5fPl6xvPq4RCKTe1kIZdz0FfweYdvGNCxBGgWsG81Sk1LT9HPoD9P
 GWnq1XtZgJZiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=ZUOgvSL5
Subject: [Buildroot] [PATCH 1/4] {linux, linux-headers}: bump 6.{1,
 6}.x series
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index b972557fc0..9374af71b0 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  19b31956d229b5b9ca5671fa1c74320179682a3d8d00fc86794114b21da86039  linux-6.8.12.tar.xz
-sha256  aaa824eaf07f61911d22b75ff090a403c3dd0bd73e23933e0bba8b5971436ce1  linux-6.6.32.tar.xz
-sha256  9019f427bfdc9ced5bc954d760d37ac08c0cdffb45ad28087fc45a73e64336c9  linux-6.1.92.tar.xz
+sha256  a13ebc20dc2a75722699949af74aa86a4ce5d544d6daaa6a7de4e8c81b40de97  linux-6.6.33.tar.xz
+sha256  df31af2ef5923d61fadd68bfd991f50f2e42a913895eb4b03214ee78f8720bcf  linux-6.1.93.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  f41e718e33b88f269a6b6a7653e5e9824c4ba541f6ffe5bf26ecc37c540a1b05  linux-5.15.160.tar.xz
 sha256  9c36b243e8c3ec1d5963366618f336710b84340bf95be2037b26c452392cb2d6  linux-5.10.218.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 48101783b9..487d941a16 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -419,8 +419,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.277"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.218"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.160"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.92"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.32"	if BR2_KERNEL_HEADERS_6_6
+	default "6.1.93"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.33"	if BR2_KERNEL_HEADERS_6_6
 	default "6.8.12"	if BR2_KERNEL_HEADERS_6_8
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
