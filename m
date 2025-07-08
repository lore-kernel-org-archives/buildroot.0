Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB54C83F09
	for <buildroot@archiver.kernel.org>; Tue,  8 Jul 2025 21:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C1C281E4E;
	Tue,  8 Jul 2025 21:02:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fuhr9TijPCmQ; Tue,  8 Jul 2025 21:02:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC20F81A15
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC20F81A15;
	Tue,  8 Jul 2025 21:02:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 971F11BF
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 21:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70D93400F6
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 21:02:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dt1Qada_jBtA for <buildroot@buildroot.org>;
 Tue,  8 Jul 2025 21:02:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0EF540116
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0EF540116
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 21:02:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AFB9B84452; Tue,  8 Jul 2025 21:02:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Jul 2025 22:58:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 30fc97c2c52064fa29ddd811959e630c9c655a92
X-Git-Newrev: 35708db02403b5066d4efc455e802c666ed01dc9
X-Patchwork-Hint: ignore
Message-Id: <20250708210211.AFB9B84452@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sudo: fix
 SUDO_ENABLE_SUDO_GROUP_RULE following version bump
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=35708db02403b5066d4efc455e802c666ed01dc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the version bump of sudo to 1.9.17p1 [1], the sed command in
SUDO_ENABLE_SUDO_GROUP_RULE no longer matches the the line in the
example sudoers file shipped with the sudo package. This is due to
upstream commit [2].

This commit fixes the regexp to match the new sudoers file.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/ee86844e632d5760355154ea4e928c9228f3dfd1
[2] https://github.com/sudo-project/sudo/commit/7c121ff8340c6fa551ba4997dde9d450cf74e40c

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
[Julien: add link to upstream commit introducing the issue]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sudo/sudo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 4e1405eaf1..f57a86805a 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -73,7 +73,7 @@ define SUDO_USERS
 endef
 
 define SUDO_ENABLE_SUDO_GROUP_RULE
-	$(SED) '/^# \%sudo\tALL=(ALL:ALL) ALL/s/^# //' $(TARGET_DIR)/etc/sudoers
+	$(SED) '/^# \%sudo ALL=(ALL:ALL) ALL/s/^# //' $(TARGET_DIR)/etc/sudoers
 endef
 SUDO_POST_INSTALL_TARGET_HOOKS += SUDO_ENABLE_SUDO_GROUP_RULE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
