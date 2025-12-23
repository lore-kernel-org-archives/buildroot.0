Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8C4E748FC
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 22:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D97E460B13;
	Tue, 23 Dec 2025 22:14:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CVBs1Xx8y0zW; Tue, 23 Dec 2025 22:14:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1A7960E96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766528052;
	bh=bdybvumvjC6n93oQkDKqSxMoBYMn6g/ni6SZBNVpo3w=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Lj+lHoMORgVTTtReGZOrK2NqnjDGv9WvRZJ/tDNOHpjc1dj5qFMBfOYInlwm71m6r
	 4xJjNlbt9gnqh7uPHhQ3n/IlVJiHU8jDs+dgEwb0ecKhsMUK3btVMa4xd5LTP2YC6i
	 nBhp7YfYcstUOlj5Sdj1zi6DNMCycjSdz9ECzT/F/S4dlQdSpazFtILu/MMcJ9WnKu
	 ah4EfStjn8gQ9Y+qloHB4D3JRMaOkU78kylbRe29GFg3Q8/uhHKSaWPqccWz5EsEO6
	 bMwSET2Ek8bcYKHCI2dH/YzPABBabDfI5AmNd8QElnuJdtRT2H569ut3OswDHgbqxk
	 92mRNDp60OUrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1A7960E96;
	Tue, 23 Dec 2025 22:14:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 98DC7119
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 22:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FEEE404E7
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 22:14:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NUn9RAyljNaF for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 22:14:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.52;
 helo=mail-ej1-f52.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4A689404CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A689404CC
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A689404CC
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 22:14:08 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b7636c96b9aso954442566b.2
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 14:14:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766528046; x=1767132846;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZxsTH2LHz1xCEcz2zcMViljuekBWKAsKGTHHmpzTiiw=;
 b=IGac1uVGK8b3K2cpGXd12hIqE7k3oIKpUVq0sCX2ZnEdFQqfhMiaV5g8IMzvT8nsId
 /GyiaCmYV3f/h282GLjqXjJv6i6LlEUqDvlYCMKQDUyte4jnrx4tnjD4EDIxtEnVTAhD
 N/oNPdgx7FIWOCMf/6gJyqdwi7ijs7gKtAf6ksL6ADOHeInhvGKB1KooXz8jleJ6hVWp
 nI/BAN9wMAHGYZ59OhW5DhUGvbUWlQnkqVlAWGPQY63OFDwy0qq/bKdxQ8ymtwhANRAy
 ei69yR6bH/TLQyWDHyKIA1CkpeECKhaE1vVYRaMgWW9jsFvkO22XtBdnfdSvL1upzsQc
 Ilpw==
X-Gm-Message-State: AOJu0YxeM3UGephc4zKQ0qKxwO94+/gOzsbcLjwu0uRN2jVvJxNQRLi8
 XDvQ1WxCW3+7JAwKdALRj3fWDjBX9xKwjzUilRdAhuHTdobmnXEEJSDzHrjDAmTVgGM=
X-Gm-Gg: AY/fxX4RPz5cNh5iMi+Tsl7HoS5bhyiQBYeJNeWxhszRmOO+B6GTTG0BtSY18wV/OFO
 DATLxfEALoytx+uM70ZBrwggSwpY8GF4QdwprsPUlw/uCl0UisrxnSV5IJsiFgaTY+uJtCLTnbU
 GjLneMZJGIkhpZmqi8pCAk4U/bwVy+DZ5DUoBASHxy/1QLqAjWIbHKCayvotI7LoG/NbYHP7Gb+
 xQNs2VVp2HjGyzyDBOGvWtfcpMk0MUdGmlTr2/RrZ45Wa+vFWg8uCTz2bSScdWUSsw2mG4ztFGa
 lbW6w1gMv5leYWxWJ8fXuIU56IruxZ48vBvwIRrVMIjTwgkC2evLG2oj5rWF7RAyODDhuGSqDH/
 GQ1fplrUbfuM4imVKPRczrWluFdDstdRxnWN8iW1MbwP7VtNIby+sXdWpHL9WIg1czlYtoMBEwM
 rkO84ZFexWBkpBp7D9OoAYmZ1fepzSC7yJKOfB3kck3qSdoQLNc9K1
X-Google-Smtp-Source: AGHT+IFXNXxUMPVdwIfuceKcalUaTAOYrLKIQz7L9J38xDFc84xHCNQ5kkV+cn14tjfxRgk6VWs2ig==
X-Received: by 2002:a17:907:d0c:b0:b6d:573d:bbc5 with SMTP id
 a640c23a62f3a-b80371a3da2mr1604388266b.37.1766528046374; 
 Tue, 23 Dec 2025 14:14:06 -0800 (PST)
