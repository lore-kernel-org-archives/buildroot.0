Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E483CD37AE
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 20:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19F2E419B7;
	Fri, 15 Sep 2023 20:48:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19F2E419B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O-EduF4kN0d7; Fri, 15 Sep 2023 20:48:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42D33419C1;
	Fri, 15 Sep 2023 20:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42D33419C1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 05CAA1BF39E
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 20:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D30BE419AC
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 20:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D30BE419AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qdNJ4O_eFMMF for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 20:48:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF012419B6
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 20:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF012419B6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D942B87047; Fri, 15 Sep 2023 20:48:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 22:48:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3557a7b599b5b443730f8d0634a39c1694646ce3
X-Git-Newrev: eb4f5a2cbc8f6caf8929495318f5f3dbb11f134a
X-Patchwork-Hint: ignore
Message-Id: <20230915204837.D942B87047@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openblas: fix some x86 32bit builds
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb4f5a2cbc8f6caf8929495318f5f3dbb11f134a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenBLAS Makefile normally needs to explicitly define the CPU
architecture size (32 or 64bit) in the BINARY macro. See [1].

When an architecture supports both 64 and 32bit, the 32bit support
is sometimes implemented in OpenBLAS by overriding a fallback to an
anterior architecture. For example, if the build target architecture
is x86 Haswell 32bit, OpenBLAS build will override the arch to
Nehalem. See [2].

If the BINARY macro is undefined, the 32bit fallback will not happen,
sometimes leading to a link failure, with output:

    i686-buildroot-linux-gnu/bin/ar: strmm_kernel_LN.o: No such file or directory

This commit fixes those issues by explicitly defining the BINARY
macro. This issue has also been discussed upstream in [3] and [4].

Note: this issue was not introduced recently ([3] dates back from 2015),
and was also see in previous package version, for example in [5].

Fixes:
http://autobuild.buildroot.net/results/e1e/e1e2034a78799abe1bd28b036fa6f7d13322e42f

[1] https://github.com/xianyi/OpenBLAS/blob/v0.3.24/Makefile.rule#L50
[2] https://github.com/xianyi/OpenBLAS/blob/v0.3.24/Makefile.system#L113
[3] https://github.com/xianyi/OpenBLAS/issues/657
[4] https://github.com/xianyi/OpenBLAS/issues/1106
[5] http://autobuild.buildroot.net/results/5cd/5cdccd106b1de275ac75c39783e536107a31651f

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/openblas/openblas.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index 0d0e8e56dd..aacfc74b53 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -49,6 +49,12 @@ ifeq ($(BR2_STATIC_LIBS),y)
 OPENBLAS_MAKE_OPTS += NO_SHARED=1
 endif
 
+ifeq ($(BR2_ARCH_IS_64),y)
+OPENBLAS_MAKE_OPTS += BINARY=64
+else
+OPENBLAS_MAKE_OPTS += BINARY=32
+endif
+
 # binutils version <= 2.23.2 has a bug
 # (https://sourceware.org/bugzilla/show_bug.cgi?id=14887) where
 # whitespaces in ARM register specifications such as [ r1, #12 ] or [
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
