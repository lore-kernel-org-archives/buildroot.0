Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B40C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 12:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EC9840502;
	Mon, 10 Jan 2022 12:56:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hQZAhQkJcucJ; Mon, 10 Jan 2022 12:56:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD6A1405B3;
	Mon, 10 Jan 2022 12:56:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A338B1BF275
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 12:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F122812B9
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 12:56:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linatsea.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nw51rkbSxacl for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 12:56:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DBAA812B8
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 12:56:51 +0000 (UTC)
Received: from relay11.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::231])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id F2585CD8D5
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 12:48:33 +0000 (UTC)
Received: (Authenticated sender: thierry.bultel@linatsea.fr)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id DFC1D100004;
 Mon, 10 Jan 2022 12:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linatsea.fr; s=gm1;
 t=1641818909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=66d9F0ygtRGkZcNWfy1MYaqEFkIEHvBrvCnmc7WrHAw=;
 b=k8CTSiMyxejPZY7r5KfMds+a8ZmniB+7Ens2aWDEVpaQM00FpLrb8wGEZEbfSLV1YwzjpS
 DOXVLoj4JSElO3k79ET4BEWqwSmKj08J8t+llUKfGUnoK6+vdf62QATZozcgPl7oEJfjfV
 3zETwPYmZ6CDhoGXgLWm9Ok4nMueJNRAXIKYOWp4n9+0DlP4c9UtT0nzpGzdtZmAl+LKU/
 4kgfWp+mqus7bgV/cyVzXlXRww/C0Od8MhaWAh4GeLwF+wP4+3qT8dMJ/IXeHnU5z092JD
 p0Vy1f5AK8B9qZaOcufzkn6oss2smA/P4BTFNd5vFKlVOT/Hqlw8fW2tj0wNOg==
From: Thierry Bultel <thierry.bultel@linatsea.fr>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 13:46:43 +0100
Message-Id: <20220110124644.1388438-2-thierry.bultel@linatsea.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220110124644.1388438-1-thierry.bultel@linatsea.fr>
References: <20220110124644.1388438-1-thierry.bultel@linatsea.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 2/3] package/dracut: new host package
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

Dracut is the tool used by desktop distributions to build initrds.

In the embedded world, it can be very usefull, too, for instance when
wanting to create an initramfs for a system recovery mode.
Whereas it is definitively possible to achieve this with buildroot, the
process is to have a dedicated buildroot configuration for that, and
perform a full build. Instead of doing that, the idea is to use dracut
to pick the needed binaries/shared libraries, configuration files, or
kernel modules from the 'target' directory.
The advantage is to save build time, and also to have a consistency
between the packages versions taken for the recovery and the production
filesystem.

The principle of dracut is based on the so-called 'dracut modules'
On the host, they are on host/lib/dracut/modules.d
Each directory as a prefix number for the order of execution, and
at least a "module-setup.sh" script.

Dracut sources all of them, and typically calls the "check()" function,
which is the placeholder for required binaries (that are aimed to be
polulated in the initrd), then the "depends()" function, that lists
other modules to depend on, and the "install()" function, that makes
the actual work.

Dracut was initially thought to work with systems using systemd,
but it can also work without it. Do to so, every "systemd-xxx"
modules must be disabled in the dracut configuration file. For
convenience, the 05busybox-buildroot module is provided, to support
busybox init system.

Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
---
Changes v1 -> v2 (all suggested by Arnoult)
  - added a wrapper script
Changes v2 -> v3
  - added modules for:
     - supporting busybox system init type
     - fixing a missing symlink for uClibc
