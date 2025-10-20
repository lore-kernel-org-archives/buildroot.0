Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F69DCCD1A2
	for <buildroot@archiver.kernel.org>; Mon, 20 Oct 2025 20:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1203861501;
	Mon, 20 Oct 2025 20:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c1puPXVAVeXL; Mon, 20 Oct 2025 20:34:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 461FF61504
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 461FF61504;
	Mon, 20 Oct 2025 20:34:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D6841277
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 20:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3C2741FF1
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 20:34:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7BIGRLaTmtyt for <buildroot@buildroot.org>;
 Mon, 20 Oct 2025 20:34:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C907241FE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C907241FE4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C907241FE4
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 20:34:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a021f.dip0.t-ipconnect.de [91.58.2.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 84341A4C1ECE;
 Mon, 20 Oct 2025 22:34:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38910)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vAwaK-000000006LE-2g80;
 Mon, 20 Oct 2025 20:34:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 20 Oct 2025 22:34:25 +0200
Message-ID: <20251020203428.2751864-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760992468;
 bh=2WJ4AuiP2XUb/fbbs6kO+7spA/Sjpx0O76zeY0MUG/o=;
 h=From:To:Cc:Subject:Date:From;
 b=flhMcLKcy1YACC2qrU2zxavFJnbKA9G9OsF5CE+UrlkDV4Z2Q2Sd366HmU9cba/8i
 uXmhT3p1nxxKZFUOJ2uREcCXXxHj6CWthoHzUwtgoCtmYliUlSHvYIl0B6v9qFYbEN
 RO4jw/4kbnIB/oEhotY0epJpah7JKahJqdmMrX5wcFmxOENc9AT73cUk0bzg68IBV+
 +1xTCK458qenXasC3HSi+SdPazEXU7eNgDw7NvPh0fKTB84tB4kO6e5qIypx/IvYWa
 dBFJwBJ8afYZ+kOHbYDFg7asMNVYfOgRqPxgHcp5n+HwGUO+I8WJsdMkyFLSeIORYg
 6XRTwH8gDqO6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=flhMcLKc
Subject: [Buildroot] [PATCH 1/4] package/i2pd: bump version to 2.58.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/PurpleI2P/i2pd/blob/2.58.0/ChangeLog

Needed for bump of libminiupnpc to version 2.3.3:
https://github.com/PurpleI2P/i2pd/blob/openssl/ChangeLog#L176

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/i2pd/i2pd.hash | 6 +++---
 package/i2pd/i2pd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/i2pd/i2pd.hash b/package/i2pd/i2pd.hash
index cc099a94ff..a539a4dd1a 100644
--- a/package/i2pd/i2pd.hash
+++ b/package/i2pd/i2pd.hash
@@ -1,4 +1,4 @@
-# From https://github.com/PurpleI2P/i2pd/releases/download/2.50.2/SHA512SUMS
-sha512  7df7a578711a959feee4326060829cf87c0d1669e473934549cb59d868a7aef7300ecd2d7a6b92a2295aa7e97964cc16d0e44a334db917e22b0b59573a9052de  i2pd-2.50.2.tar.gz
+# From https://github.com/PurpleI2P/i2pd/releases/download/2.58.0/SHA512SUMS
+sha512  d5d87a04ff5f8481516c00b07dd46726dfb3f0de67f4932874a0655b4adfa448a434056a131d727dd79a2f3ee1f6cc9aef5dc176a0b5ab546d8e94b6c0b38ee5  i2pd-2.58.0.tar.gz
 # Locally computed:
-sha256  e32cc0171ce3301afa67d83f61598f29af7efdf8218dfb66cc1a72224474ec2c  LICENSE
+sha256  5ec428c65b0bc8680e08daa75aa060fe72b5b3c3b89082ac02031e0f2d3d0039  LICENSE
diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index 402931c655..3681e6006e 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2PD_VERSION = 2.50.2
+I2PD_VERSION = 2.58.0
 I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
 I2PD_LICENSE = BSD-3-Clause
 I2PD_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
