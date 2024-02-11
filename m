Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B835C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 09:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F0654025D;
	Sun, 11 Feb 2024 09:38:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DTeOYNwvCBdH; Sun, 11 Feb 2024 09:38:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C928C4060E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C928C4060E;
	Sun, 11 Feb 2024 09:38:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 486F61BF861
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 09:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35F5A60826
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 09:38:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mo-I9NOsE5AA for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 09:38:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3030160815
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3030160815
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 09:38:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19E0E873FA; Sun, 11 Feb 2024 09:38:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 10:31:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ab4a0a348b255a074d16b640e8a372fe94596dc
X-Git-Newrev: e40ca97d71330c153041b4db856698be8a47c823
X-Patchwork-Hint: ignore
Message-Id: <20240211093811.19E0E873FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jailhouse: install files to /usr
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

commit: https://git.buildroot.net/buildroot/commit/?id=e40ca97d71330c153041b4db856698be8a47c823
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The jailhouse package installs files in the /usr/local prefix. This is
not convenient, because the jailhouse binary ends up in /usr/local/sbin,
which is not in the default Buildroot PATH. See [1]. Moreover, all
other Buildroot packages install files in /usr.

This is because the Buildroot package recipe does not set any prefix
value, and the upstream Jailhouse Makefile has a default to /usr/local.
See [2].

This commit sets the prefix value in the JAILHOUSE_MAKE_OPTS and also
updates other installation commands to put all the files in /usr.

[1] https://gitlab.com/buildroot.org/buildroot/-/blob/2023.11.1/system/Config.in#L495
[2] https://github.com/siemens/jailhouse/blob/v0.12/scripts/include.mk#L22

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/jailhouse/jailhouse.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/jailhouse.mk
index c239e75e76..e7de40cf8c 100644
--- a/package/jailhouse/jailhouse.mk
+++ b/package/jailhouse/jailhouse.mk
@@ -15,7 +15,8 @@ JAILHOUSE_MAKE_OPTS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	ARCH="$(KERNEL_ARCH)" \
 	KDIR="$(LINUX_DIR)" \
-	DESTDIR="$(TARGET_DIR)"
+	DESTDIR="$(TARGET_DIR)" \
+	prefix=/usr
 
 ifeq ($(BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS),y)
 JAILHOUSE_DEPENDENCIES += \
@@ -60,8 +61,8 @@ define JAILHOUSE_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/jailhouse
 	$(INSTALL) -D -m 0644 $(@D)/configs/*/*.cell $(TARGET_DIR)/etc/jailhouse
 
-	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/local/libexec/jailhouse/demos
-	$(INSTALL) -D -m 0755 $(@D)/inmates/demos/*/*.bin $(TARGET_DIR)/usr/local/libexec/jailhouse/demos
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/libexec/jailhouse/demos
+	$(INSTALL) -D -m 0755 $(@D)/inmates/demos/*/*.bin $(TARGET_DIR)/usr/libexec/jailhouse/demos
 
 	$(JAILHOUSE_INSTALL_HELPER_SCRIPTS)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
