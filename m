Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD2EC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 19:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15A2C60ABB;
	Thu, 28 Jul 2022 19:05:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15A2C60ABB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pe8hCWrpuJL8; Thu, 28 Jul 2022 19:05:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 357C160A87;
	Thu, 28 Jul 2022 19:05:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 357C160A87
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 494F11BF21A
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16F94416A3
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:04:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16F94416A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fd5xIY8zsKuJ for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 19:04:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5553B409BB
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 19:04:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5553B409BB
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 50BAD864E4; Thu, 28 Jul 2022 18:50:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 21:03:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a1e8cd3e1ffc48d10969bcceffc7c8086119f9a
X-Git-Newrev: ed3ae42807ec2fa39ee4ab92ea3794a06f2e51ac
X-Patchwork-Hint: ignore
Message-Id: <20220728185030.50BAD864E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: remove hwdb-update service
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed3ae42807ec2fa39ee4ab92ea3794a06f2e51ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the source HWDB files are already removed from the target, it
makes little sense to keep the service around.  If accidently
triggered it could create an empty database.

The service is installed in both staging and host directory as well and
not removed from there, so a user could craft his own solutions if it's
necessary to update the database.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/systemd/systemd.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 624de68584..19fd525534 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -310,6 +310,12 @@ define SYSTEMD_BUILD_HWDB
 	$(HOST_DIR)/bin/systemd-hwdb update --root $(TARGET_DIR) --strict --usr
 endef
 SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_BUILD_HWDB
+define SYSTEMD_RM_HWBD_UPDATE_SERVICE
+	rm -rf $(TARGET_DIR)/usr/lib/systemd/system/systemd-hwdb-update.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/*/systemd-hwdb-update.service \
+		$(TARGET_DIR)/usr/bin/systemd-hwdb
+endef
+SYSTEMD_POST_INSTALL_TARGET_HOOKS += SYSTEMD_RM_HWBD_UPDATE_SERVICE
 else
 SYSTEMD_CONF_OPTS += -Dhwdb=false
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
