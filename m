Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A2DC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D95838271D;
	Mon, 20 Feb 2023 23:14:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D95838271D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ueoV14-pqBxr; Mon, 20 Feb 2023 23:14:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9B51830D7;
	Mon, 20 Feb 2023 23:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9B51830D7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E050B1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0965161379
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0965161379
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hJ04AgAHTTiM for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12C49612DC
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12C49612DC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 109D18648F; Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 22:14:27 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8cbfbe487ac6fb00c037475ed8aaca3d89899769
X-Git-Newrev: d18176396a4b835615b71f254e1c00add265f4ce
X-Patchwork-Hint: ignore
Message-Id: <20230220205214.109D18648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/skeleton-systemd: host
 the tmpfiles preparation script
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
Content-Type: multipart/mixed; boundary="===============7773358262571829473=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7773358262571829473==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d18176396a4b835615b71f254e1c00add265f4ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 0d9b84b7a83f (package/systemd: invoke systemd-tmpfilesd on final
image) forcefully introduced a call to systemd-tmpfiles as a per-rootfs
hook, on the premise that would help with read-only rootfs.

However, that did not account for the then-pre-existing handling of /var
as a factory when the user opted not to remount / read-write (by not
setting BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW).

This means that, for users who want to use a factory for /var, the
generated filesystem contains the factory files twice: once as stored in
the factory, and once as populated by systemd-tmpfilesd.

In the hope to reconcile the two solutions, we move the handling of
calling systemd-tmpfilesd to the skeleton-init-systemd package, where we
already handle the /var factory. Having the two in the same package will
make it easier, in the future, to provide the user with a choice whether
to use one of the other.

Note that it is very important to keep the order of the hooks as they
are.

Indeed, skeleton-init-systemd sorts before systemd, so its hooks were
registered before systemd's hooks; now that we move the CREATE_TMPFILES
hook, we must ensure it is called after the PRE_ROOTFS_VAR one, so that
the behaviour of acting on the var factory remains.

As a final note: we chose the move this way, rather than move the var
factory into the systemd package, because it is more related to the
system integration on the Buildroot side, rather than the integration
of the systemd package in Buildroot.

Similarly, the other four rootfs hooks, SYSTEMD_LOCALE_PURGE_CATALOGS,
SYSTEMD_UPDATE_CATALOGS, SYSTEMD_RM_CATALOG_UPDATE_SERVICE, and
specially SYSTEMD_PRESET_ALL, should also be moved out of the systemd
package, because they too are more related to the Buildroot system,
rather than to the systemd package itself; but the frontier is very
porous in either way, for such a package as special as systemd.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Norbert Lange <nolange79@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Romain Naour <romain.naour@smile.fr>
Cc: Jérémy Rosen <jeremy.rosen@smile.fr>
Cc: Yann E. MORIN <yann.morin@orange.com>
Acked-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/{systemd => skeleton-init-systemd}/fakeroot_tmpfiles.sh | 0
 package/skeleton-init-systemd/skeleton-init-systemd.mk          | 6 ++++++
 package/systemd/systemd.mk                                      | 6 ------
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/systemd/fakeroot_tmpfiles.sh b/package/skeleton-init-systemd/fakeroot_tmpfiles.sh
similarity index 100%
rename from package/systemd/fakeroot_tmpfiles.sh
rename to package/skeleton-init-systemd/fakeroot_tmpfiles.sh
diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
index ff8bc528c0..559a169aee 100644
--- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
+++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
@@ -58,6 +58,12 @@ SKELETON_INIT_SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SKELETON_INIT_SYSTEMD_PRE_ROOTFS_V
 
 endif
 
+define SKELETON_INIT_SYSTEMD_CREATE_TMPFILES_HOOK
+	HOST_SYSTEMD_TMPFILES=$(HOST_DIR)/bin/systemd-tmpfiles \
+		$(SKELETON_INIT_SYSTEMD_PKGDIR)/fakeroot_tmpfiles.sh $(TARGET_DIR)
+endef
+SKELETON_INIT_SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SKELETON_INIT_SYSTEMD_CREATE_TMPFILES_HOOK
+
 define SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/home
 	mkdir -p $(TARGET_DIR)/srv
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 30a75b7a40..b96873b73f 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -744,12 +744,6 @@ define SYSTEMD_RM_CATALOG_UPDATE_SERVICE
 endef
 SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_CATALOG_UPDATE_SERVICE
 
-define SYSTEMD_CREATE_TMPFILES_HOOK
-	HOST_SYSTEMD_TMPFILES=$(HOST_DIR)/bin/systemd-tmpfiles \
-		$(SYSTEMD_PKGDIR)/fakeroot_tmpfiles.sh $(TARGET_DIR)
-endef
-SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_CREATE_TMPFILES_HOOK
-
 define SYSTEMD_PRESET_ALL
 	$(HOST_DIR)/bin/systemctl --root=$(TARGET_DIR) preset-all
 endef

--===============7773358262571829473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7773358262571829473==--
