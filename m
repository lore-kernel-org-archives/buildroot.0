Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86617C04A95
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30B1D8426D;
	Fri, 23 Sep 2022 21:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30B1D8426D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EY1mKvT6Lic0; Fri, 23 Sep 2022 21:39:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4976984261;
	Fri, 23 Sep 2022 21:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4976984261
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A20C21BF337
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AF0F84261
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AF0F84261
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PT5YLxs49Ue3 for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:39:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE857814B3
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:39:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE857814B3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E43485F27; Fri, 23 Sep 2022 21:39:32 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 23 Sep 2022 23:39:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5560bc6c161b7e15d37b1beaa57014bb2a987e53
X-Git-Newrev: 003ed345b1c4f1c11feecca68bca37bf871001af
X-Patchwork-Hint: ignore
Message-Id: <20220923213932.9E43485F27@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8812au-aircrack-ng: fix build
 failure due to double defined endianness
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

commit: https://git.buildroot.net/buildroot/commit/?id=003ed345b1c4f1c11feecca68bca37bf871001af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default package rtl8812au-aircrack-ng uses CONFIG_PLATFORM_I386_PC that
define -DCONFIG_LITTLE_ENDIAN and this can't be overridden since the
USER_EXTRA_CFLAGS are assigned to EXTRA_CFLAGS in the beginning of Makefile
while -DCONFIG_LITTLE_ENDIAN is assigned later.
Instead of using the default CONFIG_PLATFORM_I386_PC let's set it to 'n'
and let's use the same defines it uses:
-DCONFIG_IOCTL_CFG80211
-DRTW_USE_CFG80211_STA_EVENT
This way -DCONFIG_BIG_ENDIAN can be define without the conflict of being
defined with with the default -DCONFIG_LITTLE_ENDIAN.
Let's also add Linux config FIXUPS to build the module correctly.

Fixes:
http://autobuild.buildroot.net/results/2e4ee705d0e2b728f102aac4e6729f11ef22be36/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index 60d81469c2..45a6ce5729 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -11,14 +11,25 @@ RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
 
 RTL8812AU_AIRCRACK_NG_EXTRA_CFLAGS = \
 	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
+	-DCONFIG_IOCTL_CFG80211 \
+	-DRTW_USE_CFG80211_STA_EVENT \
 	-Wno-error=address \
 	-Wno-error=array-bounds \
 	-Wno-error=cast-function-type
 
 RTL8812AU_AIRCRACK_NG_MODULE_MAKE_OPTS = \
+	CONFIG_PLATFORM_I386_PC=n \
 	CONFIG_88XXAU=m \
 	KVER=$(LINUX_VERSION_PROBED) \
 	USER_EXTRA_CFLAGS="$(RTL8812AU_AIRCRACK_NG_EXTRA_CFLAGS)"
 
+define RTL8812AU_AIRCRACK_NG_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USB)
+endef
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
