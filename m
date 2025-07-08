Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8AEC83F09
	for <buildroot@archiver.kernel.org>; Tue,  8 Jul 2025 20:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4805812D4;
	Tue,  8 Jul 2025 20:11:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6jJtJCePVhO; Tue,  8 Jul 2025 20:11:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D9968130E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D9968130E;
	Tue,  8 Jul 2025 20:11:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 917ED12E
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 20:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83AB440924
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 20:11:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KVf3GuVsBDkO for <buildroot@buildroot.org>;
 Tue,  8 Jul 2025 20:11:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 711E24090D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 711E24090D
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 20:11:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A595861CA; Tue,  8 Jul 2025 20:11:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Jul 2025 21:56:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 250a115c32bcb2146f6a8e51a4e43f5ffecd280c
X-Git-Newrev: 2c868ca44d44e92c73758fc9381cb54129f1388c
X-Patchwork-Hint: ignore
Message-Id: <20250708201125.6A595861CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xen: fix build for arm with
 binutils >= 2.41
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0264284510899395518=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0264284510899395518==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2c868ca44d44e92c73758fc9381cb54129f1388c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Xen currently fails to build for 32-bit Arm v7 with binutils >= 2.41,
with the following error:

    proc-v7.S:33: Error: junk at end of line, first unrecognized character is `#'

The failure can be reproduced with the commands:

    cat >.config <<EOF
    BR2_arm=y
    BR2_cortex_a9=y
    BR2_ARM_ENABLE_VFP=y
    BR2_ARM_EABIHF=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
    BR2_PACKAGE_XEN=y
    BR2_PACKAGE_XEN_HYPERVISOR=y
    BR2_PACKAGE_XEN_TOOLS=y
    EOF
    make olddefconfig
    make xen

Backport a patch from Xen 4.18 plus one patch it depends on to fix the
build.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Alistair Francis <alistair@alistair23.me>
[Julien:
 - reword commit title
 - add commands to reproduce the issue in commit log
 - add missing SoB lines to patches
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-avoid-.rodata-to-be-marked-as-executable.patch | 58 +++++++++++++++++
 ...sing-solaris-syntax-for-.section-directiv.patch | 73 ++++++++++++++++++++++
 2 files changed, 131 insertions(+)

diff --git a/package/xen/0007-xen-arm32-avoid-.rodata-to-be-marked-as-executable.patch b/package/xen/0007-xen-arm32-avoid-.rodata-to-be-marked-as-executable.patch
new file mode 100644
index 0000000000..9c484698ca
--- /dev/null
+++ b/package/xen/0007-xen-arm32-avoid-.rodata-to-be-marked-as-executable.patch
@@ -0,0 +1,58 @@
+From 99314e08c6450a841d4f7155b7ce364e0990df1c Mon Sep 17 00:00:00 2001
+From: Jan Beulich <jbeulich@suse.com>
+Date: Fri, 11 Jun 2021 11:19:15 +0200
+Subject: [PATCH] xen/arm32: avoid .rodata to be marked as executable
+
+The section .proc.info lives in .rodata as it doesn't contain any
+executable code. However, the section is still marked as executable
+as the consequence .rodata will also be marked executable.
+
+Xen doesn't use the ELF permissions to decide the page-table mapping
+permission. However, this will confuse disassemblers.
+
+'#execinstr' is now removed on all the pushsection dealing with
+.proc.info
+
+Signed-off-by: Jan Beulich <jbeulich@suse.com>
+[julieng: Rework the commit message]
+Acked-by: Julien Grall <jgrall@amazon.com>
+Upstream: https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=163f47c14737cfa9dfb3240deea356b08caf7614
+Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
+---
+ xen/arch/arm/arm32/proc-v7.S | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/xen/arch/arm/arm32/proc-v7.S b/xen/arch/arm/arm32/proc-v7.S
+index 46bfc7a..8b418ed 100644
+--- a/xen/arch/arm/arm32/proc-v7.S
++++ b/xen/arch/arm/arm32/proc-v7.S
+@@ -30,7 +30,7 @@ brahma15mp_init:
+         mcr   CP32(r0, ACTLR)
+         mov   pc, lr
+ 
+-        .section ".proc.info", #alloc, #execinstr
++        .section ".proc.info", #alloc
+         .type __v7_ca15mp_proc_info, #object
+ __v7_ca15mp_proc_info:
+         .long 0x410FC0F0             /* Cortex-A15 */
+@@ -39,7 +39,7 @@ __v7_ca15mp_proc_info:
+         .long caxx_processor
+         .size __v7_ca15mp_proc_info, . - __v7_ca15mp_proc_info
+ 
+-        .section ".proc.info", #alloc, #execinstr
++        .section ".proc.info", #alloc
+         .type __v7_ca7mp_proc_info, #object
+ __v7_ca7mp_proc_info:
+         .long 0x410FC070             /* Cortex-A7 */
+@@ -48,7 +48,7 @@ __v7_ca7mp_proc_info:
+         .long caxx_processor
+         .size __v7_ca7mp_proc_info, . - __v7_ca7mp_proc_info
+ 
+-        .section ".proc.info", #alloc, #execinstr
++        .section ".proc.info", #alloc
+         .type __v7_brahma15mp_proc_info, #object
+ __v7_brahma15mp_proc_info:
+         .long 0x420F00F0             /* Broadcom Brahma-B15 */
+-- 
+2.48.1
+
diff --git a/package/xen/0008-arm-Avoid-using-solaris-syntax-for-.section-directiv.patch b/package/xen/0008-arm-Avoid-using-solaris-syntax-for-.section-directiv.patch
new file mode 100644
index 0000000000..127c126f99
--- /dev/null
+++ b/package/xen/0008-arm-Avoid-using-solaris-syntax-for-.section-directiv.patch
@@ -0,0 +1,73 @@
+From be0ff8586e38823d6ee08e031c28e5831bbb0991 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 1 Aug 2023 10:49:30 -0700
+Subject: [PATCH] arm: Avoid using solaris syntax for .section directive
+
+Assembler from binutils 2.41 will rejects ([1], [2]) the following
+syntax
+
+.section "name", #alloc
+
+for any other any target other than ELF SPARC. This means we can't use
+it in the Arm code.
+
+So switch to the GNU syntax
+
+.section name [, "flags"[, @type]]
+
+[1] https://sourceware.org/bugzilla/show_bug.cgi?id=11601
+[2] https://sourceware.org/binutils/docs-2.41/as.html#Section
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Reviewed-by: Michal Orzel <michal.orzel@amd.com>
+[jgrall: Reword commit message]
+Acked-by: Julien Grall <jgrall@amazon.com>
+Upstream: https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=dfc490a3740bb7d6889939934afadcb58891fbce
+Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
+---
+ xen/arch/arm/arm32/proc-v7.S | 6 +++---
+ xen/arch/arm/dtb.S           | 2 +-
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/xen/arch/arm/arm32/proc-v7.S b/xen/arch/arm/arm32/proc-v7.S
+index 8b418ed..9869780 100644
+--- a/xen/arch/arm/arm32/proc-v7.S
++++ b/xen/arch/arm/arm32/proc-v7.S
+@@ -30,7 +30,7 @@ brahma15mp_init:
+         mcr   CP32(r0, ACTLR)
+         mov   pc, lr
+ 
+-        .section ".proc.info", #alloc
++        .section .proc.info, "a"
+         .type __v7_ca15mp_proc_info, #object
+ __v7_ca15mp_proc_info:
+         .long 0x410FC0F0             /* Cortex-A15 */
+@@ -39,7 +39,7 @@ __v7_ca15mp_proc_info:
+         .long caxx_processor
+         .size __v7_ca15mp_proc_info, . - __v7_ca15mp_proc_info
+ 
+-        .section ".proc.info", #alloc
++        .section .proc.info, "a"
+         .type __v7_ca7mp_proc_info, #object
+ __v7_ca7mp_proc_info:
+         .long 0x410FC070             /* Cortex-A7 */
+@@ -48,7 +48,7 @@ __v7_ca7mp_proc_info:
+         .long caxx_processor
+         .size __v7_ca7mp_proc_info, . - __v7_ca7mp_proc_info
+ 
+-        .section ".proc.info", #alloc
++        .section .proc.info, "a"
+         .type __v7_brahma15mp_proc_info, #object
+ __v7_brahma15mp_proc_info:
+         .long 0x420F00F0             /* Broadcom Brahma-B15 */
+diff --git a/xen/arch/arm/dtb.S b/xen/arch/arm/dtb.S
+index c703aef..8771daf 100644
+--- a/xen/arch/arm/dtb.S
++++ b/xen/arch/arm/dtb.S
+@@ -1,2 +1,2 @@
+-        .section .dtb,#alloc
++        .section .dtb, "a"
+         .incbin CONFIG_DTB_FILE
+-- 
+2.48.1
+

--===============0264284510899395518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0264284510899395518==--
