Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6DEFCA18D
	for <buildroot@archiver.kernel.org>; Mon,  9 Mar 2026 21:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7DF761306;
	Mon,  9 Mar 2026 21:10:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qM_vgKGmn-Vp; Mon,  9 Mar 2026 21:10:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF3FE61308
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773090641;
	bh=wmW0zNg3BIrX6J1cZzSwp/oD8UFVpPa+R/BuWYqYUYc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rqES2xDolxExd0R/4y0Y7iK4p4LDu8R52HsfRnAxQ0S0w49dBex2gRsq6DgKzs4aW
	 oh5A9QNjBlHRgUmtsn5nYKNTtn2Hfk++0dk/Pq0UHbQ9KcBjaQYXFIjeIAG+r+3zot
	 qFUbhUrlHcGPLGw33ydZTerjBlkiVtaeVkTf7CYPgubAxgw9ZWQDtDaZkbFEq5XtFj
	 LKEDwCCcm57WUSJEPDsj9XDl0Ql/hP7xpOs+tQZ5t9l200txHRaEY1XMgS9f5YGH/3
	 bfl+KvNUtIXdSe1J3fEQC2B0t4DbKlEqulJCyN+WWRSzgSOWwoX1v+IDNoEupKkg1i
	 2Hn1zBk3hCbhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF3FE61308;
	Mon,  9 Mar 2026 21:10:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 048B8B8
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 21:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA31C83C17
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 21:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V34G5Lg89bkd for <buildroot@buildroot.org>;
 Mon,  9 Mar 2026 21:10:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.48;
 helo=mail-wr1-f48.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9C40B83C0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C40B83C0A
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C40B83C0A
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 21:10:38 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-439c5b40f60so5051757f8f.0
 for <buildroot@buildroot.org>; Mon, 09 Mar 2026 14:10:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773090636; x=1773695436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g6SW8VEB6EtcSCd+RdgKjDrHYHyxboF2NKtj1qdWa0M=;
 b=hYPSihfYUoqJnlUT5Gu3q0pBO57cpk3Bic3hmEfEffID6Qh6r/T9BNTTxQO408FnJP
 8vVN0duGUOi5qqH+w9KsuRPE1OBleyzZ4x1pvrdrzKsLf9DmwjVihCO+n60q9Arhy9eI
 ONi6M+4q/+OPpIXvMGkyJOMHW4JdwtoiYgjRkTDqpWjq9nHu7l7ZyjjaoVlIB6TcdP/R
 ctixQiXzMl1goD6Y5pimtTCQllumvu+WoEGq0OuOA+K6STiSMZc8zr6vFfI5FjK3G4Sl
 TNFiZhbvaiECze9f7Rqr8ghoFUmUIxIElyXB6wyeK3W2he2MraLafvL75dfZLFRDk6yg
 ivzw==
X-Gm-Message-State: AOJu0YzCNlef0MJvJ8nzgNfvLA0TKuelaK/3WLW9zxkL600R4+ffcLBH
 kDWhBPywQTaDtLfMatMcAho+UZEX7k5y98qTPdsGPt5yUF5dgqp1fz7h
X-Gm-Gg: ATEYQzz9B/OSjZZXwHxh6UDWVOCfgK8H3xHuDpOnn9pXjdPo0Ul8ftUYFfsYsMUbvub
 /D/vp2KQjnS/8wtWQQgqRUVyPk4OBqxPjUS8KYITiZmWea3nfUtcFLlJtaHoFs4LbRZJYF9iIAY
 yTCUMlSTXGRSUquuIN+3UxcgudbfHqBaGmUwShjojm1LQxQYnYHM8+I90YzMB7oAa1qhjEpVQx/
 zZg2n3iAPmhGB4NuWAc42XQKLqreM08bjI2Zyo5CBfVkW4r3vc4nAbdinvMfvpkz/Hs+IoF8OhP
 Wx03hLI+5ZPIHNYn6eGMndDWwisVYN9NJDo6LajmRH0DdmyDBXPvvw25yLEWW6wNQMJ/IiSt+rk
 bmxzfDbyJeqjuWBeY8bueJ7fp3ljkMCcA8ScP1InMrEYue98rGKBvDEUrbj+o/yggeJ2p/nu0Sj
 Qje8aM9s9vN+R/98sATy8zqk8Kn7zJjeqsHlgeAMhxiNWKgLZPzQVzzpQib5utkBo75V6mEqBfu
 r312M9pFmnxNUqY3JNiyDt+IIjBy5WHPHTtbJ7XSUH/WmCbJuH3uRIU9zheZluqRn0WiSEr