Received: from KORLIN44614.home ([2a02:a03f:eb5f:fa00:faf0:ebea:87cc:7ff9])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b8045a086fasm1346655266b.70.2025.12.23.14.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 14:14:06 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Devreese Jorik <jorik.devreese@barco.com>
Date: Tue, 23 Dec 2025 23:14:03 +0100
Message-ID: <20251223221403.61295-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH] package/sema-linux-ec: add ADLINK sema drivers
 package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Devreese Jorik <jorik.devreese@barco.com>

Signed-off-by: Devreese Jorik <jorik.devreese@barco.com>
---
 package/Config.in                        |  1 +
 package/sema-linux-ec/Config.in          | 13 ++++++++++++
 package/sema-linux-ec/sema-linux-ec.hash |  7 ++++++
 package/sema-linux-ec/sema-linux-ec.mk   | 27 ++++++++++++++++++++++++
 4 files changed, 48 insertions(+)
 create mode 100644 package/sema-linux-ec/Config.in
 create mode 100644 package/sema-linux-ec/sema-linux-ec.hash
 create mode 100644 package/sema-linux-ec/sema-linux-ec.mk

diff --git a/package/Config.in b/package/Config.in
index 22970b4d45a..edafe20eefe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -608,6 +608,7 @@ endmenu
 	source "package/sane-backends/Config.in"
 	source "package/sdparm/Config.in"
 	source "package/sedutil/Config.in"
+	source "package/sema-linux-ec/Config.in"
 	source "package/setserial/Config.in"
 	source "package/sg3_utils/Config.in"
 	source "package/sigrok-cli/Config.in"
diff --git a/package/sema-linux-ec/Config.in b/package/sema-linux-ec/Config.in
new file mode 100644
index 00000000000..664f24ebe55
--- /dev/null
+++ b/package/sema-linux-ec/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_SEMA_LINUX_EC
+	bool "sema-linux-ec"
+	depends on !BR2_s390x
+	depends on BR2_LINUX_KERNEL
+	help
+	  ADLINK SEMA Linux EC drivers.
+	  Provides support for embedded controller functionality on
+	  ADLINK embedded computing platforms.
+
+	  https://github.com/ADLINK/sema-linux-ec
+
+comment "sema-linux-ec needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/sema-linux-ec/sema-linux-ec.hash b/package/sema-linux-ec/sema-linux-ec.hash
new file mode 100644
index 00000000000..460edba0a88
--- /dev/null
+++ b/package/sema-linux-ec/sema-linux-ec.hash
@@ -0,0 +1,7 @@
+# sha256 locally computed: https://github.com/ADLINK/sema-linux-ec/archive/v4.3.11/sema-linux-ec-v4.3.11.tar.gz
+sha256  5ea7379f94d21a3f92d97631b7ee28912be4990e4708d47bff44aa4f4ca9784f  sema-linux-ec-v4.3.11.tar.gz
+
+# hash for the license files, locally computed:
+sha256  c45298c445058c0f8413c94be71ecedd55f306f3149ed2aea90b0e098ddc8810  LICENSE.BSD3
+sha256  2358eef45f799ab496fe93f4791f509524d3d65ca046e562706e62d72f738f20  LICENSE.dual
+sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  LICENSE.GPLv2
diff --git a/package/sema-linux-ec/sema-linux-ec.mk b/package/sema-linux-ec/sema-linux-ec.mk
new file mode 100644
index 00000000000..427ee09943d
--- /dev/null
+++ b/package/sema-linux-ec/sema-linux-ec.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# sema-linux-ec
+#
+################################################################################
+
+SEMA_LINUX_EC_VERSION = v4.3.11
+SEMA_LINUX_EC_SITE = $(call github,ADLINK,sema-linux-ec,$(SEMA_LINUX_EC_VERSION))
+SEMA_LINUX_EC_LICENSE = GPL-2.0
+SEMA_LINUX_EC_LICENSE_FILES = LICENSE
+
+SEMA_LINUX_EC_MAKE_OPTS = KERNELDIR=$(LINUX_DIR)
+
+define SEMA_LINUX_EC_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BACKLIGHT_CLASS_DEVICE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_GPIO_SYSFS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_GPIOLIB)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HWMON)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_I2C)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_I2C_BOARDINFO)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NVMEM)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WATCHDOG)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WATCHDOG_CORE)
+endef
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
