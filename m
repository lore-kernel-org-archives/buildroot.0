Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6150EC71150
	for <buildroot@archiver.kernel.org>; Sat, 14 Jun 2025 13:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25A5C40770;
	Sat, 14 Jun 2025 13:40:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PZQAY1h3Gzna; Sat, 14 Jun 2025 13:40:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E08B40572
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E08B40572;
	Sat, 14 Jun 2025 13:40:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 11BE01A4
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 031D260ACC
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:40:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9UDh1ueIFsxY for <buildroot@buildroot.org>;
 Sat, 14 Jun 2025 13:40:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AA22D607CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA22D607CE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA22D607CE
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:40:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08ea.dip0.t-ipconnect.de [91.58.8.234])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 77038A4C0C64
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 15:40:41 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43298)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uQR7g-000000008Su-0JiM
 for buildroot@buildroot.org; Sat, 14 Jun 2025 13:40:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Jun 2025 15:40:40 +0200
Message-Id: <20250614134040.678676-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1749908441;
 bh=GZ6fOwdHbXAeN+7FyNMtmtgXNb17L1kROWCfWGLn9EY=;
 h=From:To:Subject:Date:From;
 b=PoVDinI3n5XVhrU5rqxrio67Dzp3NKGbFr1AhNgGECUg1YmEv6fBXqBwlRxnHiivm
 kPBkYTFUMi7wSfPZqvqB+Teujpc5HCMV8HDH3tMXST6MxIlTM6HpczCgGQRFZr0mcY
 fmUnN9uoco9/wdej/0oFlZxMlQb9WVv2+bYvMb0KmmyLFiQ6JywB2cCLjimeI1nfNz
 X+DIU5QSeQ93NunIAER4ZCkW++6pKdoG3EQ99Lyr/BTyONOXYVgTmz1Q0tc6fmm/I+
 DXJFIMdigDHfh8MBqmt+j+ay3Ab6nJqt4hi2Ushx9KMkDobXy+/Q8vXhc1H4BsTWiR
 TR5VrVOGhtJ7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=PoVDinI3
Subject: [Buildroot] [PATCH 1/1] package/nano: bump to version 8.5
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

Changelog: https://www.nano-editor.org/dist/v8/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 4f31eedef9..c4866b99db 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v8/nano-8.2.tar.xz.asc
+# https://www.nano-editor.org/dist/v8/nano-8.5.tar.xz.asc
 # using key 168E6F4297BFD7A79AFD4496514BBE2EB8E1961F
-sha256  d5ad07dd862facae03051c54c6535e54c7ed7407318783fcad1ad2d7076fffeb  nano-8.2.tar.xz
+sha256  000b011d339c141af9646d43288f54325ff5c6e8d39d6e482b787bbc6654c26a  nano-8.5.tar.xz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index a1b94c90d8..e3005f4dd0 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 8
-NANO_VERSION = $(NANO_VERSION_MAJOR).2
+NANO_VERSION = $(NANO_VERSION_MAJOR).5
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
