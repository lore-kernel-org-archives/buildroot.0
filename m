Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E75C5320E
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 04:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6EEB403CC;
	Tue, 27 Aug 2024 04:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gdtI-lU0lEga; Tue, 27 Aug 2024 04:31:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2699403C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2699403C4;
	Tue, 27 Aug 2024 04:31:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A2741BF2BE
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 04:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66EA4403C4
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 04:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6A3DXc8wTAMF for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 04:31:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EC21C403C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC21C403C3
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC21C403C3
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 04:31:11 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 5D0483520FE3; Tue, 27 Aug 2024 06:31:09 +0200 (CEST)
Date: Tue, 27 Aug 2024 06:31:09 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zs1WjXQh8Hog59fF@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724733069; bh=y8/zWwAnFcH4S9/ItnbAeYGSS9/VjcUKiSVN9mEyiGM=;
 h=Date:From:To:Subject:From;
 b=YSAGvcRVEoEh9jcPJ+sdBmz7tbLH0SsF5+0u5PdyBv+rXIts1F1u4jOXYM2UKrO01
 AH6Rzv/myymVmHBqTMqyHuhEkr8XKfxpH46WGL3KDGRx7E4U06BReEQ9EvplUfYPw3
 Y97JgA+X0fjVZ1S/+4+9W5vzdqwuJU/cl44XTuwjTI9Qb2zg3+UoBd+Ui/l/P1dSlP
 b4uKl+/fAE8uD27pfQOzoR4zZTLRWOom8hHdoz9aGk7UOcWVmKNxsZfQrkS4YkAFuY
 7YnsC5iDfhqWDQX1oHYn97fzYnteZ5uETrl3nysgsaY/FKzE2A5bj/CI3M/ibpyCkD
 TDgJw9fqKWxHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=YSAGvcRV
Subject: [Buildroot] [PATCH v2] package/freeipmi: fix gcc 14.x issues
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Directly from upstream stable git repository, fixes for gcc 14.x
issues. Only the changelog entries, which do not apply, where removed.

Fixes:

 http://autobuild.buildroot.org/results/b33/b33e72b3348427f2f772e5c29dd3753958597058

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2:
 - added Upstream tags to patch 0002/0003
---
 ...ipmi-sel-string-supermicro-common.h-.patch | 36 ++++++++++++
 ...sensors-fix-header-guard-definitions.patch | 57 +++++++++++++++++++
 ...003-ipmi-sensors-add-missing-include.patch | 28 +++++++++
 3 files changed, 121 insertions(+)
 create mode 100644 package/freeipmi/0001-libfreeipmi-sel-ipmi-sel-string-supermicro-common.h-.patch
 create mode 100644 package/freeipmi/0002-ipmi-sensors-fix-header-guard-definitions.patch
 create mode 100644 package/freeipmi/0003-ipmi-sensors-add-missing-include.patch

