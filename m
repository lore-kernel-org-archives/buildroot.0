Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C416EF36FE
	for <buildroot@archiver.kernel.org>; Mon,  9 Mar 2026 07:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9722940827;
	Mon,  9 Mar 2026 07:51:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CysLa2i38XLA; Mon,  9 Mar 2026 07:51:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CD4A405FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773042713;
	bh=zVghA0fLtk3uvWd/W37Gl1rXHZi56fZyd6eIYebbXbg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YHvjLworILMXzggKCHneADmH94VLBuFsl5hqk7f+K0g531cptoOIRxwIEhnRZkt+Y
	 lrE7XvASKV1WrMVAM8H1DyujWwmtQ+BbNjM7WM1ca8k9y1dZTyC+bBSB+4OHCG15HV
	 UKwoL4o6piEVBxkQZaCLArIwLpwF9qGf89qOh35R6Lp1CiEK9NaPFntfGRXpuPek4A
	 N7V09NAmxYSHlJ8Mqq5R8ONJhxmp/c4SLRA7BG/tFbjISWS6Bx2zrs6TPFr4P1khNp
	 9AnOizNqhCIyWNYx2KDsgmaA5io1uU6/H2Wai6BqRGF4PDqW1uHihTCxasiEqIQ9cU
	 UmEXmGUDtYK1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CD4A405FA;
	Mon,  9 Mar 2026 07:51:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 961AB358
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 07:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76DC1811B3
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 07:51:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kSateFrFJtRH for <buildroot@buildroot.org>;
 Mon,  9 Mar 2026 07:51:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.42;
 helo=mail-wm1-f42.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F33FD80F6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F33FD80F6B
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F33FD80F6B
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 07:51:48 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4852c9b4158so13254785e9.0
 for <buildroot@buildroot.org>; Mon, 09 Mar 2026 00:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773042707; x=1773647507;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gJu0OIu2q5rRpaEQkbRo2VWHCFWCju5iVv2y0xdfiLE=;
 b=Sg0POcWwhVXtgCNFBfQbPQ5QsRxhfMwQ3LJdgGG+tQqLJSFQqfkFs2/1A4on0LN4en
 MbHdXK8UsnvmKpf2aEQgVZ/yun0hZ+R6MT0GXDLYNouQmVveNWbTjSgYlzlB49Gu1NPk
 /xgktM/+/7aePihaZfwg7Bfzv/O/TMpP6oUAtIXnmbvBNQpTm/wWuYTFP8Xt0VARly47
 YNwzmI00FXBsif6PTtL/D+JSqnpQrKg6KVhTOazVA2whcUOXuM6KfCgbRh0s0ND0h8VM
 S2YSaGHbEL0vWRJ7BwVEahRUmLS2DTeJMqjeL/lGVq3Y3V2QaDR78rBAM8XtJZZ+YIMr
 MNeA==
X-Gm-Message-State: AOJu0YxLGXeh6X6J5PyXYvbnpwlP3cU20Ce9XeP+praBkQ5GkLKVCA1e
 NBcxPybJG/jzEvvED+Mvw1o5CUAsbk3IX+jhNaLa3UxSkzijDYMwWp2p
X-Gm-Gg: ATEYQzxtol/bez6UphEpxi9lOIXTVPmS0AQgR5huZUPJImAB/g3VfnChBjE0rN0MJxu
 6rxvJe1U5mDEDeXPWiOLNlwOLnq+OAKSyXxqYY+tgAH6RTs5a+tzFL+b4CgE6Cmvd3Yum9zDArY
 j8TEg1LTlOF0qFWohY8H2Zcx8ymCh36yzKZnEwbx2NNvjG4tJN3lYuear92IhFDpyn6CNC3Bz6T
 OzghwayLwh8fHbNxezSihj5C+sf3aIYvignCAGb4vM9KPUb/1z1XnegAyiH6enOKd7Me6laCRHY
 Ensp2tHM6iuCOOl7spvUiGE0hVKs73Sv75Bl9Tsc7bx9tlNKzi6W6jcKXE8+/BNIWGCnZuDNGU6
 ExQqAeR/gLp69g7aOahB0qgfsbkOJak2tPH1QR/2urzVAvrTC0fnK5FGAJQcCDxEVYuTdZCPpVn
 05cf4e1oNXy8bUN8sBmzjTfys/dJFST/AI5MJ8+P4PW48JZFGNR9AHeb0Hp44Yn8gY6oQIDbowN
 dXvi3TVjO43jqrbOCKejpaerRwtKDAnhLE/IU5in3eK4nSAY25wW/qXERXkq8vtFrb9UMMmzeH5
 ue4U093f
