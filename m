Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0697DC4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 17:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF9CC845E9;
	Fri, 12 Jan 2024 17:44:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF9CC845E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id avXxASu0A8Ed; Fri, 12 Jan 2024 17:44:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08A1181C6F;
	Fri, 12 Jan 2024 17:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08A1181C6F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11BF01BF309
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 17:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FF9060B3B
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 17:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FF9060B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 538eZJRnLYlW for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 17:44:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E4D760D65
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 17:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E4D760D65
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59C2D85FA1; Fri, 12 Jan 2024 17:44:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 18:18:11 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 283825c22e79ffeb5d68cd3acd7fd39c33c0dd86
X-Git-Newrev: 82db018b9372af2a77f4d191526a994337f43102
X-Patchwork-Hint: ignore
Message-Id: <20240112174407.59C2D85FA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/libcgroup: needs
 threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=82db018b9372af2a77f4d191526a994337f43102
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
(cherry picked from commit 8649be9fa6dff661069af6479fc11a7f2208810d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
