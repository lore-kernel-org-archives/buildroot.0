Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16236E95A67
	for <buildroot@archiver.kernel.org>; Sun,  8 Oct 2023 18:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FBA341743;
	Sun,  8 Oct 2023 18:30:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FBA341743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k3gv5tzUa424; Sun,  8 Oct 2023 18:30:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B9C5417BF;
	Sun,  8 Oct 2023 18:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B9C5417BF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 20C3D1BF3AD
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 18:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDC1A40853
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 18:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDC1A40853
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1KiyA-9taIpS for <buildroot@lists.busybox.net>;
 Sun,  8 Oct 2023 18:29:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EAB5403CC
 for <buildroot@buildroot.org>; Sun,  8 Oct 2023 18:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EAB5403CC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19FAC843A9; Sun,  8 Oct 2023 18:29:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 8 Oct 2023 20:12:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c185a42fdad1b48f61286edf65421818d43fd79
X-Git-Newrev: 10c637ab06d935bbce4c833c4ab9695cdb32b6c8
X-Patchwork-Hint: ignore
Message-Id: <20231008182952.19FAC843A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skeleton-init-systemd: add option
 to use overlayfs on /var
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7207371032097533833=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7207371032097533833==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=10c637ab06d935bbce4c833c4ab9695cdb32b6c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Systemd requires /var to be writeable [1]. With read-only rootfs, we
need a solution that makes sure /var is writeable. We already have a
solution using a factory, with systemd-tmpfiles. This approach has a few
limitations:

- The behaviour of what happens when the rootfs is updated and the
  contents of the factory /var changes are not very intuitive.

- systemd-tmpfiles is not started super early in the boot, so there's a
  relatively long time that /var is not writeable. There is also no easy
  way in systemd to express dependencies on the subdirectories of /var
  to have been populated from the factory.

- The contents of /var is duplicated. If it is big, the rootfs size
  increases unnecessarily and it takes a long time before the copying is
  done. This is also not done atomically.

This commit adds an alternative using an overlay filesystem that has the
following characteristics:

-   Don't depend on anything being available, except the
    API File Systems [2]. In other words, this can be done very early in
    the boot process. This is useful because /var is meant to be
    available before normal and even some early services are running.

-   Be a clean drop-in, that can be trivially added / removed.

-   Make sure that overlayfs is available in the kernel.

-   Units are (partially) reusable for custom solutions. This goal is
    actually not fully reached yet: for that the service file should be
    converted into a template, and the mount unit should use a specifier
    for all repeated references to /var.

Mounting the overlay is slightly acrobatic and requires a few steps:

- First, we have to make sure the directories for overlayfs's upper,
  lower and work directories are available on a tmpfs. Note that
  "upper" and "work" must be on the same filesystem.

- The writeable overlay upper directory must be mounted.

- The original contents of /var must be bind-mounted to the overlay
  lower directory.

- Finally, the overlay must be mounted on /var.

For the overlayfs directories, we create a tree on /run. Since there is
no standard name convention for this, we create a new directory
"/run/buildroot" with subdirectory "mounts" for everything
mount-related. Below that, a subdirectory is created for every mount
point that needs helper directories. Thus, we arrive to
/run/buildroot/mounts/var as the base directory for the overlay. Below
this, the directories lower, upper and work are created.

The bind-mount of /var is done in the same service as the one creating
the overlay lower, upper and work directories. Creating those
directories can't be done in a mount unit, and bind-mounting /var in a
mount unit would create a circular dependency. Indeed, if we had a mount
unit to do the bind mount, then it sould look like:
    # run-buildroot-mounts-var-lower.mount
    [Mount]
    What=/var
    Where=/run/buildroot/mounts/var/lower
    Options=bind

and then the var.mount unit would need to have a dependency on that
unit:
    # var.mount
    [Unit]
    After=run-buildroot-mounts-var-lower.mount
    [Mount]
    Where=/var

However, the What=/var of the first unit automatically adds an implicit
dependency on /var, and since there is a unit providing Where=/var, we
would have run-buildroot-mounts-var-lower.mount depend on var.mount, but
we need var.mount to depend on run-buildroot-mounts-var-lower.mount, so
this is a circular dependency. There is no way to tell systemd no to add
the implicit dependency. So we do the bind mont manually in the service
unit that prepares the overlay structure.

