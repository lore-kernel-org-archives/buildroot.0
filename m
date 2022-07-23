Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350BCC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C86A340934;
	Sat, 23 Jul 2022 20:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C86A340934
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BTv9BEDToK3K; Sat, 23 Jul 2022 20:33:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 187BE40928;
	Sat, 23 Jul 2022 20:33:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 187BE40928
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C8131BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAC8884C34
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAC8884C34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3FWeIUuDeMJd for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:33:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F82084C2E
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:33:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F82084C2E
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F1184852E0; Sat, 23 Jul 2022 20:19:26 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 22:32:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9bc22ee8a1b98e3d2ab2a4c135e969423eb9d62
X-Git-Newrev: 1ce86404419c0a356a5bd9e726e681b23d53c866
X-Patchwork-Hint: ignore
Message-Id: <20220723201926.F1184852E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nut: bump version to 2.8.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1ce86404419c0a356a5bd9e726e681b23d53c866
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/nut/nut.hash |  2 +-
 package/nut/nut.mk   | 54 ++++++++++++++++++++++++++++------------------------
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
index cd31cd886a..fb98ba04f0 100644
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
+	$(SED) 's%CFLAGS="-isystem /usr/local/include%_UNUSED_CFLAGS="-isystem /usr/local/include%' $(@D)/configure
+	$(SED) 's%CXXFLAGS="-isystem /usr/local/include%_UNUSED_CXXFLAGS="-isystem /usr/local/include%' $(@D)/configure
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
