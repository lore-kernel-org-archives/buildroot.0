Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169EACD6E60
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 12:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D471A60BAC;
	Tue,  2 Jun 2026 12:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3yitQlbNkv2c; Tue,  2 Jun 2026 12:40:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B52E60C00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780404029;
	bh=yWnkzibwyzMChtWheEc2+XbrazHsTkjEO/vTY9HIP2Q=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=rOWK/RRUqQYC76T0X18yDxwBKHb9ieL3UKyeo8yPjUUIQCRHvnbf9fNehfALgN3rf
	 IeWt81h3tDdaYCgy+E2cFfYdjlbgasNPDSyRyKgLN2rseGJqZyCruOSCWvwTnCzQC3
	 l+dliMOjVit6CMsbAMcv9yq47MAyAr8ttTMcwELYu3kBa1l/iJQiskNGlrYt+h39GU
	 maq7K4m3A7uGUVe5J7Qq2sKCURFtDLmXyYZt/twcXbL/fnyw23xjoqcMM7OQl1F4zV
	 jMOOf7Y/5CPA0TVkAAQ3SE5q2t46llqsSDhileCwNR1niZKq1C4MokXiIgEPQAx92t
	 NmtptoYZtnr9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B52E60C00;
	Tue,  2 Jun 2026 12:40:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DAF3F4
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 12:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8376C81EEA
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 12:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x5jb9IKX3-Uu for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 12:40:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9948F81E27
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9948F81E27
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9948F81E27
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 12:40:26 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-490ac357c55so19708955e9.1
 for <buildroot@buildroot.org>; Tue, 02 Jun 2026 05:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780404024; x=1781008824;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KqcIGq/tiYAVb9DPn5eFQ4jkslt194OW58lk70YsGbU=;
 b=ZfT9a+gaIFjbRB2CCaBHv02dd8Vk13CTKovyys8h1xqamzJ2LBF4kOTYipSaFmk3Y8
 7x6ZS5Q1q+14nZW99TIcF/We3uKNWlNgyU3oTzfMzezcotxGIFdaZ/oWXt4xuESrL40I
 QO+QugtAmHOzTsAsPHdzDCNsiZqVvkxW5b7JMO+wXFqZ8p5v7lQEWwCy8/TM8gjnnZMg
 XOdTuj84SwzpS6Yydya7dMUhGJpqg2Aq2b7MGYF/7KgMJO2pvDvjm1VJGJPPKhPqoJMm
 uWfmAZcI2FFBtKCh+ATuld1LGZC4djt17uq1XaIMAltTQ06EH1GHiYxSIpXgYs8yQqGC
 9vDQ==
X-Gm-Message-State: AOJu0YylEVkmUgtnEkFN6GQ7fZwLGSlZ1SL+gl7I9LTLSY16AG5aaXn6
 D20AtjCDhV+pbnU84QKc9aeF6K5a849m67UHg2ytykOO3bsRlmojZVMHOpZ3BOX9IoGE5hGn44Y
 Foaqz
X-Gm-Gg: Acq92OF0RE3B/qhv3nIV3bpNgTyqlQo/v828MCxNuelC5zcx7GlAUs9aTYiLU/YW49d
 ppjZx70zRvjSSZ1zV6EG4+4tFZrJhMEkitH7oubuEBSd25HB9IoKk/OrLuROJqO8TMqkFEp1X65
 LZ+XJKyeYwD3QoIXLN/cjHaf9lpHl9i5ZcMgqkEjDeuLrdJTJBiXXTxSdShOvhmQpOtm4t2AbpY
 0B/5qpyciUmnEkNAvnd6/v9w2JOnIGWY6DGLVIkNtONS+r5WPsnFBv+NCkDG166DgR0bnoJWTye
 b0noqXuM3tMZHp0xE7S/Gpa4fDPvcWa65Cg4Atfk8nhxcvhc5/Kf6k64UMvmkdyGkGK2gznX4TD
 fc2H5b+kM+RsciD473SFPMYGgUciQxeJ9KZp4Cc5xSooddHcjt/T6nzOkIYsL+EU8Dob9MiO50J
 mnlTyKOtg6XyPFGPKPb4XzLId/coJd11GeeEPX9oWL/vb8FIpuLmTeWjktlA==
X-Received: by 2002:a05:600d:8444:20b0:490:7136:ad02 with SMTP id
 5b1f17b1804b1-490b078f2d5mr58173505e9.7.1780404024533; 
 Tue, 02 Jun 2026 05:40:24 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e76153sm66229005e9.11.2026.06.02.05.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 05:40:24 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>
Date: Tue,  2 Jun 2026 14:40:23 +0200
Message-ID: <20260602124023.287483-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780404024; x=1781008824; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KqcIGq/tiYAVb9DPn5eFQ4jkslt194OW58lk70YsGbU=;
 b=bPLENHR7qzl5IR4KeWlfLbKiyOY+NMmcHO5djOjynWKdIY7bHWKQ0rvAPHNdvISz7h
 VHiITBlcKioI569gKdiZ+UWiCcc/HQlX9Kkk/Cwgv0KhO2r2h+vBHSvvu4+fQCpuquvZ
 7DvY5u7Vq62akgyJ4pCCsptU2Bl0A007SSDIYW4pBhD/JxiXwjScz+0RmM517xRG93Ju
 eTJOPxtAfHRRBhCSBcCiN4xq0L6MKeDBWEDSdrYkO/VWxiBlHuKZrXHlsCPMupwVzkfW
 PcLsXtdBHzhzVtF87+7ibCM62B8NoO8STAdGIfMIJtCslQ/vrKmDHa+GO5NofcU0Czzu
 QLpA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bPLENHR7
Subject: [Buildroot] [PATCH] package/faad2: update CPE
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

The CPE audiocoding:freeware_advanced_audio_decoder_2 hasn't received
any new CVEs since 2018 while faad2_project:faad2 received 9 new cves
[1].

See the full history in [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2023-38857
[2] https://security-tracker.debian.org/tracker/source-package/faad2

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/faad2/faad2.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/faad2/faad2.mk b/package/faad2/faad2.mk
index 62c469e3ef..3027d44f00 100644
--- a/package/faad2/faad2.mk
+++ b/package/faad2/faad2.mk
@@ -8,8 +8,7 @@ FAAD2_VERSION = 2.11.2
 FAAD2_SITE = $(call github,knik0,faad2,$(FAAD2_VERSION))
 FAAD2_LICENSE = GPL-2.0
 FAAD2_LICENSE_FILES = COPYING
-FAAD2_CPE_ID_VENDOR = audiocoding
-FAAD2_CPE_ID_PRODUCT = freeware_advanced_audio_decoder_2
+FAAD2_CPE_ID_VENDOR = faad2_project
 FAAD2_INSTALL_STAGING = YES
 
 # faad2 contains assembly routines using ARM instructions not present in thumb1 mode:
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
