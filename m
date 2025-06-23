Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BBFC7115B
	for <buildroot@archiver.kernel.org>; Mon, 23 Jun 2025 20:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73D338202D;
	Mon, 23 Jun 2025 20:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id al98u0CiZEFN; Mon, 23 Jun 2025 20:46:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E723282027
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E723282027;
	Mon, 23 Jun 2025 20:46:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 338D012C
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 20:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13FD782027
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 20:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JtDmAJ_016F6 for <buildroot@buildroot.org>;
 Mon, 23 Jun 2025 20:46:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 687D5812F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 687D5812F9
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 20:46:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 530B3842CA; Mon, 23 Jun 2025 20:46:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 23 Jun 2025 22:42:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4abd7bb9dfde07164a78581f3bc53b50d4fc8532
X-Git-Newrev: f28f34e200bbadf0aea32110c72f7199e65fb0b9
X-Patchwork-Hint: ignore
Message-Id: <20250623204608.530B3842CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools: rtla: Pass TARGET_LD
 to the make arguments
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

commit: https://git.buildroot.net/buildroot/commit/?id=f28f34e200bbadf0aea32110c72f7199e65fb0b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In Linux v6.8,  the rtla Makefile was rewritten :

  01474dc706ca ("tools/rtla: Use tools/build makefiles to build rtla")

The new Makefile uses default linker values, so the host linker being used to
produce the final rtla binary.

This results in the following error :

ld: [...] trace.o: error adding symbols: file in wrong format

Add LD=$(TARGET_LD) to the RTLA_MAKE_OPTS to fix rtla cross-compilation.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-tools/linux-tool-rtla.mk.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-tools/linux-tool-rtla.mk.in b/package/linux-tools/linux-tool-rtla.mk.in
index 449371ddfe..d9bdcc3016 100644
--- a/package/linux-tools/linux-tool-rtla.mk.in
+++ b/package/linux-tools/linux-tool-rtla.mk.in
@@ -9,6 +9,7 @@ LINUX_TOOLS += rtla
 RTLA_DEPENDENCIES = host-pkgconf libtracefs
 RTLA_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
 	CC=$(TARGET_CC) \
+	LD=$(TARGET_LD) \
 	EXTRA_CFLAGS="-D_GNU_SOURCE" \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
