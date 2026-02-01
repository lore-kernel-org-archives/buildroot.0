Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33889E6529E
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 18:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECAA160F92;
	Sun,  1 Feb 2026 18:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EF7f5sA2bp5d; Sun,  1 Feb 2026 18:40:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2646F60B3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769971229;
	bh=O+BjnM5m3gkEcmGt8OWgl3/whpHschBLpeM2Ga/trU0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KPnRQzEHLQcK2tiUxyH5vT15RpY745Xe/lkm9Y5bKoLbiynAHpGSqX4/6AnCxZHq7
	 W/yXK3PiqUpxK8uDtsXGIDjBVszq9FucCZkiFV+X+i44x3m+oF8HU1SB6org/RdFfT
	 rFcUGOpJOdUfAy8SSgjf0bVS9Q8ojsoNaOC2UGYTmem7+oPMBoUfx3L6//8bFv1RLP
	 8OQlogfalkfxZTpXkUlIEF9JdvWgGx7RRwVJ7blzn3jiNkwT9lw8Di6OLEvrq+aMpj
	 2Mn8jyCncisuv9UJ4i+DKsp5ALr2Vt3NKGvzXcwjeC+xWd0XjLXJeCl0c6tEpmSyPW
	 dwkboXafIwwgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2646F60B3F;
	Sun,  1 Feb 2026 18:40:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DE2941E0
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 18:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B28A840766
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 18:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hE9IbcdgyYiZ for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 18:40:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 559DB4075C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 559DB4075C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 559DB4075C
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 18:40:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 525EEA4C547A;
 Sun,  1 Feb 2026 19:40:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47808)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vmcMt-000000007at-0gAZ;
 Sun, 01 Feb 2026 18:40:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Feb 2026 19:40:18 +0100
Message-ID: <20260201184018.3381183-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1769971219;
 bh=lC2L8uwzlVfvMSq3TuwKLyl0EyBWy8CEgKr7WV23gZg=;
 h=From:To:Cc:Subject:Date:From;
 b=buZJHy4XIbY/tHqvBpsi5tZGfrTXdAC1tkvTIe04Amd36Uzu5KDKrGcPdqMzIRXJp
 aZMPbNOPCn5oWjfeIeorIJ8VX7YEdfOIhveK1s3xxwLpGzOER59/Pr7tq5MiQq+S+c
 WfWglVG1gt+I5P/B9QN3R7H01t/Kspk8tdxtVgIatQLgRQerhuWA6B9WTWvFOIoW4F
 fMhZovwUKsq0+5Rd8pJ0VPw5j9muNC+Uwq19TfjLhAFZxyMQRehdmrM/u6w81MysyR
 EUYAEGL1BVs/2Jy4yyipKX+T2ZCTljTQ9hTmoG+DJ7lfZLT+haQJUdUshpw8cBpwnl
 4YEujPFssb3Ig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=buZJHy4X
Subject: [Buildroot] [PATCH 1/1] package/cmake: bump version to 4.2.3
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

https://cmake.org/cmake/help/latest/release/4.2.html#id21

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 32c334c928..88744ac703 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v4.2/cmake-4.2.2-SHA-256.txt
-sha256  bbda94dd31636e89eb1cc18f8355f6b01d9193d7676549fba282057e8b730f58  cmake-4.2.2.tar.gz
+# From https://cmake.org/files/v4.2/cmake-4.2.3-SHA-256.txt
+sha256  7efaccde8c5a6b2968bad6ce0fe60e19b6e10701a12fce948c2bf79bac8a11e9  cmake-4.2.3.tar.gz
 
 # Locally calculated
 sha256  1e0d48f16c60f400838a96989684ae12cec35cb96688db11e8cb0204058cf4b8  LICENSE.rst
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 63ddb927fc..f5d1787d19 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 4.2
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = LICENSE.rst
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
