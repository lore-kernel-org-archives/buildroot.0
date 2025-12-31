Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FDDEE645A
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 18:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D671980CC7;
	Wed, 31 Dec 2025 18:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZbTgjuLWFPec; Wed, 31 Dec 2025 18:38:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E5A980D66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767206287;
	bh=Pf+T/U0AJ0GmRy0z506OyrmfEppCD49/lgK8InRNmjw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=fjBUe/zmlyhfe8f39r45QptqD2us/HviYQkUcj+bLdbEgc9RcvrOnMF/LqDT8N5y8
	 wN95He6178qUW0tIwJgyyrAJVhBQicjhShOzt8sFOs0wMRxl0IbkZwScIbyAAggxw1
	 vrnlsGXndoQal46pZ+6eg0n77HbRXiGPBlHalK78wOt5QhPAKtD46dDqVmWUxY68yt
	 zEKQKf4C3BpA3WLa9/GHjdlRyqQoNG/JC27MUz92XXkatiiVxTqD+RNA4fnfXmZjet
	 TF/ALjhKGa0PdFz/U0IgkEFgCYoWtnJXnA/uRcIK4HkqShs+x6WgZo7Al8Hmya/0GL
	 rZFdY5kUV65/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E5A980D66;
	Wed, 31 Dec 2025 18:38:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AFA08D8
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 18:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9648F80D66
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 18:38:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WZpPUX9tyeoG for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 18:38:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::230; helo=mail-oi1-x230.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C1B0580CC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1B0580CC7
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1B0580CC7
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 18:38:04 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-455af5758fdso7089400b6e.1
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 10:38:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767206283; x=1767811083;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/FsrSubfghuyCMMLVp6bb2RE2N5iT2orrcmhOGNcnWc=;
 b=JSylmYB2NKIBWCMLWNX1Zda46Nwf4epcKrTf8sY3XQBq9AvCxEtJdpDp8+oXG3+2tb
 duUW1GMKgOBfJGEj0eGu9YqXXXfwK2Dun3qKX3miaX/4fVtrtv+SR3T8tU6NaIAAbaCf
 WE3t0VMgWIwi9160msNhYI9nGFlGX3cVEV+1kAg0PNkaDDjVdGV8m9S4vf1PSv6BcAMq
 UChzol1gx4odUqURG6NHFZWOk9+w7PEbRYUlkmJz/yvVIEHwop8KDZRv46UBz4bgvaSx
 fmrcXwMtrfBCb/+ziL8SnqguWzUMsx1M03l5jj88d7QyziYnvFFQMb4Bppd5+qmpc1Ck
 NFuQ==
X-Gm-Message-State: AOJu0YygmbmXIb2iSej68TLaRKaHF14TIziH/bQkvJw3UXI3Zf19e06s
 5hu1xMupK5+VYMoX/qJeVYeak5sAYy51eDdFjMRbhJ7ASm+V+aam80yu/gMI7vVqXoo=
X-Gm-Gg: AY/fxX645rDe2mPlCRWeCmQsVbjjZGbUhvC0m5WyYs9E3JPOlHp4x+z8lOa0znqsVyP
 X4vWMl+Hrt0ZgOdEm+9MF4/YPTGJ5RykswwL+Lf09HOvm8iy9E5u66h+8+bD01eSeUG/alaffsF
 u1bz+qpeh32CPek8DviDT5kXaFIYop7+pv7ajQ7y9sEMmea1MRaHIsdM4VMR+choXMvhEgzanni
 i5qvT3TEDyQpktdSLww0qUgbbbfdTPwamPd75YlBCSciA2j3l+xBjqiT76lo4yldGzdwjST1t9u
 Zy9nI7/hCEbCFDLxrQvYEAeOglw/xRtNXws+39jbHhN2Qiz2rHUUcx4I7t36iIQOprIkKq1A/h8
 EIJnLIvMQdm758gTOwQGCvc9DW8dbR29W8s3nDiOKq6R906f6XIhXAniVNXc0aAMWXbRx9iJ7Y+
 Z+VWeCJWUEQe1JqnGB34OppYaD7Af4r60STSW29MiGgOQuiAtBxDGBwzTrK1EsUEdhaKVLjxnXI
 qbzVXVZiTqlprrJSggn5WeJwj6Zj8/zFtKLWMjm4EKbIHNCS8Tm6+k=
