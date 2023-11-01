Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29680C4167D
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 18:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B40FE8230F;
	Wed,  1 Nov 2023 18:13:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B40FE8230F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o4uKvd6_2zk1; Wed,  1 Nov 2023 18:13:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA80184C9F;
	Wed,  1 Nov 2023 18:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA80184C9F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F91A1BF59F
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 18:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12E9B704B9
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 18:13:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12E9B704B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tfCOEa1Ygj_m for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 18:13:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0858070444
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 18:13:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0858070444
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1ED68641A; Wed,  1 Nov 2023 18:13:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 19:10:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 730c90faa3ec13ee1ead47113c9c5c7d3a8dac55
X-Git-Newrev: 3f986eaeb2e952121c8e2b257384ba1df83d6d2b
X-Patchwork-Hint: ignore
Message-Id: <20231101181336.E1ED68641A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openrc: add linux-pam support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3f986eaeb2e952121c8e2b257384ba1df83d6d2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openrc/openrc.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 8cc488a081..908b44190a 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -14,7 +14,6 @@ OPENRC_DEPENDENCIES = ncurses
 
 OPENRC_CONF_OPTS = \
 	-Dos=Linux \
-	-Dpam=false \
 	-Dlibrcdir=/usr/libexec/rc \
 	-Dpkgconfig=false \
 	-Dsysvinit=true \
@@ -28,6 +27,13 @@ else
 OPENRC_CONF_OPTS += -Dselinux=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+OPENRC_CONF_OPTS += -Dpam=true
+OPENRC_DEPENDENCIES += linux-pam
+else
+OPENRC_CONF_OPTS += -Dpam=false
+endif
+
 define OPENRC_INSTALL_SYSV_RCS_SCRIPT
 	$(INSTALL) -D -m 0755 $(OPENRC_PKGDIR)/sysv-rcs \
 		$(TARGET_DIR)/etc/init.d/sysv-rcs
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
