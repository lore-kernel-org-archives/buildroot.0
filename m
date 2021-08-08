Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F99C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:12:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 406BF60EBB
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 406BF60EBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0405983376;
	Sun,  8 Aug 2021 09:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nppbfdKDHGHW; Sun,  8 Aug 2021 09:12:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67422831A5;
	Sun,  8 Aug 2021 09:12:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A6AD1BF408
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0367E831A5
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:12:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QBmAghwJriLi for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 09:12:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F3288318C
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 09:12:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id BB3FB8CA01; Sun,  8 Aug 2021 09:12:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 10:49:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3418a068befff3cf15c0a49ba1539a162f6bce53
X-Git-Newrev: 95ad161fe933b01986b426c47f019d58900d62a2
X-Patchwork-Hint: ignore
Message-Id: <20210808091232.BB3FB8CA01@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/kmsxx: remove
 erroneous use of static-libc option
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

commit: https://git.buildroot.net/buildroot/commit/?id=95ad161fe933b01986b426c47f019d58900d62a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently, for a static-only build, we pass -Dstatic-libc=true. The
reason for that was not recorded when the package was converted to
meson.

The -Dstatic-libc=true option, despite its name, is not about linking
statically against libc, but against libgcc and libstdc++.

In Buildroot, we forcibly pass -static when calling the compiler and
linker, so everything is already linked statically.

For a shared build, -Dstatic-libc=false has no effect at all.

Drop this option altogether, as it is not needed, and is confusing.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
[yann.morin.1998@free.fr: expand commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kmsxx/kmsxx.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
index fd40ff8e73..871ecaf85c 100644
--- a/package/kmsxx/kmsxx.mk
+++ b/package/kmsxx/kmsxx.mk
@@ -17,12 +17,6 @@ KMSXX_CONF_OPTS = \
 	-Duse-system-fmt=true \
 	-Duse-system-pybind11=true
 
-ifeq ($(BR2_STATIC_LIBS),y)
-KMSXX_CONF_OPTS += -Dstatic-libc=true
-else
-KMSXX_CONF_OPTS += -Dstatic-libc=false
-endif
-
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 KMSXX_CXXFLAGS += $(TARGET_CXXFLAGS) -O0
 endif
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
