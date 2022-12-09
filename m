Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FB9C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 16:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94C8A61197;
	Fri,  9 Dec 2022 16:21:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94C8A61197
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 41AmTvd_Hzl6; Fri,  9 Dec 2022 16:21:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB83C61195;
	Fri,  9 Dec 2022 16:21:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB83C61195
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B7261BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 16:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33D44820BA
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 16:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33D44820BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ryTWQYVWtFUf for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 16:21:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 501E3820B9
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 16:21:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 501E3820B9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F9A485E9A; Fri,  9 Dec 2022 16:21:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 14:47:11 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 404d6e29bf165b2415c7e7507771cc85239121bc
X-Git-Newrev: fa31c1b67921707dbfdb5bafa3f4ffe886ee5db0
X-Patchwork-Hint: ignore
Message-Id: <20221209162143.3F9A485E9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/gdb: zlib is
 mandatory, not optional
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa31c1b67921707dbfdb5bafa3f4ffe886ee5db0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

zlib is a mandatory dependency of gdb and by default, gdb will use its
internal one. Moreover, --with-zlib has been replaced by
--with-system-zlib since version 7.10 and
https://github.com/bminor/binutils-gdb/commit/fa1f5da0b6ff3622f9bf60e348e149b76920abba

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=15131

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3341ceb1e58536cf43a4c000e4bb3cdbff3f6de5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in |  1 +
 package/gdb/gdb.mk    | 12 ++++--------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index daad6c910d..8923f996eb 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -19,6 +19,7 @@ config BR2_PACKAGE_GDB
 	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_ZLIB
 	# When the external toolchain gdbserver is copied to the
 	# target, we don't allow building a separate gdbserver. The
 	# one from the external toolchain should be used.
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 9bde2beea1..b6a3e2f623 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -47,7 +47,8 @@ endif
 # also need ncurses.
 # As for libiberty, gdb may use a system-installed one if present, so
 # we must ensure ours is installed first.
-HOST_GDB_DEPENDENCIES = host-expat host-libiberty host-ncurses
+GDB_DEPENDENCIES = zlib
+HOST_GDB_DEPENDENCIES = host-expat host-libiberty host-ncurses host-zlib
 
 # Disable building documentation
 GDB_MAKE_OPTS += MAKEINFO=true
@@ -145,6 +146,7 @@ GDB_CONF_OPTS = \
 	--disable-sim \
 	$(GDB_DISABLE_BINUTILS_CONF_OPTS) \
 	--without-included-gettext \
+	--with-system-zlib \
 	--disable-werror \
 	--enable-static \
 	--without-mpfr
@@ -228,13 +230,6 @@ else
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
@@ -272,6 +267,7 @@ HOST_GDB_CONF_OPTS = \
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
