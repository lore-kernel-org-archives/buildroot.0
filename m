Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B59C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 21:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B887402A6;
	Mon, 27 Dec 2021 21:28:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NMRseIIUh4wD; Mon, 27 Dec 2021 21:28:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A4894035D;
	Mon, 27 Dec 2021 21:27:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 516381BF35D
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D1FC607DE
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:27:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AoqCIXvK7yfK for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 21:27:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF9EA60AA1
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 21:27:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CBE6D82B85; Mon, 27 Dec 2021 21:21:52 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 22:27:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a15cb73b4930912a0f31646759c354a52f4c946c
X-Git-Newrev: 9ae792cc0153c73b2d44301983753adecb37221c
X-Patchwork-Hint: ignore
Message-Id: <20211227212152.CBE6D82B85@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: add optional
 systemd support
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

commit: https://git.buildroot.net/buildroot/commit/?id=9ae792cc0153c73b2d44301983753adecb37221c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/network-manager/network-manager.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index a787c25c00..974320fce0 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -113,6 +113,21 @@ else
 NETWORK_MANAGER_CONF_OPTS += --without-ofono
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+NETWORK_MANAGER_DEPENDENCIES += systemd
+NETWORK_MANAGER_CONF_OPTS += \
+	--with-systemd-journal \
+	--with-config-logging-backend-default=journal \
+	--with-session-tracking=systemd \
+	--with-suspend-resume=systemd
+else
+NETWORK_MANAGER_CONF_OPTS += \
+	--without-systemd-journal \
+	--with-config-logging-backend-default=syslog \
+	--without-session-tracking \
+	--with-suspend-resume=upower
+endif
+
 ifeq ($(BR2_PACKAGE_POLKIT),y)
 NETWORK_MANAGER_DEPENDENCIES += polkit
 NETWORK_MANAGER_CONF_OPTS += --enable-polkit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
