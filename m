Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E55C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 20:46:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F363861151
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 20:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F363861151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C184783A9A;
	Thu, 14 Oct 2021 20:46:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bu6TlrPNaOcv; Thu, 14 Oct 2021 20:46:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 399D983A98;
	Thu, 14 Oct 2021 20:46:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD5211BF343
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 20:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB9AA40583
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 20:46:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eqgcDAg4mvQb for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 20:46:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp2.osuosl.org (Postfix) with ESMTP id A78EA4029E
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 20:46:45 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id b7chmwOIVXRKtb7cimFPL4; Thu, 14 Oct 2021 22:46:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634244404; bh=31cotpxxOHL9CgiGhnSUMVUQhWgdmQEAdIUEMtPS2UQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=LgNwhx5xfbcKGMMYJuMYt47UYDSvMB65xVqFPW4geyFrqz9MTDvM7bRvjn/1epj1a
 ZexYcX/SUTMRps3UpJ1BXn7mN8st3tOtLgQUWoOhy/5OOi+kq+IIaK0AtPpX108b6n
 YDGntSmyk6nspM6Kzv0hTpWNLW2dGpcIis/ps6l5MCO4S+Lw+urvx+vpOsFMjf2kEf
 kAX0mPez4aRA8w90pclrbRjm1avJl531jcqu3t9eOUUkjBvhMBAvVGM5AYBV2KWJYg
 fW89I3fVQYeZWy/+BZVnvsdNBygW/TsIrNAvscThuSQOjpink2lON5u8arh6spiPBm
 4rmvv3xHB2Glw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 22:46:43 +0200
Message-Id: <20211014204643.2433721-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfIJfdGk0BAiIo9d5S4OTIj0bqPR67Un2EeOWw/v8FwEZnwgSh4LztSMW/8ujNZQWyNkhLPJQjpdf57CUYuImWziuwDgCiQrcXdXsBgVDMEy1rFV63cl8
 k8VzH4Q6Ag3aCWn0NaedmXpFjpsRI+vmRcVhpdy9MS7MfORFrM4Z8BHw8+/P4xLjYcyFCZxBHSZjRTcSl3o5fgljDiOz7+9wlZ77Ij5itolr2BlqA4dj6Gc+
 EuysqnmN1yNpmxpVElJ4vakvSxnDLOOnhWE7xuRieNI=
Subject: [Buildroot] [PATCH] package/sunxi-mali-mainline-driver: update help
 section to make it work on Linux >= 4.20
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Linux version >= 4.20 we need to pass
drm_kms_helper.drm_leak_fbdev_smem=1 to make this driver to work.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/sunxi-mali-mainline-driver/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/sunxi-mali-mainline-driver/Config.in b/package/sunxi-mali-mainline-driver/Config.in
index 5db66c5bf6..9bc80944fb 100644
--- a/package/sunxi-mali-mainline-driver/Config.in
+++ b/package/sunxi-mali-mainline-driver/Config.in
@@ -25,5 +25,8 @@ config BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER
 	  starting from Linux Kernel >= 4.20 following options must be
 	  enabled:
 	  - CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM
+	  and following kernel command-line must be passed:
+	  `drm_kms_helper.drm_leak_fbdev_smem=1`
+	  since drm_kms_helper.drm_leak_fbdev_smem is set to 0 by default
 
 	  https://github.com/mripard/sunxi-mali/blob/master/README.md
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
