Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E398E7DF0F
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 18:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5840260D57;
	Mon,  2 Feb 2026 18:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XeJtZkGTU3Wo; Mon,  2 Feb 2026 18:26:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D2FF60BE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770056805;
	bh=TcrVxcolBhPx+AANAVyGzii7nqidzkMfhG+Tz0SkV44=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=exc29yl6aMPudGsPziUm/Jr9kL8lVQjukoaZHo/ZbZGdbmb2IEBTXrBon/bgMGG8p
	 //XI27QdsSDrkQtgN8WzBIH3PTLLt1dvmmNvsVFEsVDiHF5nkAgEIDYStEo2zgoqVU
	 Hf+YTymGBRy7NmN/totGwideOUl3ZIsdWoNSgexjIWdYxxcJ0C+1Wgmoa6/r6Lz5T0
	 GKx8pCvHGPjPvN/Actb72eiY8sZc1NBRaxMKo77s76ja9FHyAVG4MjmdOeOBx8UxZR
	 ZgxKPom8tkc52eD50bP3E5tvaJrEcTEEHk0jrQNYIvxHBrVSd7NnuW7DZ/Hc3AAK2d
	 SliVCFyweUGdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D2FF60BE6;
	Mon,  2 Feb 2026 18:26:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E9BA0F4
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3E6240681
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:26:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJSisJeft8Up for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 18:26:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 135F040523
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 135F040523
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:26:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 009BD86486; Mon,  2 Feb 2026 18:26:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 19:26:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9782cab084988dfeca25cb567bbcea3f5570d300
X-Git-Newrev: c497b8ae99a8d73ccfdbbe953ddf7728c825a90a
X-Patchwork-Hint: ignore
Message-Id: <20260202182643.009BD86486@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dc3dd: fix build with gcc-15.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=c497b8ae99a8d73ccfdbbe953ddf7728c825a90a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.net/results/257/2575202e9a5164a4068a943fb36445cd63e61f0c/

The build error does not occur with gcc-14.x, tested using this
defconfig:

BR2_x86_64=y
BR2_x86_corei7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_PACKAGE_DC3DD=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dc3dd/0005-gcc15.patch | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/dc3dd/0005-gcc15.patch b/package/dc3dd/0005-gcc15.patch
new file mode 100644
index 0000000000..a2133cec4a
--- /dev/null
+++ b/package/dc3dd/0005-gcc15.patch
@@ -0,0 +1,39 @@
+Description: Fix FTBFS with GCC-15
+Origin: backport, https://build.opensuse.org/projects/security:forensics/packages/dc3dd/files/dc3dd-gcc15.patch
+Bug: https://sourceforge.net/p/dc3dd/bugs/24/
+Bug-Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1096508
+Forwarded: not-needed
+Reviewed-by: Sven Geuer <sge@debian.org>
+Last-Update: 2025-09-25
+
+Upstream: https://sourceforge.net/p/dc3dd/bugs/24/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
+Index: dc3dd-7.3.1/lib/posixtm.c
+===================================================================
+--- dc3dd-7.3.1.orig/lib/posixtm.c
++++ dc3dd-7.3.1/lib/posixtm.c
+@@ -41,7 +41,7 @@
+    of `digit' even when the host does not conform to POSIX.  */
+ #define ISDIGIT(c) ((unsigned int) (c) - '0' <= 9)
+ 
+-time_t mktime ();
++time_t mktime (struct tm *tm);
+ 
+ /*
+   POSIX requires:
+Index: dc3dd-7.3.1/m4/jm-macros.m4
+===================================================================
+--- dc3dd-7.3.1.orig/m4/jm-macros.m4
++++ dc3dd-7.3.1/m4/jm-macros.m4
+@@ -38,7 +38,7 @@ AC_DEFUN([coreutils_MACROS],
+   # By default, argmatch should fail calling usage (1).
+   AC_DEFINE(ARGMATCH_DIE, [usage (1)],
+ 	    [Define to the function xargmatch calls on failures.])
+-  AC_DEFINE(ARGMATCH_DIE_DECL, [void usage ()],
++  AC_DEFINE(ARGMATCH_DIE_DECL, [void usage (int)],
+ 	    [Define to the declaration of the xargmatch failure function.])
+ 
+   # used by ls
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
