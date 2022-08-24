Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF636C04AA5
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 20:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E92440AD9;
	Wed, 24 Aug 2022 20:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E92440AD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s1MV8cyt8D6E; Wed, 24 Aug 2022 20:04:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D664404C2;
	Wed, 24 Aug 2022 20:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D664404C2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 97BAF1BF831
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 20:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 726F760BE2
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 20:04:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 726F760BE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J5WKfK0gEJMp for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 20:04:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EF8960B4E
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 20:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EF8960B4E
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 123BE87D46; Wed, 24 Aug 2022 19:49:53 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 22:02:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8915beede6fa0d1f4f78b2729800b45d582ab53c
X-Git-Newrev: 2ebf652589491ac2f8f3825afa5f75156c88b0a0
X-Patchwork-Hint: ignore
Message-Id: <20220824194953.123BE87D46@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uboot-tools: fix dumpimage for FIT
 image
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ebf652589491ac2f8f3825afa5f75156c88b0a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The upstream commit 7a01882eb37e7504e2450f474d0cc8db60ed26c2
("common: Kconfig.boot: Add FIT_PRINT config option") introduce
CONFIG_FIT_PRINT and make fit_print_contents() empty if it was
not enabled.

Adding CONFIG_FIT_PRINT=y to UBOOT_TOOLS_MAKE_OPTS does not help
while CONFIG_FIT_PRINT=y affects Makefiles only, not C sources.

Add "#define CONFIG_FIT_PRINT 1" to autoconf.h if FIT_SUPPORT enabled.

It would be better to convert uboot-tools to kconfig infrastructure so
we can use KCONFIG_ENABLE_OPT etc. However, that's a much bigger change
and not suitable for backporting to stable branches. Therefore, for now,
take the simple approach of updating autoconf.h.

Signed-off-by: Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/uboot-tools/uboot-tools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 7cd527ad12..d884a010fb 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -22,6 +22,7 @@ define UBOOT_TOOLS_CONFIGURE_CMDS
 	touch $(@D)/include/config/auto.conf
 	mkdir -p $(@D)/include/generated
 	touch $(@D)/include/generated/autoconf.h
+	echo $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),'#define CONFIG_FIT_PRINT 1') >> $(@D)/include/generated/autoconf.h
 	mkdir -p $(@D)/include/asm
 	touch $(@D)/include/asm/linkage.h
 endef
@@ -111,6 +112,7 @@ define HOST_UBOOT_TOOLS_CONFIGURE_CMDS
 	touch $(@D)/include/config/auto.conf
 	mkdir -p $(@D)/include/generated
 	touch $(@D)/include/generated/autoconf.h
+	echo $(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),'#define CONFIG_FIT_PRINT 1') >> $(@D)/include/generated/autoconf.h
 	mkdir -p $(@D)/include/asm
 	touch $(@D)/include/asm/linkage.h
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