X-Received: by 2002:a05:600c:3b01:b0:485:353f:c651 with SMTP id
 5b1f17b1804b1-485353fc9b9mr67129765e9.22.1773042706586; 
 Mon, 09 Mar 2026 00:51:46 -0700 (PDT)
Received: from KORLIN44614.barco.com (d528f5fdc.static.telenet.be.
 [82.143.95.220]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-485245dbe50sm82657395e9.17.2026.03.09.00.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 00:51:46 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Cc: buildroot@buildroot.org, jorik.devreese@barco.com,
 thomas.petazzoni@bootlin.com
Date: Mon,  9 Mar 2026 08:51:43 +0100
Message-ID: <20260309075143.1526466-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251223221403.61295-1-thomas@devoogdt.com>
References: <20251223221403.61295-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v2] package/sema-linux-ec: add new adlink sema
 drivers package
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

SEMA (Smart Embedded Management Agent) is an agent used to
manage system health and access the I/O pins through an API.

Signed-off-by: Devreese Jorik <jorik.devreese@barco.com>
Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: reworked patch
 - Added user sw step.
 - Fixed help text.
 - Fixed hash and license info.
---
 package/Config.in                             |  1 +
 ...CC-variable-instead-of-hardcoded-gcc.patch | 54 +++++++++++++++++++
 package/sema-linux-ec/Config.in               | 12 +++++
 package/sema-linux-ec/sema-linux-ec.hash      |  5 ++
 package/sema-linux-ec/sema-linux-ec.mk        | 40 ++++++++++++++
 5 files changed, 112 insertions(+)
 create mode 100644 package/sema-linux-ec/0001-Makefile-use-CC-variable-instead-of-hardcoded-gcc.patch
 create mode 100644 package/sema-linux-ec/Config.in
 create mode 100644 package/sema-linux-ec/sema-linux-ec.hash
 create mode 100644 package/sema-linux-ec/sema-linux-ec.mk

diff --git a/package/Config.in b/package/Config.in
index 07d7e49ae7b..ef1920edb58 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -604,6 +604,7 @@ endmenu
 	source "package/sane-backends/Config.in"
 	source "package/sdparm/Config.in"
 	source "package/sedutil/Config.in"
+	source "package/sema-linux-ec/Config.in"
 	source "package/setserial/Config.in"
 	source "package/sg3_utils/Config.in"
 	source "package/sigrok-cli/Config.in"
