Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7180CF07DE
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 09:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95B6240025;
	Thu, 10 Oct 2024 09:21:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zoAhetLUoCwi; Thu, 10 Oct 2024 09:21:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46EB540F70
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46EB540F70;
	Thu, 10 Oct 2024 09:21:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F16A91BF4DB
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 09:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED7D581761
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 09:21:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bLrQwiIeRrDc for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 09:21:43 +0000 (UTC)
X-Greylist: delayed 362 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 10 Oct 2024 09:21:42 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B6FC8175D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B6FC8175D
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=81.169.146.219; helo=mo4-p00-ob.smtp.rzone.de;
 envelope-from=ludwig.kormann@ict42.de; receiver=<UNKNOWN> 
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.219])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B6FC8175D
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 09:21:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1728551737; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=lvcrMBY+gMxGnSRMD8tYq5w1w7JjbyLD/Yzzpmw5MnJqJONbc3S8EYWG1voKKCPa2L
 jcmQNJWCttY3f9bPz7f6GBOaczVwPtoyWf4syouAhZp/aB5Zzrg7fKHOBWmeYQqDP8Zp
 GmFZWCY6EOx/TcxEXhwy1akyfQj8J4P81cLzIBoDVGvuxlTcS6BY0a4SWV20t+XXbvFk
 wwZp3dAtYJmtXFcFuhJ6AlK2yMWeacggNkaRgpHGhxvbclbpl+OsIhlMpHtMFim2CTEw
 2Z5C099LdaHyl2VF1fFj7C0OQrz6f678XMamB/ae6rcweYeve4X4AIxAC0EY3rP7U/KA
 8UTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1728551737;
 s=strato-dkim-0002; d=strato.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:To:From:Cc:Date:From:
 Subject:Sender;
 bh=NT7hs2RxqA+0g3Zgie06ppW4IoCh2VozWU89baRw9zA=;
 b=Mjwq45cFGTtDK1ERMDkTbd4TBVN5KQRaWADHNUg5KDAuuYN0aOu01a+QhP8edvQpkL
 L/8irjVl34ontjIhvJsqhSCW965etIQn0lut4V7c4eHuM/s24Cq1jl+6sjAxHsXfRSw+
 jD/w/fqHej11SpssYbZFaWJPhNwb5pEZ2CauCpx9Isz8/z0M9sKgN3qy5a1g0iNSv3Z/
 LEdhJHKFKUfwJtYuAgCUOvuxSsFCHCgKsSg6S965i+e+wNnMvjNBo2yMNvdFveaXuT5N
 KtaPWXtK8/O6nKO16T1TrEuWsUef1RKdCKHLjdOOpkExr0St3IuS/D23FGxVGu0mA86B
 z2vw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":IHkAYkmvNfSwjg/qSc4u8zZOVaURsoXe3UH2mQA0KgllCYtN8WqJZ5aMuoQuCdrfzui0vA=="
Received: from debian-test.local.in-circuit.de
 by smtp.strato.de (RZmta 51.2.8 DYNA|AUTH)
 with ESMTPSA id j0dbb009A9Fb2eS
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate) for <buildroot@buildroot.org>;
 Thu, 10 Oct 2024 11:15:37 +0200 (CEST)
From: Ludwig Kormann <ludwig.kormann@ict42.de>
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 11:15:31 +0200
Message-Id: <20241010091531.1943185-2-ludwig.kormann@ict42.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241010091531.1943185-1-ludwig.kormann@ict42.de>
References: <20241010091531.1943185-1-ludwig.kormann@ict42.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1728551737; 
 s=strato-dkim-0002; d=ict42.de;
 h=References:In-Reply-To:Message-Id:Date:Subject:To:From:Cc:Date:From:
 Subject:Sender;
 bh=NT7hs2RxqA+0g3Zgie06ppW4IoCh2VozWU89baRw9zA=;
 b=cXbG6lZQddyarXerJbC+Gjsz86y0x+p1OTsC5IrpBOd4g5slakHknLkrKGYYQJ5mou
 uwOOMc8PO57kRfgmxxBZLad63qMuHtB+zEGss78XSXjbSQy+8XPZncJzszK1OXTYS8u9
 Ixe03JbLtOGC3c0KtKNgB0vFa7CjWPSIGvU/JVJ4ha/j3qKZvrjAlCi9waSkZkVOaKsy
 Qrdfc5ADHbEGD5k7rh+/bE6RXY5k8AG1cmoKMsO9ZezmrSc5fAh/zaf+r/xq4pXvzCMx
 lfnNDbPBMWiKQImZLdNdRMlfC3LGUvWNx//IoTyANGFbwCmJTvTm91poBx/gxFffRPVv
 bePg==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1728551737; 
 s=strato-dkim-0003; d=ict42.de;
 h=References:In-Reply-To:Message-Id:Date:Subject:To:From:Cc:Date:From:
 Subject:Sender;
 bh=NT7hs2RxqA+0g3Zgie06ppW4IoCh2VozWU89baRw9zA=;
 b=tlG0LASUmL2RqicdAnvl2VPPgAj+YGklm6e4L+0ViJEANPzdWB5Hnev94piDM2Lrhz
 P5wxEFvoAkTA5pQ4ZDCA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=ict42.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=ict42.de header.i=@ict42.de
 header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=cXbG6lZQ; 
 dkim=pass header.d=ict42.de header.i=@ict42.de header.a=ed25519-sha256
 header.s=strato-dkim-0003 header.b=tlG0LASU
