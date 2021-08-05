Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6BAC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:57:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79AAF610FB
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79AAF610FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47A55403AB;
	Thu,  5 Aug 2021 19:57:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1LHUDubczlHC; Thu,  5 Aug 2021 19:57:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 133D240680;
	Thu,  5 Aug 2021 19:57:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 096B91BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1472340540
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gd8njmhKEojn for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:49:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B0FC40527
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:49:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CBFA3842EA; Thu,  5 Aug 2021 19:49:40 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 21:30:23 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4b22106fb5e199aa26f148b0b159aecb7da7f7e0
X-Git-Newrev: a8a9b12766a434e7d70cd246689d4de11d440875
X-Patchwork-Hint: ignore
Message-Id: <20210805194940.CBFA3842EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pixman: fix build
 failure due to gcc bug 101737
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8a9b12766a434e7d70cd246689d4de11d440875
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The pixman package exhibits gcc bug 101737 when built for the SH4
architecture with optimization enabled, which causes a build failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_101737=y.
Also let's add PIXMAN_CFLAGS and pass the Codesourcery work around CFLAGS
to it for consistency like we do for the rest of the packages.

Fixes:
http://autobuild.buildroot.net/results/b20/b20869bbb48edb1f0a847ea9e2e1a0462d6350be/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pixman/pixman.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index d99005ecb7..6fab539593 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -44,12 +44,20 @@ ifneq ($(BR2_iwmmxt),y)
 PIXMAN_CONF_OPTS += --disable-arm-iwmmxt
 endif
 
+PIXMAN_CFLAGS = $(TARGET_CFLAGS)
+
 # toolchain gets confused about TLS access through GOT (PIC), so disable TLS
 # movhi	r4, %got_hiadj(%tls_ldo(fast_path_cache))
 # {standard input}:172: Error: bad expression
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII),y)
-PIXMAN_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DPIXMAN_NO_TLS"
+PIXMAN_CFLAGS += -DPIXMAN_NO_TLS
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101737),y)
+PIXMAN_CFLAGS += -O0
 endif
 
+PIXMAN_CONF_OPTS += CFLAGS="$(PIXMAN_CFLAGS)"
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
