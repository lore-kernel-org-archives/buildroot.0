Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8BBC43334
	for <buildroot@archiver.kernel.org>; Sun, 26 Jun 2022 13:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA4DA4094C;
	Sun, 26 Jun 2022 13:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA4DA4094C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F3pZlXD5t8-s; Sun, 26 Jun 2022 13:33:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B3D740911;
	Sun, 26 Jun 2022 13:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B3D740911
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 726861BF3DD
 for <buildroot@lists.busybox.net>; Sun, 26 Jun 2022 13:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C62D405B5
 for <buildroot@lists.busybox.net>; Sun, 26 Jun 2022 13:33:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C62D405B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jCWsDG44cy82 for <buildroot@lists.busybox.net>;
 Sun, 26 Jun 2022 13:33:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FF2A4052C
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1FF2A4052C
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 13:33:23 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id r20so9480158wra.1
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 06:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X8fQzJai2buM4QkYJAwHpzvvOWGeRLI/KpafvDI+k7s=;
 b=NnFRCoCrcZkRn63KzC29mq3ZHFzsAoDFtBtIzlck4GudZRsdWDKP5p9QH/fmgJNTTi
 NkyHvFBtWlHw4p9psYM4XDFD5jkZhu+lP8cumdQLoUUJHI5O3Ej423BvdL2S8shk7v/a
 /qdc0bMb5fQQZXJNgAknLBfe3oV5WGoR43t7wN462nL2NJN0Vaog4K1Tl5g69XVrzZLQ
 lTcFyjegWseIeex0TzVsWVCdUbGD/TfHyeZw+xaF3+LG1pCVetOWP8azmAKfVMVwih+T
 MyWVZRvjdY0a/MUJQF9kQ09abI+yh6uhbTVwQgzWn3X+n1OAy1gfBKXHW9GaCu8touUy
 +CGA==
X-Gm-Message-State: AJIora81ekHzbobiTt6y9QaIdyfv9EL6U0h7jyuD/AYsNApFGRC5lHZb
 CQCoP8ehqT6HUbS2VC+6ePr3tFYPLXRm/HtH
X-Google-Smtp-Source: AGRyM1sNVvMNu2n/hBWJva3ZQf+qiSsQBtAt4zhbjVlKwZGVGZjwK32ZJs07FveJYMJAPHCndRmvAw==
X-Received: by 2002:adf:c64c:0:b0:21a:7a3:54a4 with SMTP id
 u12-20020adfc64c000000b0021a07a354a4mr7834578wrg.163.1656250401064; 
 Sun, 26 Jun 2022 06:33:21 -0700 (PDT)
Received: from LinkTed.fritz.box ([2a02:8070:41a4:2c00:5e48:90c:7bda:e6d5])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a05600c3b1600b00397402ae674sm14327956wms.11.2022.06.26.06.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 06:33:20 -0700 (PDT)
X-Google-Original-From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jun 2022 15:33:08 +0200
Message-Id: <20220626133308.32008-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X8fQzJai2buM4QkYJAwHpzvvOWGeRLI/KpafvDI+k7s=;
 b=d2pxBMB7BL337Y357kLA5MCUM95KQbgQQGmxRaxeST/Etd8QEG0l8t3I5JekxP6jLq
 6hcsAcbmX+tCYA7hdb8Isr9t13Jp/Fjnzj0US1vCBg+Q7wx3/kYsuWN/x+WUwCswdWdv
 9IBSzJRHg6+d65c3P4oP8W3Pz4Zek6f+PCno7ah1gaXZwTWzKjUY4JrY7ZjuhWMbDNR6
 1FJ4t+BHT+x6SQmX57AtGlRkXm6WYAGPhdKsPIo33aY14C4q0Ur8q9mOqn9EW30Tb2MQ
 BEypymhHQEEdr/ijFnSJyYXGoRAiAGo3PbOB237+FT+Ht0Tz3PtOmvZOoUTrUPdBKGeB
 t8xA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=d2pxBMB7
Subject: [Buildroot] [PATCH v2 1/1] package/nvidia-persistenced: new package
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
From: Raphael Pavlidis via buildroot <buildroot@buildroot.org>
Reply-To: Raphael Pavlidis <raphael.pavlidis@googlemail.com>
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

NVIDIA driver persistence daemon.

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
Changes v1 -> v2:
  - fix typo in Config.in

 package/Config.in                             |  1 +
 package/nvidia-persistenced/Config.in         | 13 +++++
 .../nvidia-persistenced.conf                  |  1 +
 .../nvidia-persistenced.hash                  |  3 ++
 .../nvidia-persistenced.mk                    | 49 +++++++++++++++++++
 5 files changed, 67 insertions(+)
 create mode 100644 package/nvidia-persistenced/Config.in
 create mode 100644 package/nvidia-persistenced/nvidia-persistenced.conf
 create mode 100644 package/nvidia-persistenced/nvidia-persistenced.hash
 create mode 100644 package/nvidia-persistenced/nvidia-persistenced.mk

