Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927BFCD5BC9
	for <buildroot@archiver.kernel.org>; Mon, 25 May 2026 20:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 464F740BB5;
	Mon, 25 May 2026 20:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z6wqdW7XzfFO; Mon, 25 May 2026 20:01:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 732CA40BEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779739283;
	bh=pxL5mCwJlwv9gQt5vbLKYBawiTP/1Rp/0UoqNfUOrlE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I/5n3G9D9pBahHHUbnbxoMAghUqVH2H0vJokTuRA4m50ElB8d7BhFL1zn3rkZ9q/9
	 Zq6tTES8jabvuiSmWJ6PGOSPowpPneXSEAbdDPR2hfzrJOxPn9fU6RoaqT8DE48GLc
	 EcE1HduRt8UybupcMDysAByQ9ta1LSIxAqCNrTyr7HsovH4nMlZaAZtgxWOWNDoO8D
	 v2EiWg2oG66yHCr8eUASUJuFT8NxJgAi3gyYsGltdLjnqNZRCkfEZlaEveSwQnIpNp
	 dYbnN5vTCNHlJZIxaFeH7a4MtoSo0x6Vkcd7kht/W+341HCNYV+MuyB1zuWfN9QXos
	 iOKaizawO28cQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 732CA40BEB;
	Mon, 25 May 2026 20:01:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D799297
 for <buildroot@buildroot.org>; Mon, 25 May 2026 20:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E6A6607EA
 for <buildroot@buildroot.org>; Mon, 25 May 2026 20:01:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 42J_FvumBaOz for <buildroot@buildroot.org>;
 Mon, 25 May 2026 20:01:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3B57F6070B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B57F6070B
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B57F6070B
 for <buildroot@buildroot.org>; Mon, 25 May 2026 20:01:21 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2bd9c3b550aso68729565ad.2
 for <buildroot@buildroot.org>; Mon, 25 May 2026 13:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779739280; x=1780344080;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZkLjiO4jvx5qhZTlX6gB9db7wgdsGpz9/+e1JamgQKw=;
 b=EoBIRvPIpuPgfflZIDuGq+/POPGEToJvVeQ1jN5BKY6p+cwItBKcxV60bTr42+Albw
 X49ykB/qzcHYzDQ6jGYW955RVwF9e68MelU4pgEDOOSn9BqtX0eHT673mJS0nXh94wma
 R6Y6w8bMy5RaRHFugKlyRgjYt9NLKxoRRRPaKoNT4gd7R5VvOTvycz1BTbFq2Qse3RPY
 ihFK0agRHO3sJuG8qeveg7PbzPAPIiqdpH7zn6JzqZWZ4TWDbcj3Gc6VynfQwf70VODi
 1+yn+8aXfX9QviGqcvIGQRVJXe43jF/VOun9NafkbuqazW8wZvtbEUbXoQM/xVJ3A5X0
 EdJg==
X-Gm-Message-State: AOJu0YwDWtE2fyuhJmMbOoxxJRUOMN7Bqp9ggq3fqlLYaQ588khKQSES
 YcAPH/8Ccc5YF4yrVVMl5kjK2hQTKJajemZqHIO88d9XnFiNyr4NAkeyop4Q/hAB
X-Gm-Gg: Acq92OEbBnYSR5nnk48T1A+H8Ry/ig5oJbIXLyO48bDEYw19fW3EhIYzKbh/TYKdFqL
 l9Igpng1KBBS6fsiGerghk0SNhZLJ3C+3HMdx2SirzHDHQLU4vi6ytZB91j8qQIT6FbrWrvI5CD
 AhQuoqH/I+vC81jOIIg/5YFWm2B4w/i3dll04/O/FEhoIKXyaS0PrCyxSH0BAhavzKc5nWJIbqk
 Udq5gaFr1L0n4IZh/Np//y2/lIWNCqGDU+xUsIIU7H/+qowWbaWGGaEvu8i7L/jP5eIrL5dPvws
 JgFkx/F+pLF1AlQzegUuVQCv7QvDnR2Ga313kAgJsD/A5NEadj4if0nmQn9hzSGlgxIktPeimNS
 nFgQtBfCUVIKa/NjKaRyVok3egxo6KOrEGnwijdPzfKegzZLpZCd6Chprw4PQDmvG/K/fnW6Ir/
 T0QosQbUS5BYSMOV/AEKGQdP/qCJ+Un2EkgDWO8LhQ3KZFKHyJUn13DLAkwDY=
X-Received: by 2002:a17:902:da83:b0:2b9:ff02:a14d with SMTP id
 d9443c01a7336-2beb06a5ebdmr165156975ad.18.1779739280494; 
 Mon, 25 May 2026 13:01:20 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2409:40e5:1172:1d84:d8ea:ba5f:a154:93eb])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb58b2ed6sm109874485ad.46.2026.05.25.13.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 13:01:19 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Tue, 26 May 2026 01:31:05 +0530
Message-ID: <20260525200107.639014-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779739280; x=1780344080; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZkLjiO4jvx5qhZTlX6gB9db7wgdsGpz9/+e1JamgQKw=;
 b=rxfu1/CcJB5jdbtGZwIwNo87tp6mUSAi+V1c324tPC0YY0HcUGRTY4G0RQymdRQ0wt
 Tx9K6JXOHvcdFuMi7i96WxG0F/e0v1i7Uj/xLawpoQ2HmPZLq5wnvwflnLS6rXv1QkOg
 GZOdgxGKX9YBOO8AMqe2pROXeXwnjRI/tvvLTu/epe8oZ4Fz07O6KqDUERLjO45efbqX
 0/TXVT9xXgr5od8vnoRalurcWagmRAVLmYUAb0x0hBtVtKehB6uc9eAW73dURfq4rloW
 EEoCj2Um3CziXGw9FF7jzwhYsAhyTm7YKGnniY/7Pvv8WQu3d0V3rYI8VpBKYYFxnvBe
 7nNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=rxfu1/Cc
Subject: [Buildroot] [PATCH] package/tk: bump to version 9.0.3
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

- 64-bit Capacity: Data values larger than 2Gb
- Unicode and Encodings: full codepoint range, added encodings, encoding profiles to govern I/O, and more.

For detailed changes, see the upstream changelog:
- https://www.tcl-lang.org/software/tcltk/9.0.html

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/tk/tk.hash | 2 +-
 package/tk/tk.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tk/tk.hash b/package/tk/tk.hash
index 77195582cf..9f5fbbaad5 100644
--- a/package/tk/tk.hash
+++ b/package/tk/tk.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  550969f35379f952b3020f3ab7b9dd5bfd11c1ef7c9b7c6a75f5c49aca793fec  tk8.6.15-src.tar.gz
+sha256  bf344efadb618babb7933f69275620f72454d1c8220130da93e3f7feb0efbf9b  tk9.0.3-src.tar.gz
 sha256  2cde822b93ca16ae535c954b7dfe658b4ad10df2a193628d1b358f1765e8b198  license.terms
diff --git a/package/tk/tk.mk b/package/tk/tk.mk
index 3efabd5ec4..34f3ab01b9 100644
--- a/package/tk/tk.mk
+++ b/package/tk/tk.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-TK_VERSION_MAJOR = 8.6
-TK_VERSION = $(TK_VERSION_MAJOR).15
+TK_VERSION_MAJOR = 9.0
+TK_VERSION = $(TK_VERSION_MAJOR).3
 TK_SOURCE = tk$(TK_VERSION)-src.tar.gz
 TK_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TK_VERSION)
 TK_LICENSE = TCL
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
