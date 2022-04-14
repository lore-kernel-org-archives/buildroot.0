Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAF4C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 19:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D1CF409F8;
	Thu, 14 Apr 2022 19:35:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f7KxJ7pBNPJm; Thu, 14 Apr 2022 19:35:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88540409D7;
	Thu, 14 Apr 2022 19:35:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 243F81BF319
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 133B981775
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:34:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b-KSSDZyq8du for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 19:34:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C387817D3
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 19:34:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 04CFF83C33; Thu, 14 Apr 2022 19:24:43 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 21:33:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec3ed4da3ab80157cc69f056c60e05febed857ed
X-Git-Newrev: 213629f2d3050465d2a6cb6842d056f71648fe55
X-Patchwork-Hint: ignore
Message-Id: <20220414192444.04CFF83C33@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: fix host-qemu compilation
 with Ubuntu GCC 11
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
Content-Type: multipart/mixed; boundary="===============2998335668263786284=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2998335668263786284==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=213629f2d3050465d2a6cb6842d056f71648fe55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
cc1: error: ‘-fcf-protection’ is not compatible with this target

The new Ubuntu GCC packages (e.g. Ubuntu 11.2.0-7ubuntu2, 11.2.0) turn
on ‘-fcf-protection’ globally, which causes a build failure in the x86
realmode code. Turn it off explicitly on compilers that understand this
option.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...d-disable-fcf-protection-on-march-486-m16.patch | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/package/qemu/0002-build-disable-fcf-protection-on-march-486-m16.patch b/package/qemu/0002-build-disable-fcf-protection-on-march-486-m16.patch
new file mode 100644
index 0000000000..7595d31c8d
--- /dev/null
+++ b/package/qemu/0002-build-disable-fcf-protection-on-march-486-m16.patch
@@ -0,0 +1,50 @@
+From 9584d3d00a454f47b0341465142bcf0735d734ae Mon Sep 17 00:00:00 2001
+From: Christian Ehrhardt <christian.ehrhardt@canonical.com>
+Date: Wed, 23 Mar 2022 10:07:13 +0100
+Subject: [PATCH] build: disable fcf-protection on -march=486 -m16
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Some of the roms build with -march=i486 -m16 which is incompatible
+with -fcf-protection. That in turn is can be set by default, for
+example in Ubuntu [1].
+That causes:
+ cc1: error: ‘-fcf-protection’ is not compatible with this target
+
+This won't work on -march=i486 -m16 and no matter if set or not we can
+override it to "none" if the option is known to the compiler to be
+able to build reliably.
+
+Fixes: https://gitlab.com/qemu-project/qemu/-/issues/889
+
+[1]: https://wiki.ubuntu.com/ToolChain/CompilerFlags#A-fcf-protection
+
+Signed-off-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>
+Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
+Reviewed-by: Thomas Huth <thuth@redhat.com>
+Message-Id: <20220323090713.1002588-1-christian.ehrhardt@canonical.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+Signed-off-by: Dario Binacchi <dariobin@libero.it>
+---
+ pc-bios/optionrom/Makefile | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
+index 5d55d25acca2..f1ef89807355 100644
+--- a/pc-bios/optionrom/Makefile
++++ b/pc-bios/optionrom/Makefile
+@@ -14,6 +14,10 @@ cc-option = $(if $(shell $(CC) $1 -c -o /dev/null -xc /dev/null >/dev/null 2>&1
+ 
+ override CFLAGS += -march=i486 -Wall
+ 
++# If -fcf-protection is enabled in flags or compiler defaults that will
++# conflict with -march=i486
++override CFLAGS += $(call cc-option, -fcf-protection=none)
++
+ # Flags for dependency generation
+ override CPPFLAGS += -MMD -MP -MT $@ -MF $(@D)/$(*F).d
+ 
+-- 
+2.32.0
+

--===============2998335668263786284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2998335668263786284==--
