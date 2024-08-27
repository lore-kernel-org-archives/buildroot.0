Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FDDC54731
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 16:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 898436088E;
	Tue, 27 Aug 2024 16:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9j1XYoclNibj; Tue, 27 Aug 2024 16:24:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E7C1608AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E7C1608AA;
	Tue, 27 Aug 2024 16:24:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 501FB1BF4E5
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A476405FB
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:24:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ugg4onibSUhH for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 16:24:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3E1D40659
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3E1D40659
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 16:24:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBBCD864FC; Tue, 27 Aug 2024 16:24:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Aug 2024 18:19:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 345c94ad4e709116c7a22d143aae9ef815e8dfeb
X-Git-Newrev: 23b6c3f58c1bb577168e2a003bea6d310ed757ef
X-Patchwork-Hint: ignore
Message-Id: <20240827162410.CBBCD864FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeipmi: fix gcc 14.x issues
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=23b6c3f58c1bb577168e2a003bea6d310ed757ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Directly from upstream stable git repository, fixes for gcc 14.x
issues. Only the changelog entries, which do not apply, where removed.

Fixes:

 http://autobuild.buildroot.org/results/b33/b33e72b3348427f2f772e5c29dd3753958597058

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-sel-ipmi-sel-string-supermicro-common.h-.patch | 36 ++++++++++++++
 ...ipmi-sensors-fix-header-guard-definitions.patch | 57 ++++++++++++++++++++++
 .../0003-ipmi-sensors-add-missing-include.patch    | 28 +++++++++++
 3 files changed, 121 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
