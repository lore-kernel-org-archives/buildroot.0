Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56BAC4332F
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 11:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C898819BC;
	Sun,  4 Dec 2022 11:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C898819BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FOW4SmX_Cj50; Sun,  4 Dec 2022 11:59:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA86381819;
	Sun,  4 Dec 2022 11:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA86381819
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 997421BF232
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 11:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81066410B1
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 11:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81066410B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hp555HPAszBW for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 11:59:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75D79410A8
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 11:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75D79410A8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61AD185342; Sun,  4 Dec 2022 11:59:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 4 Dec 2022 12:56:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92d96e8513c75a8ab496c90841920e896085915f
X-Git-Newrev: 3341ceb1e58536cf43a4c000e4bb3cdbff3f6de5
X-Patchwork-Hint: ignore
Message-Id: <20221204115901.61AD185342@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: zlib is mandatory,
 not optional
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

commit: https://git.buildroot.net/buildroot/commit/?id=3341ceb1e58536cf43a4c000e4bb3cdbff3f6de5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zlib is a mandatory dependency of gdb and by default, gdb will use its
internal one. Moreover, --with-zlib has been replaced by
--with-system-zlib since version 7.10 and
https://github.com/bminor/binutils-gdb/commit/fa1f5da0b6ff3622f9bf60e348e149b76920abba

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=15131

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gdb/Config.in |  1 +
 package/gdb/gdb.mk    | 12 ++++--------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 273b3072ae..80b1185b5e 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_GDB
 	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_ZLIB
 	# When the external toolchain gdbserver is copied to the
 	# target, we don't allow building a separate gdbserver. The
 	# one from the external toolchain should be used.
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 45ce126bab..4b9c5c6b70 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -32,7 +32,8 @@ GDB_PRE_CONFIGURE_HOOKS += GDB_CONFIGURE_SYMLINK
 # also need ncurses.
 # As for libiberty, gdb may use a system-installed one if present, so
 # we must ensure ours is installed first.
-HOST_GDB_DEPENDENCIES = host-expat host-libiberty host-ncurses
+GDB_DEPENDENCIES = zlib
+HOST_GDB_DEPENDENCIES = host-expat host-libiberty host-ncurses host-zlib
 
 # Disable building documentation
 GDB_MAKE_OPTS += MAKEINFO=true
@@ -130,6 +131,7 @@ GDB_CONF_OPTS = \
 	--disable-sim \
 	$(GDB_DISABLE_BINUTILS_CONF_OPTS) \
 	--without-included-gettext \
+	--with-system-zlib \
 	--disable-werror \
 	--enable-static \
 	--without-mpfr
@@ -212,13 +214,6 @@ else
 GDB_CONF_OPTS += --without-lzma
 endif
 
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-GDB_CONF_OPTS += --with-zlib
-GDB_DEPENDENCIES += zlib
-else
-GDB_CONF_OPTS += --without-zlib
-endif
-
 ifeq ($(BR2_PACKAGE_GDB_PYTHON),)
 # This removes some unneeded Python scripts and XML target description
 # files that are not useful for a normal usage of the debugger.
@@ -256,6 +251,7 @@ HOST_GDB_CONF_OPTS = \
 	--enable-threads \
 	--disable-werror \
 	--without-included-gettext \
+	--with-system-zlib \
 	--with-curses \
 	--without-mpfr \
 	$(GDB_DISABLE_BINUTILS_CONF_OPTS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
