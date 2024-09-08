Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFD1CD4F4C
	for <buildroot@archiver.kernel.org>; Sun,  8 Sep 2024 21:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33D2D40329;
	Sun,  8 Sep 2024 21:35:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lGQmEZVQRNNl; Sun,  8 Sep 2024 21:35:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 931694016D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 931694016D;
	Sun,  8 Sep 2024 21:35:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC20A1BF35C
 for <buildroot@lists.busybox.net>; Sun,  8 Sep 2024 21:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C95A14016D
 for <buildroot@lists.busybox.net>; Sun,  8 Sep 2024 21:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZrJA4AOJvxav for <buildroot@lists.busybox.net>;
 Sun,  8 Sep 2024 21:34:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A70EA40128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A70EA40128
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A70EA40128
 for <buildroot@buildroot.org>; Sun,  8 Sep 2024 21:34:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d4f.dip0.t-ipconnect.de [91.58.13.79])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 90092A4C0A3E
 for <buildroot@buildroot.org>; Sun,  8 Sep 2024 23:34:53 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55624)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1snPYa-000000005UT-1S9g
 for buildroot@buildroot.org; Sun, 08 Sep 2024 21:34:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  8 Sep 2024 23:34:52 +0200
Message-Id: <20240908213452.1634373-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1725831293;
 bh=jMxGZ5aI2HcNKbehry11nqKm9holRN+V2H9nJ4mePII=;
 h=From:To:Subject:Date:From;
 b=brb2QlhLa+ectFetmKjODTPIPP6JyztHMG3SH8B/NCICM1xaN1r3LS+hkQr+dQBcK
 byYxyPCNKgPOKqJCSfZ6UXD9KxM4sXidUx41lJCX8BQzCCicMot6FQYK+iPL7GvoB1
 7akBiT6+bxeXcn/Ph2x/pGcK5VCibDCImnyZx3z/n2KxGBcZkKM50LsDF1ddAZBYsV
 Aqt55ywRs9F80pSWTkUgbRsUxNHIJNocUVGv4uPsZxre6K+dicYUb3xc+J5va7jIzw
 XR+/7ooThDUGxWxDYrkpfk3ALStM+5E5PXB+gtKG0nXWHhAV2W1UWpIyNfHFrIIf38
 iIpEb1R0hHRDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=brb2QlhL
Subject: [Buildroot] [PATCH 1/1] package/rp-pppoe: bump version to 4.0
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

Release notes:
https://dianne.skoll.ca/pipermail/rp-pppoe/2023q2/000640.html

Updated license hash due to SPDX-License-Identifier addition:
https://github.com/dfskoll/rp-pppoe/commit/e51f1cea3bb40b1a79b7256ef0ea81c318e97edb

Removed non-existing files from RP_PPPOE_INSTALL_TARGET_CMDS.

Removed patch which was applied upstream:
https://github.com/dfskoll/rp-pppoe/commit/bbf5b2759cff0c65b47fd6dbe5fe7341f205ad03

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 ...src-pppoe.h-fix-build-with-musl-libc.patch | 60 -------------------
 package/rp-pppoe/rp-pppoe.hash                |  5 +-
 package/rp-pppoe/rp-pppoe.mk                  | 11 +---
 4 files changed, 4 insertions(+), 73 deletions(-)
 delete mode 100644 package/rp-pppoe/0001-src-pppoe.h-fix-build-with-musl-libc.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 9a7cf07c7a..5c34e9e228 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1139,7 +1139,6 @@ package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch l
 package/riscv-isa-sim/0001-riscv-disable-precompiled-headers.patch lib_patch.Upstream
 package/rng-tools/S21rngd Shellcheck lib_sysv.Variables
 package/rocksdb/0001-build_tools-build_detect_platform-fix-C-tests.patch lib_patch.Upstream
-package/rp-pppoe/0001-src-pppoe.h-fix-build-with-musl-libc.patch lib_patch.Upstream
 package/rpcbind/0001-Remove-yellow-pages-support.patch lib_patch.Upstream
 package/rpcbind/S30rpcbind lib_sysv.EmptyLastLine lib_sysv.Indent lib_sysv.Variables
 package/rpi-userland/0001-Add-.pc-files-for-the-OpenGLESv2-EGL-and-bcm_host-li.patch lib_patch.Upstream
