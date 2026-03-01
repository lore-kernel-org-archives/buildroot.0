Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D42EEF312
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 08:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F2CC818C4;
	Thu,  5 Mar 2026 08:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tjm3zzm6oH2P; Thu,  5 Mar 2026 08:02:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0AEE818D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772697763;
	bh=nFa/yuJxV5G2eTiJ5v06jhzzg00GJ1QWDJTrKvJ1CkY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Fd4oYY72ZYAjZGxhE0HF770hDZfrNddULJ4rr3blwBo1zYL7KuYVRXVbKuACnZZrG
	 WOOBFuZhlN3JK/nfuTWb3cuNRKqp8EAuMxZU0M0ov1icsoqjpqAGdrzkjDgZ0DVUkx
	 Ibo00YpcjNVnXLmxmPc4LnoGFiNI1/M2Wx5hSTeFB3J377UXrB/rLcxBvHhATGRgpv
	 jljZXd4AFfWCisqwU/dgN5DHp/XuKNZhH5D2aJGNaJNtGPH8UzspKf2V7S+YGIUvJO
	 txbDvMDefGtYPCRsAbNMxt8Aw/X0rJYSNicfjWtGKhj7eHezFOB5X57pmqZzlrgBPT
	 KxIR6ODL/CKkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0AEE818D0;
	Thu,  5 Mar 2026 08:02:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 103A125B
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EB42406C4
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w2Bloly_IMjQ for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 08:02:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E63E40627
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E63E40627
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B0BF82913; Thu,  5 Mar 2026 08:02:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Mar 2026 21:26:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20db09684bb848582d690b3c7ddb2c20d8284245
X-Git-Newrev: e555590b94532097c1319b9450ac84fab06b758b
X-Patchwork-Hint: ignore
Message-Id: <20260305080209.1B0BF82913@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/shim: Fix build with binutils 2.46
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e555590b94532097c1319b9450ac84fab06b758b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 101997e334efcbfd9bde3100ae75400177cfa56f added binutils
2.46.0 to -next branch causing a build error with shim:

output/per-package/shim/host/bin/x86_64-buildroot-linux-gnu-objcopy:
 shimx64.so: file format not recognized
output/per-package/shim/host/bin/x86_64-buildroot-linux-gnu-objcopy:
 mmx64.so: file format not recognized

Added an upstream patch to fix the problem.

No backport to buildroot LTS branches necessary.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/shim/0001-Fix-build-with-binutils-2.46.patch | 51 +++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/boot/shim/0001-Fix-build-with-binutils-2.46.patch b/boot/shim/0001-Fix-build-with-binutils-2.46.patch
new file mode 100644
index 0000000000..05ab7b2c83
--- /dev/null
+++ b/boot/shim/0001-Fix-build-with-binutils-2.46.patch
@@ -0,0 +1,51 @@
+From c4665d282072df2ed8ab6ae1d5fa0de41e5db02f Mon Sep 17 00:00:00 2001
+From: Luca Boccassi <luca.boccassi@gmail.com>
+Date: Tue, 6 Jan 2026 11:48:13 +0100
+Subject: [PATCH] Fix build with binutils 2.46
+
+With the new binutils which is in development and in Fedora Rawhide:
+
+objcopy -D -j .text -j .sdata -j .data -j .data.ident \
+        -j .dynamic -j .rodata -j .rel* \
+        -j .rela* -j .dyn -j .reloc -j .eh_frame \
+        -j .vendor_cert -j .sbat -j .sbatlevel \
+        --file-alignment 0x1000 \
+        --target efi-app-x86_64 fbx64.so fbx64.efi
+objcopy: fbx64.so: file format not recognized
+
+It seems it was an intentional compat break, according to the upstream
+commit:
+
+https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=5e83077d552ed6f81dbc092eb3ccf827a43de42c
+
+* Internal changes to plugin support, and stricter target checking may result
+  in some errors being exposed in user options passed to the various binutils.
+  For example objcopy --target=TARGET now will only work if the input file is
+  for TARGET whereas prior versions of objcopy accepted other target input
+  files and produced a TARGET output.  If you do in fact want the old
+  behaviour the correct usage is objcopy --output-target=TARGET.
+
+Switch from --taget to --output-target as suggested.
+
+Signed-off-by: Luca Boccassi <luca.boccassi@gmail.com>
+
+Upstream: https://github.com/rhboot/shim/commit/c4665d282072df2ed8ab6ae1d5fa0de41e5db02f
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Make.defaults | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Make.defaults b/Make.defaults
+index c5fa32bec..9b40b7f4a 100644
+--- a/Make.defaults
++++ b/Make.defaults
+@@ -155,7 +155,7 @@ endif
+ 
+ LIB_GCC		= $(shell $(CC) $(ARCH_CFLAGS) -print-libgcc-file-name)
+ EFI_LIBS	= -lefi -lgnuefi --start-group Cryptlib/libcryptlib.a Cryptlib/OpenSSL/libopenssl.a --end-group $(LIB_GCC)
+-FORMAT		?= --target efi-app-$(ARCH)
++FORMAT		?= --output-target efi-app-$(ARCH)
+ LOCAL_EFI_PATH	= gnu-efi/$(ARCH_GNUEFI)/gnuefi
+ LIBDIR		= gnu-efi/$(ARCH_GNUEFI)/lib
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
