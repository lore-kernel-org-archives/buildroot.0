Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4C7CE7A89
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 05:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47AB7817D3;
	Mon, 25 Sep 2023 05:40:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47AB7817D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VuyDIvML0_vQ; Mon, 25 Sep 2023 05:40:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EA1C81EB4;
	Mon, 25 Sep 2023 05:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EA1C81EB4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E94361BF95D
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 05:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D036160F69
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 05:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D036160F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yoyyjDQ-3Ph5 for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 05:40:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA10E60B58
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 05:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA10E60B58
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98546876B4; Mon, 25 Sep 2023 05:40:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 07:32:48 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 5b9debd5681fd3d3c5fa798114688716a5832078
X-Git-Newrev: 32d380cad8b0489ae5c7eed5fa7f65facccf6069
X-Patchwork-Hint: ignore
Message-Id: <20230925054034.98546876B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/gdb: gdbserver
 does not need zlib
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

commit: https://git.buildroot.net/buildroot/commit/?id=32d380cad8b0489ae5c7eed5fa7f65facccf6069
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Since 3341ceb1e585 (package/gdb: zlib is mandatory, not optional), zlib
has become a mandatory dependencies of the gdb package.

However, zlib is only needed for the debugger, gdb itself, while the
server, gdbserver, does not use it.

This means that, when building an SDK to be later reused as an external
toolchain, the zlib headers and libraries are present in the sysroot of
the toolchain, tainting the toolchain and making it unsuitable to be
reused.

As Julien noticed, for example, tcl will try and link with zlib if
available, and at build time it is. But at runtime, it is not, and thus
tclsh fails to run; see 7af8dee3a8a0 (package/tcl: add mandatory
dependency to zlib)

When we only need to build gdbserver, we still need to configure and
build the whole gdb distribution, which means we call the top-level
configure script; that script has no option to disable the detection
of zlib: it wants to either use a system one, or it will build the
bundled one.

So, when we only build gdbserver, we tell configure to not use a system
zlib. This triggers the build of the bundled one, but it is not linked
with gdbserver so in the end it is not used on the target.

Reported-by: Julien Olivain <ju.o@free.fr>
Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 8ce33fed49aea319da556eab388211a705afe7d0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in |  2 +-
 package/gdb/gdb.mk    | 14 ++++++++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index d1813fd7b9..6986a6441a 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -24,7 +24,6 @@ config BR2_PACKAGE_GDB
 	# The or1k musl port is incomplete, elf_gregset_t definition is missing:
 	# https://git.musl-libc.org/cgit/musl/tree/arch/or1k/bits/user.h?h=v1.2.3
 	depends on !BR2_or1k || !BR2_TOOLCHAIN_USES_MUSL
-	select BR2_PACKAGE_ZLIB
 	# When the external toolchain gdbserver is copied to the
 	# target, we don't allow building a separate gdbserver. The
 	# one from the external toolchain should be used.
@@ -61,6 +60,7 @@ config BR2_PACKAGE_GDB_DEBUGGER
 	depends on !BR2_sh
 	select BR2_PACKAGE_GMP if !BR2_GDB_VERSION_10 && !BR2_arc
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_ZLIB
 
 comment "full gdb on target needs a toolchain w/ wchar"
 	depends on !BR2_sh
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 2759521a3c..7de8a09048 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -32,7 +32,6 @@ GDB_PRE_CONFIGURE_HOOKS += GDB_CONFIGURE_SYMLINK
 # also need ncurses.
 # As for libiberty, gdb may use a system-installed one if present, so
 # we must ensure ours is installed first.
-GDB_DEPENDENCIES = zlib
 HOST_GDB_DEPENDENCIES = host-expat host-libiberty host-ncurses host-zlib
 
 # Disable building documentation
@@ -131,22 +130,29 @@ GDB_CONF_OPTS = \
 	--disable-sim \
 	$(GDB_DISABLE_BINUTILS_CONF_OPTS) \
 	--without-included-gettext \
-	--with-system-zlib \
 	--disable-werror \
 	--enable-static \
 	--without-mpfr \
 	--disable-source-highlight
 
 ifeq ($(BR2_PACKAGE_GDB_DEBUGGER),y)
+GDB_DEPENDENCIES += zlib
 GDB_CONF_OPTS += \
 	--enable-gdb \
-	--with-curses
+	--with-curses \
+	--with-system-zlib
 GDB_DEPENDENCIES += ncurses \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 else
+# When only building gdbserver, we don't need zlib. But we have no way to
+# tell the top-level configure that we don't need zlib: it either wants to
+# build the bundled one, or use the system one.
+# Since we're going to only install the gdbserver to the target, we don't
+# care that the bundled zlib is built, as it is not used.
 GDB_CONF_OPTS += \
 	--disable-gdb \
-	--without-curses
+	--without-curses \
+	--without-system-zlib
 endif
 
 # Starting from GDB 11.x, gmp is needed as a dependency to build full
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
