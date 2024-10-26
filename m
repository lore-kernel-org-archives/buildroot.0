Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7EBD10C02
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 19:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A06DB405C1;
	Sat, 26 Oct 2024 19:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dR0IoLfrncc1; Sat, 26 Oct 2024 19:00:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B351405DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B351405DB;
	Sat, 26 Oct 2024 19:00:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 84CB55C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDDD640197
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6_wy8bf9PH7f for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 19:00:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8F7E40254
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8F7E40254
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:00:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C402084042; Sat, 26 Oct 2024 19:00:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 21:00:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ca8f0ea762061ad04016d065f37e0c351d578f1
X-Git-Newrev: 122af7e193dce9781c41a5f79727823bac859fd7
X-Patchwork-Hint: ignore
Message-Id: <20241026190031.C402084042@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/icnova-a20-adb4006: add uboot
 patch for reliable bootclk
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=122af7e193dce9781c41a5f79727823bac859fd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-Reduce-cpu-clock-at-SPL-initialization-t.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/board/in-circuit/icnova-a20-adb4006/patches/uboot/0001-sunxi-sun4i-Reduce-cpu-clock-at-SPL-initialization-t.patch b/board/in-circuit/icnova-a20-adb4006/patches/uboot/0001-sunxi-sun4i-Reduce-cpu-clock-at-SPL-initialization-t.patch
new file mode 100644
index 0000000000..edaa47ac4e
--- /dev/null
+++ b/board/in-circuit/icnova-a20-adb4006/patches/uboot/0001-sunxi-sun4i-Reduce-cpu-clock-at-SPL-initialization-t.patch
@@ -0,0 +1,48 @@
+From 3cdf8aa3ff45e35a237285c107785bc3d2c6976a Mon Sep 17 00:00:00 2001
+From: Ludwig Kormann <ludwig.kormann@ict42.de>
+Date: Wed, 31 Jan 2024 11:28:19 +0100
+Subject: [PATCH] sunxi: sun4i: Reduce cpu clock at SPL initialization to 144
+ MHz
+
+Up until now cpu clock gets initialized at 384 MHz, which is
+the highest supported cpu clock.
+
+Recent A20 batches show an increased percentage of modules
+reacting very sensitive to operating conditions outside the
+specifications.
+
+The cpu dies very shortly after PLLs, core frequency or cpu
+voltage are missconfigured. E.g.:
+- uboot SPL selects 384 MHz as cpu clock which requires a cpu
+  voltage of at least 1.1 V.
+- Linux CPU Frequency scaling with most sun7i dts will reduce
+  cpu voltage down to 1.0 V.
+- When intiating a reboot or reset from linux the cpu voltage
+  may keep the 1.0 V configuration and the cpu dies during SPL
+  initialization.
+
+Therefore reduce cpu clock at uboot SPL initialization down
+to 144 MHz from 384 MHz.
+
+Signed-off-by: Ludwig Kormann <ludwig.kormann@ict42.de>
+Upstream: Not Applicable
+---
+ arch/arm/include/asm/arch-sunxi/clock_sun4i.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/arm/include/asm/arch-sunxi/clock_sun4i.h b/arch/arm/include/asm/arch-sunxi/clock_sun4i.h
+index 2cec91cb20..252c4c693e 100644
+--- a/arch/arm/include/asm/arch-sunxi/clock_sun4i.h
++++ b/arch/arm/include/asm/arch-sunxi/clock_sun4i.h
+@@ -141,7 +141,7 @@ struct sunxi_ccm_reg {
+ #define CCM_PLL1_CFG_SIG_DELT_PAT_EN_SHIFT	2
+ #define CCM_PLL1_CFG_FACTOR_M_SHIFT		0
+ 
+-#define PLL1_CFG_DEFAULT	0xa1005000
++#define PLL1_CFG_DEFAULT	0xa1004c01
+ 
+ #if defined CONFIG_OLD_SUNXI_KERNEL_COMPAT && defined CONFIG_MACH_SUN5I
+ /*
+-- 
+2.39.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
