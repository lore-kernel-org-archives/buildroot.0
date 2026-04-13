Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56870EBFD1E
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 09:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28FBD84494;
	Mon, 13 Apr 2026 09:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id empbi85yCxvp; Mon, 13 Apr 2026 09:08:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E750084060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776071327;
	bh=+0Vls6bedi5Ky6A2Q7MDzuMTKosIl6qd/+3VJoKPsv0=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=rYbeKq49aTtQNxd1+Rf8q2iMw4MrR7ljahKKws6ou5fVlnSTqxvQQrY4yzaUTdMU8
	 CjAObNjOw3usAhS9OvnhlrLnewGzzNKqZIEWu84RXyqaGn9V3fbBuEhNleXa/PQsoo
	 b7Gmr2IV9LUafbi3i9OHtvgCtCTrdeghVFzoFshb43VnURTbxUIi1r6kXcEvGKcLyJ
	 aL9LIqiszj1iQ4Gzv83ioC548FA9JwmtlVknOYbsL7uH4TTNt7GXgpzl+rSR49usek
	 uAcEks8aN8QQSHBgLYyW+0A9p0c0R8Mwez9RXbRsMFbjJoxc714xiqm/eEHLN3wPOq
	 Sp58FC2YFeGdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E750084060;
	Mon, 13 Apr 2026 09:08:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 55018283
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 09:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52206608DA
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 09:08:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4k3oNjP6Y5nd for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 09:08:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=83.166.143.169;
 helo=smtp-8fa9.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D8170608D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8170608D4
Received: from smtp-8fa9.mail.infomaniak.ch (smtp-8fa9.mail.infomaniak.ch
 [83.166.143.169])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D8170608D4
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 09:08:42 +0000 (UTC)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:7:10::a6c])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fvM5g5bpKzqhd;
 Mon, 13 Apr 2026 11:08:39 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4fvM5g1bPfz4V5; Mon, 13 Apr 2026 11:08:39 +0200 (CEST)
Date: Mon, 13 Apr 2026 11:08:27 +0200
MIME-Version: 1.0
Message-Id: <20260413-linux-werror-v2-1-e29e45398c56@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ6CMBBEf4Xs2RpYKxFP/ofhAO1W1hgwW6gQw
 r/b4tnjy8y8WcGTMHm4ZisIBfY89BHwkIHpmv5Bim1kwBzL/IRn9eJ+mtWHRAZRlStJN1brNnc
 QJ28hx/Ouu9c/9lP7JDMmR2p07MdBlv0vFKn3Rx0KVShsq4tz2KCx9ma6mCxHS1Bv2/YFoAUX7
 7oAAAA=
X-Change-ID: 20260325-linux-werror-9f6e4ad44b0f
To: buildroot@buildroot.org
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1776071319;
 bh=xxna9uscV0fSFyBQ5BBxxQ3LDR7RG+hyiUIjPA97rro=;
 h=From:Date:Subject:To:Cc:From;
 b=RbcRSjSDyMkpMMP0UzgXWySV2hGinWPoW2IB1+HrDtG5PzmsdVkK3WzUfLaZKEvLQ
 EJOzwFGDBHTqmFToWI7HSFP/2A9CCrlQC9Byl2q9tYjKduUWAb68hngVVG5ZfZcJA9
 Gn5CXxKgLfx7sehrkglVUHXd2Fa7l6Y1+VDoNUFIRudbIHn9mrV1glK9oXjT94sRk0
 l5zy/OGohx1rpG99wvLTkyl7s5xn20u4Bpz6/P7y/ITKXIgvfprHJFCI813OTrKr5F
 aT+uDme6kgUgFaT3ofZB46nbKWF0I1EfVm4BS8Ki16K3BP5D5UfOUuXuZTmFrR7CR8
 FPbOeTitaZE2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256
 header.s=20231125 header.b=RbcRSjSD
Subject: [Buildroot] [PATCH v2] Revert "linux: disable -Werror"
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@cherry.de>

This reverts commit 6b56e0b4f09b36140e2cb9e41072d5ac6074f375.

commit 6b56e0b4f09b ("linux: disable -Werror") said we needed to disable
CONFIG_WERROR in the kernel because it failed to build the esp-hosted
kernel module. This was very much the hammer approach because a) it'd be
better to fix the warnings in the kernel module or b) disable the
kernel's CONFIG_WERROR *only* if esp-hosted is to be built, via the
ESP_HOSTED_LINUX_CONFIG_FIXUPS variable in
package/esp-hosted/esp-hosted.mk.

This is a simple revert without making any change to any kernel module
(including esp-hosted) because all upstream Buildroot defconfigs with a
kernel module enabled build fine today (albeit with warnings). The two
defconfigs that were pointed at by the now-reverted commit all have been
(updated for and) run on master without failing the build.

Suggested-by: Arnout Vandecappelle <arnout@rnout.be>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
I've rebuilt the kernel of all 307 upstream Buildroot defconfigs which
selects the Linux kernel with:

for defconfig in $(git grep -l LINUX_KERNEL configs/); do
  d=$(basename "$defconfig")
  make O=build/$d $d | tee -a log.txt
  make O=build/$d linux | tee -a log.txt || break
  rm -rf build/$d
done

and the loop didn't exit early and log.txt didn't contain any error: (or
even warning: or ^^^ lines, which is surprising...).

I also built the kernel modules of the couple of upstream Buildroot
defconfigs that build some modules, identified with:

for module in $(git grep -l --full-name kernel-module package/ | xargs basename -a | grep '.mk' | xargs basename -a -s .mk | sed 's/-/_/g' | tr '[:lower:]' '[:upper:]' | sed 's/\(.*\)/BR2_PACKAGE_\1/'); do
        git grep $module configs
done

which returns:
configs/orangepi_lite_defconfig:BR2_PACKAGE_RTL8189FS=y
configs/orangepi_pc_plus_defconfig:BR2_PACKAGE_RTL8189FS=y
configs/mangopi_mq1rdw2_defconfig:BR2_PACKAGE_RTL8723DS=y
configs/sipeed_lichee_rv_dock_defconfig:BR2_PACKAGE_RTL8723DS=y
configs/sipeed_lichee_rv_dock_defconfig:BR2_PACKAGE_RTL8723DS_BT=y
configs/orangepi_zero_defconfig:BR2_PACKAGE_XR819_XRADIO=y

and while there were warnings, they don't fail the build of the kernel
module(s) for those defconfigs. No available updates for all kernel
modules I built, as far as I could tell.
---
Changes in v2:
- changed implementation: simply revert commit 6b56e0b4f09b instead of
  adding yet another Kconfig knob,
- Link to v1: https://patch.msgid.link/20260325-linux-werror-v1-1-2b98ff2a2cdd@cherry.de
---
 linux/linux.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index c61089bfe0..79117275f7 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -474,7 +474,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO_LINUX_CLUT224))
 	$(call KCONFIG_DISABLE_OPT,CONFIG_GCC_PLUGINS)
-	$(call KCONFIG_DISABLE_OPT,CONFIG_WERROR)
 	$(PACKAGES_LINUX_CONFIG_FIXUPS)
 endef
 

---
base-commit: c8dd9e9a011f1a5755df62baceb865efc09862fe
change-id: 20260325-linux-werror-9f6e4ad44b0f

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
