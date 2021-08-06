Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05910C4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 12:51:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 599C160240
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 12:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 599C160240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F3F040370;
	Fri,  6 Aug 2021 12:51:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4DbLrGI-LyFY; Fri,  6 Aug 2021 12:50:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49C3240333;
	Fri,  6 Aug 2021 12:50:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4FA451BF37F
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 12:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B72140597
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 12:50:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ideasonboard.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wrirmdFE683D for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 12:50:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6B6C40578
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 12:50:55 +0000 (UTC)
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi
 [91.158.153.130])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7591A4FB;
 Fri,  6 Aug 2021 14:50:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628254253;
 bh=VhYsg6v9q+ieN1buVo7E8pWeGELV7V2a0mBnPge8apw=;
 h=From:To:Cc:Subject:Date:From;
 b=nb8vpXRx1wFFqRLDYw6MUjOAKfujCpJXpWS4NrX/nFo5mf9Mwke2TxfBz5+X4Lh1N
 4okZToslNKtos8QcPwmM3dpdvZeDCtoW+HitKimdu/sPYb4QYJalQcCehRCbZLJ3Ed
 pNtX08IqzwCN/lUIKTU08OR/uojKPXD4o0iDQEJA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: buildroot@buildroot.org
Date: Fri,  6 Aug 2021 15:50:46 +0300
Message-Id: <20210806125047.1832422-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/kmsxx: remove erroneous use of
 static-libc option
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Peter Seiderer <ps.report@gmx.net>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

For some reason the build file sets -Dstatic-libc=true option when
BR2_STATIC_LIBS is set. This is not correct, or at least I cannot figure
out the reason for this, so remove it.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---

Re-sending, as first attempt was rejected as I was not subscribed to the
list.

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
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
