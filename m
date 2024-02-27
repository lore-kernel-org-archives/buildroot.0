Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410EEC54798
	for <buildroot@archiver.kernel.org>; Tue, 27 Feb 2024 21:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C842D40596;
	Tue, 27 Feb 2024 21:35:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dzYVhva-sXa8; Tue, 27 Feb 2024 21:35:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DCF64038C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DCF64038C;
	Tue, 27 Feb 2024 21:35:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D0BE1BF3DC
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 21:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 291FA40278
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 21:35:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kwIY5VdLG4Vs for <buildroot@lists.busybox.net>;
 Tue, 27 Feb 2024 21:35:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3411740103
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3411740103
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3411740103
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 21:35:26 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:48ec:5da2:e30:94b9])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 3B9A219F574;
 Tue, 27 Feb 2024 22:35:22 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 27 Feb 2024 22:35:17 +0100
Message-ID: <20240227213517.241837-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709069723;
 bh=y2p2ih2BwWYXtpKsFXkvFaa1UfRi4KsLPl7kGkrw71k=;
 h=From:To:Cc:Subject:Date:From;
 b=iI/1CPMcqLpAEBGmdBfC1vYzAPSCj445mrivc66tNM3VbtBkDDi7Fw4Y+4g9sawep
 7QH4olTCIhtILvXvOkuBEdIRHAY5rDTriCSzc5CtrvXqfw5PAsqbqggGoXhmIRis8y
 +lLM4+Kz6tLFdZpU8jsaJtKVd36NXyEUCSYZ7ahWcQbVjO5ByYR3ZDvSS40NlDRthq
 8zkJOJgPvvIny3/WM/UfPmL9pszKi5Eyf9reVAsGlWYfNThoecOyJ7Iw+jCSys3Fol
 l3s+XzpMeIEuuCtCcLAVgDlpUF8MFFzATmmr24LN1I/G9d+gVREmtGD2qI4C/8mxv7
 7EF2GFbaABVZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iI/1CPMc
Subject: [Buildroot] [PATCH 1/1] boot/syslinux: fix build with gnu-efi >=
 3.0.16
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit fa9893ad8f "package/gnu-efi: bump to version 3.0.17" updated
gnu-efi. This update introduced syslinux build failure, as reported
in [1].

This commit adds a package patch to fix this issue. For technical
details of the issue, see the package patch commit log.

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/6256880937
- https://gitlab.com/buildroot.org/buildroot/-/jobs/6256880949

[1] https://lists.buildroot.org/pipermail/buildroot/2024-February/685971.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                           |  1 +
 ...stddef.h-add-wchar_t-type-definition.patch | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 boot/syslinux/0019-stddef.h-add-wchar_t-type-definition.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index a6cc58c448c..a98a53fbf36 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -118,6 +118,7 @@ boot/syslinux/0013-Fix-build-with-gnu-efi-version-3.0.9.patch Upstream
 boot/syslinux/0014-Fix-build-with-binutils-note-gnu-property-section.patch Upstream
 boot/syslinux/0016-Workaround-multiple-definition-of-symbol-errors.patch Upstream
 boot/syslinux/0017-Replace-builtin-strlen-that-appears-to-get-optimized.patch Upstream
+boot/syslinux/0019-stddef.h-add-wchar_t-type-definition.patch
 linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch Upstream
 package/18xx-ti-utils/0001-plt.h-fix-build-with-gcc-10.patch Upstream
 package/4th/0001-avoid-regen-during-install.patch Upstream
diff --git a/boot/syslinux/0019-stddef.h-add-wchar_t-type-definition.patch b/boot/syslinux/0019-stddef.h-add-wchar_t-type-definition.patch
new file mode 100644
index 00000000000..ac98c47dfdc
--- /dev/null
+++ b/boot/syslinux/0019-stddef.h-add-wchar_t-type-definition.patch
@@ -0,0 +1,58 @@
+From 063dac55c45d0264671c3463e824ab659e5cbb87 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Tue, 27 Feb 2024 21:09:15 +0100
+Subject: [PATCH] stddef.h: add wchar_t type definition
+
+Syslinux fail to build with gnu-efi >= 3.0.16 with error:
+
+    In file included from /host/i686-buildroot-linux-gnu/sysroot/usr/include/efi/efi.h:44,
+                     from /build/syslinux-6.03/efi/efi.h:23,
+                     from /build/syslinux-6.03/efi/adv.h:4,
+                     from /build/syslinux-6.03/efi/adv.c:29:
+    /host/i686-buildroot-linux-gnu/sysroot/usr/include/efi/ia32/efibind.h:90:9: error: unknown type name 'wchar_t'
+     typedef wchar_t CHAR16;
+             ^~~~~~~
+
+This is because gnu-efi started to use the "wchar_t" type from the
+toolchain's <stddef.h> header, in commit [1]. Before this commit,
+gnu-efi was defining the type as "short".
+
+Syslinux is including its own minimal stddef.h file, which masks the
+one provided by the toolchain. See [2]. This file does not have a type
+definition for "wchar_t".
+
+Finally, the POSIX <stddef.h> header is supposed to provide this
+"wchar_t" type definition. See [3].
+
+This commit fixes the issue by adding the "wchar_t" type definition in
+the com32/include/stddef.h header. Since Syslinux has "-fshort-wchar"
+in its CFLAGS (see [4]), "wchar_t" is simply defined as "short". This
+also follow the previous gnu-efi < 3.0.16 behavior.
+
+This issue was seen in Buildroot Linux, in [5].
+
+[1] https://sourceforge.net/p/gnu-efi/code/ci/189200d0b0f6fff473d302880d9569f45d4d8c4d
+[2] https://repo.or.cz/syslinux.git/blob/refs/tags/syslinux-6.03:/com32/include/stddef.h
+[3] https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/stddef.h.html
+[4] https://repo.or.cz/syslinux.git/blob/refs/tags/syslinux-6.03:/mk/efi.mk#l27
+[5] https://lists.buildroot.org/pipermail/buildroot/2024-February/685971.html
+
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ com32/include/stddef.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/com32/include/stddef.h b/com32/include/stddef.h
+index f52d62f3..437b11f2 100644
+--- a/com32/include/stddef.h
++++ b/com32/include/stddef.h
+@@ -29,4 +29,6 @@
+  */
+ #define container_of(p, c, m) ((c *)((char *)(p) - offsetof(c,m)))
+ 
++typedef short wchar_t;
++
+ #endif /* _STDDEF_H */
+-- 
+2.44.0
+
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
