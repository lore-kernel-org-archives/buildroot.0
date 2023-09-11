Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E735DCA0EC1
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 20:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99930417D4;
	Mon, 11 Sep 2023 20:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99930417D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1rieUkM0bd5t; Mon, 11 Sep 2023 20:57:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4870241897;
	Mon, 11 Sep 2023 20:57:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4870241897
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 90AEF1BF3A9
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 20:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A6C24055E
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 20:57:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A6C24055E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XljVwv5NjBy4 for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 20:57:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F8CB403FF
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 20:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F8CB403FF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2931286D22; Mon, 11 Sep 2023 20:57:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 22:56:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7bc5ea80c7a2e60f8c47ac33b20909e693de5bbc
X-Git-Newrev: ab4f3fafaa839593b3efd9ea12c8ee5d9340cdeb
X-Patchwork-Hint: ignore
Message-Id: <20230911205711.2931286D22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: fix missing .note.GNU-stack
 section
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ab4f3fafaa839593b3efd9ea12c8ee5d9340cdeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Shellinabox configure fails to detect ptsname_r, because of the following warning
binutils 2.39+ emits:
ld: warning: crtend.o: missing .note.GNU-stack section implies executable stack
ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker

Then the build errors out with:
shellinabox/launcher.c:772:12: error: static declaration of 'ptsname_r' follows non-static declaration

The same issue exist for cairo 1.16.0 and the detection of pthreads.

Fixes:
 - http://autobuild.buildroot.net/results/3e4/3e478d22e820703ddfd11d1491e631ef8ed6b29b
 - http://autobuild.buildroot.net/results/f60/f602ea17d5938a5beb81d07e13de75ba41d5f6a1

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ensa-add-.note.GNU-stack-section-on-linux.patch | 105 +++++++++++++++++++++
 ...ensa-add-.note.GNU-stack-section-on-linux.patch | 105 +++++++++++++++++++++
 2 files changed, 210 insertions(+)

