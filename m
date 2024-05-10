Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3ED1C25B74
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 12:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B62CC42ADC;
	Fri, 10 May 2024 12:03:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Dc4fI4Grx7h; Fri, 10 May 2024 12:03:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A57442A7E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A57442A7E;
	Fri, 10 May 2024 12:03:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F3F11BF2A1
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 12:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BF3961548
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 12:03:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FcG5gF944fjg for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 12:03:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D76896137E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D76896137E
 for <buildroot@buildroot.org>; Fri, 10 May 2024 12:03:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C49BB86E91; Fri, 10 May 2024 12:03:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 14:01:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f1f926adc7f2af1aee3ce018243ee8580471ab8c
X-Git-Newrev: 91848e73ae6f5ad6ca0568f8e7309247379e51f1
X-Patchwork-Hint: ignore
Message-Id: <20240510120306.C49BB86E91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdrm: fix install of test
 programs
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

commit: https://git.buildroot.net/buildroot/commit/?id=91848e73ae6f5ad6ca0568f8e7309247379e51f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit f95069814bd68cfc10ccf2dbc41efa6f1e127495 disabled the
build of test programs unconditionally without considering the option
BR2_PACKAGE_LIBDRM_INSTALL_TESTS.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libdrm/libdrm.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index a04331c2da..e0c1217b38 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -17,8 +17,7 @@ LIBDRM_DEPENDENCIES = \
 
 LIBDRM_CONF_OPTS = \
 	-Dcairo-tests=disabled \
-	-Dman-pages=disabled \
-	-Dtests=false
+	-Dman-pages=disabled
 
 ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
 LIBDRM_DEPENDENCIES += libatomic_ops
@@ -109,10 +108,12 @@ LIBDRM_CONF_OPTS += -Dvalgrind=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_INSTALL_TESTS),y)
-LIBDRM_CONF_OPTS += -Dinstall-test-programs=true
+LIBDRM_CONF_OPTS += -Dtests=true -Dinstall-test-programs=true
 ifeq ($(BR2_PACKAGE_CUNIT),y)
 LIBDRM_DEPENDENCIES += cunit
 endif
+else
+LIBDRM_CONF_OPTS += -Dtests=false
 endif
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
