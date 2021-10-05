Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB15C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:41:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3901061372
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3901061372
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14C25408C1;
	Tue,  5 Oct 2021 19:41:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EYmTCm5uIPU2; Tue,  5 Oct 2021 19:41:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56DE14089E;
	Tue,  5 Oct 2021 19:41:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3F761BF983
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2B5560C18
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u5pyv4uB3NRE for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A77A46068B
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 69B8E91216; Tue,  5 Oct 2021 19:34:51 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 5 Oct 2021 21:31:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16ca6f2f56e88abb9dbdee29e8d32ffdc5e78de9
X-Git-Newrev: daa315e1787168d221d513bbe98aff40d0e271eb
X-Patchwork-Hint: ignore
Message-Id: <20211005193451.69B8E91216@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mupdf: fix building with mips
 toolchains
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
Content-Type: multipart/mixed; boundary="===============5337306232076499768=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5337306232076499768==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=daa315e1787168d221d513bbe98aff40d0e271eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With some toolchains (e.g. mips64el), partial linking fails in the
following way:
/tmp/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/8.4.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: build/release/libmupdf.a(Dingbats.cff.o): ABI is incompatible with that of the selected emulation
/tmp/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/8.4.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: failed to merge target specific data of file build/release/libmupdf.a(Dingbats.cff.o)

Taking inspiration from commit
9eca4b9f84fe2535d8caee6eeb062ce33733bdf1, fix it by using GCC instead
of LD for partial linking.

Note that on mips the build will now produce warnings similar to this
one:
buildroot/output/host/lib/gcc/mips64el-buildroot-linux-gnu/10.3.0/../../../../mips64el-buildroot-linux-gnu/bin/ld: build/release/libmupdf.a(NotoSansTaiTham-Regular.ttf.o): warning: linking abicalls files with non-abicalls files

During a runtime test on mips64el under qemu, mupdf-x11 was
nonetheless able to display a sample PDF file correctly.

Fixes:
- http://autobuild.buildroot.net/results/156fe9ee5f6dccdc98990f6c5de5562383bc2b74/

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0004-Use-CC-instead-of-LD-for-OBJCOPY.patch    | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/mupdf/0004-Use-CC-instead-of-LD-for-OBJCOPY.patch b/package/mupdf/0004-Use-CC-instead-of-LD-for-OBJCOPY.patch
new file mode 100644
index 0000000000..0e0aadd29d
--- /dev/null
+++ b/package/mupdf/0004-Use-CC-instead-of-LD-for-OBJCOPY.patch
@@ -0,0 +1,43 @@
+From da4b98447573daf77829811e95e3772e8a296934 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
+Date: Thu, 2 Sep 2021 20:17:26 +0200
+Subject: [PATCH] Use CC instead of LD for OBJCOPY
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When cross-compiling for mips targets using Buildroot, using LD for
+partial linking fails in the following way:
+/tmp/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/8.4.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: build/release/libmupdf.a(Dingbats.cff.o): ABI is incompatible with that of the selected emulation
+/tmp/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/8.4.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: failed to merge target specific data of file build/release/libmupdf.a(Dingbats.cff.o)
+
+To fix it, use CC instead of LD for partial linking.
+
+'nostdlib' has to be added, or it will try to use GCC libraries for
+partial linking and fail with 'cannot find -lgcc_s'.
+
+Fixes:
+- http://autobuild.buildroot.net/results/156fe9ee5f6dccdc98990f6c5de5562383bc2b74
+
+Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
+[Upstream status: https://bugs.ghostscript.com/show_bug.cgi?id=704442]
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index b0fb617e2..0a8795e0e 100644
+--- a/Makefile
++++ b/Makefile
+@@ -64,7 +64,7 @@ endif
+ LINK_CMD = $(QUIET_LINK) $(MKTGTDIR) ; $(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
+ TAGS_CMD = $(QUIET_TAGS) ctags -R --c-kinds=+p
+ WINDRES_CMD = $(QUIET_WINDRES) $(MKTGTDIR) ; $(WINDRES) $< $@
+-OBJCOPY_CMD = $(QUIET_OBJCOPY) $(MKTGTDIR) ; $(LD) -r -b binary -z noexecstack -o $@ $<
++OBJCOPY_CMD = $(QUIET_OBJCOPY) $(MKTGTDIR) ; $(CC) -Wl,-r -Wl,-b -Wl,binary -Wl,-z -Wl,noexecstack -nostdlib -o $@ $<
+ 
+ # --- Rules ---
+ 
+-- 
+2.33.0
+

--===============5337306232076499768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5337306232076499768==--
