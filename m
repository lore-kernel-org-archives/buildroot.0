Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3F5ECAAD3
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 12:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ABCB81446;
	Sun,  4 Sep 2022 12:59:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ABCB81446
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zrVIBaXHFH47; Sun,  4 Sep 2022 12:59:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 775E681442;
	Sun,  4 Sep 2022 12:59:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 775E681442
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 97E371BF215
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 12:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F87B403D0
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 12:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F87B403D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a65LBFx5aWZs for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 12:59:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDCCD4035F
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DDCCD4035F
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 12:59:05 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id kk26so12220421ejc.11
 for <buildroot@buildroot.org>; Sun, 04 Sep 2022 05:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=tg4hYoTKf6sLJ6q0sAe72FjGN8egSI0qHCSsePN6yZ4=;
 b=zwJ/cQePuLad3O7InQ7jj/LIcY3s/VIV7Ql6rGxc6JVqwzzfooMOviL+exAb+uOGq2
 VvYTMkb9k9ZLJrRwOM/AaX+2cQ78xM/lQVGbdrO/boJU35wrpbFA3I8zyYeEshHU9EoL
 3Vwc8+jprYwx7usibnFP9wOuXnvxiwTDUrzI63Ig+y9uAHMKIPvqktCfkuhUayB8/Ycc
 gE1ftMg3Q6B//KcuhUQHE5EcIaJh9zToo6ZDARu9A3QdnDQhy1arJ4PAqhArz1n3xd27
 7XpC1BBOvAiWhE6uuJKIIfEtT6RNK73WC58/3h4zIx7PUVfL5b4+7V7JFpg7aThkPS1C
 j2sg==
X-Gm-Message-State: ACgBeo0nYQ7rz8MO4oey/L8Rr8ocp3h5WQwg0/n95jfdj6D3kAOocUzM
 s/AxaOTvcROa1tG5XnVueDfCKN9PF6YKzeEg
X-Google-Smtp-Source: AA6agR52hN91PLCoeI8oNZ+wVq7KrEMmUzg1ekiA4Dnbs7JsNYE5eH6iuMynTv0uDRXyq6xFWSB0Yw==
X-Received: by 2002:a17:907:6288:b0:72f:90ba:f0b2 with SMTP id
 nd8-20020a170907628800b0072f90baf0b2mr31733948ejc.696.1662296344138; 
 Sun, 04 Sep 2022 05:59:04 -0700 (PDT)
Received: from LinkTed.fritz.box ([2a02:8070:4182:37a0:97b2:fd91:46b3:8d3a])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906311200b00718e4e64b7bsm3681028ejx.79.2022.09.04.05.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 05:59:03 -0700 (PDT)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Sep 2022 14:58:54 +0200
Message-Id: <20220904125854.20486-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=tg4hYoTKf6sLJ6q0sAe72FjGN8egSI0qHCSsePN6yZ4=;
 b=NaO3xC7F6YUXXOBF9PExmnUt0E20h199+cAZDZq0pA2MAhaecFESWDXijSB6p6hs0v
 j2W7pkO3h2C3priicwFKY6Ko3M1AH/8vPDydLsVyLafEwfNQmLE75TFmuE6hkkKAoGI/
 fI3z2QV3ngPIrLxZh0qTx4eXNX3lnHzixW9CkbBFQpIQuHF05FTG/L1DBZXbOpPxZ0Bs
 vtMiJ1oLfdgwaCY+q1f9ZEY4EM1bAU8FcN/FnhOj1NgXy4XQqVVc/7Tq80yX4sU81abD
 xhEOKK1+Kft4vny9DIXLVPtwA/fS4ykFmWv6i5rQ1I0UIY+PisyxNjEmsG3WEKI+WFQ5
 tFEw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NaO3xC7F
Subject: [Buildroot] [PATCH v3 1/1] package/nvidia-persistenced: new package
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

NVIDIA driver persistence daemon.

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
Changes v2 -> v3:
  - DEVELOPERS: add Raphael Pavlids for nvidia-persistenced

Changes v1 -> v2:
  - fix typo in Config.in

 DEVELOPERS                                    |  3 ++
 package/Config.in                             |  1 +
 package/nvidia-persistenced/Config.in         | 13 +++++
 .../nvidia-persistenced.conf                  |  1 +
 .../nvidia-persistenced.hash                  |  3 ++
 .../nvidia-persistenced.mk                    | 49 +++++++++++++++++++
 6 files changed, 70 insertions(+)
 create mode 100644 package/nvidia-persistenced/Config.in
 create mode 100644 package/nvidia-persistenced/nvidia-persistenced.conf
 create mode 100644 package/nvidia-persistenced/nvidia-persistenced.hash
 create mode 100644 package/nvidia-persistenced/nvidia-persistenced.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d2bd0d809a..ff58fb240d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2506,6 +2506,9 @@ F:	support/testing/tests/package/test_python_jmespath.py
 F:	support/testing/tests/package/test_python_rsa.py
 F:	support/testing/tests/package/test_python_s3transfer.py
 
+N:	Raphael Pavlidis <raphael.pavlidis@gmail.com>
+F:	package/nvidia-persistenced/
+
 N:	Refik Tuzakli <tuzakli.refik@gmail.com>
 F:	package/freescale-imx/
 F:	package/paho-mqtt-cpp/
diff --git a/package/Config.in b/package/Config.in
index d1c098c48f..41f34908ba 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -543,6 +543,7 @@ endmenu
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
