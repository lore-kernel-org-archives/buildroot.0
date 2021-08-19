Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACEB4C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:15:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6709C60FDC
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6709C60FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4100580C55;
	Thu, 26 Aug 2021 22:15:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b5sXsNxat9I6; Thu, 26 Aug 2021 22:15:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D874880C87;
	Thu, 26 Aug 2021 22:15:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1AEE11BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4EFB61487
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ELm7JNp76-ab for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00859614B0
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 55CBF8DC50; Thu, 26 Aug 2021 22:01:32 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 22:58:06 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 25c092b15b2002400b7175fd4997038ac5c86e9f
X-Git-Newrev: 27b425ef4995e43c84b36c44d7d7d1c018b0fdef
X-Patchwork-Hint: ignore
Message-Id: <20210826220132.55CBF8DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/heirloom-mailx: fix
 build failure due to gcc bug 101916
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=27b425ef4995e43c84b36c44d7d7d1c018b0fdef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The heirloom-mailx package exhibits gcc bug 101916 when built for the
SH4 architecture with optimization enabled, which causes a build failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_101916=y.
Also introduce HEIRLOOM_MAILX_CFLAGS as done for other packages and move
the already present -fPIC CFLAG to it.

Fixes:
http://autobuild.buildroot.net/results/911/911f5c024834741754102ff1bbb05c4a64c54a0b/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/heirloom-mailx/heirloom-mailx.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
index b3cece0cfc..e851e1dfcc 100644
--- a/package/heirloom-mailx/heirloom-mailx.mk
+++ b/package/heirloom-mailx/heirloom-mailx.mk
@@ -20,10 +20,18 @@ define HEIRLOOM_MAILX_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) $(SHELL) ./makeconfig)
 endef
 
+HEIRLOOM_MAILX_CFLAGS = $(TARGET_CFLAGS)
+
 # -fPIC is needed to build with NIOS2 toolchains.
+HEIRLOOM_MAILX_CFLAGS += -fPIC
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101916),y)
+HEIRLOOM_MAILX_CFLAGS += -O0
+endif
+
 define HEIRLOOM_MAILX_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
-		CFLAGS="$(TARGET_CFLAGS) -fPIC" \
+		CFLAGS="$(HEIRLOOM_MAILX_CFLAGS)" \
 		-C $(@D)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
