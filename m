Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09301F417F3
	for <buildroot@archiver.kernel.org>; Mon,  9 Mar 2026 15:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3827060B2C;
	Mon,  9 Mar 2026 15:57:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Efth-yNf9__F; Mon,  9 Mar 2026 15:57:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7F3960A65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773071850;
	bh=lkBzeXdSH38ZrFdm5tlsLMswMNX93s5F//oLyHtRpQA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UyHORxDkahnd3+c8nw3I1/LoUD8urFL0vcq6wPzsmNr2pmbb42qNgXuzAx/5Xo+DV
	 op8oaD3Rt3ozq367hCvprj7ZCewKMC3fqnFxY0S8Mqmxb/w/zfMi+Iy+GtErGZ5s8T
	 ugPf2kAbTu+gWR+AfvZC6Q9vSezCguu+cSjDru1EbLzqpS37Y3NaL7NNEomLQ3i6gq
	 aE1WHTKnF103Nh9/P6jCguC6saAkgD4u96EPtnBJEpLNJhgMPaFNZBxnFChbDsH5tc
	 aYh4/BCtydmgmW06kNakdbSA5n6RCaEfR44OEuwVhWiXaBbiWgBMUlxwvd+joYUeFx
	 cdikqvn8ou3MA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7F3960A65;
	Mon,  9 Mar 2026 15:57:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 66841358
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 15:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C74060A79
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 15:57:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJd8aLdpIOD9 for <buildroot@buildroot.org>;
 Mon,  9 Mar 2026 15:57:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.46;
 helo=mail-wm1-f46.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D2A5960A4C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2A5960A4C
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2A5960A4C
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 15:57:27 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4852e9ca034so20829305e9.2
 for <buildroot@buildroot.org>; Mon, 09 Mar 2026 08:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773071846; x=1773676646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jDLQ6D53EzSCokQps3PSarSLqhdjYAPdEo75n/WGM64=;
 b=CfiWMfXud1HhyMW3htGkpWwIQQ6MCejkay2OHlArJMJSEKUUIuvpgCQKG76Ej6dpLf
 Y6urp2cWkXpE4rLoEzuWGWMzTc1rXhUL2/2jsaJj4Rudjl92v7PtJd9741bDki923Vv3
 QiX1NA2Q/qOeFT1ICINWFGDzBXQSIlpqzSQPug1wq2RXnqUsET11uHaJz8riMR3eWgsm
 Sf0F7AuLHxnrk3CdJjJIuIO1K8xkWCv0aCn1Y6ZV/IQ2xY08CzxWQ2zv3lDAJVgca3xF
 00auWh2zNilXoARQcsvUvJiFgFub6dAtihITNAUI1IgiPwpY20ZuQnFjQ1hea8OCSqGU
 EZCw==
X-Gm-Message-State: AOJu0Ywd2gkBRTc3EwmBNh0l57lQ4sz8J1Gsv2VuiTCJzfBsl5IFWr3T
 NM8DAhegy+fWlneDXSfrcv/GSW2cCId93To5GRnCrWyyTjqS0BmTfZhj
X-Gm-Gg: ATEYQzwfZtgl3U1UNujRE9kL+PERot8wUqRy52PF9xy7ZJs4Fx3oRYG20Un1KZGDH+m
 b671Q+sf4Nb60Spd4YLzfUxpPYEXu8ynDfOm36m6Gaf8/Do0s5eq3YXMSB950clp6nghtj/Jtpq
 8cXRvRrSoRQHhPpKSGXIkCKxw+eiKw1f/lmu2LhRaB8OnJ+h2mtdEeSUNP3VLNsXBExv6INxiup
 fu1BR+3HiDRqIsVUkaqa97VfHpJrQXx+vPLJ0+qLy6Bvtd1N3RgddGRT2dRNUkIhcZ7Czvh81sf
 QyqBhuF6qaFJACvAca2mXUVpZI8JGpYIMjZHozAtGgbfANg3SQEoLeouHbiHDGi1ZTEglKuSvJT
 kWmChIsusCnqVja0rucJmgIlbWXCUHq3TE2ZvoE1FQYD9V8tReYi6B+ULm38JSgaQ5tLd2DV5HE
 NkoOT2Aym6qdjDuk4qxXFCXMDDcXU17Rp0BzN6ozl3qKiRfbBg61esOHQC6CrEEyxRPiNbObXHq
 Ch639qk/TjWtRMm5D88cREGTpQynoV02mLpr9Y5bZQHSGHTo0j1WtorwkMyg0xjoVChKdxrhTdK
 Lek9ENia
X-Received: by 2002:a05:600c:4443:b0:485:410c:119b with SMTP id
 5b1f17b1804b1-485410c1bfemr13349285e9.13.1773071845185; 
 Mon, 09 Mar 2026 08:57:25 -0700 (PDT)
Received: from KORLIN44614.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-48541aa73dasm1511865e9.2.2026.03.09.08.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 08:57:24 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Cc: buildroot@buildroot.org, jorik.devreese@barco.com,
 thomas.petazzoni@bootlin.com
Date: Mon,  9 Mar 2026 16:57:21 +0100
Message-ID: <20260309155722.1538643-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309075143.1526466-1-thomas@devoogdt.com>
References: <20260309075143.1526466-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v3] package/sema-linux-ec: add new adlink sema
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
 - added user sw step
 - fixed help text
 - fixed hash and license info
v3: fixed build args
---
 package/Config.in                             |  1 +
 ...CC-variable-instead-of-hardcoded-gcc.patch | 54 +++++++++++++++++++
 package/sema-linux-ec/Config.in               | 12 +++++
 package/sema-linux-ec/sema-linux-ec.hash      |  5 ++
 package/sema-linux-ec/sema-linux-ec.mk        | 36 +++++++++++++
 5 files changed, 108 insertions(+)
 create mode 100644 package/sema-linux-ec/0001-Makefile-use-CC-variable-instead-of-hardcoded-gcc.patch
 create mode 100644 package/sema-linux-ec/Config.in
 create mode 100644 package/sema-linux-ec/sema-linux-ec.hash
 create mode 100644 package/sema-linux-ec/sema-linux-ec.mk

diff --git a/package/Config.in b/package/Config.in
index 0da9dc29287..ae32bcdd055 100644
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
index 00000000000..425496916cf
--- /dev/null
+++ b/package/sema-linux-ec/sema-linux-ec.mk
@@ -0,0 +1,36 @@
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
+define SEMA_LINUX_EC_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
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
