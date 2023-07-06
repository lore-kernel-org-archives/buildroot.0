Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA304EB64DD
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 10:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73E2941875;
	Thu,  6 Jul 2023 10:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73E2941875
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r9T4PMx8zVhu; Thu,  6 Jul 2023 10:52:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 380EC41883;
	Thu,  6 Jul 2023 10:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 380EC41883
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 598BF1BF28A
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 10:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA64A402A7
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 10:51:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA64A402A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yu1wtDTAfoqO for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 10:51:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D35B240B08
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 10:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D35B240B08
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C172F86807; Thu,  6 Jul 2023 10:51:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 12:47:53 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 6dcfb24bed0502e8ecdf7e0a06fdbbe37985fb94
X-Git-Newrev: 4c248eb4d85cbcf46b46e332e91b8586a2876709
X-Patchwork-Hint: ignore
Message-Id: <20230706105142.C172F86807@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/hwdata: install
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c248eb4d85cbcf46b46e332e91b8586a2876709
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
index 00fe6c1455..4bda6c7329 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -8,6 +8,7 @@ HWDATA_VERSION = 0.365
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
