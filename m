Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AF4C433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Dec 2021 11:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2424081D47;
	Thu, 23 Dec 2021 11:14:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gwfl0gBZ_ua8; Thu, 23 Dec 2021 11:14:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27F3981D3A;
	Thu, 23 Dec 2021 11:14:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 770801BF427
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 11:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 633ED40630
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 11:14:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linatsea.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XKAntByCpUsj for <buildroot@lists.busybox.net>;
 Thu, 23 Dec 2021 11:14:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A727740145
 for <buildroot@buildroot.org>; Thu, 23 Dec 2021 11:14:04 +0000 (UTC)
Received: (Authenticated sender: thierry.bultel@linatsea.fr)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 8A28AFF80B;
 Thu, 23 Dec 2021 11:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linatsea.fr; s=gm1;
 t=1640258042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NyP/PB5tpg4z3+URjFr7dy+o2gVywuHoCzEIlSARCgE=;
 b=j/MXnz0D4O8vQG0oUvyvLBnnexewwboT6id2oyCgSWbwAGntctK1DGf8LFWoJKLS1V+Rig
 /1absAHs2eJlWqNtDvyElZ5M/G6kOFzBpVhohfPvGAQpgG1bChiNIyAVLgajEl7m09qwHf
 QBFmNGXEn0afVhtIlNwMgR/SG9jY3PGOT3E7XUVGFL1/6VmMqeMwvXVOHSHSEJPNU8leTH
 gNe4mZeDGoxIJ6FZWqWUKnLOExbBnJhA76dqFZBHssfS4ZinxF0eY8k9927fww1yjfQQ08
 5y8Pu5JkFmLFI7ESxr99NFjo/JdvbTHJ1evpvSwtBAD5k/2CTs+jHdEuW/V4iA==