For the writeable upper layer, we don't need to do anything. In the
default configuration, the upper layer is supposed to be a tmpfs, and
/run/buildroot/mounts/var/upper is already a tmpfs so it can serve as
is. To make it persistent, we suggest to the user to mount a writeable,
persistent filesystem on /run/buildroot/mounts/var. The
RequiresMountsFor dependency in the prepare-var-overlay service makes
sure that that mount is performed before the overlay is started. Using
/run/buildroot/mounts/var/upper as the mount point sounds more logical
at first, but since the work directory is supposed to be on the same
filesystem as the upper directory, this wouldn't work very well.

As example, consider using /dev/sdc1 as upper layer for var, this can be
achieved by adding the following line to fstab:

/dev/sdc1	/run/buildroot/mounts/var	ext4	defaults

Systemd will convert this into a mount unit with all the proper
dependencies.

Norbert provided some systemd units as a starting point, and that was
quite a huge help in understanding how to fit all those things together.

[1] - https://www.freedesktop.org/wiki/Software/systemd/APIFileSystems/

Co-authored-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Norbert Lange <nolange79@gmail.com>
Cc: Romain Naour <romain.naour@smile.fr>
Cc: Jérémy Rosen <jeremy.rosen@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
[Arnout:
 - Merge commit messages from Yann and from Norbert.
 - Remove the run-buildroot-mounts-var.mount unit; instead, just reuse
   the existing tmpfs for the upper layer in the default case.
 - Update the help text to explain how to mount a custom upper layer
   with fstab.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../skeleton-init-systemd/{ => factory}/var.mount  |  0
 .../overlayfs/prepare-var-overlay.service          | 19 ++++++++++++++++
 package/skeleton-init-systemd/overlayfs/var.mount  | 14 ++++++++++++
 .../skeleton-init-systemd/skeleton-init-systemd.mk | 25 ++++++++++++++++++---
 system/Config.in                                   | 26 ++++++++++++++++------
 5 files changed, 74 insertions(+), 10 deletions(-)

diff --git a/package/skeleton-init-systemd/var.mount b/package/skeleton-init-systemd/factory/var.mount
similarity index 100%
rename from package/skeleton-init-systemd/var.mount
rename to package/skeleton-init-systemd/factory/var.mount
diff --git a/package/skeleton-init-systemd/overlayfs/prepare-var-overlay.service b/package/skeleton-init-systemd/overlayfs/prepare-var-overlay.service
new file mode 100644
index 0000000000..281aa0efb5
--- /dev/null
+++ b/package/skeleton-init-systemd/overlayfs/prepare-var-overlay.service
@@ -0,0 +1,19 @@
+[Unit]
+Description=Variable storage overlay setup
+ConditionPathIsSymbolicLink=!/var
+DefaultDependencies=no
+RequiresMountsFor=/run/buildroot/mounts/var
+
+[Service]
+Type=oneshot
+RemainAfterExit=yes
+ExecStart=/usr/bin/mkdir -p /run/buildroot/mounts/var/lower /run/buildroot/mounts/var/upper /run/buildroot/mounts/var/work
+
+# Ideally, we would like to use a systemd mount unit to manage the bind
+# mount. Unfortunately, that creates a circular dependency: such a unit
+# would have What=/var while var.mount has Where=/var so that introduces
+# an implicit dependency from that unit to var.mount, but var.mount
+# would have an explicit dependency to be ordered after that unit.
+# So we handle the bind mount manually.
+ExecStart=/usr/bin/mount -n -o bind,private /var /run/buildroot/mounts/var/lower
+ExecStop=/usr/bin/umount -l /run/buildroot/mounts/var/lower
diff --git a/package/skeleton-init-systemd/overlayfs/var.mount b/package/skeleton-init-systemd/overlayfs/var.mount
new file mode 100644
index 0000000000..812e6ce7bf
--- /dev/null
+++ b/package/skeleton-init-systemd/overlayfs/var.mount
@@ -0,0 +1,14 @@
+[Unit]
+Description=Variable storage overlay
+Documentation=man:file-hierarchy(7)
+ConditionPathIsSymbolicLink=!/var
+DefaultDependencies=no
+After=prepare-var-overlay.service
+BindsTo=prepare-var-overlay.service
+
+[Mount]
+What=overlay_var
+Where=/var
+Type=overlay
+Options=lowerdir=/run/buildroot/mounts/var/lower,upperdir=/run/buildroot/mounts/var/upper,workdir=/run/buildroot/mounts/var/work,redirect_dir=on,index=on,xino=on
+LazyUnmount=true
diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
index fb15552f99..b312fe33e4 100644
--- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
+++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
@@ -33,7 +33,7 @@ endef
 # a real (but empty) directory, and the "factory files" will be copied
 # back there by the tmpfiles.d mechanism.
 ifeq ($(BR2_INIT_SYSTEMD_VAR_FACTORY),y)
-define SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR
+define SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR_FACTORY
 	rm -rf $(TARGET_DIR)/usr/share/factory/var
 	mv $(TARGET_DIR)/var $(TARGET_DIR)/usr/share/factory/var
 	mkdir -p $(TARGET_DIR)/var
@@ -52,11 +52,30 @@ define SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR
 			|| exit 1; \
 		fi; \
 	done >$(TARGET_DIR)/usr/lib/tmpfiles.d/00-buildroot-var.conf
-	$(INSTALL) -D -m 0644 $(SKELETON_INIT_SYSTEMD_PKGDIR)/var.mount \
+	$(INSTALL) -D -m 0644 $(SKELETON_INIT_SYSTEMD_PKGDIR)/factory/var.mount \
 		$(TARGET_DIR)/usr/lib/systemd/system/var.mount
 endef
-SKELETON_INIT_SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR
+SKELETON_INIT_SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR_FACTORY
 endif  # BR2_INIT_SYSTEMD_VAR_FACTORY
+
+ifeq ($(BR2_INIT_SYSTEMD_VAR_OVERLAYFS),y)
+
+define SKELETON_INIT_SYSTEMD_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_OVERLAY_FS)
+endef
+
+define SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR_OVERLAYFS
+	$(INSTALL) -D -m 0644 \
+		$(SKELETON_INIT_SYSTEMD_PKGDIR)/overlayfs/prepare-var-overlay.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/prepare-var-overlay.service
+	$(INSTALL) -D -m 0644 \
+		$(SKELETON_INIT_SYSTEMD_PKGDIR)/overlayfs/var.mount \
+		$(TARGET_DIR)/usr/lib/systemd/system/var.mount
+endef
+SKELETON_INIT_SYSTEMD_POST_INSTALL_TARGET_HOOKS += SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR_OVERLAYFS
+
+endif  # BR2_INIT_SYSTEMD_VAR_OVERLAYFS
+
 endif  # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 
 ifeq ($(BR2_INIT_SYSTEMD_POPULATE_TMPFILES),y)
