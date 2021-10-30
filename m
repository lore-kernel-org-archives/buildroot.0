Return-Path: <SRS0=xEd5=PS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A0D2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 23:48:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D076360E78
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 23:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D076360E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A09694021C;
	Sat, 30 Oct 2021 23:48:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aLYUDY0-vQzd; Sat, 30 Oct 2021 23:48:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B62E540203;
	Sat, 30 Oct 2021 23:48:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66FD91BF48D
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 23:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4023240210
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 23:46:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gr2MmkstMuNL for <buildroot@lists.busybox.net>;
 Sat, 30 Oct 2021 23:46:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0638B40215
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 23:46:53 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id gy3mmpNlsrIRlgy3om79n7; Sun, 31 Oct 2021 01:46:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1635637613; bh=mbKYRfOLQSiQFM6J41xPF0BOw3m8cGegz5gspo86osI=;
 h=From:To:Subject:Date:MIME-Version;
 b=GmkBTkB4k08IcPTG1D2dkuJQ+CpaXNuN1QedYYzEbkHfxMywyGLp0rgYcgqoZKzVt
 VbVMpyS7e/nMJUjUi5uNNKQ78o8cpTGPrU1BEqs4BbLRBPEmb8L0qZQpAW1TOYaZUY
 1UXkjAd3b8ljy04Ot1uCDEpC9XnGVIYzrD5lFByL7IXpHrhQJ7iPbvop9qEOmcl+Jx
 p1inaL9G6Xfuj0KAwvOW91WMWJNELICnDgfuY3X1d7EoHJNcOtmD2q0AU1MlUww6Mj
 I/oxN/8lv4Fhd/7EiKLwhZ1ghnRZFqv2zXR8UPcy6aM/nLLXAG03oR24oJBB8h8lgL
 /CUXwORE60aYg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 31 Oct 2021 01:46:50 +0200
Message-Id: <20211030234650.939616-7-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030234650.939616-1-giulio.benetti@benettiengineering.com>
References: <20211030234650.939616-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfM8LKKuKX3VEuSx9437egQnWB/a1Bucfdg+bgi0zPrZ1GCYUDxS6NZmr9nF6My7D/2TLPR9Ou6z+bXUwloc21gAvEyzUGxKgUtut3GyD7GZ0ECgNcGrI
 edfLZuHfj5u13aaaJgCpalDnwJii7sbxtqhMmR3h/y2Gt90/uyTjecCNSwg/DFMyyIySIjN8TC89gqt64xkYNf2/a1O3IARz+UpISwmNHGWyA9TmXUsKeL3Q
 d8VOKQ8ExT+vqDxMGVh1ClkJxpgPpzs53Ha+FRRhQaW1AUAY5qGTawvQjHbQbtgFX889ax1ojHM/pPYAhFW35Z2+mdES9OneWmbPeJD+l2czeEDVgUGOh5KM
 Mg7U1Brl5BGgs3tBnJ5KR4uHpwv8kDb7sWKeoXtD6J9Qm+R5UrW+VuTGRf+MEglEt2TGNdCi
Subject: [Buildroot] [PATCH 6/6] configs/olimex_a33_olinuxino: uboot 2021.10
 needs openssl and python3
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

Uboot 2021.10 needs openssl and python3 so enable them.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730024

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/olimex_a33_olinuxino_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/olimex_a33_olinuxino_defconfig b/configs/olimex_a33_olinuxino_defconfig
index e2474db2ec..2067335951 100644
--- a/configs/olimex_a33_olinuxino_defconfig
+++ b/configs/olimex_a33_olinuxino_defconfig
@@ -19,7 +19,9 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A33-OLinuXino"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
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
