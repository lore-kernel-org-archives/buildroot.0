Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFC6C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEF1A4F27E;
	Fri, 28 Feb 2025 16:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yYg4V27hNo-b; Fri, 28 Feb 2025 16:52:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5157B4F252
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5157B4F252;
	Fri, 28 Feb 2025 16:52:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A43D68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F208D42F1C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j1gf_yh4ta7Z for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7410D429C9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7410D429C9
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B58A86612; Fri, 28 Feb 2025 16:29:58 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 Jan 2025 19:35:21 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 04a5fa5ff797de55d85db97d4dd58a73ed8c5a35
X-Git-Newrev: da9adec1491eefc618aab610615fe293899845fd
X-Patchwork-Hint: ignore
Message-Id: <20250228162958.6B58A86612@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libvirt: do not use
 'qemu' user if not defined
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=da9adec1491eefc618aab610615fe293899845fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit ed12e2fbed3d (package/libvirt: add lxc and qemu options)
introduced the definition of the 'qemu' user when the libvirt daemon
is enabled, but unconditionally uses that user in its permissions
table.

When enabling libvirt without its qemu support, for example with the
commands:

    cat <<EOF >.config
    BR2_aarch64=y
    BR2_PACKAGE_LIBVIRT=y
    BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
    BR2_TARGET_ROOTFS_EXT2=y
    BR2_TOOLCHAIN_EXTERNAL=y
    EOF
    make olddefconfig
    make

The build fails with output:

    >>>   Generating filesystem image rootfs.ext2
    ...
    makedevs: unknown user name: qemu

Move the permissions needing the 'qemu' user under the same condition
the 'qemu' user is defined under. It means that a few permissions
needing root must also be moved, as they belong under a directory
needing the 'qemu' user. It also moves a few qemu-related permissions
introduced in that same commit. The list of qemu permissions is
reordered alphabetically (the others are left unchanged).

Of course, it also requires that the qemu-related directory and symlink
be moved under the same condition as well.

Reported-by: Alessandro <alex@0x65c.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Jared Bents <jared.bents@rockwellcollins.com>
[Julien: add the commands to reproduce the issue]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libvirt/libvirt.mk | 54 +++++++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 22 deletions(-)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 1dc61a7549..7f2a33e926 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -250,6 +250,36 @@ define LIBVIRT_INSTALL_UDEV_RULES
 endef
 LIBVIRT_POST_INSTALL_TARGET_HOOKS += LIBVIRT_INSTALL_UDEV_RULES
 
+ifeq ($(BR2_PACKAGE_LIBVIRT_QEMU),y)
+define LIBVIRT_USERS_QEMU
+	qemu -1 kvm -1 * - - - Libvirt qemu/kvm daemon
+endef
+define LIBVIRT_PERMISSIONS_QEMU
+	/var/cache/libvirt/qemu                  d  750  qemu  kvm   -  -  -  -  -
+	/var/cache/libvirt/qemu/capabilities     d  755  root  root  -  -  -  -  -
+	/var/lib/libvirt/qemu                    d  751  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/autostart          d  700  root  root  -  -  -  -  -
+	/var/lib/libvirt/qemu/channel            d  755  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/channel/target     d  755  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/dump               d  755  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/networks           d  700  root  root  -  -  -  -  -
+	/var/lib/libvirt/qemu/networks/autostart d  700  root  root  -  -  -  -  -
+	/var/lib/libvirt/qemu/nvram              d  755  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/save               d  755  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/snapshot           d  755  qemu  kvm   -  -  -  -  -
+	/var/log/libvirt/qemu                    d  750  root  root  -  -  -  -  -
+	/var/log/swtpm/libvirt/qemu              d  711  root  root  -  -  -  -  -
+endef
+define LIBVIRT_CREATE_SYMLINKS_QEMU
+	$(INSTALL) -m 751 -d $(TARGET_DIR)/var/lib/libvirt/qemu
+	ln -s -f ../../var/lib/libvirt/qemu $(TARGET_DIR)/etc/libvirt/
+endef
+endif
+
+define LIBVIRT_USERS
+	$(LIBVIRT_USERS_QEMU)
+endef
+
 # Adjust directory ownerships and permissions. Notice /var/log is a symlink to
 # /tmp in the default sysvinit skeleton, so some directories may disappear at
 # run-time. Set the permissions anyway, since they are valid for the default
