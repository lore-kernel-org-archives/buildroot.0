Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B58C433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 21:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3F00415E6;
	Wed,  1 Jun 2022 21:10:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r0xxMzmDoy9O; Wed,  1 Jun 2022 21:10:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BA04415E3;
	Wed,  1 Jun 2022 21:10:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 520441BF36A
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D599415E3
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8M7UFnITu4ov for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 21:09:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5303E415E2
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 21:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HqrWCsrB+7M+5o+DAkEs5Ny7eSPGHD3bdnvkcjsK850=; b=kdnDXNUqvkWgDo8xQdt45nYA+c
 DszD0IhK9KPGBAJTd/mBQdVnC9W4Va2QCQgo6NV2LDv+PcXMTYnLxXRFJozq3wfU4CGbkYzCz2nar
 Ksvuea6ZPM0jdvkFC7neNa6Fhu61DTtwlGEy/xyCR+FKMUoQZOr1zPflBjYNT8ppg73PhRy44z0Ks
 pcjGPw/BB7hj3dmuOdhY0/COk+4x8JTrx6Wq006a9wtR1geFn+pqtPNKtu869loIQpv8tKrJGZcDn
 hsuPXaVjEcvvdXsuxesuXNB/bzUVZ1AbywwZK+Lr6eoiOxVRktBqXeXryc5R8DaZRRUlgK23P9NwI
 SKFFXNRA==;
Received: from 91-153-34-181.elisa-laajakaista.fi ([91.153.34.181] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nwVbF-007f5Y-3T; Wed, 01 Jun 2022 23:09:53 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 40c5e1aa;
 Wed, 1 Jun 2022 21:09:39 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Thu,  2 Jun 2022 00:09:39 +0300
Message-Id: <20220601210939.2350383-2-aperez@igalia.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601210939.2350383-1-aperez@igalia.com>
References: <20220601210939.2350383-1-aperez@igalia.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/webkitgtk: support game controllers
 via libmanette
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for the Gamepad API in webkitgtk, depending on
libmanette, which is used for implementing access to game
controllers.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 39b16a90e7..07fc98c5f6 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -18,7 +18,6 @@ WEBKITGTK_DEPENDENCIES = host-ruby host-python3 host-gperf \
 	libtasn1 libxml2 libxslt openjpeg sqlite webp woff2
 WEBKITGTK_CONF_OPTS = \
 	-DENABLE_API_TESTS=OFF \
-	-DENABLE_GAMEPAD=OFF \
 	-DENABLE_GEOLOCATION=OFF \
 	-DENABLE_GTKDOC=OFF \
 	-DENABLE_MINIBROWSER=ON \
@@ -71,6 +70,13 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_INTROSPECTION=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBMANETTE),y)
+WEBKITGTK_CONF_OPTS += -DENABLE_GAMEPAD=ON
+WEBKITGTK_DEPENDENCIES += libmanette
+else
+WEBKITGTK_CONF_OPTS += -DENABLE_GAMEPAD=OFF
+endif
+
 # Only one target platform can be built, assume X11 > Wayland
 
 # GTK3-X11 target gives OpenGL from newer libgtk3 versions
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
