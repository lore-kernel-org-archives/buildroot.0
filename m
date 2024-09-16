Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6208BC3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 08:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86F408137C;
	Mon, 16 Sep 2024 08:34:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oCPfIjAlEK8x; Mon, 16 Sep 2024 08:34:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F41C381402
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F41C381402;
	Mon, 16 Sep 2024 08:34:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 40F551BF311
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 08:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CB9F405D5
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 08:34:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sSZ4FhCnrdbI for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 08:34:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B7D740159
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B7D740159
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 08:34:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0706183763; Mon, 16 Sep 2024 08:34:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 10:27:50 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 0c99fd35bfb5e3d912e40155412e98348ef847d4
X-Git-Newrev: 3b655b9cb1c6b661a2f8c2c211370314b817e069
X-Patchwork-Hint: ignore
Message-Id: <20240916083410.0706183763@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libgpg-error:
 needs MMU
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b655b9cb1c6b661a2f8c2c211370314b817e069
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

libgpg-error imported code using fork() in commit [1] and enabled it
soon after in [2]. Those commits were first included in libgpg-error
version 1.28.

For reference, the libgpg-error Buildroot package was updated to that
version in commit [3].

When Buildroot configuration has no MMU support (e.g. BR2_USE_MMU is
not set), libgpg-error fails to build with error:

    /build/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: ./.libs/libgpg-error.a(libgpg_error_la-spawn-posix.o): in function '_gpgrt_process_spawn':
    spawn-posix.c:(.text+0x630): undefined reference to 'fork'

This issue can be observed with the command:

    utils/test-pkg -a -p libgpg-error

It will show few build failures:

    ...
       bootlin-armv7m-uclibc [ 6/41]: FAILED
    ...
    bootlin-m68k-5208-uclibc [ 8/41]: FAILED
    ...

This commit fixes the issue by adding the dependency on BR2_USE_MMU
in BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS. Doing so will
automatically propagates this dependency to all packages using
libgpg-error (and thus, already depending on this _ARCH_SUPPORTS).

Fixes:
http://autobuild.buildroot.org/results/dbc82ba08e6a30c2f558c8c36ad7eeb0e3cab090/
http://autobuild.buildroot.org/results/074a803de0f48cd86b9135cca50f136cccf1bcea/
http://autobuild.buildroot.org/results/4c1966a71020af31c1dc1b0a13a3928c84e75874/
...and many others.

[1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commitdiff;h=8f41cc23b12485404203be5881aaaadb78696b4d
[2] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commitdiff;h=1865c0ba1769b407a3c504f1ab0a4278704a9fc1
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/692d191c8b0b3c86022e6a6ba3bd2d8f53b39f03

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fee74a7a9f535f782626ccf0e4d88b623333fe1c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgpg-error/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgpg-error/Config.in b/package/libgpg-error/Config.in
index 5a2c14ead8..a0ee7ec531 100644
--- a/package/libgpg-error/Config.in
+++ b/package/libgpg-error/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 		BR2_sh4a	|| BR2_sh4aeb		|| \
 		BR2_sparc	|| BR2_sparc64		|| \
 		BR2_x86_64
+	depends on BR2_USE_MMU # fork()
 
 config BR2_PACKAGE_LIBGPG_ERROR
 	bool "libgpg-error"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
