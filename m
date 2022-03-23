Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF23C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 21:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDA8E41A28;
	Wed, 23 Mar 2022 21:41:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1N2ukJkvyra2; Wed, 23 Mar 2022 21:41:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3EC2419E7;
	Wed, 23 Mar 2022 21:41:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C03C1BF489
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E61E84019D
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:40:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r-PAmcNdDYOM for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 21:40:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 185FC403F7
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 21:40:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 297EC85584; Wed, 23 Mar 2022 21:31:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Mar 2022 22:34:23 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: d3f38e420732533dd5643cf4864ddab72fe2bb0d
X-Git-Newrev: b3f87a7ba3678c9d863244c66bdfec5a4382508f
X-Patchwork-Hint: ignore
Message-Id: <20220323213117.297EC85584@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/rpi-firmware:
 convert dtb overlay install loop to make-level foreach loop
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

commit: https://git.buildroot.net/buildroot/commit/?id=b3f87a7ba3678c9d863244c66bdfec5a4382508f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d0350a6c023ccbe4450d68d28c3797b1320087ba)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-firmware/rpi-firmware.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index f3d28ef825..37bfa84eaf 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -20,9 +20,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS),y)
 define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
-	for ovldtb in  $(@D)/boot/overlays/*.dtbo; do \
-		$(INSTALL) -D -m 0644 $${ovldtb} $(BINARIES_DIR)/rpi-firmware/overlays/$${ovldtb##*/} || exit 1; \
-	done
+	$(foreach ovldtb,$(wildcard $(@D)/boot/overlays/*.dtbo), \
+		$(INSTALL) -D -m 0644 $(ovldtb) $(BINARIES_DIR)/rpi-firmware/overlays/$(notdir $(ovldtb))
+	)
 endef
 else
 # Still create the directory, so a genimage.cfg can include it independently of
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
