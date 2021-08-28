Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDC1C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 04:47:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF1DB60ED5
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 04:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF1DB60ED5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E45183B76;
	Sat, 28 Aug 2021 04:46:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cYwJxfNVSNcb; Sat, 28 Aug 2021 04:46:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A4FF83EEC;
	Sat, 28 Aug 2021 04:46:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B98871BF27C
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 04:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADEFD83EEC
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 04:46:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xjXOiZXlrrXQ for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 04:46:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98D4583B76
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 04:46:48 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id a15so11671204iot.2
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 21:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZsulwZJhCwTbMTfgYzc7TkOGqsrEo4RRM03B0N7OG0s=;
 b=ZYe8Ts1EVOb0VywRa/8Rpu+8B6AUy8CTAxqEnInj4PTa6ArtHCeFttPcUmf0cjZjz2
 +D2B64FhSkvSKtUknsy1QR3itWQnVz60yPihXQpREvL7qz+/b0hFC4+X3uS1+K/86iDH
 P8M6357DLHJ0yIXmDDi7A9EatYv5ns4M75gBx619w+gC8KiLBdTyF72slfsr3USJw3U+
 TxUhSKN9tjl0YgqVG2BlBih83Zrh578FhLDRG60uo4AC8nViV1K8aufGJjefM12Bjm7b
 5ZEgSdGNiUwRaCrvtcIEMxaRDMbvISGGSuupgW5uA7rsfwXMsRTKebu1lQsoQmr/g6+p
 jblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZsulwZJhCwTbMTfgYzc7TkOGqsrEo4RRM03B0N7OG0s=;
 b=Yo85rC9pJTRS0017M7QDQV9S8v7LxFVBAsgXEMx6i8Th/COFGTFL80ii/3iCIJPjIJ
 AFGTnRqvMVDoquvj7KvN25pR0oFacNf/GRiDHTSN+HI60rt2rPfL0pJ1ZE1nCQoyB53R
 hFw5Lh3NCnQXMdQXjr6heVfzR5Z0HRN8kTgUu8o0ow/VA6B9+5306C6TMICsWH8+Qr8b
 wEsqy1SWp7xOaoJHQVDf1AUfhuyLyTo4T6CqlV7enkCI/5/WuHFX28W6r58mO7IEef/t
 0RPATHm9H/H1B80hvWPPEdsvlY7vG/zuq0iZJsbEl6RmUWdepBtWzPH3lffiLIXce34g
 1M7g==
X-Gm-Message-State: AOAM532UIDFzoslBYH2bPZIygFXvOToOa275+rXLHJqcw2ZafE+wrDWl
 LnrxWMJHH0U0i7TTUIgS0TzUF2C3al4=
X-Google-Smtp-Source: ABdhPJztBbgWaf4Ts/YAxlycjmvp2RuxO1MBYDNIgc5gOJK9OEPi8QY+SSGHYRXe5xcWz0ICnllZ8Q==
X-Received: by 2002:a6b:fb0b:: with SMTP id h11mr9903603iog.59.1630126007518; 
 Fri, 27 Aug 2021 21:46:47 -0700 (PDT)
Received: from james-x399.localdomain (97-118-237-25.hlrn.qwest.net.
 [97.118.237.25])
 by smtp.gmail.com with ESMTPSA id h11sm348989ilc.7.2021.08.27.21.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 21:46:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 Aug 2021 22:46:26 -0600
Message-Id: <20210828044626.3170348-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/swupdate: update service/init
 configs
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Set SKIP_STRIP=y so that the swupdate binary isn't stripped.

Introduce BR2_PACKAGE_SWUPDATE_WEBSERVER so that we can control
the required webserver config installation when enabled.

Ensure swupdate systemd support is always set based on buildroot
using systemd as this is required for the systemd services.

Use swupdate's make install so that we install swupdate tools needed
for services.

Adapted from:
https://github.com/sbabic/meta-swupdate/tree/abc520d97482232302046459715845a025aca7d6/recipes-support/swupdate/swupdate
https://github.com/sbabic/meta-swupdate/blob/abc520d97482232302046459715845a025aca7d6/recipes-support/swupdate/swupdate.inc

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/swupdate/10-mongoose-args          |  1 +
 package/swupdate/90-start-progress         |  1 +
 package/swupdate/Config.in                 |  7 ++++
 package/swupdate/swupdate-progress.service |  9 +++++
 package/swupdate/swupdate-usb.rules        |  2 +
 package/swupdate/swupdate-usb@.service     |  8 ++++
 package/swupdate/swupdate.mk               | 43 +++++++++++++++++++---
 package/swupdate/swupdate.socket           | 11 ++++++
 package/swupdate/tmpfiles-swupdate.conf    |  2 +
 9 files changed, 79 insertions(+), 5 deletions(-)
 create mode 100644 package/swupdate/10-mongoose-args
 create mode 100644 package/swupdate/90-start-progress
 create mode 100644 package/swupdate/swupdate-progress.service
 create mode 100644 package/swupdate/swupdate-usb.rules
 create mode 100644 package/swupdate/swupdate-usb@.service
 create mode 100644 package/swupdate/swupdate.socket
 create mode 100644 package/swupdate/tmpfiles-swupdate.conf

