Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29A3C77B7F
	for <buildroot@archiver.kernel.org>; Thu, 11 May 2023 20:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1805D613A1;
	Thu, 11 May 2023 20:43:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1805D613A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QCXb_8gPOt9G; Thu, 11 May 2023 20:43:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 305DC6116F;
	Thu, 11 May 2023 20:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 305DC6116F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3DAB21BF283
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 20:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15B9F42A7A
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 20:43:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15B9F42A7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ySUksjZ5R7Dx for <buildroot@lists.busybox.net>;
 Thu, 11 May 2023 20:43:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC92542A79
 for <buildroot@buildroot.org>; Thu, 11 May 2023 20:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC92542A79
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7BC286383; Thu, 11 May 2023 20:43:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 11 May 2023 22:41:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e217cd28ece8bb07d5eb5c61f9b22b3de8480b3c
X-Git-Newrev: f3fa74a8f745de7b60752e0b15432eb1f2b4c638
X-Patchwork-Hint: ignore
Message-Id: <20230511204351.D7BC286383@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/busybox: disable stack
 optimization for i386 target
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3fa74a8f745de7b60752e0b15432eb1f2b4c638
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The toolchain-builder project reported an issue with Qemu 7.2.0 for
x86-core2--glibc--bleeding-edge toolchain [1]:

  Run /sbin/init as init process
  random: fast init done
  EXT4-fs (vda): warning: mounting unchecked fs, running e2fsck is recommended
  EXT4-fs (vda): re-mounted. Opts: (null). Quota mode: disabled.
  Starting syslogd: OK
  traps: syslogd[52] general protection fault ip:b7e21465 sp:bfe59e6c error:0 in libc.so.6[b7d9b000+123000]
  Starting klogd: OK
  traps: klogd[56] general protection fault ip:b7e94465 sp:bf8f069c error:0 in libc.so.6[b7e0e000+123000]
  Running sysctl: traps: logger[62] general protection fault ip:b7e48b6c sp:bfd7d194 error:0 in libc.so.6[b7e05000+123000]
  Segmentation fault
  traps: logger[64] general protection fault ip:b7dd3b6c sp:bf9b8604 error:0 in libc.so.6[b7d90000+123000]
  Segmentation fault

  (Followed by a kernel panic.)

Testing with the pevious Qemu release (7.1.0) allows to boot the system without any problem.

Building qemu sources between 7.1.0 and 7.2.0 allows to identify the first "bad" commit [2] and
report to the Qemu project [3].

Thanks to Qemu maintainers review, several issues was noticed:

  "The default i386 busybox build config does not respect glibc's requirements around stack alignment
  (see [4] for previous discussions and a workaround)."

Disabling CONFIG_STACK_OPTIMIZATION_386 option (as suggested in the Gentoo bug report) fixed the issue!

This option has been added and enabled by default in buxybox 1_29_0, so it was used since then the for
Buildroot's qemu defconfig.

Note: The x86-i686--glibc--bleeding-edge (generic x86) doesn't trigger the issue with
CONFIG_STACK_OPTIMIZATION_386 enabled.

Fixes:
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/3731683337

[1] https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/3731683337
[2] https://gitlab.com/qemu-project/qemu/-/commit/958e1dd1300f37f18b2161dfb4eb806fc8c19b44
[3] https://gitlab.com/qemu-project/qemu/-/issues/1478
[4] https://bugs.gentoo.org/725674

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox-minimal.config | 2 +-
 package/busybox/busybox.config         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox-minimal.config b/package/busybox/busybox-minimal.config
index 1fb4e39e21..1e7ad1d357 100644
--- a/package/busybox/busybox-minimal.config
+++ b/package/busybox/busybox-minimal.config
@@ -53,7 +53,7 @@ CONFIG_EXTRA_CFLAGS=""
 CONFIG_EXTRA_LDFLAGS=""
 CONFIG_EXTRA_LDLIBS=""
 # CONFIG_USE_PORTABLE_CODE is not set
-CONFIG_STACK_OPTIMIZATION_386=y
+# CONFIG_STACK_OPTIMIZATION_386 is not set
 CONFIG_STATIC_LIBGCC=y
 
 #
diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 4826fb8242..6e8bd2799d 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -53,7 +53,7 @@ CONFIG_EXTRA_CFLAGS=""
 CONFIG_EXTRA_LDFLAGS=""
 CONFIG_EXTRA_LDLIBS=""
 # CONFIG_USE_PORTABLE_CODE is not set
-CONFIG_STACK_OPTIMIZATION_386=y
+# CONFIG_STACK_OPTIMIZATION_386 is not set
 CONFIG_STATIC_LIBGCC=y
 
 #
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
