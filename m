Return-Path: <SRS0=xEd5=PS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B6CC433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 23:47:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D211C60F4B
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 23:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D211C60F4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8E3480D33;
	Sat, 30 Oct 2021 23:47:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2UqM08zkWNHE; Sat, 30 Oct 2021 23:47:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2477B80D1B;
	Sat, 30 Oct 2021 23:47:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5627A1BF48D
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 23:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8DAA401EA
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 23:46:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id czW7cuBI7Vaz for <buildroot@lists.busybox.net>;
 Sat, 30 Oct 2021 23:46:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA15340210
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 23:46:53 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id gy3mmpNlsrIRlgy3om79mt; Sun, 31 Oct 2021 01:46:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1635637612; bh=7OKEO4tx4LTeVtF8OHqzue/MOCRrljCGfMnNp0VtJoE=;
 h=From:To:Subject:Date:MIME-Version;
 b=BdqVWb1TmaflhO0fMFcKrtJlfOqCP4Q1uTlOLGN3d1y+Zi2Dt1XKsOWQADfXGNBs2
 5nbRnc3aLNSY01US30d6Vuby6GuGeHb53/FS7y3zyl9EECYkVlL210OEzuRkXUceTV
 Klu6aDAUfFSXXrTcrXITb4jwdBvJL5B+91hIWx9z4w8qrrtGo/qwjMiJ/Bzm0GF9LW
 p8OLG7E5C8Kh3pxv0OQyyLw1FOmNGJRRVZhpIki2FL75KQMgUdxLfy5wNNN1rAUJ/W
 eD9v9UKoeIyAWHSMn9poGo6pwsJCterUJUm0eMXo/qYJalZPzSrKJ/vNMWuWH/aki6
 B/HepLxAR6NNg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 31 Oct 2021 01:46:49 +0200
Message-Id: <20211030234650.939616-6-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030234650.939616-1-giulio.benetti@benettiengineering.com>
References: <20211030234650.939616-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfOl9x8O/4XJUi5yNes0d5TpmuXamba/6AV8Wx0cakKoRF3xe2Z6YhvTAENaaP6+9CAOYohreqlso9nu42TeEXWgjv8AeM62vlntD7mp+FqfwcmywUFmd
 pw3VJs8qvu/njFCJzZWgtSW51O40f7w7184NyurH70eMlPe+2cYF5A9hyjj/dlSShWScmXNC/6WFAEQo5AfhToB1ci0lzl0ldS4cVE+pZX9hD932q8Wz3m3K
 87tqhiRBvgAeOpNJxWyLdrjZkHMUJjgvXA8lPX2CqJW89tXCO37lzbGJHF3YCclHl4E24IQTyi/b1kuiBGGOZs5PSnEyWjR8ENYXzT38XDVy1BxK6/GzzWIp
 mlbmf+0Hf9qNCza5MRAasfP9x9vptgegaFmkJX4Z4SPFYXmetShw1cMD21mbCn9OCYtiFblJ
Subject: [Buildroot] [PATCH 5/6] configs/olimex_a20_olinuxino_micro: uboot
 2021.10 needs openssl, pylibfdt and python3
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Leon Anavi <leon.anavi@konsulko.com>, Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Uboot 2021.10 needs openssl, pylibfdt and python3 so enable them.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730020

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/olimex_a20_olinuxino_micro_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/olimex_a20_olinuxino_micro_defconfig b/configs/olimex_a20_olinuxino_micro_defconfig
index 93912b95c0..9115358a69 100644
--- a/configs/olimex_a20_olinuxino_micro_defconfig
+++ b/configs/olimex_a20_olinuxino_micro_defconfig
@@ -36,6 +36,9 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino_MICRO"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
