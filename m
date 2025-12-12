Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D69D59D94
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 20:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33E6B41209;
	Fri, 12 Dec 2025 20:40:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yQAatIB0bB6q; Fri, 12 Dec 2025 20:40:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CDFA411FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765572000;
	bh=SeL5VqkcQs6CJtQbZh1jh4AemrtQ3+98ODgRSA3ClS8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i6EY1T/VzArl039tsLhzPKmDa3wLuQudhKmIM5WXaZKoLQWQYieauMXTAWiFyFAO2
	 jdG3CGMKrq5EDoTxa4jzFePFlKrr9PbeLVSMNIKJjzvfoIiINfGXirbZxenOBqaf0b
	 qPqe0y6frJ4dPTxLyvMn9v5PgvhmWfJ8+cvXHQ3cBzfY7AP6xp1vuJdV3a7bIe8F0i
	 6DMzNJZ0V6e8PXs0JX4HgPjJKrXoZV3MpTFUEt+mieSMB+LBnBN7u9GYuOvNzgx2NL
	 3AMzkr3zgxjQUXn/Ntr1K3zuurfez6+Civtr7+GwBBARWgvKjeBZPrwgPmoLcEYaX4
	 AbCMgTVF03TeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CDFA411FD;
	Fri, 12 Dec 2025 20:40:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 353512C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 20:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26DCB406C4
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 20:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k79DGP-7-x5j for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 20:39:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.148;
 helo=smtpdh19-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6DE2E403F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DE2E403F5
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6DE2E403F5
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 20:39:55 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id U9vdvKWvBclBZU9vdvLuut; Fri, 12 Dec 2025 21:39:53 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 12 Dec 2025 21:39:52 +0100
Message-ID: <20251212203952.327091-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNL6Z8sP26Kukc2FAB2wFjLq3PvKWMo+zHsFAsMxWxTj3n7igVYDCOA88bqU3pKN3myNV4TLWMofVkVYxbZfgEHTiTpu9Ab9oORpW7l5edNXLMziD4fW
 ulqmyL5cZhRGPSNIWXrruzEzx4oUXkJPOKNIQXCbDAKBWem/niApv6jjYoU6uMBYx+X7qOudaZDseYEaPmPUSBHT4QfWBodox3zINDiB/23edhXBdWOEMtL8
 1JBQwHFNRZZWbESO4NYqupE5/Cd5OobnUT1tNHj14IObVMVTn/zMVhNtESXWT7EKvCP0zE2HmV4zCb/HApnYMg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1765571993; bh=YaQmB7E0szknGm8Ruraa+6QHKO0PX9O3oh3/Xm7m/MY=;
 h=From:To:Subject:Date:MIME-Version;
 b=M/vD7d8FGPdsxiY0YJTPExZgc2BybBXrK8hWv6gs6E4hhRDv1KoZH3VBjbdq1vJWt
 595crus4MkpSDflOW1//GFprv0WeFctbEExCagFa6x1th3XERC7bVPEsvpEIsyQpNN
 wzU5cYudFXCygx3eUxOfqu8ocgmVLBsbh/KjwTayWF2q3gZ1zl5L6mDZmNMeAp18Hk
 7Q7rsTZ217BTeWXeMFCS1fMC4SGQSmgWZsdW2DwnT0te0MDdzW4ZPjBdhI/bFSFmvo
 sg+GOnW6L44a1Iewf8nX9kcdHDETH3Q46qEbOBjFlvppoKmngp+/sE2iPJF0cNvaHD
 5lwkVNbO2YB+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=M/vD7d8F
Subject: [Buildroot] [PATCH] package/rtl8192eu: bump to 2025-10-13 version
 on branch 5.11.2.1
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

This version allows to build with Linux 6.18.

Fixes:
still not occured.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8192eu/rtl8192eu.hash | 2 +-
 package/rtl8192eu/rtl8192eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8192eu/rtl8192eu.hash b/package/rtl8192eu/rtl8192eu.hash
index 42055cb194..05e53745c7 100644
--- a/package/rtl8192eu/rtl8192eu.hash
+++ b/package/rtl8192eu/rtl8192eu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  19e1686d6841f572d3274c96e3e4b66544027d559f5d4da528d8c8510f7d34e6  rtl8192eu-ee928d5dc065f328043711c271eb54f008e6245c.tar.gz
+sha256  50e289e6a1a4f5cf455e7525b2e2003c0ce58b6b55c1c3ab2e91e3b9fc357730  rtl8192eu-9664b2bfc4bcba55ca5a1284e67bad15ed910081.tar.gz
diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
index d96389edf0..91c250e07d 100644
--- a/package/rtl8192eu/rtl8192eu.mk
+++ b/package/rtl8192eu/rtl8192eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8192EU_VERSION = ee928d5dc065f328043711c271eb54f008e6245c
+RTL8192EU_VERSION = 9664b2bfc4bcba55ca5a1284e67bad15ed910081
 RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
 RTL8192EU_LICENSE = GPL-2.0
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
