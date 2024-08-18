Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA305C52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 10:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 821BF80F62;
	Sun, 18 Aug 2024 10:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OHBmaflGOiOZ; Sun, 18 Aug 2024 10:11:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48AAE80F66
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48AAE80F66;
	Sun, 18 Aug 2024 10:11:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D2871BF297
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 10:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B67DC40268
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 10:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yCW-ii_MEHWw for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 10:11:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 613414026A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 613414026A
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 10:11:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C309D85FD0; Sun, 18 Aug 2024 10:11:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Aug 2024 11:56:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b19f8001c81753e2bf951c1076e7137fb23e099f
X-Git-Newrev: 9e3388256811c943d8312db289959b74cae9536e
X-Patchwork-Hint: ignore
Message-Id: <20240818101127.C309D85FD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: remove fixups related
 to untested CT-NG toolchains
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e3388256811c943d8312db289959b74cae9536e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We have accumulated a whole bunch of very old fixups to avoid issues
with super old CT-NG toolchains, which we are not testing anymore, so
remove those fixups.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/genrandconfig | 69 -----------------------------------------------------
 1 file changed, 69 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 216e733799..cefc3dca12 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -181,43 +181,8 @@ async def fixup_config(sysinfo, configfile):
 
     ROOTFS_SIZE = '5G'
 
-    BR2_TOOLCHAIN_EXTERNAL_URL = 'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/'
-
     if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not await sysinfo.has("java"):
         return False
-    # The ctng toolchain is affected by PR58854
-    if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'armv5-ctng-linux-gnueabi.tar.xz"\n' in configlines:
-        return False
-    # The ctng toolchain tigger an assembler error with guile package when compiled with -Os (same issue as for CS ARM 2014.05-29)
-    if 'BR2_PACKAGE_GUILE=y\n' in configlines and \
-       'BR2_OPTIMIZE_S=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'armv5-ctng-linux-gnueabi.tar.xz"\n' in configlines:
-        return False
-    # The ctng toolchain is affected by PR58854
-    if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'armv6-ctng-linux-uclibcgnueabi.tar.xz"\n' in configlines:
-        return False
-    # The ctng toolchain is affected by PR58854
-    if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'armv7-ctng-linux-gnueabihf.tar.xz"\n' in configlines:
-        return False
-    # The ctng toolchain is affected by PR60155
-    if 'BR2_PACKAGE_SDL=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'powerpc-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # The ctng toolchain is affected by PR60155
-    if 'BR2_PACKAGE_LIBMPEG2=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'powerpc-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # This MIPS toolchain uses eglibc-2.18 which lacks SYS_getdents64
-    if 'BR2_PACKAGE_STRONGSWAN=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
-        return False
-    # This MIPS toolchain uses eglibc-2.18 which lacks SYS_getdents64
-    if 'BR2_PACKAGE_PYTHON3=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
-        return False
     # libffi not available on ARMv7-M, but propagating libffi arch
     # dependencies in Buildroot is really too much work, so we handle
     # this here.
@@ -232,40 +197,6 @@ async def fixup_config(sysinfo, configfile):
     if 'BR2_PACKAGE_SUNXI_BOARDS=y\n' in configlines:
         configlines.remove('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE=""\n')
         configlines.append('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a10/hackberry.fex"\n')
-    # This MIPS uClibc toolchain fails to build the gdb package
-    if 'BR2_PACKAGE_GDB=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # This MIPS uClibc toolchain fails to build the rt-tests package
-    if 'BR2_PACKAGE_RT_TESTS=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # This MIPS uClibc toolchain fails to build the civetweb package
-    if 'BR2_PACKAGE_CIVETWEB=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # This MIPS ctng toolchain fails to build the python3 package
-    if 'BR2_PACKAGE_PYTHON3=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
-        return False
-    # This MIPS uClibc toolchain fails to build the strace package
-    if 'BR2_PACKAGE_STRACE=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # This MIPS uClibc toolchain fails to build the cdrkit package
-    if 'BR2_PACKAGE_CDRKIT=y\n' in configlines and \
-       'BR2_STATIC_LIBS=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # uClibc vfork static linking issue
-    if 'BR2_PACKAGE_ALSA_LIB=y\n' in configlines and \
-       'BR2_STATIC_LIBS=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'i486-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # This MIPS uClibc toolchain fails to build the weston package
-    if 'BR2_PACKAGE_WESTON=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
     # No C library for internal toolchain
     if 'BR2_TOOLCHAIN_BUILDROOT_NONE=y\n' in configlines:
         return False
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
