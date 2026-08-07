Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D45C5AC9E
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FBD2608F0;
	Fri,  7 Aug 2026 09:35:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fLBqMlogr2af; Fri,  7 Aug 2026 09:35:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A68E9608F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095344;
	bh=p6xUNhkAqqbnhtqI3hpugLXb3IWQiNeEa3ZVXczoZ6o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MTQZuaoF5+juXJfII6DSnuaao8ef8yutme2lUDQ82FmP9sseVHh4u2q/RQfjvpxSd
	 BahgoTW7J/JR/iDgjw7kSGtSQcEDfiNgGJqel0bVe8QTydOMA4jAIDbTrC69w0AaHG
	 ml44AuNaEiW56WH8EUYjs9//mFyLIOPMKF63ppFTRl6vpKYOIuulk1gabFRW3ZaG+L
	 cVn6lj4aC/+LZHwqHMklHXZOFXjcoO9TkhBHDuRgkmxgjDRHpwksrxoPWxdyynWXpP
	 u3W4ngne90QYUExQfMh/r9/DGtGV2LVkMXumZoF0PwMStamU+sXhPiyUHp/1oJqcGe
	 hFBbxqUFUftHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A68E9608F7;
	Fri,  7 Aug 2026 09:35:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 132E7D3
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 058B14019B
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fbpx9cxj7OoN for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A56440064
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A56440064
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C41B98CA42; Fri,  7 Aug 2026 09:34:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:12:42 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 772bf9f87356d2619e66c97936cc60e8bae18de3
X-Git-Newrev: fde8ba3df7cd3af9d55d1a9fcfeb9a3b0adb39a4
X-Patchwork-Hint: ignore
Message-Id: <20260807093442.C41B98CA42@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/network-manager:
 drop initrd-related services when unneeded
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fde8ba3df7cd3af9d55d1a9fcfeb9a3b0adb39a4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Since NetworkManager 1.54, packaged since commit 24827ae398db
(package/network-manager: bump to 1.56.0), new services related to
running in an initrd are now installed, which prevents proper startup,
with systemd reporting that two units declare the same BusName.

When systemd is configured without initrd support, drop the
NetworkManager initrd-related services.

Fixes: 24827ae398db

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Fiona Klute <fiona.klute@gmx.de>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>
Acked-by: TIAN Yuanhao <tianyuanhao3@163.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 32bdc4710a483c3ea7b0d5a805b2a857f9a11872)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/network-manager/network-manager.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 301c1ad43e..bf4f29c3cc 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -151,6 +151,12 @@ NETWORK_MANAGER_CONF_OPTS += \
 	-Dconfig_logging_backend_default=journal \
 	-Dsession_tracking=systemd \
 	-Dsuspend_resume=systemd
+ifneq ($(BR2_PACKAGE_SYSTEMD_INITRD),y)
+define NETWORK_MANAGER_CLEAN_INITRD
+	rm -f $(TARGET_DIR)/usr/lib/systemd/system/NetworkManager-*initrd.service
+endef
+NETWORK_MANAGER_POST_INSTALL_TARGET_HOOKS += NETWORK_MANAGER_CLEAN_INITRD
+endif
 else
 NETWORK_MANAGER_CONF_OPTS += \
 	-Dsystemd_journal=false \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
