Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C5E6C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 17:20:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9B5E60F9D
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 17:20:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9B5E60F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=metanate.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DF4580DB8;
	Tue, 26 Oct 2021 17:20:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IdbQ_k1i_JuO; Tue, 26 Oct 2021 17:20:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0CA680D64;
	Tue, 26 Oct 2021 17:20:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72E2F1BF873
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 17:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6268E60774
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 17:20:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=metanate.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LK_vYC3vx8Rk for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 17:20:20 +0000 (UTC)
X-Greylist: delayed 00:16:11 by SQLgrey-1.8.0
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E195608CE
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 17:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
 In-Reply-To:References; bh=EGnwvdMT+F4Bcw6sla7Phlak6L+GwkM6AQuFfLZRsLw=; b=z2
 BNz8/Bpicar0113azQCjweujhVBni84jMBDkPPe8Sd2egYn3G2GiXp7iC81sq/oREcOrVm71/gGti
 hxxKqBv59snu3+AWMXigOrs8mlu/PR0v4FiWBj9qwe5XBEN081Dsisqy9l2DIcErHTTki+1JAxsQm
 vRUlT0guKA60GTb+stnX+WPZHOtS3f36LaOaoClUBzABk27Mv6pnsfTnz7L9a17n8cXg85i9BNK6a
 ZX5F/jntKJzYjrVlVX82HIHRxitRzwcp0X9AJCcIky8sdI7LsDnD2J46OyzyGjzZchwimamZUy1lP
 +POQuVzoDpzldeFBEAr2K/vxzsjjKyEg==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1mfPrr-0002FO-2C; Tue, 26 Oct 2021 18:04:07 +0100
From: John Keeping <john@metanate.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 18:04:00 +0100
Message-Id: <20211026170400.265271-1-john@metanate.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Authenticated: YES
Subject: [Buildroot] [PATCH] package/isl: switch to new site
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: John Keeping <john@metanate.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

isl.gforge.inria.fr no longer responds and the main site is now at
sourceforge.io.  This change corresponds to the upstream commit that
updates the documentation [1].

[1] https://repo.or.cz/isl.git/commitdiff/002820d725479b456c97ca9b0d59d6b3e18f7ee4

Signed-off-by: John Keeping <john@metanate.com>
---
 package/isl/isl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/isl/isl.mk b/package/isl/isl.mk
index 3abd6640cb..df57c83f55 100644
--- a/package/isl/isl.mk
+++ b/package/isl/isl.mk
@@ -6,7 +6,7 @@
 
 ISL_VERSION = 0.23
 ISL_SOURCE = isl-$(ISL_VERSION).tar.xz
-ISL_SITE = http://isl.gforge.inria.fr
+ISL_SITE = https://libisl.sourceforge.io
 ISL_LICENSE = MIT
 ISL_LICENSE_FILES = LICENSE
 HOST_ISL_DEPENDENCIES = host-gmp
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
