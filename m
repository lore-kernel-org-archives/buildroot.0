Return-Path: <SRS0=xEd5=PS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3765C433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 23:47:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A52E60E78
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 23:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A52E60E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9142401EA;
	Sat, 30 Oct 2021 23:47:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QxzwmLC1EO3t; Sat, 30 Oct 2021 23:47:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCCC44021C;
	Sat, 30 Oct 2021 23:47:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4530A1BF48D
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 23:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88E6340203
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 23:46:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qb1GrxuU61FO for <buildroot@lists.busybox.net>;
 Sat, 30 Oct 2021 23:46:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4982C401EA
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 23:46:53 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id gy3mmpNlsrIRlgy3om79mU; Sun, 31 Oct 2021 01:46:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1635637612; bh=6Wl/LVchiG83I6QAiBiQh/3vfb6BdJPWLLoywHvxNjQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=Js2bZUEoMN0wDqvJmT44mhSdeDdRUisu+npo/RUIAvp5ndZlpqRd3R2zRaLGF1soq
 V7Urgwi8qWaMLDoP/8xaCWTT8ycQooCOH29Qxs8e+vh3aGnkM3Q6Wo4M2VHv7MqMqt
 ZQk2UyppQMD5vuMAk7qDs7sA9TEl3mVfw4wL3AOW8vXre66OBdQoUUrMFEJKOT0jaA
 xeskWNGjJ5+AEpox+czOmn3rhZtXvYKsqQLwp/FGTOoQBP3y85PFI5NjXMqDW7PIoB
 h9jsjEReaFlFk38l0r7Phb+jgcZ4sRyCd9LmrwIE6S3M1QE3UqNZ69XllqtR05Zsmo
 Qf1RzXYZfBJAw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 31 Oct 2021 01:46:47 +0200
Message-Id: <20211030234650.939616-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030234650.939616-1-giulio.benetti@benettiengineering.com>
References: <20211030234650.939616-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfOl9x8O/4XJUi5yNes0d5TpmuXamba/6AV8Wx0cakKoRF3xe2Z6YhvTAENaaP6+9CAOYohreqlso9nu42TeEXWgjv8AeM62vlntD7mp+FqfwcmywUFmd
 pw3VJs8qvu/njFCJzZWgtSW51O40f7w7184NyurH70eMlPe+2cYF5A9hyjj/dlSShWScmXNC/6WFAEQo5AfhToB1ci0lzl0ldS4cVE+pZX9hD932q8Wz3m3K
 87tqhiRBvgAeOpNJxWyLdrjZkHMUJjgvXA8lPX2CqJW89tXCO37lzbGJHF3YCclHl4E24IQTyi/b1kuiBGGOZs5PSnEyWjR8ENYXzT38XDVy1BxK6/GzzWIp
 mlbmf+0Hf9qNCza5MRAasfP9x9vptgegaFmkJX4Z4SPFYXmetShw1cMD21mbCn9OCYtiFblJ
Subject: [Buildroot] [PATCH 3/6] configs/olimex_a20_olinuxino_lime2: uboot
 2021.10 needs openssl
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

Uboot 2021.10 needs openssl so enable it. Let's also alphabetize
BR2_TARGET_UBOOT_NEEDS_*.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730017

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/olimex_a20_olinuxino_lime2_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 248e5d7207..a298ca19ed 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -47,8 +47,9 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
