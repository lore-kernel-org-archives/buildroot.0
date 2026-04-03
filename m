Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2F0E8538E
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 20:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A6A640B8A;
	Fri,  3 Apr 2026 20:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zeV06J3rHkaC; Fri,  3 Apr 2026 20:21:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 922B940B8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775247667;
	bh=U6ewkJbOHdL9Hxd833Z+k0kh9fcUFJZgmZF32NOJraI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K/Sm+edAkOJ1RG65c+mAZg4ZIML1Az/I6o/bn7n8+SmosayVzoCIYdzcuHoXppfIv
	 ONQFFOP8q3s7HfO5AlEI313/3GaA502YUSuZF0y9gmS/Qg8CZxGR/WlLx/Pwx0RM1/
	 zPTLG7R40H2ECxtFrzvh4vZqCC29OXEvP6MiQJhKtCB7QrR4aaJTCqcV2q7z5kV0Mh
	 rxfwOMKwTs0RVBSqBTvtWBRSF+RbWA+Ln6FeTULJlIU25XxjolfKEzN3JECMHrMWjl
	 pGFzvYUBMV/Z0uVQxqBCJYXOWqjzSI2t6tJ4dbzIdkIDhYU18eB9xuJKkJeu5b39TG
	 /Q7B52cRd2HbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 922B940B8D;
	Fri,  3 Apr 2026 20:21:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D4301AF
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 20:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E46F6087A
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 20:21:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O2x8dD7SmrPh for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 20:21:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.87;
 helo=smtpcmd0987.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 975AB6086C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 975AB6086C
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 975AB6086C
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 20:21:03 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 8l0lwGvYZ4bDk8l0lwJpdc; Fri, 03 Apr 2026 22:20:59 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri,  3 Apr 2026 22:20:58 +0200
Message-ID: <20260403202058.3076288-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfH7azloZEgpu1gk8tM0uLvNwnAzShbDSoKQc8JF2zA5eh7KR6Fdy+b+KZ9QykeXgZ/634XeqjHNWEyP5qXU6/J2S9Y9cgzIpNYJACoFneO2AxVvG2Zgq
 UpQG9yUmMTT9RU0YeAHpG2bZo+pZdlyA8iRbuuki0POwJdROtlGJ2iSptPUtO2arnw3q4TAcGLGYwEOpgOcVdtnvrTYw7hC5dkhqd2wIuqklep7AOMXp5LBM
 IX2PSfmD+JyT9ce7rHtPBndRQaDli3BD+e3MwRdSmKc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1775247659; bh=iTcp1MyRV4z1T7VvqMuEZYTr8XlnZuW5+/EkKme/J8Y=;
 h=From:To:Subject:Date:MIME-Version;
 b=OSmxAdRkM98rtEXhKgZG6Hp+g/zQErizIbLLxiNNi1JJmvpX0FiOM1nd3XyC0K5tH
 TnjGBN4WO5MxYRgl3EqTHKqAWYSs30juwyWDPeERZBNxU7h37dj0wtrNLwSZfeUFmQ
 2/d2nv8kGG2k3SDA9rPj3Pqj2Z37pE7TFs+k2S6l17dbbMJvsTcN8IhZC7k0o0ZlD2
 CGJ+cNAMzVrMsIy7LSAFXjPSTgdYjnYVEe3+VWSOAtEOiGINoLsx3mfovFCFI+iUS0
 k+rJGVnxrPqpuVRPcg1ncu/7yN+MXAPsBM2iqwY29RMWdE7RDFT8uG09Kr1SShLVs5
 iihVomRiWwxkw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=OSmxAdRk
Subject: [Buildroot] [PATCH] package/mali-driver: bump to version 2026-04-03
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

Fixed build with Linux 7.0

Fixes:
still not occured

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mali-driver/mali-driver.hash | 2 +-
 package/mali-driver/mali-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mali-driver/mali-driver.hash b/package/mali-driver/mali-driver.hash
index 9929788a4d..38fe03f459 100644
--- a/package/mali-driver/mali-driver.hash
+++ b/package/mali-driver/mali-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  438bf34c19974a4e53f60cd95c38e5f6d94089284df7d60e773e7e4e9372a716  mali-driver-5731d558a34b82290eaad22a579a1bd8588d26e8.tar.gz
+sha256  12623376da6c8a92c5bbbf5e71d8a61f5b88a0c68a17a0dfda26fb64af2fe00e  mali-driver-fd0865346db356f08295df49f96ce0df47ccdd2f.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mali-driver/mali-driver.mk b/package/mali-driver/mali-driver.mk
index 90aeb9384a..9fde901bbd 100644
--- a/package/mali-driver/mali-driver.mk
+++ b/package/mali-driver/mali-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MALI_DRIVER_VERSION = 5731d558a34b82290eaad22a579a1bd8588d26e8
+MALI_DRIVER_VERSION = fd0865346db356f08295df49f96ce0df47ccdd2f
 MALI_DRIVER_SITE = $(call github,bootlin,mali-driver,$(MALI_DRIVER_VERSION))
 MALI_DRIVER_DEPENDENCIES = linux
 MALI_DRIVER_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
