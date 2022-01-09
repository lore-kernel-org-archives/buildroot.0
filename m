Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FE6C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 14:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4F5D40112;
	Sun,  9 Jan 2022 14:49:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mxt19PlH5Jxz; Sun,  9 Jan 2022 14:49:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D70D9400FE;
	Sun,  9 Jan 2022 14:49:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA8E01BF4D6
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 14:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B77F360B59
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 14:49:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YXQ5jvxR8JFu for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 14:49:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B590860B3B
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 14:49:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0858082DC2; Sun,  9 Jan 2022 14:42:58 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 15:29:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0d9b84b7a83fef1048a026a3d1804c8b32a0990d
X-Git-Newrev: 8b94dab2ee4f7467e017ebd8aaa8b26aaa1cc70e
X-Patchwork-Hint: ignore
Message-Id: <20220109144258.0858082DC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: add systemd-oomd user
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b94dab2ee4f7467e017ebd8aaa8b26aaa1cc70e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

add the missing user if oomd is enabled.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/systemd/systemd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 4cf8dd5707..a72ed04aeb 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -428,6 +428,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_OOMD),y)
 SYSTEMD_CONF_OPTS += -Doomd=true
+SYSTEMD_OOMD_USER = systemd-oom -1 systemd-oom -1 * - - - systemd Userspace OOM Killer
 else
 SYSTEMD_CONF_OPTS += -Doomd=false
 endif
@@ -585,6 +586,7 @@ define SYSTEMD_USERS
 	- - systemd-journal -1 * - - - Journal
 	$(SYSTEMD_REMOTE_USER)
 	$(SYSTEMD_COREDUMP_USER)
+	$(SYSTEMD_OOMD_USER)
 	$(SYSTEMD_NETWORKD_USER)
 	$(SYSTEMD_RESOLVED_USER)
 	$(SYSTEMD_TIMESYNCD_USER)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
