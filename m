Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE062C4332F
	for <buildroot@archiver.kernel.org>; Sat, 17 Dec 2022 23:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 449A94150F;
	Sat, 17 Dec 2022 23:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 449A94150F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PsyY7J0xVsVX; Sat, 17 Dec 2022 23:26:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 164B541514;
	Sat, 17 Dec 2022 23:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 164B541514
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF4591BF831
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 23:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB50C41514
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 23:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB50C41514
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2rR7-n189PPH for <buildroot@lists.busybox.net>;
 Sat, 17 Dec 2022 23:26:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA1B44150F
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA1B44150F
 for <buildroot@buildroot.org>; Sat, 17 Dec 2022 23:26:00 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 t11-20020a17090a024b00b0021932afece4so9556543pje.5
 for <buildroot@buildroot.org>; Sat, 17 Dec 2022 15:26:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S3iC8Ik5l/wcfvTU8PPBMyar2/eCbfiq5N1PwybqDbE=;
 b=wOqd4xVVSh8WgRLDp96AapDB2CRrcMoNXZUMIFaqntvt5MqT75n9Zzg8ojY9tPkBkC
 TravWJIJnCh2CGiB7X/XwzKJsKekhPMi0Cw9Ls1FUiDYxyuiIsP/pA8/B0Bqcl5FXAGS
 7HwKcLEhLSOX07fzlJudzuUBQtRLEiEWlDL8PpVyG+OQUFEhegFYpl0qT1exgPIFMQly
 zLgeu+be2nQnHZFzOcmO+QEYCRql4+vFYEJ4N+EhENAHbzYvTnBeX0XrtUYXRApcxLy3
 p5x9Juxz06FN/fnWucpFbt8mau5B/VsIieWwhJhvMEcbOK1dOboS7uG8ekRb7BCpo+yU
 CM9w==
X-Gm-Message-State: ANoB5plfh4fnlpYymT+cvjcsXsIDaqQMViNNqlrcXO94jMkkz7gNhJ+6
 22KU5hrbuQa+JQQ/bvt9wvaBpGz/ai4=
X-Google-Smtp-Source: AA0mqf43Eyg5GNtZpPD21HIt8wsjYtXh/IhHtdIpa3a3mFWPmzWu8oqzB3b+wFBRTovrDMu9TkT9lw==
X-Received: by 2002:a17:902:c209:b0:189:774d:5a99 with SMTP id
 9-20020a170902c20900b00189774d5a99mr36327135pll.49.1671319559412; 
 Sat, 17 Dec 2022 15:25:59 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 i17-20020a170902c95100b0018544ad1e8esm4042694pla.238.2022.12.17.15.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Dec 2022 15:25:58 -0800 (PST)
To: buildroot@buildroot.org
Date: Sat, 17 Dec 2022 15:25:56 -0800
Message-Id: <20221217232556.1609969-1-christian@paral.in>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/1] package/rtl8821cu: new package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adds support for USB rtl8821cu wifi cards.

Similar to rtl8821au and rtl8812au-aircrack-ng packages.

https://github.com/morrownr/8821cu-20210118

Signed-off-by: Christian Stewart <christian@paral.in>

---

v1 -> v2:

  - add myself to DEVELOPERS
  - bump to latest commit 615995
    - fixes build failure against the odroid xu4 kernel
  - simplify -Werror=date-time fix-patch
  - simplify makefile patches

v2 -> v3:

 - remove all patches (upstreamed)
 - bump to latest commit 86cc5c
 - fix license hash

rtl8821cu

Signed-off-by: Christian Stewart <christian@paral.in>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/rtl8821cu/Config.in      | 10 ++++++++++
 package/rtl8821cu/rtl8821cu.hash |  3 +++
 package/rtl8821cu/rtl8821cu.mk   | 19 +++++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/rtl8821cu/Config.in
 create mode 100644 package/rtl8821cu/rtl8821cu.hash
 create mode 100644 package/rtl8821cu/rtl8821cu.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3a0e3c14ab..9152b3321b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -560,6 +560,7 @@ F:	package/mosh/
 F:	package/nerdctl/
 F:	package/pkg-golang.mk
 F:	package/rtl8821au/
+F:	package/rtl8821cu/
 F:	package/runc/
 F:	package/tini/
 F:	support/testing/tests/package/test_docker_compose.py
diff --git a/package/Config.in b/package/Config.in
index 914c3584e9..0ffb1654ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -587,6 +587,7 @@ endmenu
 	source "package/rtl8723ds/Config.in"
 	source "package/rtl8812au-aircrack-ng/Config.in"
 	source "package/rtl8821au/Config.in"
+	source "package/rtl8821cu/Config.in"
 	source "package/sane-backends/Config.in"
 	source "package/sdparm/Config.in"
 	source "package/sedutil/Config.in"
diff --git a/package/rtl8821cu/Config.in b/package/rtl8821cu/Config.in
new file mode 100644
index 0000000000..a5a7b9d255
--- /dev/null
+++ b/package/rtl8821cu/Config.in
@@ -0,0 +1,10 @@
+comment "rtl8821cu needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_RTL8821CU
+	bool "rtl8821cu"
+	depends on BR2_LINUX_KERNEL
+	help
+	  rtl8821cu wifi driver
+
+	  https://github.com/brektrou/rtl8821CU
diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
new file mode 100644
index 0000000000..efb9871472
--- /dev/null
+++ b/package/rtl8821cu/rtl8821cu.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  09b9fb4160003502d564d0d0d85d6f19b8b6d1627d1a339b3ddfca6a948d84fb  rtl8821cu-86cc5ceb7c28b9b997838e1c796847f6c395c382.tar.gz
+sha256  af54d00efc57cfce664171ac8be2a20c0f290b1b5c1a67bb2eba7b6380276c4e  LICENSE
diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
new file mode 100644
index 0000000000..f3c37bc65e
--- /dev/null
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# rtl8821cu
+#
+################################################################################
+
+RTL8821CU_VERSION = 86cc5ceb7c28b9b997838e1c796847f6c395c382
+RTL8821CU_SITE = $(call github,morrownr,8821cu-20210118,$(RTL8821CU_VERSION))
+RTL8821CU_LICENSE = GPL-2.0
+RTL8821CU_LICENSE_FILES = LICENSE
+
+RTL8821CU_MODULE_MAKE_OPTS = \
+	CONFIG_RTL8821CU=m \
+	KVER=$(LINUX_VERSION_PROBED) \
+	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
+		-DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT"
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
