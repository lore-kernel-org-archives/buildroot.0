Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F490CFD37B
	for <buildroot@archiver.kernel.org>; Tue, 25 Nov 2025 10:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E771460728;
	Tue, 25 Nov 2025 10:09:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39YfGyC_Dw5J; Tue, 25 Nov 2025 10:09:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE2AA6074D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE2AA6074D;
	Tue, 25 Nov 2025 10:09:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 870E9359
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 10:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70D10403CC
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 10:09:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q2Ep0nGhppPY for <buildroot@buildroot.org>;
 Tue, 25 Nov 2025 10:09:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.102;
 helo=smtpcmd02102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB68C4020C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB68C4020C
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB68C4020C
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 10:09:40 +0000 (UTC)
Received: from localhost.localdomain ([212.103.203.10])
 by Aruba SMTP with ESMTPSA
 id NpzMvPofClZ8PNpzMvNner; Tue, 25 Nov 2025 11:09:37 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 25 Nov 2025 11:09:35 +0100
Message-ID: <20251125100935.686873-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfL5xxZu610kD3C6Ia8gP7msr+CGL2761xTjeespFJHu88m4vZg/KYRXM4Ql+u2I+D+qcTGfrnuu4IihDUzCAG0GS6ipUg6C/wbhBESaGKFOydy+/eL+E
 s9Pstu0gw716Nfr8pFAQpBA/NB41x6WBV6g6J6RqPPRqCnr8wyS+Vs6nv9pb1HOhJOFiMgB50GPHAlZ5omY2kl8BBI0rNmsJYCtEKDTkvaiUEzWHgkvpXuZS
 BMCEupPukmxnIVOhSNp6xkaZ7cyaWzJwDlUKG9G/nEZSpYvj5RS2icRw7HaRAhbv
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1764065377; bh=woLyk+Ed+B425ZbPhShHruRvqVVXpuT64HTqOT5FlPQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=NiA1vwhoQXaqf+h8fmbtvGqbHQZ/vHpJTRCBObObiShiRPIactfQTzFcKo/Nobipn
 llNLaIsOrRdedNg5dfmrQkbFa/Ig/vfcaK1du4y8ESlchQ5AV3HGaj3vtYZ1vnWvT7
 LvoCcu6/YMINqQ9dIkaOwr02NeUNfDgJatKE7Qqmc8Ef0uP5sHn7pjHdhjR/sSGToB
 fQbzuH+YCoLb1UjQb3AcO4gFyVbBIKm1QJ2dMqrnnlmbwepN4oYFRqrYRmMrCZVgPS
 hWzau0yGJ5kKoKaUeAplYHtmTvFykrWkk3xuVUjScrmvxUo8ZjazNXkz8DJ114h8ba
 BepPCBe1mx+fw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=NiA1vwho
Subject: [Buildroot] [PATCH] package/esp-hosted: fix build with Linux 6.17
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

* Since Upstream doesn't release new versions even if pinged[1] let's go
  back using git commit SHA1
* Drop local patch committed upstream to fix building Linux 6.15.
* Add local patch pending upstream to fix building Linux 6.17.

[1]: https://github.com/espressif/esp-hosted/issues/550

Fixes:
https://autobuild.buildroot.org/results/a8f830cb84754ab9cf68ab4745ea3d5050611e1e/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0001-Fix-build-for-kernel-6.17.patch      |  57 ++++++
 .../0001-Fix-ng-build-for-6.15.patch          | 167 ------------------
 package/esp-hosted/esp-hosted.hash            |   2 +-
 package/esp-hosted/esp-hosted.mk              |   3 +-
 4 files changed, 59 insertions(+), 170 deletions(-)
 create mode 100644 package/esp-hosted/0001-Fix-build-for-kernel-6.17.patch
 delete mode 100644 package/esp-hosted/0001-Fix-ng-build-for-6.15.patch

diff --git a/package/esp-hosted/0001-Fix-build-for-kernel-6.17.patch b/package/esp-hosted/0001-Fix-build-for-kernel-6.17.patch
new file mode 100644
index 0000000000..1d86d9ecf4
--- /dev/null
+++ b/package/esp-hosted/0001-Fix-build-for-kernel-6.17.patch
@@ -0,0 +1,57 @@
+From c5b4134f3548b54048ab90f21e7fb6eaf02ee268 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Tue, 25 Nov 2025 10:26:32 +0100
+Subject: [PATCH] Fix build for kernel 6.17
+
+With commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b74947b4f6ff7c122a1bb6eb38bb7ecfbb1d3820
+set_wiphy_params() and set/get_tx_power() gain argument radio_idx to get
+radio index. So let's add that argument according to Linux version >=
+6.17.
+
+Upstream: https://github.com/espressif/esp-hosted/pull/686
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ esp_hosted_ng/host/esp_cfg80211.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/esp_hosted_ng/host/esp_cfg80211.c b/esp_hosted_ng/host/esp_cfg80211.c
+index 7abb22c453..43ddadcbf2 100644
+--- a/esp_hosted_ng/host/esp_cfg80211.c
++++ b/esp_hosted_ng/host/esp_cfg80211.c
+@@ -738,6 +738,9 @@ static void esp_cfg80211_set_wakeup(struct wiphy *wiphy,
+ 
+ static int esp_cfg80211_set_tx_power(struct wiphy *wiphy,
+ 				     struct wireless_dev *wdev,
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++				     int radio_idx,
++#endif
+ 				     enum nl80211_tx_power_setting type, int mbm)
+ {
+ 	struct esp_adapter *adapter = esp_get_adapter();
+@@ -815,6 +818,9 @@ static int esp_cfg80211_get_station(struct wiphy *wiphy, struct net_device *ndev
+ 
+ static int esp_cfg80211_get_tx_power(struct wiphy *wiphy,
+ 				     struct wireless_dev *wdev,
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++				     int radio_idx,
++#endif
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 14, 0))
+ 				     unsigned int link_id,
+ #endif
+@@ -842,7 +848,11 @@ static int esp_cfg80211_get_tx_power(struct wiphy *wiphy,
+ 	return 0;
+ }
+ 
+-static int esp_cfg80211_set_wiphy_params(struct wiphy *wiphy, u32 changed)
++static int esp_cfg80211_set_wiphy_params(struct wiphy *wiphy,
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++					 int radio_idx,
++#endif
++					 u32 changed)
+ {
+ 	esp_dbg("\n");
+ 	return 0;
+-- 
+2.47.3
+
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
index 8af32e9239..0a376e5e26 100644
--- a/package/esp-hosted/esp-hosted.hash
+++ b/package/esp-hosted/esp-hosted.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1025b8c8d982bab03ebec9859f828a1c81218077245b602621eb4f07c169bac8  ng-v1.0.4.0.0.tar.gz
+sha256  6e6ff868dc6f193333f894af6e3faefe18050d1964312cea7757b619c289653d  esp-hosted-cd587b09e3be1c374c310f7bd16e1b3bba23cc69.tar.gz
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  esp_hosted_ng/host/LICENSE
diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index 965d3a5cc6..98657bc00f 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-ESP_HOSTED_VERSION = 1.0.4.0.0
+ESP_HOSTED_VERSION = cd587b09e3be1c374c310f7bd16e1b3bba23cc69
 ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,release/ng-v$(ESP_HOSTED_VERSION))
-ESP_HOSTED_SOURCE = ng-v$(ESP_HOSTED_VERSION).tar.gz
 ESP_HOSTED_DEPENDENCIES = linux
 ESP_HOSTED_LICENSE = GPL-2.0
 ESP_HOSTED_LICENSE_FILES = esp_hosted_ng/host/LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
