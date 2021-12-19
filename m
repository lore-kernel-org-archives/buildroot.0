Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874B4C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Dec 2021 07:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E58CC60B44;
	Sun, 19 Dec 2021 07:31:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CaFd2kW-iopc; Sun, 19 Dec 2021 07:31:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CC6B60B3D;
	Sun, 19 Dec 2021 07:31:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C7E61BF969
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 07:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69C1460B3D
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 07:31:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FPSRwidA-U44 for <buildroot@lists.busybox.net>;
 Sun, 19 Dec 2021 07:31:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 29CB460AB0
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 07:31:28 +0000 (UTC)
Received: (Authenticated sender: thierry.bultel@linatsea.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 02ACF240004;
 Sun, 19 Dec 2021 07:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linatsea.fr; s=gm1;
 t=1639899087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pl4rKMLfTM6dchRIv4as6bJCTSyXmZ2VUz8ySDJTYis=;
 b=HwslhW5aKva9ap7UvazUkiiSE81AE8Dy3xBULhoOFQK2WvgwAiueF2VA+mpxGw6ZN3cUR9
 NmbLMXpEYWHk0Vuva0UTAuISEo0WtQK+rQeNjmWpyKVnjduvTHDKosd00tKHjZV7cLH3Hx
 vH9UHxhhtsUJqydUBdtiX+i7/P05eFGTpNY1Ir8oJk+Sy28WDU3B2F5TX03j7DY04yQCtv
 TXFi8nMNWkJehabxajRK8ECMIU6B/fO+SPE3PwSI4Oc5eFjGl3fO7bp7Er1W8DH0mp/S8h
 zG3+Y35sCGvLwV/FgifpVzCAA5ozSA2SViWweIqxRiUDQgxa5aS1T8yNpIagow==
From: Thierry Bultel <thierry.bultel@linatsea.fr>
To: buildroot@buildroot.org
Date: Sun, 19 Dec 2021 08:31:18 +0100
Message-Id: <20211219073119.1087539-2-thierry.bultel@linatsea.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211219073119.1087539-1-thierry.bultel@linatsea.fr>
References: <20211219073119.1087539-1-thierry.bultel@linatsea.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/3] package/dracut: new host package
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
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dracut is the tool used by desktop distributions to
build initrds. In the embedded world, it can be
very usefull, too, for instance when wanting to
create an initramfs for a system recovery mode.
Whereas it is definitively possible to achieve
this with buildroot, the process is to have a
dedicated buildroot configuration for that,
and perform a full build. Instead of doing that,
the idea is to use dracut to pick the needed
binaries/shared libraries, configuration files,
or kernel modules from the 'target' directory.
The advantage is to save build time, and also
to have a consistency between the packages versions
taken for the recovery and the production filesystem.

Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
---
Changes v1 -> v2 (all suggested by Arnoult)
  - added a wrapper script
---
 package/Config.in.host           |  1 +
 package/dracut/Config.in.host    | 10 ++++++++++
 package/dracut/dracut.mk         | 28 ++++++++++++++++++++++++++++
 package/dracut/dracut_wrapper.sh | 14 ++++++++++++++
 4 files changed, 53 insertions(+)
 create mode 100644 package/dracut/Config.in.host
 create mode 100644 package/dracut/dracut.mk
 create mode 100644 package/dracut/dracut_wrapper.sh

diff --git a/package/Config.in.host b/package/Config.in.host
index 6e5a5c5fc5..72531374f4 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -14,6 +14,7 @@ menu "Host utilities"
 	source "package/cramfs/Config.in.host"
 	source "package/cryptsetup/Config.in.host"
 	source "package/dbus-python/Config.in.host"
+	source "package/dracut/Config.in.host"
 	source "package/dfu-util/Config.in.host"
 	source "package/dos2unix/Config.in.host"
 	source "package/dosfstools/Config.in.host"
diff --git a/package/dracut/Config.in.host b/package/dracut/Config.in.host
new file mode 100644
index 0000000000..074d46f623
--- /dev/null
+++ b/package/dracut/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_DRACUT
+	bool
+	select BR2_PACKAGE_HOST_KMOD
+	select BR2_PACKAGE_HOST_CROSS_LDD
+	help
+	  dracut is used to create an initramfs image by
+	  copying tools and files from an installed system
+	  and combining it with the dracut framework.
+
+	  https://dracut.wiki.kernel.org
diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
new file mode 100644
index 0000000000..ada9e1d691
--- /dev/null
+++ b/package/dracut/dracut.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# dracut
+#
+################################################################################
+
+DRACUT_VERSION = 055
+DRACUT_SOURCE = dracut-$(DRACUT_VERSION).tar.xz
+DRACUT_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/boot/dracut
+DRACUT_LICENSE = GPL-2.0
+DRACUT_LICENSE_FILES = COPYING
+
+HOST_DRACUT_DEPENDENCIES += host-pkgconf host-kmod host-cross-ldd
+
+define HOST_DRACUT_POST_INSTALL_ENABLE_FAKEROOT
+	$(SED) '/unset LD_LIBRARY_PATH/d' $(HOST_DIR)/bin/dracut
+	$(SED) '/unset LD_PRELOAD/d' $(HOST_DIR)/bin/dracut
+endef
+
+define HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
+	$(INSTALL) -D -m 0755 package/dracut/dracut_wrapper.sh \
+		$(HOST_DIR)/usr/bin/dracut_wrapper.sh
+endef
+
+HOST_DRACUT_POST_INSTALL_HOOKS+=HOST_DRACUT_POST_INSTALL_ENABLE_FAKEROOT
+HOST_DRACUT_POST_INSTALL_HOOKS+=HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
+
+$(eval $(host-autotools-package))
diff --git a/package/dracut/dracut_wrapper.sh b/package/dracut/dracut_wrapper.sh
new file mode 100644
index 0000000000..388086762c
--- /dev/null
+++ b/package/dracut/dracut_wrapper.sh
@@ -0,0 +1,14 @@
+#!/bin/bash
+
+set -e
+
+if [ -z "$*" ]; then
+    echo "No argument supplied"
+    exit
+fi
+
+DRACUT_LDD=${TARGET_CROSS}ldd \
+DRACUT_INSTALL="${HOST_DIR}/lib/dracut/dracut-install" \
+dracutbasedir=${HOST_DIR}/usr/lib/dracut \
+dracutsysrootdir=${TARGET_DIR} \
+${HOST_DIR}/bin/dracut "$@"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
