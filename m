Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619CDC6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 08:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03C6240B88;
	Sun, 11 Sep 2022 08:56:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03C6240B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NwSWMiZUjitl; Sun, 11 Sep 2022 08:56:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23AFE40B8A;
	Sun, 11 Sep 2022 08:56:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23AFE40B8A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B0FE01BF990
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FBEE61085
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FBEE61085
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D9wWhqFSmpg4 for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65B7C60774
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65B7C60774
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 63A6D835E4; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 20:58:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 721d3c6e802b8f97e133b2974cbf615dd00a1e80
X-Git-Newrev: 3b5e02c4958e11b28ee359f908cbf464b6964fff
X-Patchwork-Hint: ignore
Message-Id: <20220911084824.63A6D835E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-cadence-dp-firmware:
 refactor with NXP_EXTRACT_HELPER
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3b5e02c4958e11b28ee359f908cbf464b6964fff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../qoriq-cadence-dp-firmware.mk                   | 27 +---------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
index 23643d24e0..6bfb921628 100644
--- a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
+++ b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
@@ -13,33 +13,8 @@ QORIQ_CADENCE_DP_FIRMWARE_REDISTRIBUTE = NO
 QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES = YES
 QORIQ_CADENCE_DP_FIRMWARE_INSTALL_TARGET = NO
 
-# Helper for self-extracting binaries distributed by NXP.
-#
-# The --force option makes sure it doesn't fail if the source
-# directory already exists. The --auto-accept skips the license check,
-# as it is not needed in Buildroot because we have legal-info. Since
-# there's a EULA in the binary file, we extract it in this macro, and
-# it should therefore be added to the LICENSE_FILES variable of
-# packages using this macro. Also, remember to set REDISTRIBUTE to
-# "NO". Indeed, this is a legal minefield: the EULA specifies that the
-# Board Support Package includes software and hardware (sic!) for
-# which a separate license is needed...
-#
-# $(1): full path to the archive file
-#
-define QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_HELPER
-	awk 'BEGIN      { start = 0; } \
-	     /^EOEULA/  { start = 0; } \
-	                { if (start) print; } \
-	     /<<EOEULA/ { start = 1; }' \
-	    $(1) > $(@D)/EULA
-	cd $(@D) && sh $(1) --force --auto-accept
-	find $(@D)/$(basename $(notdir $(1))) -mindepth 1 -maxdepth 1 -exec mv {} $(@D) \;
-	rmdir $(@D)/$(basename $(notdir $(1)))
-endef
-
 define QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_CMDS
-	$(call QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_HELPER,$(QORIQ_CADENCE_DP_FIRMWARE_DL_DIR)/$(QORIQ_CADENCE_DP_FIRMWARE_SOURCE))
+	$(call NXP_EXTRACT_HELPER,$(QORIQ_CADENCE_DP_FIRMWARE_DL_DIR)/$(QORIQ_CADENCE_DP_FIRMWARE_SOURCE))
 endef
 
 define QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
