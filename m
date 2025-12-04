Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5186D24441
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 16:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BD1D4097A;
	Thu,  4 Dec 2025 16:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uZnltqPmr4-u; Thu,  4 Dec 2025 16:59:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 581FF40985
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764867558;
	bh=xm7xrYg1c3UeptwIkekUhDZHNy9cOq6enXheoqc2Ah0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ooz1xAP5+OyP0idiV91lzAtcpTHUZJ58WGj6qW4220FGoHimKyjNKTDi+PGEX6Kvc
	 mYHCe141X2j62GtAf1iQWLAbCb9DkRNI08U0mpZzqrodUS/Tn7V6UVOVPXFyzMeTCo
	 FC0pjhZ3EV7CYyOo/2rQ5AtGe/Owbga/HF9GRgJHnoAvJnXzSR4CG4RlRh41IkZNdn
	 mz063J4+06axkkAAgJN6wlpmtFNQaeFiYHBzvdmEd+vaY/7TmUfa43HVw5KlCDlff1
	 Uf41rSDq4rj5btAGa1upffxYBQ5yBdyfXeXnmHavVdiy68zmuL3+3/YLfrDqU0kw8M
	 qPGb69roOJZ7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 581FF40985;
	Thu,  4 Dec 2025 16:59:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B76E4D3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 16:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4F0984762
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 16:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DHLMXDdTdEXI for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 16:59:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.132;
 helo=smtpdh18-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3F6AE8420A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F6AE8420A
