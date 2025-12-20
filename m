Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352C0E6748B
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 22:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFF59408DF;
	Sat, 20 Dec 2025 22:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1GBGNblrWUgU; Sat, 20 Dec 2025 22:36:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D5DF408B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766270184;
	bh=1t1iuUTeVMR0ZEvWISRKMGs0svaUwzI3oPkY7cGOJEw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=G5xir8G1eMcovf4w+uWN4yvZohA2zBv0QE3AVW2zxbWo0X7O64aJ5A6HG+h58FPDM
	 QNaRJPBg8qKR2UCC3JhZ/I8vsKjTZMZnop46nSvciCBRfqbJjBeQB5vjsyAwX4yz79
	 Vln9Bk7qd126j47wEB8ZBcIZXpcn4FoZ1/LyJRAWeCQIGyYRfKd8fgwa18t9+2hhCc
	 /JWtGV5ugc2meH98UEnyFENDWYZlaxIknAr/IL+VWTt6/8P0MtWSdUdQZKlnU00LoF
	 bUy9bbAUogNJPlKlKqIfTNd3lfkxeTGEDsyYHYEek3HDXys5wpykQ+1WWe4aM9TKz5
	 sSScEJnElS1Ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D5DF408B6;
	Sat, 20 Dec 2025 22:36:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 482ED23D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 22:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33483406E6
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 22:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 94ntAkk291eO for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 22:36:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 359CE40572
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 359CE40572
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 22:36:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2256B86E17; Sat, 20 Dec 2025 22:36:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:40:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2440dccc67d09a0c41fce75bc25a9156fd667381
X-Git-Newrev: 39b925a0a6d80b2f347abad1fd75742c8d51a458
X-Patchwork-Hint: ignore
Message-Id: <20251220223622.2256B86E17@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uboot-tools: include FIT print
 support if FIT support is enabled
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

commit: https://git.buildroot.net/buildroot/commit/?id=39b925a0a6d80b2f347abad1fd75742c8d51a458
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise "dumpimage -l" produces only a newline when processing a FIT
image.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/uboot-tools/uboot-tools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 37ccd7b953..1135fb9c03 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -32,6 +32,7 @@ define UBOOT_TOOLS_CONFIGURE_CMDS
 	touch $(@D)/include/config/auto.conf
 	mkdir -p $(@D)/include/generated
 	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
+	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),echo '#define CONFIG_TOOLS_FIT_PRINT 1' >> $(@D)/include/generated/autoconf.h)
 	echo $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),'#define CONFIG_FIT_SIGNATURE 1') >> $(@D)/include/generated/autoconf.h
 	mkdir -p $(@D)/include/asm
 	touch $(@D)/include/asm/linkage.h
@@ -124,6 +125,7 @@ define HOST_UBOOT_TOOLS_CONFIGURE_CMDS
 	touch $(@D)/include/config/auto.conf
 	mkdir -p $(@D)/include/generated
 	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
+	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),echo '#define CONFIG_TOOLS_FIT_PRINT 1' >> $(@D)/include/generated/autoconf.h)
 	echo $(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),'#define CONFIG_FIT_SIGNATURE 1') >> $(@D)/include/generated/autoconf.h
 	mkdir -p $(@D)/include/asm
 	touch $(@D)/include/asm/linkage.h
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
