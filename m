Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B17C433F5
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 23:14:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 763B061215
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 23:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 763B061215
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4979781029;
	Thu,  4 Nov 2021 23:14:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PWte90CsYmnq; Thu,  4 Nov 2021 23:14:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 994E680FFE;
	Thu,  4 Nov 2021 23:14:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13D6F1BF21A
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 23:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 040D580F8C
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 23:14:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fDski99qxZOK for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 23:14:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0B3980F87
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 23:14:10 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so8391362wme.0
 for <buildroot@buildroot.org>; Thu, 04 Nov 2021 16:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cqNMFO+I6jzRAOTc5QHq01lJwsPsvia3g7Ne61IR3uw=;
 b=mqHNk218Db9MZtOBGpk5kuBL5KPsi+jCu2AihfNEecTCgm6uB7i1X/FD3kQL/aW5eT
 NCK1VcqXQuigFfmgRU9h2P5kWDFsFsLLP4rhQCUQ9lglm2PEZHmq9cYA78e3lGa5yDle
 2hA0Fc15HQ9WY8x1AYSY8eePXQuBWGpEh2P//OA1x7/5OAu2WZgtMLy3FV95RATbpxxj
 wjsNKO2Wr1rXFB6F1znjczv7tY7yFXkkNSYLPM+E7D93NXOp2HQz1jUAz3CMpuLkkC4I
 NICAFpt7g6sZruisNt7FC4DJQv2m8C/6XcvTeJ68sHLN0rmeAkJLflFdd73CGj4LlcMR
 ltyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cqNMFO+I6jzRAOTc5QHq01lJwsPsvia3g7Ne61IR3uw=;
 b=xxk0R7A3yErPwF7l9Haz0prl+iuakKsTbvQWUum8JGqO20OrGAAw9fU6d9VJCYKYFa
 35NvgDyR0WJi6C1SpXe4leiTkg3odSt7m91AE6eCuq6oMVpauExsJObPmDZaM+5F9dnn
 xmO9SEd4RAxlI0S/lqRaTpVkHALooJYwW6ozsfkN0MvJuu+cRvKCnNzyVud1JUEaozvI
 ij0tFFmikhOZCbUK4qvt9mQl9l566YXa8ldeIqQQHrviu370mv7sdZQ/oU2yxN9/GFAD
 y/wxGSHAMkgKNK09Y1y0M9JA5GcnW5I1452qPknvuJXlDBmwMxt/0RInaeD09c5yU+ci
 gUnw==
X-Gm-Message-State: AOAM5322ZUf9k5FQ78eB0DdTl+5j0BMBtef54BqcWpk5dBhLOv34hLrm
 KJQfwxF2q867OZXTuaFDAaG2ppBzdMo=
X-Google-Smtp-Source: ABdhPJy9IekQJSNyYK0M7E/TA/J1QTkJSwxNpFa1jzsN48An2smiC4VtdcN72HGBqBC9JD6iAMNfOQ==
X-Received: by 2002:a7b:c155:: with SMTP id z21mr26008454wmi.107.1636067648635; 
 Thu, 04 Nov 2021 16:14:08 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id z14sm6542995wrp.70.2021.11.04.16.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 16:14:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Nov 2021 00:12:09 +0100
Message-Id: <20211104231210.2027405-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104231210.2027405-1-fontaine.fabrice@gmail.com>
References: <20211104231210.2027405-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] package/dahdi-linux: fix hotplug build
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix hotplug build which fails since the addition of the package in
commit d959966b41bd88a36664c733a8a8d2b6809e4fc2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...uild-fix-HOTPLUG_FIRMWARE-definition.patch | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 package/dahdi-linux/0001-drivers-dahdi-Kbuild-fix-HOTPLUG_FIRMWARE-definition.patch

