Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46343C83F09
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBD9083CD0;
	Fri,  4 Jul 2025 06:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NzW9XdS1jqEC; Fri,  4 Jul 2025 06:21:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1489D83CC9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1489D83CC9;
	Fri,  4 Jul 2025 06:21:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 87C0B7AD
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6981160B95
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OiRs9XW2nsmW for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:21:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DCDE60AE2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DCDE60AE2
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:21:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C11B85D08; Fri,  4 Jul 2025 06:21:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Jul 2025 09:37:03 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 78e4c8ebf447323bf6245abaa3922b279c916d1b
X-Git-Newrev: f6f69ba11b008a3423df670225a0512d36ad97bb
X-Patchwork-Hint: ignore
Message-Id: <20250704062126.2C11B85D08@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/linux-tools:
 rtla: Pass TARGET_LD to the make arguments
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f6f69ba11b008a3423df670225a0512d36ad97bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
(cherry picked from commit f28f34e200bbadf0aea32110c72f7199e65fb0b9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