diff --git a/package/Config.in b/package/Config.in
index f09da05be0..27fd39fd7e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -532,6 +532,7 @@ endmenu
 	source "package/neard/Config.in"
 	source "package/nvidia-driver/Config.in"
 	source "package/nvidia-modprobe/Config.in"
+	source "package/nvidia-persistenced/Config.in"
 	source "package/nvme/Config.in"
 	source "package/ofono/Config.in"
 	source "package/ola/Config.in"
diff --git a/package/nvidia-persistenced/Config.in b/package/nvidia-persistenced/Config.in
new file mode 100644
index 0000000000..6ade2a5ceb
--- /dev/null
+++ b/package/nvidia-persistenced/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_NVIDIA_PERSISTENCED
+	bool "nvidia-persistenced"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc
+	select BR2_PACKAGE_LIBTIRPC
+	help
+	  NVIDIA driver persistence daemon.
+
+	  https://github.com/NVIDIA/nvidia-persistenced
+
+comment "nvidia-persistenced needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/nvidia-persistenced/nvidia-persistenced.conf b/package/nvidia-persistenced/nvidia-persistenced.conf
new file mode 100644
index 0000000000..48f24cfb1d
--- /dev/null
+++ b/package/nvidia-persistenced/nvidia-persistenced.conf
@@ -0,0 +1 @@
+u nvidia-persistenced - 'NVIDIA Persistence Daemon'
diff --git a/package/nvidia-persistenced/nvidia-persistenced.hash b/package/nvidia-persistenced/nvidia-persistenced.hash
new file mode 100644
index 0000000000..06c71b35f5
--- /dev/null
+++ b/package/nvidia-persistenced/nvidia-persistenced.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  b84fb8eb86127a725d0134a2c64a64e7844e125dece137e7fe8adf8a33cbe817  nvidia-persistenced-515.48.07.tar.gz
+sha256  279d814320adc07ca5a4ee101a0b428ddf22a6f3513b8c051f9eb7be47b2e797  COPYING
diff --git a/package/nvidia-persistenced/nvidia-persistenced.mk b/package/nvidia-persistenced/nvidia-persistenced.mk
new file mode 100644
index 0000000000..2a34d3608d
--- /dev/null
+++ b/package/nvidia-persistenced/nvidia-persistenced.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# nvidia-persistenced
+#
+################################################################################
+
+NVIDIA_PERSISTENCED_VERSION = 515.48.07
+NVIDIA_PERSISTENCED_SITE = $(call github,NVIDIA,nvidia-persistenced,$(NVIDIA_PERSISTENCED_VERSION))
+NVIDIA_PERSISTENCED_LICENSE = MIT
+NVIDIA_PERSISTENCED_LICENSE_FILES = COPYING
+
+NVIDIA_PERSISTENCED_DEPENDENCIES = host-pkgconf libtirpc
+
+define NVIDIA_PERSISTENCED_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		OUTPUTDIR=. ./nvidia-persistenced
+endef
+
+define NVIDIA_PERSISTENCED_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/nvidia-persistenced \
+		$(TARGET_DIR)/usr/bin/nvidia-persistenced
+endef
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUSERS),y)
+define NVIDIA_PERSISTENCED_POST_INSTALL_TARGET_SYSTEMD_SYSUSERS
+	$(INSTALL) -D -m 0644 $(NVIDIA_PERSISTENCED_PKGDIR)/nvidia-persistenced.conf \
+		$(TARGET_DIR)/usr/lib/sysusers.d/nvidia-persistenced.conf
+endef
+NVIDIA_PERSISTENCED_POST_INSTALL_TARGET_HOOKS += NVIDIA_PERSISTENCED_POST_INSTALL_TARGET_SYSTEMD_SYSUSERS
+else
+NVIDIA_PERSISTENCED_SYSTEMD_USERS = \
+	nvidia-persistenced -1 nvidia-persistenced -1 * - - - NVIDIA Persistence Daemon
+endif
+
+define NVIDIA_PERSISTENCED_POST_INSTALL_TARGET_SYSTEMD_SERVICE
+	$(INSTALL) -D -m 0644 $(@D)/init/systemd/nvidia-persistenced.service.template \
+		$(TARGET_DIR)/usr/lib/systemd/system/nvidia-persistenced.service
+	$(SED) 's/__USER__/nvidia-persistenced/g' \
+		$(TARGET_DIR)/usr/lib/systemd/system/nvidia-persistenced.service
+endef
+NVIDIA_PERSISTENCED_POST_INSTALL_TARGET_HOOKS += NVIDIA_PERSISTENCED_POST_INSTALL_TARGET_SYSTEMD_SERVICE
+endif # BR2_PACKAGE_SYSTEMD
+
+define NVIDIA_PERSISTENCED_USERS
+	$(NVIDIA_PERSISTENCED_SYSTEMD_USERS)
+endef
+
+$(eval $(generic-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
