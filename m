Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAF1C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 21:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C65CC6F734;
	Thu, 17 Feb 2022 21:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jpI7l3K8DJKp; Thu, 17 Feb 2022 21:18:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFB7E61B80;
	Thu, 17 Feb 2022 21:18:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C363F1BF37A
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BABE0409F2
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:18:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2TxSA9r7hAHa for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 21:18:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F088409F6
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 21:18:28 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id d23so1572520lfv.13
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 13:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a+2gEym7D5I+imZzGKoEr/4E66kXZCzdbQQ42wh6Xw8=;
 b=FAN1nxCvLwF19qShkwbtiQZH8SXKqp3+3Zz5s1/O9g1Ud2bwxNxVo92qDqsNhmwK9k
 JfFOfzHop2I8aD85k2kn6t67+nuoMYqef11y7LrRYJxJEv5VlYRB03WVTK1js6R0SjF/
 D1Q2ArrcN6djDMNwl7ODCnbMmV+Drn3Jqr8rajzyGK7n4W9ViL0M0o5wAzj5h5zs9O8P
 EGP1maspu43MmYNnBIQNB9Wizh3u8TtGd3gukV5Sa1Gr3T8PNqZ5gGU5yuqv/3PwjNH2
 H1qiMe5XorezApyqTOVLRXr5Jltp/cF+kphy4nPEpx0GUpxh4xRG9shlL5GJgXmj9Tnx
 GBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a+2gEym7D5I+imZzGKoEr/4E66kXZCzdbQQ42wh6Xw8=;
 b=LxIoo7wR39bHfg0X0xqn6ZU7Z7VGULtI1IyhmEU0See5/gxuf7YT7C5f4PAFTu6aHg
 Rvzg/QwatcbH+0G+tnpj322eE0+GawyUnYBMqx7H5pKr7cQudW7aIlnf6+4Gj+2Wa2JI
 UXlbB1CTsSujGskSPbuX2o0reKSSp6DSKEIMs6AuFuv4xuCva0vIERDqG2gKOuELzcCR
 +WOFAtf6ZpvkUHwz1arMWIvE7FvPYLpNt3nZCAWbfOWVqOvsJmGqNaRHFfng9v96z49Q
 BwTPrDLGKwlWJXiPjSotTwNQvYFcGIyi9g03xXGjsFU7XPE9KAAoGQoiHncnpaGV8dqC
 gJ3A==
X-Gm-Message-State: AOAM533hWEi5b3g4AqZwXZrHUY6V9ON4StXX2ETd5ZIrpbs46wl+y+mo
 r7b+KIgoaKhVITghX9Oy0ENJGDZdRAI=
X-Google-Smtp-Source: ABdhPJwPqeR1Sg/4ZF9nkfZktMT2bBCfb65Z9YmBa/TNBIsqGNXdKjogTNt+35MgwEmQqJcG1MslAg==
X-Received: by 2002:ac2:554f:0:b0:442:ddc3:73e5 with SMTP id
 l15-20020ac2554f000000b00442ddc373e5mr3305203lfk.64.1645132705753; 
 Thu, 17 Feb 2022 13:18:25 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id h6sm91360ljg.58.2022.02.17.13.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 13:18:25 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 18 Feb 2022 00:18:23 +0300
Message-Id: <20220217211823.402414-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/{hostapd,
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---

v1 -> v2:

- drop patch for mesh fix
- remove CONFIG_SET macro as per suggestion by Thomas


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
-- 
2.35.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
