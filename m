Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65E3C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 15:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F2D2403F7;
	Thu, 28 Apr 2022 15:51:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eXteBkE49jQK; Thu, 28 Apr 2022 15:51:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1975940490;
	Thu, 28 Apr 2022 15:51:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E274D1BF39D
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 15:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D200D83E6A
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 15:51:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DHth-_HKORgb for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 15:51:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30C3283E4C
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 15:51:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8BAA58463E; Thu, 28 Apr 2022 15:40:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 17:50:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 61bfaf0354b44ae2d4927c54983eaa4c74cd3e0b
X-Git-Newrev: 40f7adae3c036072a05c8d69f7116af1057da301
X-Patchwork-Hint: ignore
Message-Id: <20220428154058.8BAA58463E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dhcp: add security options to DHCP
 server
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

commit: https://git.buildroot.net/buildroot/commit/?id=40f7adae3c036072a05c8d69f7116af1057da301
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I was trying to make the ISC dhcp daemon more secure by using the
-user and -group option to let dhcp server run as non-root user.
Unfortunately these options are not available when building ISC dhcp
server with buildroot.
The reason is, that the configure script must be called with the
option --enable-paranoia to activate these options. But this option
is not set in the dhcp.mk file.

To be backward compatible I added a new option to the dhcp's Config.in
file to enable this feature when desired and parse this option in
dhcp.mk.

Signed-off-by: Andreas Ehmanns <universeiii@gmx.de>
[yann.morin.1998@free.fr: fix check-package]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dhcp/Config.in | 8 ++++++++
 package/dhcp/dhcp.mk   | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
index e0706efafb..adc19dec07 100644
--- a/package/dhcp/Config.in
+++ b/package/dhcp/Config.in
@@ -25,6 +25,14 @@ config BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK
 	help
 	  Enable delayed ACK feature in the ISC DHCP server.
 
+config BR2_PACKAGE_DHCP_SERVER_ENABLE_PARANOIA
+	bool "Enable paranoia options"
+	depends on BR2_PACKAGE_DHCP_SERVER
+	help
+	  Add option --enable-paranoia to configure script. This
+	  activates additional server options (-user, -group and
+	  -chroot) to make dhcp server more secure.
+
 config BR2_PACKAGE_DHCP_RELAY
 	bool "dhcp relay"
 	help
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index f815c6c802..b73137506d 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -78,6 +78,10 @@ ifeq ($(BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK),y)
 DHCP_CONF_OPTS += --enable-delayed-ack
 endif
 
+ifeq ($(BR2_PACKAGE_DHCP_SERVER_ENABLE_PARANOIA),y)
+DHCP_CONF_OPTS += --enable-paranoia
+endif
+
 define DHCP_INSTALL_LIBS
 	$(MAKE) -C $(@D)/bind install-bind DESTDIR=$(TARGET_DIR)
 	$(MAKE) -C $(@D)/common install-exec DESTDIR=$(TARGET_DIR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
