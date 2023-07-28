Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE85EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 20:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46C1160D4D;
	Fri, 28 Jul 2023 20:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46C1160D4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XRbEDkDTnT8o; Fri, 28 Jul 2023 20:41:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B02460DF4;
	Fri, 28 Jul 2023 20:41:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B02460DF4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9DF081BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7816584587
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7816584587
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d2NGhEo-09Zn for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 20:41:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F4BF84581
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F4BF84581
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 664E1839E7; Fri, 28 Jul 2023 20:41:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 22:40:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ea97ba0dd52d4419c9bc9031375d78024565648
X-Git-Newrev: 624d50b20cf4bf4a67ad6274263f85927660f8c4
X-Patchwork-Hint: ignore
Message-Id: <20230728204128.664E1839E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/barebox: add optional dependencies on
 host-openssl and host-libusb
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

commit: https://git.buildroot.net/buildroot/commit/?id=624d50b20cf4bf4a67ad6274263f85927660f8c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some barebox targets need to build host tools (for example rockchip64
uses scripts/rkimage) that require some host libraries, such as
host-openssl or host-libusb. These are detected by the Barebox build
system using pkg-config.

In order to allow supporting such Barebox configurations, we add two
new options: BR2_TARGET_BAREBOX_NEEDS_OPENSSL and
BR2_TARGET_BAREBOX_NEEDS_LIBUSB that respectively allow to ensure that
host-openssl and/or host-libusb are built before Barebox.

Additionally, $(1)_MAKE_ENV is adjusted to ensure that when pkg-config
is run by the Barebox build system, it finds host libraries. This is
similar to what is done in U-Boot.

This allows to fix the following build failure:

  HOSTCC  scripts/rkimage
Package openssl was not found in the pkg-config search path.
Perhaps you should add the directory containing `openssl.pc'
to the PKG_CONFIG_PATH environment variable
Package 'openssl', required by 'virtual:world', not found
/usr/lib/gcc/x86_64-pc-linux-gnu/12/../../../../x86_64-pc-linux-gnu/bin/ld: /tmp/ccN8Xyaj.o: in function `main':
rkimage.c:(.text.startup+0x218): undefined reference to `SHA256_Init'
/usr/lib/gcc/x86_64-pc-linux-gnu/12/../../../../x86_64-pc-linux-gnu/bin/ld: rkimage.c:(.text.startup+0x22b): undefined reference to `SHA256_Update'
/usr/lib/gcc/x86_64-pc-linux-gnu/12/../../../../x86_64-pc-linux-gnu/bin/ld: rkimage.c:(.text.startup+0x23e): undefined reference to `SHA256_Final'
/usr/lib/gcc/x86_64-pc-linux-gnu/12/../../../../x86_64-pc-linux-gnu/bin/ld: rkimage.c:(.text.startup+0x253): undefined reference to `SHA256_Init'
/usr/lib/gcc/x86_64-pc-linux-gnu/12/../../../../x86_64-pc-linux-gnu/bin/ld: rkimage.c:(.text.startup+0x265): undefined reference to `SHA256_Update'
/usr/lib/gcc/x86_64-pc-linux-gnu/12/../../../../x86_64-pc-linux-gnu/bin/ld: rkimage.c:(.text.startup+0x275): undefined reference to `SHA256_Final'
collect2: error: ld returned 1 exit status
make[2]: *** [scripts/Makefile.host:107: scripts/rkimage] Error 1
make[1]: *** [Makefile:976: scripts] Error 2

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/barebox/Config.in  | 12 ++++++++++++
 boot/barebox/barebox.mk | 14 ++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 3961c69c56..dba4a1a8d6 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -54,6 +54,18 @@ config BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR
 
 	  Most users may leave this empty
 
+config BR2_TARGET_BAREBOX_NEEDS_OPENSSL
+	bool "Barebox needs OpenSSL"
+	help
+	  Select this option if your Barebox board configuration
+	  requires OpenSSL to be available on the host.
+
+config BR2_TARGET_BAREBOX_NEEDS_LIBUSB
+	bool "Barebox needs LibUSB"
+	help
+	  Select this option if your Barebox board configuration
+	  requires libUSB to be available on the host.
+
 if BR2_TARGET_BAREBOX_CUSTOM_GIT
 
 config BR2_TARGET_BAREBOX_CUSTOM_GIT_REPO_URL
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index d7bcafe436..4c9df8d618 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -43,6 +43,14 @@ ifeq ($(BR2_TARGET_BAREBOX_LATEST_VERSION),y)
 $(1)_LICENSE_FILES = COPYING
 endif
 
+ifeq ($(BR2_TARGET_BAREBOX_NEEDS_OPENSSL),y)
+BAREBOX_DEPENDENCIES += host-openssl host-pkgconf
+endif
+
+ifeq ($(BR2_TARGET_BAREBOX_NEEDS_LIBUSB),y)
+BAREBOX_DEPENDENCIES += host-libusb host-pkgconf
+endif
+
 $(1)_CUSTOM_EMBEDDED_ENV_PATH = $$(call qstrip,$$(BR2_TARGET_$(1)_CUSTOM_EMBEDDED_ENV_PATH))
 
 ifneq ($$(call qstrip,$$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR)),)
@@ -73,6 +81,12 @@ endif
 
 $(1)_MAKE_FLAGS = ARCH=$$($(1)_ARCH) CROSS_COMPILE="$$(TARGET_CROSS)"
 $(1)_MAKE_ENV = $$(TARGET_MAKE_ENV)
+$(1)_MAKE_ENV += \
+	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+	PKG_CONFIG_SYSROOT_DIR="/" \
+	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
+	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
+	PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig"
 
 ifeq ($$(BR2_REPRODUCIBLE),y)
 $(1)_MAKE_ENV += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