diff --git a/system/Config.in b/system/Config.in
index c017d3797a..25485c2486 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -167,6 +167,14 @@ choice
 	  Select how Buildroot provides a read-write /var when the
 	  rootfs is not remounted read-write.
 
+	  Note: Buildroot uses a tmpfs, either as a mount point or as
+	  the upper of an overlayfs, so as to at least make the system
+	  bootable out of the box; mounting a filesystem from actual
+	  storage is left to the integration, as it is too specific and
+	  may need preparatory work like partitionning a device and/or
+	  formatting a filesystem first, which falls out of the scope
+	  of Buildroot.
+
 config BR2_INIT_SYSTEMD_VAR_FACTORY
 	bool "build a factory to populate a tmpfs"
 	help
@@ -179,17 +187,21 @@ config BR2_INIT_SYSTEMD_VAR_FACTORY
 	  It probably does not play very well with triggering a call
 	  to systemd-tmpfiles at build time (below).
 
-	  Note: Buildroot mounts a tmpfs on /var to at least make the
-	  system bootable out of the box; mounting a filesystem from
-	  actual storage is left to the integration, as it is too
-	  specific and may need preparatory work like partitionning a
-	  device and/or formatting a filesystem first, so that falls
-	  out of the scope of Buildroot.
-
 	  To use persistent storage, provide a systemd dropin for the
 	  var.mount unit, that overrides the What and Type, and possibly
 	  the Options and After, fields.
 
+config BR2_INIT_SYSTEMD_VAR_OVERLAYFS
+	bool "mount an overlayfs backed by a tmpfs"
+	select BR2_INIT_SYSTEMD_POPULATE_TMPFILES
+	help
+	  Mount an overlayfs on /var, with the upper as a tmpfs.
+
+	  To use a persistent storage, provide either a mount unit or a
+	  fstab line to mount it on /run/buildroot/mounts/var, e.g.
+
+	  /dev/sdc1    /run/buildroot/mounts/var    ext4    defaults
+
 config BR2_INIT_SYSTEMD_VAR_NONE
 	bool "do nothing"
 	help

--===============7207371032097533833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7207371032097533833==--
