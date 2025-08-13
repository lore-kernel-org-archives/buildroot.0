Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896C1C87FCF
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 20:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 041DD41677;
	Wed, 13 Aug 2025 20:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2SBfEZA0Lspe; Wed, 13 Aug 2025 20:16:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 183F341686
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 183F341686;
	Wed, 13 Aug 2025 20:16:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AC39938
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 20:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BEDD40614
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 20:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOV6ZNuhQ-3R for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 20:16:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 76B5B405C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76B5B405C2
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76B5B405C2
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 20:16:43 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b9d41cd38dso148388f8f.0
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 13:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755116201; x=1755721001;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8mty7NCTbSUgw9+236kNacm0RkW0EwtiV53Z/1+NJ9s=;
 b=duBNAadZXun4Z43bbdeKzFAjKX8T7s0rCVHr1QkkmZ8/CSBDa3DmwVkkcmA0/jtK4N
 CVWH6rPdFMMV9HaamwRKMEABct5Bd/97B9AxAeXRuSn982be3hZyUnwyra6KgvSe3ln5
 ziimEPg2dzBzUq/WnG8j8rLPMQLx56I8n605C+17WVrTTyKqXcv8GYKLNP2yCcXx0N81
 VEZ0HddBlHgcfJqEjiuSYfTAazkuJQj+HmFEVvS91lsJUlDpmd7dJeWlcNbfuxxZC2Yf
 FzRuXj3dWkgmlq/Ies1+QJO4ADLSgquefLX9Jlvs2UcXje2oD8U+W+1aYGFrbn00ox1T
 d0OA==
X-Gm-Message-State: AOJu0YwpjW8rumaaBizgM3WhPKDx4oA0lM8Q8X4T4E7sReEtlIary5jl
 w1L8ia2Mx3T+/v75Fzs34oyJyMA0BhsFVWzbM9d/+zbaNRIa+nP1l58TQW6YjUg6AnhCkTWKXWn
 gAfhH
X-Gm-Gg: ASbGnctvGtnMm4kjtqZy+O9PeFOcvJcnmysykOIggZRPcSAuEdMX9ezxgpg7GnI4zyP
 P5hRMpm2Fk96XjUJK+7CttvUnI1f/fvmMV1158oqH7fZj1QnBxapiv4a/hpX1qznMpCp1jmOXTs
 IiKXsghlt5jWJdnisM4cgG1eX3fTFgTE+5HVhbURFS0g8DCQkXIiILCU0rifQOasR7Or+6N35ZM
 uTE2cOOAYJKPa4gL6jit5uIRK44L9d7io6K6F/HxPgui81PwZtq5JWb2QJyNgYfY9cTwcy9LG5K
 kw/pyiB0nCROs7LSrHmOZQ5TNR54W3z7nn7Io80dvds2sDE1HErq0TtGUt7yBljFCxUhqb4Tv8y
 nqdRseJo5jvd4JA==
X-Google-Smtp-Source: AGHT+IEx/10wy6K4YNNOAEsVdULLa2QydXDAyz7DvjLqaT+R78iCceZLXXvTN0BvS3HmbI5V7yfzfw==
X-Received: by 2002:a5d:4752:0:b0:3b7:9457:e16 with SMTP id
 ffacd0b85a97d-3b9e41588a7mr384250f8f.1.1755116201498; 
 Wed, 13 Aug 2025 13:16:41 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1a594e45sm13236745e9.26.2025.08.13.13.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 13:16:40 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 13 Aug 2025 22:16:39 +0200
Message-ID: <20250813201639.2443921-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755116201; x=1755721001; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8mty7NCTbSUgw9+236kNacm0RkW0EwtiV53Z/1+NJ9s=;
 b=cRBH/9rer4KZlTVPUV+QxMsQIwa88Cs5R2EQihu+LhRd1qtHMtTKxsSdcADh6gNEtt
 sbzteh+6AgX6WOVqR5uV/7OKCuro1nVwPmJhFa3G2j4YZP3QzFOI5ftIx4GZA+3raL6q
 z9d1CgRKXWqiVEU2Qe0uyvhwka3YsAnZtHRQRUfqJQ6GG2CdhSNHwsAp5k+S2mpNVBFL
 jgz+ziEh6P5ST6ssfhDLiYIL8WkdC5tLFXVniJVC+TuhGbfPLiw6dNZSaXlCY3nTcKLP
 JwTU6e+SlURn9nLJDtCHn1eUAbd4wHIjRDEeSyRM2O9YbrDig3fCE6otnbrWpyUkO19I
 ILPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=cRBH/9re
Subject: [Buildroot] [PATCH] package/python-propcache: add missing select
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

`python-propcache.mk` depends on the host-python-cython package. Since
`python-cython` defines the `BR2_PACKAGE_HOST_PYTHON_CYTHON` symbol in
`Config.in.host`, this patch adds a `select
BR2_PACKAGE_HOST_PYTHON_CYTHON` to correctly express this dependency in
KConfig.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-propcache/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-propcache/Config.in b/package/python-propcache/Config.in
index a387d6520c..5be956f1dc 100644
--- a/package/python-propcache/Config.in
+++ b/package/python-propcache/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PROPCACHE
 	bool "python-propcache"
+	select BR2_PACKAGE_HOST_PYTHON_CYTHON
 	help
 	  Accelerated property cache.
 
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
