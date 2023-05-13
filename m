Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DBDC77B7C
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 08:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 914CF42E7A;
	Sat, 13 May 2023 08:16:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 914CF42E7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iNcd_sVIkZtM; Sat, 13 May 2023 08:16:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8813B42E77;
	Sat, 13 May 2023 08:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8813B42E77
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD9111BF86C
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 08:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4C764048D
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 08:16:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4C764048D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rIpRT2ya076j for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 08:16:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72C01400AB
 for <buildroot@buildroot.org>; Sat, 13 May 2023 08:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72C01400AB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60C3D842B5; Sat, 13 May 2023 08:16:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 10:12:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eac0e9cf82b7189b6bb2f2449a68abbcee2651d2
X-Git-Newrev: b6861678e1ad19abeeddc94abaf6aafec77f5b11
X-Patchwork-Hint: ignore
Message-Id: <20230513081614.60C3D842B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: bump to version 8.0.0
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
Content-Type: multipart/mixed; boundary="===============4404975537011083589=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4404975537011083589==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b6861678e1ad19abeeddc94abaf6aafec77f5b11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes log:
https://wiki.qemu.org/ChangeLog/8.0

Remove upstream patch:
0003-Revert-linux-user-add-more-compat-ioctl-definitions.patch
0004-Revert-linux-user-fix-compat-with-glibc-2.36-sys-mou.patch

Remove --disable-virtiofsd [1]

The "linux-user: fix compat with glibc >= 2.36 sys/mount.h" fix has
been reverted, so Qemu expect distros to ship the 2.36 maint release
with the fix [2]. So any existing glibc 2.36 based toolchain without
the fix will fail again to build qemu.

System emulation on 32-bit x86 hosts has been deprecated.
The QEMU project no longer considers 32-bit x86 host support for
system emulation to be an effective use of its limited resources,
and thus intends to discontinue. User mode emulation continues to be
supported on 32-bit hosts

Disable Hexagon idef-parser compiler to avoid build issue while
building hexagon-linux-user for the target. Indeed idef-parser is a
host (native) tool that requires host-glib2, host-flex and host-bison.
Keep it disabled for now since hexagon-linux-user build with
--disable-hexagon-idef-parser.

Runtime tested in gitlab:
https://gitlab.com/kubu93/buildroot/-/pipelines/845076149

[1] https://gitlab.com/qemu-project/qemu/-/commit/8ab5e8a503b55eb27672777cfedea902bb22a246
[2] https://gitlab.com/qemu-project/qemu/-/commit/6003159ce18faad4e1bc7bf9c85669019cd4950e
[3] https://gitlab.com/qemu-project/qemu/-/blob/v8.0.0/target/hexagon/meson.build#L191

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ux-user-add-more-compat-ioctl-definitions.patch | 73 -------------------
 ...x-user-fix-compat-with-glibc-2.36-sys-mou.patch | 82 ----------------------
 package/qemu/qemu.hash                             |  2 +-
 package/qemu/qemu.mk                               |  5 +-
 4 files changed, 3 insertions(+), 159 deletions(-)

