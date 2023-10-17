Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC081CDB474
	for <buildroot@archiver.kernel.org>; Tue, 17 Oct 2023 20:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B676612D3;
	Tue, 17 Oct 2023 20:23:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B676612D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id duaOqLMPssCL; Tue, 17 Oct 2023 20:23:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F272B6102E;
	Tue, 17 Oct 2023 20:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F272B6102E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE10A1BF297
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 20:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A313341E08
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 20:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A313341E08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1iyfkGTEWS4p for <buildroot@lists.busybox.net>;
 Tue, 17 Oct 2023 20:23:26 +0000 (UTC)
X-Greylist: delayed 1793 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 17 Oct 2023 20:23:26 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 484CB41DF1
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 484CB41DF1
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 20:23:26 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qsq88-001Yru-Dj; Tue, 17 Oct 2023 21:53:28 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 19813256;
 Tue, 17 Oct 2023 19:53:27 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Tue, 17 Oct 2023 22:53:24 +0300
Message-ID: <20231017195327.644914-1-aperez@igalia.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P1UwkyXwY8RLcwcQIhfmpouHYr1QeKvHuns4N5+qz+g=; b=Hu0rexG5F7ubjnxxHlAPNNzNb5
 YyUzFrpQe9jZYvVgxFkSzrqY4xj4yaXhqKU6JwrGYYsIsQaeHKm7b6yx6ICmjP35p9EqCtB1gL1pz
 vBl3UV7q/8+aX5ke5dxqDmx7kJGLQrd5+vsLLVut4yBtU4RiViRLMptGM2fOGBUZQk3Bx4ORPVfKM
 D9PfWzCwLiYMPhFt/x9nzVAu96z7ZR1b+V+z6p2nb78f1XTCJB6daejKS3tnlVcJaYA4kpj8XOq8V
 sceySSLkykTpnBsvNnTw7SMp9tcEQWRrJNyu0aRKNdlI2IWZA1CgXJsBoTFGDr2y8gf7mzxKH0gUU
 uMQXqG4g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=Hu0rexG5
Subject: [Buildroot] [PATCH] package/xdg-dbus-proxy: bump to version 0.1.5
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 0.1.5 mainly fixes handling of paths with more than 255
characters. Release notes:

  https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.5

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/xdg-dbus-proxy/xdg-dbus-proxy.hash | 4 ++--
 package/xdg-dbus-proxy/xdg-dbus-proxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
index 7bbea72b03..37f1790c9b 100644
--- a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
+++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
@@ -1,5 +1,5 @@
-# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.4
-sha256  1ec0eab53d1e49966d722352bcfd51ac402dce5190baedc749a8541e761670ab  xdg-dbus-proxy-0.1.4.tar.xz
+# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.5
+sha256  061dcfaf8a0650e5fd9d5432dfe88bda749ea0d079dc136304bfecfbce0661fb  xdg-dbus-proxy-0.1.4.tar.xz
 
 # Hash for license files:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
index 48f49dba2a..2e8c054386 100644
--- a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
+++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDG_DBUS_PROXY_VERSION = 0.1.4
+XDG_DBUS_PROXY_VERSION = 0.1.5
 XDG_DBUS_PROXY_SITE = https://github.com/flatpak/xdg-dbus-proxy/releases/download/$(XDG_DBUS_PROXY_VERSION)
 XDG_DBUS_PROXY_SOURCE = xdg-dbus-proxy-$(XDG_DBUS_PROXY_VERSION).tar.xz
 XDG_DBUS_PROXY_DEPENDENCIES = host-pkgconf libglib2
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
