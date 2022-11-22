Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC3AC4332F
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 22:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44EB44193D;
	Tue, 22 Nov 2022 22:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44EB44193D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3LAD1VxuiXAz; Tue, 22 Nov 2022 22:31:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E553941925;
	Tue, 22 Nov 2022 22:31:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E553941925
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 996DD1BF46D
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7568B60ADD
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:30:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7568B60ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XGKb9U8X7ZRN for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 22:30:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 987FC60ADA
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 22:30:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 987FC60ADA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 856C2841E6; Tue, 22 Nov 2022 22:30:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Nov 2022 23:29:41 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c4fa02ee636420c40cf24412ee59c5f21c673d3e
X-Git-Newrev: 59adb53c4cdbd6805ab9a2905d0badcd7f2bd25c
X-Patchwork-Hint: ignore
Message-Id: <20221122223057.856C2841E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rpi-userland: add
 support for aarch64
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

commit: https://git.buildroot.net/buildroot/commit/?id=59adb53c4cdbd6805ab9a2905d0badcd7f2bd25c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Enable aarch64 support for rpi-userland to provide
vcmailbox and vcgencmd in 64bit builds. The are useful
for programming OTP and system debug.

The ARM64=ON parameter restricts the make targets
to only include those supported on 64-bit i.e. it
excludes the legacy Broadcom EGL drivers.

Signed-off-by: Tim Gover <tim.gover@raspberrypi.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpi-userland/Config.in       | 14 +++++++-------
 package/rpi-userland/rpi-userland.mk |  6 ++++++
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
index 342faf26e3..cfb472808b 100644
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_RPI_USERLAND
 	bool "rpi-userland"
-	depends on BR2_arm
+	depends on BR2_arm || BR2_aarch64
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_HAS_LIBEGL
-	select BR2_PACKAGE_HAS_LIBGLES
-	select BR2_PACKAGE_HAS_LIBOPENVG
-	select BR2_PACKAGE_HAS_LIBOPENMAX
+	select BR2_PACKAGE_HAS_LIBEGL if BR2_arm
+	select BR2_PACKAGE_HAS_LIBGLES if BR2_arm
+	select BR2_PACKAGE_HAS_LIBOPENVG if BR2_arm
+	select BR2_PACKAGE_HAS_LIBOPENMAX if BR2_arm
 	help
 	  Raspberry Pi Userland contains the necessary library to use
 	  the VideoCore driver.
@@ -18,7 +18,7 @@ config BR2_PACKAGE_RPI_USERLAND
 
 	  https://github.com/raspberrypi/userland/
 
-if BR2_PACKAGE_RPI_USERLAND
+if BR2_PACKAGE_RPI_USERLAND && BR2_arm
 
 config BR2_PACKAGE_PROVIDES_LIBEGL
 	default "rpi-userland"
@@ -40,6 +40,6 @@ config BR2_PACKAGE_RPI_USERLAND_HELLO
 endif
 
 comment "rpi-userland needs a toolchain w/ C++, threads, dynamic library"
-	depends on BR2_arm
+	depends on BR2_arm || BR2_arch64
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 1204196e19..42c7e8190f 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -11,12 +11,18 @@ RPI_USERLAND_LICENSE_FILES = LICENCE
 RPI_USERLAND_INSTALL_STAGING = YES
 RPI_USERLAND_CONF_OPTS = -DVMCS_INSTALL_PREFIX=/usr
 
+ifeq ($(BR2_arm),y)
 RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
+endif
 
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 RPI_USERLAND_DEPENDENCIES += libexecinfo
 endif
 
+ifeq ($(BR2_aarch64),y)
+RPI_USERLAND_CONF_OPTS += -DARM64=ON
+endif
+
 ifeq ($(BR2_PACKAGE_RPI_USERLAND_HELLO),y)
 
 RPI_USERLAND_CONF_OPTS += -DALL_APPS=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
