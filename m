Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A19D743D9
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 21:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84179606D6;
	Wed, 20 Nov 2024 21:04:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QeAQinuBW2Rx; Wed, 20 Nov 2024 21:04:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 149B36FA4D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 149B36FA4D;
	Wed, 20 Nov 2024 21:04:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 18896970
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAB8561141
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:04:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KogAkateInGe for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 21:04:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99BA5610A6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99BA5610A6
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:04:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95C517F881; Wed, 20 Nov 2024 21:04:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 20 Nov 2024 21:53:51 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 2d8d9c45f5ea0730a502e59c629405e2400c37fc
X-Git-Newrev: 09be912cdbefe362fdf98d1b3edceadb524928f0
X-Patchwork-Hint: ignore
Message-Id: <20241120210408.95C517F881@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/sshguard: patch
 /usr/local/sbin/sshguard path in systemd service
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=09be912cdbefe362fdf98d1b3edceadb524928f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The systemd service deployed to the target is derived from an example
hardcoded for the /usr/local/sbin/ path, but we install sshguard at
/usr/sbin/. Thus, by default we get this error message:

$ journalctl -b -u sshguard.service -f
systemd[1]: Started SSHGuard - blocks brute-force login attempts.
(sshguard)[612]: sshguard.service: Unable to locate executable '/usr/local/sbin/sshguard': No such file or directory
(sshguard)[612]: sshguard.service: Failed at step EXEC spawning /usr/local/sbin/sshguard: No such file or directory
systemd[1]: sshguard.service: Main process exited, code=exited, status=203/EXEC
systemd[1]: sshguard.service: Failed with result 'exit-code'.
systemd[1]: sshguard.service: Scheduled restart job, restart counter is at 5.
systemd[1]: sshguard.service: Start request repeated too quickly.
systemd[1]: sshguard.service: Failed with result 'exit-code'.
systemd[1]: Failed to start SSHGuard - blocks brute-force login attempts.

Fix up the path in the service after the $(INSTALL) command has run.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 750d0e377d66b88fc7c976f492aeafc1def4b7dc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sshguard/sshguard.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sshguard/sshguard.mk b/package/sshguard/sshguard.mk
index 8d03635743..97cbbb2bdd 100644
--- a/package/sshguard/sshguard.mk
+++ b/package/sshguard/sshguard.mk
@@ -25,6 +25,8 @@ endef
 define SSHGUARD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(@D)/examples/sshguard.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/sshguard.service
+	$(SED) 's:/usr/local/sbin/sshguard:/usr/sbin/sshguard:g' \
+		$(TARGET_DIR)/usr/lib/systemd/system/sshguard.service
 endef
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
