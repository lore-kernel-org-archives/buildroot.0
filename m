Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7645C77B7C
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 18:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1A70615AC;
	Thu,  3 Jul 2025 18:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mhfkJp1hjIqS; Thu,  3 Jul 2025 18:28:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D72E3615AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D72E3615AA;
	Thu,  3 Jul 2025 18:28:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B55D4B0A
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 18:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BA6641064
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 18:28:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ZRr7gcw6ltL for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 18:28:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 43F5D41062
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43F5D41062
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43F5D41062
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 18:28:34 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a525eee2e3so50540f8f.2
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 11:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751567312; x=1752172112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=71plc9EAe6VcFXirkRULgRRBtwOWhB6zldCRTTiaFIE=;
 b=aMO6u4mU06L98HEtyPW3DBWgrS79NxuHRE1Zo46Sw8Q9vGcdRc/BwCzZxX0DsCU/a5
 0OZb2128kvSLSWSVHyQdsXfuIHzrcs5ezFHMNxhWecaNwlIDlLlQusYvylWym6YcI3fS
 vJEwiFk3t6iD9aNvb9T+bW57KNn8JrZIbM6cbYNSoCy+Av6+6yKeGZVZpD6qHNgH5c7z
 SprUH+JilntlfnaC7S8stmBN00djASEDD36LNZA9rUdPXcQ0cDMPGj8ZVs1ROkSwGid4
 QgBGzwNFdrAgQgNkuWyUFErztIeWNCjZvXM2ImBsiy1RiIa1qA2FO1afzVQPZlixR/dV
 pTsA==
X-Gm-Message-State: AOJu0Yx5BUNaCu59X4xhT+VeEVkhFUfgDQo6wQ8pZZXG9xxVOi/IGV6N
 7/41V+HmzPA01cg697AAPxmSngcVA4N+fAeGv2UQX5U4BUXhCJNm1ELOBk/xUnALCy+pwOGNTZB
 ccnWi
X-Gm-Gg: ASbGncsU75TQx0wS75GiLNU1rn7gFkKG4142EracGsqynACixILvS9huW16B8r59o2X
 OugSeG3QkIQql99W1wFv7QkzJ47g8/D0+gflwT1GFTINj97GrQAkyFK/7RDGkjPeqHm4nsFRyYQ
 smvxn/+475gwuHpMpTiXbmvGfBIPQkIQQROqDFvBESeOSs9cvBTwOB6X9gAJvELq6lXroFdYio9
 O6/sSmlxlNCCpHUp/oHdOVrksCWCb3x8Ww2igrRHos8dnZasZiRdnlPJZO7Yv9cYIlcBlmk8dfR
 vDu6rfnUNYZNNKW+RVBgfWO0koG8xTvJ7R7ecJTG43Aw2577x+itHJnWzvBzwOGfUJ9AiSz5NHh
 PO5mTOeNHjw==
X-Google-Smtp-Source: AGHT+IE5K7I0ARHeiGpN1j0IMZG00C9E+UpBd3lTXAYMR+B53M8W66m7aNKJOliQnEm5L/JRtDmBjg==
X-Received: by 2002:adf:b64d:0:b0:3a1:f564:cd9d with SMTP id
 ffacd0b85a97d-3b32eccbf61mr2980770f8f.36.1751567312398; 
 Thu, 03 Jul 2025 11:28:32 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453b8f298c6sm40591395e9.1.2025.07.03.11.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 11:28:31 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Date: Thu,  3 Jul 2025 20:28:31 +0200
Message-ID: <20250703182831.4027280-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751567312; x=1752172112; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=71plc9EAe6VcFXirkRULgRRBtwOWhB6zldCRTTiaFIE=;
 b=AewieczxrHHxdVcqOxy0bWrR2P1AS2lADJwvPEKXvNwTU8p5/UQ8JEiXEJn1YQyM9a
 HMivKP7ykO9FTsVABWQcMbns8iWmOZZ/rY7JjHcge+/C1MF3ooDX+Y3wBiPYSzIwKOEZ
 MyTLxhc5ekAZFqGpym+ftmrPthq6GX9cYdLttmrDkFgkRZ/TRFweogUr1T0+jHPmLoJ4
 bXqv5B/R1YcOxZ5kj5AIC9OfHKPbuxoLLGCWX0Abd5Qvg9T5FKjHt3EX8f/qpODd46Qw
 c36fJ/gGi2sWRdnOqlk/0By2Uo6suwuFr2O0zAwkcTvYaRId4/T/OaEvgt6TwYYQS/qH
 ibDQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Aewieczx
Subject: [Buildroot] [PATCH] package/cpp-httplib: add CPE identifier
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

The cpe:2.3:a:cpp-httplib_project:cpp-httplib:*:*:*:*:*:*:*:* is valid
for this package.

See https://nvd.nist.gov/products/cpe/detail/955012E0-158A-4637-99DE-37520A12BB7D

Signed-off-by: Thomas Perale <thomas.perale@mind.be>

---
See associated CVEs such as https://nvd.nist.gov/vuln/detail/CVE-2023-26130
---
 package/cpp-httplib/cpp-httplib.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
index f3a8710d20..712c3f7293 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -8,6 +8,7 @@ CPP_HTTPLIB_VERSION = 0.19.0
 CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
 CPP_HTTPLIB_LICENSE = MIT
 CPP_HTTPLIB_LICENSE_FILES = LICENSE
+CPP_HTTPLIB_CPE_ID_VALID = YES
 CPP_HTTPLIB_INSTALL_STAGING = YES
 CPP_HTTPLIB_CONF_OPTS = \
 	-Dcpp-httplib_test=false
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