diff --git a/package/sema-linux-ec/0001-Makefile-use-CC-variable-instead-of-hardcoded-gcc.patch b/package/sema-linux-ec/0001-Makefile-use-CC-variable-instead-of-hardcoded-gcc.patch
new file mode 100644
index 00000000000..0b8fa8e2a78
--- /dev/null
+++ b/package/sema-linux-ec/0001-Makefile-use-CC-variable-instead-of-hardcoded-gcc.patch
@@ -0,0 +1,54 @@
+From b0fe05883637d006a7f958a9e735b84f4ba6ba90 Mon Sep 17 00:00:00 2001
+From: Devreese Jorik <jorik.devreese@barco.com>
+Date: Mon, 19 Jan 2026 15:00:00 +0000
+Subject: [PATCH] Makefile: use CC variable instead of hardcoded gcc
+
+Allow the compiler to be overridden via the CC variable for
+cross-compilation support.
+
+Upstream: https://github.com/ADLINK/sema-linux-ec/pull/14
+Signed-off-by: Devreese Jorik <jorik.devreese@barco.com>
+Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ Makefile | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 440e377..ad02cf9 100644
+--- a/Makefile
++++ b/Makefile
+@@ -25,7 +25,7 @@ all: libsema.so semautil wdogtest modules
+ driver: modules
+ 
+ libsema.so: $(SEMA_OBJS)
+-	@gcc -shared -fPIC -g -o lib/$@ $^
++	@$(CC) -shared -fPIC -g -o lib/$@ $^
+ 
+ modules:
+ 	@make -C /lib/modules/`uname -r`/build M=`pwd` $@
+@@ -91,16 +91,16 @@ app_clean:
+ 	@rm -f semautil wdogtest app/*.o lib/*.o lib/*.so
+ 
+ semautil: $(APP_OBJS)
+-	@gcc -g -o $@ $^ -Llib -lsema -luuid
++	@$(CC) -g -o $@ $^ -Llib -lsema -luuid
+ 
+ wdogtest: $(WDOG_OBJS)
+-	@gcc $^ -g -o $@
++	@$(CC) $^ -g -o $@
+ 
+ lib/%.o: lib/%.c
+-	@gcc -Wall -I lib -g -fPIC -c $< -o $@
++	@$(CC) -Wall -I lib -g -fPIC -c $< -o $@
+ 
+ app/%.o: app/%.c
+-	@gcc -Wall -I lib -g -fPIC -c $< -o $@
++	@$(CC) -Wall -I lib -g -fPIC -c $< -o $@
+ 
+ watchdogtest/%.o: watchdogtest/%.c
+-	@gcc -Wall -I lib -g -fPIC -c $< -o $@
++	@$(CC) -Wall -I lib -g -fPIC -c $< -o $@
+-- 
+2.43.0
+
diff --git a/package/sema-linux-ec/Config.in b/package/sema-linux-ec/Config.in
new file mode 100644
index 00000000000..8d6d0e17a53
--- /dev/null
+++ b/package/sema-linux-ec/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_SEMA_LINUX_EC
+	bool "sema-linux-ec"
+	depends on !BR2_s390x
+	depends on BR2_LINUX_KERNEL
+	help
+	  SEMA (Smart Embedded Management Agent) is an agent used to
+	  manage system health and access the I/O pins through an API.
+
+	  https://github.com/ADLINK/sema-linux-ec
+
+comment "sema-linux-ec needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/sema-linux-ec/sema-linux-ec.hash b/package/sema-linux-ec/sema-linux-ec.hash
new file mode 100644
index 00000000000..d32864316e1
--- /dev/null
+++ b/package/sema-linux-ec/sema-linux-ec.hash
@@ -0,0 +1,5 @@
+# locally computed
+sha256  daef5a95e686ce1fa59511280759ccdaf59d41eb698b7c5df0a35e98c0718127  sema-linux-ec-v4.3.12.tar.gz
+sha256  c45298c445058c0f8413c94be71ecedd55f306f3149ed2aea90b0e098ddc8810  LICENSE.BSD3
+sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  LICENSE.GPLv2
+sha256  2358eef45f799ab496fe93f4791f509524d3d65ca046e562706e62d72f738f20  LICENSE.dual
diff --git a/package/sema-linux-ec/sema-linux-ec.mk b/package/sema-linux-ec/sema-linux-ec.mk
new file mode 100644
index 00000000000..475f8a8c371
--- /dev/null
+++ b/package/sema-linux-ec/sema-linux-ec.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# sema-linux-ec
+#
+################################################################################
+
+SEMA_LINUX_EC_VERSION = v4.3.12
+SEMA_LINUX_EC_SITE = $(call github,ADLINK,sema-linux-ec,$(SEMA_LINUX_EC_VERSION))
+SEMA_LINUX_EC_LICENSE = BSD-3-Clause or GPL-2.0
+SEMA_LINUX_EC_LICENSE_FILES = LICENSE.BSD3 LICENSE.GPLv2 LICENSE.dual
+
+SEMA_LINUX_EC_MAKE_OPTS = \
+	$(LINUX_MAKE_FLAGS) \
+	KERNELDIR=$(LINUX_DIR)
+
+define SEMA_LINUX_EC_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(SEMA_LINUX_EC_MAKE_OPTS) -C $(@D) \
+		libsema.so semautil wdogtest
+endef
+
+define SEMA_LINUX_EC_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/lib/libsema.so $(TARGET_DIR)/usr/lib/libsema.so
+	$(INSTALL) -D -m 0755 $(@D)/semautil $(TARGET_DIR)/usr/bin/semautil
+	$(INSTALL) -D -m 0755 $(@D)/wdogtest $(TARGET_DIR)/usr/bin/wdogtest
+endef
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
