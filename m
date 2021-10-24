Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A564C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 14:37:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A32536054F
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 14:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A32536054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 527B4400DD;
	Sun, 24 Oct 2021 14:37:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OKEihGQ9f-Bo; Sun, 24 Oct 2021 14:37:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1523440275;
	Sun, 24 Oct 2021 14:37:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6296C1BF47D
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 14:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5180080F44
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 14:37:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p3Kosg1FbfCB for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 14:37:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47DEE80F38
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 14:37:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 815F888652; Sun, 24 Oct 2021 14:34:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 16:37:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7bd4ecc56d1328f8a6b9efc91ed339bdfc0514b6
X-Git-Newrev: 51682c03a8b99d42c1b4e253da80c127d9146c9f
X-Patchwork-Hint: ignore
Message-Id: <20211024143412.815F888652@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2: backport parallel-build fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=51682c03a8b99d42c1b4e253da80c127d9146c9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There seems to still be a similar parallel build issue, but with this
patch applied, it occurs much less frequently: from a 1/3rf failure
rate, I am now experiencing failures under the 1/10th mark.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...e-Make-libgrub.pp-depend-on-config-util.h.patch | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/boot/grub2/0150-Makefile-Make-libgrub.pp-depend-on-config-util.h.patch b/boot/grub2/0150-Makefile-Make-libgrub.pp-depend-on-config-util.h.patch
new file mode 100644
index 0000000000..129e814982
--- /dev/null
+++ b/boot/grub2/0150-Makefile-Make-libgrub.pp-depend-on-config-util.h.patch
@@ -0,0 +1,66 @@
+From 42f4054faf3c7f2cd2cab5b43e63f9d97d81f7a1 Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Wed, 4 Mar 2020 12:58:42 +0100
+Subject: [PATCH 150/150] Makefile: Make libgrub.pp depend on config-util.h
+
+If you build with "make -j48" a lot, sometimes you see:
+
+gcc -E -DHAVE_CONFIG_H -I. -I..  -Wall -W -DGRUB_UTIL=1 -D_FILE_OFFSET_BITS=64 -I./include -DGRUB_FILE=\"grub_script.tab.h\" -I. -I.. -I. -I.. -I../include -I./include -I../grub-core/lib/libgcrypt-grub/src/  -I../grub-core/lib/minilzo -I../grub-core/lib/xzembed -DMINILZO_HAVE_CONFIG_H -Wall -W -DGRUB_UTIL=1 -D_FILE_OFFSET_BITS=64 -I./include -DGRUB_FILE=\"grub_script.tab.h\" -I. -I.. -I. -I.. -I../include -I./include -I../grub-core/lib/libgcrypt-grub/src/  -I./grub-core/gnulib -I../grub-core/gnulib -I/builddir/build/BUILD/grub-2.02/grub-aarch64-efi-2.02 -D_FILE_OFFSET_BITS=64 \
+  -D'GRUB_MOD_INIT(x)=@MARKER@x@' grub_script.tab.h grub_script.yy.h ../grub-core/commands/blocklist.c ../grub-core/commands/macbless.c ../grub-core/commands/xnu_uuid.c ../grub-core/commands/testload.c ../grub-core/commands/ls.c ../grub-core/disk/dmraid_nvidia.c ../grub-core/disk/loopback.c ../grub-core/disk/lvm.c ../grub-core/disk/mdraid_linux.c ../grub-core/disk/mdraid_linux_be.c ../grub-core/disk/mdraid1x_linux.c ../grub-core/disk/raid5_recover.c ../grub-core/disk/raid6_recover.c ../grub-core/font/font.c ../grub-core/gfxmenu/font.c ../grub-core/normal/charset.c ../grub-core/video/fb/fbblit.c ../grub-core/video/fb/fbutil.c ../grub-core/video/fb/fbfill.c ../grub-core/video/fb/video_fb.c ../grub-core/video/video.c ../grub-core/video/capture.c ../grub-core/video/colors.c ../grub-core/unidata.c ../grub-core/io/bufio.c ../grub-core/fs/affs.c ../grub-core/fs/afs.c ../grub-core/fs/bfs.c ../grub-core/fs/btrfs.c ../grub-core/fs/cbfs.c ../grub-core/fs/cpio.c ../grub-core/fs/cpio_be.c ../gru
 b-core/fs/odc.c ../grub-core/fs/newc.c ../grub-core/fs/ext2.c ../grub-core/fs/fat.c ../grub-core/fs/exfat.c ../grub-core/fs/fshelp.c ../grub-core/fs/hfs.c ../grub-core/fs/hfsplus.c ../grub-core/fs/hfspluscomp.c ../grub-core/fs/iso9660.c ../grub-core/fs/jfs.c ../grub-core/fs/minix.c ../grub-core/fs/minix2.c ../grub-core/fs/minix3.c ../grub-core/fs/minix_be.c ../grub-core/fs/minix2_be.c ../grub-core/fs/minix3_be.c ../grub-core/fs/nilfs2.c ../grub-core/fs/ntfs.c ../grub-core/fs/ntfscomp.c ../grub-core/fs/reiserfs.c ../grub-core/fs/romfs.c ../grub-core/fs/sfs.c ../grub-core/fs/squash4.c ../grub-core/fs/tar.c ../grub-core/fs/udf.c ../grub-core/fs/ufs2.c ../grub-core/fs/ufs.c ../grub-core/fs/ufs_be.c ../grub-core/fs/xfs.c ../grub-core/fs/zfs/zfscrypt.c ../grub-core/fs/zfs/zfs.c ../grub-core/fs/zfs/zfsinfo.c ../grub-core/fs/zfs/zfs_lzjb.c ../grub-core/fs/zfs/zfs_lz4.c ../grub-core/fs/zfs/zfs_sha256.c ../grub-core/fs/zfs/zfs_fletcher.c ../grub-core/lib/envblk.c ../grub-core/lib/hexdump.c ..
 /grub-core/lib/LzFind.c ../grub-core/lib/LzmaEnc.c ../grub-core/lib/crc.c ../grub-core/lib/adler32.c ../grub-core/lib/crc64.c ../grub-core/normal/datetime.c ../grub-core/normal/misc.c ../grub-core/partmap/acorn.c ../grub-core/partmap/amiga.c ../grub-core/partmap/apple.c ../grub-core/partmap/sun.c ../grub-core/partmap/plan.c ../grub-core/partmap/dvh.c ../grub-core/partmap/sunpc.c ../grub-core/partmap/bsdlabel.c ../grub-core/partmap/dfly.c ../grub-core/script/function.c ../grub-core/script/lexer.c ../grub-core/script/main.c ../grub-core/script/script.c ../grub-core/script/argv.c ../grub-core/io/gzio.c ../grub-core/io/xzio.c ../grub-core/io/lzopio.c ../grub-core/kern/ia64/dl_helper.c ../grub-core/kern/arm/dl_helper.c ../grub-core/kern/arm64/dl_helper.c ../grub-core/lib/minilzo/minilzo.c ../grub-core/lib/xzembed/xz_dec_bcj.c ../grub-core/lib/xzembed/xz_dec_lzma2.c ../grub-core/lib/xzembed/xz_dec_stream.c ../util/misc.c ../grub-core/kern/command.c ../grub-core/kern/device.c ../grub-core/
 kern/disk.c ../grub-core/lib/disk.c ../util/getroot.c ../grub-core/osdep/unix/getroot.c ../grub-core/osdep/getroot.c ../grub-core/osdep/devmapper/getroot.c ../grub-core/osdep/relpath.c ../grub-core/kern/emu/hostdisk.c ../grub-core/osdep/devmapper/hostdisk.c ../grub-core/osdep/hostdisk.c ../grub-core/osdep/unix/hostdisk.c ../grub-core/osdep/exec.c ../grub-core/osdep/sleep.c ../grub-core/osdep/password.c ../grub-core/kern/emu/misc.c ../grub-core/kern/emu/mm.c ../grub-core/kern/env.c ../grub-core/kern/err.c ../grub-core/kern/file.c ../grub-core/kern/fs.c ../grub-core/kern/list.c ../grub-core/kern/misc.c ../grub-core/kern/partition.c ../grub-core/lib/crypto.c ../grub-core/disk/luks.c ../grub-core/disk/geli.c ../grub-core/disk/cryptodisk.c ../grub-core/disk/AFSplitter.c ../grub-core/lib/pbkdf2.c ../grub-core/commands/extcmd.c ../grub-core/lib/arg.c ../grub-core/disk/ldm.c ../grub-core/disk/diskfilter.c ../grub-core/partmap/gpt.c ../grub-core/partmap/msdos.c ../grub-core/fs/proc.c ../grub
 -core/fs/archelp.c > libgrub.pp || (rm -f libgrub.pp; exit 1)