diff --git a/package/freeipmi/0001-libfreeipmi-sel-ipmi-sel-string-supermicro-common.h-.patch b/package/freeipmi/0001-libfreeipmi-sel-ipmi-sel-string-supermicro-common.h-.patch
new file mode 100644
index 0000000000..848539e7c3
--- /dev/null
+++ b/package/freeipmi/0001-libfreeipmi-sel-ipmi-sel-string-supermicro-common.h-.patch
@@ -0,0 +1,36 @@
+From 9239a686e4bfd862145f4654017112a0f8cbbb0d Mon Sep 17 00:00:00 2001
+From: Albert Chu <chu11@llnl.gov>
+Date: Fri, 22 Mar 2024 21:07:28 -0700
+Subject: [PATCH] libfreeipmi/sel/ipmi-sel-string-supermicro-common.h: Add
+ missing function prototype.
+
+Signed-off-by: Albert Chu <chu11@llnl.gov>
+[Waldemar: removed Changelog patching]
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: http://git.savannah.gnu.org/cgit/freeipmi.git/commit/?h=freeipmi-1-6-0-stable&id=9239a686e4bfd862145f4654017112a0f8cbbb0d
+---
+ libfreeipmi/sel/ipmi-sel-string-supermicro-common.h | 10 ++++++++++
+ 1 files changed, 15 insertions(+)
+
+diff --git a/libfreeipmi/sel/ipmi-sel-string-supermicro-common.h b/libfreeipmi/sel/ipmi-sel-string-supermicro-common.h
+index 5785f2b64..be5e41d7d 100644
+--- a/libfreeipmi/sel/ipmi-sel-string-supermicro-common.h
++++ b/libfreeipmi/sel/ipmi-sel-string-supermicro-common.h
+@@ -39,4 +39,14 @@ int sel_string_output_supermicro_overheat_event_data1_class_oem (ipmi_sel_ctx_t
+                                                                  unsigned int *wlen,
+                                                                  struct ipmi_sel_system_event_record_data *system_event_record_data);
+ 
++int sel_string_output_supermicro_dimm_event_data2_event_data3 (ipmi_sel_ctx_t ctx,
++                                                               struct ipmi_sel_entry *sel_entry,
++                                                               uint8_t sel_record_type,
++                                                               char *buf,
++                                                               unsigned int buflen,
++                                                               unsigned int flags,
++                                                               unsigned int *wlen,
++                                                               struct ipmi_sel_system_event_record_data *system_event_record_data,
++                                                               int *oem_rv);
++
+ #endif /* IPMI_SEL_STRING_SUPERMICRO_COMMON_H */
+-- 
+2.30.2
+
diff --git a/package/freeipmi/0002-ipmi-sensors-fix-header-guard-definitions.patch b/package/freeipmi/0002-ipmi-sensors-fix-header-guard-definitions.patch
new file mode 100644
index 0000000000..b04b305835
--- /dev/null
+++ b/package/freeipmi/0002-ipmi-sensors-fix-header-guard-definitions.patch
@@ -0,0 +1,57 @@
+From c3d1a3f5c550940577076ce2c4595b470ae963c3 Mon Sep 17 00:00:00 2001
+From: Albert Chu <chu11@llnl.gov>
+Date: Sun, 24 Mar 2024 13:11:55 -0700
+Subject: [PATCH] ipmi-sensors: fix header guard definitions
+
+Signed-off-by: Albert Chu <chu11@llnl.gov>
+[Waldemar: removed Changelog patching]
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://git.savannah.gnu.org/cgit/freeipmi.git/commit/?h=freeipmi-1-6-0-stable&id=c3d1a3f5c550940577076ce2c4595b470ae963c3
+---
+ ipmi-sensors/ipmi-sensors-oem-intel-s2600jf.h | 2 +-
+ ipmi-sensors/ipmi-sensors-oem-intel-s2600wp.h | 2 +-
+ ipmi-sensors/ipmi-sensors-oem-intel-s5500wb.h | 2 +-
+ 3 files changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/ipmi-sensors/ipmi-sensors-oem-intel-s2600jf.h b/ipmi-sensors/ipmi-sensors-oem-intel-s2600jf.h
+index 0b11e61ce..4ae808cda 100644
+--- a/ipmi-sensors/ipmi-sensors-oem-intel-s2600jf.h
++++ b/ipmi-sensors/ipmi-sensors-oem-intel-s2600jf.h
+@@ -17,7 +17,7 @@
+  */
+ 
+ #ifndef IPMI_SENSORS_OEM_INTEL_S2600JF_H
+-#define IPMI_SENSORS_OEM_INTEL_H
++#define IPMI_SENSORS_OEM_INTEL_S2600JF_H
+ 
+ #include "ipmi-sensors.h"
+ 
+diff --git a/ipmi-sensors/ipmi-sensors-oem-intel-s2600wp.h b/ipmi-sensors/ipmi-sensors-oem-intel-s2600wp.h
+index 0607b125d..5c6410b7b 100644
+--- a/ipmi-sensors/ipmi-sensors-oem-intel-s2600wp.h
++++ b/ipmi-sensors/ipmi-sensors-oem-intel-s2600wp.h
+@@ -17,7 +17,7 @@
+  */
+ 
+ #ifndef IPMI_SENSORS_OEM_INTEL_S2600WP_H
+-#define IPMI_SENSORS_OEM_INTEL_H
++#define IPMI_SENSORS_OEM_INTEL_S2600WP_H
+ 
+ #include "ipmi-sensors.h"
+ 
+diff --git a/ipmi-sensors/ipmi-sensors-oem-intel-s5500wb.h b/ipmi-sensors/ipmi-sensors-oem-intel-s5500wb.h
+index f4f3dc85b..204295bd8 100644
+--- a/ipmi-sensors/ipmi-sensors-oem-intel-s5500wb.h
++++ b/ipmi-sensors/ipmi-sensors-oem-intel-s5500wb.h
+@@ -17,7 +17,7 @@
+  */
+ 
+ #ifndef IPMI_SENSORS_OEM_INTEL_S5500WB_H
+-#define IPMI_SENSORS_OEM_INTEL_H
++#define IPMI_SENSORS_OEM_INTEL_S5500WB_H
+ 
+ #include "ipmi-sensors.h"
+ 
+-- 
+2.39.2
+
diff --git a/package/freeipmi/0003-ipmi-sensors-add-missing-include.patch b/package/freeipmi/0003-ipmi-sensors-add-missing-include.patch
new file mode 100644
index 0000000000..8bc44165a0
--- /dev/null
+++ b/package/freeipmi/0003-ipmi-sensors-add-missing-include.patch
@@ -0,0 +1,28 @@
+From 6ac6f816dbfc83d8cd4f4f163b0f8ff1062d883e Mon Sep 17 00:00:00 2001
+From: Albert Chu <chu11@llnl.gov>
+Date: Mon, 25 Mar 2024 13:57:45 -0700
+Subject: [PATCH] ipmi-sensors: add missing include
+
+Signed-off-by: Albert Chu <chu11@llnl.gov>
+[Waldemar: removed Changelog patching]
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://git.savannah.gnu.org/cgit/freeipmi.git/commit/?h=freeipmi-1-6-0-stable&id=6ac6f816dbfc83d8cd4f4f163b0f8ff1062d883e
+---
+ ipmi-sensors/ipmi-sensors-oem-intel.c | 1 +
+ 1 files changed, 1 insertions(+)
+
+diff --git a/ipmi-sensors/ipmi-sensors-oem-intel.c b/ipmi-sensors/ipmi-sensors-oem-intel.c
+index 5e0f3733a..3fc022e3d 100644
+--- a/ipmi-sensors/ipmi-sensors-oem-intel.c
++++ b/ipmi-sensors/ipmi-sensors-oem-intel.c
+@@ -34,6 +34,7 @@
+ #include "ipmi-sensors-oem-intel.h"
+ #include "ipmi-sensors-oem-intel-s5500wb.h"
+ #include "ipmi-sensors-oem-intel-s2600jf.h"
++#include "ipmi-sensors-oem-intel-s2600wp.h"
+ #include "ipmi-sensors-oem-intel-quanta-qssc-s4r.h"
+ #include "ipmi-sensors-oem-intel-node-manager.h"
+ 
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
