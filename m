Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD68DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 20:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62960418FD;
	Thu, 14 Apr 2022 20:25:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hHfdaeFGAcDC; Thu, 14 Apr 2022 20:25:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36D16418F0;
	Thu, 14 Apr 2022 20:25:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B26EE1C1189
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A08B560FA8
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:24:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T-5csudzmIVm for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 20:24:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA65E60FA5
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 20:24:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8CFAB83D1B; Thu, 14 Apr 2022 20:15:09 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 22:22:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e2df7d28c2e3572e2b61b6823606f84f052fa833
X-Git-Newrev: 4bd8bbe9fb7e5c34e6062004de53948eff78e6c9
X-Patchwork-Hint: ignore
Message-Id: <20220414201509.8CFAB83D1B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpa_supplicant: enable libnl for
 the WIRED driver
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

commit: https://git.buildroot.net/buildroot/commit/?id=4bd8bbe9fb7e5c34e6062004de53948eff78e6c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PACKAGE_WPA_SUPPLICANT_WIRED also enables the MACSEC_LINUX
driver. This driver requires libnl.

Also fix CONFIG_DRIVER_MACSEC option to enable only the generic
Linux driver and not QCA extensions.

Fixes:
http://autobuild.buildroot.net/results/2dea7dee521794b306cc610601fda322987e6cd0

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Sergey Matyukevich <geomatsi@gmail.com>
[Arnout: add Config.in comment, simplify CONFIG_ENABLE]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wpa_supplicant/Config.in         |  5 +++++
 package/wpa_supplicant/wpa_supplicant.mk | 11 +++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 8f095cdf2d..f2b0754ee1 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -41,12 +41,17 @@ config BR2_PACKAGE_WPA_SUPPLICANT_WEXT
 
 config BR2_PACKAGE_WPA_SUPPLICANT_WIRED
 	bool "Enable wired support"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	select BR2_PACKAGE_LIBNL
 	select BR2_PACKAGE_WPA_SUPPLICANT_EAP
 	help
 	  Include the "wired" driver, so the internal IEEE 802.1x
 	  supplicant can be used with Ethernet.  This also enables
 	  support for MACSEC.
 
+comment "wired support needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 comment "wpa_supplicant will be useless without at least one driver"
 	depends on !BR2_PACKAGE_WPA_SUPPLICANT_NL80211 && \
 		!BR2_PACKAGE_WPA_SUPPLICANT_WEXT && \
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index a2ca8a0b30..8b807fdfbe 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -63,11 +63,18 @@ WPA_SUPPLICANT_CONFIG_DISABLE += \
 	CONFIG_FILS
 endif
 
-ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WIRED),)
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WIRED),y)
+WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf libnl
+WPA_SUPPLICANT_CONFIG_ENABLE += \
+	CONFIG_LIBNL32 \
+	CONFIG_DRIVER_WIRED \
+	CONFIG_MACSEC \
+	CONFIG_DRIVER_MACSEC_LINUX
+else
 WPA_SUPPLICANT_CONFIG_DISABLE += \
 	CONFIG_DRIVER_WIRED \
 	CONFIG_MACSEC \
-	CONFIG_DRIVER_MACSEC
+	CONFIG_DRIVER_MACSEC_LINUX
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
