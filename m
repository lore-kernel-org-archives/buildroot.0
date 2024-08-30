Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E0FCA0FF6
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 14:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF8BD844C9;
	Fri, 30 Aug 2024 14:03:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfLx9OnkWpIr; Fri, 30 Aug 2024 14:03:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C2E984503
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C2E984503;
	Fri, 30 Aug 2024 14:03:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9BED11BF5B3
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 14:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 885A84094F
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 14:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YnX73zK1Y1H8 for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 14:03:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60AF74082A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60AF74082A
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 14:03:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A8368672C; Fri, 30 Aug 2024 14:03:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Aug 2024 16:00:33 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 3e445665ba2093fdc75dfe12bd4960f63a25915d
X-Git-Newrev: 7b16d1e482d7df6a9576141f64150627005fd3c6
X-Patchwork-Hint: ignore
Message-Id: <20240830140347.4A8368672C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/sconeserver:
 select libxcrypt if needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b16d1e482d7df6a9576141f64150627005fd3c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

In file included from /home/buildroot/instance-0/output-1/build/sconeserver-8d1935919a2013358993a8e9dfa992cbde56e503/sconex/ScriptBase.h:25,
                 from /home/buildroot/instance-0/output-1/build/sconeserver-8d1935919a2013358993a8e9dfa992cbde56e503/http/AuthRealm.h:26,
                 from /home/buildroot/instance-0/output-1/build/sconeserver-8d1935919a2013358993a8e9dfa992cbde56e503/http/AuthRealm.cpp:23:
/home/buildroot/instance-0/output-1/build/sconeserver-8d1935919a2013358993a8e9dfa992cbde56e503/sconex/sconex.h:124:12: fatal error: crypt.h: No such file or directory
  124 | #  include <crypt.h>
      |            ^~~~~~~~~

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/24461bdb0a5d9a062b682ae3aeefa73c0408040b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 701cf686bdfd6c579c4d90768a6a3dab6858d942)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sconeserver/Config.in      | 1 +
 package/sconeserver/sconeserver.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index cce21fc860..d1a8a031be 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -3,6 +3,7 @@ menuconfig BR2_PACKAGE_SCONESERVER
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index 10a0a22597..bb0da12d4c 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -10,6 +10,7 @@ SCONESERVER_LICENSE = GPL-2.0+
 SCONESERVER_LICENSE_FILES = COPYING
 SCONESERVER_DEPENDENCIES = \
 	host-pkgconf \
+	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
 	pcre \
 	zlib
 # disable image as it fails to build with ImageMagick
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
