Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFED2C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 17:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C31160F3C;
	Tue, 21 Feb 2023 17:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C31160F3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pZwizkUh_tty; Tue, 21 Feb 2023 17:24:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B457D612E4;
	Tue, 21 Feb 2023 17:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B457D612E4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 435F71BF956
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 17:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0FC24012E
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 17:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0FC24012E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bncVpdmpCTzr for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 17:22:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32C864015F
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32C864015F
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 17:22:20 +0000 (UTC)
Received: from vfazio2.xes-mad.com (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id 8663720C25;
 Tue, 21 Feb 2023 11:22:18 -0600 (CST)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 11:21:56 -0600
Message-Id: <20230221172205.2450111-6-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221172205.2450111-1-vfazio@xes-inc.com>
References: <20230221172205.2450111-1-vfazio@xes-inc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1677000138; bh=BV0PXdKDRuM3RINRkBeaaOPqADszgvSAbGmaxBaMbZQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ds3S1kDVb5oIuigwxGj1rjJwsJe5kd025xA6Rmv1DxGvT2W52LXBBz6D4daXTb1lo
 +cJ4BYDQukeJCF1NvNBVNFhentVY5V6dJXavmIKThPrSMQTkPn9opZSB3ww3bFqspO
 rLgez+goKwHk6bbdizUm5OhXGEUQuHul6iMQ0KBc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=ds3S1kDV
Subject: [Buildroot] [PATCH 06/15] package/dc3dd: migrate to new autopoint
 flag
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>, Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Vincent Fazio <vfazio@gmail.com>

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 package/dc3dd/dc3dd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dc3dd/dc3dd.mk b/package/dc3dd/dc3dd.mk
index cc89bb63d0..4d94194af6 100644
--- a/package/dc3dd/dc3dd.mk
+++ b/package/dc3dd/dc3dd.mk
@@ -13,6 +13,6 @@ DC3DD_LICENSE_FILES = COPYING
 # We are patching Makefile.am, so we need to autoreconf. We also need to
 # enable gettextize as dc3dd comes with an old gettext infra.
 DC3DD_AUTORECONF = YES
-DC3DD_GETTEXTIZE = YES
+DC3DD_AUTOPOINT = YES
 
 $(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
