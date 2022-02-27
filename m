Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAC4C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 20:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73D7C60669;
	Sun, 27 Feb 2022 20:06:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id spR26_YD_TeM; Sun, 27 Feb 2022 20:06:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA745605BA;
	Sun, 27 Feb 2022 20:06:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40CF41BF2AA
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 20:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE0D460669
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 20:04:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zH39C6puGI26 for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 20:04:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2757A605BA
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 20:04:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A883F82B3F; Sun, 27 Feb 2022 19:56:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 20:58:15 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 3a1d44dfa0580ae203aa0ce19c613f7a8a610160
X-Git-Newrev: 0cc9eed5d452fe1f083203447d7869ecf8d9f927
X-Patchwork-Hint: ignore
Message-Id: <20220227195643.A883F82B3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] board/intel/galileo: fix
 build failure with host gcc 10
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

commit: https://git.buildroot.net/buildroot/commit/?id=0cc9eed5d452fe1f083203447d7869ecf8d9f927
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Building galileo_defconfig throws error:
```
/usr/bin/ld: arch/x86/tools/relocs_64.o:(.bss+0x0): multiple definition of `per_cpu_load_addr'; arch/x86/tools/relocs_32.o:(.bss+0x0): first defined here
```

To fix this let's add an upstreamed patch[1] and add BR2_GLOBAL_PATCH_DIR
to galileo_defconfig to point to where patch is.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eeeda4cd06e828b331b15741a204ff9f5874d28d.patch

Fixes:
https://gitlab.com/ymorin/buildroot/-/jobs/2035821039

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 9dd5382d791c3d5197b9ef401a0d103ad1457d5d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-x86-relocs-Make-per_cpu_load_addr-static.patch | 39 ++++++++++++++++++++++
 configs/galileo_defconfig                          |  1 +
 2 files changed, 40 insertions(+)

diff --git a/board/intel/galileo/patches/linux/0001-x86-relocs-Make-per_cpu_load_addr-static.patch b/board/intel/galileo/patches/linux/0001-x86-relocs-Make-per_cpu_load_addr-static.patch
new file mode 100644
index 0000000000..1d206cc6d1
--- /dev/null
+++ b/board/intel/galileo/patches/linux/0001-x86-relocs-Make-per_cpu_load_addr-static.patch
@@ -0,0 +1,39 @@
+From eeeda4cd06e828b331b15741a204ff9f5874d28d Mon Sep 17 00:00:00 2001
+From: Ben Hutchings <ben@decadent.org.uk>
+Date: Wed, 24 Sep 2014 13:30:12 +0100
+Subject: [PATCH] x86/relocs: Make per_cpu_load_addr static
+
+per_cpu_load_addr is only used for 64-bit relocations, but is
+declared in both configurations of relocs.c - with different
+types.  This has undefined behaviour in general.  GNU ld is
+documented to use the larger size in this case, but other tools
+may differ and some warn about this.
+
+References: https://bugs.debian.org/748577
+Reported-by: Michael Tautschnig <mt@debian.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+Cc: 748577@bugs.debian.org
+Cc: Linus Torvalds <torvalds@linux-foundation.org>
+Link: http://lkml.kernel.org/r/1411561812.3659.23.camel@decadent.org.uk
+Signed-off-by: Ingo Molnar <mingo@kernel.org>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ arch/x86/tools/relocs.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/x86/tools/relocs.c b/arch/x86/tools/relocs.c
+index bbb1d2259ecf..a5efb21d5228 100644
+--- a/arch/x86/tools/relocs.c
++++ b/arch/x86/tools/relocs.c
+@@ -695,7 +695,7 @@ static void walk_relocs(int (*process)(struct section *sec, Elf_Rel *rel,
+  *
+  */
+ static int per_cpu_shndx	= -1;
+-Elf_Addr per_cpu_load_addr;
++static Elf_Addr per_cpu_load_addr;
+ 
+ static void percpu_init(void)
+ {
+-- 
+2.25.1
+
diff --git a/configs/galileo_defconfig b/configs/galileo_defconfig
index 03ca23f414..a8fd0a6dcc 100644
--- a/configs/galileo_defconfig
+++ b/configs/galileo_defconfig
@@ -1,4 +1,5 @@
 BR2_x86_x1000=y
+BR2_GLOBAL_PATCH_DIR=board/intel/galileo/patches
 # Needed for TARGET_GRUB2
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 # Linux headers same as kernel, a 3.14 series
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
