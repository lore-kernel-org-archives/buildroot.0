Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362D3C3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 09:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C57FB40582;
	Tue, 20 Aug 2024 09:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fd_xPczuUwQl; Tue, 20 Aug 2024 09:36:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A08BE4059E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A08BE4059E;
	Tue, 20 Aug 2024 09:36:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 36C321BF32C
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 09:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E9954094B
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 09:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D0ZoHve9Aid3 for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 09:36:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 73078400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73078400B9
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73078400B9
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 09:36:17 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id B17D7C0C5D
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 09:36:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77D6AFF805;
 Tue, 20 Aug 2024 09:36:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1sgLHb-00GKnM-2W;
 Tue, 20 Aug 2024 11:36:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 11:35:57 +0200
Message-Id: <20240820093559.3893162-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH-NEXT 1/2] package/eudev: correct !static comment
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

eudev itself includes dlfcn.h, so even without kmod it cannot be built
statically:

grep -rs dlfcn build/eudev-3.2.14/src
eudev-3.2.14/src/shared/util.c:#include <dlfcn.h>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/eudev/Config.in | 2 +-
 system/Config.in        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 6e7bbe4648..669a8a15ae 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_EUDEV
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	depends on BR2_USE_MMU # uses fork()
 	depends on BR2_USE_WCHAR # needs C99 compiler
-	depends on !BR2_STATIC_LIBS # kmod
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_UDEV_GENTOO_SCRIPTS if BR2_INIT_OPENRC
 	select BR2_PACKAGE_UTIL_LINUX
diff --git a/system/Config.in b/system/Config.in
index bc0c6eb6bc..244e4af531 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -254,7 +254,7 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
 config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	bool "Dynamic using devtmpfs + eudev"
 	depends on BR2_USE_WCHAR # eudev
-	depends on !BR2_STATIC_LIBS
+	depends on !BR2_STATIC_LIBS # eudev
 	depends on BR2_USE_MMU # eudev
 	select BR2_PACKAGE_EUDEV
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
