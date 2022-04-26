Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873D3C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 20:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4726E83E7A;
	Tue, 26 Apr 2022 20:50:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TJP111XgeKrA; Tue, 26 Apr 2022 20:50:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FD4F83E78;
	Tue, 26 Apr 2022 20:50:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4D721BF5AD
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 20:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF66C40A93
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 20:50:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5xmKVX54_5ky for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 20:50:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6485040AA7
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 20:50:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D5496844EB; Tue, 26 Apr 2022 20:39:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Apr 2022 22:49:33 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f7b3a8bf07413b05724eb043eebb1169214061d8
X-Git-Newrev: dfb3203bb81f1a7f0b562c12dae77f2b9a7635de
X-Patchwork-Hint: ignore
Message-Id: <20220426203953.D5496844EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/qemu: fix
 host-qemu compilation with Ubuntu GCC 11
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
Content-Type: multipart/mixed; boundary="===============6813331473882097477=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6813331473882097477==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=dfb3203bb81f1a7f0b562c12dae77f2b9a7635de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes:
cc1: error: ‘-fcf-protection’ is not compatible with this target

The new Ubuntu GCC packages (e.g. Ubuntu 11.2.0-7ubuntu2, 11.2.0) turn
on ‘-fcf-protection’ globally, which causes a build failure in the x86
realmode code. Turn it off explicitly on compilers that understand this
option.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 213629f2d3050465d2a6cb6842d056f71648fe55)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

--===============6813331473882097477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6813331473882097477==--
