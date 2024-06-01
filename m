Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F9FC25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 20:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA3F68429F;
	Sat,  1 Jun 2024 20:51:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rGWDiq4CPRK2; Sat,  1 Jun 2024 20:51:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91C51847BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91C51847BF;
	Sat,  1 Jun 2024 20:51:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C51A41BF4E5
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 20:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B164460733
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 20:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pMpRoINzQnbs for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 20:51:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D340A606F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D340A606F9
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 20:51:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CAE2E8769D; Sat,  1 Jun 2024 20:51:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jun 2024 22:51:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 507caef3ddf5ab7d933e14303508db057c4b9501
X-Git-Newrev: cc08d6f5d1a152279c340f56539a43d932ea0b0d
X-Patchwork-Hint: ignore
Message-Id: <20240601205131.CAE2E8769D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] micropython: Add patch to avoid textrel on
 arm/thumb
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
Content-Type: multipart/mixed; boundary="===============6951297446511488219=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6951297446511488219==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cc08d6f5d1a152279c340f56539a43d932ea0b0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-Make-non-Thumb2-long-jump-workaround-opt.patch | 130 +++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/package/micropython/0001-py-nlrthumb-Make-non-Thumb2-long-jump-workaround-opt.patch b/package/micropython/0001-py-nlrthumb-Make-non-Thumb2-long-jump-workaround-opt.patch
new file mode 100644
index 0000000000..b05791045e
--- /dev/null
+++ b/package/micropython/0001-py-nlrthumb-Make-non-Thumb2-long-jump-workaround-opt.patch
@@ -0,0 +1,130 @@
+From 7b050b366b7dacfb43779c51702a892d8f1873d0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>
+Date: Sun, 2 Apr 2023 19:58:42 +0200
+Subject: [PATCH] py/nlrthumb: Make non-Thumb2 long-jump workaround opt-in.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Although the original motivation given for the workaround[1] is correct,
+nlr.o and nlrthumb.o are linked with a small enough distance that the
+problem does not occur, and the workaround isn't necessary. The distance
+between the b instruction and its target (nlr_push_tail) is just 64
+bytes[2], well within the ±2046 byte range addressable by an
+unconditional branch instruction in Thumb mode.
+
+The workaround induces a relocation in the text section (textrel), which
+isn't supported everywhere, notably not on musl-libc[3], where it causes
+a crash on start-up. With the workaround removed, micropython works on an
+ARMv5T Linux system built with musl-libc.
+
+This commit changes nlrthumb.c to use a direct jump by default, but
+leaves the long jump workaround as an option for those cases where it's
+actually needed.
+
+[1]: commit dd376a239dc4f47b0ee7866810fcda151f3cf6dd
+
+Author: Damien George <damien.p.george@gmail.com>
+Date:   Fri Sep 1 15:25:29 2017 +1000
+
+    py/nlrthumb: Get working again on standard Thumb arch (ie not Thumb2).
+
+    "b" on Thumb might not be long enough for the jump to nlr_push_tail so
+    it must be done indirectly.
+
+[2]: Excerpt from objdump -d micropython:
+
+000095c4 <nlr_push_tail>:
+    95c4:       b510            push    {r4, lr}
+    95c6:       0004            movs    r4, r0
+    95c8:       f02d fd42       bl      37050 <mp_thread_get_state>
+    95cc:       6943            ldr     r3, [r0, #20]
+    95ce:       6023            str     r3, [r4, #0]
+    95d0:       6144            str     r4, [r0, #20]
+    95d2:       2000            movs    r0, #0
+    95d4:       bd10            pop     {r4, pc}
+
+000095d6 <nlr_pop>:
+    95d6:       b510            push    {r4, lr}
+    95d8:       f02d fd3a       bl      37050 <mp_thread_get_state>
+    95dc:       6943            ldr     r3, [r0, #20]
+    95de:       681b            ldr     r3, [r3, #0]
+    95e0:       6143            str     r3, [r0, #20]
+    95e2:       bd10            pop     {r4, pc}
+
+000095e4 <nlr_push>:
+    95e4:       60c4            str     r4, [r0, #12]
+    95e6:       6105            str     r5, [r0, #16]
+    95e8:       6146            str     r6, [r0, #20]
+    95ea:       6187            str     r7, [r0, #24]
+    95ec:       4641            mov     r1, r8
+    95ee:       61c1            str     r1, [r0, #28]
+    95f0:       4649            mov     r1, r9
+    95f2:       6201            str     r1, [r0, #32]
+    95f4:       4651            mov     r1, sl
+    95f6:       6241            str     r1, [r0, #36]   @ 0x24
+    95f8:       4659            mov     r1, fp
+    95fa:       6281            str     r1, [r0, #40]   @ 0x28
+    95fc:       4669            mov     r1, sp
+    95fe:       62c1            str     r1, [r0, #44]   @ 0x2c
+    9600:       4671            mov     r1, lr
+    9602:       6081            str     r1, [r0, #8]
+    9604:       e7de            b.n     95c4 <nlr_push_tail>
+
+[3]: https://www.openwall.com/lists/musl/2020/09/25/4
+
+Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
+Upstream: https://github.com/micropython/micropython/commit/7b050b366b7dacfb43779c51702a892d8f1873d0
+---
+ py/mpconfig.h |  6 ++++++
+ py/nlrthumb.c | 10 +++++++++-
+ 2 files changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/py/mpconfig.h b/py/mpconfig.h
+index af2480266..1aa3e0699 100644
+--- a/py/mpconfig.h
++++ b/py/mpconfig.h
+@@ -587,6 +587,12 @@
+ /*****************************************************************************/
+ /* Python internal features                                                  */
+
++// Use a special long jump in nlrthumb.c, which may be necessary if nlr.o and
++// nlrthumb.o are linked far apart from each other.
++#ifndef MICROPY_NLR_THUMB_USE_LONG_JUMP
++#define MICROPY_NLR_THUMB_USE_LONG_JUMP (0)
++#endif
++
+ // Whether to enable import of external modules
+ // When disabled, only importing of built-in modules is supported
+ // When enabled, a port must implement mp_import_stat (among other things)
+diff --git a/py/nlrthumb.c b/py/nlrthumb.c
+index a22c5df5b..e7b24f242 100644
+--- a/py/nlrthumb.c
++++ b/py/nlrthumb.c
+@@ -38,6 +38,14 @@
+
+ __attribute__((naked)) unsigned int nlr_push(nlr_buf_t *nlr) {
+
++    // If you get a linker error here, indicating that a relocation doesn't
++    // fit, try the following (in that order):
++    //
++    // 1. Ensure that nlr.o nlrthumb.o are linked closely together, i.e.
++    //    there aren't too many other files between them in the linker list
++    //    (PY_CORE_O_BASENAME in py/py.mk)
++    // 2. Set -DMICROPY_NLR_THUMB_USE_LONG_JUMP=1 during the build
++    //
+     __asm volatile (
+         "str    r4, [r0, #12]       \n" // store r4 into nlr_buf
+         "str    r5, [r0, #16]       \n" // store r5 into nlr_buf
+@@ -71,7 +79,7 @@ __attribute__((naked)) unsigned int nlr_push(nlr_buf_t *nlr) {
+         "str    lr, [r0, #8]        \n" // store lr into nlr_buf
+         #endif
+
+-        #if !defined(__thumb2__)
++        #if MICROPY_NLR_THUMB_USE_LONG_JUMP
+         "ldr    r1, nlr_push_tail_var \n"
+         "bx     r1                  \n" // do the rest in C
+         ".align 2                   \n"
+--
+2.43.0
+

--===============6951297446511488219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6951297446511488219==--
