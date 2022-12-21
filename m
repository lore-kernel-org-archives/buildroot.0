Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F63C4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 21:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 642ED610D3;
	Wed, 21 Dec 2022 21:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 642ED610D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ON2jXydNmsiY; Wed, 21 Dec 2022 21:16:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92A03610CF;
	Wed, 21 Dec 2022 21:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92A03610CF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F42081BF2F5
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 21:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF60582027
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 21:16:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF60582027
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BmmkB7gU0SCz for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 21:16:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE23D82026
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 21:16:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE23D82026
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC95286CF3; Wed, 21 Dec 2022 21:16:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 22:10:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff0fd90c3e42dd00283a4eb192ce832f7c03ac30
X-Git-Newrev: 8cbfbe487ac6fb00c037475ed8aaca3d89899769
X-Patchwork-Hint: ignore
Message-Id: <20221221211620.BC95286CF3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skeleton-systemd: systemd-ify
 mounting /var tmpfs with ro rootfs
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
Content-Type: multipart/mixed; boundary="===============4779044746006484441=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4779044746006484441==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8cbfbe487ac6fb00c037475ed8aaca3d89899769
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To mount our /var tmpfs when the rootfs is mounted read-only (really,
not remounted read-write), we use an entry in fstab.

However, /etc could also be a tmpfs (for full state-less systems, or
easy factory-reset, see [0]). It also prevents easily ordering other
systemd units until after /var is mounted (not impossible, but less
easy).

So, we register /var as a systemd mount unit, so that we can also have
the /var factory populated and functional even when /etc is empty. The
var.mount unit is heavily modelled after systemd's own tmp.mount one, so
we carry the same license for that file (in case that may apply).

This has two side effects:
  - as hinted previously, it simplifies writing other systemd units to
    order them after /var is mounted
  - user can easily replace it with their own, which mounts an actual
    filesystem

[0] http://0pointer.de/blog/projects/stateless.html

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Norbert Lange <nolange79@gmail.com>
Cc: Romain Naour <romain.naour@smile.fr>
Cc: Jérémy Rosen <jeremy.rosen@smile.fr>
[yann.morin.1998@free.fr:
  - split original patch in two
  - this one only handles converting /var mounting into a systemd unit
  - adapt commit log accordingly
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Reviewed-by: Norbert Lange <nolange79@gmail.com>
[yann.morin.1998@free.fr (as suggested by Norbert):
  - fix Before= dependencies
  - drop [Install] section
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/skeleton-init-systemd/skeleton-init-systemd.mk |  3 ++-
 package/skeleton-init-systemd/var.mount                | 15 +++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
index ec908b4fac..ff8bc528c0 100644
--- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
+++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
@@ -30,7 +30,6 @@ else
 # back there by the tmpfiles.d mechanism.
 define SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW
 	echo "/dev/root / auto ro 0 1" >$(TARGET_DIR)/etc/fstab
-	echo "tmpfs /var tmpfs mode=1777 0 0" >>$(TARGET_DIR)/etc/fstab
 endef
 
 define SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR
@@ -52,6 +51,8 @@ define SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR
 			|| exit 1; \
 		fi; \
 	done >$(TARGET_DIR)/usr/lib/tmpfiles.d/00-buildroot-var.conf
+	$(INSTALL) -D -m 0644 $(SKELETON_INIT_SYSTEMD_PKGDIR)/var.mount \
+		$(TARGET_DIR)/usr/lib/systemd/system/var.mount
 endef
 SKELETON_INIT_SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SKELETON_INIT_SYSTEMD_PRE_ROOTFS_VAR
 
diff --git a/package/skeleton-init-systemd/var.mount b/package/skeleton-init-systemd/var.mount
new file mode 100644
index 0000000000..e97accef93
--- /dev/null
+++ b/package/skeleton-init-systemd/var.mount
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# Modelled after systemd's tmp.mount
+
+[Unit]
+Description=Buildroot /var tmpfs
+DefaultDependencies=no
+Conflicts=umount.target
+Before=local-fs.target umount.target
+After=swap.target
+
+[Mount]
+What=tmpfs
+Where=/var
+Type=tmpfs
+Options=mode=1777,strictatime,nosuid,nodev,size=50%%,nr_inodes=1m

--===============4779044746006484441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4779044746006484441==--
