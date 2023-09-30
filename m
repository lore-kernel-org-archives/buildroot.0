Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9315E77363
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 15:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 756984159C;
	Sat, 30 Sep 2023 15:39:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 756984159C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pgN1yBZhitgp; Sat, 30 Sep 2023 15:39:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4233541C2A;
	Sat, 30 Sep 2023 15:38:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4233541C2A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9ED7E1BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 771E882141
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 771E882141
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id obkSOBrU1OIe for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 15:38:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A67EF82138
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:38:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A67EF82138
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84B9F83B4C; Sat, 30 Sep 2023 15:38:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 17:37:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68969dcbf00535bab3d8010a3e7e15572acbd3f0
X-Git-Newrev: d797ecc6f026e1f0af17f91df33e8cd44731a97f
X-Patchwork-Hint: ignore
Message-Id: <20230930153856.84B9F83B4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc/gcc-final: only install
 libgcc_s for shared library builds
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

commit: https://git.buildroot.net/buildroot/commit/?id=d797ecc6f026e1f0af17f91df33e8cd44731a97f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit
55e83008fc82cf621d94d60ab4401a4848880bc2 ("package/gcc/gcc-final:
rework installation of libgcc_s/libatomic"), we reworked the libgcc_s
installation. In the previous code, libgcc_s was installed to
STAGING_DIR/TARGET_DIR unconditionally, but a "-cp" command was used,
which means that any failure was ignored. As we are now more picky, it
has become clear that this in fact wasn't entirely correct: libgcc_s
only exists for shared builds. For static builds, only libgcc.a is
available, but it doesn't need to be installed to STAGING_DIR (for
some reason, and as it was never installed by Buildroot, it has always
worked without libgcc.a in STAGING_DIR).

So long story short: we change the code to only install libgcc_s when
BR2_STATIC_LIBS is disabled. This fixes the following build failure on
BR2_STATIC_LIBS=y builds:

cp -dpf /home/thomas/buildroot/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/lib*/libgcc_s* /home/thomas/buildroot/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/lib/
cp: cannot stat '/home/thomas/buildroot/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/lib*/libgcc_s*': No such file or directory

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc-final/gcc-final.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 11104167af..edb9b2f73a 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -144,7 +144,11 @@ HOST_GCC_FINAL_POST_INSTALL_HOOKS += TOOLCHAIN_WRAPPER_INSTALL
 # -cc symlink to the wrapper is not created.
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
 
-GCC_FINAL_LIBS = libgcc_s libatomic
+GCC_FINAL_LIBS = libatomic
+
+ifeq ($(BR2_STATIC_LIBS),)
+GCC_FINAL_LIBS += libgcc_s
+endif
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 GCC_FINAL_USR_LIBS += libstdc++
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
