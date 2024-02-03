Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BDFC4828D
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47C65405F1;
	Sat,  3 Feb 2024 18:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47C65405F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PovCybNWedxz; Sat,  3 Feb 2024 18:46:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E11AD40945;
	Sat,  3 Feb 2024 18:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E11AD40945
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B46CE1BF29D
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 12:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1A3D41EF4
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 12:28:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CckQh-u2P57E for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 12:28:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2C1B541906
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C1B541906
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C1B541906
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 12:28:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19E938680B; Sat,  3 Feb 2024 12:28:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 3 Feb 2024 13:01:28 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 1d134974a3ad666364a277bce8ece60a7745aa13
X-Git-Newrev: 404e6cc2eb6442d75c4fba79212adf9465cbac37
X-Patchwork-Hint: ignore
Message-Id: <20240203122852.19E938680B@busybox.osuosl.org>
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 spf=fail smtp.mailfrom=osuosl.org
Subject: [Buildroot] [git commit branch/2023.11.x] package/flutter-gallery:
 clean up install_target_cmds
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

commit: https://git.buildroot.net/buildroot/commit/?id=404e6cc2eb6442d75c4fba79212adf9465cbac37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Remove and create the kernel_blob.bin file in the flutter_assets directory:

  When Flutter compiles the source code, it creates the kernel_blob.bin file,
  a Dart Kernel Bytecode of the application.

  If kernel_blob.bin exists inside the flutter_assets directory, then the
  application source code can be extracted with nothing more than apktool.
  Not only is this a security risk, it's also redundant and a waste of space.

  Removing the kernel_blob.bin file generated for flutter-gallery saves 86M!
  Because this package is a reference package, and some applications may check
  if the kernel_blob.bin file exists, we also touch a blank kernel_blob.bin
  file.

Do not use relative symlinks:
  Users may install their applications in any arbitaryt location, not
  necessarily in the /usr/share/flutter/${package_name} directory. Because
  flutter-gallery is a reference application, using exact symlinks to
  icudtl.dat and libflutter_engine.so is preferable.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0805b8048fc75c8b471acb492aa55ef0690fdabd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flutter-gallery/flutter-gallery.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/flutter-gallery/flutter-gallery.mk b/package/flutter-gallery/flutter-gallery.mk
index 8f7e325e5a..acad706dae 100644
--- a/package/flutter-gallery/flutter-gallery.mk
+++ b/package/flutter-gallery/flutter-gallery.mk
@@ -46,10 +46,12 @@ define FLUTTER_GALLERY_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/libapp.so \
 		$(FLUTTER_GALLERY_INSTALL_DIR)/lib/libapp.so
 
-	ln -sf ../../../$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
+	ln -sf /usr/share/flutter/$(FLUTTER_ENGINE_RUNTIME_MODE)/data/icudtl.dat \
 	$(FLUTTER_GALLERY_INSTALL_DIR)/data/
 
-	ln -sf ../../../../../lib/libflutter_engine.so $(FLUTTER_GALLERY_INSTALL_DIR)/lib/
+	ln -sf /usr/lib/libflutter_engine.so $(FLUTTER_GALLERY_INSTALL_DIR)/lib/
+	$(RM) $(FLUTTER_GALLERY_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
+	touch $(FLUTTER_GALLERY_INSTALL_DIR)/data/flutter_assets/kernel_blob.bin
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
