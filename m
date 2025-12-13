Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A937D5AE45
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 11:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C2B340A5B;
	Sat, 13 Dec 2025 11:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DJPTp1SEQEXG; Sat, 13 Dec 2025 11:56:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28DD540A29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765626996;
	bh=U+0L73CSulETy4T+wefj+fBrPp5OoryLeCxw7K/n8fw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iIepNCahx/9QtK9sHkGp9KbiHVtiylZawnhw3c5nyic4FSej4f1++as2MmxGIW5Hg
	 ggXIotx2P+rkt3MLPajiJEsVu4e4Js/jkXp3Y3oY56ZKTXoR8YwJDvhyuM6ZHY/AI7
	 JUL+3ZItAii6pjdTBmcwX9BEQj/jl2eJcK0F4EIHoVInRzrAnSG2WL8OFOC+kO83uf
	 ZRVSH+RAhPH0UhiHe4XL38RK/A6RPoFA3hxHSXKAgy8oeFAIE775GBBIPpEVlY/xbc
	 qQGmIegR6Hkgark8oW5eqaRYXVe80LdldSa0F3y7NzY0j3lV3JgXvZG0e8TNLBDnz7
	 H3B1YUITNiXlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28DD540A29;
	Sat, 13 Dec 2025 11:56:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DE3513D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BE2740A29
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:56:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aOikx9N6kQPN for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 11:56:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6537940A1F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6537940A1F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6537940A1F
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:56:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 440BBA4C341C;
 Sat, 13 Dec 2025 12:56:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36338)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUOEg-000000006mR-454Y;
 Sat, 13 Dec 2025 11:56:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Dec 2025 12:56:30 +0100
Message-ID: <20251213115630.1277092-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765626991;
 bh=aRCt2h6RxeesQdzwW3Pik20b/1sKyRN9YsIyFkkramE=;
 h=From:To:Cc:Subject:Date:From;
 b=T2pmvvXzpP7+9svlPt4JmtsL/2FSI83RVW7QMQf+kwkokYJSraWuJ76WrHyoXjd+s
 6/hVRHAGkI+6HBnif9oo/eNCOr5qIa914MOp5ra3RH8E64+3vmW74ccqaK5XK/4Dy8
 VN0NMuoBDVfOUDLwHP/Sx41ajvo+k8nZeHdVafQi+QpPZ/N1XvGqFqFXENH/Nm7Ks5
 ySlqP+QoFLPzQ13ffwOpRew2nxJhuqtlnkVz5jZs6a0xBGcRPFcWwRZkjFlNS26aCt
 +CVP7HowAj9faTc24odvJAOODT55MheN7EPXpeb72lUa+SKZ7iN6JIIPQsmA44PhAz
 LlW92pdhMWWBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=T2pmvvXz
Subject: [Buildroot] [PATCH 1/1] package/cmake: bump version to 4.2.1
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

https://cmake.org/cmake/help/latest/release/4.2.html#id1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 2bc7b740d2..7724fc4e85 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v4.2/cmake-4.2.0-SHA-256.txt
-sha256  4104e94657d247c811cb29985405a360b78130b5d51e7f6daceb2447830bd579  cmake-4.2.0.tar.gz
+# From https://cmake.org/files/v4.2/cmake-4.2.1-SHA-256.txt
+sha256  414aacfac54ba0e78e64a018720b64ed6bfca14b587047b8b3489f407a14a070  cmake-4.2.1.tar.gz
 
 # Locally calculated
 sha256  1e0d48f16c60f400838a96989684ae12cec35cb96688db11e8cb0204058cf4b8  LICENSE.rst
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 66b169440c..e9752640e5 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 4.2
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).0
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = LICENSE.rst
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
