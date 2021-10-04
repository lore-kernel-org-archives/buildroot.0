Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1877BC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 13:39:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4E2361186
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 13:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4E2361186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2E2D42770;
	Mon,  4 Oct 2021 13:39:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3pAZmQeHJTAQ; Mon,  4 Oct 2021 13:39:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEAFE405E7;
	Mon,  4 Oct 2021 13:39:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A95AD1BF2FE
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 13:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4AD4404E2
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 13:38:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kjR9sxGYlPW5 for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 13:38:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BD6240012
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 13:38:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 42CF18DCFF; Mon,  4 Oct 2021 13:36:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Oct 2021 15:33:05 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: b75d0bb2f3b801825030ca8aa3610642a6de159d
X-Git-Newrev: 5f8e900d5e73ffc0abafd428cb189af7ed09886f
X-Patchwork-Hint: ignore
Message-Id: <20211004133612.42CF18DCFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/mono: fix
 external libatomic_ops linkage
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f8e900d5e73ffc0abafd428cb189af7ed09886f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Added patch fixes linkage of libgc with external libtomic-ops.
Mono uses bundeled bdwgc which doesn't link external libatomic-ops.
Patch is a fix cherry-picked from bdwgc upstream.

Problem found on ARMv5 processors, on newer ARM processors
it uses header based functions and doesn't need built library.

Error:
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../../external/bdwgc/.libs/libgc.a(gc.o): in function `GC_steal_mark_stack':
gc.c:(.text+0x2020): undefined reference to `AO_store_full_emulation'

Fixes:
http://autobuild.buildroot.net/results/ebc54e5dea63aca21a4072d294fdede41de559c7
http://autobuild.buildroot.net/results/6d10a4bd43fbc9c1d3fa26d5eef394c8023cb85f

Signed-off-by: Illia Bitkov <illia.bitkov@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 7b5a13eb3d393c7aa3e443219d6eeae65ffe1794)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ith-a-system-libatomic_ops-shared-library.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch b/package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch
new file mode 100644
index 0000000000..66d4d8e100
--- /dev/null
+++ b/package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch
@@ -0,0 +1,52 @@
+From 02a44ee1df8176c72e75fd706d1a8f063d3196d5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 5 Nov 2018 22:50:40 +0100
+Subject: Fix linkage with a system libatomic_ops shared library
+
+Issue #247 (bdwgc).
+
+When bdwgc is linked with the external libatomic_ops, bdw-gc.pc must
+contain the needed dynamic libraries (such as -latomic_ops) otherwise
+build of applications could fail on the link stage on some hosts:
+* libgc.so: undefined reference to 'AO_fetch_compare_and_swap_emulation'
+* libgc.so: undefined reference to 'AO_store_full_emulation'
+
+So, this commit sets ATOMIC_OPS_LIBS to "-latomic_ops" when a system
+atomic_ops library is used and uses ATOMIC_OPS_LIBS in bdw-gc.pc.in.
+
+* bdw-gc.pc.in (Libs): Add @ATOMIC_OPS_LIBS@.
+* configure.ac [$with_libatomic_ops!=no && $with_libatomic_ops!=none
+&& $THREADS!=none] (ATOMIC_OPS_LIBS): Set to -latomic_ops; do AC_SUBST.
+
+Fix is cherry-picked from bdwgc upstream
+
+Link to original commit https://github.com/ivmai/bdwgc/commit/02a44ee1df8176c72e75fd706d1a8f063d3196d5?branch=02a44ee1df8176c72e75fd706d1a8f063d3196d5&diff=unified  
+
+Signed-off-by: Illia Bitkov <illia.bitkov@mind.be>
+
+diff --git a/external/bdwgc/bdw-gc.pc.in b/external/bdwgc/bdw-gc.pc.in
+index ef4c2341..a32e7598 100644
+--- a/external/bdwgc/bdw-gc.pc.in
++++ b/external/bdwgc/bdw-gc.pc.in
+@@ -6,5 +6,5 @@ includedir=@includedir@
+ Name: Boehm-Demers-Weiser Conservative Garbage Collector
+ Description: A garbage collector for C and C++
+ Version: @PACKAGE_VERSION@
+-Libs: -L${libdir} -lgc
++Libs: -L${libdir} @ATOMIC_OPS_LIBS@ -lgc
+ Cflags: -I${includedir}
+diff --git a/external/bdwgc/configure.ac b/external/bdwgc/configure.ac
+index 21abe8fa..9ffe81de 100644
+--- a/external/bdwgc/configure.ac
++++ b/external/bdwgc/configure.ac
+@@ -1081,7 +1081,9 @@ AS_IF([test x"$with_libatomic_ops" = xno \
+ AC_MSG_CHECKING([which libatomic_ops to use])
+ AS_IF([test x"$with_libatomic_ops" != xno],
+   [ AS_IF([test x"$with_libatomic_ops" != xnone -a x"$THREADS" != xnone],
+-          [ AC_MSG_RESULT([external]) ],
++          [ AC_MSG_RESULT([external])
++            ATOMIC_OPS_LIBS="-latomic_ops"
++            AC_SUBST([ATOMIC_OPS_LIBS]) ],
+           [ AC_MSG_RESULT([none])
+             AS_IF([test x"$THREADS" != xnone],
+                   [ AC_DEFINE([GC_BUILTIN_ATOMIC], [1],
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
