Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDD8C0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82BCB41403;
	Sun,  6 Aug 2023 14:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82BCB41403
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1NNFvUcq8Cqm; Sun,  6 Aug 2023 14:04:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE0AA4138D;
	Sun,  6 Aug 2023 14:04:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE0AA4138D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4CFC51BF340
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A024B8140F
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A024B8140F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ewslxnFsZjVx for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:04:01 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D53CC813C2
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:04:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D53CC813C2
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1B502A4C10DD;
 Sun,  6 Aug 2023 16:02:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46282)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSeLD-0000Bn-2Y;
 Sun, 06 Aug 2023 16:02:43 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Aug 2023 16:02:35 +0200
Message-Id: <20230806140241.4155773-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230806140241.4155773-1-bernd@kuhls.net>
References: <20230806140241.4155773-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691330564;
 bh=qCAa95xl/8wqFWGZ575sS+TliWER/TivMWmn52o6g40=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GMNfKGbQ4qwghKrx25R7RoX2fsV0VGNq92bvPcno4bFOBJoKhubTjAvd6G0Rpd58C
 3oJ3QdrBzF2/GV06C1n/6dmEKeQP6ycCrJ8lkqIcM6i77v5aQO6YOa0gVySLQ00Bxp
 +SaNDR3RlMVH14J2eaZjmxldGMKib16jF9r6Hqec4mYdy6Y41sRamMcj+ygynZ8347
 3pA6/bpQQJHDi1qeXptL+x5iIuntwbN9nMHyz3ZYsOf0T6o4B8Be8gYgTCaEptpp4C
 HdSAWo2dGsuYqW0zJurCx2g7BB6KnJp4jItszyR6NHvMXS2PkTjX+oAd0DAQXEg7ug
 HHKOB0Abc2D6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=GMNfKGbQ
Subject: [Buildroot] [PATCH/next v9 06/12] package/libudev: make it
 selectable
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Sen Hastings <sen@phobosdpl.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Usually, it is not possible for a package to select a virtual package it
depends on, and expects a provider to suddenly be available.

However, for libudev, this is slightly simpler: there will be only two
providers ever: eudev and systemd. Both are incompatible one with the
other, systemd is only available if chosen as an init system.

So, if systemd is not enabled (as an init system), then we can
forcefully enable eudev as the provider for libudev.

However, this can cause circular dependencies in Kconfig, du to a rather
complex chain of select and depends. For example, when libinput is
converting in a later patch, we'd end up with:

    package/weston/Config.in:6:error: recursive dependency detected!
    package/weston/Config.in:6:     symbol BR2_PACKAGE_WESTON depends on BR2_PACKAGE_HAS_UDEV
    package/udev/Config.in:1:       symbol BR2_PACKAGE_HAS_UDEV is selected by BR2_PACKAGE_EUDEV_DAEMON
    package/eudev/Config.in:24:     symbol BR2_PACKAGE_EUDEV_DAEMON depends on BR2_PACKAGE_EUDEV
    package/eudev/Config.in:1:      symbol BR2_PACKAGE_EUDEV is selected by BR2_PACKAGE_LIBUDEV
    package/libudev/Config.in:1:    symbol BR2_PACKAGE_LIBUDEV is selected by BR2_PACKAGE_LIBINPUT
    package/libinput/Config.in:1:   symbol BR2_PACKAGE_LIBINPUT is selected by BR2_PACKAGE_WESTON

The root cause being a mis-match of select and depends on in the same
chain, where Kconfig can not determine that an external condition will
ensure that the chain is in fact broken at some point.

To fix that, we move the symbol for the eudev daemon out of the eudev
if-block. This breaks the chain.

Yet, we still want to tell the user that the daemon is enabled, so we
introduce a dummy symbol, just for the sake of having a forced-on
prompt.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/eudev/Config.in   | 25 +++++++++++++++++--------
 package/libudev/Config.in |  7 +++++++
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index b7fa6b8bc5..d35e442c2f 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -1,3 +1,17 @@
+# This symbol is outside the eudev if-block, so that we do not have
+# a circular dependency in kconfig. Thus, we need the dummy symbol,
+# below, to inform the user that the daemon has indeed been enabled.
+config BR2_PACKAGE_EUDEV_DAEMON
+	bool
+	select BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_UDEV_GENTOO_SCRIPTS if BR2_INIT_OPENRC
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_KMOD
+	# We can select this has we're sure eudev is selected when we are.
+	select BR2_PACKAGE_EUDEV_DAEMON_DUMMY
+
 config BR2_PACKAGE_EUDEV
 	bool "eudev"
 	depends on BR2_USE_MMU # uses fork()
@@ -18,19 +32,14 @@ if BR2_PACKAGE_EUDEV
 config BR2_PACKAGE_PROVIDES_LIBUDEV
 	default "eudev"
 
-config BR2_PACKAGE_EUDEV_DAEMON
+config BR2_PACKAGE_EUDEV_DAEMON_DUMMY
 	bool "udev daemon"
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
-	select BR2_PACKAGE_HAS_UDEV
-	select BR2_PACKAGE_UDEV_GENTOO_SCRIPTS if BR2_INIT_OPENRC
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBS
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	select BR2_PACKAGE_KMOD
 	help
 	  Install the udev daemon.
 
-if BR2_PACKAGE_EUDEV_DAEMON
+# Use the dummy symbol for proper indetation
+if BR2_PACKAGE_EUDEV_DAEMON_DUMMY
 
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "eudev"
diff --git a/package/libudev/Config.in b/package/libudev/Config.in
index 2dbafe4991..8784f4374a 100644
--- a/package/libudev/Config.in
+++ b/package/libudev/Config.in
@@ -1,3 +1,10 @@
+config BR2_PACKAGE_LIBUDEV
+	bool
+	depends on BR2_USE_MMU # eudev / systemd
+	depends on BR2_USE_WCHAR # eudev / systemd
+	depends on !BR2_STATIC_LIBS # eudev / systemd
+	select BR2_PACKAGE_EUDEV if !BR2_PACKAGE_SYSTEMD
+
 config BR2_PACKAGE_HAS_LIBUDEV
 	bool
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
