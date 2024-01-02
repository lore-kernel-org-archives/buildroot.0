Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327CFC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB6104014B;
	Tue,  2 Jan 2024 22:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB6104014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jBQFAwut8VvV; Tue,  2 Jan 2024 22:20:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CE1F40A93;
	Tue,  2 Jan 2024 22:20:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CE1F40A93
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CBBE81BF276
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F5FB416D3
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F5FB416D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6A1rJ-zprhUa for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:20:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CF4D416BA
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CF4D416BA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEA0483D84; Tue,  2 Jan 2024 22:19:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 23:17:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74f401025d7ffbc5be9191b9c31208e501759edb
X-Git-Newrev: 8649be9fa6dff661069af6479fc11a7f2208810d
X-Patchwork-Hint: ignore
Message-Id: <20240102221959.EEA0483D84@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcgroup: needs threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=8649be9fa6dff661069af6479fc11a7f2208810d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

threads are mandatory since the addition of the package in commit and
https://github.com/libcgroup/libcgroup/commit/99ccdf671e9df5b13f646e1487393d562aa7fa62
resulting in the following build failure since commit
9d58b525fcfd0d92fcdd3c66d7858213c4b139c6 which enables build on uclibc
and musl:

In file included from config.c:30:
./libcgroup-internal.h:29:10: fatal error: pthread.h: No such file or directory
   29 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/87c4454aee97b6955f461651c41c4186a8838c4d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcgroup/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libcgroup/Config.in b/package/libcgroup/Config.in
index b9333be2a2..4f9ec074b4 100644
--- a/package/libcgroup/Config.in
+++ b/package/libcgroup/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBCGROUP
 	bool "libcgroup"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  libcgroup is a library that abstracts the control
@@ -17,5 +18,5 @@ config BR2_PACKAGE_LIBCGROUP_TOOLS
 
 endif
 
-comment "libcgroup needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "libcgroup needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
