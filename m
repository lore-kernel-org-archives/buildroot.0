Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D087BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 810A260B73;
	Sat, 30 Apr 2022 18:57:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tv0uPWraFAdW; Sat, 30 Apr 2022 18:57:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9559F60B4D;
	Sat, 30 Apr 2022 18:57:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 865CB1BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 166214161E
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RmzhWupHUhZU for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:54:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3015441620
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:54:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BDF4F84B55; Sat, 30 Apr 2022 18:44:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 30 Apr 2022 20:40:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5cb1bbc6276c64815e299ed698d6d42f012634db
X-Git-Newrev: f4b19927cc12d35a74eca0016ada06b21cf32e5e
X-Patchwork-Hint: ignore
Message-Id: <20220430184417.BDF4F84B55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dhcp: add explicit option disabling
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

commit: https://git.buildroot.net/buildroot/commit/?id=f4b19927cc12d35a74eca0016ada06b21cf32e5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commits 4db37c663cc0 (dhcp: add config option for delayed-ack feature
of dhcp server) and 40f7adae3c03 (package/dhcp: add security options to
DHCP server) forgot to explicit disable the option when not requested.

Fix that now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Andreas Ehmanns <universeiii@gmx.de>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Cc: Jan Havran <havran.jan@email.cz>
Cc: Eugen Hristev <eugen.hristev@microchip.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dhcp/dhcp.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index b73137506d..cbc95cb152 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -76,10 +76,14 @@ endif
 
 ifeq ($(BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK),y)
 DHCP_CONF_OPTS += --enable-delayed-ack
+else
+DHCP_CONF_OPTS += --disable-delayed-ack
 endif
 
 ifeq ($(BR2_PACKAGE_DHCP_SERVER_ENABLE_PARANOIA),y)
 DHCP_CONF_OPTS += --enable-paranoia
+else
+DHCP_CONF_OPTS += --disable-paranoia
 endif
 
 define DHCP_INSTALL_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
