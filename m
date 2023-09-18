Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0128BC46CA1
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 15:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 805BA4086C;
	Mon, 18 Sep 2023 15:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 805BA4086C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dorBMXgSsHHj; Mon, 18 Sep 2023 15:39:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0A5E405FB;
	Mon, 18 Sep 2023 15:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0A5E405FB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 692231BF3D4
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 15:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AC0D80DAA
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 15:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AC0D80DAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gKgbiFPY6fu4 for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 15:39:35 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC85B80DA8
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 15:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC85B80DA8
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso593486266b.0
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 08:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695051572; x=1695656372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=flInz1RmbOd7McBddyuWnpB29eJT4LPKNfKW/ZQjG6A=;
 b=IXOgZoEYxjbEySQg34ddPgsYryNGupg3JP86z2JPvAo26SPwGwDEJXsSD0H6cMI+q0
 eO507x9URKWNk5cBvxHdSmaJwC18qD33zSGnMgvAhdkHIS48bVlplhuCrgH1rlo9Ghg7
 iRZe5LaHimmLfIY7aZQx0HfTFsWL1wQ19LntPemfXTTrx/ntqF45AZwjNo9vqC54qs6K
 O/AvbYSMR3CgUcqDMQmnhCHY1k188x5ENTFZQ0hYdG35pss7R6Dad1aYYoryX7N1FiwW
 r3IBRVIvHcEn7CxGfJWySbKVgPRsRFHD5UHjTn/uofgtgrR4Lek+hXhDo1YSY7JkJvBm
 yMNw==
X-Gm-Message-State: AOJu0YxVdXUuRqhpMfSY14W3TBP71oknQCMcVR/lq8yL+OUx/06vkwBr
 Fnd+coxm5ZP6DRdXTbzt5hx204OQUDPvLdEwTvLxcQ==
X-Google-Smtp-Source: AGHT+IF23xd5Ba/3gu5tFLM3DsNZp7JVuvdrsGqcWJtuFTtNkMaVrgrNNz9JzI51Lm5uibBCFf38LA==
X-Received: by 2002:a17:906:530e:b0:9a1:f21e:cdfc with SMTP id
 h14-20020a170906530e00b009a1f21ecdfcmr8625607ejo.41.1695051572414; 
 Mon, 18 Sep 2023 08:39:32 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-180-3-189.retail.telecomitalia.it. [80.180.3.189])
 by smtp.gmail.com with ESMTPSA id
 rn5-20020a170906d92500b0099bd5d28dc4sm6585796ejb.195.2023.09.18.08.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 08:39:32 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Sep 2023 17:39:09 +0200
Message-Id: <20230918153909.1759415-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918153909.1759415-1-dario.binacchi@amarulasolutions.com>
References: <20230918153909.1759415-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1695051572; x=1695656372;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=flInz1RmbOd7McBddyuWnpB29eJT4LPKNfKW/ZQjG6A=;
 b=hI+PIM3uyYKzcW3DNTmG+AyhK9RNbmPe19q7FnocII65ZzSyFS0xyg8hPUJAXUuQJ6
 OLn4fOdifQENkJytslBJIDshUJy01KWVHlVRkn/bD2q5bfXslZmxBoyjq0kE8J46LRhY
 hT9QCu5z76wtj3HSOZK/9Pnh/jCrKQS5SGPEU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=hI+PIM3u
Subject: [Buildroot] [PATCH v2 2/2] package/davinci-bootcount: rename to
 uboot-bootcount
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Dario Binacchi <dariobin@libero.it>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Born as a project to read/write the bootcount on the TI am3xx platform,
over time it has introduced bootcount management on EEPROM and for the
stm32mp1 platform. As a result, the project removed the 'davinci' tag
from its name and GitHub link.
The patch aligns the package name in Buildroot with the current one on
GitHub.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 Config.in.legacy                                  |  6 ++++++
 DEVELOPERS                                        |  2 +-
 package/Config.in                                 |  2 +-
 package/davinci-bootcount/Config.in               | 11 -----------
 package/davinci-bootcount/davinci-bootcount.mk    | 15 ---------------
 package/uboot-bootcount/Config.in                 | 10 ++++++++++
 .../uboot-bootcount.hash}                         |  2 +-
 package/uboot-bootcount/uboot-bootcount.mk        | 15 +++++++++++++++
 8 files changed, 34 insertions(+), 29 deletions(-)
 delete mode 100644 package/davinci-bootcount/Config.in
 delete mode 100644 package/davinci-bootcount/davinci-bootcount.mk
 create mode 100644 package/uboot-bootcount/Config.in
 rename package/{davinci-bootcount/davinci-bootcount.hash => uboot-bootcount/uboot-bootcount.hash} (80%)
 create mode 100644 package/uboot-bootcount/uboot-bootcount.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index daf83dda4a1c..0a2a5a728faf 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2023.11"
 
+config BR2_PACKAGE_DAVINCI_BOOTCOUNT
+	bool "davinci-bootcount has been renamed"
+	select BR2_LEGACY
+	help
+	  The davinci-bootcount package has been renamed.
+
 config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS
 	bool "google-material-design-icons removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index e8b78a8d4648..d3a041c68e38 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -739,7 +739,7 @@ F:	package/sscep/
 F:	package/uuu/
 
 N:	Dario Binacchi <dariobin@libero.it>
