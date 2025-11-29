Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0B0D116F3
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 10:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70E6F40E83;
	Sat, 29 Nov 2025 10:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hA2h-ooP4BWe; Sat, 29 Nov 2025 10:35:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33AAA40E48
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33AAA40E48;
	Sat, 29 Nov 2025 10:35:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CABBD273
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 10:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1C3440E48
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 10:35:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iXFwCIS2j9YQ for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 10:35:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14B2B40DF8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14B2B40DF8
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 10:35:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F15FA86021; Sat, 29 Nov 2025 10:35:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Nov 2025 11:33:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cffb057b900ab8f3a9dab92f3284ad9f74eddd4f
X-Git-Newrev: baaad289ab94e5317df900cc4a369650735e9f06
X-Patchwork-Hint: ignore
Message-Id: <20251129103516.F15FA86021@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pdmenu: fix build with gcc-15.x
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=baaad289ab94e5317df900cc4a369650735e9f06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.net/results/554/5545162ca0206cacfca1617280f074237e72aec1/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pdmenu/pdmenu.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pdmenu/pdmenu.mk b/package/pdmenu/pdmenu.mk
index 2691a67ef6..72eb95bddc 100644
--- a/package/pdmenu/pdmenu.mk
+++ b/package/pdmenu/pdmenu.mk
@@ -11,4 +11,11 @@ PDMENU_LICENSE_FILES = doc/COPYING
 PDMENU_DEPENDENCIES = slang $(TARGET_NLS_DEPENDENCIES)
 PDMENU_INSTALL_TARGET_OPTS = INSTALL_PREFIX=$(TARGET_DIR) install
 
+# gcc-15 defaults to -std=gnu23 which introduces build failures.
+# We force "-std=gnu17" for gcc version supporting it. Earlier gcc
+# versions will work, since they are using the older standard.
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
+PDMENU_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu17"
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
