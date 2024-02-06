Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA26C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 14:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23AA741E39;
	Tue,  6 Feb 2024 14:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23AA741E39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id REyVdZkuBwer; Tue,  6 Feb 2024 14:25:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDDD641E38;
	Tue,  6 Feb 2024 14:25:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDDD641E38
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9930A1BF423
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7206F611F8
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:25:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7206F611F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3qDDSTkoD3LN for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 14:25:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 977F1611E0
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 14:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 977F1611E0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 808748709D; Tue,  6 Feb 2024 14:25:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 15:24:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25c255ece8c171adeb86a4b905b72715b05c2bcf
X-Git-Newrev: 2298ceb213e4ce858f048603c44113057766efcf
X-Patchwork-Hint: ignore
Message-Id: <20240206142517.808748709D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tcf-agent: fix powerpc64 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=2298ceb213e4ce858f048603c44113057766efcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Translation of ppc64 to powerpc has been removed since version 1.8.0 and
https://git.eclipse.org/c/tcf/org.eclipse.tcf.agent.git/commit/?id=94fa43963538afffc1fff77623cd1561a05d0e21
resulting in the following build failure since commit
81802e263a12e173e0e1028449d1e1e11b2e5974:

In file included from /home/buildroot/autobuild/instance-0/output-1/build/tcf-agent-1.8.0/agent/system/GNU/Linux/tcf/context-linux.c:58:
/home/buildroot/autobuild/instance-0/output-1/build/tcf-agent-1.8.0/agent/../agent/system/GNU/Linux/tcf/regset.h:25:10: fatal error: tcf/regset-mdep.h: No such file or directory
   25 | #include <tcf/regset-mdep.h>
      |          ^~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/821049a692d4a64fa45b73e8e18eb48c36d46e6b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcf-agent/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tcf-agent/Config.in b/package/tcf-agent/Config.in
index 8c7aab0c0b..a016871e6d 100644
--- a/package/tcf-agent/Config.in
+++ b/package/tcf-agent/Config.in
@@ -27,8 +27,8 @@ config BR2_PACKAGE_TCF_AGENT_ARCH
 	default "i686"       if BR2_i386 && BR2_ARCH="i686"
 	default "i386"       if BR2_i386 && !BR2_ARCH="i686"
 	default "x86_64"     if BR2_x86_64
-	default "powerpc"    if BR2_powerpc
-	default "ppc64"      if BR2_powerpc64 || BR2_powerpc64le
+	default "powerpc"    if BR2_powerpc || BR2_powerpc64 || \
+		BR2_powerpc64le
 	default "microblaze" if BR2_microblaze || BR2_microblazeel
 
 config BR2_PACKAGE_TCF_AGENT_ARCH_SUPPORTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
