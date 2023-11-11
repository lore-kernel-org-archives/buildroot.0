Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABBBC4332F
	for <buildroot@archiver.kernel.org>; Sat, 11 Nov 2023 15:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E2578235A;
	Sat, 11 Nov 2023 15:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E2578235A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EJp0ViK-ZAMY; Sat, 11 Nov 2023 15:09:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 980208278F;
	Sat, 11 Nov 2023 15:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 980208278F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EDFFB1BF283
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 15:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C72F560BE9
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 15:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C72F560BE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZMDeSOWMVD6y for <buildroot@lists.busybox.net>;
 Sat, 11 Nov 2023 15:08:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7D6660BE7
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 15:08:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7D6660BE7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0FE286FE6; Sat, 11 Nov 2023 15:08:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 11 Nov 2023 14:42:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af6eaaf23440de126a18e1073f7037137fd4b3d0
X-Git-Newrev: 72c3f87efacbf593abebe798321f9ecda7adc2d3
X-Patchwork-Hint: ignore
Message-Id: <20231111150857.B0FE286FE6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package: dhcpcd: fix dhcpcd binary not
 stripped
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

commit: https://git.buildroot.net/buildroot/commit/?id=72c3f87efacbf593abebe798321f9ecda7adc2d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default dhcpcd installed with 555 permissions as it is
configured in its Makefile.inc. Since 'w' bit is missing,
strip fails and dhcpcd binary installed non-stripped.

On ARM GCC 12 glibc configuration strip saves over 1MB of disk space.

Signed-off-by: Oleg Lyovin <ovlevin@salutedevices.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcpcd/dhcpcd.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index a194bce323..ba1481e83d 100644
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
