Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C480AC43458
	for <buildroot@archiver.kernel.org>; Tue,  7 Jul 2026 04:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2744406B9;
	Tue,  7 Jul 2026 04:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F3vxWR8D8D8O; Tue,  7 Jul 2026 04:08:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 969EC40694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783397322;
	bh=bDUb4Vr4L/C+FqsEm8NE6KCfFLJncGuZyZ4QZ550mIs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nJfW0QRQnTZVuIC1gdyNhXVHUhP98COzxwPldnHW1mIJ669lCy8WhpR2nCYJ/CrGc
	 v1l9WukJWbp836yulBrKgAkZVWXUZiLNFkY8zxJ/8j+PHRqZxPWWduslVWs7Uu9iDn
	 6ImpJpwu9RQqWoXfDF6piKdUna3VO0T1AvNX3J3un/jtmOp6BfbBZPlu6P3fz4d+RO
	 snO4OWtso3VTO0aEPmrwNPtZqQNwr4DkCxg2BKD7IAEQabqxB71rkDit4P87Pj/bh4
	 F1otvuUdfXFIKqwd7GcJq8nq24ug0fhShABTACDNQ6n2u67jIapAmGNMBePrCpdnKs
	 Hr7SN1oq9pmag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 969EC40694;
	Tue,  7 Jul 2026 04:08:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E984B315
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 04:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBB9B4018F
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 04:08:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DmZRFgtSD7e3 for <buildroot@buildroot.org>;
 Tue,  7 Jul 2026 04:08:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F11CF4009E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F11CF4009E
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F11CF4009E
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 04:08:40 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-3811f512167so3468317a91.3
 for <buildroot@buildroot.org>; Mon, 06 Jul 2026 21:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783397320; x=1784002120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=shWJM2AfRJunJ9II6Q1i783cUlZDtCXNwWJuEYh/BNw=;
 b=hYDJUi2hLYDkR3NwnfjcElY+//6sPqR+nsUFqIjbt0xcK+VSwSPwJ2ySNo3Y8CDFMQ
 dSV700PeWX03+AueP9I4XLbUfCvQOT0WtjA8z1c942HPC3S5HayEqZQ/G+Q4liH2gltS
 kB+e3C5qwIjGJXhg2EvylvXhM5f22YCUSK94W8VG3eMKszzEW3xxTHhiEZtPOM8Zb53N
 mzNLr2acj9Ll1ff1TlkugyFpuNjp8C7OPO78SLZ6C+5mOZsdWRiL0TZ2S21vru+e8a9J
 N5EE77r5dTaQoRO+SEOFrgu9sZPqijEgddBWAWHsoHFLW3okxc2anbz11I+7IdKUQycw
 WwSA==
X-Gm-Message-State: AOJu0YwgbDLvi0/JZKSSD+aHpGmwBVxPuRLetqY6aOJxamnQbDlx5JI1
 q/LyRX1XfvUvHDSje3B7I1y5r8H7yB4g0wdcL53ZgHKUO+DALytsZ2w/FU9+k4Xo
X-Gm-Gg: AfdE7ckMK0e0bODTFvwjYeHtaAwvTTjVHB4ESlj+tfAEOd4jTdmDYeJbn0SVtXES2Eh
 q+iyv9O2t+wcWQt3TRVfH4CZ6OMNXesbM/+QIHyC98tKMMx3Y8etTyRrtyogC7X/DLYvkr3HNs0
 xBWXM9UECCRuH/qjojw/mPtrKLx2f3CNpp1WWFRNf6i4DAYtN2SjDGmldh0DS1cAWWn29nDnUeI
 Z22pPpL23efiPlSj0IrMi9xzeD7h1OFrOc/OkFqLu5nS83JCBD4WZqG7pUQ/jlQiT1RvCjRVCD+
 Bw+qvriY2sBobvr9HAFZE+Vo5vJdqBcsupJlk76tPYQCCVbvpY9aPZhv3CFCuxZsJG8xLjERtB1
 IoZvJnO6sEBwAn9OeTYmaNLINiNZBcFZFGId6CuPlB7KZIObovFuGHIY1vtKIDgfUMpYWsPWJsE
 x47GGsT15JXVkaCwBaSGIIRYTyO9o+lFepxogk0Y+46gdlsZW4BIGnADNtXnEU1Qf5biGX+tPNB
 w==
