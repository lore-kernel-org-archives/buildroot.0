Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D6BC3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 21:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CA78811FE;
	Mon, 29 Jul 2024 21:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4DTjUhqJso0J; Mon, 29 Jul 2024 21:16:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52852811FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52852811FB;
	Mon, 29 Jul 2024 21:16:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6CA241BF426
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 21:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66059811FB
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 21:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iLY8uhtJJGnb for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 21:16:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 982DC80D7B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 982DC80D7B
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 21:16:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83517835D9; Mon, 29 Jul 2024 21:16:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Jul 2024 23:16:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1eeea445f803b6509205a244ad07b19fc72456fb
X-Git-Newrev: 320c69a27d9c8a6b11616b0feb3668ab01ed93c3
X-Patchwork-Hint: ignore
Message-Id: <20240729211650.83517835D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdex: needs dynamic library
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=320c69a27d9c8a6b11616b0feb3668ab01ed93c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following static build failure raised since the addition of the
package in commit 70319b47f646f74f407ed3355baf5b581a10518a:

FAILED: src/libdex-1.so.1.0.0
/home/autobuild/autobuild/instance-11/output-1/host/bin/mips-buildroot-linux-musl-gcc  -o src/libdex-1.so.1.0.0  -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -shared -fPIC -Wl,--start-group -Wl,-soname,libdex-1.so.1 -Wl,--whole-archive src/libdex-1.a -Wl,--no-whole-archive -Wl,-z,relro -Wl,-z,now -Wl,-z,noexecstack -Wl,-Bsymbolic -fno-plt -static -lucontext -latomic /home/autobuild/autobuild/instance-11/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libgio-2.0.a /home/autobuild/autobuild/instance-11/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libgobject-2.0.a /home/autobuild/autobuild/instance-11/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libffi.a /home/autobuild/autobuild/instance-11/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libgmodule-2.0.a /home/autobuild/autobuild/instance-11/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libglib-2.0.a /home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/mips-buildroot-linux-musl/13.3.
 0/../../../../mips-buildroot-linux-musl/lib/libatomic.a -lm -pthread /home/autobuild/autobuild/instance-11/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libpcre2-8.a /home/autobuild/autobuild/instance-11/output-1/host/mips-buildroot-linux-musl/sysroot/usr/lib/libz.a -latomic -Wl,--end-group
/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/mips-buildroot-linux-musl/13.3.0/crtbeginT.o: in function `deregister_tm_clones':
crtstuff.c:(.text+0x10): relocation R_MIPS_HI16 against `__gnu_local_gp' cannot be used when making a shared object; recompile with -fPIC

Fixes: 70319b47f646f74f407ed3355baf5b581a10518a
 - http://autobuild.buildroot.org/results/f527cab99141ecbbbd13c12177a2cc8903bed3a4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libdex/Config.in  | 4 +++-
 package/sysprof/Config.in | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libdex/Config.in b/package/libdex/Config.in
index 5f94a79b73..17abc0b02a 100644
--- a/package/libdex/Config.in
+++ b/package/libdex/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBDEX
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_USE_WCHAR # libglib2, gettext
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_UCONTEXT || \
 		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBGLIB2
@@ -16,8 +17,9 @@ config BR2_PACKAGE_LIBDEX
 
 	  https://gitlab.gnome.org/GNOME/libdex
 
-comment "libdex needs a toolchain w/ wchar, threads, ucontext"
+comment "libdex needs a toolchain w/ wchar, threads, dynamic library, ucontext"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS || \
 		!(BR2_TOOLCHAIN_HAS_UCONTEXT || \
 			BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS)
diff --git a/package/sysprof/Config.in b/package/sysprof/Config.in
index 32a5f99798..a4f53a1179 100644
--- a/package/sysprof/Config.in
+++ b/package/sysprof/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_SYSPROF
 	depends on BR2_USE_MMU # glib2, libdex, json-glib
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libunwind, polkit
 	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
-	depends on !BR2_STATIC_LIBS # libunwind, polkit
+	depends on !BR2_STATIC_LIBS # libdex, libunwind, polkit
 	depends on !BR2_OPTIMIZE_FAST # polkit
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
