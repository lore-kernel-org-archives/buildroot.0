Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D27CD37AD
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4570F60631;
	Tue,  3 Sep 2024 19:48:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tl5gh42gS1Hp; Tue,  3 Sep 2024 19:48:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4050460634
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4050460634;
	Tue,  3 Sep 2024 19:48:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B43F1BF344
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4613260645
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K10JgohaE6QR for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:48:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9858060631
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9858060631
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:48:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FAAE86BB7; Tue,  3 Sep 2024 19:48:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 21:40:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09324c843bfb1944af8e0b553b0a8d9983fbebe5
X-Git-Newrev: c6a47974b0950a7c0b9a8b3cefb229ed0f4da658
X-Patchwork-Hint: ignore
Message-Id: <20240903194834.7FAAE86BB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpa_supplicant: macsec offload
 needs headers >= v5.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6a47974b0950a7c0b9a8b3cefb229ed0f4da658
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Hardware offload in Linux macsec driver is enabled in compile time if
libnl version is >= v3.6. However this is not enough for successful
build since enum 'macsec_offload' has been added to Linux headers only
since Linux >= v5.7.

Add upstream commit that extends compile time condition for the
enablement of the macsec hardware offload adding Linux headers version
check.

Fixes:
- http://autobuild.buildroot.net/results/b59d5bc5bd17683a3a1e3577c40c802e81911f84/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...x-Hardware-offload-requires-Linux-headers.patch | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/package/wpa_supplicant/0002-macsec_linux-Hardware-offload-requires-Linux-headers.patch b/package/wpa_supplicant/0002-macsec_linux-Hardware-offload-requires-Linux-headers.patch
new file mode 100644
index 0000000000..7330319d06
--- /dev/null
+++ b/package/wpa_supplicant/0002-macsec_linux-Hardware-offload-requires-Linux-headers.patch
@@ -0,0 +1,53 @@
+From 809d9d8172db8e2a08ff639875f838b5b86d2641 Mon Sep 17 00:00:00 2001
+From: Sergey Matyukevich <geomatsi@gmail.com>
+Date: Thu, 22 Aug 2024 00:03:41 +0300
+Subject: [PATCH] macsec_linux: Hardware offload requires Linux headers >= v5.7
+
+Hardware offload in Linux macsec driver is enabled in compile time if
+libnl version is >= v3.6. This is not sufficient for successful build
+since enum 'macsec_offload' has been added to Linux header if_link.h
+in kernels v5.6 and v5.7, see commits:
+- https://github.com/torvalds/linux/commit/21114b7feec29e4425a3ac48a037569c016a46c8
+- https://github.com/torvalds/linux/commit/76564261a7db80c5f5c624e0122a28787f266bdf
+
+New libnl with older Linux headers is a valid combination. This is how
+hostapd build failure has been detected by Buildroot autobuilder, see:
+- http://autobuild.buildroot.net/results/b59d5bc5bd17683a3a1e3577c40c802e81911f84/
+
+Extend compile time condition for the enablement of the macsec hardware
+offload adding Linux headers version check.
+
+Fixes: 40c139664439 ("macsec_linux: Add support for MACsec hardware offload")
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+
+Upstream: https://w1.fi/cgit/hostap/commit/?id=809d9d8172db8e2a08ff639875f838b5b86d2641
+
+---
+ src/drivers/driver_macsec_linux.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/drivers/driver_macsec_linux.c b/src/drivers/driver_macsec_linux.c
+index c86715498..fad47a292 100644
+--- a/src/drivers/driver_macsec_linux.c
++++ b/src/drivers/driver_macsec_linux.c
+@@ -19,6 +19,7 @@
+ #include <netlink/route/link.h>
+ #include <netlink/route/link/macsec.h>
+ #include <linux/if_macsec.h>
++#include <linux/version.h>
+ #include <inttypes.h>
+ 
+ #include "utils/common.h"
+@@ -32,7 +33,8 @@
+ 
+ #define UNUSED_SCI 0xffffffffffffffff
+ 
+-#if LIBNL_VER_NUM >= LIBNL_VER(3, 6)
++#if (LIBNL_VER_NUM >= LIBNL_VER(3, 6) && \
++     LINUX_VERSION_CODE >= KERNEL_VERSION(5, 7, 0))
+ #define LIBNL_HAS_OFFLOAD
+ #endif
+ 
+-- 
+2.46.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
