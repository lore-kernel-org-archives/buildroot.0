Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E39CA0EE4
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 20:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4D2341703;
	Sat, 23 Aug 2025 20:40:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KYUrBzbTlSdP; Sat, 23 Aug 2025 20:40:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD2BD416E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD2BD416E1;
	Sat, 23 Aug 2025 20:40:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0721719C
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 20:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECE6D416E1
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 20:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DLVQwVhNivnn for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 20:40:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 013F0415CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 013F0415CB
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 013F0415CB
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 20:40:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id DCFE6C8EC56
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 20:40:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C2F60606A7
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 20:40:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D88D11C22CEA8; 
 Sat, 23 Aug 2025 22:40:46 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Aug 2025 22:40:42 +0200
Message-ID: <20250823204043.244589-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755981647; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=PEmCcftDxww9zz1kUpRdle1P/zdLf4Ykiiv6kXZ3vHo=;
 b=YrDbooG2y90run7U5eK60IrePkUADIwC+fVlNZlvxKRRTCs3UFAtDW+IMehOIHptdeP9JF
 GD5NKLzhoKKkekZ1lU62bNEJLs5s1mWZvk3CpCGpa1/3eOHKqjfhUxywa1iO025kVQY6lV
 DMWKr6o+hZ6NwNTGCcmBFZgQPhxE5d8wEczIlyXy/FM+fQ7Gvxki9zZCKdt4FIe+exCAhG
 sch7pg0dQNhuyXZU5bc7kerp3Pzvyh719fLTFQEuDvMx+8o5gs0I8LCtNLYbSrLWiSIawQ
 j/5NtjS+Fvof76SKf9HAsbtYvktld7lB1bQHdRAG2sBDLlsAD0js7PIih2zNAQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=YrDbooG2
Subject: [Buildroot] [PATCH] package/wayland: tweak wayland-scanner.pc after
 installation to fix SDL2 build issue
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some packages such as SDL2 do this:

WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`

to find the path to the wayland-scanner tool.

Of course, since SDL2 is compiled for the target, it does that using
the pkg-config configured for cross-compilation, which looks at
$(STAGING_DIR)/usr/lib/pkgconfig/wayland-scanner.pc.

Since it looks at the variable wayland_scanner, which doesn't get
prefixed by PKG_CONFIG_SYSROOT_DIR, the SDL2 configure script is told
that wayland-scanner is in /usr/bin/wayland-scanner causing this kind
of build failure:

/bin/bash: line 1: /usr/bin/wayland-scanner: No such file or directory
/bin/bash: line 1: /usr/bin/wayland-scanner: No such file or directory

when building SDL2.

The target wayland package depends on host-wayland, which most notably
is responsible for installing wayland-scanner in $(HOST_DIR)/bin.

So in order to fix the SDL2 build issue but in a global way (possibly
helping other packages), what this patch does is tweak the
wayland-scanner.pc installed by the target wayland so that its
wayland_scanner variable points to the host wayland-scanner
executable. We find this a better solution than passing a
WAYLAND_SCANNER variable to each and every package that needs
wayland-scanner.

The issue is not visible in the autobuilders, but can be reproduced
using the following defconfig:

 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_INIT_NONE=y
 BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 BR2_PACKAGE_SDL2=y
 BR2_PACKAGE_SDL2_WAYLAND=y
 BR2_PACKAGE_SDL2_OPENGLES=y
 BR2_PACKAGE_RPI_USERLAND=y
 BR2_PACKAGE_WAYLAND=y
 # BR2_TARGET_ROOTFS_TAR is not set

The issue probably exists since WAYLAND_SCANNER was retrieved using
pkg-config in SDL2's configure.ac script, in upstream commit
19d3500ae19636f3f410e270f12e0bc5e83410d4, which got first introduced
in release-2.0.5 of SDL2.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Note: the above configuration doesn't build due to other issues in
rpi-userland, patches are coming.
---
 package/wayland/wayland.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index bb5ceabb9c..23903bafcb 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -23,5 +23,17 @@ define WAYLAND_TARGET_CLEANUP
 endef
 WAYLAND_POST_INSTALL_TARGET_HOOKS += WAYLAND_TARGET_CLEANUP
 
+# The wayland-scanner.pc installed by the target wayland package is
+# used to find the wayland-scanner tool, which in a cross-compilation
+# context is compiled for the host (and in Buildroot, compiled by
+# host-wayland). Below, we tweak the target wayland-scanner.pc so that
+# when the wayland_scanner variable is requested through pkg-config,
+# it points to the host wayland_scanner tool.
+define WAYLAND_TWEAK_WAYLAND_SCANNER_PATH
+	$(SED) 's%^wayland_scanner=.*%wayland_scanner=$(HOST_DIR)/bin/wayland-scanner%' \
+		$(STAGING_DIR)/usr/lib/pkgconfig/wayland-scanner.pc
+endef
+WAYLAND_POST_INSTALL_TARGET_HOOKS += WAYLAND_TWEAK_WAYLAND_SCANNER_PATH
+
 $(eval $(meson-package))
 $(eval $(host-meson-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
