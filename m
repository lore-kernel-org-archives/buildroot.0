Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61558C5AD49
	for <buildroot@archiver.kernel.org>; Sun,  8 Jun 2025 13:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E658160AF6;
	Sun,  8 Jun 2025 13:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xcG8Ff1avxIp; Sun,  8 Jun 2025 13:17:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BEC2607C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BEC2607C7;
	Sun,  8 Jun 2025 13:17:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3ECF51F2
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 13:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C15D80E6E
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 13:17:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tQPhFJahWRsw for <buildroot@buildroot.org>;
 Sun,  8 Jun 2025 13:17:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E62580E8E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E62580E8E
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 13:17:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D59387943; Sun,  8 Jun 2025 13:17:47 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 8 Jun 2025 15:14:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0fce7a9623315cd58750df984b3b9d630eda1700
X-Git-Newrev: fa45c47fcb022445114fe4ff70018e634076d109
X-Patchwork-Hint: ignore
Message-Id: <20250608131747.4D59387943@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ghostscript: fix build with host
 GCC 15
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fa45c47fcb022445114fe4ff70018e634076d109
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following autobuild error on configs with host GCC15.

```
/workdir/instance-0/output-1/host/bin/ccache /usr/bin/gcc   -O2 -DNDEBUG -Wall -Wstrict-prototypes -Wundef -Wmissing-declarations -Wmissing-prototypes -Wwrite-strings -fno-strict-aliasing -Werror=declaration-after-statement -fno-builtin -fno-common -Werror=return-type -Wno-unused-local-typedefs -DHAVE_STDINT_H=1 -DHAVE_DIRENT_H=1 -DHAVE_SYS_DIR_H=1 -DHAVE_SYS_TIME_H=1 -DHAVE_SYS_TIMES_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_LIBDL=1 -DGX_COLOR_INDEX_TYPE="unsigned long long" -D__USE_UNIX98=1 -DHAVE_SNPRINTF  -O2 -I/workdir/instance-0/output-1/host/include -L/workdir/instance-0/output-1/host/lib -Wl,-rpath,/workdir/instance-0/output-1/host/lib -DNOCONTRIB -DHAVE_RESTRICT=1 -DHAVE_LIMITS_H=1 -DHAVE_STRING_H=1 -fno-strict-aliasing -O2 -I/workdir/instance-0/output-1/host/include -L/workdir/instance-0/output-1/host/lib -Wl,-rpath,/workdir/instance-0/output-1/host/lib -DHAVE_POPEN_PROTO=1  -I./base -o ./obj/aux/genconf ./base/genconf.c   -lz
In file included from ./base/genconf.c:18:
./base/stdpre.h:348:13: error: 'bool' cannot be defined via 'typedef'
  348 | typedef int bool;
      |             ^~~~
./base/stdpre.h:348:13: note: 'bool' is a keyword with '-std=c23' onwards
./base/stdpre.h:348:1: warning: useless type name in empty declaration
  348 | typedef int bool;
      | ^~~~~~~
```

This is due to the change in the default C language version in GCC15.

The patch included is not exactly the same as the upstream one, it only
picks the part that fix the `bool` definition and dropped the declaration
type changes.

Fixes: https://autobuild.buildroot.org/results/9c6/9c6cbff256635c6ab4be4c5b7bf18f9d3c4b46681

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...0001-Fix-compatibility-with-C23-compilers.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/ghostscript/0001-Fix-compatibility-with-C23-compilers.patch b/package/ghostscript/0001-Fix-compatibility-with-C23-compilers.patch
new file mode 100644
index 0000000000..0dfca9cfa2
--- /dev/null
+++ b/package/ghostscript/0001-Fix-compatibility-with-C23-compilers.patch
@@ -0,0 +1,36 @@
+From ae940946473ceb8c5353bc6e7f04673c6e60502d Mon Sep 17 00:00:00 2001
+From: Alex Cherepanov <alex@coscript.biz>
+Date: Thu, 3 Apr 2025 17:19:41 +0100
+Subject: Bug 708160: Fix compatibility with C23 compilers
+
+Upstream: https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=ae940946473ceb8c5353bc6e7f04673c6e60502d
+[thomas: Only backport the bool typedef condition]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ base/stdpre.h              |  6 ++++--
+ 1 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/base/stdpre.h b/base/stdpre.h
+index dda30b6a4..2f9c84e0d 100644
+--- a/base/stdpre.h
++++ b/base/stdpre.h
+@@ -1,4 +1,4 @@
+-/* Copyright (C) 2001-2023 Artifex Software, Inc.
++/* Copyright (C) 2001-2025 Artifex Software, Inc.
+    All Rights Reserved.
+
+    This software is provided AS-IS with no warranty, either express or
+@@ -341,7 +341,9 @@ typedef signed char schar;
+  * and the MetroWerks C++ compiler insists that bool be equivalent to
+  * unsigned char.
+  */
+-#ifndef __cplusplus
++
++/* C23 has bool as a builtin type. */
++#if !defined(__cplusplus) && (!defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L)
+ #ifdef __BEOS__
+ typedef unsigned char bool;
+ #else
+--
+cgit v1.2.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
