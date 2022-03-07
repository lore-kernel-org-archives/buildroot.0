Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFD7C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C81E582419;
	Mon,  7 Mar 2022 21:24:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tiue48T8put2; Mon,  7 Mar 2022 21:24:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B65B381C6E;
	Mon,  7 Mar 2022 21:24:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EECE11BF2C3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE929403A4
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:24:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WppIOnabg1Js for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:24:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6B844012E
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:24:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DAB7A8263F; Mon,  7 Mar 2022 21:15:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 22:21:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48e5cc084253bbfeb3cb3957deb4e125060f5dcb
X-Git-Newrev: 08f6960f53b84c6e333548b99fff04928aa454e1
X-Patchwork-Hint: ignore
Message-Id: <20220307211545.DAB7A8263F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{hostapd,
 wpa_s}: modify config options handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=08f6960f53b84c6e333548b99fff04928aa454e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Makefiles hostapd.mk and wpa_supplicant.mk define different macros for
different defconfig options. Options that are not listed in defconfig,
can be set using CONFIG_SET. Options that are listed in defconfig, can
be enabled or disabled using CONFIG_ENABLE or CONFIG_DISABLE. Starting
from hostapd v2.10, option CONFIG_DPP is explicitly listed in defconfig.
So it would be time to switch to enable/disable macros for this option.

On the other hand, this approach looks fragile: we have to track
'promoted' defconfig options for each hostapd/wpa_s update. This patch
removes CONFIG_SET macros, keeping only CONFIG_ENABLED/CONFIG_DISABLED.
CONFIG_SET is replaced by the additional pass over enabled options. All
such options that are not listed in defconfig, will be appended to the
configuration file.

Fixes:
- http://autobuild.buildroot.net/results/3f8058ee6f3913fda795578f206db895731ba1e6/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/hostapd/hostapd.mk               | 20 +++++++++++++-------
 package/wpa_supplicant/wpa_supplicant.mk |  9 +++++++--
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 075cb2a8d0..99f0cdf1b8 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -15,7 +15,6 @@ HOSTAPD_LICENSE_FILES = README
 
 HOSTAPD_CPE_ID_VENDOR = w1.fi
 HOSTAPD_SELINUX_MODULES = hostapd
-HOSTAPD_CONFIG_SET =
 
 HOSTAPD_CONFIG_ENABLE = \
 	CONFIG_INTERNAL_LIBTOMMATH \
@@ -83,13 +82,14 @@ HOSTAPD_CONFIG_ENABLE += CONFIG_WPS
 endif
 
 ifeq ($(BR2_PACKAGE_HOSTAPD_WPA3),y)
-HOSTAPD_CONFIG_SET += \
-	CONFIG_DPP \
-	CONFIG_SAE
 HOSTAPD_CONFIG_ENABLE += \
+	CONFIG_DPP \
+	CONFIG_SAE \
 	CONFIG_OWE
 else
 HOSTAPD_CONFIG_DISABLE += \
+	CONFIG_DPP \
+	CONFIG_SAE \
 	CONFIG_OWE
 endif
 
@@ -98,8 +98,9 @@ HOSTAPD_CONFIG_ENABLE += CONFIG_NO_VLAN
 endif
 
 ifeq ($(BR2_PACKAGE_HOSTAPD_VLAN_DYNAMIC),y)
-HOSTAPD_CONFIG_ENABLE += CONFIG_FULL_DYNAMIC_VLAN
-HOSTAPD_CONFIG_SET += NEED_LINUX_IOCTL
+HOSTAPD_CONFIG_ENABLE += \
+	CONFIG_FULL_DYNAMIC_VLAN \
+	NEED_LINUX_IOCTL
 endif
 
 ifeq ($(BR2_PACKAGE_HOSTAPD_VLAN_NETLINK),y)
@@ -123,9 +124,14 @@ define HOSTAPD_CONFIGURE_CMDS
 	cp $(@D)/hostapd/defconfig $(HOSTAPD_CONFIG)
 	sed -i $(patsubst %,-e 's/^#\(%\)/\1/',$(HOSTAPD_CONFIG_ENABLE)) \
 		$(patsubst %,-e 's/^\(%\)/#\1/',$(HOSTAPD_CONFIG_DISABLE)) \
-		$(patsubst %,-e '1i%=y',$(HOSTAPD_CONFIG_SET)) \
 		$(patsubst %,-e %,$(HOSTAPD_CONFIG_EDITS)) \
 		$(HOSTAPD_CONFIG)
+	# set requested configuration options not listed in hostapd defconfig
+	for s in $(HOSTAPD_CONFIG_ENABLE) ; do \
+		if ! grep -q "^$${s}" $(HOSTAPD_CONFIG); then \
+			echo "$${s}=y" >> $(HOSTAPD_CONFIG) ; \
+		fi \
+	done
 endef
 
 define HOSTAPD_BUILD_CMDS
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index b414144774..f0eb36e083 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -164,7 +164,7 @@ WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_READLINE
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO),y)
-WPA_SUPPLICANT_CONFIG_SET += CONFIG_BUILD_WPA_CLIENT_SO
+WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_BUILD_WPA_CLIENT_SO
 define WPA_SUPPLICANT_INSTALL_WPA_CLIENT_SO
 	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/libwpa_client.so \
 		$(TARGET_DIR)/usr/lib/libwpa_client.so
@@ -183,9 +183,14 @@ define WPA_SUPPLICANT_CONFIGURE_CMDS
 	cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
 	sed -i $(patsubst %,-e 's/^#\(%\)/\1/',$(WPA_SUPPLICANT_CONFIG_ENABLE)) \
 		$(patsubst %,-e 's/^\(%\)/#\1/',$(WPA_SUPPLICANT_CONFIG_DISABLE)) \
-		$(patsubst %,-e '1i%=y',$(WPA_SUPPLICANT_CONFIG_SET)) \
 		$(patsubst %,-e %,$(WPA_SUPPLICANT_CONFIG_EDITS)) \
 		$(WPA_SUPPLICANT_CONFIG)
+	# set requested configuration options not listed in wpa_s defconfig
+	for s in $(WPA_SUPPLICANT_CONFIG_ENABLE) ; do \
+		if ! grep -q "^$${s}" $(WPA_SUPPLICANT_CONFIG); then \
+			echo "$${s}=y" >> $(WPA_SUPPLICANT_CONFIG) ; \
+		fi \
+	done
 endef
 
 # LIBS for wpa_supplicant, LIBS_c for wpa_cli, LIBS_p for wpa_passphrase
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
