Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3239CAC592
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B74A880E0E;
	Fri, 19 Sep 2025 12:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GZVtCy46nc3G; Fri, 19 Sep 2025 12:54:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02A5A80F2F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02A5A80F2F;
	Fri, 19 Sep 2025 12:54:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 448B0E7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8098540DA5
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1iNF3uxZ2iJg for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:54:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D1E340DB0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D1E340DB0
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B5E985FD5; Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 10:42:12 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 02ba72ee845929991e38f281560babf767e9a11a
X-Git-Newrev: 376785362f6b7975a10a3ed6f8a5661a6497a45d
X-Patchwork-Hint: ignore
Message-Id: <20250919125411.9B5E985FD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/xlib_xtrans: bump
 to 1.6.0
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=376785362f6b7975a10a3ed6f8a5661a6497a45d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

xlib_xtrans clients (for example xserver_xorg-server) are failing to
compile with gcc 15.1.0.

The issue can be reproduced with the commands:

    cat >.config <<EOF
    BR2_aarch64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
    BR2_PACKAGE_XORG7=y
    BR2_PACKAGE_XSERVER_XORG_SERVER=y
    EOF
    make olddefconfig
    make xserver_xorg-server

which outputs the compilation error:

auth.c: In function 'GenerateRandomData': auth.c:320:5: warning:
ignoring return value of 'read' declared with attribute
'warn_unused_result' [-Wunused-result]   320 |     read(fd, buf, len);
|     ^~~~~~~~~~~~~~~~~~ In file included from
/home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/string.h:548,
from
/home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/X11/Xos.h:62,
from
/home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/X11/Xtrans/Xtrans.h:54,
from
/home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/X11/Xtrans/Xtransint.h:79,
from
/home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/X11/Xtrans/transport.c:55,
from xstrans.c:17: In function 'strncpy',     inlined from
'_XSERVTransGetHostname' at
/home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/X11/Xtrans/Xtrans.c:1351:5,
inlined from '_XSERVTransConvertAddress' at
/home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/X11/Xtrans/Xtransutil.c:188:12:
/home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/bits/string_fortified.h:100:10:
error: '__builtin_strncpy' offset [130, 319] from the object at 'name'
is out of the bounds of referenced subobject 'nodename' with type
'char[65]' at offset 65 [-Werror=array-bounds=]   100 |   return
__builtin___strncpy_chk (__dest, __src, __len,       |
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   101 |
__glibc_objsize (__dest));       |
~~~~~~~~~~~~~~~~~~~~~~~~~ In file included from
/home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/X11/Xtrans/Xtransint.h:105:
/home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/sys/utsname.h:
In function '_XSERVTransConvertAddress':
/home/wbx/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/sys/utsname.h:54:10:
note: subobject 'nodename' declared here    54 |     char
nodename[_UTSNAME_NODENAME_LENGTH];       |          ^~~~~~~~ cc1: some
warnings being treated as errors make[2]: *** [Makefile:696: xstrans.lo]
Error 1 make[2]: *** Waiting for unfinished jobs.... make[2]: Leaving
directory
'/home/wbx/buildroot/output/build/xserver_xorg-server-21.1.18/os'
make[1]: *** [Makefile:796: all-recursive] Error 1 make[1]: Leaving
directory '/home/wbx/buildroot/output/build/xserver_xorg-server-21.1.18'
make: *** [package/pkg-generic.mk:273:
/home/wbx/buildroot/output/build/xserver_xorg-server-21.1.18/.stamp_built]
Error 2

The update fixes the compile error.

See here for changes:
https://lists.x.org/archives/xorg/2025-March/061900.html

The COPYRIGHT was updated from 2005 to 2025.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Julien: add commands to reproduce the issue]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8c539854dda9c1edb5bb6a5da2b260e26b9fabbf)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/x11r7/xlib_xtrans/xlib_xtrans.hash | 8 ++++----
 package/x11r7/xlib_xtrans/xlib_xtrans.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.hash b/package/x11r7/xlib_xtrans/xlib_xtrans.hash
index 9595a73d0e..530f2e858a 100644
--- a/package/x11r7/xlib_xtrans/xlib_xtrans.hash
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-June/003399.html
-sha256  1ba4b703696bfddbf40bacf25bce4e3efb2a0088878f017a50e9884b0c8fb1bd  xtrans-1.5.0.tar.xz
-sha512  e8091f11d4ad2b14e01de3eac56bdf2267ea26687ce66e3056374d0d02e049480c0b27c482f8828a0efd086f1e4c485108ca4dce3f83d66c1896effa3b38b228  xtrans-1.5.0.tar.xz
+# From https://www.mail-archive.com/xorg-announce@lists.x.org/msg01797.html
+sha256  faafea166bf2451a173d9d593352940ec6404145c5d1da5c213423ce4d359e92  xtrans-1.6.0.tar.xz
+sha512  e0ac4a2df0eeacdf23cedd74fee063a8eea81d05c4c4c9a9a113b9b4238db7cacb3c831973ac647fe1a5b06426dcdf0b2f8be5ac27862700333269880e25725b  xtrans-1.6.0.tar.xz
 # Locally computed
-sha256  22616bf00b6db85ee3164775a95206894af987b85ff1a7703de55644bc722a39  COPYING
+sha256  3fe68a84ab89e82947e560316ab70cf2d02a8b978ae5cf4fbdfd53fc5b917308  COPYING
diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.mk b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
index 001705bb2e..152c080a87 100644
--- a/package/x11r7/xlib_xtrans/xlib_xtrans.mk
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_XTRANS_VERSION = 1.5.0
+XLIB_XTRANS_VERSION = 1.6.0
 XLIB_XTRANS_SOURCE = xtrans-$(XLIB_XTRANS_VERSION).tar.xz
 XLIB_XTRANS_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_XTRANS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
