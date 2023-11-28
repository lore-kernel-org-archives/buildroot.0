Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A768C4167B
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 22:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0454061AAF;
	Tue, 28 Nov 2023 22:56:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0454061AAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cx2bcr3L8XF5; Tue, 28 Nov 2023 22:56:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A7CE612BE;
	Tue, 28 Nov 2023 22:56:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A7CE612BE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB65C1BF379
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 22:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84215612BE
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 22:56:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84215612BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aOvGu7uQ8hwJ for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 22:56:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CC2360C0F
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 22:56:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CC2360C0F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5970E87536; Tue, 28 Nov 2023 22:56:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Nov 2023 23:55:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5af07dce9eb2333a863b09ac1c06eb35f3adb70
X-Git-Newrev: ca169d1d0a5df92e6a1f0850e6969cc525849e6f
X-Patchwork-Hint: ignore
Message-Id: <20231128225645.5970E87536@busybox.osuosl.org>
Subject: [Buildroot] [git commit] system/Config.in: disable openrc with
 uclibc
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca169d1d0a5df92e6a1f0850e6969cc525849e6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openrc raises the following uclibc build failures since bump to version
0.51 in commit 730c90faa3ec13ee1ead47113c9c5c7d3a8dac55:

../src/rc-abort/rc-abort.c: In function 'main':
../src/rc-abort/rc-abort.c:27:21: error: implicit declaration of function 'kill'; did you mean 'killpg'? [-Werror=implicit-function-declaration]
   27 |                 if (kill(pid, SIGUSR1) != 0)
      |                     ^~~~
      |                     killpg

../src/libeinfo/libeinfo.c: In function 'colour_terminal':
../src/libeinfo/libeinfo.c:319:26: error: implicit declaration of function 'fileno' [-Werror=implicit-function-declaration]
  319 |         if (f && !isatty(fileno(f)))
      |                          ^~~~~~

../src/librc/librc-misc.c: In function 'rc_getfile':
../src/librc/librc-misc.c:79:14: error: implicit declaration of function 'fileno'; did you mean 'd_fileno'? [-Werror=implicit-function-declaration]
   79 |         fd = fileno(fp);
      |              ^~~~~~
      |              d_fileno

../src/librc/librc-daemon.c: In function 'rc_service_daemons_crashed':
../src/librc/librc-daemon.c:633:37: error: implicit declaration of function 'kill'; did you mean 'killpg'? [-Werror=implicit-function-declaration]
  633 |                                 if (kill(pid, 0) == -1 && errno == ESRCH)
      |                                     ^~~~
      |                                     killpg

These build failures could be fixed by patching openrc but upstream
is not happy with this patch: https://github.com/OpenRC/openrc/pull/674.

So, as advised by Yann E. Morin, openrc is hidden away for uClibc, until
upstream has a proper fix.

Fixes:
 - http://autobuild.buildroot.org/results/494ef392a971ddb3c5c7b01e0149c6439018dbe7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 0b4dc9543e..b90e40e415 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -105,12 +105,13 @@ config BR2_INIT_OPENRC
 	bool "OpenRC"
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	select BR2_PACKAGE_OPENRC
 	select BR2_PACKAGE_SKELETON_INIT_OPENRC if BR2_ROOTFS_SKELETON_DEFAULT
 
-comment "openrc needs a toolchain w/ dynamic library"
+comment "openrc needs a glibc or musl toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS && BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 
 # In Buildroot, we decided not to support a split-usr when systemd is
 # used as an init system. This is a design decision, not a systemd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
