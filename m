Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B099BC4332F
	for <buildroot@archiver.kernel.org>; Mon, 13 Nov 2023 13:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BA4E81F33;
	Mon, 13 Nov 2023 13:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BA4E81F33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y8J-zcCaKEmP; Mon, 13 Nov 2023 13:01:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B61A782120;
	Mon, 13 Nov 2023 13:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B61A782120
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D807E1BF476
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 13:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF54881F33
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 13:01:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF54881F33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ntywgfSWcP40 for <buildroot@lists.busybox.net>;
 Mon, 13 Nov 2023 13:01:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6D6A82120
 for <buildroot@buildroot.org>; Mon, 13 Nov 2023 13:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6D6A82120
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C71D5870BE; Mon, 13 Nov 2023 13:01:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Nov 2023 14:00:34 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 0f1bdbc9cc7549026032c808a0dd8ccaeb6bd653
X-Git-Newrev: 481e7ebc4eef384acfaa8c8cd5a6554f7ae69882
X-Patchwork-Hint: ignore
Message-Id: <20231113130151.C71D5870BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package: dhcpcd: fix
 dhcpcd binary not stripped
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

commit: https://git.buildroot.net/buildroot/commit/?id=481e7ebc4eef384acfaa8c8cd5a6554f7ae69882
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

By default dhcpcd installed with 555 permissions as it is
configured in its Makefile.inc. Since 'w' bit is missing,
strip fails and dhcpcd binary installed non-stripped.

On ARM GCC 12 glibc configuration strip saves over 1MB of disk space.

Signed-off-by: Oleg Lyovin <ovlevin@salutedevices.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 72c3f87efacbf593abebe798321f9ecda7adc2d3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcpcd/dhcpcd.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 922d289b26..bce39b59fa 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -17,6 +17,9 @@ DHCPCD_CONFIG_OPTS = \
 	--os=linux \
 	--privsepuser=dhcpcd
 
+DHCPCD_MAKE_OPTS = \
+	BINMODE=755
+
 ifeq ($(BR2_PACKAGE_DHCPCD_ENABLE_PRIVSEP),y)
 DHCPCD_CONFIG_OPTS += --enable-privsep
 else
@@ -43,11 +46,11 @@ define DHCPCD_CONFIGURE_CMDS
 endef
 
 define DHCPCD_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(DHCPCD_MAKE_OPTS) all
 endef
 
 define DHCPCD_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(DHCPCD_MAKE_OPTS) install DESTDIR=$(TARGET_DIR)
 endef
 
 # When network-manager is enabled together with dhcpcd, it will use
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
