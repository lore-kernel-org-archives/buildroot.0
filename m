Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD2ED3A696
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 20:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FA1380DE2;
	Tue, 29 Oct 2024 20:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ClUTqxvvpt_I; Tue, 29 Oct 2024 20:35:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A31C880E30
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A31C880E30;
	Tue, 29 Oct 2024 20:35:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 830804EC0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FC8F80DFD
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rgeDg6sYj-Wr for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 20:35:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA35B80DE2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA35B80DE2
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:35:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4EBF84922; Tue, 29 Oct 2024 20:35:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Oct 2024 21:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d1ec57d008e1d4d56293014f9cfbdc77b6fd302
X-Git-Newrev: fc31199a92042885490b30eb2362f547863d4f8a
X-Patchwork-Hint: ignore
Message-Id: <20241029203506.A4EBF84922@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gobject-introspection: don't
 depend on cairo
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fc31199a92042885490b30eb2362f547863d4f8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, goi depends on cairo.

So far, this would not cause any issue, but once we bump libglib2 and
goi, that would cause a circular dependency chain, where goi would
depend on cairo, cairo on libglib2, and libglib2 back on goi...

However, in goi, cairo is only needed to build some tests, and thus we
do not need that dependency, even before we update goi+libglib2.

Thanks to Fiona for helping sorting the issue out.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gobject-introspection/gobject-introspection.mk | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index ad72af22a2..b1b44d0b4f 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -45,14 +45,8 @@ GOBJECT_INTROSPECTION_CONF_OPTS = \
 	-Dgi_cross_binary_wrapper="$(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper" \
 	-Dgi_cross_ldd_wrapper="$(STAGING_DIR)/usr/bin/g-ir-scanner-lddwrapper" \
 	-Dbuild_introspection_data=true \
-	-Ddoctool=disabled
-
-ifeq ($(BR2_PACKAGE_CAIRO),y)
-GOBJECT_INTROSPECTION_DEPENDENCIES += cairo
-GOBJECT_INTROSPECTION_CONF_OPTS += -Dcairo=enabled
-else
-GOBJECT_INTROSPECTION_CONF_OPTS += -Dcairo=disabled
-endif
+	-Ddoctool=disabled \
+	-Dcairo=disabled
 
 # GI_SCANNER_DISABLE_CACHE=1 prevents g-ir-scanner from writing cache data to ${HOME}
 GOBJECT_INTROSPECTION_CONF_ENV = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
