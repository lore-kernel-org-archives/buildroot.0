Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35490C2A062
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 22:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F057680C4E;
	Sat,  3 Jan 2026 22:43:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id umcUsfC7LWRb; Sat,  3 Jan 2026 22:43:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 299B280C50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767480229;
	bh=E5WrYtUTi1OPKG/SEjrHdXF3N1NTHfDoS6wuLlIiLJ8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SjF/3mBsjRxxLDKzv18oMmPq9R1gZ9tp11CqbEWbUJzvsbZ1YDEW1rlUEPSssycyp
	 LjOksqFDz1K1SVFZYdv+EKrVpwJOSE1lo2mwhdIzHHlkK8EBPq4bujwC4N+UDMpwYJ
	 El+/LfkLUfYUC2V23eWDwoy1Om8zGRDHw5SotPg3ZkRHTV09wf5DQ2HFT7g0BfUNEj
	 53MUTfKXfsIpmc1egMmwd4+++iY6A1Kk6sR2dNhI6F1HjbvaOLZdF14EzqAMysZ0XO
	 kqQe8/Jfo9p2TMHmZG8f/ehj27MqOU+/euyo5HYillYwJctjK7cLsg6iOQTuiiw0pR
	 QLJfTCJjW071A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 299B280C50;
	Sat,  3 Jan 2026 22:43:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D2133A21
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B316980CA4
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KO6Wql5m9GZ7 for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 22:43:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9EB2A80C30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EB2A80C30
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EB2A80C30
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CE5941A25EA;
 Sat,  3 Jan 2026 22:43:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 95A8C6072B;
 Sat,  3 Jan 2026 22:43:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 897C1113B0441; Sat,  3 Jan 2026 23:43:41 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Sat,  3 Jan 2026 23:43:17 +0100
Message-ID: <20260103224330.2933161-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103224330.2933161-1-thomas.petazzoni@bootlin.com>
References: <20260103224330.2933161-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767480222; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=CoDUWN6/2hjMDeih1zNt29tJBg6Fs9FsrZ+Yar8Bq6E=;
 b=WaMyXJ0wL2p3Z1ZTMy/RwiwGI7DEV1Kr07iUj8TD9D0E1KDaImUxybf+zcvAS4Ou1U5JQq
 pUwnySLHRSG+kgRfr0EN0IqtZfAeRwAx56Lf15en2zZkqaS0oWPE4juLJPAcFr+1bTA0JL
 NP0cvfGgC+hy2Flllb/pqkNnxyxSvMnPx/obzR6DueGwK0PSCetUpBKhpJoJ1jerQMafGT
 0uRI7RIPBhXjUhXF9bAgadLhXt/lM7apQx24l561hARcZy4CH2Q8J3I9H4gBxPsDrRiHCq
 CJHqNTC7DT0ixIi18ci+f69KkGXLE1hW4FGtIR4UReSeFEHKiYJ0hi3DWXQ0bw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=WaMyXJ0w
Subject: [Buildroot] [PATCH 04/11] package/opencv4: add missing Config.in
 comments on gcc >= 8
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
opencv4 options, but forgot to create or update appropriate Config.in
comments for several options:

BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
BR2_PACKAGE_OPENCV4_LIB_STITCHING
BR2_PACKAGE_OPENCV4_WITH_PROTOBUF

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opencv4/Config.in | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index a7f5592122..47c1cf3f4a 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -157,9 +157,10 @@ config BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
 	  Include opencv_objdetect (object detection) module into the
 	  OpenCV build.
 
-comment "objdetect needs a glibc or musl toolchain"
+comment "objdetect needs a glibc or musl toolchain w/ gcc 8"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_OPENCV4_LIB_PHOTO
 	bool "photo"
@@ -207,9 +208,10 @@ config BR2_PACKAGE_OPENCV4_LIB_STITCHING
 	  Include opencv_stitching (images stitching) module into the
 	  OpenCV build.
 
-comment "stitching needs a glibc or musl toolchain"
+comment "stitching needs a glibc or musl toolchain w/ gcc >= 8"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_OPENCV4_LIB_SUPERRES
 	bool "superres"
@@ -332,6 +334,10 @@ config BR2_PACKAGE_OPENCV4_WITH_PROTOBUF
 	help
 	  Use shared protobuf from the target system.
 
+comment "protobuf support needs a toolchain w/ gcc >= 8"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+
 config BR2_PACKAGE_OPENCV4_WITH_TBB
 	bool "tbb support"
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # tbb
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
