Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B32C433F5
	for <buildroot@archiver.kernel.org>; Fri, 30 Sep 2022 14:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E05F842C5;
	Fri, 30 Sep 2022 14:04:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E05F842C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vHPrm1X5iepE; Fri, 30 Sep 2022 14:04:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3CF184149;
	Fri, 30 Sep 2022 14:04:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3CF184149
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECD821C2745
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 14:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A786641BF0
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 14:03:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A786641BF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5B83Kx-LKB7E for <buildroot@lists.busybox.net>;
 Fri, 30 Sep 2022 14:03:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 122BC4059D
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 14:03:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 122BC4059D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF19F86635; Fri, 30 Sep 2022 14:03:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Sep 2022 16:02:30 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: be394fbcd84f33fb7ad0fa8aa54def6f99b76f93
X-Git-Newrev: 2c106bcaeb503c93b0bb7f2499716b9118aaba01
X-Patchwork-Hint: ignore
Message-Id: <20220930140333.EF19F86635@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x]
 package/rtl8812au-aircrack-ng: fix build failure due to double defined
 endianness
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c106bcaeb503c93b0bb7f2499716b9118aaba01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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
(cherry picked from commit 003ed345b1c4f1c11feecca68bca37bf871001af)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index 111fd520a4..621a832023 100644
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