diff --git a/package/rp-pppoe/0001-src-pppoe.h-fix-build-with-musl-libc.patch b/package/rp-pppoe/0001-src-pppoe.h-fix-build-with-musl-libc.patch
deleted file mode 100644
index 29ba72be4f..0000000000
--- a/package/rp-pppoe/0001-src-pppoe.h-fix-build-with-musl-libc.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From bbf5b2759cff0c65b47fd6dbe5fe7341f205ad03 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 11 Dec 2021 22:03:16 +0100
-Subject: [PATCH] src/pppoe.h: fix build with musl libc
-
-musl libc defines its own struct ethhdr that conflicts with the kernel
-define one. The kernel headers provide a way to suppress its struct
-ethhdr. For that to work the libc headers must precede the kernel. Move
-the kernel linux/if_ether.h include below libc netinet/if_ether.h. That
-fixes the following build failure:
-
-In file included from pppoe.h:133,
-                 from debug.c:19:
-/home/giuliobenetti/autobuild/run/instance-0/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/netinet/if_ether.h:116:8: error: redefinition of 'struct ethhdr'
-  116 | struct ethhdr {
-      |        ^~~~~~
-In file included from pppoe.h:121,
-                 from debug.c:19:
-/home/giuliobenetti/autobuild/run/instance-0/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/linux/if_ether.h:163:8: note: originally defined here
-  163 | struct ethhdr {
-      |        ^~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/ccca18fcbcde65cb6784f5559eac68ca17ab14a3
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/dfskoll/rp-pppoe/pull/4]
----
- src/pppoe.h | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/pppoe.h b/src/pppoe.h
-index 4780092..2b08111 100644
---- a/src/pppoe.h
-+++ b/src/pppoe.h
-@@ -117,10 +117,6 @@ typedef unsigned long UINT32_t;
- #error Could not find a 32-bit integer type
- #endif
- 
--#ifdef HAVE_LINUX_IF_ETHER_H
--#include <linux/if_ether.h>
--#endif
--
- #include <netinet/in.h>
- 
- #ifdef HAVE_NETINET_IF_ETHER_H
-@@ -134,6 +130,10 @@ typedef unsigned long UINT32_t;
- #endif
- #endif
- 
-+#ifdef HAVE_LINUX_IF_ETHER_H
-+#include <linux/if_ether.h>
-+#endif
-+
- 
- 
- /* Ethernet frame types according to RFC 2516 */
--- 
-2.33.0
-
diff --git a/package/rp-pppoe/rp-pppoe.hash b/package/rp-pppoe/rp-pppoe.hash
index c883322d70..97bb61eaf8 100644
--- a/package/rp-pppoe/rp-pppoe.hash
+++ b/package/rp-pppoe/rp-pppoe.hash
@@ -1,4 +1,3 @@
-# Locally calculated after checking pgp signature
-sha256  b1f318bc7e4e5b0fd8a8e23e8803f5e6e43165245a5a10a7162a92a6cf17829a  rp-pppoe-3.15.tar.gz
 # Locally computed
-sha256  464006ba771074f4022db14f58a29a0b447b6fdde9529cf0331be396b6279162  doc/LICENSE
+sha256  17d45712778f2bf6b0859ff610a3dacd24bc4462e9f53bb1466d47af391701d3  rp-pppoe-4.0.tar.gz
+sha256  d2767e7ffc6dc9477812f6238551fe4b29a889df6f23c3922e7b9cec92bc278d  doc/LICENSE
diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index f50f1e5a1f..98325e7d49 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RP_PPPOE_VERSION = 3.15
-RP_PPPOE_SITE = https://dianne.skoll.ca/projects/rp-pppoe/download
+RP_PPPOE_VERSION = 4.0
+RP_PPPOE_SITE = $(call github,dfskoll,rp-pppoe,$(RP_PPPOE_VERSION))
 RP_PPPOE_LICENSE = GPL-2.0
 RP_PPPOE_LICENSE_FILES = doc/LICENSE
 RP_PPPOE_CPE_ID_VALID = YES
@@ -13,8 +13,6 @@ RP_PPPOE_CPE_ID_VALID = YES
 RP_PPPOE_DEPENDENCIES = pppd
 RP_PPPOE_SUBDIR = src
 RP_PPPOE_TARGET_FILES = pppoe pppoe-server pppoe-relay pppoe-sniff
-RP_PPPOE_TARGET_SCRIPTS = pppoe-connect pppoe-init pppoe-setup pppoe-start \
-	pppoe-status pppoe-stop
 RP_PPPOE_MAKE_OPTS = PLUGIN_DIR=/usr/lib/pppd/$(PPPD_VERSION)
 RP_PPPOE_CONF_OPTS = --disable-debugging
 
@@ -30,14 +28,9 @@ RP_PPPOE_CONF_ENV = \
 	PPPD_H=$(PPPD_DIR)/pppd/pppd.h
 
 define RP_PPPOE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/configs/pppoe.conf \
-		$(TARGET_DIR)/etc/ppp/pppoe.conf
 	for ff in $(RP_PPPOE_TARGET_FILES); do \
 		$(INSTALL) -m 0755 $(@D)/src/$$ff $(TARGET_DIR)/usr/sbin/$$ff || exit 1; \
 	done
-	for ff in $(RP_PPPOE_TARGET_SCRIPTS); do \
-		$(INSTALL) -m 0755 $(@D)/scripts/$$ff $(TARGET_DIR)/usr/sbin/$$ff || exit 1; \
-	done
 endef
 
 $(eval $(autotools-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
