Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF1EC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 14:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F87560D7B;
	Sun,  6 Feb 2022 14:56:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F3KUAJdSl5jQ; Sun,  6 Feb 2022 14:56:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9397960B89;
	Sun,  6 Feb 2022 14:56:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B71881BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5CF860B89
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a2bzQnnK-k4i for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 14:56:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E473D60590
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 14:56:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 55256817FB; Sun,  6 Feb 2022 14:48:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 15:55:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 242e9d72e7d2217d6213f63f65d93c5ba3b01f7c
X-Git-Newrev: cee035e4391417851fbbf41a1d4eb0c4d2ad60d4
X-Patchwork-Hint: ignore
Message-Id: <20220206144852.55256817FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nfs-utils: nfsiostat uses python3,
 not python2
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

commit: https://git.buildroot.net/buildroot/commit/?id=cee035e4391417851fbbf41a1d4eb0c4d2ad60d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nfsiostat is a python3 script, so keep it if python3 is enabled and not
python2:

head -n 1 target/usr/sbin/nfsiostat
 #!/usr/bin/python3

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nfs-utils/nfs-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 6a3a801359..44653e2707 100644
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