Received: from smtpdh18-1.aruba.it (smtpdh18-1.aruba.it [62.149.155.132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F6AE8420A
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 16:59:13 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id RCffvZz605SteRCffvOm0P; Thu, 04 Dec 2025 17:59:11 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu,  4 Dec 2025 17:59:10 +0100
Message-ID: <20251204165910.893915-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOBqtQo2ynTgJnNGULjPL6koElBqwnYaldqWbPTxtwF3OfIgddqpg5IpUcKf2qYPQVZpjGFIJUnGoVvENmgHJGXEimjC5A0Ce1WMtnXjhSqYwwtfyscA
 PtAt817h3x6G2QZEjXbu9p+8CdDDFjxnG0BvvtWcItgOpokOzoTEehoE80zVk+OQd/18BOskp92YmVPG0KJkSQSl3lYqK/WjSjWOMCxfUOpv0R25p7d0t7NY
 JIhadjlZbcwohek8pr9RhSD1u15Te0vRLe3bmGvGyK8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1764867551; bh=0SBrWz+wy07EKoyTGY3Sgf136j9/EVm3Aqr0Hg60R6k=;
 h=From:To:Subject:Date:MIME-Version;
 b=F4MED5NpsFRDEHbwmgFa8mCmHo+18JPpTVBwxGdPfqfioUB2ztcyzYbWhJsU+4ptV
 tLkvLXDNRFRDg0mwFpQGXox9WY7VhAQBoW5Ev+LqSVXXYlNWTRa1BfNRFcHZVVDUeJ
 0Y5RsM84YOT+3AriK77aTCZ78LvxyF8XiLtmOjci8K16zDIdpthvj+x8TkLGdDHTtU
 TXIg/vWwjyIXdCIJ666Bf0fKW8As3d+ERSfZl8xclvdnn6UzIz2/Qhc6UNehWEF7F/
 mY4mXDuPtMS/mHGWM+WUk75lS3Mi7ZuJKQN9R5hvwxJfJDauZShAT/tvwEj61XhCY8
 Faa1vPTKsM7hw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=F4MED5Np
Subject: [Buildroot] [PATCH] package/esp-hosted: bump to version 1.0.5.0.3
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

Drop local patch that has been upstreamed.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0001-Fix-ng-build-for-6.15.patch          | 167 ------------------
 package/esp-hosted/esp-hosted.hash            |   2 +-
 package/esp-hosted/esp-hosted.mk              |   4 +-
 3 files changed, 3 insertions(+), 170 deletions(-)
 delete mode 100644 package/esp-hosted/0001-Fix-ng-build-for-6.15.patch

diff --git a/package/esp-hosted/0001-Fix-ng-build-for-6.15.patch b/package/esp-hosted/0001-Fix-ng-build-for-6.15.patch
deleted file mode 100644
index 36baed50c7..0000000000
--- a/package/esp-hosted/0001-Fix-ng-build-for-6.15.patch
+++ /dev/null
@@ -1,167 +0,0 @@
-From cab85fc98dfcddad6ebf0faa2f5f4f4d6c6562a0 Mon Sep 17 00:00:00 2001
-From: Yogesh Mantri <yogesh.mantri@espressif.com>
-Date: Sun, 8 Jun 2025 12:11:09 +0800
-Subject: [PATCH] Fix(ng): build for 6.15 Fixes #607
-
-Upstream: https://github.com/espressif/esp-hosted/commit/cab85fc98dfcddad6ebf0faa2f5f4f4d6c6562a0
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- esp_hosted_ng/host/Makefile                  | 63 +++++++++-----------
- esp_hosted_ng/host/esp_debugfs.c             |  2 +-
- esp_hosted_ng/host/esp_stats.c               |  1 +
- esp_hosted_ng/host/include/esp_kernel_port.h |  5 ++
- esp_hosted_ng/host/sdio/esp_sdio.c           |  2 +-
- 5 files changed, 36 insertions(+), 37 deletions(-)
-
-diff --git a/esp_hosted_ng/host/Makefile b/esp_hosted_ng/host/Makefile
-index 029f930f55..6fa68c876f 100644
---- a/esp_hosted_ng/host/Makefile
-+++ b/esp_hosted_ng/host/Makefile
-@@ -1,67 +1,60 @@
--# Toolchain Path
-+# Toolchain and kernel
- CROSS_COMPILE :=
--# Linux Kernel header
- KERNEL := /lib/modules/$(shell uname -r)/build
--# Architecture
- ARCH := $(shell uname -m)
- 
--# Check and adjust ARCH for specific cases
-+# Normalize ARCH
- ifeq ($(ARCH), x86_64)
-     ARCH := x86
- endif
--
- ifeq ($(ARCH), aarch64)
-     ARCH := arm64
- endif
- 
--#Default interface is sdio
--MODULE_NAME=esp32_sdio
--
--#enable logging by default
--CONFIG_DEBUG_LOGS := y
-+# Module name (default: sdio)
-+target ?= sdio
-+MODULE_NAME := esp32_$(target)
- 
-+# Debug and AP support
-+CONFIG_DEBUG_LOGS ?= y
- ifeq ($(CONFIG_AP_SUPPORT), y)
--	EXTRA_CFLAGS += -DCONFIG_AP_MODE
-+    EXTRA_CFLAGS += -DCONFIG_AP_MODE
- endif
- 
--#Targets passed overrrides default value
-+# Source and include paths
-+PWD := $(shell pwd)
-+ccflags-y += -I$(src) -I$(src)/include -I$(CURDIR) -I$(CURDIR)/include
-+EXTRA_CFLAGS += -I$(M) -I$(M)/include
-+
-+# Interface-specific sources
- ifeq ($(target), sdio)
--	MODULE_NAME=esp32_sdio
-+    ccflags-y += -I$(src)/sdio -I$(CURDIR)/sdio
-+    EXTRA_CFLAGS += -I$(M)/sdio
-+    module_objects += sdio/esp_sdio.o sdio/esp_sdio_api.o
- endif
- 
- ifeq ($(target), spi)
--	MODULE_NAME=esp32_spi
--endif
--
--#debug_flags := -DDEBUG
--
--EXTRA_CFLAGS += -I$(PWD)/include -I$(PWD)
--
--ifeq ($(MODULE_NAME), esp32_sdio)
--	EXTRA_CFLAGS += -I$(PWD)/sdio
--	module_objects += sdio/esp_sdio.o sdio/esp_sdio_api.o
--endif
--
--ifeq ($(MODULE_NAME), esp32_spi)
--	EXTRA_CFLAGS += -I$(PWD)/spi
--	module_objects += spi/esp_spi.o
-+    ccflags-y += -I$(src)/spi -I$(CURDIR)/spi
-+    EXTRA_CFLAGS += -I$(M)/spi
-+    module_objects += spi/esp_spi.o
- endif
- 
-+# Common source files
- module_objects += esp_bt.o main.o esp_cmd.o esp_utils.o esp_cfg80211.o esp_stats.o esp_debugfs.o esp_log.o
--#$(foreach obj,$(module_objects),$(eval CFLAGS_$(obj:.o=).o := $(debug_flags)))
- CFLAGS_esp_log.o = -DDEBUG
- 
--PWD := $(shell pwd)
--
-+# Module build rules
- obj-m := $(MODULE_NAME).o
- $(MODULE_NAME)-y := $(module_objects)
- 
-+# Build targets
- all: clean
--	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNEL) M=$(PWD) modules
-+	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNEL) M=$(PWD) modules
- 
- clean:
--	rm -rf *.o sdio/*.o spi/*.o *.ko
--	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNEL) M=$(PWD) clean
-+	rm -rf *.o */*.o *.ko *.mod.c *.symvers *.order .*.cmd .tmp_versions
-+	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNEL) M=$(PWD) clean
- 
- check:
--	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNEL) M=$(PWD) $(module_objects)
-+	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNEL) M=$(PWD) $(module_objects)
-+
-diff --git a/esp_hosted_ng/host/esp_debugfs.c b/esp_hosted_ng/host/esp_debugfs.c
-index 74b1813fb4..4399cab825 100644
---- a/esp_hosted_ng/host/esp_debugfs.c
-+++ b/esp_hosted_ng/host/esp_debugfs.c
-@@ -1,4 +1,4 @@
--#include "include/utils.h"
-+#include "utils.h"
- #include <linux/debugfs.h>
- #include <linux/module.h>
- #include <linux/fs.h>
-diff --git a/esp_hosted_ng/host/esp_stats.c b/esp_hosted_ng/host/esp_stats.c
-index 82eff7b0a6..61c37733cb 100644
---- a/esp_hosted_ng/host/esp_stats.c
-+++ b/esp_hosted_ng/host/esp_stats.c
-@@ -8,6 +8,7 @@
- 
- #include "utils.h"
- #include "esp_stats.h"
-+#include "esp_kernel_port.h"
- 
- #if TEST_RAW_TP
- 
-diff --git a/esp_hosted_ng/host/include/esp_kernel_port.h b/esp_hosted_ng/host/include/esp_kernel_port.h
-index b633ee346f..35a18da504 100644
---- a/esp_hosted_ng/host/include/esp_kernel_port.h
-+++ b/esp_hosted_ng/host/include/esp_kernel_port.h
-@@ -222,4 +222,9 @@ static inline bool wireless_dev_current_bss_exists(struct wireless_dev *wdev)
- #define spi_master_put(_ctlr)		spi_controller_put(_ctlr)
- #endif
- 
-+
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 15, 0)
-+  #define del_timer timer_delete_sync
-+#endif
-+
- #endif
-diff --git a/esp_hosted_ng/host/sdio/esp_sdio.c b/esp_hosted_ng/host/sdio/esp_sdio.c
-index 52759dee34..6d90fe92f6 100644
---- a/esp_hosted_ng/host/sdio/esp_sdio.c
-+++ b/esp_hosted_ng/host/sdio/esp_sdio.c
-@@ -20,7 +20,7 @@
- #include <linux/kthread.h>
- #include "esp_stats.h"
- #include "esp_utils.h"
--#include "include/esp_kernel_port.h"
-+#include "esp_kernel_port.h"
- 
- extern u32 raw_tp_mode;
- #define MAX_WRITE_RETRIES       2
--- 
-2.39.5
-
diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
index 8af32e9239..65083fff70 100644
--- a/package/esp-hosted/esp-hosted.hash
+++ b/package/esp-hosted/esp-hosted.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1025b8c8d982bab03ebec9859f828a1c81218077245b602621eb4f07c169bac8  ng-v1.0.4.0.0.tar.gz
+sha256  15e634c6181b32c39c1274917efcefc78a8123cc52e72475f71b512625a30ef1  ng-v1.0.5.0.3.tar.gz
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  esp_hosted_ng/host/LICENSE
diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index 965d3a5cc6..01a05135b1 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ESP_HOSTED_VERSION = 1.0.4.0.0
-ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,release/ng-v$(ESP_HOSTED_VERSION))
+ESP_HOSTED_VERSION = 1.0.5.0.3
+ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,release/ng-$(ESP_HOSTED_VERSION))
 ESP_HOSTED_SOURCE = ng-v$(ESP_HOSTED_VERSION).tar.gz
 ESP_HOSTED_DEPENDENCIES = linux
 ESP_HOSTED_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
