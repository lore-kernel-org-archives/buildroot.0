Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CCBD3B7D1
	for <buildroot@archiver.kernel.org>; Sat,  6 Dec 2025 13:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53E5C8404E;
	Sat,  6 Dec 2025 13:17:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39aT2y60frcq; Sat,  6 Dec 2025 13:17:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DD8584032
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765027056;
	bh=Z4V4OaTpT7w1onP1TkQ/7tkziaMq3qLY3BqTT9TqCtQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gdlclLiGtlQ3tK9x5F1O/uZrCIU+CbBWyF3RAalOZnJCZokEv6mm1UPrtxpaKAUr5
	 38iORPWll46Bmm7++vE9Iy4PlZBm8flY3ljVfPERr9HUZ+Ucy6xWbet3Es6PJY6KT5
	 U71nhiOtGGBWE5pSbPOlQ9x9RZWdYJ/+2yiT8n73Aiicv3DggxViOdAJZeL3UK1MR3
	 PXTZGP3/XOqoQI68FWS5wuklzj0k1YPfr472m1EzdpTm+zVjqmjc4N5dJiOHeiqljd
	 OXXRrloLMgtp4ICatxPTm02h/p+jG/Db7xUmk3BU5nBZVfMUZYx5HPMU76nGCSfNb0
	 TTFT2cZ9Lwicw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DD8584032;
	Sat,  6 Dec 2025 13:17:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 84DD9151
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 13:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82B1F40A01
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 13:17:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bWfbFj01wjfT for <buildroot@buildroot.org>;
 Sat,  6 Dec 2025 13:17:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D82B640A00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D82B640A00
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D82B640A00
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 13:17:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0F6C7A4C02BB;
 Sat,  6 Dec 2025 14:17:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37184)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRsAE-000000007Xi-1JUl;
 Sat, 06 Dec 2025 13:17:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Alexandre Esse <alexandre.esse.dev@gmail.com>
Date: Sat,  6 Dec 2025 14:17:30 +0100
Message-ID: <20251206131730.697201-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765027051;
 bh=pEOiE4HKYfZKMmMyCOZ1lflqMGIzDKe3oJSHRFKgu0Q=;
 h=From:To:Cc:Subject:Date:From;
 b=SLObBYb2zYeZEwmzFC9L2Q65vHIeI7uxS5dR3YK36WDlQbDf6HutdZzG7s7XJEOnb
 cvG+CqvJYlPtVXxBh6AJjp4S9q+UXD7ZaW1HW2j768+GiExZCv5p8Y3JcqCbkdUBXc
 /z+uq8paut6rXjr7EI7ZkOISSvjTIp5A7GGwLxU4CqfarxAFO30OyUBNIIAfox/QHs
 vv/tyWQkyJXxDIQmXGromRdlcVaWiek7JW6NZaPVg/5Ku+YKZBnpSXQ4fgeXzruVni
 ZMCC8HTaHLP1657ziJnsXfKB0aDpHLhF55w3ekvJ40Dh2Huu2aiXTNx91YawAthrWG
 0+/WAfSLEkdjA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=SLObBYb2
Subject: [Buildroot] [PATCH 1/1] package/v4l2loopback: bump version to 0.15.3
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

Changelog:
https://github.com/v4l2loopback/v4l2loopback/blob/v0.15.3/ChangeLog

Fixes:
https://autobuild.buildroot.net/results/910/910e27b189c62f977bc42f7c53471334eb765168/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/v4l2loopback/v4l2loopback.hash | 2 +-
 package/v4l2loopback/v4l2loopback.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/v4l2loopback/v4l2loopback.hash b/package/v4l2loopback/v4l2loopback.hash
index c7fb226add..12ca4ec6cd 100644
--- a/package/v4l2loopback/v4l2loopback.hash
+++ b/package/v4l2loopback/v4l2loopback.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1e57e1e382d7451aa2a88d63cc9f146eab1f425b90e76104d4c3d73127e34771  v4l2loopback-0.13.2.tar.gz
+sha256  2758ea287da8dd34a0421c0dd50094a0342d22414e1bbccbbe92f41bbaa26b2d  v4l2loopback-0.15.3.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/v4l2loopback/v4l2loopback.mk b/package/v4l2loopback/v4l2loopback.mk
index a4ddf5e2d9..5c3562160f 100644
--- a/package/v4l2loopback/v4l2loopback.mk
+++ b/package/v4l2loopback/v4l2loopback.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-V4L2LOOPBACK_VERSION = 0.13.2
+V4L2LOOPBACK_VERSION = 0.15.3
 V4L2LOOPBACK_SITE = $(call github,umlaeute,v4l2loopback,v$(V4L2LOOPBACK_VERSION))
 V4L2LOOPBACK_LICENSE = GPL-2.0+
 V4L2LOOPBACK_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
