Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424C1CDB46B
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 14:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7DCA85D66;
	Sat, 20 Jun 2026 14:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eBhI29xc8qzP; Sat, 20 Jun 2026 14:38:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E59C785D6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781966297;
	bh=4XG2ebhEbA/xL001vSQUFtMjg6wD3Xx5New+e2AoNLQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TYTCOLdc8JTUUutVx4ydS+pCSJ8a4beBcz3cwAiavhE4DBrV5XI7LlgdPGPcBrCLA
	 uylAmpaUL090xeuPlrCpchQ3zAU1Zvf1Oo6V9mWtkd+ZKvRyMIR9k8cS0PoRCfNOu5
	 8yMyebQicOir8+oz9RNs7DI0aIPg7cJ4yuA4AKMRJIaqOunv4PKkXtqqs3l8cTgjyN
	 j7ucsJsFJy4ZVT1HOEpHYTq6TWSBJbx04yjvrc6UAJWz6+O/BI5rLN8ZcVZcx8ARcr
	 sTMAv9/eQJ1M7TKTs/CKUKrdmAHJFIuUhsRZYQ5Lbx6IQ2PKaO+42PZ6RRHnStOMUp
	 djW0SjMOsqLbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E59C785D6B;
	Sat, 20 Jun 2026 14:38:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B06DC2D7
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 14:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 962D74025F
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 14:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id euGux4POFaMI for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 14:38:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 845024025E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 845024025E
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 14:38:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 623A582812; Sat, 20 Jun 2026 14:37:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Jun 2026 16:37:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 003b062974ebf66be8ac1f346a933abd96c36c40
X-Git-Newrev: 7f72bec788a9206dbfc7079df4dcbdb49817d486
X-Patchwork-Hint: ignore
Message-Id: <20260620143751.623A582812@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/net-tools: fix build with linux 7.1
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7f72bec788a9206dbfc7079df4dcbdb49817d486
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes build error

rose.c:41:10: fatal error: linux/rose.h: No such file or directory
   41 | #include <linux/rose.h>

caused by the upstream removal of the ax25 and amateur radio (hamradio)
subsystem:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-7.1.y&id=dd8d4bc28ad7252610d8e79c1313a2d1e3499a51

which was added to buildroot with commit
9530d74ddb04d5fc81f9054ec0e76fbcb2a1e7d2.

For details see https://github.com/ecki/net-tools/issues/69

Fixes:
https://autobuild.buildroot.net/results/6c7/6c7783e3b6dad01b5dd725141ebed2b84242051e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/net-tools/net-tools.mk | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
index 344abee8b3..e208a78e71 100644
--- a/package/net-tools/net-tools.mk
+++ b/package/net-tools/net-tools.mk
@@ -32,7 +32,17 @@ define NET_TOOLS_ENABLE_IPV6
 	$(SED) 's:_AFINET6 0:_AFINET6 1:' $(@D)/config.h
 endef
 
-NET_TOOLS_POST_CONFIGURE_HOOKS += NET_TOOLS_ENABLE_I18N NET_TOOLS_ENABLE_IPV6
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1),y)
+define NET_TOOLS_DISABLE_ROSE
+	$(SED) 's:HAVE_AFROSE 1:HAVE_AFROSE 0:' \
+	-e 's:HAVE_HWROSE 1:HAVE_HWROSE 0:' $(@D)/config.h
+endef
+endif
+
+NET_TOOLS_POST_CONFIGURE_HOOKS += \
+	NET_TOOLS_DISABLE_ROSE \
+	NET_TOOLS_ENABLE_I18N \
+	NET_TOOLS_ENABLE_IPV6
 
 define NET_TOOLS_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
