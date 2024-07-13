Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57290C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 15:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01D5460643;
	Sat, 13 Jul 2024 15:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yMHmqofpAYXB; Sat, 13 Jul 2024 15:50:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 008D160769
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 008D160769;
	Sat, 13 Jul 2024 15:50:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F9191BF406
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 15:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEAC68133E
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 15:50:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xVZ51qBLQmYj for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 15:50:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2ECE58133D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2ECE58133D
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 15:50:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1862A8655B; Sat, 13 Jul 2024 15:50:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 17:45:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1861c225eafc9c9679217abc43d54317e7a6d03f
X-Git-Newrev: 177da3cf8fef47546bfee4275c62b0611acdb6b2
X-Patchwork-Hint: ignore
Message-Id: <20240713155026.1862A8655B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: switch to gdb 14.x as the
 default
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=177da3cf8fef47546bfee4275c62b0611acdb6b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we have introduced support for gdb 15.x, switch to gdb 14.x
as the default version.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Romain:
  - select mpfr for the target variant
  - remove comment about mpfr dependency
]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/gdb/Config.in      | 2 +-
 package/gdb/Config.in.host | 8 +++-----
 package/gdb/gdb.mk         | 4 ++--
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 88de76094e..49ee4b3728 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -59,7 +59,7 @@ config BR2_PACKAGE_GDB_DEBUGGER
 	depends on BR2_USE_WCHAR
 	depends on !BR2_sh
 	select BR2_PACKAGE_GMP
-	select BR2_PACKAGE_MPFR if (BR2_GDB_VERSION_14 || BR2_GDB_VERSION_15 || BR2_arc)
+	select BR2_PACKAGE_MPFR if !(BR2_GDB_VERSION_13)
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_ZLIB
 
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index cf2a1e4f1f..76f5cf8b4d 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -41,7 +41,7 @@ config BR2_PACKAGE_HOST_GDB_SIM
 
 choice
 	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_13
+	default BR2_GDB_VERSION_14
 	depends on !BR2_arc
 	help
 	  Select the version of gdb you wish to use.
@@ -72,9 +72,7 @@ config BR2_GDB_VERSION
 	string
 	default "arc-2023.09-release" if BR2_arc
 	default "12.1"     if BR2_GDB_VERSION_12
-	default "13.2"     if BR2_GDB_VERSION_13 || !BR2_PACKAGE_HOST_GDB
-	# When making 14.x the default, or 14.x becomes the oldest version,
-	# be sure to update the target variant to properly select mpfr.
-	default "14.2"     if BR2_GDB_VERSION_14
+	default "13.2"     if BR2_GDB_VERSION_13
+	default "14.2"     if BR2_GDB_VERSION_14 || !BR2_PACKAGE_HOST_GDB
 	default "15.1"	   if BR2_GDB_VERSION_15
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index f2ef270e87..c966cdc10b 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -166,7 +166,7 @@ endif
 # gdb.
 # GDB fork from ARC GNU tools 2023.09 is based on GDB14 branch and so
 # requires MPFR as well.
-ifeq ($(BR2_GDB_VERSION_14)$(BR2_GDB_VERSION_15)$(BR2_arc):$(BR2_PACKAGE_GDB_DEBUGGER),y:y)
+ifeq ($(BR2_PACKAGE_GDB_DEBUGGER):$(BR2_GDB_VERSION_13),y:)
 GDB_DEPENDENCIES += mpfr
 GDB_CONF_OPTS += --with-mpfr=$(STAGING_DIR)
 else
@@ -272,7 +272,7 @@ HOST_GDB_CONF_OPTS = \
 # GDB newer than 14.x need host-mpfr
 # GDB fork from ARC GNU tools 2023.09 is based on GDB14 branch and so
 # requires MPFR as well.
-ifeq ($(BR2_GDB_VERSION_14)$(BR2_GDB_VERSION_15)$(BR2_arc),y)
+ifeq ($(BR2_GDB_VERSION_13),)
 HOST_GDB_DEPENDENCIES += host-mpfr
 HOST_GDB_CONF_OPTS += --with-mpfr=$(HOST_DIR)
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
