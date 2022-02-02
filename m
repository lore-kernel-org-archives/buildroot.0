Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1D1C433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 21:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FD8D409A3;
	Wed,  2 Feb 2022 21:44:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GozC-CLUeXYt; Wed,  2 Feb 2022 21:44:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94043405B6;
	Wed,  2 Feb 2022 21:44:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51F381BF300
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 21:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45FE7608B7
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 21:44:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EY90_k_OdxuZ for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 21:44:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EDB860864
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 21:43:59 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FNPxnTBBhkz4hFNPxnvE1d; Wed, 02 Feb 2022 22:43:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643838238; bh=C25Nc7W6DuyK4dE1hMvkYob4eIRMllzOOt6861PjjUM=;
 h=From:To:Subject:Date:MIME-Version;
 b=ENU0yp55z7rW2ynBh5XzmGz3pmuZqlnKHH1ZQyfmXFt7vTTTAJTTENyHVxdo1bBvr
 d1HiNH8otrwu2hT7a9abiZFieMDswGlnomlstgOs8WOE5Swq2iemcjwTdOK/YXyU2i
 AQiHFf8Z0saUQNDPFQOpph9+9zV8qd0eMVo3QIeqGq6mbPCMnQsfwXUykx2owSHlMq
 MzNJb5IO1x+YXTw+7ZVwtVQsltYZCM4EDCAh9dL/fMhZE/ZPaoaEjUJz7TjEpJq693
 Rj8TffloLKc91gCU/wbDBnB7pGqPk92NtPWpezHXhEiz5mq7CjsefmPGbv/5ur61uH
 U2oFYKwoNz6iQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  2 Feb 2022 22:43:57 +0100
Message-Id: <20220202214357.2640301-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfOvKybK/PacO3YuO+7OFdQgGCt+3BEJEMYwmNYkBSzXCJlxKYD51fkO3ynqkwWVxHqRmsjfSnp30Jtzv/jP9Fgw6WYALk88G1VYvp9YMHaWXQ9+tXG/i
 UGoETnAlko43wf4c6lkZtJyAgy6f07SnfVKwMMW7nrGMzCWydDDibDXNvWEs+/5M+F+U/frj4mg90wRCbjjaeydHknOQvtxhIqtjzKbvj66ZgZPm+bKiIhi1
 JoyA3HpRmetNyTcRN7MXBmtERld9kxLYEHVde+tk1OvgLLaKf8+1XPiM6wajsbvG
Subject: [Buildroot] [PATCH] board/intel/galileo: fix build failure with
 host gcc 10
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Nicholas Sielicki <sielicki@yandex.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 ...relocs-Make-per_cpu_load_addr-static.patch | 39 +++++++++++++++++++
 configs/galileo_defconfig                     |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 board/intel/galileo/patches/linux/0001-x86-relocs-Make-per_cpu_load_addr-static.patch

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
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
