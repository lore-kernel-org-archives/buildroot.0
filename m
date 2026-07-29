Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE02C54F51
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 21:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34C2880F33;
	Wed, 29 Jul 2026 21:16:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hkKW3O58-dHF; Wed, 29 Jul 2026 21:16:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BA3180F34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785359792;
	bh=u+YkfDnJKvQt9ki22JB1w/a0kirJGXnK9wUOpmKN/8Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=djup5uuO6BDWoN+CM7szXqYJ6bkiZK8mCnCjAExV1o05NxuI7zEzgH/jQF3GQtNl0
	 AztH2tyShADhKdcrlKgP25HMUMtseo/jRyvTEZc3jHbWMR+3gmQ5X3PHEnCMsldsAi
	 pXYlMTZNnSHOv+wiD+hQF0ZLifobfAlG72YCf7aklMhy1rO+GbDpTP3oLr7c3u9ZVE
	 r624Zd42iP6ofpzietrHpDwQ2Hb2Mb8E0KsYbE5zrL1iTUg8BYcaawhjYA1q4I0eSa
	 pxQ2Z+X7PXkLQn9XqwMz2ZphyI3GndMCPosV70Ind+EMWLMQbb64Km6/I49M04jb6u
	 oGAh0KBM8Dlug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BA3180F34;
	Wed, 29 Jul 2026 21:16:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A1BD0197
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 21:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8843540659
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 21:16:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2snjYZiwdcT for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 21:16:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B52DC405A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B52DC405A9
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 21:16:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6057E8B575; Wed, 29 Jul 2026 21:15:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 29 Jul 2026 23:14:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 051eff247fea25b946fbfcb46545a0f76f123927
X-Git-Newrev: 9f17ac02b8561ca7adeb7911e4939b2ac9ad6320
X-Patchwork-Hint: ignore
Message-Id: <20260729211547.6057E8B575@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uboot-tools: fix host build
 without FIT support
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9f17ac02b8561ca7adeb7911e4939b2ac9ad6320
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit [1] "package/uboot-tools: fix host FIT signature support"
slightly changed the logic in which the file
$(@D)/include/generated/autoconf.h is created.

When there is no Kconfig sub-option selected, the file is no longer
created and the build fails with error:

    include/linux/kconfig.h:4:10: fatal error: generated/autoconf.h: No such file or directory

The issue can be reproduced with the with the simple commands:

    cat >.config <<EOF
    BR2_aarch64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_PACKAGE_HOST_UBOOT_TOOLS=y
    EOF
    make olddefconfig
    make host-uboot-tools

This commit fixes the issue by simply adding a touch of the file
at the beginning to make sure it will always exist.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/928cc5dc5cb82e6f2cb43f853488309eb806ef89

Cc: James Hilliard <james.hilliard1@gmail.com>
Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
Tested-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/uboot-tools/uboot-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index ef8bcabbd9..8a2877333c 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -124,6 +124,7 @@ define HOST_UBOOT_TOOLS_CONFIGURE_CMDS
 	echo "#include <linux/kconfig.h>" > $(@D)/include/config.h
 	touch $(@D)/include/config/auto.conf
 	mkdir -p $(@D)/include/generated
+	touch $(@D)/include/generated/autoconf.h
 	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
 	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),echo '#define CONFIG_TOOLS_FIT_PRINT 1' >> $(@D)/include/generated/autoconf.h)
 	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_IMAGE_PRE_LOAD 1' >> $(@D)/include/generated/autoconf.h)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
