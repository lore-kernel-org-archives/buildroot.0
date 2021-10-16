Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC367C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 09:34:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37F4960F56
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 09:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 37F4960F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08FA360661;
	Sat, 16 Oct 2021 09:34:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id msKVz8s8GrgO; Sat, 16 Oct 2021 09:34:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BABB60607;
	Sat, 16 Oct 2021 09:34:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E48741BF309
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 09:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4716838ED
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 09:34:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5_g-uRhj18cs for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 09:34:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD99F8386F
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 09:34:01 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id y3so30833767wrl.1
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 02:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k1/wlcqTVpqE2orFP7NPu0Oky7PJlmbiZs54zCBlSW4=;
 b=H/TXRKYOzFt1ZfATaNS96DbpCE70H5xIpk5h9TjuyMEg3YSYM5EN5OaswWKyxW1odL
 sYTM8lNk2mwMDQmkNsNl4RXsj7Lr09Iuz0EFsBL+6BQdwfii49Xz3UhSXZMkuKTw29h6
 ySfAR3Kp6JSTc+1IHPZJlzTKRvsjT/snJam+NEJI7p8+xxBTSzSOVdns4+gNXWnHWe95
 5ithoAxMjRxwuaUYH/rN4thzR8cqNuUR2K6bMon+JUW14XvHIkBv/5CNCWM++CnycFUk
 SZ4Ffnsl2jQzHIe3+CNNDiHoE/xPsz+3Na/5e7jGYYtNMwM9T8E/neATelbc/03rhAm+
 H4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k1/wlcqTVpqE2orFP7NPu0Oky7PJlmbiZs54zCBlSW4=;
 b=R5qo1mpmIGDCmJrRNSfx8yNmQt54IYcYPLnamDfSmlay5KNQ9cmEZd0xefN+N2iROR
 8DAw+tGdkJbWbsNWroNTaCReDD146ptCwjnjCQw605lUevhNQOsOynPsSW+QphR9I46Z
 X8j2mutyR2w32SlqRHD2fyiZMHjYJJ7RzXJ260qlF95t+GoCi6eeWP+OnXG7DnCWVY6O
 2cqfRf4TFT35IB6jQMtaOT/BF8CnSgOEvEXVvp5ts6WB9xWv17fekJgIi2Fyj/3oBugw
 1NbF3Y0rkNKxoCYzTM/O6B1YyWipea1ua+Jld8qh0VkmklAkf+RRd976P/tv3ahbwmU+
 hzvg==
X-Gm-Message-State: AOAM532ra1/GtkflOEcmGy50Qm8CycJsFidR1iVdaSkLqidERHPJbzMq
 C4viue8X3BBdA86rSVfPB5vFqpYJ/3Y=
X-Google-Smtp-Source: ABdhPJzCoI57uca1FMilW7jEr5KTwPtNsAnjNiBRFraXTsUmmHgEL7MgoXrCaIRcAF6xnZ2w/SnEew==
X-Received: by 2002:a5d:4dd1:: with SMTP id f17mr20387654wru.226.1634376839916; 
 Sat, 16 Oct 2021 02:33:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id d9sm7023037wrm.96.2021.10.16.02.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 02:33:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 11:32:34 +0200
Message-Id: <20211016093234.2477835-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211016093234.2477835-1-fontaine.fabrice@gmail.com>
References: <20211016093234.2477835-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,2/2] package/knock: add knockd option
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
Cc: Michael Rommel <rommel@layer-7.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add knockd option to make libpcap and MMU optional and enable it by
default for backward compatibility

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/knock/Config.in | 14 ++++++++++++--
 package/knock/knock.mk  |  9 +++++++--
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/package/knock/Config.in b/package/knock/Config.in
index 0060ad07ce..5a4c00d9e8 100644
--- a/package/knock/Config.in
+++ b/package/knock/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_KNOCK
 	bool "knock"
-	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_LIBPCAP
 	help
 	  A port knocking implementation.
 	  Provides a daemon and a user application. Port knocking can be
@@ -11,3 +9,15 @@ config BR2_PACKAGE_KNOCK
 	  firewall.
 
 	  http://www.zeroflux.org/projects/knock
+
+if BR2_PACKAGE_KNOCK
+
+config BR2_PACKAGE_KNOCK_KNOCKD
+	bool "knockd"
+	default y
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  Enable knockd
+
+endif
diff --git a/package/knock/knock.mk b/package/knock/knock.mk
index 2cfa738074..82a9ba9b53 100644
--- a/package/knock/knock.mk
+++ b/package/knock/knock.mk
@@ -9,10 +9,15 @@ KNOCK_SITE = $(call github,jvinet,knock,v$(KNOCK_VERSION))
 KNOCK_AUTORECONF = YES
 KNOCK_LICENSE = GPL-2.0+
 KNOCK_LICENSE_FILES = COPYING
-KNOCK_DEPENDENCIES = libpcap
 
+ifeq ($(BR2_PACKAGE_KNOCK_KNOCKD),y)
+KNOCK_DEPENDENCIES = libpcap
+KNOCK_CONF_OPTS += --enable-knockd
 ifeq ($(BR2_STATIC_LIBS),y)
-KNOCK_CONF_OPTS = LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
+KNOCK_CONF_OPTS += LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
+endif
+else
+KNOCK_CONF_OPTS += --disable-knockd
 endif
 
 $(eval $(autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
