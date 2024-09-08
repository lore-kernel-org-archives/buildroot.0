Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCB4E6FE49
	for <buildroot@archiver.kernel.org>; Sun,  8 Sep 2024 14:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE3DA4035C;
	Sun,  8 Sep 2024 14:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rjmkIIvfhdVI; Sun,  8 Sep 2024 14:48:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 092D4403C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 092D4403C2;
	Sun,  8 Sep 2024 14:48:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB5FB1BF2B9
 for <buildroot@lists.busybox.net>; Sun,  8 Sep 2024 14:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D60EB80F9E
 for <buildroot@lists.busybox.net>; Sun,  8 Sep 2024 14:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cN2gbj3lPosm for <buildroot@lists.busybox.net>;
 Sun,  8 Sep 2024 14:48:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 68A4580F94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68A4580F94
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68A4580F94
 for <buildroot@buildroot.org>; Sun,  8 Sep 2024 14:48:22 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c3c30e663fso4048341a12.1
 for <buildroot@buildroot.org>; Sun, 08 Sep 2024 07:48:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725806900; x=1726411700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cUbbb1kXWjjwyYgJbT9QmmJzLRqPEvZMt2LGUusZfNw=;
 b=EFODovIMQ7XssCquphthiD2N3Veb+HqjhqSjKM080e2SXTaRWL45RFyrHwFvm3Ss80
 wLpYIndr2h/65I2VgrQnP/bLVzBj0nkFluAU/sUBSLn1+aPQ/75W5Hf+oMR0FXu2L8LQ
 4oMk8Ob8Gu+smKr/jjE1tK/nSwUKv2T+GK/L25JJpp9F6pK7ry40XLVBRvtteMPHYFcC
 Xd18L++ewdH4KKJOub3ytWh5PRqdz44Gzn2vIMsfnSv0PJbBMvB+HFfSOWbdq/AfQ/wO
 a+JAX+1rOn/YrrJGez44//+FjdulPxRbinMeoIGo4lWzc4EK5apK9N6n7/pdqmcTbm1z
 f7LA==
X-Gm-Message-State: AOJu0Ywl74QDEy2ELDJbwHBzpPQLDTAiI1X6q1A9YIF3RPqz6k3flocM
 ujwH/RMNd8O1QORkqS6F3LOjWn6KZgosds83HZhODi82n3QU6S6VJ5+tOEbccm8Ut8gf7pHxkcG
 Tqck=
X-Google-Smtp-Source: AGHT+IG+hqd319M3cEQQ0a/XAzr9ufnID/cnWIhx8Z+UY2W8g9fhxAOZcUAd6Je4iEIrIZfsE4sb4A==
X-Received: by 2002:a05:6402:3604:b0:5bf:c8:78a with SMTP id
 4fb4d7f45d1cf-5c3dc795ce9mr5329399a12.17.1725806899863; 
 Sun, 08 Sep 2024 07:48:19 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-4-102-18.retail.telecomitalia.it. [87.4.102.18])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd4693fsm1926602a12.37.2024.09.08.07.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Sep 2024 07:48:19 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  8 Sep 2024 16:48:15 +0200
Message-ID: <20240908144815.3822467-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240908144815.3822467-1-dario.binacchi@amarulasolutions.com>
References: <20240908144815.3822467-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725806900; x=1726411700;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cUbbb1kXWjjwyYgJbT9QmmJzLRqPEvZMt2LGUusZfNw=;
 b=YMt4JaRfIQKsI1Pwh/H7yRNp9VbPrdcYetc9+e/z68oZoVUPxuZzu4P8oFE4xL2bbV
 iCPTH0a974qskF0020PD7+mxLf5Je1mPKEj2XLDoMtvgYrCzriqmbg8Ic3XraS/k1jZm
 JksIkARbP/oeEMValL1kz2Gq2/nBLSLPpVpIU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=YMt4JaRf
Subject: [Buildroot] [PATCH v4 2/2] package/ipmitool: use versioned or
 custom PEN registry
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

With this patch, if the PEN (Enterprise numbers) registry is installed
by the iana-assignments package, ipmitool will use it. Otherwise, the
user can provide a custom file named enterprise-numbers to be placed
under /usr/share/misc/ of the overlay rootfs.

Downloading such a file is no longer supported.

Fixes:
- http://autobuild.buildroot.org/results/5ae5ee948d99679cd50d1115a7d46f4368347b4f

Co-Developed-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Co-Developed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v3 -> v4:
  - Drop BR2_PACKAGE_IPMITOOL_PEN_REG_URI and mark as a legacy option.
  - Drop IPMITOOL_DEPENDENCIES += iana-assignments.
  - Add IPMITOOL_CONF_ENV += IANADIR=/usr/share/misc in case of
    custom PEN.
  - Use IANA PEN registry in case BR2_PACKAGE_IANA_ASSIGNMENTS_PEN_REG
    is enabled.
  - Update the commit message.