Changes v3 -> v4
     - some explanations on the dracut modules in the commit log
     - fixed a bug on the 'require_binary' line in busybox module
     - expanded variables with double quotes and curly braces
     - removed commented out code
     - fixes for 'fakeroot' and 'uclibc' and 'musl' as patches
     - musl and uclibc dynamic fix
     - renamed dracut wrapper
     - disabled when using another init system than systemd or busybox

Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
---
 package/Config.in.host                        |  1 +
 package/dracut/0000-enable-fakeroot.patch     | 12 ++++
 ...01-add-a-module-to-fix-libc-ld-links.patch | 56 +++++++++++++++++
 .../05busybox-buildroot/module-setup.sh       | 60 +++++++++++++++++++
 package/dracut/Config.in.host                 | 10 ++++
 package/dracut/dracut                         |  2 +-
 package/dracut/dracut.mk                      | 41 +++++++++++++
 package/dracut/dracut_wrapper.sh              | 15 +++++
 8 files changed, 196 insertions(+), 1 deletion(-)
 create mode 100644 package/dracut/0000-enable-fakeroot.patch
 create mode 100644 package/dracut/0001-add-a-module-to-fix-libc-ld-links.patch
 create mode 100644 package/dracut/05busybox-buildroot/module-setup.sh
 create mode 100644 package/dracut/Config.in.host
 create mode 100644 package/dracut/dracut.mk
 create mode 100644 package/dracut/dracut_wrapper.sh

diff --git a/package/Config.in.host b/package/Config.in.host
index b3e00bb482..caa28262be 100644
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
diff --git a/package/dracut/0000-enable-fakeroot.patch b/package/dracut/0000-enable-fakeroot.patch
new file mode 100644
index 0000000000..e148485135
--- /dev/null
+++ b/package/dracut/0000-enable-fakeroot.patch
@@ -0,0 +1,12 @@
+diff -purN host-dracut-055.orig/dracut.sh host-dracut-055/dracut.sh
+--- host-dracut-055.orig/dracut.sh	2021-05-27 12:34:19.000000000 +0000
++++ host-dracut-055/dracut.sh	2022-01-06 14:17:57.022317138 +0000
+@@ -868,8 +868,6 @@ export LC_ALL=C
+ export LANG=C
+ unset LC_MESSAGES
+ unset LC_CTYPE
+-unset LD_LIBRARY_PATH
+-unset LD_PRELOAD
+ unset GREP_OPTIONS
+ 
+ export DRACUT_LOG_LEVEL=warning
diff --git a/package/dracut/0001-add-a-module-to-fix-libc-ld-links.patch b/package/dracut/0001-add-a-module-to-fix-libc-ld-links.patch
new file mode 100644
index 0000000000..ad5e97b34a
--- /dev/null
+++ b/package/dracut/0001-add-a-module-to-fix-libc-ld-links.patch
@@ -0,0 +1,56 @@
+From 2c0188164223563adfce4852faa83d2553bee367 Mon Sep 17 00:00:00 2001
+From: Thierry Bultel <thierry.bultel@linatsea.fr>
+Date: Mon, 10 Jan 2022 09:09:43 +0100
+Subject: [PATCH] add a module to fix libc ld links
+
+When using uClibc or musl, there must
+be "ls-uClibc.so.1" or "ld-musl-x.so" symlinks,
+respectively (else the init process cannot
+start)
+
+Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
+---
+ modules.d/05libc-links/module-setup.sh | 31 ++++++++++++++++++++++++++
+ 1 file changed, 31 insertions(+)
+ create mode 100755 modules.d/05libc-links/module-setup.sh
+
+diff --git a/modules.d/05libc-links/module-setup.sh b/modules.d/05libc-links/module-setup.sh
+new file mode 100755
+index 00000000..249bb80c
+--- /dev/null
++++ b/modules.d/05libc-links/module-setup.sh
+@@ -0,0 +1,31 @@
++#!/bin/bash
++
++# Adds the missing links for uClibc or musl, if needed
++
++check() {
++	return 0
++}
++
++depends() {
++	return 0
++}
++
++install() {
++
++	# Despite of the fact that the listed dependency (reported by readelf -d)
++	# is purely /lib/libc.so, the musl symlink is needed anyway.
++
++	musl_link=$(find "${dracutsysrootdir}"/lib -name "ld-musl-*.so*")
++	if [ $? -eq 0 ] ; then
++		ln -s /lib/libc.so ${initdir}/lib/`basename "${musl_link}"`
++	fi
++
++	# Same for uClibc, the listed dependency
++	# is ld-uClibc.so.1, the loader needs the ld-uClibc.so.0, too
++
++	uclibc_link = $(find "${dracutsysrootdir}"/lib -name "ld-uClibc-*.so*")
++	if [ $? -eq 0 ] ; then
++		ln -s ld-uClibc.so.1 "${initdir}"/`basename "${uclibc_link}"`
++	fi
++	
++}
+-- 
+2.25.1
+
diff --git a/package/dracut/05busybox-buildroot/module-setup.sh b/package/dracut/05busybox-buildroot/module-setup.sh
new file mode 100644
index 0000000000..ab4e0a5c50
--- /dev/null
+++ b/package/dracut/05busybox-buildroot/module-setup.sh
@@ -0,0 +1,60 @@
+#!/bin/bash
+
+check() {
+	require_binaries busybox || return 1
+	return 0
+}
+
+depends() {
+	return 0
+}
+
+install_busybox_links() {
+	dir=$1
+	linkname=$2
+
+	(cd "${dracutsysrootdir}${dir}" &&
+	for x in *; do
+		if [ "$(readlink "$x")" = "${linkname}" ]; then
+			ln -sf "${linkname}" "${initdir}/${dir}/$x"
+		fi
+	done
+	)
+}
+
+install() {
+	inst_multiple /bin/busybox
+
+	# wrapper script for early console; will launch /sbin/init
+	# after having mounted devtmpfs
+	inst_multiple /init
+
+	ln -s ../bin/busybox "${initdir}"/sbin/init
+
+	if [ -e "${dracutsysrootdir}/lib64" ]; then
+		ln -s lib "${initdir}/lib64"
+		ln -s lib "${initdir}/usr/lib64"
+	fi
+
+	if [ -e "${dracutsysrootdir}/lib32" ]; then
+		ln -s lib "${initdir}/lib32"
+		ln -s lib "${initdir}/usr/lib32"
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
+}
+
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
diff --git a/package/dracut/dracut b/package/dracut/dracut
index 9d3db3b58e..eb15ea9abd 100644
--- a/package/dracut/dracut
+++ b/package/dracut/dracut
@@ -8,7 +8,7 @@ if [ -z "$*" ]; then
     exit
 fi
 
