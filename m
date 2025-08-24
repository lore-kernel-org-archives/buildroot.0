Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE44FCA0EFC
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 13:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E829616C7;
	Sun, 24 Aug 2025 13:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kUc92doiz2Z6; Sun, 24 Aug 2025 13:24:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87F5C61621
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87F5C61621;
	Sun, 24 Aug 2025 13:24:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DBC31D9
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 13:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 644F160B45
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 13:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7RP39Pv24gjV for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 13:24:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5C05608EC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5C05608EC
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 13:24:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94785879FB; Sun, 24 Aug 2025 13:24:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Aug 2025 15:23:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1b3aab60d549ad066b5b09c51c9226444561439
X-Git-Newrev: bfd75a5bd2ff2ba5b13515d5dc0bf3bab3b7b5b8
X-Patchwork-Hint: ignore
Message-Id: <20250824132432.94785879FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: never build readline to
 fix GCC 15.x build issue
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bfd75a5bd2ff2ba5b13515d5dc0bf3bab3b7b5b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The binutils-gdb code base in Git does have a copy of readline that is
used by gdb.

The release tarballs of binutils do NOT contain readline as it's not
needed for binutils itself (only gdb).

However, when we build the ARC binutils, taken from Git, the readline/
folder is present, and therefore readline is built even if it is not
actually needed.

This causes build failures as the copy of readline in ARC binutils
2024.12 (based on binutils 2.43) does not build with GCC 15.x.

To work around this problem, we use a suggestion from Waldemar
Brodkorb: pass --with-system-readline. Indeed, this disables the build
of readline... but it does not actually check that we have a system
readline, since we're not building gdb.

Fixes:

  https://autobuild.buildroot.net/results/976243181f7000fe2790b3450bdae51e8c12769e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/binutils/binutils.mk | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index a9f03225da..c79f3414af 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -47,6 +47,13 @@ BINUTILS_DISABLE_GDB_CONF_OPTS = \
 	--disable-gdb
 
 # We need to specify host & target to avoid breaking ARM EABI
+#
+# --with-system-readline to never build readline, as binutils doesn't
+# need it (only gdb does). For binutils release tarballs, readline
+# is not shipped, but when we get it from git, it is present and
+# gets built which can cause build issues, so force skipping
+# it. Note: the configure script will not check for readline as it
+# doesn't need it.
 BINUTILS_CONF_OPTS = \
 	--disable-multilib \
 	--disable-werror \
@@ -58,7 +65,8 @@ BINUTILS_CONF_OPTS = \
 	--disable-gprofng \
 	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
 	$(BINUTILS_EXTRA_CONFIG_OPTIONS) \
-	--without-zstd
+	--without-zstd \
+	--with-system-readline
 
 ifeq ($(BR2_STATIC_LIBS),y)
 BINUTILS_CONF_OPTS += --disable-plugins
@@ -82,6 +90,13 @@ endif
 
 # "host" binutils should actually be "cross"
 # We just keep the convention of "host utility" for now
+#
+# --with-system-readline to never build readline, as binutils doesn't
+# need it (only gdb does). For binutils release tarballs, readline
+# is not shipped, but when we get it from git, it is present and
+# gets built which can cause build issues, so force skipping
+# it. Note: the configure script will not check for readline as it
+# doesn't need it.
 HOST_BINUTILS_CONF_OPTS = \
 	--disable-multilib \
 	--disable-werror \
@@ -95,7 +110,8 @@ HOST_BINUTILS_CONF_OPTS = \
 	--enable-lto \
 	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
 	$(BINUTILS_EXTRA_CONFIG_OPTIONS) \
-	--without-zstd
+	--without-zstd \
+	--with-system-readline
 
 ifeq ($(BR2_BINUTILS_GPROFNG),y)
 HOST_BINUTILS_DEPENDENCIES += host-bison
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
