Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D25EB64DC
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 10:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BB5E41887;
	Thu,  6 Jul 2023 10:53:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BB5E41887
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2kMLJIgVPOch; Thu,  6 Jul 2023 10:53:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1DD741877;
	Thu,  6 Jul 2023 10:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1DD741877
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D16F1BF28A
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 10:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D05434027F
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 10:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D05434027F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TdQDGCOH9fwE for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 10:52:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1767F405A8
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 10:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1767F405A8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07BDC86817; Thu,  6 Jul 2023 10:52:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 12:47:10 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: f7ae6d3148f6428383209ca5745d2d09eea39a62
X-Git-Newrev: 6e537234e4a2a4c2d3c69c19d221e6f628f5558b
X-Patchwork-Hint: ignore
Message-Id: <20230706105250.07BDC86817@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/hwdata: install
 to staging
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e537234e4a2a4c2d3c69c19d221e6f628f5558b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

hwdata provides a .pc file, which other packages can look up to find the
location where hwdata files are, and use them at build time.

This is the case for the upcoming libdisplay-info package, which
requires the hwdata's PNP IDs at build time.

However, installing the .pc file is not enough. Indeed, meson (which
libdisplay-info uses) will look for the corresponding data files in
datadir, which it locates relative to the sysroot, which is our staging.

So, we also need to install the hwdata files in staging.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f36c57728aa43df2355db731d90712a5a29cc501)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hwdata/hwdata.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 755a9c93f1..cbac3a22d4 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -8,6 +8,7 @@ HWDATA_VERSION = 0.369
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
+HWDATA_INSTALL_STAGING = YES
 
 HWDATA_FILES = \
 	$(if $(BR2_PACKAGE_HWDATA_IAB_OUI_TXT),iab.txt oui.txt) \
@@ -15,7 +16,22 @@ HWDATA_FILES = \
 	$(if $(BR2_PACKAGE_HWDATA_PNP_IDS),pnp.ids) \
 	$(if $(BR2_PACKAGE_HWDATA_USB_IDS),usb.ids)
 
+define HWDATA_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure)
+endef
+
+define HWDATA_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) hwdata.pc
+endef
+
 ifneq ($(strip $(HWDATA_FILES)),)
+define HWDATA_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/hwdata.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/hwdata.pc
+	$(INSTALL) -d -m 755 $(STAGING_DIR)/usr/share/hwdata
+	$(INSTALL) -m 644 -t $(STAGING_DIR)/usr/share/hwdata \
+		$(addprefix $(@D)/,$(HWDATA_FILES))
+endef
 define HWDATA_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/share/hwdata
 	$(INSTALL) -m 644 -t $(TARGET_DIR)/usr/share/hwdata \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
