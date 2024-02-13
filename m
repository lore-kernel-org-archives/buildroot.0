Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13025C4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 11:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B64FB400B8;
	Tue, 13 Feb 2024 11:49:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hWsSytrC2lKG; Tue, 13 Feb 2024 11:49:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97B5A40C53
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97B5A40C53;
	Tue, 13 Feb 2024 11:49:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 66C841BF421
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 11:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 546316067D
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 11:49:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fv8_8tcQZyz3 for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 11:49:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 360536060A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 360536060A
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 360536060A
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 11:49:36 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id C3A882C80CDA;
 Tue, 13 Feb 2024 12:49:33 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 12:49:31 +0100
Message-Id: <20240213114933.2444440-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707824973; bh=WPKQXExRwkS91hIryCXOpJ7DpJ10BvxQFVFvBGwCX44=;
 h=From:To:Cc:Subject:Date;
 b=Hc3zrkEB1o0Ck66XeyojUYTaklF1e7TgyW9GRmu2Rs+fASkWTQ8W2gsq7qIPmFdBF
 ErCqTSqvXpBE5QP4ZsK3KpR4JLhnI2kFf4N56bXG2KpzNyZ9p+wxe08KhSqXQuT+x9
 6TTOkMXmST2OyUyfnyq3rsLsOxRSIL5rm++vUrQtPM72DXkMYb3VPS4CsTvDBiyeru
 kNSGrzYIs1ekwItpek/50Tb2m5Ntzah3fHfl90NkJHE6av8BsMN7kqzlL1VSx2P7YT
 1bUUESPJD/uHM2mKljdFEYEAiZhrAGrSurW60ULngyH0EUEPmOorKD50QX5VDSagc2
 /emaLVD/CXzeA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=Hc3zrkEB
Subject: [Buildroot] [PATCH 1/2] package/tio: install bash-completions
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See meson_options.txt file [1].

[1] https://github.com/tio/tio/blob/master/meson_options.txt

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/tio/tio.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/tio/tio.mk b/package/tio/tio.mk
index d7b554ee84..a7d3537850 100644
--- a/package/tio/tio.mk
+++ b/package/tio/tio.mk
@@ -10,5 +10,10 @@ TIO_SITE = https://github.com/tio/tio/releases/download/v$(TIO_VERSION)
 TIO_LICENSE = GPL-2.0+
 TIO_LICENSE_FILES = LICENSE
 TIO_DEPENDENCIES = inih
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+TIO_CONF_OPTS +=-Dbashcompletiondir=/usr/share/bash-completion/completions/
+else
+TIO_CONF_OPTS +=-Dbashcompletiondir=no
+endif
 
 $(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
