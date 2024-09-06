Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2D7E6FE33
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 17:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6573A84161;
	Fri,  6 Sep 2024 17:15:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QksK-E-ymTHS; Fri,  6 Sep 2024 17:15:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E9B3840DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E9B3840DB;
	Fri,  6 Sep 2024 17:15:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DCEE31BF38A
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 17:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D777E6065A
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 17:15:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6dJmgSkWQ5lr for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 17:15:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A8F2C60659
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8F2C60659
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8F2C60659
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 17:15:19 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42c7bc97423so24177355e9.0
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 10:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725642917; x=1726247717;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f+46zW4k+EZZ+bQh3W0WrfU8Dp6+KJ+dvg4m0J1xg3c=;
 b=Ee8wCRVZXwcA5Hdn19mt16ms85Zktf/djEkPnOSn8QDi3J9Qj29Id6HKQ2T/7FDL+3
 8Ld19AIbDdi5nGQbMHbl7+d4lJzl+9cXQILMOku9b5cfZSjPJ+F07NcoLlelNpyPq/78
 81Ms9eM3PWU7xSbfiYnN6URwgTPZycZZtos0uvFLc+Lo7ZE6DTqIU5OS/HcbQ6JuD+wY
 6suWDFjbN8IGcyhX5MtpbD27H9ZD/9rIH8Nv0PHu03qw/wj0eaMhmHn/3gGydtQsBr20
 9r/cvgwlkxGSFfkcsJ08oBxR330x050a11lIaIJGIDT+eD31GkQ1oiDPrkUfqdbmqV18
 kiEQ==
X-Gm-Message-State: AOJu0YzukzgdvLvj3SuWtOs6+h/8K2cO92eRuwPo4fnDOCBn/zA8wMzn
 f6kfsJPpdlYKDpbroLQYW48ejpQsOOtYPCid6tGmtGMijPeYU/R4NxQqHyLyi8Nb0hLExl6e9qX
 ud/Y=
X-Google-Smtp-Source: AGHT+IFZSVMpCI16ZqyLVvjWoQHnRhB8h0Qis4pqsCDJh5Hs2FeQG8eJxqoWH/3oND5ALDHw3rp7nA==
X-Received: by 2002:a05:600c:310a:b0:42a:a6aa:4118 with SMTP id
 5b1f17b1804b1-42c9f98b4aamr25764515e9.18.1725642917337; 
 Fri, 06 Sep 2024 10:15:17 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca05c6fb9sm26193875e9.7.2024.09.06.10.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 10:15:17 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 19:15:03 +0200
Message-ID: <20240906171503.3495498-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240906171503.3495498-1-dario.binacchi@amarulasolutions.com>
References: <20240906171503.3495498-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725642917; x=1726247717;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f+46zW4k+EZZ+bQh3W0WrfU8Dp6+KJ+dvg4m0J1xg3c=;
 b=Dn+6n0ArBB5WfEiFNlg0/VOqGcS5J47ntMmMb6t8qc1aXvGmrdMT+y/8B4++CQWPIX
 XJbu5539nUIUiXWbm64lXkqmPeF1F6X1ql0aCOMCqHmHwQ9s+30mIAS+mxBzIUmDrMYG
 Fxvb5V2WP7TNAOQtaOSOtWGh+YdmjuC2hjwEI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Dn+6n0Ar
Subject: [Buildroot] [PATCH v3 2/2] package/ipmitool: use versioned or local
 PEN registry
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
Cc: Floris Bos <bos@je-eigen-domein.nl>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The previous default URL used for the PEN registry was not stable and
could change at any time, making it unacceptable to have to update its
hash every time.

With this patch, ipmitool now uses by default a versioned PEN (Enterprise
Numbers) registry file from IANA provided by the iana-assignments package.
Alternatively, it also allows the use of a local file. URL paths for
downloading such a file are no longer supported.

Co-Developed-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Co-Developed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v2 -> v3:
  - Use by default enterprise-numbers from iana-assignments package.
  - Alternatively allows to use a local PEN registry file.
  - Don't support URL path for PEN registry.

Changes v1 -> v2:
  - use an enterprise-numbers file versioned

 package/ipmitool/Config.in   | 32 ++++++++++++++++++++++++++------
 package/ipmitool/ipmitool.mk | 24 ++++++++++++------------
 2 files changed, 38 insertions(+), 18 deletions(-)

diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
index 9516ff8596d3..c4b3ee734d44 100644
--- a/package/ipmitool/Config.in
+++ b/package/ipmitool/Config.in
@@ -9,14 +9,34 @@ config BR2_PACKAGE_IPMITOOL
 
 if BR2_PACKAGE_IPMITOOL
 
-config BR2_PACKAGE_IPMITOOL_PEN_REG_URI
-	string "IANA PEN registry URL or path"
-	default "https://www.iana.org/assignments/enterprise-numbers.txt"
+#
+# PEN registry selection
+#
+
+choice
+	prompt "PEN registry"
+	default BR2_PACKAGE_IPMITOOL_USE_IANA_PEN
+
+config BR2_PACKAGE_IPMITOOL_USE_IANA_PEN
+	bool "Using IANA PEN registry"
+	select BR2_PACKAGE_IANA_ASSIGNMENTS
+	select BR2_PACKAGE_IANA_ASSIGNMENTS_PEN_REG
+
+config BR2_PACKAGE_IPMITOOL_USE_CUSTOM_PEN
+	bool "Using a custom PEN registry file"
 	help
-	  Enter an URL or a file path to the PEN registry to use.
+	  Enter a file path to the PEN registry to use.
+
+	  Leave empty to not use a registry; vendor IDs will be
+	  displayed instead of the corresponding names.
 
-	  Note that the official registry is 4MiB+ and may change any
-	  time and is thus not guaranteed to be reproducible.
+endchoice
+
+config BR2_PACKAGE_IPMITOOL_USE_CUSTOM_PEN_FILE
+	string "PEN registry file path"
+	depends on BR2_PACKAGE_IPMITOOL_USE_CUSTOM_PEN
+	help
+	  Path to the PEN registry file.
 
 	  Leave empty to not use a registry; vendor IDs will be
 	  displayed instead of the corresponding names.
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index 4f2151904d43..f16500739ce6 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -49,20 +49,20 @@ endef
 IPMITOOL_POST_INSTALL_TARGET_HOOKS += IPMITOOL_REMOVE_IPMIEVD
 endif
 
-IPMITOOL_PEN_REG_URI = $(call qstrip,$(BR2_PACKAGE_IPMITOOL_PEN_REG_URI))
-ifneq ($(IPMITOOL_PEN_REG_URI),)
-ifneq ($(findstring ://,$(IPMITOOL_PEN_REG_URI)),)
-IPMITOOL_EXTRA_DOWNLOADS += $(IPMITOOL_PEN_REG_URI)
-BR_NO_CHECK_HASH_FOR += $(notdir $(IPMITOOL_PEN_REG_URI))
-IPMITOOL_PEN_REG = $(IPMITOOL_DL_DIR)/$(notdir $(IPMITOOL_PEN_REG_URI))
+ifeq ($(BR2_PACKAGE_IPMITOOL_USE_IANA_PEN),y)
+IPMITOOL_DEPENDENCIES += iana-assignments
+IPMITOOL_CONF_ENV += IANADIR=/usr/share/misc/iana
 else
-IPMITOOL_PEN_REG = $(IPMITOOL_PEN_REG_URI)
+IPMITOOL_PEN_FILE = $(call qstrip,$(BR2_PACKAGE_IPMITOOL_USE_CUSTOM_PEN_FILE))
+ifneq ($(IPMITOOL_PEN_FILE),)
+ifneq ($(findstring ://,$(IPMITOOL_PEN_FILE)),)
+$(error "URL paths are no supported")
 endif #findstring
-define IPMITOOL_INSTALL_PEN_REG
-	$(INSTALL) -D -m 0644 $(IPMITOOL_PEN_REG) \
+define IPMITOOL_INSTALL_PEN_FILE
+	$(INSTALL) -D -m 0644 $(IPMITOOL_PEN_FILE) \
 		$(TARGET_DIR)/usr/share/misc/enterprise-numbers
 endef
-IPMITOOL_POST_INSTALL_TARGET_HOOKS += IPMITOOL_INSTALL_PEN_REG
-endif # IPMITOOL_PEN_REG_URI !empty
-
+IPMITOOL_POST_INSTALL_TARGET_HOOKS += IPMITOOL_INSTALL_PEN_FILE
+endif # IPMITOOL_PEN_REG_FILEI !empty
+endif # BR2_PACKAGE_IPMITOOL_USE_IANA_PEN
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
