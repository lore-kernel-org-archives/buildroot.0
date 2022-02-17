Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11ABEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 16:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B761C6F754;
	Thu, 17 Feb 2022 16:37:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ppGMLWs4quhW; Thu, 17 Feb 2022 16:37:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA6396F73C;
	Thu, 17 Feb 2022 16:37:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C909F1BF8B4
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 16:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6C7542595
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 16:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PK0gxTXRtBHN for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 16:36:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2407B42594
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 16:36:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8C6F2836E4; Thu, 17 Feb 2022 16:28:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 17:33:51 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: b96f2215394e378835188f7551ba3c05d47f6782
X-Git-Newrev: c8d709529f0fff956032cadf5de68b517b3b38bd
X-Patchwork-Hint: ignore
Message-Id: <20220217162852.8C6F2836E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/nfs-utils:
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8d709529f0fff956032cadf5de68b517b3b38bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
index ed0a23e151..f5d29ab535 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -93,7 +93,7 @@ define NFS_UTILS_REMOVE_NFSIOSTAT
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
