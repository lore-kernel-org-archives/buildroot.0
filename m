Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DDECD37AC
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 16:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D335C41955;
	Wed, 13 May 2026 16:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yMomxY9PTUXx; Wed, 13 May 2026 16:50:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9237B4198C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778691023;
	bh=KSAvl4rM/W5tzKDJIk2r6Rm0uW6k5texnEjkchJZhNs=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=k31br0JX6jvWUXWsrKzYJon3os92DYd7HnEbpLPyzXXmbB71KYNV44AuSvmHqMWM5
	 F3lWlTke/Dc6PqA1DdhP3s+E5hyRzRWHLyzuTf+RRXFnSItGIGkdHF9Xsr+op+Ce3n
	 fIMmzRKsXWJ6a3NWJWoawyxixfVWsqFpTrzJGp22RD6zjc66P5Ehz3peBLbUagu2fY
	 +ZfFKxev7jsXs+I5bJrvGD+oPdVMbyqct3s4kVq3jSpzKSqtczvupN/2CRBYfypAjk
	 Va5vJOw8eWK1+fmmagAkxdCPatBcjuJBdO+ZQUdPC7XgGDV0F6dsh7aMH/eaYVO6k5
	 DuxzeaS77WqQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9237B4198C;
	Wed, 13 May 2026 16:50:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6446C270
 for <buildroot@buildroot.org>; Wed, 13 May 2026 16:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 542CB83FA6
 for <buildroot@buildroot.org>; Wed, 13 May 2026 16:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBWaF1K73w-i for <buildroot@buildroot.org>;
 Wed, 13 May 2026 16:50:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7F07783F98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F07783F98
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F07783F98
 for <buildroot@buildroot.org>; Wed, 13 May 2026 16:50:20 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-44b330c5cc6so5147018f8f.1
 for <buildroot@buildroot.org>; Wed, 13 May 2026 09:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778691019; x=1779295819;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=awAy32f4mQOwc0LiHhu7PNiLUoX9s8/yY+eDCdr9ZO4=;
 b=sajH6RkKg7M/aHbnQbM5nwqKy8SIBauQejMG84Bqr9l/8wl05Ngtrxnp9QUB4mG8AA
 rkXIjyC5Rn1tLDD8veBDIA7GEhIht/eYjEtz1VXziDQ1fCejgMW/NG7GJOlXiUyBMrSP
 yDXqwZMQxzsdGWRXgNHD4I4fL9j49cipg7UOubZmWQhSNxkKeV5SXFdqJZQyZNb67Gon
 bJpLfVwQWiTlQHOVgLb7TUasq27mktmRT3vS17IViKQVUHPJ3zA9WsYcdwFE3FcZU7DO
 XQtAQWSpKELvX2k3OdyR9cHZrjAjDTdDr77I39iSMkBy3S+VESkxDGqt/u2pT6M282/Q
 r4HQ==
X-Gm-Message-State: AOJu0Ywfbxb7pgo7wDgfJqdIPsZ0sf+t9OF24rd9MqL9D4dWZPnaa3Bs
 24+L2CpHfwr7t240oZcVo473/hpSzBJ6O8UNNUpjAcOAHW5qq2cRnNBXQdzh1jC6ms/ifZt4qnd
 EtOh7
X-Gm-Gg: Acq92OF3VF7Wkj4dHQcv3ySm4qS2sm/0I7pjKBCJ8jXZOhwrWSZ21FLFKJwj1MZXfln
 HzIxnNuHaywuOtaSeJGqcUE/8PAeTpvd4fekIo+HxpV3A7W9lDTeoD7g9u0rmN1VUM2bNrnI5XI
 jyUiJQtSVlING7SIDL53lHb6/DrZFbPSWseRIEEFNs36Pf4t2cGRqwl3qtcAremdktvyLTm0hTK
 KOGW6xmtzw9qBXaI1Ybwm3Hb3G1y1cb6RDJQLtl2VbgJR051eiMWhPDpvcuK6VwemoRTxTEdXpb
 l+UHJbbbYrHOydCl4tIWgedrZs/N/a+qiVHmvQa+5uKlEW7VB/leuvwQc+we4GkBWd5SD3d/L8o
 QRD8O62ygAaMF3GDNVlHc7q8dUPLZGdwZhJbqskKyBNCHVhiujxe0MEw+mAGFftAprpka5Dh61A
 i6xqsSv1jSpsZnoIqFJ1sTrBOFJlHpxSE8sivvkF8luTx2OtyX+VkZzzg=
X-Received: by 2002:a05:6000:1acc:b0:43d:7af0:3a7c with SMTP id
 ffacd0b85a97d-45c7a4ef3e4mr6214478f8f.29.1778691019029; 
 Wed, 13 May 2026 09:50:19 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a6449sm71561f8f.37.2026.05.13.09.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 09:50:18 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Wed, 13 May 2026 18:50:17 +0200
Message-ID: <20260513165017.551670-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778691019; x=1779295819; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=awAy32f4mQOwc0LiHhu7PNiLUoX9s8/yY+eDCdr9ZO4=;
 b=DI/7neS3LSTbo+1B2pXsIiF3A+e4WpBOf6xSGAMI6cnZYact7SSfulxQ4VJ0ZM1LRX
 f6i6UYibZJxP65x2CMgXvGk5purA0tEQSmatYLzxZ+ohiXykZvAgd9LtE/cFxNu3MV2u
 5FY94x460lcNYql30Sr3zARXNhf8dRbTuGxkbnzZ2ywV8lWjVQhDlv9FD0LqIeUuFf81
 XzAf95n468xY2azpuketP7i4OMXfCFePprtv4m/tR4FzSGD2MYX2xZntviBN3nlTa6+g
 FttwMAaEjoQBJs2fQmCm1tqUpcjdFLJToVJPfYw2isXGHXEZ7jEOO9Mmy32fOqYDQwFc
 mc4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DI/7neS3
Subject: [Buildroot] [PATCH 1/1] package/mongoose: fix typo in CPE vendor
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There is no CVE assigned with the vendor name "cesenta".

The CPE ID introduced in [1], correctly reference "cesanta" as a CPE
vendor but introduced a typo while writing the vendor metadata in
`mongoose.mk`.

[1] 3d632c941f package/mongoose: add MONGOOSE_CPE_ID_VENDOR

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mongoose/mongoose.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 432c20a54c..8250751eb8 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -8,7 +8,7 @@ MONGOOSE_VERSION = 7.21
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
-MONGOOSE_CPE_ID_VENDOR = cesenta
+MONGOOSE_CPE_ID_VENDOR = cesanta
 MONGOOSE_INSTALL_STAGING = YES
 # static library
 MONGOOSE_INSTALL_TARGET = NO
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
