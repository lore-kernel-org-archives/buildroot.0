Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1596BC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1A4283252;
	Mon, 20 Feb 2023 23:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1A4283252
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CLCX9sijR4Sk; Mon, 20 Feb 2023 23:16:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFDF2831AE;
	Mon, 20 Feb 2023 23:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFDF2831AE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E67C21BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 596D76137D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 596D76137D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YMwcyvcjamen for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B060612DE
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B060612DE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37D0681979; Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 22 Dec 2022 11:07:59 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0245d30e569cc88875f7ed5b162029064128e89e
X-Git-Newrev: 3f79611b3037cf505f00cc67011626deb4d8f5b8
X-Patchwork-Hint: ignore
Message-Id: <20230220205214.37D0681979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] system: add options for /var
 factory and tmpfiles pre-seed
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
Content-Type: multipart/mixed; boundary="===============5611510309992808913=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5611510309992808913==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3f79611b3037cf505f00cc67011626deb4d8f5b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently, when one does not enable remounting the rootfs read-write,
i.e. keep it read-only, for example because the filesystem is actually
read-only by design, like squashfs, then two things happen:

  - we create a factory from the content of /var at build time, register
    tmpfiles entries for it, and mount a tmpfs on /var at runtime, so
    that systemd-tmpfiles does populate /var from the factory; this is
    only done when the rootfs is not remounted r/w;

  - we trigger systemd-tmpfiles at build time, which uses the tmpfiles
    db, of which our /var entries, to pre-populate the filesystem; this
    is always done, whether the rootfs is remounted r/w or not.

Note that Buildroot mounts a tmpfs on /var, and leaves to the integrator
to care for providing an actual filesystem, as there are too many
variants and is very specific to each use-case.

These two mechanisms are conflicting, semantically, but also
technically: the files from the factory will be duplicated, but that
may help in some situations when the actual /var filesystem is not
mountable.

In some cases, it might be preferable to have none, either, or both
mechanisms enabled; it highly depends on the ultimate integration scheme
chosen for a device.

For example, some people will be very happy with a /var that is actually
on a tmpfs and that it gets reseeded form scratch at every boot, while
others may want to ensure that their system continue to work even when
they can't mount something that makes /var writable.

YMMV, as they used to say back in the day...

So, we introduce two new options, in the system sub-menu, each to drive
each mechanism. We default those options to y, to keep the previous
behaviour by default, except the var factory is only available when the
rootfs is not remounted r/w, as it were so far.

We still hint in the help text that there might be some conflict between
the two mechanisms, but since it has been that way for some time, it
does not look too broken for most people.

Since that introduces more options related to systemd being chosen as an
init system, we gather those two options and the existing one inside a
if-endif block, rather than adding more 'depends on' on each options.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Norbert Lange <nolange79@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Romain Naour <romain.naour@smile.fr>
Cc: Jérémy Rosen <jeremy.rosen@smile.fr>
Cc: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../skeleton-init-systemd/skeleton-init-systemd.mk |  7 ++--
 system/Config.in                                   | 42 +++++++++++++++++++++-
 2 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
index 559a169aee..30783dfd26 100644
--- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
+++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
@@ -32,6 +32,7 @@ define SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW
 	echo "/dev/root / auto ro 0 1" >$(TARGET_DIR)/etc/fstab
 endef
 
+ifeq ($(BR2_INIT_SYSTEMD_VAR_FACTORY),y)
 define SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR
 	rm -rf $(TARGET_DIR)/usr/share/factory/var
 	mv $(TARGET_DIR)/var $(TARGET_DIR)/usr/share/factory/var
@@ -55,14 +56,16 @@ define SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR
 		$(TARGET_DIR)/usr/lib/systemd/system/var.mount
 endef
 SKELETON_INIT_SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR
+endif  # BR2_INIT_SYSTEMD_VAR_FACTORY
+endif  # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 
-endif
-
+ifeq ($(BR2_INIT_SYSTEMD_POPULATE_TMPFILES),y)
 define SKELETON_INIT_SYSTEMD_CREATE_TMPFILES_HOOK
 	HOST_SYSTEMD_TMPFILES=$(HOST_DIR)/bin/systemd-tmpfiles \
 		$(SKELETON_INIT_SYSTEMD_PKGDIR)/fakeroot_tmpfiles.sh $(TARGET_DIR)
 endef
 SKELETON_INIT_SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SKELETON_INIT_SYSTEMD_CREATE_TMPFILES_HOOK
+endif  # BR2_INIT_SYSTEMD_POPULATE_TMPFILES
 
 define SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/home
diff --git a/system/Config.in b/system/Config.in
index 888c24ce81..806a747315 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -154,10 +154,48 @@ source "$BR2_BASE_DIR/.br2-external.in.init"
 
 endchoice
 
+if BR2_INIT_SYSTEMD
+
+config BR2_INIT_SYSTEMD_VAR_FACTORY
+	bool "build a factory to populate a tmpfs on /var"
+	default y  # legacy
+	depends on !BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
+	help
+	  Build a factory of the content of /var as installed by
+	  packages, mount a tmpfs on /var at runtime, so that
+	  systemd-tmpfiles can populate it from the factory.
+
+	  This may help on a read-only rootfs.
+
+	  It probably does not play very well with triggering a call
+	  to systemd-tmpfiles at build time (below).
+
+	  Note: Buildroot mounts a tmpfs on /var to at least make the
+	  system bootable out of the box; mounting a filesystem from
+	  actual storage is left to the integration, as it is too
+	  specific and may need preparatory work like partitionning a
+	  device and/or formatting a filesystem first, so that falls
+	  out of the scope of Buildroot.
+
+	  To use persistent storage, provide a systemd dropin for the
+	  var.mount unit, that overrides the What and Type, and possibly
+	  the Options and After, fields.
+
+config BR2_INIT_SYSTEMD_POPULATE_TMPFILES
+	bool "trigger systemd-tmpfiles during build"
+	default y  # legacy
+	help
+	  Act on the systemd-tmpfiles.d database at build time, when
+	  assembling the root filesystems.
+
+	  This may help on a read-only filesystem.
+
+	  It probably does not play very well with the /var factory
+	  (above).
+
 config BR2_PACKAGE_SYSTEMD_DEFAULT_TARGET
 	string "The default unit systemd starts at bootup"
 	default "multi-user.target"
-	depends on BR2_INIT_SYSTEMD
 	help
 	  Specify the name of the unit configuration file to be started
 	  at bootup by systemd. Should end in ".target".
@@ -165,6 +203,8 @@ config BR2_PACKAGE_SYSTEMD_DEFAULT_TARGET
 
 	  https://www.freedesktop.org/software/systemd/man/systemd.special.html#default.target
 
+endif # BR2_INIT_SYSTEMD
+
 choice
 	prompt "/dev management" if !BR2_INIT_SYSTEMD
 	default BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS

--===============5611510309992808913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5611510309992808913==--
