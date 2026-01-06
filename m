Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82704CEFD01
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 20:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54E534093D;
	Tue,  6 Jan 2026 20:04:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Df8YwbDRs6HR; Tue,  6 Jan 2026 20:04:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFBA440925
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767729894;
	bh=I/t43avWZ33ewYRVi3fl7N2zdVwF67euW9FV2fuBS+s=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A849UGmRqkIO7Jp7y3DcuR+MdaOqCYzQ2wwGD5YNYL3Nu8AVWNRf8SpDRAcwsqAGR
	 h5LX1qWApdoVpUWFftDt9gOM250vJuNbBpVUQMgLWAEBTJ3gpYUzm7MBaGZ6Oy41kI
	 9ausBmLcPy3MaVfgoY6BoLzeZdVWSWcvVqCcn8pqfSpOJD62zRloe3K2vNkCDq6sZE
	 58l4x0SXuZSXN1mZj0wh7TEntyM/WyxJfDtPA06phUFBVXvCdW9Kc2CNmtfUz0Bcd6
	 HmRFCTKko/MBSYGvmOiZwhvtsztL2vbLET+AFduil9oxT15OPfVid0+QeZKuIJX0ns
	 mYf7azbFvGvFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFBA440925;
	Tue,  6 Jan 2026 20:04:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 86DF170B
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D43E40925
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:04:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HzF7TF30zodj for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 20:04:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 66E8140921
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66E8140921
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66E8140921
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:04:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9F9B3A4C399B;
 Tue,  6 Jan 2026 21:01:25 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48554)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vdDF1-000000002Vv-168k;
 Tue, 06 Jan 2026 20:01:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue,  6 Jan 2026 21:01:13 +0100
Message-ID: <20260106200115.1985522-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106200115.1985522-1-bernd@kuhls.net>
References: <20260106200115.1985522-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767729685;
 bh=0a+i+aKqWr33ibUP6L+Xq7BEiv3s0ZjhpZnLxu9UYcM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=UDmlT5kWE93ZGCiOAV7pTEThmAK3k4Nzs7kP3kLFG4Dd8W6D6oHEDpTv+WmoEziEO
 PBlFiF6kg0gNdMLoOwmmRy64nfboj4ZFusVVAVZGfbVvoRXjz+HYKqCGnwOaTwXmbK
 UG9jXZ5MnGBMworXlcLtyK+2R8krlA+SxlhtP/dKskKC3pk22ZStPHpWbIjBiDWYk2
 AUmwQ0aQRScU8BKUhEG4IfWv9e80FkHhv8t7CIhrJmdTaR73XA6Lmh4aq/nXMSyZe5
 ZHmaq6Dd/Jh8nYo/ImDikFkxjMc13EGaS5pZGQHNGBWH7gZJJEUstFpMMFEo1ZAbAi
 cXDAiMwNu9YPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=UDmlT5kW
Subject: [Buildroot] [PATCH v2 8/9] package/libgphoto2: remove optional
 dependency to lockdev
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The lockdev package is unmaintainted and will be removed from buildroot.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libgphoto2/libgphoto2.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
index 851eb401a1..95c0190ee6 100644
--- a/package/libgphoto2/libgphoto2.mk
+++ b/package/libgphoto2/libgphoto2.mk
@@ -53,8 +53,4 @@ else
 LIBGPHOTO2_CONF_OPTS += --with-gdlib=no
 endif
 
-ifeq ($(BR2_PACKAGE_LOCKDEV),y)
-LIBGPHOTO2_DEPENDENCIES += lockdev
-endif
-
 $(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
