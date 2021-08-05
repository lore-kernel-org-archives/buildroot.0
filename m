Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B22C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:31:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8334961050
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8334961050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21EEC40287;
	Thu,  5 Aug 2021 19:31:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rn362e07rks1; Thu,  5 Aug 2021 19:31:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25C6E4034D;
	Thu,  5 Aug 2021 19:31:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 29AA81C113E
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26E39837AC
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:31:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id baAO0QdyXr-l for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:31:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76B218377F
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:31:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3BB968B8D2; Thu,  5 Aug 2021 19:31:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 21:30:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b22106fb5e199aa26f148b0b159aecb7da7f7e0
X-Git-Newrev: a8a9b12766a434e7d70cd246689d4de11d440875
X-Patchwork-Hint: ignore
Message-Id: <20210805193100.3BB968B8D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pixman: fix build failure due to
 gcc bug 101737
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