X-Google-Smtp-Source: AGHT+IGiGpb7KWg67USuCfZZC3idWz8QLhd8e9f+MaiMNcCY0mkfi0Lrm0vOXhEEyK0y/XMwU2G/ew==
X-Received: by 2002:a05:6808:2223:b0:43b:252e:f793 with SMTP id
 5614622812f47-457b21f5501mr15702335b6e.36.1767206283483; 
 Wed, 31 Dec 2025 10:38:03 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-457b3edb516sm16927187b6e.15.2025.12.31.10.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 10:38:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 11:37:59 -0700
Message-ID: <20251231183759.3934416-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767206283; x=1767811083; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/FsrSubfghuyCMMLVp6bb2RE2N5iT2orrcmhOGNcnWc=;
 b=OQzeLmha8HnVfnu7TBFcfexSGaRxdy/rsr1Myadnyhc9pE2Ch1yWP+QCH+mqySPGWL
 vyvQgXxFkg2J7lUYEYmFKYQLFl4B/ImwAV09qJmzfqYmQ38IAtMcwXmhaevBmQjxZEju
 2zm2mmMu/JCHRH8EVHcg3HgMT7RE6f4Qm3uq16Ud7SffMEGO+Pjq6F8cH4RyQ9yy+sOS
 4n+Rfu8kHmSG0tnpgWnEQ9R6/SAAKtmFJCuqWv8IQBYEuMQG/un6WgFOHIb0+uOK//5C
 Ze2ldxHO+EYLQuJ+WqUh5oo9kq498R/X2ux2yFO1/O1nTNJCHqJijaS7xnC1B2dffg8J
 no1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OQzeLmha
Subject: [Buildroot] [PATCH 1/1] package/python-xlrd: bump to version 2.0.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-xlrd/python-xlrd.hash | 4 ++--
 package/python-xlrd/python-xlrd.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-xlrd/python-xlrd.hash b/package/python-xlrd/python-xlrd.hash
index 003ccc9a72..4d28fed039 100644
--- a/package/python-xlrd/python-xlrd.hash
+++ b/package/python-xlrd/python-xlrd.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/xlrd/json
-md5  ae3f951c857a490d432f0a7d722352bf  xlrd-2.0.1.tar.gz
-sha256  f72f148f54442c6b056bf931dbc34f986fd0c3b0b6b5a58d013c9aef274d0c88  xlrd-2.0.1.tar.gz
+md5  8afbdf48d53472530471a66e0978752d  xlrd-2.0.2.tar.gz
+sha256  08b5e25de58f21ce71dc7db3b3b8106c1fa776f3024c54e45b45b374e89234c9  xlrd-2.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b5a5dbce60265e305a815a6cb83ed07f24519d8ba644f2a307994488bced8815  LICENSE
diff --git a/package/python-xlrd/python-xlrd.mk b/package/python-xlrd/python-xlrd.mk
index 1f280bd432..b7a1420de3 100644
--- a/package/python-xlrd/python-xlrd.mk
+++ b/package/python-xlrd/python-xlrd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLRD_VERSION = 2.0.1
+PYTHON_XLRD_VERSION = 2.0.2
 PYTHON_XLRD_SOURCE = xlrd-$(PYTHON_XLRD_VERSION).tar.gz
-PYTHON_XLRD_SITE = https://files.pythonhosted.org/packages/a6/b3/19a2540d21dea5f908304375bd43f5ed7a4c28a370dc9122c565423e6b44
+PYTHON_XLRD_SITE = https://files.pythonhosted.org/packages/07/5a/377161c2d3538d1990d7af382c79f3b2372e880b65de21b01b1a2b78691e
 PYTHON_XLRD_SETUP_TYPE = setuptools
 PYTHON_XLRD_LICENSE = BSD-3-Clause
 PYTHON_XLRD_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
