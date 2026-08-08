Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3184EC5AC67
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 16:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEA2D605FD;
	Sat,  8 Aug 2026 16:15:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ucd_K-uM1Tn4; Sat,  8 Aug 2026 16:15:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A93A60667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786205709;
	bh=jQiecvFK32gz0w8x/S4fFpl9TwCyj1F0yawme1ismso=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=eeSVQphm41KEzXLAHzvGBBp/55HmwO3KyQLPn/dK6xyZwQfojU6RyRhdBpCQwasIr
	 eiWKAE5PCishjKqO1gYJXoqNSdcGraltjA5Q3jLXv+VJ5WmDCjFW0hnTNxpeCPWYpR
	 60qJU1c9NLohOJPyZZvw9oH9ngzustV40p61zNV4yiMquSBAQqW0iipcnbiQLPjeUc
	 fyPJyB4+qg9LMPMR7PRPHIHF2R44sQlk74oqkmHzZbdQsfPXiY9DB4o491y3hqvUs8
	 t/hPTUVe2YXKN9b07pfOtBMzMyUR/QH5OlOjpOMEJRIfUtqNmyO6Sh3d18XXQ6HI/y
	 68inV8ZUAJmTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A93A60667;
	Sat,  8 Aug 2026 16:15:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FF23282
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3525B400A9
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LZ1Sta2ay_Z6 for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 16:15:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0FD974008F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FD974008F
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FD974008F
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:15:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 413631A14E3
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:15:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0794C6045E
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:15:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 440B411C4859A; 
 Sat,  8 Aug 2026 18:14:59 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  8 Aug 2026 18:14:43 +0200
Message-ID: <20260808161443.1297794-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786205699; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=1tAMQM337NSi+1sJypWCrpy4K9uG6vcb/YQEVObcQ/Y=;
 b=IHzvzIr2/bTZSsA4+9IOE5AeUHBtmtr6dkUTYj+aa9zh2sRzIIUqX+7CRxf5WoTnXLSw+Z
 4pnVW6JgjS4aShKkyz/KF+VLc86XmOanFpHV5u6rZLvezeTSASOOn0FkkrXT7/ZzBO3hTp
 Me4we4SmUM+zbAAFJFYBjsOM8uftzfqClUcOOLf6C35+2457B/ICbM5yjvqkNyFus9Dz4U
 fnXjxjOauWRJGTl0IfC0OyTuhwG0k6Twx/2udGQNFrGV8a+dYqaGSPYoSeoNCVRxJzffzS
 7BFaCgKJ7foAq9b12pc8gOe+98zobcnBqtiQLNuJsU3TAP79kHvUcKj/XZmGwQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=IHzvzIr2
Subject: [Buildroot] [PATCH] package/mpdecimal: bump version to 4.0.1
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

Changelog (https://www.bytereef.org/mpdecimal/changelog.html) 4.0.0 to
4.0.1:

    features
        Add Cygwin support.
        Update config.guess and config.sub to the latest versions.

    build fixes
        Fix pkg-config files for custom paths.
        Set LD/LDXX unconditionally to CC/CXX, since LDFLAGS/LDXXFLAGS from ./configure rely on it.
        macOS: use libdir instead of RPATH for the install_name.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpdecimal/mpdecimal.hash | 2 +-
 package/mpdecimal/mpdecimal.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpdecimal/mpdecimal.hash b/package/mpdecimal/mpdecimal.hash
index 53ca182287..2aeedf6c20 100644
--- a/package/mpdecimal/mpdecimal.hash
+++ b/package/mpdecimal/mpdecimal.hash
@@ -1,4 +1,4 @@
 # From http://www.bytereef.org/mpdecimal/download.html
-sha256  942445c3245b22730fd41a67a7c5c231d11cb1b9936b9c0f76334fb7d0b4468c  mpdecimal-4.0.0.tar.gz
+sha256  96d33abb4bb0070c7be0fed4246cd38416188325f820468214471938545b1ac8  mpdecimal-4.0.1.tar.gz
 # Locally computed
 sha256  2713324211652ce4a60e6e21e54f9dc3004299e591b0933a352f1a89c5fb53c2  COPYRIGHT.txt
diff --git a/package/mpdecimal/mpdecimal.mk b/package/mpdecimal/mpdecimal.mk
index a2ab18523b..e9f13da373 100644
--- a/package/mpdecimal/mpdecimal.mk
+++ b/package/mpdecimal/mpdecimal.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPDECIMAL_SITE = http://www.bytereef.org/software/mpdecimal/releases
-MPDECIMAL_VERSION = 4.0.0
+MPDECIMAL_VERSION = 4.0.1
 MPDECIMAL_INSTALL_STAGING = YES
 MPDECIMAL_LICENSE = BSD-2-Clause
 MPDECIMAL_LICENSE_FILES = COPYRIGHT.txt
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
