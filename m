Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC3FC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:52:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03B7B60F41
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 03B7B60F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2BA34157F;
	Tue,  3 Aug 2021 22:52:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vGv4ASllFiQ8; Tue,  3 Aug 2021 22:52:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E68D414A0;
	Tue,  3 Aug 2021 22:52:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A15311BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAA0D405D5
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mfgBhAmzOoz1 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B8234056E
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C102C843F5; Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 1 Jun 2021 21:48:49 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6b4b63a571d7e12042d661852f034ff413ec25a7
X-Git-Newrev: 826d350fc345273c56b8f3059aef2aac93181107
X-Patchwork-Hint: ignore
Message-Id: <20210803210946.C102C843F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] uclibc: powerpc: fix PIE/PIC
 builds with secureplt enabled by default
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=826d350fc345273c56b8f3059aef2aac93181107
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Apply the fix provided by Yann Sionneau when secureplt is enabled
by default by gcc compiler along with PIE/PIC options.

"For the secure PLT to work in PIC, the r30 register needs to point to the GOT"

Fixes:
[qemu_ppc_e500mc_defconfig] https://gitlab.com/buildroot.org/buildroot/-/jobs/1255661606
[qemu_ppc_g3beige_defconfig] https://gitlab.com/buildroot.org/buildroot/-/jobs/1255661607
[qemu_ppc_mac99_defconfig] https://gitlab.com/buildroot.org/buildroot/-/jobs/1255661609

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yann Sionneau <yann@sionneau.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...-PIE-PIC-builds-with-newer-gcc-binutils-w.patch | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/package/uclibc/0001-powerpc-fix-PIE-PIC-builds-with-newer-gcc-binutils-w.patch b/package/uclibc/0001-powerpc-fix-PIE-PIC-builds-with-newer-gcc-binutils-w.patch
new file mode 100644
index 0000000000..040699df83
--- /dev/null
+++ b/package/uclibc/0001-powerpc-fix-PIE-PIC-builds-with-newer-gcc-binutils-w.patch
@@ -0,0 +1,91 @@
+From 6c95eccff5eb43c8c3ad865d3b1316b7952cc58e Mon Sep 17 00:00:00 2001
+From: Yann Sionneau <yann@sionneau.net>
+Date: Fri, 28 May 2021 08:59:58 +0200
+Subject: [PATCH] powerpc: fix PIE/PIC builds with newer gcc/binutils which use
+ secureplt by default
+
+This patch fixes segfault of all user space processes (including init, which caused a panic) on recent buildroot powerpc32 builds.
+
+The issue has been reported by Romain Naour in this thread: https://mailman.uclibc-ng.org/pipermail/devel/2021-May/002068.html
+
+Recent buildroot toolchain enables secure PLT in powerpc gcc.
+The latter will then supply -msecure-plt to gas invocations by default.
+Recent buildroot also enables PIE by default.
+
+For the secure PLT to work in PIC, the r30 register needs to point to the GOT.
+Old "bss plt" was just a one-instruction-wide PLT slot, pointed-to by a R_PPC_JMP_SLOT relocation, which was written on-the-fly to contain a branch instruction to the correct address. It therefore had to stay writable+executable, which you generally want to avoid for security reasons.
+New secure PLT only contains read-only code which loads the branch address from the writable GOT.
+
+Note: secure PLT without PIC does not need r30 to be set. Because offset between plt stub code and got is known at link-time. In this case the PLT entry looks like:
+1009b3e0 <__uClibc_main@plt>:
+1009b3e0:       3d 60 10 0e     lis     r11,4110
+1009b3e4:       81 6b 03 74     lwz     r11,884(r11)
+1009b3e8:       7d 69 03 a6     mtctr   r11
+1009b3ec:       4e 80 04 20     bctr
+
+Whereas secure PLT with PIC - offset between plt and got is unknown at link-time - looks like this:
+000af800 <00000000.plt_pic32.__uClibc_main>:
+   af800:       81 7e 03 80     lwz     r11,896(r30)
+   af804:       7d 69 03 a6     mtctr   r11
+   af808:       4e 80 04 20     bctr
+   af80c:       60 00 00 00     nop
+
+Upstream status: Pending:
+https://mailman.uclibc-ng.org/pipermail/devel/2021-May/002091.html
+
+Signed-off-by: Yann Sionneau <yann@sionneau.net>
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ Rules.mak                         | 3 ++-
+ ldso/ldso/powerpc/dl-startup.h    | 3 +++
+ libc/sysdeps/linux/powerpc/crt1.S | 4 ++++
+ 3 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/Rules.mak b/Rules.mak
+index 10f88b3de..60ac59b85 100644
+--- a/Rules.mak
++++ b/Rules.mak
+@@ -477,9 +477,10 @@ ifeq ($(TARGET_ARCH),powerpc)
+ 	PICFLAG:=-fpic
+ 	PIEFLAG_NAME:=-fpie
+ 	PPC_HAS_REL16:=$(shell printf "\t.text\n\taddis 11,30,_GLOBAL_OFFSET_TABLE_-.@ha\n" | $(CC) -c -x assembler -o /dev/null -  2> /dev/null && echo -n y || echo -n n)
++	PPC_HAS_SECUREPLT:=$(shell $(CC) --verbose 2>&1 | grep -- --enable-secureplt > /dev/null && echo -n y || echo -n n)
++	CPU_CFLAGS-$(PPC_HAS_SECUREPLT) += -DPPC_HAS_SECUREPLT
+ 	CPU_CFLAGS-$(PPC_HAS_REL16)+= -DHAVE_ASM_PPC_REL16
+ 	CPU_CFLAGS-$(CONFIG_E500) += "-D__NO_MATH_INLINES"
+-
+ endif
+ 
+ ifeq ($(TARGET_ARCH),bfin)
+diff --git a/ldso/ldso/powerpc/dl-startup.h b/ldso/ldso/powerpc/dl-startup.h
+index 8b2a517e2..7749395eb 100644
+--- a/ldso/ldso/powerpc/dl-startup.h
++++ b/ldso/ldso/powerpc/dl-startup.h
+@@ -25,6 +25,9 @@ __asm__(
+ #else
+     "	bl	_GLOBAL_OFFSET_TABLE_-4@local\n" /*  Put our GOT pointer in r31, */
+     "	mflr	31\n"
++#endif
++#ifdef PPC_HAS_SECUREPLT
++    "   mr      30,31\n"
+ #endif
+     "	addi	1,1,16\n" /* Restore SP */
+     "	lwz	7,_dl_skip_args@got(31)\n" /* load EA of _dl_skip_args */
+diff --git a/libc/sysdeps/linux/powerpc/crt1.S b/libc/sysdeps/linux/powerpc/crt1.S
+index 27bfc5a5a..3f5d056c0 100644
+--- a/libc/sysdeps/linux/powerpc/crt1.S
++++ b/libc/sysdeps/linux/powerpc/crt1.S
+@@ -56,6 +56,10 @@ _start:
+ # else
+ 	bl	_GLOBAL_OFFSET_TABLE_-4@local
+ 	mflr	r31
++# endif
++	/* in PIC/PIE, plt stubs need r30 to point to the GOT if using secure-plt */
++# ifdef PPC_HAS_SECUREPLT
++	mr	30,31
+ # endif
+ #endif
+ 	/* Set up the small data pointer in r13.  */
+-- 
+2.31.1
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
