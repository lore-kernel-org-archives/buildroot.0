Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEB2ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 15:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE57041DBC;
	Sat, 17 Sep 2022 15:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE57041DBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5SXTTz2L2_7E; Sat, 17 Sep 2022 15:40:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADDF641DAC;
	Sat, 17 Sep 2022 15:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADDF641DAC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B2EA41BF388
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EBD56115F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EBD56115F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8NpzQ3OELMGA for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 15:40:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C426861113
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 15:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C426861113
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B3C68844E9; Sat, 17 Sep 2022 15:40:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 17:22:55 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 9b1efacba95c4700f202cf6baf76aee73e432abd
X-Git-Newrev: a3ba496a7ffdc0b85de4665771466de8c5fd903c
X-Patchwork-Hint: ignore
Message-Id: <20220917154022.B3C68844E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/uboot-tools: fix
 dumpimage for FIT image
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

commit: https://git.buildroot.net/buildroot/commit/?id=a3ba496a7ffdc0b85de4665771466de8c5fd903c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit 2ebf652589491ac2f8f3825afa5f75156c88b0a0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uboot-tools/uboot-tools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 26450b7adf..e48a4f6c8b 100644
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
