Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBAEC48BC3
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 19:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B644640199;
	Mon, 19 Feb 2024 19:25:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G4lVZFW-6tO9; Mon, 19 Feb 2024 19:25:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51F844060C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51F844060C;
	Mon, 19 Feb 2024 19:25:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A8F151BF48D
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 19:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95FC781E58
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 19:25:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 03cltV5PpYjx for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 19:25:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E7DC681E2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7DC681E2F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7DC681E2F
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 19:25:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1E36CA4C0A9C
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 20:25:42 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52742)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rc9Gn-000000004hW-2g3D
 for buildroot@buildroot.org; Mon, 19 Feb 2024 20:25:41 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 19 Feb 2024 20:25:41 +0100
Message-Id: <20240219192541.3773864-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1708370742;
 bh=aXMs3IVj6r+gWansVLT8/DAkOUmcUYHQSFeHqNwsxGY=;
 h=From:To:Subject:Date:From;
 b=GoVpRnM+Q4n0IvP5DVjbdd2Qdc4LkhnjpaX0U73OV5AvugyytZjnI0HhIc+uGvOEj
 R+33W2GSPXpXuHF6pyMYHlzm3TrkDHC1x2fjZGJo6AkSRHEZIfQtGwVZi8BckoUdQk
 meTDB/qUFJM3fXZYRtKOGlMWZnEajki31JHJDuQZ0dSgoPE4yKIV3GZodg8VyNshVJ
 NWFvw6ZZmDIcSRstxj/XRzHW8UQPNiD8AhUTFXKfSI+4VYoCLhhZmWw8rP3mxw7ylM
 1aM38b86ekEIrPWveUktL+6OzpeO1M81OJG02m4hiJVMST4MHIVQVPbQyP1J8QR4eo
 wYCjiyUy3b4QQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=GoVpRnM+
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{1,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 773cb4fbb5..8e889af802 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6.16" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.17" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 52fb480af2..db9b2d8a11 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  b21d5795a3bead4f112916423222faa8a0f519e4201df343e3eb88dc9e4aaa30  linux-6.6.16.tar.xz
-sha256  3b54ec567716cdfb3618caf38c58a8aab1372cc41c16430633febe9ccdb3f91d  linux-6.1.77.tar.xz
+sha256  ee7650996ba75aa29fe66f309b413097f249a03e7001f2a41128c7c95205226a  linux-6.6.17.tar.xz
+sha256  65206b969831236849c9906eba267e715734a93808e9909fd9b4f12eea10d689  linux-6.1.78.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  c48575c97fd9f4767cbe50a13b1b2b40ee42830aba3182fabd35a03259a6e5d8  linux-5.15.148.tar.xz
 sha256  44e22fad647c638726a8eae23703c4263bead612d17c89ca7ad7ab32b5ce88d5  linux-5.10.209.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 69857566e3..537de85ad8 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -407,8 +407,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.268"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.209"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.148"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.77"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.16"	if BR2_KERNEL_HEADERS_6_6
+	default "6.1.78"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.17"	if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
