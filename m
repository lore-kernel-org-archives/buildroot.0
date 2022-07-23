Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C5FC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E727360FE0;
	Sat, 23 Jul 2022 16:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E727360FE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nlVKpGsHSpjl; Sat, 23 Jul 2022 16:42:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D560F60ECE;
	Sat, 23 Jul 2022 16:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D560F60ECE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B13911BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B00F4177C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:42:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B00F4177C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iGiyUbJV2N6k for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:42:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97DDB41A10
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97DDB41A10
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 60FFE846F3; Sat, 23 Jul 2022 16:28:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 18:42:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7c65d505c0cc440f327267aa5ad6ef3d06c858a
X-Git-Newrev: dad510abd17c7c4a6fdab08d9c71dcf3be3eb1f5
X-Patchwork-Hint: ignore
Message-Id: <20220723162846.60FFE846F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: allow empty systemd
 default target
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

commit: https://git.buildroot.net/buildroot/commit/?id=dad510abd17c7c4a6fdab08d9c71dcf3be3eb1f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we forcefully require that a default target be specified.
However, systemd does install a default target, but it's not
possible to just use that target.

Allow the user to blank-out the config setting to not override
whatever systemd installed and keep that.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
[yann.morin.1998@free.fr:
  - introduce the usual qstripped inter;ediate variable
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/systemd.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 46a4e8de2c..47aaddf849 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -570,17 +570,20 @@ ifneq ($(SYSTEMD_FALLBACK_HOSTNAME),)
 SYSTEMD_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
 endif
 
+SYSTEMD_DEFAULT_TARGET = $(call qstrip,$(BR2_PACKAGE_SYSTEMD_DEFAULT_TARGET))
+ifneq ($(SYSTEMD_DEFAULT_TARGET),)
 define SYSTEMD_INSTALL_INIT_HOOK
-	ln -fs "$(call qstrip,$(BR2_PACKAGE_SYSTEMD_DEFAULT_TARGET))" \
+	ln -fs "$(SYSTEMD_DEFAULT_TARGET)" \
 		$(TARGET_DIR)/usr/lib/systemd/system/default.target
 endef
+SYSTEMD_POST_INSTALL_TARGET_HOOKS += SYSTEMD_INSTALL_INIT_HOOK
+endif
 
 define SYSTEMD_INSTALL_MACHINEID_HOOK
 	touch $(TARGET_DIR)/etc/machine-id
 endef
 
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
-	SYSTEMD_INSTALL_INIT_HOOK \
 	SYSTEMD_INSTALL_MACHINEID_HOOK
 
 define SYSTEMD_INSTALL_IMAGES_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
