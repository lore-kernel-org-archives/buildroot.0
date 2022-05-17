Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF01C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 23:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC62F60B35;
	Tue, 17 May 2022 23:48:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ja05p8CD3ghL; Tue, 17 May 2022 23:48:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02FB460BC7;
	Tue, 17 May 2022 23:48:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D02161BF8B4
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 23:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCEA840144
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 23:47:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id md-yaYxh5M8K for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 23:47:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1DBE040017
 for <buildroot@buildroot.org>; Tue, 17 May 2022 23:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LY8EAownWuunUV6gRt6WtBUd6mqY5Y2LnzG6ozfgZ0c=; b=suxFRa3TT0aWbmJnxzuYQx7LqS
 OP+PS4yt26CAzEZmmIkbHQNFj3JxR67mHP5b3iHgnGR8hTRyigdjYrPqJJCSEcVPwCsJ5MaXUMjFQ
 epWF4krWPttXG9yykGZNexJTAr+mY9uAYCm9po/PQmBfx+4zsSivADKVX8wZgXnfqeR+h/gZkce30
 PNSz+jW1cT3m0ELSSKXU8UnDsFj/szxy47hqK7eTivUR7N2FZqsoUOS7C+nHdzM/I5sHhVOTMPqqd
 DYz92eQOKVBPOjZIVRZlq7AuK9CwEz+DOEAkRdezXv0or89h4U1tWua9YC/JBV4zOupyLJFNyfXxx
 wbT+55bw==;
Received: from 91-153-34-181.elisa-laajakaista.fi ([91.153.34.181] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nr6um-0099bR-Gq; Wed, 18 May 2022 01:47:44 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 68965259;
 Tue, 17 May 2022 23:47:30 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Wed, 18 May 2022 02:47:30 +0300
Message-Id: <20220517234730.4185417-2-aperez@igalia.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220517234730.4185417-1-aperez@igalia.com>
References: <20220517234730.4185417-1-aperez@igalia.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/xdg-dbus-proxy: switch to the meson
 build system
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 0.1.4 introduced a Meson build system, and upstream seems to
have the intention to abandon the previous autotools based one. Switch
to Meson for future proofing.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/xdg-dbus-proxy/xdg-dbus-proxy.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
index b07cf787ed..48f49dba2a 100644
--- a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
+++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
@@ -12,6 +12,6 @@ XDG_DBUS_PROXY_DEPENDENCIES = host-pkgconf libglib2
 XDG_DBUS_PROXY_LICENSE = LGPL-2.1+
 XDG_DBUS_PROXY_LICENSE_FILES = COPYING
 
-XDG_DBUS_PROXY_CONF_OPTS = --disable-man
+XDG_DBUS_PROXY_CONF_OPTS = -Dman=disabled -Dtests=false
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
