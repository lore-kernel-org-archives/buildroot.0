Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2409DCA0EC4
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 10:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAB0F427A4;
	Tue, 12 Aug 2025 10:02:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8DPQsgoiSfAY; Tue, 12 Aug 2025 10:02:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD06E427A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD06E427A0;
	Tue, 12 Aug 2025 10:02:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D906B8B
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 10:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F27184524
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 10:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p4UXeVnEjW9w for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 10:02:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4B6D184528
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B6D184528
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B6D184528
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 10:02:07 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-61553a028dfso6949578a12.0
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 03:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754992926; x=1755597726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6YqNYRHSojC8hB2w0KqydKSBOlkA1MGQo2ociy1zmzM=;
 b=hlS6MCvAzDCQkjnAbeYsl8qL0LfAnDjCTZBlTMkEnbzPdnPvWVlalnfhjcUahqto4J
 inysOzoI/4iQFM6Qsl7QsOwtL+42WWdna0hOW0BXAzf1YH2SDX63nPwRYC3sGsPSQV2/
 l5nlt75JcFa/z0q+Z2ZYH3gBC9yaGraecoIS4yUrpU57gQfWKBrcwpMtjutElmxJunoP
 6iH1lkaqV/RA8rEm1zo9OKJE0bgsVUwzHFT4TrxejEVYpz1bgCQR3h0CyiPTo6U9Oluk
 Y/6X/x0lWD3xVT2sv5ksyVZvIyzcUwKNF1hzT+c3KRuXsruudBiDLQdcGKy+U9sBoDSR
 zHkQ==
X-Gm-Message-State: AOJu0YysSfDDu7FR/xRrCGJbbpuTj5EWVm/Cb1oj0q2R+UaFAZpZikpG
 U/JMafHeWYUrI8IbztmF/zmnrBEgH0qItsGCMvlhqhGITVjMWVDBVTRYDaMiEDiaAQRm77x2K25
 E1iFBftA=
X-Gm-Gg: ASbGncsLmSCJuAfkwfxqRy9MF4pUUyE3fCCTHuJrZGFcPmyrOTYDUKrDKuB+9P1O++D
 GO+J6VP+GSrnv2Sr1Gw9aMgC3S2sv5/KLO+D2PANnWXKxLHyyh44Qu0EKqDBOKVbs8UBP24g/N6
 +oXwxlTeL1cLjinCXkyjiv9N+WZd1YkwrhFRoiuO0iE9CvUJglZihJvZegV8xn2bEsomwmr1NtS
 kepyO8/jBjJiokhNRvxM6/m+NrY9woVWDEO63E8LCvsmZ4yW0blwB7el6jWYsC8+S53W3Gg8+Fx
 vYtBcTPStI6BTM4jyMyGRXvgeuRtrDnIkamfRMOBP0g5FMUU0X+PMq6iRpB7YORQfehtZJbi9Em
 lVehUP5mGQ2JL9lHBOKAG4D6i577W6NKdgYxiPnC41v+CaDMwXcXL4g==
X-Google-Smtp-Source: AGHT+IGYu5QHcxGkxCtbVsaECuA2sMwJqNEUCMjeyXditWJ3yehWsr1t8n7twOZ/vEc63WHD+djyAw==
X-Received: by 2002:a17:907:968f:b0:ae0:ab3f:36b5 with SMTP id
 a640c23a62f3a-af9c63754e6mr1494535666b.4.1754992925765; 
 Tue, 12 Aug 2025 03:02:05 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a243619sm2181494966b.129.2025.08.12.03.02.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 03:02:05 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 12 Aug 2025 12:01:46 +0200
Message-ID: <20250812100148.717381-2-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812100148.717381-1-titouan.christophe@mind.be>
References: <20250812100148.717381-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754992926; x=1755597726; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6YqNYRHSojC8hB2w0KqydKSBOlkA1MGQo2ociy1zmzM=;
 b=fxN7W/6eL6+SL5C5NzsOG1Ouw0caxCSDVFGrCyZy1yv7sjrRgUNSA1lBx91jg545kI
 0/WT6dmrjGzSVhiml56VGuZZc1D9mc9vlay3PvCBM5NgIyEztUEuI0qoLFjpNdcDS6UG
 5jmucxx0jL5+i2X8pIY94dwgVfFajoRf0CYeFwGhVaHdlidCxb4RlQuxoVWUOrZS19nc
 f6la+LtOvzIZDC+Rvw9HzHP0vWsmx04hbA4vKerME3REQOJTysyLIOGxEtCgISCBOIA5
 lQn2B5sXAfhvJgH+u5Bajw9VZlSnc9/S22OgnaFsbY2D3E+MAVpD7CDUoK2bvfaQemcT
 eIQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=fxN7W/6e
Subject: [Buildroot] [PATCH 2/4] package/rrdtool: mark CPE as valid
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

rrdtool_project is a valid CPE vendor, see
https://nvd.nist.gov/products/cpe/detail/744D7444-F505-4F38-BB2C-B1540A3966E4

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/rrdtool/rrdtool.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index be30013992..fd9883077c 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -8,6 +8,7 @@ RRDTOOL_VERSION = 1.9.0
 RRDTOOL_SITE = https://github.com/oetiker/rrdtool-1.x/releases/download/v$(RRDTOOL_VERSION)
 RRDTOOL_LICENSE = GPL-2.0+ with FLOSS license exceptions as explained in COPYRIGHT
 RRDTOOL_LICENSE_FILES = COPYRIGHT LICENSE
+RRDTOOL_CPE_ID_VALID = YES
 RRDTOOL_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
 
 # 0001-Fix-BUILD_DATE-in-rrdtool-help-output.patch
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
