Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD46C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:09:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD6C360FD9
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD6C360FD9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B9094077E;
	Thu, 26 Aug 2021 22:09:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RV3np0NMnAUM; Thu, 26 Aug 2021 22:09:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F2A140781;
	Thu, 26 Aug 2021 22:09:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 492C21C113E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB3A1426B0
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mk0evqVhge-M for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4601426B1
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 23D888DC52; Thu, 26 Aug 2021 22:01:29 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 12 Aug 2021 23:48:04 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c786507f076fdebcf49d150ff72ed95102dc7497
X-Git-Newrev: 34da8f96141f14abd98bc4cab3fa05c0b7a0a895
X-Patchwork-Hint: ignore
Message-Id: <20210826220129.23D888DC52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gobject-introspection:
 fix exec_prefix
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=34da8f96141f14abd98bc4cab3fa05c0b7a0a895
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

exec_prefix has been removed since version 1.66 and
https://gitlab.gnome.org/GNOME/gobject-introspection/-/commit/a88b1ac548516ab25140a2e9dea8cac894bbac93
resulting in the following build failure with rygel because libgee
installs Gee-0.8.gir in
output/host/aarch64-buildroot-linux-gnu/sysroot/share/gir-1.0/Gee-0.8.gir
instead of
output/host/aarch64-buildroot-linux-gnu/sysroot/usr/share/gir-1.0/Gee-0.8.gir:

Could not find GIR file 'Gee-0.8.gir'; check XDG_DATA_DIRS or use --includedir
error parsing file RygelCore-2.6.gir: Failed to parse included gir Gee-0.8
If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the .mk file should help.
Typically like this: PKG_MAKE_ENV += GIR_EXTRA_LIBS_PATH="$(@D)/.libs"

So replace exec_prefix by prefix

Fixes:
 - http://autobuild.buildroot.org/results/b04b27bbb84fa6ab9a8441e7bd94aad45226dce9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gobject-introspection/gobject-introspection.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index fbc545b3c7..f56d0c5eff 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -127,11 +127,11 @@ define GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
 	# By default, girdir and typelibdir use datadir and libdir as their prefix,
 	# of which pkg-config appends the sysroot directory. This results in files
 	# being installed in $(STAGING_DIR)/$(STAGING_DIR)/path/to/files.
-	# Changing the prefix to exec_prefix prevents this error.
-	$(SED) "s%girdir=.*%girdir=\$${exec_prefix}/share/gir-1.0%g" \
+	# Changing the prefix to prefix prevents this error.
+	$(SED) "s%girdir=.*%girdir=\$${prefix}/share/gir-1.0%g" \
 		$(STAGING_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc
 
-	$(SED) "s%typelibdir=.*%typelibdir=\$${exec_prefix}/lib/girepository-1.0%g" \
+	$(SED) "s%typelibdir=.*%typelibdir=\$${prefix}/lib/girepository-1.0%g" \
 		$(STAGING_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc
 endef
 GOBJECT_INTROSPECTION_POST_INSTALL_STAGING_HOOKS += GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