From: Thierry Bultel <thierry.bultel@linatsea.fr>
To: buildroot@buildroot.org
Date: Thu, 23 Dec 2021 12:13:47 +0100
Message-Id: <20211223111348.3532601-2-thierry.bultel@linatsea.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211223111348.3532601-1-thierry.bultel@linatsea.fr>
References: <20211223111348.3532601-1-thierry.bultel@linatsea.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/3] package/dracut: new host package
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
Changes v2 -> v2
  - added modules for:
     - supporting busybox system init type
     - fixing a missing symlink for uClibc

Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
---
 package/Config.in.host                        |  1 +
 .../05busybox-buildroot/module-setup.sh       | 69 +++++++++++++++++++
 package/dracut/06uclibc/module-setup.sh       | 20 ++++++
 package/dracut/Config.in.host                 | 10 +++
 package/dracut/dracut.mk                      | 45 ++++++++++++
 package/dracut/dracut_wrapper.sh              | 15 ++++
 6 files changed, 160 insertions(+)
 create mode 100755 package/dracut/05busybox-buildroot/module-setup.sh
 create mode 100644 package/dracut/06uclibc/module-setup.sh
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
diff --git a/package/dracut/05busybox-buildroot/module-setup.sh b/package/dracut/05busybox-buildroot/module-setup.sh
new file mode 100755
index 0000000000..b227571db4
--- /dev/null
+++ b/package/dracut/05busybox-buildroot/module-setup.sh
@@ -0,0 +1,69 @@
+#!/bin/bash
+
+check() {
+	require_binaries \
+		busybox | return 1
+
+	return 0
+}
+
+depends() {
+	return 0
+}
+
+
+install_busybox_links() {
+	dir=$1
+	linkname=$2
+
+	(cd "$dracutsysrootdir"$dir &&
+	for x in *; do
+	    if [ "$(readlink "$x")" = $linkname ]; then
+	    	ln -sf $linkname $initdir/$dir/$x
+	    fi
+	done
+	)
+
+}
+
+install() {
+
+	inst_multiple /bin/busybox
+
+	# wrapper script for early console; will launch /sbin/init
+	# after having mounted devtmpfs
+	inst_multiple /init
+
+	ln -s ../bin/busybox $initdir/sbin/init
+
+	if [ -e $dracutsysrootdir/lib64 ]; then
+		ln -s lib $initdir/lib64
+		ln -s lib $initdir/usr/lib64
+	fi
+
+	if [ -e $dracutsysrootdir/lib32 ]; then
+		ln -s lib $initdir/lib32
+		ln -s lib $initdir/usr/lib32
+	fi
+	
+	install_busybox_links "/bin" "busybox"
+	install_busybox_links "/sbin" "../bin/busybox"
+	install_busybox_links "/usr/bin" "../../bin/busybox" 
+	install_busybox_links "/usr/sbin" "../../bin/busybox"
+	
+	inst_multiple \
+		/etc/inittab	\
+		/etc/init.d/rcS \
+		/etc/init.d/rcK \
+		/etc/issue	\
+		/etc/fstab	\
+		/etc/group	\
+		/etc/passwd	\
+		/etc/shadow	\
+		/etc/hostname
+	
+#	mkdir -p $initdir/etc/init.d
+#	cp -a $dracutsysrootdir/etc/init.d/* $initdir/etc/init.d
+	
+}
+
diff --git a/package/dracut/06uclibc/module-setup.sh b/package/dracut/06uclibc/module-setup.sh
new file mode 100644
index 0000000000..77e9bd864e
--- /dev/null
+++ b/package/dracut/06uclibc/module-setup.sh
@@ -0,0 +1,20 @@
+#!/bin/bash
+
+check() {
+	return 0
+}
+
+depends() {
+	return 0
+}
+
+
+
+install() {
+
+	# Despite of the fact that the listed dependency (reported by readelf -d)
+	# is purely ld-uClibc.so.1, the loader needs the ld-uClibc.so.0, too
+
+	ln -s ld-uClibc.so.1 $initdir/lib/ld-uClibc.so.0
+
+}
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
index 0000000000..6c82b4ba75
--- /dev/null
+++ b/package/dracut/dracut.mk
@@ -0,0 +1,45 @@
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
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+define HOST_DRACUT_POST_INSTALL_UCLIBC_MODULE
+	$(INSTALL) -D -m 0755 package/dracut/06uclibc/module-setup.sh \
+		$(HOST_DIR)/lib/dracut/modules.d/06uclibc/module-setup.sh
+endef
+HOST_DRACUT_POST_INSTALL_HOOKS+=HOST_DRACUT_POST_INSTALL_UCLIBC_MODULE
+endif
+
+ifeq ($(BR2_INIT_BUSYBOX),y)
+define HOST_DRACUT_POST_INSTALL_BUSYBOX_MODULE
+	$(INSTALL) -D -m 0755 package/dracut/05busybox-buildroot/module-setup.sh \
+		$(HOST_DIR)/lib/dracut/modules.d/05busybox-buildroot/module-setup.sh
+endef
+HOST_DRACUT_POST_INSTALL_HOOKS+=HOST_DRACUT_POST_INSTALL_BUSYBOX_MODULE
+
+endif
+
+HOST_DRACUT_POST_INSTALL_HOOKS+=HOST_DRACUT_POST_INSTALL_ENABLE_FAKEROOT
+HOST_DRACUT_POST_INSTALL_HOOKS+=HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
+
+$(eval $(host-autotools-package))
diff --git a/package/dracut/dracut_wrapper.sh b/package/dracut/dracut_wrapper.sh
new file mode 100644
index 0000000000..9d3db3b58e
--- /dev/null
+++ b/package/dracut/dracut_wrapper.sh
@@ -0,0 +1,15 @@
+#!/bin/bash
+
+set -e
+set -x
+
+if [ -z "$*" ]; then
+    echo "No argument supplied"
+    exit
+fi
+
+DRACUT_LDD=${TARGET_CROSS}ldd-cross \
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
