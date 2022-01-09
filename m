Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9892EC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 08:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2995960B0C;
	Sun,  9 Jan 2022 08:43:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DDKIg82zFHLD; Sun,  9 Jan 2022 08:43:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 535FA60B06;
	Sun,  9 Jan 2022 08:43:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39D6A1BF3AD
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 08:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26BA381772
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 08:43:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nDmKngZS0VJA for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 08:43:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD46F81771
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 08:43:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B68F882A95; Sun,  9 Jan 2022 08:37:23 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 09:43:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c12a6bf51bc4b166948b4392e96344259a64778
X-Git-Newrev: 01a7e1a9f8bcfa4d7f8b1dab85f84ec53797ea2b
X-Patchwork-Hint: ignore
Message-Id: <20220109083723.B68F882A95@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: add support for creating
 journal catalog DB
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
Content-Type: multipart/mixed; boundary="===============1326052276205636155=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1326052276205636155==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=01a7e1a9f8bcfa4d7f8b1dab85f84ec53797ea2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

journald supports catalog files, or rather a binary database of
those.
Functionality added includes:

-   A config option allows enabling the binary database.

-   If BR2_ENABLE_LOCALE_PURGE is enabled, the catalogs not in the
    language whitelist are deleted first. This is done independently
    of the new option, since the catalogs are removed later anyway.

-   If the option is enabled, the database is built and moved to
    /usr/share/factory. This makes sure that /usr contains the entire
    system. A symlink is created in /var pointing to that file.

-   The catalog source files are deleted. They serve no purpose on the
    target once the database exists.

-   All of the above is done in a ROOTFS_PRE_CMD_HOOK rather than in the
    build/install step, because other packages than systemd itself may
    also install catalogs. This also makes sure that it is possible to
    do a re-build, because the catalog files are not removed in
    $(TARGET_DIR) itself, only in the temporary copy for rootfs creation.

-   The service normally used for creating the DB during boot is
    deleted. If the DB is not enabled, we also don't want to waste time
    and space on re-generating every boot. Conversely, if the DB is
    enabled, it is already there so doesn't need to be re-done on every
    boot either.

The new option depends on !BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW because
if the rootfs is not RW, /var is overmounted with a tmpfs. The factory
should handle this, but this only half-works [1].

[1] http://lists.busybox.net/pipermail/buildroot/2020-July/287016.html

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Reviewed-by: Jérémy Rosen <jeremy.rosen@smile.fr>
Reviewed-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/systemd/Config.in  | 14 ++++++++++++++
 package/systemd/systemd.mk | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 0148cad791..c8c5a9c47b 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -269,6 +269,20 @@ config BR2_PACKAGE_SYSTEMD_IMPORTD
 
 	  http://www.freedesktop.org/software/systemd/man/machinectl.html#Image%20Transfer%20Commands
 
+config BR2_PACKAGE_SYSTEMD_CATALOGDB
+	bool "enable journal catalog database installation"
+	depends on BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW # conflicting tmpfiles magic
+	help
+	  Build and install the journal catalog database.
+
+	  catalog files are used to provide extended and potentially
+	  localized messages for the journal.
+
+	  The original catalog files will be built into a DB at
+	  /usr/share/factory/var/lib/systemd/catalog/database.
+
+	  https://www.freedesktop.org/wiki/Software/systemd/catalog/
+
 config BR2_PACKAGE_SYSTEMD_LOCALED
 	bool "enable locale daemon"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 17bb922f51..a2417ebe19 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -678,6 +678,44 @@ define SYSTEMD_INSTALL_INIT_SYSTEMD
 	$(SYSTEMD_INSTALL_NETWORK_CONFS)
 endef
 
+ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
+# Go through all files with scheme <basename>.<langext>.catalog
+# and remove those where <langext> is not in LOCALE_NOPURGE
+define SYSTEMD_LOCALE_PURGE_CATALOGS
+	for cfile in `find $(TARGET_DIR)/usr/lib/systemd/catalog -name '*.*.catalog'`; \
+	do \
+		basename=$${cfile##*/}; \
+		basename=$${basename%.catalog}; \
+		langext=$${basename#*.}; \
+		[ "$$langext" = "$${basename}" ] && continue; \
+		expr '$(LOCALE_NOPURGE)' : ".*\b$${langext}\b" >/dev/null && continue; \
+		rm -f "$$cfile"; \
+	done
+endef
+SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_LOCALE_PURGE_CATALOGS
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD_CATALOGDB),y)
+define SYSTEMD_UPDATE_CATALOGS
+	$(HOST_DIR)/bin/journalctl --root=$(TARGET_DIR) --update-catalog
+	install -D $(TARGET_DIR)/var/lib/systemd/catalog/database \
+		$(TARGET_DIR)/usr/share/factory/var/lib/systemd/catalog/database
+	rm $(TARGET_DIR)/var/lib/systemd/catalog/database
+	ln -sf /usr/share/factory/var/lib/systemd/catalog/database \
+		$(TARGET_DIR)/var/lib/systemd/catalog/database
+	grep -q '^L /var/lib/systemd/catalog/database' $(TARGET_DIR)/usr/lib/tmpfiles.d/var.conf || \
+		printf "\nL /var/lib/systemd/catalog/database\n" >> $(TARGET_DIR)/usr/lib/tmpfiles.d/var.conf
+endef
+SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_UPDATE_CATALOGS
+endif
+
+define SYSTEMD_RM_CATALOG_UPDATE_SERVICE
+	rm -rf $(TARGET_DIR)/usr/lib/systemd/catalog \
+		$(TARGET_DIR)/usr/lib/systemd/system/systemd-journal-catalog-update.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/*/systemd-journal-catalog-update.service
+endef
+SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_CATALOG_UPDATE_SERVICE
+
 define SYSTEMD_PRESET_ALL
 	$(HOST_DIR)/bin/systemctl --root=$(TARGET_DIR) preset-all
 endef

--===============1326052276205636155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1326052276205636155==--
