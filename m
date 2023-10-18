Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FFECDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 09:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C09060D9D;
	Wed, 18 Oct 2023 09:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C09060D9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xC3b67ou9xHf; Wed, 18 Oct 2023 09:39:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E300760B8A;
	Wed, 18 Oct 2023 09:39:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E300760B8A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 392861BF5F6
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 09:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1224641C4E
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 09:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1224641C4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1czYTRjiR0PL for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 09:39:38 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8794441C3C
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 09:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8794441C3C
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qt31a-001knd-85; Wed, 18 Oct 2023 11:39:34 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 1ce6a58a;
 Wed, 18 Oct 2023 09:39:33 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Wed, 18 Oct 2023 12:35:46 +0300
Message-ID: <20231018093933.1315894-1-aperez@igalia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017195327.644914-1-aperez@igalia.com>
References: 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KiSxSK/OgHMlg6lSdRdmTQnQ3cf9EiY+2TKWjEejkVA=; b=gi0wXmWswhOmNbx85mLFU0Uo6y
 74wph27SGyxiDQLhZXRzkHoRSP/5mM6vc5/S2whjSgJjk10SxNihJOOMW/9xLmsxT7KDQAetfbC3R
 hlKK57Ib1P/NQCw04H8Qg6NJV/p/pmj1sbKdBCg6TYMaH2kFx1H3Dp0Cfgho0GxCWKpzbUZpV3dOV
 Oyw0JwGEKhchwBgiWgwnoZrTTZSo2qQxDEoWEAB6rLEAObHtGazhKChQL0F2JhdxnFaGplEi5N19F
 UwOhah4+aDv9jxZHj8WBulkGAzuUwcZn7/ajaLou+bpsC1Ug9aNrPdRL6Byy2ZlglsJxfVxR3zlPK
 XXS008fA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=gi0wXmWs
Subject: [Buildroot] [PATCH v2] package/xdg-dbus-proxy: bump to version 0.1.5
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
Changes v1->v2:
- Correct tarball name in .hash file

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/xdg-dbus-proxy/xdg-dbus-proxy.hash | 4 ++--
 package/xdg-dbus-proxy/xdg-dbus-proxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
index 7bbea72b03..f61a6a91ae 100644
--- a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
+++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
@@ -1,5 +1,5 @@
-# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.4
-sha256  1ec0eab53d1e49966d722352bcfd51ac402dce5190baedc749a8541e761670ab  xdg-dbus-proxy-0.1.4.tar.xz
+# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.5
+sha256  061dcfaf8a0650e5fd9d5432dfe88bda749ea0d079dc136304bfecfbce0661fb  xdg-dbus-proxy-0.1.5.tar.xz
 
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
