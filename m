Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB04C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 15:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A6A360643;
	Sat, 13 Jul 2024 15:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7m3wiBaEGOZx; Sat, 13 Jul 2024 15:55:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1700D60769
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1700D60769;
	Sat, 13 Jul 2024 15:55:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E505E1BF406
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 15:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEA024018E
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 15:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_uFFDWlh83s for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 15:55:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0C0340096
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0C0340096
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 15:55:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2056817AA; Sat, 13 Jul 2024 15:55:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 17:53:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 538a99a33a2729b829ee07394de1a19dd955814a
X-Git-Newrev: 41f25676184fdbb3243c3709b925369679e7423a
X-Patchwork-Hint: ignore
Message-Id: <20240713155547.C2056817AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: disallow Fortran on gcc 12/13
 on Microblaze
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=41f25676184fdbb3243c3709b925369679e7423a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/gcc/Config.in.host | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index c88518a415..5d3b803c78 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -103,6 +103,10 @@ config BR2_TOOLCHAIN_BUILDROOT_FORTRAN
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
