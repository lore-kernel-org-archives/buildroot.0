Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B27C25B08
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 21:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EB5940241;
	Mon, 15 Aug 2022 21:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EB5940241
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OueuInl8Ugb1; Mon, 15 Aug 2022 21:48:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BFA140239;
	Mon, 15 Aug 2022 21:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BFA140239
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0EB9D1BF39E
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 21:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0BD860BD1
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 21:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0BD860BD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6EYnIJTtSykE for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 21:48:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A29D560AA7
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A29D560AA7
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 21:48:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 24A9B240004;
 Mon, 15 Aug 2022 21:48:19 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 15 Aug 2022 23:48:12 +0200
Message-Id: <20220815214815.2234201-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660600099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=pxmq8wllrptS0AsjLN/hB2z5sAMFqvgOzbIadUUkx2c=;
 b=UQHPLXaT+jHbjtCpbZHruDFev0KcgfXVzeGXFOaExVn0G5tdyBG9mfXgcONHpH1iQG2zqn
 HoEzjrfu2CesXb8YfBWLBkJlZ+Yd/ne8j3MNRphy6BLD/p6d9168oMVGuIGNMfmm0RjjsV
 0yfxjROSPiideshC9P7GKJghHHM3dcPDZwFT+4T67Xp08uSd5Weg6bEbRzGJY9wxDyjFJv
 H9dB4D8Ai/FAEHPErXDS5U4AXGIaqRO6VxUU8Fa1Zc1KDATNHSP0ayMgL1wRE7iB2sEvi3
 rxsFmNCWXtVU9s6vnp477zWgw4IyIL92ujEB2Dzr32LNFCGvVqFnSuEHdGeQZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UQHPLXaT
Subject: [Buildroot] [PATCH 0/3] Fix 3 Python test cases
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

This small patch series fixes 3 Python test cases. They fail because
we use an initramfs in all Python tests (and in many other tests). The
issue of initramfs is that if the initramfs filesystem grows too
large, the kernel fails to decompress it, and simply continues booting
with a partially uncompressed initramfs: some files are simply
missing.

In this patch series, we fix just the 3 failing test cases, for the
sake of having a reasonably minimal solution to apply in master. We
switch those test cases to use an initramfs to using an ext2 image
that is exposed by Qemu as a regular hard-drive.

Long term, we probably want to switch all tests to using this
strategy, so that we don't face a weird limit caused by
initramfs. That being said, there is no silver bullet: even if we
switch to ext2, we will have to define, for each test, the size of the
ext2 filesystem image. So there will still be some sort of arbitrary
limit that will have to be tweaked from time to time as a given test
grows in size (more dependencies, dependencies growing, etc.).

Best regards,

Thomas Petazzoni

Thomas Petazzoni (3):
  support/testing/tests/package/test_python_boto3: use ext2 instead of
    cpio
  support/testing/tests/package/test_python_botocore: use ext2 instead
    of cpio
  support/testing/tests/package/test_python_s3transfer: use ext2 instead
    of cpio

 support/testing/tests/package/test_python_boto3.py   | 12 ++++++++++++
 .../testing/tests/package/test_python_botocore.py    | 12 ++++++++++++
 .../testing/tests/package/test_python_s3transfer.py  | 12 ++++++++++++
 3 files changed, 36 insertions(+)

-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