diff --git a/package/gcc/11.4.0/0007-xtensa-add-.note.GNU-stack-section-on-linux.patch b/package/gcc/11.4.0/0007-xtensa-add-.note.GNU-stack-section-on-linux.patch
new file mode 100644
index 0000000000..967bbaf3fe
--- /dev/null
+++ b/package/gcc/11.4.0/0007-xtensa-add-.note.GNU-stack-section-on-linux.patch
@@ -0,0 +1,105 @@
+From 4958020ecc85a30c52544deaf3c017cea82a0fb0 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Thu, 2 Mar 2023 09:45:41 -0800
+Subject: [PATCH] xtensa: add .note.GNU-stack section on linux
+
+gcc/
+	* config/xtensa/linux.h (TARGET_ASM_FILE_END): New macro.
+
+libgcc/
+	* config/xtensa/crti.S: Add .note.GNU-stack section on linux.
+	* config/xtensa/crtn.S: Likewise.
+	* config/xtensa/lib1funcs.S: Likewise.
+	* config/xtensa/lib2funcs.S: Likewise.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=6360bf9a2d08f08c151464c77c0da53cd702ff25
+---
+ gcc/config/xtensa/linux.h        | 1 +
+ libgcc/config/xtensa/crti.S      | 6 ++++++
+ libgcc/config/xtensa/crtn.S      | 6 ++++++
+ libgcc/config/xtensa/lib1funcs.S | 6 ++++++
+ libgcc/config/xtensa/lib2funcs.S | 6 ++++++
+ 5 files changed, 25 insertions(+)
+
+diff --git a/gcc/config/xtensa/linux.h b/gcc/config/xtensa/linux.h
+index 468a48489e7..a69e38c58ee 100644
+--- a/gcc/config/xtensa/linux.h
++++ b/gcc/config/xtensa/linux.h
+@@ -69,3 +69,4 @@ along with GCC; see the file COPYING3.  If not see
+ 
+ #undef DBX_REGISTER_NUMBER
+ 
++#define TARGET_ASM_FILE_END file_end_indicate_exec_stack
+diff --git a/libgcc/config/xtensa/crti.S b/libgcc/config/xtensa/crti.S
+index 87a66e32e4a..40dd8c0dbc2 100644
+--- a/libgcc/config/xtensa/crti.S
++++ b/libgcc/config/xtensa/crti.S
+@@ -26,6 +26,12 @@
+ 
+ #include "xtensa-config.h"
+ 
++/* An executable stack is *not* required for these functions.  */
++#if defined(__ELF__) && defined(__linux__)
++.section .note.GNU-stack,"",%progbits
++.previous
++#endif
++
+ 	.section .init
+ 	.globl _init
+ 	.type _init,@function
+diff --git a/libgcc/config/xtensa/crtn.S b/libgcc/config/xtensa/crtn.S
+index 8d2c2b1f22b..9d29f8fce1a 100644
+--- a/libgcc/config/xtensa/crtn.S
++++ b/libgcc/config/xtensa/crtn.S
+@@ -27,6 +27,12 @@
+ 
+ #include "xtensa-config.h"
+ 
++/* An executable stack is *not* required for these functions.  */
++#if defined(__ELF__) && defined(__linux__)
++.section .note.GNU-stack,"",%progbits
++.previous
++#endif
++
+ 	.section .init
+ #if XCHAL_HAVE_WINDOWED && !__XTENSA_CALL0_ABI__
+ 	retw
+diff --git a/libgcc/config/xtensa/lib1funcs.S b/libgcc/config/xtensa/lib1funcs.S
+index a482a6eefc8..5245d7ad8ad 100644
+--- a/libgcc/config/xtensa/lib1funcs.S
++++ b/libgcc/config/xtensa/lib1funcs.S
+@@ -25,6 +25,12 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+ 
+ #include "xtensa-config.h"
+ 
++/* An executable stack is *not* required for these functions.  */
++#if defined(__ELF__) && defined(__linux__)
++.section .note.GNU-stack,"",%progbits
++.previous
++#endif
++
+ /* Define macros for the ABS and ADDX* instructions to handle cases
+    where they are not included in the Xtensa processor configuration.  */
+ 
+diff --git a/libgcc/config/xtensa/lib2funcs.S b/libgcc/config/xtensa/lib2funcs.S
+index 36938c84924..a574a45fa68 100644
+--- a/libgcc/config/xtensa/lib2funcs.S
++++ b/libgcc/config/xtensa/lib2funcs.S
+@@ -25,6 +25,12 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+ 
+ #include "xtensa-config.h"
+ 
++/* An executable stack is *not* required for these functions.  */
++#if defined(__ELF__) && defined(__linux__)
++.section .note.GNU-stack,"",%progbits
++.previous
++#endif
++
+ /* __xtensa_libgcc_window_spill: This function flushes out all but the
+    current register window.  This is used to set up the stack so that
+    arbitrary frames can be accessed.  */
+-- 
+2.39.2
+
diff --git a/package/gcc/12.3.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch b/package/gcc/12.3.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch
new file mode 100644
index 0000000000..4c79c3448f
--- /dev/null
+++ b/package/gcc/12.3.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch
@@ -0,0 +1,105 @@
+From 38cdfcc4b2cca8d251ff8d8d34201dfe9849333e Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Thu, 2 Mar 2023 09:45:41 -0800
+Subject: [PATCH] xtensa: add .note.GNU-stack section on linux
+
+gcc/
+	* config/xtensa/linux.h (TARGET_ASM_FILE_END): New macro.
+
+libgcc/
+	* config/xtensa/crti.S: Add .note.GNU-stack section on linux.
+	* config/xtensa/crtn.S: Likewise.
+	* config/xtensa/lib1funcs.S: Likewise.
+	* config/xtensa/lib2funcs.S: Likewise.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=6360bf9a2d08f08c151464c77c0da53cd702ff25
+---
+ gcc/config/xtensa/linux.h        | 1 +
+ libgcc/config/xtensa/crti.S      | 6 ++++++
+ libgcc/config/xtensa/crtn.S      | 6 ++++++
+ libgcc/config/xtensa/lib1funcs.S | 6 ++++++
+ libgcc/config/xtensa/lib2funcs.S | 6 ++++++
+ 5 files changed, 25 insertions(+)
+
+diff --git a/gcc/config/xtensa/linux.h b/gcc/config/xtensa/linux.h
+index edce618fb94..fe0e3a43797 100644
+--- a/gcc/config/xtensa/linux.h
++++ b/gcc/config/xtensa/linux.h
+@@ -69,3 +69,4 @@ along with GCC; see the file COPYING3.  If not see
+ 
+ #undef DBX_REGISTER_NUMBER
+ 
++#define TARGET_ASM_FILE_END file_end_indicate_exec_stack
+diff --git a/libgcc/config/xtensa/crti.S b/libgcc/config/xtensa/crti.S
+index 3de7bc101f4..0996e7cb29b 100644
+--- a/libgcc/config/xtensa/crti.S
++++ b/libgcc/config/xtensa/crti.S
+@@ -26,6 +26,12 @@
+ 
+ #include "xtensa-config.h"
+ 
++/* An executable stack is *not* required for these functions.  */
++#if defined(__ELF__) && defined(__linux__)
++.section .note.GNU-stack,"",%progbits
++.previous
++#endif
++
+ 	.section .init
+ 	.globl _init
+ 	.type _init,@function
+diff --git a/libgcc/config/xtensa/crtn.S b/libgcc/config/xtensa/crtn.S
+index 06b932edb14..a4cc9830096 100644
+--- a/libgcc/config/xtensa/crtn.S
++++ b/libgcc/config/xtensa/crtn.S
+@@ -27,6 +27,12 @@
+ 
+ #include "xtensa-config.h"
+ 
++/* An executable stack is *not* required for these functions.  */
++#if defined(__ELF__) && defined(__linux__)
++.section .note.GNU-stack,"",%progbits
++.previous
++#endif
++
+ 	.section .init
+ #if XCHAL_HAVE_WINDOWED && !__XTENSA_CALL0_ABI__
+ 	retw
+diff --git a/libgcc/config/xtensa/lib1funcs.S b/libgcc/config/xtensa/lib1funcs.S
+index 5a2bd20534f..7177dd4f73a 100644
+--- a/libgcc/config/xtensa/lib1funcs.S
++++ b/libgcc/config/xtensa/lib1funcs.S
+@@ -25,6 +25,12 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+ 
+ #include "xtensa-config.h"
+ 
++/* An executable stack is *not* required for these functions.  */
++#if defined(__ELF__) && defined(__linux__)
++.section .note.GNU-stack,"",%progbits
++.previous
++#endif
++
+ /* Define macros for the ABS and ADDX* instructions to handle cases
+    where they are not included in the Xtensa processor configuration.  */
+ 
+diff --git a/libgcc/config/xtensa/lib2funcs.S b/libgcc/config/xtensa/lib2funcs.S
+index 681bac1be8c..a40c1a45604 100644
+--- a/libgcc/config/xtensa/lib2funcs.S
++++ b/libgcc/config/xtensa/lib2funcs.S
+@@ -25,6 +25,12 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+ 
+ #include "xtensa-config.h"
+ 
++/* An executable stack is *not* required for these functions.  */
++#if defined(__ELF__) && defined(__linux__)
++.section .note.GNU-stack,"",%progbits
++.previous
++#endif
++
+ /* __xtensa_libgcc_window_spill: This function flushes out all but the
+    current register window.  This is used to set up the stack so that
+    arbitrary frames can be accessed.  */
+-- 
+2.39.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
