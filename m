Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE21C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:47:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECA2460725
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECA2460725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD401401FD;
	Tue,  3 Aug 2021 21:47:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tuEJuUHIAG0Y; Tue,  3 Aug 2021 21:47:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C27CA400C8;
	Tue,  3 Aug 2021 21:47:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 462811BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99A9740555
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GvDhEnmc-WqU for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01E48404D4
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4C6298674F; Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Jun 2021 21:58:05 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 72fdd27b87942ac7f99730afe02b58638d105677
X-Git-Newrev: f098aff4792a0e792bda4d7d1ec22a5af1381d83
X-Patchwork-Hint: ignore
Message-Id: <20210803210951.4C6298674F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bitcoin: unset the
 NDEBUG flag
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

commit: https://git.buildroot.net/buildroot/commit/?id=f098aff4792a0e792bda4d7d1ec22a5af1381d83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since https://git.buildroot.net/buildroot/commit/?id=5a8c50fe05afacc3cbe8e7347e238da9f242fab0
all packages are now built with NDEBUG, which broke Bitcoin builds.

Bitcoin is using assert(...) extensively with the assumption of it
never being a noop at runtime. So we cannot build with NDEBUG.
See: https://github.com/bitcoin/bitcoin/blob/0.21/src/compat/assumptions.h

Fixes:
    http://autobuild.buildroot.org/results/83b/83b6dc0b97b19888fb1187bbbca485961e58ce90/
    and so many more...

Signed-off-by: Dick Olsson <hi@senzilla.io>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bitcoin/bitcoin.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index 142521835c..f485e4ee5c 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -13,6 +13,12 @@ BITCOIN_CPE_ID_VENDOR = bitcoin
 BITCOIN_CPE_ID_PRODUCT = bitcoin_core
 BITCOIN_DEPENDENCIES = host-pkgconf boost libevent
 BITCOIN_MAKE_ENV = BITCOIN_GENBUILD_NO_GIT=1
+# Bitcoin is using assert(...) extensively with the assumption of it
+# never being a noop at runtime. So we cannot build with NDEBUG.
+BITCOIN_CONF_ENV = \
+	CPPFLAGS="$(TARGET_CPPFLAGS) -UNDEBUG" \
+	CFLAGS="$(TARGET_CFLAGS) -UNDEBUG" \
+	CXXFLAGS="$(TARGET_CXXFLAGS) -UNDEBUG"
 BITCOIN_CONF_OPTS = \
 	--disable-bench \
 	--disable-wallet \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