-DRACUT_LDD=${TARGET_CROSS}ldd-cross \
+DRACUT_LDD=${TARGET_CROSS}ldd-buildroot \
 DRACUT_INSTALL="${HOST_DIR}/lib/dracut/dracut-install" \
 dracutbasedir=${HOST_DIR}/usr/lib/dracut \
 dracutsysrootdir=${TARGET_DIR} \
diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
new file mode 100644
index 0000000000..5a9e154ccc
--- /dev/null
+++ b/package/dracut/dracut.mk
@@ -0,0 +1,41 @@
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
+HOST_DRACUT_DEPENDENCIES = host-pkgconf host-kmod host-cross-ldd
+
+define HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
+	$(INSTALL) -D -m 0755 package/dracut/dracut \
+		$(HOST_DIR)/sbin/dracut
+endef
+HOST_DRACUT_POST_INSTALL_HOOKS += HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
+
+
+# Dracut does not support busybox init (systemd init is assumed to work
+# out of the box, though). It provides a busybox module, that does not
+# use the same paths as buildroot, and is not meant to be used as an init
+# system.
+# So it is simplier for users to disable the standard 'busybox' module in
+# the configuration file, and enable the "busybox-buildroot' module
+# instead.
+# Notice that setting the script as executable (0755) is not mandatory,
+# but this is what dracut does on all its modules, so lets just conform
+# to it.
+
+ifeq ($(BR2_INIT_BUSYBOX),y)
+define HOST_DRACUT_POST_INSTALL_BUSYBOX_MODULE
+	$(INSTALL) -D -m 0755 package/dracut/05busybox-buildroot/module-setup.sh \
+		$(HOST_DIR)/lib/dracut/modules.d/05busybox-buildroot/module-setup.sh
+endef
+HOST_DRACUT_POST_INSTALL_HOOKS += HOST_DRACUT_POST_INSTALL_BUSYBOX_MODULE
+endif
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
