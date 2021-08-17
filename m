Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8125C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 21:12:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2ADF61008
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 21:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A2ADF61008
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6965440019;
	Tue, 17 Aug 2021 21:12:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AimGw8y-H1Xl; Tue, 17 Aug 2021 21:12:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1D6240112;
	Tue, 17 Aug 2021 21:12:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E7C1C1BF9B5
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 21:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6BA540202
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 21:12:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dVI3LINzsBlj for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 21:12:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 439AD40019
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 21:12:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9CAA18D41D; Tue, 17 Aug 2021 21:11:21 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 23:11:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f76b2cd8d81d001aca35def6f7f938e77a2094ef
X-Git-Newrev: bdbb113cd28e9ab17fe067da50484648b84408b8
X-Patchwork-Hint: ignore
Message-Id: <20210817211121.9CAA18D41D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/protobuf: fix build failure due to
 missing -mcmodel=large
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

commit: https://git.buildroot.net/buildroot/commit/?id=bdbb113cd28e9ab17fe067da50484648b84408b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building protobuf for or1k -mcmodel=large is needed to link, so let's
add that gcc option in case we're building for or1k.

Upstream gcc doesn't have the -mcmodel=large option for or1k, but all
released Buildroot gcc versions have the patch to add it, so that's
fine.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/protobuf/protobuf.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 492917c5e8..75791fade2 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -24,6 +24,10 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 PROTOBUF_CXXFLAGS += -O0
 endif
 
+ifeq ($(BR2_or1k),y)
+PROTOBUF_CXXFLAGS += -mcmodel=large
+endif
+
 PROTOBUF_CONF_ENV = CXXFLAGS="$(PROTOBUF_CXXFLAGS)"
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