X-Received: by 2002:a17:90b:4f:b0:381:152b:d596 with SMTP id
 98e67ed59e1d1-38756aebca7mr3783383a91.11.1783397319987; 
 Mon, 06 Jul 2026 21:08:39 -0700 (PDT)
Received: from kadvm.. (ip72-203-121-181.oc.oc.cox.net. [72.203.121.181])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-311747f598dsm3372636eec.6.2026.07.06.21.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 21:08:39 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Vladimir Oltean <olteanv@gmail.com>
Date: Mon,  6 Jul 2026 21:05:37 -0700
Message-Id: <20260707040544.108052-2-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707040544.108052-1-nemaakhilesh@gmail.com>
References: <20260707040544.108052-1-nemaakhilesh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783397320; x=1784002120; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=shWJM2AfRJunJ9II6Q1i783cUlZDtCXNwWJuEYh/BNw=;
 b=G5y6kVuQsDEeR0Gqqrn8mFZtY/rHbYExCDHhnq7j/60R8C5tFYxLY+oarvfZF/LbRg
 wDHRMQ5lyaaA/qM/MiOkz+bCG/MZho2QXBp+PEoM2txpI0aTuL67+hvMnQytq/tTk3uQ
 ml8jGpxJSPgVduWOw1guHpWsSZcZJo5qnqV7npArWPOW5p548MSPMiqBt+j6b4aspY9H
 dGdBlrVownytjA1Va+I2zdQrD5fyUKD3ht6ax5AWSuLt4054B8nWDvn4WpjY+5p4EFpQ
 ngQgFJuwdvVX5hxRzPYeOTZXHKXr2vzU/4hssWiK/TuDAiIXYHBIJkn94odQqRzeZ4RT
 rxHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=G5y6kVuQ
Subject: [Buildroot] [PATCH 2/9] package/qoriq-rcw: bump to version
 lf-6.18.20-2.0.0
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

No change.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/qoriq-rcw/qoriq-rcw.hash | 2 +-
 package/qoriq-rcw/qoriq-rcw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-rcw/qoriq-rcw.hash b/package/qoriq-rcw/qoriq-rcw.hash
index 99dd860e02..6b9f591866 100644
--- a/package/qoriq-rcw/qoriq-rcw.hash
+++ b/package/qoriq-rcw/qoriq-rcw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5106d0e42a990b5474100cbc397d27f550bb226420664ac5a40b952706b680cd  qoriq-rcw-lf-6.12.34-2.1.0.tar.gz
+sha256  933333957ed6b12d2521c1ef85ff806c4bcd5c26ef473305bd58bcf5f2abaff7  qoriq-rcw-lf-6.18.20-2.0.0.tar.gz
 sha256  68f4b15ecc085729419bc60ca6eeadca5af0237bbfec791e8a79da9c943d42e9  LICENSE
diff --git a/package/qoriq-rcw/qoriq-rcw.mk b/package/qoriq-rcw/qoriq-rcw.mk
index 1394766b92..05d6a4bf23 100644
--- a/package/qoriq-rcw/qoriq-rcw.mk
+++ b/package/qoriq-rcw/qoriq-rcw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_RCW_VERSION = lf-6.12.34-2.1.0
+QORIQ_RCW_VERSION = lf-6.18.20-2.0.0
 QORIQ_RCW_SITE = $(call github,nxp-qoriq,rcw,$(QORIQ_RCW_VERSION))
 QORIQ_RCW_LICENSE = BSD-3-Clause
 QORIQ_RCW_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