diff --git a/package/swupdate/10-mongoose-args b/package/swupdate/10-mongoose-args
new file mode 100644
index 0000000000..896e66ba86
--- /dev/null
+++ b/package/swupdate/10-mongoose-args
@@ -0,0 +1 @@
+SWUPDATE_WEBSERVER_ARGS="-r /www ${SWUPDATE_MONGOOSE_EXTRA_ARGS:--p 8080}"
diff --git a/package/swupdate/90-start-progress b/package/swupdate/90-start-progress
new file mode 100644
index 0000000000..3b0eb5e7d7
--- /dev/null
+++ b/package/swupdate/90-start-progress
@@ -0,0 +1 @@
+exec /usr/bin/swupdate-progress -w -r &
diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index f601e45fcd..6b832cfcbf 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -60,9 +60,16 @@ config BR2_PACKAGE_SWUPDATE_CONFIG
 	  I you wish to use your own modified swupdate configuration
 	  file specify the config file location with this option.
 
+config BR2_PACKAGE_SWUPDATE_WEBSERVER
+	bool "swupdate webserver"
+	default y
+	help
+	  Enable update from remote using a web server on the target.
+
 config BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE
 	bool "install default website"
 	default y
+	depends on BR2_PACKAGE_SWUPDATE_WEBSERVER
 	help
 	  Install the provided website to /var/www/swupdate.
 
diff --git a/package/swupdate/swupdate-progress.service b/package/swupdate/swupdate-progress.service
new file mode 100644
index 0000000000..0d464bb420
--- /dev/null
+++ b/package/swupdate/swupdate-progress.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=swupdate progress service
+After=swupdate.service
+
+[Service]
+ExecStart=/usr/bin/swupdate-progress -r -w
+
+[Install]
+WantedBy=swupdate.service
diff --git a/package/swupdate/swupdate-usb.rules b/package/swupdate/swupdate-usb.rules
new file mode 100644
index 0000000000..b4efd0b733
--- /dev/null
+++ b/package/swupdate/swupdate-usb.rules
@@ -0,0 +1,2 @@
+ACTION=="add", KERNEL=="sd*", SUBSYSTEM=="block", ENV{ID_BUS}=="usb", ENV{ID_FS_USAGE}=="filesystem", TAG+="systemd", ENV{SYSTEMD_WANTS}+="swupdate-usb@%k.service"
+
diff --git a/package/swupdate/swupdate-usb@.service b/package/swupdate/swupdate-usb@.service
new file mode 100644
index 0000000000..eda9d1539c
--- /dev/null
+++ b/package/swupdate/swupdate-usb@.service
@@ -0,0 +1,8 @@
+[Unit]
+Description=usb media swupdate service
+Requires=swupdate-progress.service
+
+[Service]
+ExecStartPre=/bin/mount /dev/%I /mnt
+ExecStart=/bin/sh -c "swupdate-client -v /mnt/*.swu"
+ExecStopPost=/bin/umount /mnt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 402aa0a91f..3368b6ef6a 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -22,7 +22,7 @@ SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
 # swupdate uses $CROSS-cc instead of $CROSS-gcc, which is not
 # available in all external toolchains, and use CC for linking. Ensure
 # TARGET_CC is used for both.
-SWUPDATE_MAKE_ENV = CC="$(TARGET_CC)" LD="$(TARGET_CC)"
+SWUPDATE_MAKE_ENV = CC="$(TARGET_CC)" LD="$(TARGET_CC)" SKIP_STRIP=y
 
 # swupdate bundles its own version of mongoose (version 6.16)
 
@@ -139,6 +139,13 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 SWUPDATE_DEPENDENCIES += systemd
+define SWUPDATE_SET_SYSTEMD
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SYSTEMD)
+endef
+else
+define SWUPDATE_SET_SYSTEMD
+	$(call KCONFIG_DISABLE_OPT,CONFIG_SYSTEMD)
+endef
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUBOOTENV),y)
@@ -180,6 +187,16 @@ ifeq ($(BR2_PACKAGE_LIBRSYNC),y)
 SWUPDATE_DEPENDENCIES += librsync
 endif
 
