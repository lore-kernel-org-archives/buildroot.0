Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE60C5AC80
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C84A2608E7;
	Fri,  7 Aug 2026 09:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xab2tnrikZAV; Fri,  7 Aug 2026 09:35:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5508608DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095335;
	bh=4XoQh4scLWYsBZM+LOK0/WbUBUaRoRvuskiWtB3QarQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZBCCG/kGwADHphwI7pS7Ve+nfCh7Xb3STPZFI/ZpczI6+/hdqUfAg2evoCvKFGdDD
	 2SNv1vMYjoibJAAcyoPpeqC9oEsYr2YvrSQWJH+J90lZ2jOvt1e7gqGMG5Zwki60+G
	 VNzmi5oVium9dl9iWG3ti+WRGEp8p566i5WYmCKeGBSh3qANazmoR9au07R+OayOfN
	 eeAk1ST4T9h6Fi4fJJCHiakXrnibeRTEnLo11nv0EQkIND3cEJR27J92/Hnvpls4Yk
	 tvnnxgomVHeb4xTI0LAjPmlTwohjBPK9dmtaErDqdvgbfKaBuTY18lUDi9fM5mR1WI
	 B6qvsBuT78CXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5508608DF;
	Fri,  7 Aug 2026 09:35:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 604F01390
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FA03409FB
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GqjG3RiwbILh for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9194B40A07
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9194B40A07
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 275468CA40; Fri,  7 Aug 2026 09:34:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:12:42 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 6b2a9d3d195829c6b9f76896ce1c1fd9738fe698
X-Git-Newrev: bee32c9979320ae33c0882880bdfcd1290daff04
X-Patchwork-Hint: ignore
Message-Id: <20260807093442.275468CA40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/uboot-tools: fix
 host build without FIT support
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bee32c9979320ae33c0882880bdfcd1290daff04
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
(cherry picked from commit 9f17ac02b8561ca7adeb7911e4939b2ac9ad6320)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
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
