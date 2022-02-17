Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0392EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 16:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95E7941E39;
	Thu, 17 Feb 2022 16:36:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w0ijHXaypTCl; Thu, 17 Feb 2022 16:36:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A780E40260;
	Thu, 17 Feb 2022 16:36:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0DE7B1BF8B4
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 16:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFF0F6F70B
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 16:36:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zYh_Vh8WFOf3 for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 16:36:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B17060B24
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 16:36:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B0A1A82210; Thu, 17 Feb 2022 16:28:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 17:32:28 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 9d63e24e6a933e98670b486d623e0fa84f7d7fe5
X-Git-Newrev: 8e734ee44396fda79dc5c61e7d30e73b100730f9
X-Patchwork-Hint: ignore
Message-Id: <20220217162844.B0A1A82210@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/nfs-utils:
 nfsiostat uses python3, not python2
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

commit: https://git.buildroot.net/buildroot/commit/?id=8e734ee44396fda79dc5c61e7d30e73b100730f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

nfsiostat is a python3 script, so keep it if python3 is enabled and not
python2:

head -n 1 target/usr/sbin/nfsiostat
 #!/usr/bin/python3

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cee035e4391417851fbbf41a1d4eb0c4d2ad60d4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nfs-utils/nfs-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 07b44b5a93..519d6cad3e 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -114,7 +114,7 @@ define NFS_UTILS_REMOVE_NFSIOSTAT
 endef
 
 # nfsiostat is interpreted python, so remove it unless it's in the target
-NFS_UTILS_POST_INSTALL_TARGET_HOOKS += $(if $(BR2_PACKAGE_PYTHON),,NFS_UTILS_REMOVE_NFSIOSTAT)
+NFS_UTILS_POST_INSTALL_TARGET_HOOKS += $(if $(BR2_PACKAGE_PYTHON3),,NFS_UTILS_REMOVE_NFSIOSTAT)
 
 define HOST_NFS_UTILS_BUILD_CMDS
 	$(MAKE) -C $(@D)/tools/rpcgen
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
