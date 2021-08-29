Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A87C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 02:48:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B42A760E99
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 02:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B42A760E99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83FF6400FF;
	Sun, 29 Aug 2021 02:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s6oteYFvDTU3; Sun, 29 Aug 2021 02:48:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E77E74018B;
	Sun, 29 Aug 2021 02:48:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0886B1BF37E
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 02:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0501881CD0
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 02:46:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RfAzhwviHj2m for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 02:46:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76AA681D98
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 02:46:46 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id h29so11836897ila.2
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 19:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aPdt7VG6rrM//cIvyoNoFcxxw9eOtsd/30IEBSlltj4=;
 b=hheLXOdzDRSBzfafXICIkmoaieJZayV2wW+3A2seuteOP8BHgicVbk//nYI/ek7P2n
 W3nWy0bv/C5qrF0olaCm5yf1kciiZ8KLQe4MJwPgJe+8AHcSsNyU20NQRwS9hSmuTnau
 H2eoL8CYu1yBMuCco5hJHwb/riZxfzANEbusQnuSBYOq6NQW4Dd8E8tuxwsns2qCqRX6
 EyIc+x8yDTXrRXnMgT8NZ4JzpJcwS+IHlQx/4IJB0dMhwXCg1YZSXdl4Rr5/no667AVb
 hqgfMiYUNI935mTcQelYquEmy8P98KaPkxP7rhS+7RqpmScCQPCNf4c9bHTU5+aQmOv8
 eJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aPdt7VG6rrM//cIvyoNoFcxxw9eOtsd/30IEBSlltj4=;
 b=cyObhcDfQPLGxQr7/us9Vr5RhdfbjMAFXnQlAmXaOZR8d4SLuoOo6vfrIP/fyHLf/m
 3IAMxXIrAgRRTX88Sr5zC2dkGiHOyjPaLEZq/FkFE4jFbPdqqfnt3N2CvW4kC4+Nm918
 cohI1YCote9+MmiLiEkcyIQXL3K0knIcBLl2eet0RZ1CE+lnCU41Ky+/ugpsz0y1h5hy
 Zea3+AkTbVhw4OybmqZOQuNsWeqR/cJ2mUbtySyIdYzTXHknOdree6v5Ng9HsgSTkfZQ
 0JoRmvUZSFLRX/I66zLJKIBGDIJOVBNE6SIEPvWb/VZ6sDSgCqU6aFBnyMqu9QTezx4C
 W2QQ==
X-Gm-Message-State: AOAM531Ywv2jk7b+vpcbWFO9WVj5XqdVuzoUPwvc9AsBixLXbKtSt4S3
 W9/9a6vMwFXxO0y3vP/tM9d7g8cTu34=
X-Google-Smtp-Source: ABdhPJxV3ElLovOX5wKRJwxcp08Cprz4seKwUwEyTEVLFwzw0O+ZfUoI5j61fiYoP0kVL4uez05JMg==
X-Received: by 2002:a92:740f:: with SMTP id p15mr12483631ilc.181.1630205205654; 
 Sat, 28 Aug 2021 19:46:45 -0700 (PDT)
Received: from james-x399.localdomain (97-118-237-25.hlrn.qwest.net.
 [97.118.237.25])
 by smtp.gmail.com with ESMTPSA id g23sm5741951ioc.8.2021.08.28.19.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Aug 2021 19:46:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 20:46:32 -0600
Message-Id: <20210829024632.682029-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210829024632.682029-1-james.hilliard1@gmail.com>
References: <20210829024632.682029-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 8/8] package/swupdate: add progress/usb
 services
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

Install progress/usb services for swupdate based on meta-swupdate
configs.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/swupdate/90-start-progress         |  1 +
 package/swupdate/swupdate-progress.service |  9 +++++++++
 package/swupdate/swupdate-usb@.service     |  8 ++++++++
 package/swupdate/swupdate.mk               |  8 ++++++++
 package/swupdate/swupdate.socket           | 11 +++++++++++
 5 files changed, 37 insertions(+)
 create mode 100644 package/swupdate/90-start-progress
 create mode 100644 package/swupdate/swupdate-progress.service
 create mode 100644 package/swupdate/swupdate-usb@.service
 create mode 100644 package/swupdate/swupdate.socket

diff --git a/package/swupdate/90-start-progress b/package/swupdate/90-start-progress
new file mode 100644
index 0000000000..3b0eb5e7d7
--- /dev/null
+++ b/package/swupdate/90-start-progress
@@ -0,0 +1 @@
+exec /usr/bin/swupdate-progress -w -r &
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
index 4bcdb96602..c49af7ebf7 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -248,6 +248,12 @@ define SWUPDATE_INSTALL_INIT_SYSTEMD
 	$(SWUPDATE_INSTALL_COMMON)
 	$(INSTALL) -D -m 644 package/swupdate/swupdate.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/swupdate.service
+	$(INSTALL) -D -m 644 package/swupdate/swupdate.socket \
+		$(TARGET_DIR)/usr/lib/systemd/system/swupdate.socket
+	$(INSTALL) -D -m 644 package/swupdate/swupdate-usb@.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/swupdate-usb@.service
+	$(INSTALL) -D -m 644 package/swupdate/swupdate-progress.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/swupdate-progress.service
 	$(INSTALL) -D -m 644 package/swupdate/tmpfiles-swupdate.conf \
 		$(TARGET_DIR)/usr/lib/tmpfiles.d/tmpfiles-swupdate.conf
 endef
@@ -255,6 +261,8 @@ define SWUPDATE_INSTALL_INIT_SYSV
 	$(SWUPDATE_INSTALL_COMMON)
 	$(INSTALL) -D -m 755 package/swupdate/S80swupdate \
 		$(TARGET_DIR)/etc/init.d/S80swupdate
+	$(INSTALL) -D -m 644 package/swupdate/90-start-progress \
+		$(TARGET_DIR)/usr/lib/swupdate/conf.d/90-start-progress
 endef
 
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
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
