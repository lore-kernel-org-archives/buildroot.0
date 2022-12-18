Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF58BC4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 00:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E01C813C1;
	Sun, 18 Dec 2022 00:55:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E01C813C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FDLkrO-tSKjo; Sun, 18 Dec 2022 00:55:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4E37813B6;
	Sun, 18 Dec 2022 00:55:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4E37813B6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 52E391BF847
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 00:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A571408EA
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 00:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A571408EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j-FlFtZYcgTI for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 00:55:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17FD3408BC
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17FD3408BC
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 00:55:51 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id t18so4033940pfq.13
 for <buildroot@buildroot.org>; Sat, 17 Dec 2022 16:55:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Og+MuC9Wk7N3g1AU/NxzGsPXp57sohMI5xwZTnUHkQ=;
 b=NBlA/xJPiLCuZHOecLN8wfi4lG5Jg1izZHG2W82ifAgu1OAh+rlC6p9K7VeN0SS4Y/
 z4wbwhDxdt7xh45a/qO3FtSaNWQ4fcMjfiRsXFc6yPIysG1+u23sp5RjYPtOSMXFqHc8
 DGn5FTiTvNOMjuDp2BprDdVQu507d/aNXmzYpyZfoqg56cZjUW/4UaKk5BcYYGRvY0E4
 TB6hQqeyU9w55JW77rizAWgz+UAs8FsKGMfOWvBH6wArNxzuTEOTstKuXICxG3QdCZNt
 Q015Vv5sBMksgUgJyP4uGatwGmT8xrSyHvv84oXjXrbme91TT4DBp3z2k1Om4IIQsvVA
 sFoA==
X-Gm-Message-State: ANoB5pl9KG3uLoCnsbZsK3/BDM+OHCnFMW4iYZqm/xa8FO4EIVj0e4Bf
 jzyiryIQZ1Ez5CDAcwOXfci687rXcQ0=
X-Google-Smtp-Source: AA0mqf7sZ0URiBDN8IBbuh6AcUDYmhRW+lwg5vNHlXUjXLM6M7CspK+M7HXUINmHS7qLUCn3DaC5rQ==
X-Received: by 2002:a62:1d0f:0:b0:56c:3fbb:dd8 with SMTP id
 d15-20020a621d0f000000b0056c3fbb0dd8mr32697004pfd.11.1671324949534; 
 Sat, 17 Dec 2022 16:55:49 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 81-20020a621654000000b00574740c99e9sm3675510pfw.129.2022.12.17.16.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Dec 2022 16:55:48 -0800 (PST)
To: buildroot@buildroot.org
Date: Sat, 17 Dec 2022 16:55:46 -0800
Message-Id: <20221218005546.1793522-1-christian@paral.in>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 1/1] package/rtl8821cu: new package
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Christian Stewart <christian@paral.in>,
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

 - remove platform-specific checks

v3 -> v4:

 - fix setting USER_EXTRA_CFLAGS
 - unset PLATFORM_GENERIC
 - thanks for the suggestion from Giulio Benetti
 - https://patchwork.ozlabs.org/project/buildroot/patch/20221213203236.171656-1-giulio.benetti@benettiengineering.com/

Signed-off-by: Christian Stewart <christian@paral.in>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/rtl8821cu/Config.in      | 10 ++++++++++
 package/rtl8821cu/rtl8821cu.hash |  3 +++
 package/rtl8821cu/rtl8821cu.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 40 insertions(+)
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
index 0000000000..18222e0014
--- /dev/null
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -0,0 +1,25 @@
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
+RTL8821CU_USER_EXTRA_CFLAGS = \
+	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
+	-DCONFIG_IOCTL_CFG80211 \
+	-DRTW_USE_CFG80211_STA_EVENT \
+	-Wno-error
+
+RTL8821CU_MODULE_MAKE_OPTS = \
+	CONFIG_PLATFORM_GENERIC=n \
+	CONFIG_RTL8821CU=m \
+	KVER=$(LINUX_VERSION_PROBED) \
+	USER_EXTRA_CFLAGS="$(RTL8821CU_USER_EXTRA_CFLAGS)"
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
