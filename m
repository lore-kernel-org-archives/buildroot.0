Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC569C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Jun 2022 12:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AEC240BB0;
	Sun, 26 Jun 2022 12:36:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AEC240BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rSbbSKJM7Qos; Sun, 26 Jun 2022 12:36:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E96840AED;
	Sun, 26 Jun 2022 12:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E96840AED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 34A4E1BF2FD
 for <buildroot@lists.busybox.net>; Sun, 26 Jun 2022 12:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D81E83F2C
 for <buildroot@lists.busybox.net>; Sun, 26 Jun 2022 12:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D81E83F2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6APR0Muv7cMe for <buildroot@lists.busybox.net>;
 Sun, 26 Jun 2022 12:36:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1EF883E86
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1EF883E86
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 12:36:21 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id ay16so13673895ejb.6
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 05:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CvENWrzFrtM59Exbk9nJe1CISkAHj8FZFMKf0UK5Hvs=;
 b=HploiU1prtYlm5uun3Dbp0L1eX/dIMHzTcQAZx+ZAjpU6rNk9l7yjs2O3OC3oWa6PB
 XhsCFy12v25rGKNDMjtF1TaHJaRAXho20cdCY9HH4jNtmY5WeBTJkvtm4kDLKCqvSqxi
 SzZN0fo4aiEnHazyIkNjlQm5cE8jGeeJlIg/UfpT3LwH+yhVbbE309JWBEL4xeVXWReW
 IHCZYMFiO+qNnM3yeMwX9ozm0RI/ELCWgNdZTtBDZAeQxd4taqg5yLTyavFbPy9+kBN+
 mP1F0s4YqmE1xV+uSy5U7RTm/g/R+QccSYlAHfvSu3U1GDHIDCqNFn+KDc568U8NAUZT
 YC/Q==
X-Gm-Message-State: AJIora/brpczNAwvYb4kEzEIRcZDnrWX3LGgl2FydWCrH+y4MGfjjBvo
 M+s9VpMZ8MshcPF+LY4iLAz48SA0qn8pOg==
X-Google-Smtp-Source: AGRyM1tMnEXWm0nn/OYaCdV8FiZ4LJJDJQCgvMObzM0vh+rPE45DT95IvfXz/jP0X702bcdm5+WnKg==
X-Received: by 2002:a17:906:38d0:b0:715:8483:e01e with SMTP id
 r16-20020a17090638d000b007158483e01emr7967421ejd.265.1656246979870; 
 Sun, 26 Jun 2022 05:36:19 -0700 (PDT)
Received: from LinkTed.fritz.box ([2a02:8070:41a4:2c00:5e48:90c:7bda:e6d5])
 by smtp.gmail.com with ESMTPSA id
 lj20-20020a170906f9d400b00722e771007fsm3723691ejb.37.2022.06.26.05.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 05:36:19 -0700 (PDT)
X-Google-Original-From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jun 2022 14:36:04 +0200
Message-Id: <20220626123604.13263-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CvENWrzFrtM59Exbk9nJe1CISkAHj8FZFMKf0UK5Hvs=;
 b=TC5JFjia7etKHxJn+0pAj0XKG2mkYOq323nqFGilRCBiBQANy+fQqaar8LC1fFJmZb
 9u5OP8yWeoY6tB5BPyG1lCK+9wGRvC25cjlYrXrrei8ikU+58D7jTxOq1el+SLu8qcx3
 PEj5blS0JVqa4kK/cb7aZhc0QvutX+Ped8iHVW6XdlXRE5VBYaMYUz5IaBNArKA95FZj
 Oi5IYojnHjM6JRg05hRKjlzHb3OfwcYgW+rz8del31gZ7jXEet9MFFKU+96LBzaWmVMq
 CYjUVYGj/UEHb8BC1SbWA+Yd0YtTSvjA6G6emP9Inv8ZziwaYrKStcaVtmzbBu/x9MUv
 HN+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TC5JFjia
Subject: [Buildroot] [PATCH v1 1/1] package/nvidia-persistenced: new package
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
index 0000000000..c15f6b4e12
--- /dev/null
+++ b/package/nvidia-persistenced/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_NVIDIA_PERSISTENCED
+	bool "nvidia-modprobe"
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
