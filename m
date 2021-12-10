Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D6FC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 22:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C71C84284D;
	Fri, 10 Dec 2021 22:06:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oeeEZ81UXMzl; Fri, 10 Dec 2021 22:06:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C1E942849;
	Fri, 10 Dec 2021 22:06:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D914B1C1162
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 22:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C774D613D7
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 22:06:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id plYTA5UIjvBS for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 22:06:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8485B6134C
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 22:06:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7FF47825B5; Fri, 10 Dec 2021 22:01:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Dec 2021 23:04:26 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: c6ac525de67a2372af1890440067a0288d4fa980
X-Git-Newrev: cbffaa5bbbe1282afa532ce60f632e56c4b7efaf
X-Patchwork-Hint: ignore
Message-Id: <20211210220118.7FF47825B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/nfs-utils: set
 CONFIG_NFSD
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

commit: https://git.buildroot.net/buildroot/commit/?id=cbffaa5bbbe1282afa532ce60f632e56c4b7efaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14346

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8d44cbc83466b7cd08ed25c23b4f3109a81c46d6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nfs-utils/nfs-utils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 763dd57ace..07b44b5a93 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -90,6 +90,10 @@ NFS_UTILS_CONF_OPTS += --without-systemd
 endif
 
 ifeq ($(BR2_PACKAGE_NFS_UTILS_RPC_NFSD),y)
+define NFS_UTILS_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFSD)
+endef
+
 define NFS_UTILS_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/nfs-utils/S60nfs \
 		$(TARGET_DIR)/etc/init.d/S60nfs
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
