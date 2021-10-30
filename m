Return-Path: <SRS0=xEd5=PS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A62C433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 19:24:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC49D60F56
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 19:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC49D60F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85760401F4;
	Sat, 30 Oct 2021 19:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7_G7Dz9erHqK; Sat, 30 Oct 2021 19:24:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98312401B1;
	Sat, 30 Oct 2021 19:24:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 53D3D1BF956
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 19:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FE4D60643
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 19:24:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cCas1TcAlepb for <buildroot@lists.busybox.net>;
 Sat, 30 Oct 2021 19:24:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC7B6605BE
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 19:24:18 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id gtxgmu0aEXRKtgtxhm5rYK; Sat, 30 Oct 2021 21:24:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1635621857; bh=kC5gdksX0dLFDTWAGhYgKaM25o/kHqj95FBcx2SgzIk=;
 h=From:To:Subject:Date:MIME-Version;
 b=AEBV7tq9T6GIAshL4hNw2hPck1FR2XOuiWAlYAbnOlTPAya198zVScV7hTOxstq98
 5O92Md9JjXLpZiLfhxTJZ+IlRbhbbR6Ebtnle+LH/d96VI81CEClLxnJRHJewZ8WzK
 FrVgne5ahQ0ODU3Shd0XUQCJlhz2V0fho9k/QdgSNsAu0TOrTEazVI3qy1xSTVzm5b
 5LpU5dwpRnEw0/K4toNMD/kw7sxmdyo0lIsR8+P1mimOYrT3PUXmYo3NePkQ7N9sjc
 us39oR1ZBmeb4AUODVsjeYCE9JuXygUNI7gQcBb7j2kvpg6dKVNSXxZgxKmojX2PUJ
 390RdzLQOJXaw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 30 Oct 2021 21:24:16 +0200
Message-Id: <20211030192416.4012437-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030192416.4012437-1-giulio.benetti@benettiengineering.com>
References: <20211030192416.4012437-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHeeOoP5VNRUCgwaosQwVh/suMPp9Wqs+/+hvyqAnzRDhmISFh70/jiwT0zxo1HxJWdUBKfpCs8ANZKY4KSNRqeCTHCaLW7aKxYf83vpoIp3M8HbjUiX
 4Or3uSecoSCv7LuCsNXw9By/8kkAcXOjt/3yWBn8PA17wfTwAYhYGLLqwG3UzlUNsekeSjIMxMA0vnp9HzkHTycEQ34mCLkNfzyeaJLzIJpmDSRsXDMIMhuT
 gb5rnds/2WkiTLdiVb6c1HrRf42ljE+fcwFxPHOoQdW8BSu3jc2bj2N9G86GizWPcKAPDhV6J0YyaD8X/TX3hQ==
Subject: [Buildroot] [PATCH 2/2] configs/asus_tinker_rk3288_defconfig:
 u-boot 2021.10 needs python3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U-boot 2021.10 requires pylibfdt and consequently Python3, so let's
enable BR2_TARGET_UBOOT_NEEDS_PYLIBFDT
and BR2_TARGET_UBOOT_NEEDS_PYTHON3. This fix CI failure:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729725

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/asus_tinker_rk3288_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/asus_tinker_rk3288_defconfig b/configs/asus_tinker_rk3288_defconfig
index 609d061b61..6963fa939f 100644
--- a/configs/asus_tinker_rk3288_defconfig
+++ b/configs/asus_tinker_rk3288_defconfig
@@ -13,6 +13,8 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="tinker-rk3288"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 BR2_TARGET_UBOOT_FORMAT_DTB_BIN=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
