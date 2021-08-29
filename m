Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA1CC432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 02:48:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 389C460E90
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 02:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 389C460E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EE1860648;
	Sun, 29 Aug 2021 02:48:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lqjHgQmh8zhX; Sun, 29 Aug 2021 02:48:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21F206064A;
	Sun, 29 Aug 2021 02:48:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A7B371BF37E
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 02:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 977316061B
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 02:46:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LSRQcAthmJUo for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 02:46:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6036A60648
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 02:46:45 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id s16so11806241ilo.9
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 19:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/ZrbqEc7FGqCUjQepJR6zJJhz8FrFSgksesonyx9BSQ=;
 b=jE2sV6jk4oxwvPf4ReB+OokQL11q9vsWkMJmadAVl8UPj7r8U2Hupxs14JcMKb8Y9v
 aG1og6iboUtKs9R5Wh1d4B1bEBJ9M0+QlBClXxq+TESHyXM9839ke+u+Hxf7V5irytCZ
 5K2ftq68AvDrG4Xfv63K6dG5hyRfKCNv/Y2tmWuinXihUvLo9+scUljNatcHMMLovfJS
 +1fFFik4yiBkRE5EfKunEWPZAoDxSGK+L+0URHYST///CfjGhnSj+KeZ0FZp7fFMUkg5
 mXR2bVcrwRnsd3lJjYecL5xSzLRCFKZ3FbCnSXwSFTkD3DzEDYyBciRxMl03yVL3E5r1
 wFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/ZrbqEc7FGqCUjQepJR6zJJhz8FrFSgksesonyx9BSQ=;
 b=ckqjF7EGrksU8fTOBPyUqp43le8zyR9YZFLzkzE89cdcQL9O41vTs3LRb4N0X66v/V
 k1XIYpRCNNvVwvkSwZtnjRiX/mZbUT1X9YPXyGy+YKvW+6CWzDv0H1z1zM2YJ5pWNuI0
 JefWrO27EcflxV+PtHfs+KQUiqKjOwUg2W+RR2MpNH0uvKmh7xX0W239ySRBgo5BLG12
 2UMannWxrJIbYuL5EpGhfvPArJznF6ev6PZNQRa4An77XSicXBWXatrS3oQyCEO8gjlS
 3G2B3roEOchWThmdmMHwqgLgBABsNIBkk8TSGONq5MN8b2XvfSwTg3BiPhWf0LKa+7UA
 eRZQ==
X-Gm-Message-State: AOAM530g0pNVZuJYWzEhxe672B4PJalcWePJ2uUDMWFhO9faw/Ldq5EJ
 mQ+3dHgnxNCQQGHchby8sXtSNKr1UVQ=
X-Google-Smtp-Source: ABdhPJwL+JggkMyJV1/iBna7EgBEORizE+OJvgBSPmPid5i5SbumqBCKFUgeC+csOpLDt6uZ7Nc/QA==
X-Received: by 2002:a92:d582:: with SMTP id a2mr12309525iln.261.1630205204434; 
 Sat, 28 Aug 2021 19:46:44 -0700 (PDT)
Received: from james-x399.localdomain (97-118-237-25.hlrn.qwest.net.
 [97.118.237.25])
 by smtp.gmail.com with ESMTPSA id g23sm5741951ioc.8.2021.08.28.19.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Aug 2021 19:46:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 20:46:30 -0600
Message-Id: <20210829024632.682029-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210829024632.682029-1-james.hilliard1@gmail.com>
References: <20210829024632.682029-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 6/8] package/swupdate: add webserver config
 option
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

Since the website depends on the webserver being enabled we should
add a config option for it and make the website depend on that.

We should also ensure that the mongoose(webserver) config is present.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/swupdate/10-mongoose-args |  1 +
 package/swupdate/Config.in        |  7 +++++++
 package/swupdate/swupdate.mk      | 14 ++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/swupdate/10-mongoose-args

diff --git a/package/swupdate/10-mongoose-args b/package/swupdate/10-mongoose-args
new file mode 100644
index 0000000000..d0b0f8be94
--- /dev/null
+++ b/package/swupdate/10-mongoose-args
@@ -0,0 +1 @@
+SWUPDATE_WEBSERVER_ARGS="-r /var/www/swupdate ${SWUPDATE_MONGOOSE_EXTRA_ARGS:--p 8080}"
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
 
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 256f0930ce..cf3607a661 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -187,6 +187,16 @@ ifeq ($(BR2_PACKAGE_LIBRSYNC),y)
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
@@ -200,6 +210,7 @@ SWUPDATE_MAKE_OPTS = \
 define SWUPDATE_KCONFIG_FIXUP_CMDS
 	$(SWUPDATE_SET_LUA_VERSION)
 	$(SWUPDATE_SET_SYSTEMD)
+	$(SWUPDATE_SET_WEBSERVER)
 endef
 
 define SWUPDATE_BUILD_CMDS
@@ -229,6 +240,9 @@ define SWUPDATE_INSTALL_COMMON
 		$(TARGET_DIR)/usr/lib/swupdate/conf.d
 	$(INSTALL) -D -m 755 package/swupdate/swupdate.sh \
 		$(TARGET_DIR)/usr/lib/swupdate/swupdate.sh
+	$(if $(BR2_PACKAGE_SWUPDATE_WEBSERVER), \
+		$(INSTALL) -D -m 644 package/swupdate/10-mongoose-args \
+			$(TARGET_DIR)/usr/lib/swupdate/conf.d/10-mongoose-args)
 endef
 define SWUPDATE_INSTALL_INIT_SYSTEMD
 	$(SWUPDATE_INSTALL_COMMON)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
