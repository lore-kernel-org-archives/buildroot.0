Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5E2C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 15:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2347161B9E;
	Tue, 26 Jul 2022 15:15:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2347161B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9QG25xJXOx4c; Tue, 26 Jul 2022 15:15:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 326E461B9A;
	Tue, 26 Jul 2022 15:15:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 326E461B9A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B517E1BF5A2
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 15:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E28883FAE
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 15:15:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E28883FAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CsMXXanlm-ub for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 15:15:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 565A58406E
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 565A58406E
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 15:15:44 +0000 (UTC)
Received: from vfazio2.xes-mad.com (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id 181A3202B0;
 Tue, 26 Jul 2022 10:15:43 -0500 (CDT)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 10:15:36 -0500
Message-Id: <20220726151536.2937333-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1658848543; bh=Vk6ZvufkHJhgOADjveTdkspiPXGWyV3+c0ZkQwpL1C4=;
 h=From:To:Cc:Subject:Date:From;
 b=NLdXuREaFS8zSWhijVDXgo8pAX4ohxus2j3ufkoN26QuJdq5ezf4vR2BqQnIYdTYx
 H/pjhRvjg9nDrirFBZRSf35ksBOPQ969i1iT6ba5wKCSQ+5gILEkNqzyKc4V9saRNJ
 DiU/un0GIoNrRBZZY+YrHVfKSf4hLmP6p7im8ZSo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=NLdXuREa
Subject: [Buildroot] [PATCH] package/mesa3d-headers: fix install of dri.pc
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Vincent Fazio <vfazio@xes-inc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With the version bump to 22.x, the dri.pc file was no longer deployed as
it was believed to not be provided.

While it was temporarily missing from upstream as part of deprecating
the classic driver, it was reintroduced prior to the 22.0 release via:
  https://gitlab.freedesktop.org/mesa/mesa/-/commit/3ae3569d822c2546c4c748090f8a6c8016f763ea

This file is still necessary to build Xorg server. See previous commits:
  9014c21cac
  7468b60e7c

Fixes: 6c25d1099 ("package/{mesa3d, mesa3d-headers}: bump version to 22.1.3")

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index a5cefa254f..8eca2934de 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -33,9 +33,19 @@ MESA3D_HEADERS_DIRS += GL
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 
+# Not using $(SED) because we do not want to work in-place, and $(SED)
+# contains -i.
+define MESA3D_HEADERS_BUILD_DRI_PC
+       sed -e 's:@VERSION@:$(MESA3D_HEADERS_VERSION):' \
+           $(MESA3D_HEADERS_PKGDIR)/dri.pc \
+           >$(@D)/src/gallium/frontends/dri/dri.pc
+endef
+
 define MESA3D_HEADERS_INSTALL_DRI_PC
 	$(INSTALL) -D -m 0644 $(@D)/include/GL/internal/dri_interface.h \
 		$(STAGING_DIR)/usr/include/GL/internal/dri_interface.h
+        $(INSTALL) -D -m 0644 $(@D)/src/gallium/frontends/dri/dri.pc \
+                $(STAGING_DIR)/usr/lib/pkgconfig/dri.pc
 endef
 
 endif # Xorg
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