Changes v2 -> v3:
  - Use by default enterprise-numbers from iana-assignments package.
  - Alternatively allows to use a local PEN registry file.
  - Don't support URL path for PEN registry.

Changes v1 -> v2:
  - use an enterprise-numbers file versioned

 Config.in.legacy             | 12 ++++++++++++
 package/ipmitool/Config.in   | 18 ++++++------------
 package/ipmitool/ipmitool.mk | 20 ++++++--------------
 3 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7513aa7efd66..ece342bb12d9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -189,6 +189,18 @@ config BR2_BINUTILS_VERSION_2_40_X
 
 comment "Legacy options removed in 2024.08"
 
+config BR2_PACKAGE_IPMITOOL_PEN_REG_URI
+	string "IANA PEN registry move to iana-assignment package"
+	help
+	  Installation of the IANA PEN is now handled by the
+	  iana-assignment package; to install a custom PEN,
+	  use a rootfs-overlay for example.
+
+config BR2_PACKAGE_IPMITOOL_PEN_REG_URI_WRAP
+	bool
+	default y if BR2_PACKAGE_IPMITOOL_PEN_REG_URI != ""
+	select BR2_LEGACY
+
 config BR2_PACKAGE_MIDORI
 	bool "midori has been removed"
 	select BR2_LEGACY
diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
index 9516ff8596d3..5cbcf8e535d4 100644
--- a/package/ipmitool/Config.in
+++ b/package/ipmitool/Config.in
@@ -5,22 +5,16 @@ config BR2_PACKAGE_IPMITOOL
 	  IPMItool provides a simple command-line interface to
 	  IPMI-enabled devices.
 
+	  Note: If the PEN (Enterprise Numbers) registry is installed
+	  by the "iana-assignments" package, ipmitool will use it.
+	  Otherwise, the user can provide a custom file named
+	  enterprise-numbers to be placed in the usr/share/misc/
+	  directory of the overlay rootfs.
+
 	  https://github.com/ipmitool/ipmitool/
 
 if BR2_PACKAGE_IPMITOOL
 
-config BR2_PACKAGE_IPMITOOL_PEN_REG_URI
-	string "IANA PEN registry URL or path"
-	default "https://www.iana.org/assignments/enterprise-numbers.txt"
-	help
-	  Enter an URL or a file path to the PEN registry to use.
-
-	  Note that the official registry is 4MiB+ and may change any
-	  time and is thus not guaranteed to be reproducible.
-
-	  Leave empty to not use a registry; vendor IDs will be
-	  displayed instead of the corresponding names.
-
 config BR2_PACKAGE_IPMITOOL_LANPLUS
 	bool "enable lanplus interface"
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index 4f2151904d43..f2ae72bab841 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -49,20 +49,12 @@ endef
 IPMITOOL_POST_INSTALL_TARGET_HOOKS += IPMITOOL_REMOVE_IPMIEVD
 endif
 
-IPMITOOL_PEN_REG_URI = $(call qstrip,$(BR2_PACKAGE_IPMITOOL_PEN_REG_URI))
-ifneq ($(IPMITOOL_PEN_REG_URI),)
-ifneq ($(findstring ://,$(IPMITOOL_PEN_REG_URI)),)
-IPMITOOL_EXTRA_DOWNLOADS += $(IPMITOOL_PEN_REG_URI)
-BR_NO_CHECK_HASH_FOR += $(notdir $(IPMITOOL_PEN_REG_URI))
-IPMITOOL_PEN_REG = $(IPMITOOL_DL_DIR)/$(notdir $(IPMITOOL_PEN_REG_URI))
+ifeq ($(BR2_PACKAGE_IANA_ASSIGNMENTS_PEN_REG),y)
+IPMITOOL_CONF_ENV += IANADIR=/usr/share/misc/iana
 else
-IPMITOOL_PEN_REG = $(IPMITOOL_PEN_REG_URI)
-endif #findstring
-define IPMITOOL_INSTALL_PEN_REG
-	$(INSTALL) -D -m 0644 $(IPMITOOL_PEN_REG) \
-		$(TARGET_DIR)/usr/share/misc/enterprise-numbers
-endef
-IPMITOOL_POST_INSTALL_TARGET_HOOKS += IPMITOOL_INSTALL_PEN_REG
-endif # IPMITOOL_PEN_REG_URI !empty
+# Directory where ipmitool will search a custom PEN
+# registry provided by the user in the rootfs overlay.
+IPMITOOL_CONF_ENV += IANADIR=/usr/share/misc
+endif
 
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