Subject: [Buildroot] [PATCH 2/2] configs/icnova-a20-adb4006: add uboot patch
 for reliable bootclk
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Up until now cpu clock gets initialized at 384 MHz, which is
the highest supported cpu clock.

Recent A20 batches show an increased percentage of modules
reacting very sensitive to operating conditions outside the
specifications.

The cpu dies very shortly after PLLs, core frequency or cpu
voltage are missconfigured. E.g.:
- uboot SPL selects 384 MHz as cpu clock which requires a cpu
  voltage of at least 1.1 V.
- Linux CPU Frequency scaling with most sun7i dts will reduce
  cpu voltage down to 1.0 V.
- When intiating a reboot or reset from linux the cpu voltage
  may keep the 1.0 V configuration and the cpu dies during SPL
  initialization.

Therefore reduce cpu clock at uboot SPL initialization down
to 144 MHz from 384 MHz.

Use patch until KConfig option in uboot becomes available.

Signed-off-by: Ludwig Kormann <ludwig.kormann@ict42.de>
---
 .../uboot-sun7i-a20-reliable-bootclk.patch            | 11 +++++++++++
 configs/icnova-a20-adb4006_defconfig                  |  1 +
 2 files changed, 12 insertions(+)
 create mode 100644 board/in-circuit/icnova-a20-adb4006/uboot-patches/uboot-sun7i-a20-reliable-bootclk.patch

diff --git a/board/in-circuit/icnova-a20-adb4006/uboot-patches/uboot-sun7i-a20-reliable-bootclk.patch b/board/in-circuit/icnova-a20-adb4006/uboot-patches/uboot-sun7i-a20-reliable-bootclk.patch
new file mode 100644
index 0000000000..ce83f59e4b
--- /dev/null
+++ b/board/in-circuit/icnova-a20-adb4006/uboot-patches/uboot-sun7i-a20-reliable-bootclk.patch
@@ -0,0 +1,11 @@
+--- uboot/arch/arm/include/asm/arch-sunxi/clock_sun4i.h	2024-10-10 09:34:01.346401734 +0200
++++ uboot/arch/arm/include/asm/arch-sunxi/clock_sun4i.h.modified	2024-10-10 09:33:55.146402528 +0200
+@@ -141,7 +141,7 @@
+ #define CCM_PLL1_CFG_SIG_DELT_PAT_EN_SHIFT	2
+ #define CCM_PLL1_CFG_FACTOR_M_SHIFT		0
+ 
+-#define PLL1_CFG_DEFAULT	0xa1005000
++#define PLL1_CFG_DEFAULT	0xa1004c01
+ 
+ #if defined CONFIG_OLD_SUNXI_KERNEL_COMPAT && defined CONFIG_MACH_SUN5I
+ /*
diff --git a/configs/icnova-a20-adb4006_defconfig b/configs/icnova-a20-adb4006_defconfig
index 948b054d83..4cf7826346 100644
--- a/configs/icnova-a20-adb4006_defconfig
+++ b/configs/icnova-a20-adb4006_defconfig
@@ -38,6 +38,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="icnova-a20-adb4006"
+BR2_TARGET_UBOOT_PATCH="board/in-circuit/icnova-a20-adb4006/uboot-patches"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
