Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F89C3DA4A
	for <buildroot@archiver.kernel.org>; Sun, 11 Aug 2024 20:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E42C40268;
	Sun, 11 Aug 2024 20:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jHgmjcSbhTVW; Sun, 11 Aug 2024 20:16:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4033E4027C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4033E4027C;
	Sun, 11 Aug 2024 20:16:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF1421BF20D
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 20:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8DF680F7C
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 20:16:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JdVOqKmS6KDV for <buildroot@lists.busybox.net>;
 Sun, 11 Aug 2024 20:16:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2578D80F78
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2578D80F78
 for <buildroot@buildroot.org>; Sun, 11 Aug 2024 20:16:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 115B084E85; Sun, 11 Aug 2024 20:16:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 11 Aug 2024 22:14:23 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: de8fdc4fc754ebd3abc83009910745030992eae9
X-Git-Newrev: 5c10737191eeb79f48415025639466a0de93a552
X-Patchwork-Hint: ignore
Message-Id: <20240811201655.115B084E85@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/gcc: disallow
 Fortran on gcc 12/13 on Microblaze
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

commit: https://git.buildroot.net/buildroot/commit/?id=5c10737191eeb79f48415025639466a0de93a552
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The build of gcc with Fortran support is broken on gcc 12.x and gcc
13.x, it fails with:

../../../libgfortran/generated/bessel_r8.c: In function 'bessel_yn_r8':
../../../libgfortran/generated/bessel_r8.c:178:1: internal compiler error: in gen_reg_rtx, at emit-rtl.cc:1167

This issue has been fixed in gcc 14.x, which builds a Microblaze
Fortran-capable toolchain successfully.

Since we're not really interested in figuring out the commit that
fixed the problem, let's simply disallow the selection of Fortran with
gcc12/13 on Microblaze.

Fixes:

  http://autobuild.buildroot.net/results/5b4eee1d9b119c9f923f9518618f45a6482ddc85/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 41f25676184fdbb3243c3709b925369679e7423a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/Config.in.host | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 33f2477bfc..4ad74e34fd 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -106,6 +106,10 @@ config BR2_TOOLCHAIN_BUILDROOT_FORTRAN
 	# on architecture building libquadmath, wchar is required
 	depends on !BR2_TOOLCHAIN_HAS_LIBQUADMATH || \
 		(BR2_TOOLCHAIN_HAS_LIBQUADMATH && BR2_USE_WCHAR)
+	# internal compiler error: in gen_reg_rtx, at emit-rtl.cc:1167
+	# fixed in gcc 14.x, so disable gcc 12.x/13.x
+	depends on !(BR2_microblaze && \
+		(BR2_GCC_VERSION_12_X || BR2_GCC_VERSION_13_X))
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
 	  Enable this option if you want your toolchain to support the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