+rm -f stamp-h1
+touch ../config-util.h.in
+cd . && /bin/sh ./config.status config-util.h
+config.status: creating config-util.h
+In file included from ../include/grub/mm.h:25:0,
+                 from ../include/grub/disk.h:29,
+                 from ../include/grub/file.h:26,
+                 from ../grub-core/fs/btrfs.c:21:
+./config.h:38:10: fatal error: ./config-util.h: No such file or directory
+ #include <config-util.h>
+          ^~~~~~~~~~~~~~~
+compilation terminated.
+make: *** [Makefile:13098: libgrub.pp] Error 1
+
+This is because libgrub.pp is built with -DGRUB_UTIL=1, which means
+it'll try to include config-util.h, but a parallel make is actually
+building that file.  I think.
+
+Signed-off-by: Peter Jones <pjones@redhat.com>
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 1f4bb9b8c..bf9c1ba64 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -37,7 +37,7 @@ grub_script.yy.c: grub_script.yy.h
+ CLEANFILES += grub_script.yy.c grub_script.yy.h
+ 
+ # For libgrub.a
+-libgrub.pp: grub_script.tab.h grub_script.yy.h $(libgrubmods_a_SOURCES) $(libgrubkern_a_SOURCES)
++libgrub.pp: config-util.h grub_script.tab.h grub_script.yy.h $(libgrubmods_a_SOURCES) $(libgrubkern_a_SOURCES)
+ 	$(CPP) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(libgrubmods_a_CPPFLAGS) $(libgrubkern_a_CPPFLAGS) $(CPPFLAGS) \
+ 	  -D'GRUB_MOD_INIT(x)=@MARKER@x@' $^ > $@ || (rm -f $@; exit 1)
+ CLEANFILES += libgrub.pp
+-- 
+2.25.1
+
+diff --git a/Makefile.in b/Makefile.in
+index 1f4bb9b8c..bf9c1ba64 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -37,7 +37,7 @@ grub_script.yy.c: grub_script.yy.h
+ CLEANFILES += grub_script.yy.c grub_script.yy.h
+ 
+ # For libgrub.a
+-libgrub.pp: grub_script.tab.h grub_script.yy.h $(libgrubmods_a_SOURCES) $(libgrubkern_a_SOURCES)
++libgrub.pp: config-util.h grub_script.tab.h grub_script.yy.h $(libgrubmods_a_SOURCES) $(libgrubkern_a_SOURCES)
+ 	$(CPP) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(libgrubmods_a_CPPFLAGS) $(libgrubkern_a_CPPFLAGS) $(CPPFLAGS) \
+ 	  -D'GRUB_MOD_INIT(x)=@MARKER@x@' $^ > $@ || (rm -f $@; exit 1)
+ CLEANFILES += libgrub.pp
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
