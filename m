Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A95D116FE
	for <buildroot@archiver.kernel.org>; Tue,  2 Dec 2025 20:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A0C683FB6;
	Tue,  2 Dec 2025 20:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9U6qFIbD0SRY; Tue,  2 Dec 2025 20:18:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DA2D83FB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764706717;
	bh=+XHqCPJP4M0qQa2TL85haRsXeDYjHwsgF3EBCl1qkLs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gGKFT6BpLNUoWHBaQ9uRLz8a+4iurpi7YeGiOE45zGFhbq3KSErViSYZj4mb02zfi
	 iBYUnpdAJQHqUdscZPIHOGZ2MAU2/8TzbjcFygGkSbArNl7X4aWjOEDPC6E/iyd5sM
	 kh/zPCBNCu8Y+E56Knct0l8Zo/H6GdGDypjseSV3YKHRuWf2f+WjdKROqDpeZB1ZHi
	 vsJSO3YTrwU+ZVv2x81oVSKEkzx0Ea7+eOGxtRyHqhrLlA7SKMOrR1/rRzVhcd+okv
	 zyKwcdoiUAF3upCp3hpJI9n5m1nUUY9J0bhXEj5kFJ3+/5RzwqLTGQb5eHpYbADr5U
	 fqcyrMOwoaF4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DA2D83FB0;
	Tue,  2 Dec 2025 20:18:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 24792E4
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 20:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A6AC83FB0
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 20:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gyHD9qTrIgNM for <buildroot@buildroot.org>;
 Tue,  2 Dec 2025 20:18:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7FB0383FAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FB0383FAE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FB0383FAE
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 20:18:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CA651A4C0EC2
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 21:18:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38036)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQWpT-000000002JP-0Ma0
 for buildroot@buildroot.org; Tue, 02 Dec 2025 20:18:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  2 Dec 2025 21:18:31 +0100
Message-ID: <20251202201831.1762887-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764706711;
 bh=D8xTk40xLTUhjjvbicoKea23kNQH+q9HIJIijSABeJY=;
 h=From:To:Subject:Date:From;
 b=SOByz/cyRENiz2Ie12G+DUjSTiJifqciG5A3XBX6pByqeFAX0G1YTAcoXeYb6CkOG
 iy/lPOkRDuqgXBgmq+Q/kqCIPl48CJWaxa/8pABlb/PdqiImTcPRxHYzRcsXjIJSob
 dymb8+NHkw38eN5G2U2XrpKtNQiswAuvHHqfymB+JjDv5Dog87+Z0OhXCLNo51gUEm
 Mhw6ppDKkgA/BqjMrVEb/P1Zlz/ePQxkyDzLE07Z2qSwJ0RDmkYD7GuSNEaeX+ozlc
 F2bIXHkcPTskrFsRn590nok468dg2E5Jy0++FR3f957x2gNkvUt0NPoDF5ojq2ztoh
 KmqC9a+o+APQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=SOByz/cy
Subject: [Buildroot] [PATCH 1/1] package/snappy: bump version to 1.2.2
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

Release notes: https://github.com/google/snappy/releases/tag/1.2.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/snappy/snappy.hash | 2 +-
 package/snappy/snappy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snappy/snappy.hash b/package/snappy/snappy.hash
index 0439ca8a7e..a86b36b349 100644
--- a/package/snappy/snappy.hash
+++ b/package/snappy/snappy.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  736aeb64d86566d2236ddffa2865ee5d7a82d26c9016b36218fcc27ea4f09f86  snappy-1.2.1.tar.gz
+sha256  90f74bc1fbf78a6c56b3c4a082a05103b3a56bb17bca1a27e052ea11723292dc  snappy-1.2.2.tar.gz
 sha256  55172044f7e241207117448a4d9d6ba1d0925c8ad66b5d4c08c70adfa9cc3de6  COPYING
diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index 21c76cd50d..57c688b673 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNAPPY_VERSION = 1.2.1
+SNAPPY_VERSION = 1.2.2
 SNAPPY_SITE = $(call github,google,snappy,$(SNAPPY_VERSION))
 SNAPPY_LICENSE = BSD-3-Clause
 SNAPPY_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
