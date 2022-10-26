Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0BCC38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 13:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09C718109A;
	Wed, 26 Oct 2022 13:49:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09C718109A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kUY-aHNeXUQf; Wed, 26 Oct 2022 13:49:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5D0880E07;
	Wed, 26 Oct 2022 13:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5D0880E07
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B6A371BF5B4
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 13:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9211F60AD8
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 13:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9211F60AD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RZivTQiEqlAC for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 13:49:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AED960A93
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 13:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AED960A93
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0743787113; Wed, 26 Oct 2022 13:49:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 15:49:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d69752c7582a0b1dd14d05f46fa7a22b2bcfb530
X-Git-Newrev: e548b7642ac14f2440427cb6ae11242680d3d935
X-Patchwork-Hint: ignore
Message-Id: <20221026134929.0743787113@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: fix x86_64 builds with -Os
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

commit: https://git.buildroot.net/buildroot/commit/?id=e548b7642ac14f2440427cb6ae11242680d3d935
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport upstream commit for x86_64 builds with -Os reported by [1].

[1] https://sourceware.org/bugzilla/show_bug.cgi?id=29576

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229902
https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229956
http://autobuild.buildroot.net/results/5b442f95587ddc65a995bbd9e310c88a66c55b1f

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch b/package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch
new file mode 100644
index 0000000000..4470324f1c
--- /dev/null
+++ b/package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch
@@ -0,0 +1,48 @@
+From 3935b543adcb9a46ab79f8931bc489068b049378 Mon Sep 17 00:00:00 2001
+From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
+Date: Wed, 21 Sep 2022 10:51:08 -0300
+Subject: [PATCH] x86: Fix -Os build (BZ #29576)
+
+The compiler might transform __stpcpy calls (which are routed to
+__builtin_stpcpy as an optimization) to strcpy and x86_64 strcpy
+multiarch implementation does not build any working symbol due
+ISA_SHOULD_BUILD not being evaluated for IS_IN(rtld).
+
+Checked on x86_64-linux-gnu.
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Tested-by: Carlos O'Donell <carlos@redhat.com>
+
+(cherry picked from commit 9dc4e29f630c6ef8299120b275e503321dc0c8c7)
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ sysdeps/x86_64/multiarch/rtld-strcpy.S | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+ create mode 100644 sysdeps/x86_64/multiarch/rtld-strcpy.S
+
+diff --git a/sysdeps/x86_64/multiarch/rtld-strcpy.S b/sysdeps/x86_64/multiarch/rtld-strcpy.S
+new file mode 100644
+index 0000000000..19439c553d
+--- /dev/null
++++ b/sysdeps/x86_64/multiarch/rtld-strcpy.S
+@@ -0,0 +1,18 @@
++/* Copyright (C) 2022 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include "../strcpy.S"
+-- 
+2.34.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
