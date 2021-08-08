Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A73C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:29:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A87FC60F56
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A87FC60F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FE3C40272;
	Sat,  4 Sep 2021 18:29:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Me-KJvQG6joV; Sat,  4 Sep 2021 18:29:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D12B40171;
	Sat,  4 Sep 2021 18:29:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBBD01BF5DD
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7160E81B01
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dv-hh17mHE_s for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A624B81A1C
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6BC418834D; Sat,  4 Sep 2021 18:23:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 10:49:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3418a068befff3cf15c0a49ba1539a162f6bce53
X-Git-Newrev: 95ad161fe933b01986b426c47f019d58900d62a2
X-Patchwork-Hint: ignore
Message-Id: <20210904182353.6BC418834D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kmsxx: remove erroneous use of
 static-libc option
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=95ad161fe933b01986b426c47f019d58900d62a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