X-Received: by 2002:a05:600c:540e:b0:485:39d1:b4dd with SMTP id
 5b1f17b1804b1-48539d1bb72mr86548585e9.10.1773090636246; 
 Mon, 09 Mar 2026 14:10:36 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb5f:fa00:ab4a:6365:df9d:bb7c])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-485345acc69sm52695455e9.25.2026.03.09.14.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 14:10:35 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Cc: buildroot@buildroot.org, jorik.devreese@barco.com,
 thomas.petazzoni@bootlin.com
Date: Mon,  9 Mar 2026 22:10:32 +0100
Message-ID: <20260309211032.2109039-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309155722.1538643-1-thomas@devoogdt.com>
References: <20260309155722.1538643-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v4] package/sema-linux-ec: add new adlink sema
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
v4: fix missing util-linux dependency

--> Actually, I found this missing dependency after removing `$(eval $(kernel-module))`
and the kernel dependency, only then I was able to run `./utils/test-pkg -p sema-linux-ec -a`.
So there is not really a way to check for the generic package compilation by using
`./utils/test-pkg` when there is a kernel-module defined. We should perhaps fix that.

$ ./utils/test-pkg -p sema-linux-ec -a
                             arm-aarch64 [ 1/32]: OK
                   bootlin-aarch64-glibc [ 2/32]: OK
               bootlin-aarch64-glibc-old [ 3/32]: OK
               bootlin-arcle-hs38-uclibc [ 4/32]: OK
                    bootlin-armv5-uclibc [ 5/32]: OK
                     bootlin-armv7-glibc [ 6/32]: OK
                   bootlin-armv7m-uclibc [ 7/32]: SKIPPED
                      bootlin-armv7-musl [ 8/32]: OK
                bootlin-m68k-5208-uclibc [ 9/32]: SKIPPED
               bootlin-m68k-68040-uclibc [10/32]: OK
             bootlin-microblazeel-uclibc [11/32]: OK
                  bootlin-mips64el-glibc [12/32]: OK
                bootlin-mipsel32r6-glibc [13/32]: OK
                   bootlin-mipsel-uclibc [14/32]: OK
                 bootlin-openrisc-uclibc [15/32]: OK
        bootlin-powerpc64le-power8-glibc [16/32]: OK
           bootlin-powerpc-e500mc-uclibc [17/32]: OK
                   bootlin-riscv32-glibc [18/32]: OK
                   bootlin-riscv64-glibc [19/32]: OK
                    bootlin-riscv64-musl [20/32]: OK
                 bootlin-s390x-z13-glibc [21/32]: OK
                      bootlin-sh4-uclibc [22/32]: OK
                   bootlin-sparc64-glibc [23/32]: OK
                    bootlin-sparc-uclibc [24/32]: OK
                    bootlin-x86-64-glibc [25/32]: OK
                     bootlin-x86-64-musl [26/32]: OK
                   bootlin-x86-64-uclibc [27/32]: OK
                   bootlin-x86-i686-musl [28/32]: OK
                   bootlin-xtensa-uclibc [29/32]: OK
                            br-arm-basic [30/32]: OK
                    br-arm-full-nothread [31/32]: OK
                      br-arm-full-static [32/32]: SKIPPED
32 builds, 3 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/Config.in                             |  1 +
 ...CC-variable-instead-of-hardcoded-gcc.patch | 54 +++++++++++++++++++
 package/sema-linux-ec/Config.in               | 14 +++++
 package/sema-linux-ec/sema-linux-ec.hash      |  5 ++
 package/sema-linux-ec/sema-linux-ec.mk        | 37 +++++++++++++
 5 files changed, 111 insertions(+)
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
index 00000000000..39663d542cf
--- /dev/null
+++ b/package/sema-linux-ec/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_SEMA_LINUX_EC
+	bool "sema-linux-ec"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_LINUX_KERNEL
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  SEMA (Smart Embedded Management Agent) is an agent used to
+	  manage system health and access the I/O pins through an API.
+
+	  https://github.com/ADLINK/sema-linux-ec
+
+comment "sema-linux-ec needs a toolchain w/ dynamic library, Linux kernel"
+	depends on BR2_STATIC_LIBS || !BR2_LINUX_KERNEL
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
index 00000000000..fc8a2c7a284
--- /dev/null
+++ b/package/sema-linux-ec/sema-linux-ec.mk
@@ -0,0 +1,37 @@
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
+SEMA_LINUX_EC_DEPENDENCIES = util-linux
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
