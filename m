Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD61C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 15:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5E0581A46;
	Sun,  9 Jan 2022 15:08:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b4YV8ha2KLmz; Sun,  9 Jan 2022 15:08:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 149A680C40;
	Sun,  9 Jan 2022 15:08:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 845091BF969
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7152440198
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:08:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0QvfTw534JYo for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 15:08:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AFB040167
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 15:08:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B7C1982C0A; Sun,  9 Jan 2022 15:02:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 16:03:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 353483b1e71a5169ca97315dae7d1814740070ed
X-Git-Newrev: c08fa13d363b7e3faa2f065f6261af6fa52445f6
X-Patchwork-Hint: ignore
Message-Id: <20220109150224.B7C1982C0A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/Makefile.in: use gcc wrappers for
 binutils tools
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

commit: https://git.buildroot.net/buildroot/commit/?id=c08fa13d363b7e3faa2f065f6261af6fa52445f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will use gcc-ar, gcc-nm and gcc-ranlib instead of the normal
binutils tools. The difference is that with the wrappers, gcc plugins
will be automatically picked up.

gcc 4.7 introduced these wrappers, to detect the prefix and keep gcc
specifics out of Makefile.in, a new variable BR2_TOOLCHAIN_BUTILS_PREFIX
will be used to carry the prefix on supported versions.

Note that binutils added some automatic loading with the 'bfd-plugins'
directory (somewhere around 2.28), but the first implementation had
issues, and generally depends on correctly setup symlinks (often broken,
may point to some other gcc's library). The wrappers always work
painless.

The original motivation (now ~2 years in use) was to add "-flto
-ffat-lto-objects" to both BR2_TARGET_OPTIMIZATION and
BR2_TARGET_LDFLAGS, and have target binaries lto optimized.

Not all packages will compile with this option, further work could
white/blacklist packages (adding -fno-lto to the options).

Signed-off-by: Norbert Lange <nolange79@gmail.com>
[yann.morin.1998@free.fr: don't introduce a Config.in blind option]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Makefile.in | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 0ca2a5844e..508ea7c366 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -210,16 +210,23 @@ else
 TARGET_CROSS = $(HOST_DIR)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
 endif
 
+# gcc-4.7 and later ships with wrappers that will automatically pass
+# arguments to the binutils tools. Those are paths to necessary linker
+# plugins.
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),y)
+TARGET_GCC_WRAPPERS_PREFIX = gcc-
+endif
+
 # Define TARGET_xx variables for all common binutils/gcc
-TARGET_AR       = $(TARGET_CROSS)ar
+TARGET_AR       = $(TARGET_CROSS)$(TARGET_GCC_WRAPPERS_PREFIX)ar
 TARGET_AS       = $(TARGET_CROSS)as
 TARGET_CC       = $(TARGET_CROSS)gcc
 TARGET_CPP      = $(TARGET_CROSS)cpp
 TARGET_CXX      = $(TARGET_CROSS)g++
 TARGET_FC       = $(TARGET_CROSS)gfortran
 TARGET_LD       = $(TARGET_CROSS)ld
-TARGET_NM       = $(TARGET_CROSS)nm
-TARGET_RANLIB   = $(TARGET_CROSS)ranlib
+TARGET_NM       = $(TARGET_CROSS)$(TARGET_GCC_WRAPPERS_PREFIX)nm
+TARGET_RANLIB   = $(TARGET_CROSS)$(TARGET_GCC_WRAPPERS_PREFIX)ranlib
 TARGET_READELF  = $(TARGET_CROSS)readelf
 TARGET_OBJCOPY  = $(TARGET_CROSS)objcopy
 TARGET_OBJDUMP  = $(TARGET_CROSS)objdump
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
