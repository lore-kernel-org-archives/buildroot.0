Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35109CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 13:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89D0940111;
	Sun, 17 Sep 2023 13:31:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89D0940111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w4eU_jq6G_qx; Sun, 17 Sep 2023 13:31:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB026402F2;
	Sun, 17 Sep 2023 13:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB026402F2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 02C0E1BF41F
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 13:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D01F581D67
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 13:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D01F581D67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PIgKR7yhpwop for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 13:31:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFB6C81D5A
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 13:30:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFB6C81D5A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD2A38716F; Sun, 17 Sep 2023 13:30:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 15:27:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 78959665b94b412d7a82ee43e3ede14278a5d924
X-Git-Newrev: 7af8dee3a8a0559c2685237ec24f817f37669efc
X-Patchwork-Hint: ignore
Message-Id: <20230917133059.DD2A38716F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tcl: add mandatory dependency to
 zlib
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

commit: https://git.buildroot.net/buildroot/commit/?id=7af8dee3a8a0559c2685237ec24f817f37669efc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tcl changed its zlib handling in upstream commit [1]. Before this
commit, the HAVE_ZLIB macro was defined only if a zlib headers/library
was found. After that commit, the HAVE_ZLIB macro is unconditionally
defined. The only change is that: if a working zlib library is found
in the toolchain sysroot, it is used. Otherwise, the package will use
a shipped version in [2]. See also [3] and [4].

This tcl commit is included in Buildroot since commit 7fda943b43
"tcl: bump to version 8.6.1".

In Buildroot, we prefer to not use bundled libraries wherever possible,
so add an unconditional dependency to zlib.

Further notes:

This behavior leads to runtime failures, when the package is compiled
with toolchains including zlib in their sysroot. This is because at
configuration time, the package will detect zlib in the sysroot and
link against it, but the library files won't be installed on target.

This happen to be the case with Bootlin toolchains such as [5], as they
also contaions gdbserver, and since 3341ceb1e585 (package/gdb: zlib is
mandatory, not optional), we also build zlib even if only gdbserver is
built (gdbserver does not use zlib, so that's a bug in our gdb
packaging).

This toolchain also happen to be the one used in basic configurations
of the runtime test infrastructure (this issue was found while
attempting to write a runtime test for tcl).

In such cases, running "tclsh" command fails with error message:

    tclsh: error while loading shared libraries: libz.so.1: cannot open shared object file: No such file or directory

libtcl library also miss its dependency.

    ldd /usr/lib/libtcl8.6.so
	    libz.so.1 => not found
	    libm.so.6 => /lib/libm.so.6 (0xb6dad000)
	    libc.so.6 => /lib/libc.so.6 (0xb6c65000)
	    /lib/ld-linux.so.3 (0xb6f6c000)

[1] https://github.com/tcltk/tcl/commit/6f3dea45cee94f12ffa0b2acbbdb3eedbc01807b
[2] https://github.com/tcltk/tcl/tree/core-8-6-13/compat/zlib
[3] https://github.com/tcltk/tcl/blob/core-8-6-13/unix/configure.in#L172
[4] https://github.com/tcltk/tcl/blob/core-8-6-13/unix/Makefile.in#L240
[5] https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--stable-2023.08-1.tar.bz2

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tcl/Config.in | 1 +
 package/tcl/tcl.mk    | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/tcl/Config.in b/package/tcl/Config.in
index f1fa0541a1..adb9f22488 100644
--- a/package/tcl/Config.in
+++ b/package/tcl/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_TCL
 	# See this mailing list thread:
 	# http://lists.busybox.net/pipermail/buildroot/2015-March/121198.html
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_ZLIB
 	help
 	  TCL (Tool Command Language) is a simple textual language.
 
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 843d58a4ae..1943bc7b27 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -75,7 +75,8 @@ TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_EXTRA
 
 TCL_DEPENDENCIES = $(if $(BR2_PACKAGE_SQLITE),sqlite) \
 	$(if $(BR2_PACKAGE_MYSQL),mysql) \
-	$(if $(BR2_PACKAGE_POSTGRESQL),postgresql)
+	$(if $(BR2_PACKAGE_POSTGRESQL),postgresql) \
+	zlib
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
