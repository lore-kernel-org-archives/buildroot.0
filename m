Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0D8CCD18A
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 09:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2C9740653;
	Sat, 11 Oct 2025 09:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Me6sHZAk05V2; Sat, 11 Oct 2025 09:01:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D60940657
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D60940657;
	Sat, 11 Oct 2025 09:01:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 733A712B
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 09:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 653F540467
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 09:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJplF3-68gFQ for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 09:01:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31473400A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31473400A1
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 09:01:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2740586A69; Sat, 11 Oct 2025 09:01:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 Oct 2025 10:52:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3951339cd94dd49bbcb5627d475c17c39a513512
X-Git-Newrev: 9a3360fdb3dfd9211eb4aadc2607ff18b8672ee7
X-Patchwork-Hint: ignore
Message-Id: <20251011090131.2740586A69@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wilc-driver: fix build failure
 with Linux 6.17
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9a3360fdb3dfd9211eb4aadc2607ff18b8672ee7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a local patch pending upstream to fix build failure with Linux 6.17

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0015-Fix-build-for-kernel-6.17.patch           | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/package/wilc-driver/0015-Fix-build-for-kernel-6.17.patch b/package/wilc-driver/0015-Fix-build-for-kernel-6.17.patch
new file mode 100644
index 0000000000..4d5934bdd4
--- /dev/null
+++ b/package/wilc-driver/0015-Fix-build-for-kernel-6.17.patch
@@ -0,0 +1,109 @@
+From 00895566e07808a0c61d45464797d7cba2eb256c Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Fri, 10 Oct 2025 21:58:14 +0200
+Subject: [PATCH] Fix build for kernel 6.17
+
+* With commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b74947b4f6ff7c122a1bb6eb38bb7ecfbb1d3820
+set_wiphy_params(), set/get_tx_power() and set_antenna() gain argument
+radio_idx to get radio index. So let's add that argument according to
+linux version >= 6.17.
+* With commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a5589313383074c48a1b3751d592a6e084ae0573
+devm_gpio_request() is dropped in favor of devm_gpio_request_one().
+devm_gpio_request_one() requires flags to setup gpio status, but it's
+not specified in wilc_of_parse_power_pins() so keep them as GPIOF_IN
+since they get defined in wilc_wlan_power() called very soon after
+wilc_of_parse_power_pins().
+
+Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/11
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ cfg80211.c | 15 +++++++++++++++
+ power.c    | 12 +++++++++++-
+ 2 files changed, 26 insertions(+), 1 deletion(-)
+
+diff --git a/cfg80211.c b/cfg80211.c
+index 0e1375c..a7db9e6 100644
+--- a/cfg80211.c
++++ b/cfg80211.c
+@@ -997,7 +997,11 @@ static int change_bss(struct wiphy *wiphy, struct net_device *dev,
+ 	return 0;
+ }
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++static int set_wiphy_params(struct wiphy *wiphy, int radio_idx, u32 changed)
++#else
+ static int set_wiphy_params(struct wiphy *wiphy, u32 changed)
++#endif
+ {
+ 	int ret = -EINVAL;
+ 	struct cfg_param_attr cfg_param_val;
+@@ -2198,6 +2202,9 @@ static void wilc_set_wakeup(struct wiphy *wiphy, bool enabled)
+ }
+ 
+ static int set_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++			int radio_idx,
++#endif
+ 			enum nl80211_tx_power_setting type, int mbm)
+ {
+ 	int ret;
+@@ -2230,6 +2237,9 @@ static int set_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
+ }
+ 
+ static int get_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++	int radio_idx,
++#endif
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 14, 0))
+ 			unsigned int link_id,
+ #endif
+@@ -2252,7 +2262,12 @@ static int get_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
+ 	return ret;
+ }
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++static int set_antenna(struct wiphy *wiphy, int radio_idx, u32 tx_ant,
++		       u32 rx_ant)
++#else
+ static int set_antenna(struct wiphy *wiphy, u32 tx_ant, u32 rx_ant)
++#endif
+ {
+ 	int ret;
+ 	struct wilc *wl = wiphy_priv(wiphy);
+diff --git a/power.c b/power.c
+index 6ab8d63..1cc391d 100644
+--- a/power.c
++++ b/power.c
+@@ -1,4 +1,4 @@
+-#include <linux/delay.h>
++#include <linux/delay.h>OA
+ #include <linux/of.h>
+ #include <linux/version.h>
+ #include <linux/of_gpio.h>
+@@ -37,11 +37,21 @@ int wilc_of_parse_power_pins(struct wilc *wilc)
+ 			!gpio_is_valid(power->gpios.reset))
+ 		return -EINVAL;
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++	ret = devm_gpio_request_one(wilc->dev, power->gpios.chip_en, GPIOF_IN,
++				    "CHIP_EN");
++#else
+ 	ret = devm_gpio_request(wilc->dev, power->gpios.chip_en, "CHIP_EN");
++#endif
+ 	if (ret)
+ 		return ret;
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++	ret = devm_gpio_request_one(wilc->dev, power->gpios.reset, GPIOF_IN,
++				    "RESET");
++#else 
+ 	ret = devm_gpio_request(wilc->dev, power->gpios.reset, "RESET");
++#endif
+ 	return ret;
+ }
+ 
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