-F:	package/davinci-bootcount/
+F:	package/uboot-bootcount/
 F:	package/libmnl/
 
 N:	David Bachelart <david.bachelart@bbright.com>
diff --git a/package/Config.in b/package/Config.in
index e8dbadadf323..0ac137fc1ca0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -476,7 +476,6 @@ endmenu
 	source "package/cwiid/Config.in"
 	source "package/dahdi-linux/Config.in"
 	source "package/dahdi-tools/Config.in"
-	source "package/davinci-bootcount/Config.in"
 	source "package/dbus/Config.in"
 	source "package/dbus-broker/Config.in"
 	source "package/dbus-cpp/Config.in"
@@ -627,6 +626,7 @@ endmenu
 	source "package/ti-utils/Config.in"
 	source "package/tio/Config.in"
 	source "package/triggerhappy/Config.in"
+	source "package/uboot-bootcount/Config.in"
 	source "package/uboot-tools/Config.in"
 	source "package/ubus/Config.in"
 	source "package/udev/Config.in"
diff --git a/package/davinci-bootcount/Config.in b/package/davinci-bootcount/Config.in
deleted file mode 100644
index 0201530f9166..000000000000
--- a/package/davinci-bootcount/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_DAVINCI_BOOTCOUNT
-	bool "davinci-bootcount"
-	depends on BR2_arm # only relevant for TI am335x
-	help
-	  U-Boot implements a boot count scheme that can be used to
-	  detect multiple failed attempts to boot Linux. On Davinci
-	  platform (TI AM 335x) the `bootcount' is stored in the RTC
-	  SCRATCH2 register. This tool allows to read and write this
-	  register from userspace.
-
-	  https://github.com/VoltServer/uboot-bootcount
diff --git a/package/davinci-bootcount/davinci-bootcount.mk b/package/davinci-bootcount/davinci-bootcount.mk
deleted file mode 100644
index 884bf420f396..000000000000
--- a/package/davinci-bootcount/davinci-bootcount.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# davinci-bootcount
-#
-################################################################################
-
-DAVINCI_BOOTCOUNT_VERSION = 2.0.0
-DAVINCI_BOOTCOUNT_SITE = $(call github,VoltServer,uboot-bootcount,v$(DAVINCI_BOOTCOUNT_VERSION))
-DAVINCI_BOOTCOUNT_LICENSE = GPL-3.0
-DAVINCI_BOOTCOUNT_LICENSE_FILES = COPYING
-
-# sources fetched from github, no configure script
-DAVINCI_BOOTCOUNT_AUTORECONF = YES
-
-$(eval $(autotools-package))
diff --git a/package/uboot-bootcount/Config.in b/package/uboot-bootcount/Config.in
new file mode 100644
index 000000000000..53a0bd9174a4
--- /dev/null
+++ b/package/uboot-bootcount/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_UBOOT_BOOTCOUNT
+	bool "uboot-bootcount"
+	default y if BR2_PACKAGE_DAVINCI_BOOTCOUNT # legacy
+	help
+	  U-Boot implements a boot count scheme that can be used to
+	  detect multiple failed attempts to boot Linux. This tool
+	  allows to read and write bootcount from userspace for some
+	  platforms (TI AM335X or STM32MP1) or from I2C EEPROM.
+
+	  https://github.com/VoltServer/uboot-bootcount
diff --git a/package/davinci-bootcount/davinci-bootcount.hash b/package/uboot-bootcount/uboot-bootcount.hash
similarity index 80%
rename from package/davinci-bootcount/davinci-bootcount.hash
rename to package/uboot-bootcount/uboot-bootcount.hash
index 53435b1d1d6d..e1ebc442357e 100644
--- a/package/davinci-bootcount/davinci-bootcount.hash
+++ b/package/uboot-bootcount/uboot-bootcount.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  12b5aa83736efb2fefd22cd4d9f305a25c68dfaa10401d5efb17e55a5163934e  davinci-bootcount-2.0.0.tar.gz
+sha256  12b5aa83736efb2fefd22cd4d9f305a25c68dfaa10401d5efb17e55a5163934e  uboot-bootcount-2.0.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/uboot-bootcount/uboot-bootcount.mk b/package/uboot-bootcount/uboot-bootcount.mk
new file mode 100644
index 000000000000..07b52ab89eb5
--- /dev/null
+++ b/package/uboot-bootcount/uboot-bootcount.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# uboot-bootcount
+#
+################################################################################
+
+UBOOT_BOOTCOUNT_VERSION = 2.0.0
+UBOOT_BOOTCOUNT_SITE = $(call github,VoltServer,uboot-bootcount,v$(UBOOT_BOOTCOUNT_VERSION))
+UBOOT_BOOTCOUNT_LICENSE = GPL-3.0
+UBOOT_BOOTCOUNT_LICENSE_FILES = COPYING
+
+# sources fetched from github, no configure script
+UBOOT_BOOTCOUNT_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
