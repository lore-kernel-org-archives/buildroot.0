Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D4FC6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 08:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57C4940B95;
	Sun, 11 Sep 2022 08:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57C4940B95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Qhbb05HohGO; Sun, 11 Sep 2022 08:50:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7680440B86;
	Sun, 11 Sep 2022 08:50:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7680440B86
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 189401BF990
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C086583EC5
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C086583EC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xCEX4G7cgzoi for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E011C83EBA
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E011C83EBA
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DE38F835E4; Sun, 11 Sep 2022 08:48:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 17:56:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c89b00a205232745aa41e307d44498f325da94a
X-Git-Newrev: 7b977af16e67c9dfeac943c0c5c59840a8c2f233
X-Patchwork-Hint: ignore
Message-Id: <20220911084823.DE38F835E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: invert the logic to add the
 dependency on gmp
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7b977af16e67c9dfeac943c0c5c59840a8c2f233
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The handling of the GMP dependency needs a bit of change. Until now,
the GMP dependency was needed when building full GDB (host or target)
in version 11.x or 12.x, so we were explicitly checking whether those
versions were enabled.

Now that only GDB 10.x and the ARC-specific version of GDB are the
only remaining ones not needing GMP, we invert the logic: only those
two versions do not trigger the addition of the GMP dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr: split off to its own patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gdb/Config.in |  3 +--
 package/gdb/gdb.mk    | 14 +++++++-------
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index c50c3d517a..273b3072ae 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -51,8 +51,7 @@ config BR2_PACKAGE_GDB_DEBUGGER
 	bool "full debugger"
 	depends on BR2_USE_WCHAR
 	depends on !BR2_sh
-	select BR2_PACKAGE_GMP if BR2_GDB_VERSION_11
-	select BR2_PACKAGE_GMP if BR2_GDB_VERSION_12
+	select BR2_PACKAGE_GMP if !BR2_GDB_VERSION_10 && !BR2_arc
 	select BR2_PACKAGE_NCURSES
 
 comment "full gdb on target needs a toolchain w/ wchar"
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index dd126b42ce..d2bbfcb290 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -65,8 +65,9 @@ GDB_DEPENDENCIES += host-flex host-bison
 HOST_GDB_DEPENDENCIES += host-flex host-bison
 endif
 
-# Add the necessary host-gmp dependency for the newer releases of GDB
-ifeq ($(BR2_GDB_VERSION_11)$(BR2_GDB_VERSION_12),y)
+# All newer versions of GDB need host-gmp, so it's only for older
+# versions that the dependency can be avoided.
+ifeq ($(BR2_GDB_VERSION_10)$(BR2_arc),)
 HOST_GDB_DEPENDENCIES += host-gmp
 endif
 
@@ -154,11 +155,10 @@ GDB_CONF_OPTS += \
 	--without-curses
 endif
 
-# When GDB >= 11.x (because it's enabled for the host) and we're
-# building the full gdb for the target, we need gmp as a
-# dependency. For now the default gdb version in Buildroot doesn't
-# require gmp.
-ifeq ($(BR2_GDB_VERSION_11)$(BR2_GDB_VERSION_12):$(BR2_PACKAGE_GDB_DEBUGGER),y:y)
+# Starting from GDB 11.x, gmp is needed as a dependency to build full
+# gdb. So we avoid the dependency only for GDB 10.x and the special
+# version used on ARC.
+ifeq ($(BR2_GDB_VERSION_10)$(BR2_arc):$(BR2_PACKAGE_GDB_DEBUGGER),:y)
 GDB_CONF_OPTS += \
 	--with-libgmp-prefix=$(STAGING_DIR)/usr
 GDB_DEPENDENCIES += gmp
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
