Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9D3C71153
	for <buildroot@archiver.kernel.org>; Sun,  3 Sep 2023 07:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8920F403B3;
	Sun,  3 Sep 2023 07:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8920F403B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ppB3W4ORsRRB; Sun,  3 Sep 2023 07:33:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82C84403FB;
	Sun,  3 Sep 2023 07:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82C84403FB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B6FA1BF338
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 07:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22A6B403FB
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 07:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22A6B403FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 22TWSid3Ukgf for <buildroot@lists.busybox.net>;
 Sun,  3 Sep 2023 07:33:41 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0AC7F403B3
 for <buildroot@buildroot.org>; Sun,  3 Sep 2023 07:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AC7F403B3
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 73F93352BD9A; Sun,  3 Sep 2023 09:33:34 +0200 (CEST)
Date: Sun, 3 Sep 2023 09:33:33 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZPQ2zZ1dgo6K2mdO@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1693726415; bh=tiK3RRcqVd4zJHKDAjsCJKf62TdRqaiTSyHzUSluT4o=;
 h=Date:From:To:Subject:From;
 b=Oj5JIGZ1sRVV+NCyGh6Q3pGIk+BjtzAQX+awMvlx4GIpIJhIbEX0Mccl7VO+PZ9/s
 lxVw5aBlqP4NM6x8toUoX9SK4UOt4B82HM2cZNfwdmInBaBIsFvRtviLEODjwMAlSt
 E8hiVL8eobPMrRti2XSf3wG/euQG/1UU3LmR3FD1t+sOtxM59vDqAwC889Cja0Ktum
 rc9JmG1oT33SiVJX/Rl4lLRbO01EMnvojhFv8xjxmXii9TAUCgvcm05UNDDp07xtWc
 2a34y6ixWyolAqDun1oLe+9Ps/b7aZ61CFFUVhAcAoVTOaa86+pArMnGB+ro2IulYX
 Ej7kol4EF+rgQ==
Subject: [Buildroot] [PATCH] package/gcc: fix missing .note.GNU-stack section
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 ...add-.note.GNU-stack-section-on-linux.patch | 105 ++++++++++++++++++
 ...add-.note.GNU-stack-section-on-linux.patch | 105 ++++++++++++++++++
 2 files changed, 210 insertions(+)
 create mode 100644 package/gcc/11.4.0/0007-xtensa-add-.note.GNU-stack-section-on-linux.patch
 create mode 100644 package/gcc/12.3.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
