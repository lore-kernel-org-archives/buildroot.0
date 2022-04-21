Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE99CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 18:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A746C60FA2;
	Thu, 21 Apr 2022 18:03:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xdSNZG8ZB4N1; Thu, 21 Apr 2022 18:03:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA23360ED2;
	Thu, 21 Apr 2022 18:03:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C4A11C1189
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9C1A83DF6
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S_pXFQb9X6iU for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2A1C83F4F
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EC14483FB8; Thu, 21 Apr 2022 17:50:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 19:53:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c44f745c8c2af821a00276141052a4e2e66128ed
X-Git-Newrev: c435d4ec60432f96abbc58cd1daf190528fafaa3
X-Patchwork-Hint: ignore
Message-Id: <20220421175056.EC14483FB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libwebsockets: fix build without
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

commit: https://git.buildroot.net/buildroot/commit/?id=c435d4ec60432f96abbc58cd1daf190528fafaa3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without threads raised since bump to
version 4.3.1 in commit 3a9cf51ab38b6a3a095241b8e87eab7e5b5bd617 and
https://github.com/warmcat/libwebsockets/commit/8eca7e17f27c8588170c5fa5fa3e6b14eb90e35d:

In file included from /nvmedata/autobuild/instance-1/output-1/build/libwebsockets-4.3.1/lib/plat/unix/unix-caps.c:28:
/nvmedata/autobuild/instance-1/output-1/build/libwebsockets-4.3.1/lib/core/./private-lib-core.h:68:11: fatal error: pthread.h: No such file or directory
   68 |  #include <pthread.h>
      |           ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/5d011b65e530339eb3f4d06a08caabc6a73b403b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libwebsockets/libwebsockets.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index f8093b92fa..63d50999a5 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -20,9 +20,13 @@ LIBWEBSOCKETS_CONF_OPTS = \
 # in the library. If unset, LWS_MAX_SMP defaults to 32 and a small
 # amount of pthread mutex code is built into the library.
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
-LIBWEBSOCKETS_CONF_OPTS += -DLWS_MAX_SMP=1
+LIBWEBSOCKETS_CONF_OPTS += \
+	-DLWS_MAX_SMP=1 \
+	-DLWS_WITH_SYS_SMD=OFF
 else
-LIBWEBSOCKETS_CONF_OPTS += -DLWS_MAX_SMP=
+LIBWEBSOCKETS_CONF_OPTS += \
+	-DLWS_MAX_SMP= \
+	-DLWS_WITH_SYS_SMD=ON
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
