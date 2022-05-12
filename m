Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDE9C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 20:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1798360B6C;
	Thu, 12 May 2022 20:57:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RwRXkR8RRG_R; Thu, 12 May 2022 20:57:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBE0A60B64;
	Thu, 12 May 2022 20:57:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2EA4D1BF3A4
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CC0B60B64
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:57:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sIQopEgeEvY0 for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 20:57:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 963CB60B0A
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:57:18 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout06.t-online.de (Postfix) with SMTP id 72DD7F455;
 Thu, 12 May 2022 22:57:15 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.203.41]) by fwd89.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1npFs3-0D4vE90; Thu, 12 May 2022 22:57:15 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:48522)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1npFs2-0000L5-L1;
 Thu, 12 May 2022 22:57:14 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 22:57:14 +0200
Message-Id: <20220512205714.2739391-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652389035-0000F5B3-301822E7/0/0 CLEAN NORMAL
X-TOI-MSGID: 164c2553-e223-40bc-a4a5-365fbe8c08b0
Subject: [Buildroot] [PATCH 1/1] package/nut: bump version to 2.8.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed dependency to host-perl, not needed anymore after
https://github.com/networkupstools/nut/commit/3f7d05093ba589e1b05b9a6a88c03637472b5847

Removed autoreconf, the tarball provided by upstream contains a
configure script.

This configure script however adds /usr/local/include to some tests
which fail for us, instead of patching configure.ac and going through
the autoreconf nightmare again we patch the configure script directly.

Added configure option --without-doc

Added more autoreconf variables to fix cross-compile issues.

Changed "--with-drivers=all" to "--with-drivers=auto" because some new
drivers need packages not provided by buildroot, for example:
configure: error: Powerman client libraries not found, required for
 Powerman PDU client driver

Added optional dependency to freeipmi.

Added optional dependency to libusb, for details see
https://github.com/networkupstools/nut/issues/300

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Build-tested using this defconfig

BR2_PACKAGE_LIBTOOL=y
BR2_PACKAGE_DBUS=y
BR2_PACKAGE_FREEIPMI=y
BR2_PACKAGE_OPENSSL=y
# BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_MD2 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_MDC2 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_BLAKE2 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_IDEA is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_SEED is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_WHIRLPOOL is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL2 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL3 is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_WEAK_SSL is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_CAST is not set
# BR2_PACKAGE_LIBOPENSSL_UNSECURE is not set
# BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE is not set
# BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP is not set
BR2_PACKAGE_GD=y
BR2_PACKAGE_LIBPNG=y
BR2_PACKAGE_LIBUSB=y
BR2_PACKAGE_NEON=y
BR2_PACKAGE_NEON_LIBXML2=y
BR2_PACKAGE_AVAHI=y
BR2_PACKAGE_NETSNMP=y
# BR2_PACKAGE_NETSNMP_SERVER is not set
# BR2_PACKAGE_NETSNMP_CLIENTS is not set
# BR2_PACKAGE_NETSNMP_ENABLE_MIBS is not set
BR2_PACKAGE_NUT=y

                             andes-nds32 [ 1/45]: SKIPPED
                             arm-aarch64 [ 2/45]: OK
                   bootlin-aarch64-glibc [ 3/45]: OK
               bootlin-arcle-hs38-uclibc [ 4/45]: OK
                    bootlin-armv5-uclibc [ 5/45]: OK
                     bootlin-armv7-glibc [ 6/45]: OK
                   bootlin-armv7m-uclibc [ 7/45]: SKIPPED
                      bootlin-armv7-musl [ 8/45]: OK
                bootlin-m68k-5208-uclibc [ 9/45]: SKIPPED
               bootlin-m68k-68040-uclibc [10/45]: OK
             bootlin-microblazeel-uclibc [11/45]: OK
                bootlin-mipsel32r6-glibc [12/45]: OK
                   bootlin-mipsel-uclibc [13/45]: OK
                     bootlin-nios2-glibc [14/45]: OK
                 bootlin-openrisc-uclibc [15/45]: OK
        bootlin-powerpc64le-power8-glibc [16/45]: OK
           bootlin-powerpc-e500mc-uclibc [17/45]: OK
                   bootlin-riscv32-glibc [18/45]: OK
                   bootlin-riscv64-glibc [19/45]: OK
                    bootlin-riscv64-musl [20/45]: OK
                      bootlin-sh4-uclibc [21/45]: OK
                   bootlin-sparc64-glibc [22/45]: OK
                    bootlin-sparc-uclibc [23/45]: OK
                    bootlin-x86-64-glibc [24/45]: OK
                     bootlin-x86-64-musl [25/45]: OK
                   bootlin-x86-64-uclibc [26/45]: OK
                   bootlin-xtensa-uclibc [27/45]: OK
                            br-arm-basic [28/45]: SKIPPED
                    br-arm-full-nothread [29/45]: SKIPPED
                      br-arm-full-static [30/45]: SKIPPED
                   br-i386-pentium4-full [31/45]: OK
                br-i386-pentium-mmx-musl [32/45]: OK
                      br-mips64-n64-full [33/45]: OK
                 br-mips64r6-el-hf-glibc [34/45]: OK
               br-powerpc-603e-basic-cpp [35/45]: OK
               br-powerpc64-power7-glibc [36/45]: OK
                       linaro-aarch64-be [37/45]: OK
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: SKIPPED
                            sourcery-arm [41/45]: SKIPPED
                     sourcery-arm-thumb2 [42/45]: SKIPPED
                         sourcery-mips64 [43/45]: OK
                           sourcery-mips [44/45]: OK
                          sourcery-nios2 [45/45]: OK
