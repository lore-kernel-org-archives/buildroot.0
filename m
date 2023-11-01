Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF826C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 16:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A6CD431BF;
	Wed,  1 Nov 2023 16:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A6CD431BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wyu_Ekzm-0KX; Wed,  1 Nov 2023 16:50:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C29E431AF;
	Wed,  1 Nov 2023 16:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C29E431AF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FB8A1BF966
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECF4170424
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECF4170424
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FdKDPI7YFbCu for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 16:50:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8637870438
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 16:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8637870438
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70CC786389; Wed,  1 Nov 2023 16:50:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 17:44:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0be03f1bd86595a46a79eafaf33135e0b4b23fbd
X-Git-Newrev: 709c8cc37e37bbd89c9e6a6296c1adefe03bbe93
X-Patchwork-Hint: ignore
Message-Id: <20231101165002.70CC786389@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snort3: fix build with gcc >= 13
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

commit: https://git.buildroot.net/buildroot/commit/?id=709c8cc37e37bbd89c9e6a6296c1adefe03bbe93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc >= 13:

In file included from /home/thomas/autobuild/instance-1/output-1/build/snort3-3.1.40.0/src/packet_io/sfdaq_config.cc:25:
/home/thomas/autobuild/instance-1/output-1/build/snort3-3.1.40.0/src/packet_io/sfdaq_config.h:59:25: error: 'uint32_t' has not been declared
   59 |     void set_batch_size(uint32_t);
      |                         ^~~~~~~~
/home/thomas/autobuild/instance-1/output-1/build/snort3-3.1.40.0/src/packet_io/sfdaq_config.h:62:5: error: 'uint32_t' does not name a type
   62 |     uint32_t get_batch_size() const { return (batch_size == BATCH_SIZE_UNSET) ? BATCH_SIZE_DEFAULT : batch_size; }
      |     ^~~~~~~~
/home/thomas/autobuild/instance-1/output-1/build/snort3-3.1.40.0/src/packet_io/sfdaq_config.h:26:1: note: 'uint32_t' is defined in header '<cstdint>'; did you forget to '#include <cstdint>'?
   25 | #include <vector>
  +++ |+#include <cstdint>
   26 |

Fixes:
 - http://autobuild.buildroot.org/results/c91a74bad542f32693f2e31412fba70446fd3959

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ild-fix-cstdint-related-clearlinux-errors.patch | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/package/snort3/0001-Pull-request-3925-build-fix-cstdint-related-clearlinux-errors.patch b/package/snort3/0001-Pull-request-3925-build-fix-cstdint-related-clearlinux-errors.patch
new file mode 100644
index 0000000000..4f24ee72d4
--- /dev/null
+++ b/package/snort3/0001-Pull-request-3925-build-fix-cstdint-related-clearlinux-errors.patch
@@ -0,0 +1,60 @@
+From 154cf0312b3652bdfdf241e6883d7c6de9b85e01 Mon Sep 17 00:00:00 2001
+From: "Maya Dagon (mdagon)" <mdagon@cisco.com>
+Date: Mon, 24 Jul 2023 08:06:50 +0000
+Subject: [PATCH] Pull request #3925: build: fix cstdint related clearlinux
+ errors
+
+Merge in SNORT/snort3 from ~MDAGON/snort3:clearlinux to master
+
+Squashed commit of the following:
+
+commit 7ef2bc13851ffa2bf7908964242859a8c05ddd96
+Author: maya dagon <mdagon@cisco.com>
+Date:   Thu Jul 20 14:34:01 2023 -0400
+
+    build: fix cstdint related clearlinux errors
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/snort3/snort3/commit/154cf0312b3652bdfdf241e6883d7c6de9b85e01
+---
+ src/js_norm/js_identifier_ctx.h       | 1 +
+ src/packet_io/sfdaq_config.h          | 1 +
+ src/service_inspectors/wizard/magic.h | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/src/utils/js_identifier_ctx.h b/src/utils/js_identifier_ctx.h
+index b8d5121a2c..6ef1ce2b23 100644
+--- a/src/utils/js_identifier_ctx.h
++++ b/src/utils/js_identifier_ctx.h
+@@ -20,6 +20,7 @@
+ #ifndef JS_IDENTIFIER_CTX
+ #define JS_IDENTIFIER_CTX
+ 
++#include <cstdint>
+ #include <list>
+ #include <string>
+ #include <unordered_map>
+diff --git a/src/packet_io/sfdaq_config.h b/src/packet_io/sfdaq_config.h
+index 990c45785b..f4c1042bc3 100644
+--- a/src/packet_io/sfdaq_config.h
++++ b/src/packet_io/sfdaq_config.h
+@@ -21,6 +21,7 @@
+ #ifndef SFDAQ_CONFIG_H
+ #define SFDAQ_CONFIG_H
+ 
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ 
+diff --git a/src/service_inspectors/wizard/magic.h b/src/service_inspectors/wizard/magic.h
+index fa24d0b5a4..b9477eb95c 100644
+--- a/src/service_inspectors/wizard/magic.h
++++ b/src/service_inspectors/wizard/magic.h
+@@ -21,6 +21,7 @@
+ #define MAGIC_H
+ 
+ #include <cassert>
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