+ifeq ($(BR2_PACKAGE_SWUPDATE_WEBSERVER),y)
+define SWUPDATE_SET_WEBSERVER
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WEBSERVER)
+endef
+else
+define SWUPDATE_SET_WEBSERVER
+	$(call KCONFIG_DISABLE_OPT,CONFIG_WEBSERVER)
+endef
+endif
+
 SWUPDATE_BUILD_CONFIG = $(@D)/.config
 
 SWUPDATE_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_SWUPDATE_CONFIG))
@@ -192,14 +209,17 @@ SWUPDATE_MAKE_OPTS = \
 
 define SWUPDATE_KCONFIG_FIXUP_CMDS
 	$(SWUPDATE_SET_LUA_VERSION)
+	$(SWUPDATE_SET_SYSTEMD)
+	$(SWUPDATE_SET_WEBSERVER)
 endef
 
 define SWUPDATE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) $(SWUPDATE_MAKE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) -C $(@D) $(SWUPDATE_MAKE_OPTS)
 endef
 
 define SWUPDATE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/swupdate $(TARGET_DIR)/usr/bin/swupdate
+	$(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(SWUPDATE_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
 	$(if $(BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE), \
 		mkdir -p $(TARGET_DIR)/var/www/swupdate; \
 		cp -dpfr $(@D)/examples/www/v2/* $(TARGET_DIR)/var/www/swupdate)
@@ -213,23 +233,36 @@ $(error No Swupdate configuration file specified, check your BR2_PACKAGE_SWUPDAT
 endif
 endif
 
-ifeq ($(BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE),y)
 define SWUPDATE_INSTALL_COMMON
 	mkdir -p $(TARGET_DIR)/etc/swupdate/conf.d \
 		$(TARGET_DIR)/usr/lib/swupdate/conf.d
 	$(INSTALL) -D -m 755 package/swupdate/swupdate.sh \
 		$(TARGET_DIR)/usr/lib/swupdate/swupdate.sh
+	$(if $(BR2_PACKAGE_SWUPDATE_WEBSERVER), \
+		$(INSTALL) -D -m 644 package/swupdate/10-mongoose-args \
+			$(TARGET_DIR)/usr/lib/swupdate/conf.d/10-mongoose-args)
 endef
 define SWUPDATE_INSTALL_INIT_SYSTEMD
 	$(SWUPDATE_INSTALL_COMMON)
 	$(INSTALL) -D -m 644 package/swupdate/swupdate.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/swupdate.service
+	$(INSTALL) -D -m 644 package/swupdate/swupdate.socket \
+		$(TARGET_DIR)/usr/lib/systemd/system/swupdate.socket
+	$(INSTALL) -D -m 644 package/swupdate/swupdate-usb@.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/swupdate-usb@.service
+	$(INSTALL) -D -m 644 package/swupdate/swupdate-progress.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/swupdate-progress.service
+	$(INSTALL) -D -m 644 package/swupdate/tmpfiles-swupdate.conf \
+		$(TARGET_DIR)/usr/lib/tmpfiles.d/tmpfiles-swupdate.conf
+	$(INSTALL) -D -m 644 package/swupdate/swupdate-usb.rules \
+		$(TARGET_DIR)/lib/udev/rules.d/swupdate-usb.rules
 endef
 define SWUPDATE_INSTALL_INIT_SYSV
 	$(SWUPDATE_INSTALL_COMMON)
 	$(INSTALL) -D -m 755 package/swupdate/S80swupdate \
 		$(TARGET_DIR)/etc/init.d/S80swupdate
+	$(INSTALL) -D -m 644 package/swupdate/90-start-progress \
+		$(TARGET_DIR)/usr/lib/swupdate/conf.d/90-start-progress
 endef
-endif
 
 $(eval $(kconfig-package))
diff --git a/package/swupdate/swupdate.socket b/package/swupdate/swupdate.socket
new file mode 100644
index 0000000000..2b756714c5
--- /dev/null
+++ b/package/swupdate/swupdate.socket
@@ -0,0 +1,11 @@
+[Unit]
+Description=SWUpdate socket listener
+Documentation=https://github.com/sbabic/swupdate
+Documentation=https://sbabic.github.io/swupdate
+
+[Socket]
+ListenStream=/tmp/sockinstctrl
+ListenStream=/tmp/swupdateprog
+
+[Install]
+WantedBy=sockets.target
diff --git a/package/swupdate/tmpfiles-swupdate.conf b/package/swupdate/tmpfiles-swupdate.conf
new file mode 100644
index 0000000000..4743672fcc
--- /dev/null
+++ b/package/swupdate/tmpfiles-swupdate.conf
@@ -0,0 +1,2 @@
+X /tmp/datadst
+X /tmp/scripts
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