45 builds, 9 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

 package/nut/nut.hash |  2 +-
 package/nut/nut.mk   | 54 ++++++++++++++++++++++++--------------------
 2 files changed, 30 insertions(+), 26 deletions(-)

diff --git a/package/nut/nut.hash b/package/nut/nut.hash
index a4e84244b5..3dda340a1b 100644
--- a/package/nut/nut.hash
+++ b/package/nut/nut.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  7129b2df45f9a9df3943f4d09f2b95b5a63d66ca4913431352570206968ca97b  nut-03c3bbe8df9a2caf3c09c120ae7045d35af99b76.tar.gz
+sha256  c3e5a708da797b7c70b653d37b1206a000fcb503b85519fe4cdf6353f792bfe5  nut-2.8.0.tar.gz
 sha256  9f562d0e6be5108a06684dd249686d378abe1653df14b1944e971e084f6751f0  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE-GPL2
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  LICENSE-GPL3
diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index cd31cd886a..98891225a4 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -4,44 +4,38 @@
 #
 ################################################################################
 
-NUT_VERSION = 03c3bbe8df9a2caf3c09c120ae7045d35af99b76
-NUT_SITE = $(call github,networkupstools,nut,$(NUT_VERSION))
+NUT_VERSION = 2.8.0
+NUT_SITE = https://github.com/networkupstools/nut/releases/download/v$(NUT_VERSION)
 NUT_LICENSE = GPL-2.0+, GPL-3.0+ (python scripts), GPL/Artistic (perl client)
 NUT_LICENSE_FILES = COPYING LICENSE-GPL2 LICENSE-GPL3
 NUT_SELINUX_MODULES = apache nut
 NUT_INSTALL_STAGING = YES
-NUT_DEPENDENCIES = host-pkgconf host-perl
+NUT_DEPENDENCIES = host-pkgconf
 
-# From git:
-NUT_AUTORECONF = YES
-
-# Generate files otherwise generated by autogen.sh
-# buildroot does not support augeas, creating an empty file prevents
-# us from adding a dependency to host-python
-define NUT_PREGEN
-	touch $(@D)/scripts/augeas/nutupsconf.aug.in
-	cd $(@D)/tools && PATH=$(BR_PATH) ./nut-usbinfo.pl
+# prevent usage of unsafe paths
+define NUT_FIX_CONFIGURE
+	$(SED) 's/CFLAGS=\"-isystem \/usr\/local\/include/_UNUSED_CFLAGS=\"-isystem \/usr\/local\/include/' $(@D)/configure
+	$(SED) 's/CXXFLAGS=\"-isystem \/usr\/local\/include/_UNUSED_CXXFLAGS=\"-isystem \/usr\/local\/include/' $(@D)/configure
 endef
-NUT_PRE_CONFIGURE_HOOKS += NUT_PREGEN
-
-# Race condition in tools generation
-NUT_MAKE = $(MAKE1)
+NUT_POST_PATCH_HOOKS += NUT_FIX_CONFIGURE
 
 # Put the PID files in a read-write place (/var/run is a tmpfs)
 # since the default location (/var/state/ups) maybe readonly.
 NUT_CONF_OPTS = \
 	--with-altpidpath=/var/run/upsd \
-	--with-dev
+	--with-dev \
+	--without-doc
 
-NUT_CONF_ENV = ax_cv__printf_string_null=yes
-
-# For uClibc-based toolchains, nut forgets to link with -lm
-ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-NUT_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lm"
-endif
+NUT_CONF_ENV = \
+	ax_cv_check_cflags__Werror__Wno_unknown_warning_option=no \
+	ax_cv_check_cxxflags__Werror__Wno_unknown_warning_option=no \
+	ac_cv_func_strcasecmp=yes \
+	ac_cv_func_strdup=yes \
+	ac_cv_func_strncasecmp=yes \
+	ax_cv__printf_string_null=yes
 
 ifeq ($(call qstrip,$(BR2_PACKAGE_NUT_DRIVERS)),)
-NUT_CONF_OPTS += --with-drivers=all
+NUT_CONF_OPTS += --with-drivers=auto
 else
 NUT_CONF_OPTS += --with-drivers=$(BR2_PACKAGE_NUT_DRIVERS)
 endif
@@ -53,6 +47,13 @@ else
 NUT_CONF_OPTS += --without-avahi
 endif
 
+ifeq ($(BR2_PACKAGE_FREEIPMI),y)
+NUT_CONF_OPTS += --with-freeipmi
+NUT_DEPENDENCIES += freeipmi
+else
+NUT_CONF_OPTS += --without-freeipmi
+endif
+
 # gd with support for png is required for the CGI
 ifeq ($(BR2_PACKAGE_GD)$(BR2_PACKAGE_LIBPNG),yy)
 NUT_DEPENDENCIES += gd libpng
@@ -72,7 +73,10 @@ else
 NUT_CONF_OPTS += --without-libltdl
 endif
 
-ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
+NUT_DEPENDENCIES += libusb
+NUT_CONF_OPTS += --with-usb
+else ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
 NUT_DEPENDENCIES += libusb-compat
 NUT_CONF_OPTS += --with-usb
 else
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
