Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4006CC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 19:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF79C60A4F;
	Sat,  8 Jan 2022 19:08:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0guAC72WrxYm; Sat,  8 Jan 2022 19:08:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E05A607C9;
	Sat,  8 Jan 2022 19:08:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D1561BF3C9
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 660E44025D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:08:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dv0oLEUPni1i for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 19:08:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9806D4019C
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 19:08:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B98B1832C7; Sat,  8 Jan 2022 19:02:07 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 20:08:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: efc07b7a1818787229ddb335ca26ff2cf03820ae
X-Git-Newrev: 0e71f5111988fe57531d1c84bdf631f1932b14bc
X-Patchwork-Hint: ignore
Message-Id: <20220108190207.B98B1832C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] systemd: ensure tmpfiles.d/legacy.conf is
 installed
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e71f5111988fe57531d1c84bdf631f1932b14bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Systemd doesn't install tmpfiles.d/legacy.conf when sysv compatiblity
isn't enabled. This config sets up /var/lock, which many programs such
as uboot's fw_printenv/setenv still depend on by default.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/systemd/systemd.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 17bb922f51..b3b5ed600d 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -563,9 +563,17 @@ define SYSTEMD_INSTALL_MACHINEID_HOOK
 	touch $(TARGET_DIR)/etc/machine-id
 endef
 
+# systemd doesn't install legacy.conf without sysv-compat
+# This config ensures /var/lock is created
+define SYSTEMD_INSTALL_LEGACY_CONF_HOOK
+	$(INSTALL) -D -m 0644 $(@D)/tmpfiles.d/legacy.conf \
+		$(TARGET_DIR)/usr/lib/tmpfiles.d
+endef
+
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
 	SYSTEMD_INSTALL_INIT_HOOK \
-	SYSTEMD_INSTALL_MACHINEID_HOOK
+	SYSTEMD_INSTALL_MACHINEID_HOOK \
+	SYSTEMD_INSTALL_LEGACY_CONF_HOOK
 
 define SYSTEMD_INSTALL_IMAGES_CMDS
 	$(SYSTEMD_INSTALL_BOOT_FILES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
