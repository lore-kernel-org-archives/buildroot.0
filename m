Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7957DC6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 08:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BE53417A0;
	Sun, 11 Sep 2022 08:54:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BE53417A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KCn9S5mXMOWz; Sun, 11 Sep 2022 08:54:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA2CA41963;
	Sun, 11 Sep 2022 08:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA2CA41963
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E17E1BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7199E61076
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7199E61076
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tItBXF0wEkNe for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 008FC60F64
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 008FC60F64
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F2C8B8361F; Sun, 11 Sep 2022 08:48:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 18:03:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4eddacad79509c9786672a2abab1ba45de600c7
X-Git-Newrev: 3ae900bcf965b79982a8780d5010ee512576a735
X-Patchwork-Hint: ignore
Message-Id: <20220911084823.F2C8B8361F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: remove
 BR2_PACKAGE_GDB_TOPLEVEL
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ae900bcf965b79982a8780d5010ee512576a735
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This option was needed to build versions of GDB < 10.x. As we just
dropped support for GDB 9.x, this logic can now be removed.

The special case to configure just gdbserver was only valid for gdb<10,
but was guarded by !GDB_TOPLEVEL (which was equivalent to gdb<10).
GDB_TOPLEVEL is now always true, so we can't hit that special case
anymore.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr: add little blurb about gdbserver]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gdb/Config.in.host | 11 -----------
 package/gdb/gdb.mk         | 13 ++-----------
 2 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 33ffc632ee..a88c8affb3 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -67,14 +67,3 @@ config BR2_GDB_VERSION
 	default "11.2"     if BR2_GDB_VERSION_11 || !BR2_PACKAGE_HOST_GDB
 	default "12.1"     if BR2_GDB_VERSION_12
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
-
-# recent gdb versions (>= 10) have gdbserver moved at the top-level,
-# which requires a different build logic.
-config BR2_PACKAGE_GDB_TOPLEVEL
-	bool
-	default y if BR2_arc
-	default y if BR2_GDB_VERSION_10
-	default y if BR2_GDB_VERSION_11
-	default y if BR2_GDB_VERSION_12
-	default y if !BR2_PACKAGE_HOST_GDB
-	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index d2bbfcb290..45ce126bab 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -18,23 +18,14 @@ GDB_LICENSE = GPL-2.0+, LGPL-2.0+, GPL-3.0+, LGPL-3.0+
 GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
 GDB_CPE_ID_VENDOR = gnu
 
-# On gdb < 10, if you want to build only gdbserver, you need to
-# configure only gdb/gdbserver.
-ifeq ($(BR2_PACKAGE_GDB_DEBUGGER)$(BR2_PACKAGE_GDB_TOPLEVEL),)
-GDB_SUBDIR = gdb/gdbserver
-
-# When we want to build the full gdb, or for very recent versions of
-# gdb with gdbserver at the top-level, out of tree build is mandatory,
-# so we create a 'build' subdirectory in the gdb sources, and build
-# from there.
-else
+# Out of tree build is mandatory, so we create a 'build' subdirectory
+# in the gdb sources, and build from there.
 GDB_SUBDIR = build
 define GDB_CONFIGURE_SYMLINK
 	mkdir -p $(@D)/$(GDB_SUBDIR)
 	ln -sf ../configure $(@D)/$(GDB_SUBDIR)/configure
 endef
 GDB_PRE_CONFIGURE_HOOKS += GDB_CONFIGURE_SYMLINK
-endif
 
 # For the host variant, we really want to build with XML support,
 # which is needed to read XML descriptions of target architectures. We
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