@@ -263,29 +293,16 @@ define LIBVIRT_PERMISSIONS
 	/var/lib/libvirt/filesystems             d  711  root  root  -  -  -  -  -
 	/var/lib/libvirt/images                  d  711  root  root  -  -  -  -  -
 	/var/lib/libvirt/network                 d  700  root  root  -  -  -  -  -
-	/var/lib/libvirt/qemu                    d  751  qemu  kvm   -  -  -  -  -
-	/var/lib/libvirt/qemu/autostart          d  700  root  root  -  -  -  -  -
-	/var/lib/libvirt/qemu/networks           d  700  root  root  -  -  -  -  -
-	/var/lib/libvirt/qemu/networks/autostart d  700  root  root  -  -  -  -  -
-	/var/lib/libvirt/qemu/channel            d  755  qemu  kvm   -  -  -  -  -
-	/var/lib/libvirt/qemu/channel/target     d  755  qemu  kvm   -  -  -  -  -
-	/var/lib/libvirt/qemu/dump               d  755  qemu  kvm   -  -  -  -  -
-	/var/lib/libvirt/qemu/nvram              d  755  qemu  kvm   -  -  -  -  -
-	/var/lib/libvirt/qemu/save               d  755  qemu  kvm   -  -  -  -  -
-	/var/lib/libvirt/qemu/snapshot           d  755  qemu  kvm   -  -  -  -  -
 	/var/lib/libvirt/secrets                 d  700  root  root  -  -  -  -  -
 	/var/lib/libvirt/storage                 d  755  root  root  -  -  -  -  -
 	/var/lib/libvirt/storage/autostart       d  755  root  root  -  -  -  -  -
 	/var/cache/libvirt                       d  711  root  root  -  -  -  -  -
 	/var/cache/libvirt/lxc                   d  750  root  root  -  -  -  -  -
-	/var/cache/libvirt/qemu                  d  750  qemu  kvm   -  -  -  -  -
-	/var/cache/libvirt/qemu/capabilities     d  755  root  root  -  -  -  -  -
 	/var/log/libvirt                         d  700  root  root  -  -  -  -  -
 	/var/log/libvirt/lxc                     d  750  root  root  -  -  -  -  -
-	/var/log/libvirt/qemu                    d  750  root  root  -  -  -  -  -
 	/var/log/swtpm                           d  755  root  root  -  -  -  -  -
 	/var/log/swtpm/libvirt                   d  755  root  root  -  -  -  -  -
-	/var/log/swtpm/libvirt/qemu              d  711  root  root  -  -  -  -  -
+	$(LIBVIRT_PERMISSIONS_QEMU)
 endef
 
 # libvirt may need to create persistent files (e.g. VM definitions) in these
@@ -296,22 +313,15 @@ endef
 define LIBVIRT_CREATE_SYMLINKS
 	$(INSTALL) -m 700 -d $(TARGET_DIR)/etc/libvirt
 	$(INSTALL) -m 755 -d $(TARGET_DIR)/var/lib/libvirt
-	$(INSTALL) -m 751 -d $(TARGET_DIR)/var/lib/libvirt/qemu
 	$(INSTALL) -m 700 -d $(TARGET_DIR)/var/lib/libvirt/secrets
 	$(INSTALL) -m 755 -d $(TARGET_DIR)/var/lib/libvirt/storage
-	ln -s -f ../../var/lib/libvirt/qemu $(TARGET_DIR)/etc/libvirt/
 	ln -s -f ../../var/lib/libvirt/secrets $(TARGET_DIR)/etc/libvirt/
 	ln -s -f ../../var/lib/libvirt/storage $(TARGET_DIR)/etc/libvirt/
+	$(LIBVIRT_CREATE_SYMLINKS_QEMU)
 endef
 
 LIBVIRT_PRE_INSTALL_TARGET_HOOKS += LIBVIRT_CREATE_SYMLINKS
 
-ifeq ($(BR2_PACKAGE_LIBVIRT_QEMU),y)
-define LIBVIRT_USERS
-	qemu -1 kvm -1 * - - - Libvirt qemu/kvm daemon
-endef
-endif
-
 ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON),y)
 define LIBVIRT_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/libvirt/S91virtlogd $(TARGET_DIR)/etc/init.d/S91virtlogd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
