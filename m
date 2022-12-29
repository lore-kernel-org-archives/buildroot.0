Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28269C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 08:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B310840498;
	Thu, 29 Dec 2022 08:54:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B310840498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FJM5KVmPfgji; Thu, 29 Dec 2022 08:54:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A69804057A;
	Thu, 29 Dec 2022 08:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A69804057A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 04AD61BF3A0
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 08:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E17F540480
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 08:54:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E17F540480
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DuRxpRvabm2r for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 08:54:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1BAD40470
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 08:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1BAD40470
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9EB986FA0; Thu, 29 Dec 2022 08:54:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 09:53:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1ecfe135747c28bcb3492e60f0d7aea630ead55
X-Git-Newrev: b95334b71fbdde0f7621b58ed35fa98df9e0966d
X-Patchwork-Hint: ignore
Message-Id: <20221229085402.C9EB986FA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/modem-manager: bump version to
 1.20.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=b95334b71fbdde0f7621b58ed35fa98df9e0966d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch package type to meson as the primary supported build system
from now on is meson and the autotools support as deprecated. The
package tarball is no longer supported, thus the MODEM_MANAGER_SOURCE
is changed to the gitlab archive URL.

All previously supported options are converted to the meson
configuraiton options and support for new ones is added. The new
options are: bash_completion, polkit, systemd, qrtr.

The dbus build dependency is needed since the meson build system uses
dbus pkg-config to determine install locations. The 'udevdir' has to
be specified also in case dbus is not installed. Modem-manager will
use its own built-in udev rule parser to determine modem specific
values.

For building with libqmi support version 1.32.2 is required and for
libmbim version 1.28.2 is required.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/modem-manager/Config.in          |  2 +-
 package/modem-manager/modem-manager.hash |  2 +-
 package/modem-manager/modem-manager.mk   | 72 ++++++++++++++++++++++++--------
 3 files changed, 56 insertions(+), 20 deletions(-)

diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index c4c723776d..d211d68ee1 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_MODEM_MANAGER
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
-	select BR2_PACKAGE_DBUS # runtime dependency
+	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBGUDEV if BR2_PACKAGE_HAS_UDEV
 	help
diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index 40c8ad703f..e6967f8d62 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,4 +1,4 @@
 #Locally calculated after checking https://www.freedesktop.org/software/ModemManager/ModemManager-1.18.12.tar.xz.asc
-sha256  b464e4925d955a6ca86dd08616e763b26ae46d7fd37dbe281678e34065b1e430  ModemManager-1.18.12.tar.xz
+sha256  ba56aa764edc148f58348a589743cf1c1e27c55dcd7ebd820dcedd52fb8d7179  ModemManager-1.20.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index d0c9b7377b..8a0dbba3a4 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,42 +4,78 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.18.12
-MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
-MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
+MODEM_MANAGER_VERSION = 1.20.2
+MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.gz
+MODEM_MANAGER_SITE = https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/archive/$(MODEM_MANAGER_VERSION)
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
 MODEM_MANAGER_LICENSE_FILES = COPYING COPYING.LIB
 MODEM_MANAGER_SELINUX_MODULES = modemmanager
-MODEM_MANAGER_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
+MODEM_MANAGER_DEPENDENCIES = host-pkgconf dbus libglib2 $(TARGET_NLS_DEPENDENCIES) host-libxslt
 MODEM_MANAGER_INSTALL_STAGING = YES
-MODEM_MANAGER_CONF_OPTS = --disable-more-warnings
+MODEM_MANAGER_CONF_OPTS = \
+	-Dpowerd_suspend_resume=false \
+	-Dudevdir=/usr/lib/udev
 
-ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
-MODEM_MANAGER_DEPENDENCIES += libqmi
-MODEM_MANAGER_CONF_OPTS += --with-qmi
+ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
+MODEM_MANAGER_DEPENDENCIES += libgudev
+MODEM_MANAGER_CONF_OPTS += -Dudev=true
 else
-MODEM_MANAGER_CONF_OPTS += --without-qmi
+MODEM_MANAGER_CONF_OPTS += -Dudev=false
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
-MODEM_MANAGER_DEPENDENCIES += libgudev
-MODEM_MANAGER_CONF_OPTS += --with-udev
+ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
+MODEM_MANAGER_DEPENDENCIES += libqmi
+MODEM_MANAGER_CONF_OPTS += -Dqmi=true
 else
-MODEM_MANAGER_CONF_OPTS += --without-udev
+MODEM_MANAGER_CONF_OPTS += -Dqmi=false
 endif
 
 ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBMBIM),y)
 MODEM_MANAGER_DEPENDENCIES += libmbim
-MODEM_MANAGER_CONF_OPTS += --with-mbim
+MODEM_MANAGER_CONF_OPTS += -Dmbim=true
+else
+MODEM_MANAGER_CONF_OPTS += -Dmbim=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBQRTR_GLIB),y)
+MODEM_MANAGER_DEPENDENCIES += libqrtr-glib
+MODEM_MANAGER_CONF_OPTS += -Dqrtr=true
+else
+MODEM_MANAGER_CONF_OPTS += -Dqrtr=false
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+MODEM_MANAGER_DEPENDENCIES += systemd
+MODEM_MANAGER_CONF_OPTS += \
+	-Dsystemd_journal=true \
+	-Dsystemd_suspend_resume=true \
+	-Dsystemdsystemunitdir=/usr/lib/systemd/system
+else
+MODEM_MANAGER_CONF_OPTS += \
+	-Dsystemd_journal=false \
+	-Dsystemd_suspend_resume=false \
+	-Dsystemdsystemunitdir=no
+endif
+
+ifeq ($(BR2_PACKAGE_POLKIT),y)
+MODEM_MANAGER_DEPENDENCIES += polkit
+MODEM_MANAGER_CONF_OPTS += -Dpolkit=strict
 else
-MODEM_MANAGER_CONF_OPTS += --without-mbim
+MODEM_MANAGER_CONF_OPTS += -Dpolkit=no
 endif
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 MODEM_MANAGER_DEPENDENCIES += gobject-introspection
-MODEM_MANAGER_CONF_OPTS += --enable-introspection
+MODEM_MANAGER_CONF_OPTS += -Dintrospection=true
+else
+MODEM_MANAGER_CONF_OPTS += -Dintrospection=false
+endif
+
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+MODEM_MANAGER_DEPENDENCIES += bash-completion
+MODEM_MANAGER_CONF_OPTS += -Dbash_completion=true
 else
-MODEM_MANAGER_CONF_OPTS += --disable-introspection
+MODEM_MANAGER_CONF_OPTS += -Dbash_completion=false
 endif
 
 define MODEM_MANAGER_INSTALL_INIT_SYSV
@@ -47,4 +83,4 @@ define MODEM_MANAGER_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S44modem-manager
 endef
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
