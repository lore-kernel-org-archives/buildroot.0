Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA465EF8FFC
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 16:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5F048137E;
	Wed,  4 Mar 2026 16:41:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id anLowo9kuEjQ; Wed,  4 Mar 2026 16:41:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE1348136F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772642473;
	bh=91lzo6CGAR79pP1faQXB0MofU426UKPN6N7Xb7QCORU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bGKnuHjOzVHNQFmX8HQtExF8UwrKN9ajRyLWY73iRJGy9O59/Yf5NhCO3P2CCjI7E
	 d93mSsmo1S+ts7kv+YK3VS13OOTOSj5ebW7JN6LNQ8hY7EXKNfdMU9aE8cGaPT5dOX
	 vlUkVWgBk/jCvag8WDmpBxahodcLFowdT6jju/7JNthbIpBdBeDGIjG1fsBQISUMk9
	 PmEfyySX7oPOWqiABVEdoeLTGJSMzVjgkpuBcOuBTNTD9vl4Llq3TBmuurMYueDJCV
	 BG7X04tRIuFEAHojqyNmg8L6GvesE85UKGjUTMJ/0Vgy+6O2TFlfCZFnTKWjbuRihU
	 yPZR6BQj5hvjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE1348136F;
	Wed,  4 Mar 2026 16:41:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 939041EB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 16:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84F69404E1
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 16:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7AiyGxl-6st9 for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 16:41:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.57;
 helo=smtpcmd0757.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AAD86404D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAD86404D3
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAD86404D3
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 16:41:08 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id xpHVvJH8stpTfxpHVvt5JF; Wed, 04 Mar 2026 17:41:06 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed,  4 Mar 2026 17:41:04 +0100
Message-ID: <20260304164104.1764264-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfB+WCPYuznvCeBGTrDredIlUJ9Uc1Tlk5S84ZIIP/nGklYu5xLIJSdPDzCeNzEmwRNcv3SZZ9t/P16RlhNemZvDng8s5l5arAtDdx1PsFde//K6811rf
 aR3EsetiLzeeR5PBgyjtgVw9GseyjLX5p7wz7ADrX7OKXYeWCYnZe9RCdQEJo4CBOqy+y8UKjYgcSU/anYSHbZVzlQsEOBDn3kJYPN6hozxz3ngyajv7/lPG
 CCRVRSEUCFciXq0SEjs/KH0S+atNn2805LUWD81fIyE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1772642466; bh=pbXBzio2T4p+HsL0gpNQLxvygS174HIGMWJUWwb3000=;
 h=From:To:Subject:Date:MIME-Version;
 b=TEI877c9NfnpvujtO5SZXcFgU5I4LbBx4gAt1QFpL051UDMKxIzJ//txUY3FenOZn
 UJ5KJKoJRWviN7P0JQqLGNwbWQCg8TuaFtLeyZ38EG10X7Mli8BepQ610C0MTZw7hy
 J57IWzVOY3OznNZIMEPNgaRHlAMaq7Kr+9ibvg7+EmqBBm0UgfOMTFul1J9WDAyJK2
 MtjrxKG5BKzOKQX6RWUrat+GVmB621Vh8Qjb5JvDpKEhpcFpj3brttDUG6b1FZS8AU
 Zg6o0FyupPuDcY3C842Gy/XM8GgNIQI6aNLYfjthd/c0CjjbNUT2VH6/u6IIEpK4cw
 j709LKVbMKqyQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=TEI877c9
Subject: [Buildroot] [PATCH] package/mali-driver: bump to version 2026-03-04
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

This version extends the Linux version we can build with from 5.11.0
back to version 5.10.220.

Fixes:
https://autobuild.buildroot.org/results/fa0c3acfcfc94b0600842ace6d8b09ba2c6c593f/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mali-driver/mali-driver.hash | 2 +-
 package/mali-driver/mali-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mali-driver/mali-driver.hash b/package/mali-driver/mali-driver.hash
index 0c0de10dac..9929788a4d 100644
--- a/package/mali-driver/mali-driver.hash
+++ b/package/mali-driver/mali-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  cafcf9af1c8ce5045dc0f077c51b87d204ddad6cf7e5db22bbf6a3d4356be972  mali-driver-5c13ca89d83dec3e51ed1880dff726838bfdecd3.tar.gz
+sha256  438bf34c19974a4e53f60cd95c38e5f6d94089284df7d60e773e7e4e9372a716  mali-driver-5731d558a34b82290eaad22a579a1bd8588d26e8.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mali-driver/mali-driver.mk b/package/mali-driver/mali-driver.mk
index 77ef8963a5..90aeb9384a 100644
--- a/package/mali-driver/mali-driver.mk
+++ b/package/mali-driver/mali-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MALI_DRIVER_VERSION = 5c13ca89d83dec3e51ed1880dff726838bfdecd3
+MALI_DRIVER_VERSION = 5731d558a34b82290eaad22a579a1bd8588d26e8
 MALI_DRIVER_SITE = $(call github,bootlin,mali-driver,$(MALI_DRIVER_VERSION))
 MALI_DRIVER_DEPENDENCIES = linux
 MALI_DRIVER_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
