Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7D1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 18:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14E7F408D3;
	Sun, 20 Mar 2022 18:47:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fmI6nXF18tXH; Sun, 20 Mar 2022 18:47:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C13D408CE;
	Sun, 20 Mar 2022 18:47:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9BB0F1BF4D8
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91F02400D1
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YXS9QSMQHoyx for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 18:46:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6586F40579
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 18:46:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8E56E8461D; Sun, 20 Mar 2022 18:37:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 19:28:37 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 8a2efbee7a901691e80462b8aba683a68074e4d2
X-Git-Newrev: 38aa995347d264fdc171101a6ebe60835e65c2bd
X-Patchwork-Hint: ignore
Message-Id: <20220320183734.8E56E8461D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/shairport-sync:
 install dbus policy file to target
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

commit: https://git.buildroot.net/buildroot/commit/?id=38aa995347d264fdc171101a6ebe60835e65c2bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This adds two extra commands to install dbus policy config
to target if dbus option is enabled.

Signed-off-by: Yunhao Tian <t123yh.xyz@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d74963400633ec9056646fdc50a91a046489a719)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/shairport-sync/shairport-sync.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 487e0c05e5..4430014ec9 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -59,6 +59,14 @@ endif
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_DBUS),y)
 SHAIRPORT_SYNC_DEPENDENCIES += libglib2
 SHAIRPORT_SYNC_CONF_OPTS += --with-dbus-interface --with-mpris-interface
+define SHAIRPORT_SYNC_INSTALL_DBUS
+	$(INSTALL) -m 0644 -D \
+		$(@D)/scripts/shairport-sync-dbus-policy.conf \
+		$(TARGET_DIR)/etc/dbus-1/system.d/shairport-sync-dbus.conf
+	$(INSTALL) -m 0644 -D \
+		$(@D)/scripts/shairport-sync-mpris-policy.conf \
+		$(TARGET_DIR)/etc/dbus-1/system.d/shairport-sync-mpris.conf
+endef
 else
 SHAIRPORT_SYNC_CONF_OPTS += --without-dbus-interface --without-mpris-interface
 endif
@@ -82,6 +90,7 @@ define SHAIRPORT_SYNC_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/bin/shairport-sync
 	$(INSTALL) -D -m 0644 $(@D)/scripts/shairport-sync.conf \
 		$(TARGET_DIR)/etc/shairport-sync.conf
+	$(SHAIRPORT_SYNC_INSTALL_DBUS)
 endef
 
 define SHAIRPORT_SYNC_INSTALL_INIT_SYSV
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
