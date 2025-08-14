Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2632CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 19:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8C9D80E03;
	Thu, 14 Aug 2025 19:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id shekG8AVw-RC; Thu, 14 Aug 2025 19:56:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E162B80DF8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E162B80DF8;
	Thu, 14 Aug 2025 19:56:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BC82B228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98F9B40480
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id io1_KDchZrcf for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 19:56:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93FE7404A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93FE7404A5
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9188E87606; Thu, 14 Aug 2025 19:56:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:26:37 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0ab4b8ca724cbd3cd79a4f0ad7efa305a5241c2d
X-Git-Newrev: 334a02fb6afc4e764ba33dbecf9d6af91d02236b
X-Patchwork-Hint: ignore
Message-Id: <20250814195612.9188E87606@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ngrep: fix
 implicit function declaration (GCC14)
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=334a02fb6afc4e764ba33dbecf9d6af91d02236b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Using toolchains based on GCC14 (and newer), now turns this warning
into a systematic error (see [1]).

The build failure can be reproduced with this minimal defconfig:

BR2_x86_64=y
BR2_x86_atom=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_NGREP=y
BR2_PACKAGE_LIBNET=y

[1] https://gcc.gnu.org/gcc-14/porting_to.html

Fixes: https://autobuild.buildroot.org/results/20b/20b924c5c96b3f43e381d87e59fb160ba8d3dcd0//

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
[Romain:
  - add a defconfig to reproduce the issue
  - add the minimal gcc version to reproduce the issue
]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 53d2ef7ec6fc406a23a5c5a13a4a3aefc8de3563)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ....h-and-tcpkill.h-to-avoid-implicit-functi.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/ngrep/0006-Include-err.h-and-tcpkill.h-to-avoid-implicit-functi.patch b/package/ngrep/0006-Include-err.h-and-tcpkill.h-to-avoid-implicit-functi.patch
new file mode 100644
index 0000000000..6d596bfe37
--- /dev/null
+++ b/package/ngrep/0006-Include-err.h-and-tcpkill.h-to-avoid-implicit-functi.patch
@@ -0,0 +1,44 @@
+From 52515bae377f221b5473d9040f5f43ab1c672672 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Mon, 19 Dec 2022 11:49:06 +0100
+Subject: [PATCH] Include <err.h> and "tcpkill.h" to avoid implicit function
+ declarations
+
+Implicit function declarations are a historic language feature that
+were removed from C in 1999.
+
+Upstream: https://github.com/jpr5/ngrep/pull/28
+
+Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+---
+ ngrep.c   | 1 +
+ tcpkill.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/ngrep.c b/ngrep.c
+index 3df9389..b2fcceb 100644
+--- a/ngrep.c
++++ b/ngrep.c
+@@ -98,6 +98,7 @@
+ #endif
+ 
+ #include "ngrep.h"
++#include "tcpkill.h"
+ 
+ 
+ /*
+diff --git a/tcpkill.c b/tcpkill.c
+index 5388ec5..ac8fd2e 100644
+--- a/tcpkill.c
++++ b/tcpkill.c
+@@ -14,6 +14,7 @@
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <string.h>
++#include <err.h>
+ #include <libnet.h>
+ #include <pcap.h>
+ 
+-- 
+2.50.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
