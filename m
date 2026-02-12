Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D26AEF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2178041F76;
	Fri, 13 Feb 2026 19:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v_gSArSi2B3Z; Fri, 13 Feb 2026 19:38:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 390D241FF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011493;
	bh=lEqovV9IymnbFzwlZ32OCdIVREj8RT+aocTZk/+jA1s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FwoBd8yPYKkFu6VMrT+QVDE1XuzgxDtL+jm1g8W+a/t0qccaoUyd3RmXhb7M9l3FT
	 6qdsFZPLkyJNrwrIPEhKQG8VkTVIVO4F9PoqDoZ7udvZRikKDmphJTyp9wwR7cKp9i
	 06YyMPUmp3x/qr2/H+MiPVXWl+V9SoWeTDy0VVoRNMhjNPEBQ7PGbuWGey4ShRSz8p
	 JyExCtII8v7bc18ApiuCqivd+GUuC0/V9kOr/KyfBAD0EWDsRUssiRDfJ1ha3bxbd5
	 6kMx9xlwZa2yvG7NGaaYSFtoETdsAO1guGjBSd64ldIQj8627khyshZOQ1Z8HfD3jq
	 We1X0XG4Bogeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 390D241FF7;
	Fri, 13 Feb 2026 19:38:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CC88EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 905E0413EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uoDRSwKK7NRI for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 593F9412DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 593F9412DA
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E60E86D6B; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:35:14 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 27d0145f9c992c4a833eef447ec430ded1c55a03
X-Git-Newrev: b871e3e4b1386d3813fb56af32c65c7fd50eb3c9
X-Patchwork-Hint: ignore
Message-Id: <20260213193702.4E60E86D6B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/dc3dd: fix build
 with gcc-15.x
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b871e3e4b1386d3813fb56af32c65c7fd50eb3c9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

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
(cherry picked from commit c497b8ae99a8d73ccfdbbe953ddf7728c825a90a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
