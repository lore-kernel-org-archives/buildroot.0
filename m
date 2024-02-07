Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDABBC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 09:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFC548132F;
	Wed,  7 Feb 2024 09:25:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eefSWNVkjSBW; Wed,  7 Feb 2024 09:25:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E06181339
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E06181339;
	Wed,  7 Feb 2024 09:25:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8222D1BF868
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B7A640105
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:24:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LsU3v9Ea7SVJ for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 09:24:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 94EEE400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94EEE400B9
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94EEE400B9
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 09:24:54 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40fc549ab9bso3204235e9.0
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 01:24:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707297892; x=1707902692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zf+qRA+AP+wjhSCS2cjqaHBsjzus0xtIB/upUqgUgdw=;
 b=eiu1aJ/iQ7c3zqHQrTk6n9kPgTWcNIw9pG5hRl7REHZfXG+ljc+S+MxlX5j3sI8uG4
 VdB8yvx8O9f5NjBOpHlRshMAlOO2pQnZ4KsdirT1dL1ojhrjY00jawjBwjWHy7uxGZnT
 Lov8fVlegkcecnNDQ6+nWry0DhntU5feD3/rslKLiVv3m2ztSsUTfRzqochYIOJ/Y2FZ
 0sWcQ85X7wcFXEabFMQFEx1hD6GsEPnUIRpjp8d1rKZhv3X8wp5ZC5NfF8wUfswBl7XE
 aK3oMZzVruoSypA4sG/aWUwU728jQJYwcSCjLC1g4cFsxlbO8IPulgAmQxoJqcl3JbZG
 Qfow==
X-Gm-Message-State: AOJu0YwHCfW4tIlW865UieJvOWExxAiGnjhTkhzPnwnkuXLo2/1moV6H
 NHs2afeLZ+tFFTAO78ZdJxsYRCN5vAqVYVtKVsfu+dfXnqd7/yZzBkhZ4hoBFx1f7V7127AXLh7
 EsQE=
X-Google-Smtp-Source: AGHT+IGYhdC4qplexuZBL83NESfiPauM7Nmh5bY9+jP0GIMQOSNb0xJtCNHJyPMPS0IC3m1w8Y18eg==
X-Received: by 2002:a05:600c:190e:b0:40e:4932:3995 with SMTP id
 j14-20020a05600c190e00b0040e49323995mr4066833wmq.14.1707297892231; 
 Wed, 07 Feb 2024 01:24:52 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWyei3nDbnapbFTFx9MkJFjD6CT+no7pvDzK2b0MwDzIk9O67ZpiGF+a7oPuDrmVgKEQ5bNf5f2g+JtqTXRtZJqExAWlfmG+h8TzcZTYQ4sZhkqkc4SsN1En3mZiseeMvTzBS3CgqYB
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (mob-5-90-63-114.net.vodafone.it. [5.90.63.114])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b0040fddaf9ff4sm4656822wms.40.2024.02.07.01.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 01:24:51 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 10:24:46 +0100
Message-ID: <20240207092447.2094160-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207092447.2094160-1-dario.binacchi@amarulasolutions.com>
References: <20240207092447.2094160-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1707297892; x=1707902692;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zf+qRA+AP+wjhSCS2cjqaHBsjzus0xtIB/upUqgUgdw=;
 b=W5TmstXw1iDMo+yDW2KzbIe9CiOeBNPeLl7lWYoyiPorCJFAdoPO0iqZWi4GrzjUap
 9U2Pcb9T+fWW54XTLOV1ddRlktJZp4ldd3XbWM6VWINwtDoC1xvur9U+KJpwxcrO6oW6
 8LBTa7jM9n4z6xIs2YFO1UgHNBPCbUWLUgkwI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=W5TmstXw
Subject: [Buildroot] [PATCH v3 2/3] package/davinci-bootcount: rename to
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
 Dario Binacchi <dariobin@libero.it>,
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
index 5fbe5d903074..cf32f887d4b0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2024.02"
 
+config BR2_PACKAGE_DAVINCI_BOOTCOUNT
+	bool "davinci-bootcount has been renamed"
+	select BR2_LEGACY
+	help
+	  The davinci-bootcount package has been renamed.
+
 config BR2_PACKAGE_PYTHON_CROSSBAR
 	bool "python-crossbar removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 7906a940a9b2..43dd5c8cb49d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -760,7 +760,7 @@ F:	package/sscep/
 F:	package/uuu/
 
 N:	Dario Binacchi <dariobin@libero.it>
-F:	package/davinci-bootcount/
+F:	package/uboot-bootcount/
 F:	package/libmnl/
 
 N:	David Bachelart <david.bachelart@bbright.com>
diff --git a/package/Config.in b/package/Config.in
index 24e5f04ed671..4c6deb13337c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -486,7 +486,6 @@ endmenu
 	source "package/cwiid/Config.in"
 	source "package/dahdi-linux/Config.in"
 	source "package/dahdi-tools/Config.in"
-	source "package/davinci-bootcount/Config.in"
 	source "package/dbus/Config.in"
 	source "package/dbus-broker/Config.in"
 	source "package/dbus-cpp/Config.in"
@@ -638,6 +637,7 @@ endmenu
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
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
