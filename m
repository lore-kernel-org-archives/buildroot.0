Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F000BC433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 13:42:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9306A6109D
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 13:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9306A6109D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D9D64027E;
	Mon,  8 Nov 2021 13:42:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tDhdi_fA4w3t; Mon,  8 Nov 2021 13:42:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6DDB4029A;
	Mon,  8 Nov 2021 13:42:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F28341BF331
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 13:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E18FF402B4
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 13:42:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XqZKvYXHfwVL for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 13:41:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACBF1402AC
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 13:41:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3551A8B67A; Mon,  8 Nov 2021 13:38:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 14:18:57 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: eda43794bc2187bc6535fc427b6a6c1562b774c9
X-Git-Newrev: 4f4d21358c8e83809732c257ba4f39272d4ff32f
X-Patchwork-Hint: ignore
Message-Id: <20211108133806.3551A8B67A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/vim: fix build
 with uclibc
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f4d21358c8e83809732c257ba4f39272d4ff32f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix the following build failure with uclibc raised since bump to version
8.2.3565 in commit 5650439b922d020cfad1131e5fb536bce73eb845 and
https://github.com/vim/vim/commit/0a7984af5601323fae7b3398f05a48087db7b767:

In file included from vim.h:27,
                 from fileio.c:14:
fileio.c: In function 'time_differs':
auto/config.h:149:22: error: 'stat_T' {aka 'struct stat'} has no member named 'st_mtim'; did you mean 'st_mtime'?
  149 | #define ST_MTIM_NSEC st_mtim.tv_nsec
      |                      ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/2132f9aa1b0bc618c91f7bf44fbd1b71b9d6ba05

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0b518033e2ee0cb38430374c5b3781459d3c61d6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...tems-for-nanosecond-resolution-timestamps.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/vim/0001-Fix-config-of-old-systems-for-nanosecond-resolution-timestamps.patch b/package/vim/0001-Fix-config-of-old-systems-for-nanosecond-resolution-timestamps.patch
new file mode 100644
index 0000000000..2e78a8d594
--- /dev/null
+++ b/package/vim/0001-Fix-config-of-old-systems-for-nanosecond-resolution-timestamps.patch
@@ -0,0 +1,56 @@
+From b5db1ebf06d2904522ebf246f9c6a8bbf8fca398 Mon Sep 17 00:00:00 2001
+From: Gary Johnson <garyjohn@spocom.com>
+Date: Tue, 26 Oct 2021 13:50:19 -0700
+Subject: [PATCH] Fix config of old systems for nanosecond-resolution
+ timestamps
+
+On old systems (e.g. 32-bit systems running Ubuntu 10.4), defining
+_XOPEN_SOURCE causes _BSD_SOURCE and _SVID_SOURCE not to be defined,
+which causes nanosecond-resolution timestamps not to be included in
+struct stat, which causes the build of fileio.c to fail.
+
+_XOPEN_SOURCE is defined for some systems in vim.h.
+
+A solution is to define _BSD_SOURCE and _SVID_SOURCE whenever
+_XOPEN_SOURCE is defined.
+
+On new systems, defining either _BSD_SOURCE or _SVID_SOURCE causes
+/usr/include/features.h to issue a warning message about _BSD_SOURCE and
+_SVID_SOURCE being deprecated and to use _DEFAULT_SOURCE instead.
+
+A solution for that is to also define _DEFAULT_SOURCE when _BSD_SOURCE
+and _SVID_SOURCE are defined.
+
+[Retrieved from:
+https://github.com/vim/vim/pull/9054/commits/b5db1ebf06d2904522ebf246f9c6a8bbf8fca398]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/vim.h | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/src/vim.h b/src/vim.h
+index 31d4bdefe87..f62ad88c7a1 100644
+--- a/src/vim.h
++++ b/src/vim.h
+@@ -43,6 +43,21 @@
+ // 700 is needed for mkdtemp().
+ #  ifndef _XOPEN_SOURCE
+ #   define _XOPEN_SOURCE    700
++
++// On old systems, defining _XOPEN_SOURCE causes _BSD_SOURCE and/or
++// _SVID_SOURCE not to be defined, so do that here.  Those are needed to
++// include nanosecond-resolution timestamps in struct stat.  On new systems,
++// _DEFAULT_SOURCE is needed to avoid warning messages about using deprecated
++// _BSD_SOURCE or _SVID_SOURCE.
++#   ifndef _BSD_SOURCE
++#    define _BSD_SOURCE 1
++#   endif
++#   ifndef _SVID_SOURCE
++#    define _SVID_SOURCE 1
++#   endif
++#   ifndef _DEFAULT_SOURCE
++#    define _DEFAULT_SOURCE 1
++#   endif
+ #  endif
+ # endif
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
