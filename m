Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B857CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 06:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0501E81DA0;
	Fri, 13 Oct 2023 06:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0501E81DA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v9XtJl4_EdJN; Fri, 13 Oct 2023 06:23:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BB7181364;
	Fri, 13 Oct 2023 06:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BB7181364
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F1DF31BF99A
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDD4441C3C
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:22:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDD4441C3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id thWzwGoHWbme for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 06:22:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC4A14173C
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 06:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC4A14173C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C89EF8468C; Fri, 13 Oct 2023 06:22:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 08:00:11 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 0c6524edfd0c6738ec0197fe00a73119d5ef77b8
X-Git-Newrev: 5b1a3bd2c3314b2cc2b1b9ba13b62fe5b88c5b33
X-Patchwork-Hint: ignore
Message-Id: <20231013062252.C89EF8468C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] board/freescale: fix i.MX
 arm-trusted-firmware for GCC12
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b1a3bd2c3314b2cc2b1b9ba13b62fe5b88c5b33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

The arm-trusted-firmware package for IMX boards fails due to a GCC bug.
See the attached patch description for detail.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/5134910620
  https://gitlab.com/buildroot.org/buildroot/-/jobs/5134910622
  https://gitlab.com/buildroot.org/buildroot/-/jobs/5134910624
  https://gitlab.com/buildroot.org/buildroot/-/jobs/5134910627

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 977965a83a2bc8da163ce45739c55bb775db55ce)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-fix-Makefile-Suppress-array-bounds-error.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/board/freescale/common/patches/arm-trusted-firmware/0002-LF-7968-01-fix-Makefile-Suppress-array-bounds-error.patch b/board/freescale/common/patches/arm-trusted-firmware/0002-LF-7968-01-fix-Makefile-Suppress-array-bounds-error.patch
new file mode 100644
index 0000000000..7a7a7bbc28
--- /dev/null
+++ b/board/freescale/common/patches/arm-trusted-firmware/0002-LF-7968-01-fix-Makefile-Suppress-array-bounds-error.patch
@@ -0,0 +1,51 @@
+From b2a94de52ae4a940a87d569815b19d3fa92dd32a Mon Sep 17 00:00:00 2001
+From: Tom Hochstein <tom.hochstein@nxp.com>
+Date: Mon, 16 May 2022 13:45:16 -0500
+Subject: [PATCH] LF-7968-01 fix(Makefile): Suppress array-bounds error
+
+The array-bounds error is triggered now in cases where it was silent
+before, causing errors like:
+
+```
+plat/imx/imx8m/hab.c: In function 'imx_hab_handler':
+plat/imx/imx8m/hab.c:64:57: error: array subscript 0 is outside array bounds of 'uint32_t[0]' {aka 'unsigned int[]'} [-Werror=array-bounds]
+   64 | #define HAB_RVT_CHECK_TARGET_ARM64      ((unsigned long)*(uint32_t *)(HAB_RVT_BASE + 0x18))
+      |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+```
+
+The error is a false-positive and is entered as a bug [1]. The problem
+is fixed partially in GCC 12 and fully in GCC 13 [2].
+
+The partial fix does not work here because the constant addresses used
+are less than the 4kB boundary chosen for the partial fix, so suppress
+the error until GCC is upgraded to 13.
+
+[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578
+[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578#c39
+
+Upstream-Status: Inappropriate [other]
+Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
+Signed-off-by: Jacky Bai <ping.bai@nxp.com>
+Reviewed-by: Ye Li <ye.li@nxp.com>
+Signed-off-by: Brandon Maier <brandon.maier@collins.com>
+Upstream: https://github.com/nxp-imx/imx-atf/commit/058bf0f104115037d03e277f079825ef3659c5b9
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index c87c3ae08..2d6b90f47 100644
+--- a/Makefile
++++ b/Makefile
+@@ -346,7 +346,7 @@ WARNINGS	+=		-Wshift-overflow -Wshift-sign-overflow \
+ endif
+ 
+ ifneq (${E},0)
+-ERRORS := -Werror
++ERRORS := -Werror -Wno-error=array-bounds
+ endif
+ 
+ CPPFLAGS		=	${DEFINES} ${INCLUDES} ${MBEDTLS_INC} -nostdinc	\
+-- 
+2.41.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
