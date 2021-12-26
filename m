Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E5EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 22:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85A6040995;
	Sun, 26 Dec 2021 22:35:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cp5xbU6uDxOU; Sun, 26 Dec 2021 22:35:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98D7540441;
	Sun, 26 Dec 2021 22:35:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 25D381BF2B9
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 22:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 231D660E1A
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 22:35:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vGeLvwrMuthA for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 22:35:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79D7F60DCB
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 22:35:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B62FB82B6F; Sun, 26 Dec 2021 22:29:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 23:34:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f69205cd83b10a23bb6981605bae53cdc6a07850
X-Git-Newrev: ea0f6e803af359173ff276f8c5706ff4cb025182
X-Patchwork-Hint: ignore
Message-Id: <20211226222919.B62FB82B6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-pam: add openssl optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea0f6e803af359173ff276f8c5706ff4cb025182
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openssl is an optional dependency since version 1.5.2 and
https://github.com/linux-pam/linux-pam/commit/b3bb13e18a74e9ece825b7de1b81db97ebb107a0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-pam/linux-pam.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index e309f6a5a4..789dcf5c7b 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -42,6 +42,13 @@ else
 LINUX_PAM_CONF_OPTS += --disable-audit
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LINUX_PAM_CONF_OPTS += --enable-openssl
+LINUX_PAM_DEPENDENCIES += openssl
+else
+LINUX_PAM_CONF_OPTS += --disable-openssl
+endif
+
 # Install default pam config (deny everything except login)
 define LINUX_PAM_INSTALL_CONFIG
 	$(INSTALL) -m 0644 -D package/linux-pam/login.pam \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