diff --git a/package/dahdi-linux/0001-drivers-dahdi-Kbuild-fix-HOTPLUG_FIRMWARE-definition.patch b/package/dahdi-linux/0001-drivers-dahdi-Kbuild-fix-HOTPLUG_FIRMWARE-definition.patch
new file mode 100644
index 0000000000..82fd9bdc59
--- /dev/null
+++ b/package/dahdi-linux/0001-drivers-dahdi-Kbuild-fix-HOTPLUG_FIRMWARE-definition.patch
@@ -0,0 +1,64 @@
+From dc0a646a460e6da10ddbe7bf02794051d76f8751 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 4 Nov 2021 17:30:06 +0100
+Subject: [PATCH] drivers/dahdi/Kbuild: fix HOTPLUG_FIRMWARE definition
+
+HOTPLUG_FIRMWARE is used before being defined resulting in the following
+build failure since version 2.7.0 and
+https://git.asterisk.org/gitweb/?p=dahdi/linux.git;a=commit;h=e2f492595c9191ba6d556ccac1bde4c1bb892938:
+
+  MODPOST /home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/Module.symvers
+ERROR: modpost: "_binary_dahdi_fw_oct6114_032_bin_start" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/wcaxx.ko] undefined!
+ERROR: modpost: "_binary_dahdi_fw_oct6114_032_bin_size" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/wcaxx.ko] undefined!
+ERROR: modpost: "_binary_dahdi_fw_oct6114_128_bin_start" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/wcte43x.ko] undefined!
+ERROR: modpost: "_binary_dahdi_fw_oct6114_064_bin_start" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/wcte43x.ko] undefined!
+ERROR: modpost: "_binary_dahdi_fw_oct6114_128_bin_size" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/wcte43x.ko] undefined!
+ERROR: modpost: "_binary_dahdi_fw_oct6114_064_bin_size" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/wcte43x.ko] undefined!
+ERROR: modpost: "_binary_dahdi_fw_oct6114_032_bin_start" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/wcte13xp.ko] undefined!
+ERROR: modpost: "_binary_dahdi_fw_oct6114_032_bin_size" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/wcte13xp.ko] undefined!
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to "Shaun Ruffell <sruffell@sruffell.net>"]
+---
+ drivers/dahdi/Kbuild | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/drivers/dahdi/Kbuild b/drivers/dahdi/Kbuild
+index 855e5bf..b1a8481 100644
+--- a/drivers/dahdi/Kbuild
++++ b/drivers/dahdi/Kbuild
+@@ -13,6 +13,15 @@ obj-$(DAHDI_BUILD_ALL)$(CONFIG_DAHDI_WCTC4XXP)		+= wctc4xxp/
+ obj-$(DAHDI_BUILD_ALL)$(CONFIG_DAHDI_WCTDM24XXP)	+= wctdm24xxp/
+ obj-$(DAHDI_BUILD_ALL)$(CONFIG_DAHDI_WCTE13XP)		+= wcte13xp.o
+ 
++ifndef HOTPLUG_FIRMWARE
++ifneq (,$(filter y m,$(CONFIG_FW_LOADER)))
++HOTPLUG_FIRMWARE := yes
++else
++HOTPLUG_FIRMWARE := no
++endif
++export HOTPLUG_FIRMWARE
++endif
++
+ wcte13xp-objs := wcte13xp-base.o wcxb_spi.o wcxb.o wcxb_flash.o
+ CFLAGS_wcte13xp-base.o += -I$(src)/oct612x -I$(src)/oct612x/include -I$(src)/oct612x/octdeviceapi -I$(src)/oct612x/octdeviceapi/oct6100api
+ ifeq ($(HOTPLUG_FIRMWARE),yes)
+@@ -61,15 +70,6 @@ endif
+ 
+ CFLAGS_MODULE += -I$(DAHDI_INCLUDE) -I$(src) -Wno-format-truncation
+ 
+-ifndef HOTPLUG_FIRMWARE
+-ifneq (,$(filter y m,$(CONFIG_FW_LOADER)))
+-HOTPLUG_FIRMWARE := yes
+-else
+-HOTPLUG_FIRMWARE := no
+-endif
+-export HOTPLUG_FIRMWARE
+-endif
+-
+ # fix typo present in CentOS and RHEL 2.6.9 kernels
+ BAD_KERNELS_VERS := 22 34 34.0.1 34.0.2
+ BAD_KERNELS := $(foreach ver,$(BAD_KERNELS_VERS),2.6.9-$(ver).EL 2.6.9-$(ver).ELsmp)
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