diff --git a/package/qemu/0003-Revert-linux-user-add-more-compat-ioctl-definitions.patch b/package/qemu/0003-Revert-linux-user-add-more-compat-ioctl-definitions.patch
deleted file mode 100644
index 2d303cd012..0000000000
--- a/package/qemu/0003-Revert-linux-user-add-more-compat-ioctl-definitions.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 274f00f33411caee51973a9f7701daf194da5a0a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
-Date: Tue, 10 Jan 2023 12:49:00 -0500
-Subject: [PATCH] Revert "linux-user: add more compat ioctl definitions"
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This reverts commit c5495f4ecb0cdaaf2e9dddeb48f1689cdb520ca0.
-
-glibc has fixed (in 2.36.9000-40-g774058d729) the problem
-that caused a clash when both sys/mount.h annd linux/mount.h
-are included, and backported this to the 2.36 stable release
-too:
-
-  https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E
-
-It is saner for QEMU to remove the workaround it applied for
-glibc 2.36 and expect distros to ship the 2.36 maint release
-with the fix. This avoids needing to add a further workaround
-to QEMU to deal with the fact that linux/brtfs.h now also pulls
-in linux/mount.h via linux/fs.h since Linux 6.1
-
-Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-Id: <20230110174901.2580297-2-berrange@redhat.com>
-Signed-off-by: Laurent Vivier <laurent@vivier.eu>
-
-Upstream: https://gitlab.com/qemu-project/qemu/-/commit/9f0246539ae84a5e21efd1cc4516fc343f08115a
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- linux-user/syscall.c | 25 -------------------------
- 1 file changed, 25 deletions(-)
-
-diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 24b25759be..10af5e0d8e 100644
---- a/linux-user/syscall.c
-+++ b/linux-user/syscall.c
-@@ -111,31 +111,6 @@
- #define FS_IOC32_SETFLAGS              _IOW('f', 2, int)
- #define FS_IOC32_GETVERSION            _IOR('v', 1, int)
- #define FS_IOC32_SETVERSION            _IOW('v', 2, int)
--
--#define BLKGETSIZE64 _IOR(0x12,114,size_t)
--#define BLKDISCARD _IO(0x12,119)
--#define BLKIOMIN _IO(0x12,120)
--#define BLKIOOPT _IO(0x12,121)
--#define BLKALIGNOFF _IO(0x12,122)
--#define BLKPBSZGET _IO(0x12,123)
--#define BLKDISCARDZEROES _IO(0x12,124)
--#define BLKSECDISCARD _IO(0x12,125)
--#define BLKROTATIONAL _IO(0x12,126)
--#define BLKZEROOUT _IO(0x12,127)
--
--#define FIBMAP     _IO(0x00,1)
--#define FIGETBSZ   _IO(0x00,2)
--
--struct file_clone_range {
--        __s64 src_fd;
--        __u64 src_offset;
--        __u64 src_length;
--        __u64 dest_offset;
--};
--
--#define FICLONE         _IOW(0x94, 9, int)
--#define FICLONERANGE    _IOW(0x94, 13, struct file_clone_range)
--
- #else
- #include <linux/fs.h>
- #endif
--- 
-2.25.1
-
diff --git a/package/qemu/0004-Revert-linux-user-fix-compat-with-glibc-2.36-sys-mou.patch b/package/qemu/0004-Revert-linux-user-fix-compat-with-glibc-2.36-sys-mou.patch
deleted file mode 100644
index 2a36a5cbb4..0000000000
--- a/package/qemu/0004-Revert-linux-user-fix-compat-with-glibc-2.36-sys-mou.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From e07973ca745958da739f8ece80273da48f94f031 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
-Date: Tue, 10 Jan 2023 12:49:01 -0500
-Subject: [PATCH] Revert "linux-user: fix compat with glibc >= 2.36
- sys/mount.h"
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This reverts commit 3cd3df2a9584e6f753bb62a0028bd67124ab5532.
-
-glibc has fixed (in 2.36.9000-40-g774058d729) the problem
-that caused a clash when both sys/mount.h annd linux/mount.h
-are included, and backported this to the 2.36 stable release
-too:
-
-  https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E
-
-It is saner for QEMU to remove the workaround it applied for
-glibc 2.36 and expect distros to ship the 2.36 maint release
-with the fix. This avoids needing to add a further workaround
-to QEMU to deal with the fact that linux/brtfs.h now also pulls
-in linux/mount.h via linux/fs.h since Linux 6.1
-
-Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-Id: <20230110174901.2580297-3-berrange@redhat.com>
-Signed-off-by: Laurent Vivier <laurent@vivier.eu>
-
-Upstream: https://gitlab.com/qemu-project/qemu/-/commit/6003159ce18faad4e1bc7bf9c85669019cd4950e
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- linux-user/syscall.c | 18 ------------------
- meson.build          |  2 --
- 2 files changed, 20 deletions(-)
-
-diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 10af5e0d8e..d974c76b60 100644
---- a/linux-user/syscall.c
-+++ b/linux-user/syscall.c
-@@ -95,25 +95,7 @@
- #include <linux/soundcard.h>
- #include <linux/kd.h>
- #include <linux/mtio.h>
--
--#ifdef HAVE_SYS_MOUNT_FSCONFIG
--/*
-- * glibc >= 2.36 linux/mount.h conflicts with sys/mount.h,
-- * which in turn prevents use of linux/fs.h. So we have to
-- * define the constants ourselves for now.
-- */
--#define FS_IOC_GETFLAGS                _IOR('f', 1, long)
--#define FS_IOC_SETFLAGS                _IOW('f', 2, long)
--#define FS_IOC_GETVERSION              _IOR('v', 1, long)
--#define FS_IOC_SETVERSION              _IOW('v', 2, long)
--#define FS_IOC_FIEMAP                  _IOWR('f', 11, struct fiemap)
--#define FS_IOC32_GETFLAGS              _IOR('f', 1, int)
--#define FS_IOC32_SETFLAGS              _IOW('f', 2, int)
--#define FS_IOC32_GETVERSION            _IOR('v', 1, int)
--#define FS_IOC32_SETVERSION            _IOW('v', 2, int)
--#else
- #include <linux/fs.h>
--#endif
- #include <linux/fd.h>
- #if defined(CONFIG_FIEMAP)
- #include <linux/fiemap.h>
-diff --git a/meson.build b/meson.build
-index b88867ca9d..39e83bbafe 100644
---- a/meson.build
-+++ b/meson.build
-@@ -2032,8 +2032,6 @@ config_host_data.set('HAVE_OPTRESET',
-                      cc.has_header_symbol('getopt.h', 'optreset'))
- config_host_data.set('HAVE_IPPROTO_MPTCP',
-                      cc.has_header_symbol('netinet/in.h', 'IPPROTO_MPTCP'))
--config_host_data.set('HAVE_SYS_MOUNT_FSCONFIG',
--                     cc.has_header_symbol('sys/mount.h', 'FSCONFIG_SET_FLAG'))
- 
- # has_member
- config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID',
--- 
-2.25.1
-
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 93f7c98f1c..e76aef0b3a 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  8c85699acf9d7a43a5fe29a64cdd56370b0c2d1ad074baf7098a824d17aad73b  qemu-7.2.1.tar.xz
+sha256  bb60f0341531181d6cc3969dd19a013d0427a87f918193970d9adb91131e56d0  qemu-8.0.0.tar.xz
 sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 12d52f61bf..acf40bd50f 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, check whether the list of supported targets
 # needs to be updated.
-QEMU_VERSION = 7.2.1
+QEMU_VERSION = 8.0.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
@@ -302,13 +302,13 @@ define QEMU_CONFIGURE_CMDS
 			--disable-vhost-crypto \
 			--disable-vhost-user-blk-server \
 			--disable-virtfs \
-			--disable-virtiofsd \
 			--disable-whpx \
 			--disable-xen \
 			--enable-attr \
 			--enable-kvm \
 			--enable-vhost-net \
 			--with-git-submodules=ignore \
+			--disable-hexagon-idef-parser \
 			$(QEMU_OPTS)
 endef
 
@@ -474,7 +474,6 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--disable-selinux \
 		--disable-vde \
 		--disable-vhost-user-blk-server \
-		--disable-virtiofsd \
 		--disable-vnc-jpeg \
 		--disable-png \
 		--disable-vnc-sasl \

--===============4404975537011083589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4404975537011083589==--
