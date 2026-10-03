Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CF1CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C0514104E;
	Sat,  3 Oct 2026 08:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HHDe2VJVthB0; Sat,  3 Oct 2026 08:45:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 749F541055
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017155;
	b=WJOIhOzam7lXvTyGGyC1vWeqXy1qYazUui9gvnMNeDbNNQ2stW7D2ulWBnQ/FUVVffnR
	 kU9esTAxWOGeICrCiK4IfBDnCFjY96rM+ZdrgjNEpg8fdFFhKtLaXYJun+9Cgjv/tqzhg
	 bRhnOEaKzfJ/eGsCPCAtxp9g2zb/KF86B6ZTnNML7sHUJvU5tMNkXhunvApW3BqsQWvCG
	 6KLtzw0dt/NvStC7Nrgl8JKD3rv8h6O4e7OH5T88M/ouUjJJXH+7nm9oF0dr76w/xm3Pg
	 EGDV4p7gnEOQLTIhboK/6iG3reR5JfPm9FDQ+X2bkh1kHkUT5K43XGAvLIZvuPfw3oA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017155;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=x5p8oHONkAoJCKBvT7z9p4qBaJzON1hDPSnrJVTbQA0=;
	b=D0adqGLaxGgnEcVvpOcx9PjJRMx74gcBLbGD66szclTN78pQGfRnsEWNRt5x7psjky2W
	 i4raFurIP2GhLk3Eonf6vi22lI6KPNHUgGcbpUAAOER8BWEBdUbx4vCTr7D6pz2smfFcb
	 LknLr/WCvtQn4Y5UhFqQ/KjP0J5rJp6C6HME/vThAPny0mG2usfvcTV6VHgL5cpJbg5Zf
	 BuvebTBi+e2bzDCDbNpCKgrL2g3xqu+JFH1LNyDopM2CIO7pLZ5Fz7YT2KiFpsq/LclwT
	 ObtubzgMV3wt7MvTkbzRERPU9ulcU2j6IcFEhMw+U0ss2PzDquYwJ/suC0RlrPGHLUg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017155;
	bh=x5p8oHONkAoJCKBvT7z9p4qBaJzON1hDPSnrJVTbQA0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=HtdkF1JU6nlyBYjMY11UUzcTaXpeUCXXeTU5IqMu9PIxY5CKjLD9zx0Y9sgShhJ0z
	 LFCY35LL4AC9ye662DDiicZ64jOhOM4gndANoL3+gD7q5MxpaGvTHICyXVEj7/4g+l
	 5tJzbGZHbhc7zCYGOZqwRRxVhrw9rCR3v4Vx2Zdv4MiiPGbDehgkqpSPWIt2AW8WCx
	 +HpEPKdYDZWNEgU6Oz9IFkwcI0XMYIbh3cqwSimPQLnJ7DRiJYqtY1lJRsIze231Ru
	 oSsbIirLKJJs+mRaaENbomhtSEKE7mcNYE+Gvk1qJjBGi4uwCbDeliOUtcVilbRx8l
	 56B7qCJ+xRIuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 749F541055;
	Sat,  3 Oct 2026 08:45:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8326E32F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 725FC60E12
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OluBS_n-D_Ll for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7C59E60DF0
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c34"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017152;
 b=L3CDQbZdEL/cevivkYYyLxz5sRc2XHFV5FUw4f+u125+mtktXrV5SUFaDAyZUbrHQm0e
 zsa0soS2FynjSU9hpYV/ixp/L4/appi/twCG+oC+fhB4hpQa/GUbyjiqdhvNydcO1p2b6
 At8jUIGFTQFTIFNAD2PLj762guRewnEkIstAcQXCUlFkkIjMM6wejQxfmex9hsm82HCv0
 +9UdBSD6YGdTvXFPEGZMB58OFzvTK/bQSSmye/b4P5P2jeou5GEA7UhlpvqI4ENZ3oahd
 qMjUAj6cRSdJ5V40DZzO0wdDeETmYCx/sqb6NOPmaXNxSDX1f1BIvgAR0mHRNxy/hBA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017152;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=koEONHRt6iOY1q3TsQYMUovIaTnGsShM/8y3XzU3niM=;
 b=hdZjAgn+w3WT1oB0LE+8FtNAWKVTcKNeeDYmARkkrS9ov8kSlPR/ZWKwWorwfKPDxwL/
 thxQyvhWRvqZTtHBBNu4887ABfmB0iEBcZ40CpntY952va/+AMjQWYkcD23M9MIfI9CF2
 4vclbxStkcHvNXSm2w9bhTw5OssvhddgEA3maGFNTbj8+azT6kNB9s+dagHz4+gJ+yd8X
 fUB24hStqvZgPqjPIXE5GWE9Vmj+1Bv5PJSm1andZMKeHmtBeK9tlWm1hvD3m4JCj79Fq
 dc2cHwGYdxbPd0s9E3GEnTTsXAnWgq3o70O09gl9LsXCmHGCDEVUCkJy/OKqeRlCo4Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=mbPDnnXZ; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c34"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c34; helo=mail-oo1-xc34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=mbPDnnXZ
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C59E60DF0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:52 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-6ddef424972so430845eaf.3
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017151; x=1791621951; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=koEONHRt6iOY1q3TsQYMUovIaTnGsShM/8y3XzU3niM=;
 b=mbPDnnXZ6GOT2J012CRblpHHwz5xrxa0kHiZCrh24eoY/jwT/QPtrepp9rnP5pZ1uM
 bBGl5wz1lZCMhOulUm9sCCknxjjoIS591soOdACNBF5XeHVH1AhRTmUkv2NyNqlWPU8i
 H3gJZtfYn0SqXIZmUmVbn/taB4l9vqJ8pSeJLX3qhb2tLQPZwU8vqB3/p9G8lJr5RH6l
 +Z8nxZv/DtyMY+BylX/Gj0i2xZFMTLr39b7KRxTS6wNkP94geSlGRQbas40QLpKZdRB9
 Eyw61/ngkk+gxtrBbkw07dDBR2YrZztl4/f2COG/3drqn1QzvfghIPKJUhohHFNYKAVA
 GWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017151; x=1791621951;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=koEONHRt6iOY1q3TsQYMUovIaTnGsShM/8y3XzU3niM=;
 b=H1qlJGneY0UvMShaEOHheFD6DKweeaa4pqlBVC72yAsqYQu0+lAUuMRO9Wf4MPzla/
 kPQHKfN/JXHHcxEWjTZ4tF3db47IABaMQClZdUg48AWAc8HlWJ5V+G+AQyqP023u2jAr
 bjHzWxjt6h0xtel4vVwYpMe3srFAxIy6szj9csN/wMKeAkGFj4VyU/EomWTrojEPZyOL
 AElhmtXGfReKdm7hRbafGtuK4y+cxD2NsMcJ76NQG3FvFwBmrZvJGr8AYUh8soSpwQoW
 1ew8b2WMwaCUSBXUHrJEn0mL5cbtJ8xuunk7uSb9fsbdqmQVfGJpyPjDBrAIcVlm/oN4
 Xy1A==
X-Gm-Message-State: AFuF++nVZgqxzqqKX9A/5sBmXkcgjxNhTuSnD6NMe0aovQsf6BPNTA2L
 3neA36jcf424i39aoQ0LQbD/2vKCtFhDr10d/r6ZbRxuWco07JOTUzqIT2UlGQ==
X-Gm-Gg: AYBFou2mgfg3vD8ufx5wMdsrQ5M5AvEBKRdlAvIUSPX2JCLHzNZ7ixrKqg0/AOro4sC
 NmkpNOQe7aXZ1Y61SNl5cZTrUY5Xpa9gT4jgfX9xtIEGcsUdBbvAsbZcP2VP+UnO3DW1M5II6HV
 7n9uROJ8N6vOYi0Ti6RfyzpYmLgQutyE1cZbi5Sxy90kPzAAHXPoZeO3/IQvFZ2Z24sc4v1vqfQ
 Cw/MCBG1w5omLFrvDU0DQ8JSrpXhH5rDHciHDU7GaArbPh6nl8+HgHcCkLIdPk7WTZo2OfSDq4g
 pTXxar23u9LySze5qrl3XfOT695AfJunXLVP1YWITpuj5UWlY3WXHFm+zHcIz4mgEQ/fTircGX2
 1OVZAsnj4grgLmEdW4TX+66STe+piY8hgBm4cI0Rgm9oygxRumBikan3tyDVmok+/Dpd+mekwhn
 F6qCk3kU1DHhv8UrrhY8IFWz9rX7PpwfaT6pM6JV0Drh0JhCX5KR/B8nSF41GABE6KxGZKqddiN
 R3Wjpk+rXjMNqA7z4/zJAspEt76i9aRqpTU7LzGghyFyeMG0iWteu0VFaqYo0qArpaPukV0bNQS
 h+A54MjrtMseeiwy0YZSJqaLEx90NoDD7F0JgwLFzttA2kwbRdanqCL6j50QuRwfK9xL9G50xd9
 wx/IAa9fejto+rcPrPv2Gu7Q2Ha/osIb+VJP5+pqcoQ==
X-Received: by 2002:a05:6820:a07:b0:6c2:4204:6052 with SMTP id
 006d021491bc7-6e09e27ed2dmr1781785eaf.35.1791017151394; 
 Sat, 03 Oct 2026 01:45:51 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:44:14 -0600
Message-ID: <20261003084453.545653-29-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-tpm2-pytss: bump to version
 3.0.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tpm2-pytss/python-tpm2-pytss.hash | 4 ++--
 package/python-tpm2-pytss/python-tpm2-pytss.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-tpm2-pytss/python-tpm2-pytss.hash b/package/python-tpm2-pytss/python-tpm2-pytss.hash
index 0e73f6d460..c6f3aa35f6 100644
--- a/package/python-tpm2-pytss/python-tpm2-pytss.hash
+++ b/package/python-tpm2-pytss/python-tpm2-pytss.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tpm2-pytss/json
-md5  241696dfce31c539ae418a5d3587b945  tpm2-pytss-2.3.0.tar.gz
-sha256  20071129379656f5f3c3bc16d364612672b147d81191fb4eb9f9ff9fbee48410  tpm2-pytss-2.3.0.tar.gz
+md5  d68827bda582608b698e2478c5cc2d3f  tpm2_pytss-3.0.0.tar.gz
+sha256  c193cf1908b482f93c4aa464132920fe3a37d4b9d802e267974ff2dfe37d4433  tpm2_pytss-3.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/python-tpm2-pytss/python-tpm2-pytss.mk b/package/python-tpm2-pytss/python-tpm2-pytss.mk
index 9a192fc7ca..81efb5be04 100644
--- a/package/python-tpm2-pytss/python-tpm2-pytss.mk
+++ b/package/python-tpm2-pytss/python-tpm2-pytss.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TPM2_PYTSS_VERSION = 2.3.0
-PYTHON_TPM2_PYTSS_SOURCE = tpm2-pytss-$(PYTHON_TPM2_PYTSS_VERSION).tar.gz
-PYTHON_TPM2_PYTSS_SITE = https://files.pythonhosted.org/packages/07/1f/0f2521440e330342ef757a6605b61e1dbf5fe47fd97397c6e5f02791d520
+PYTHON_TPM2_PYTSS_VERSION = 3.0.0
+PYTHON_TPM2_PYTSS_SOURCE = tpm2_pytss-$(PYTHON_TPM2_PYTSS_VERSION).tar.gz
+PYTHON_TPM2_PYTSS_SITE = https://files.pythonhosted.org/packages/39/47/7d7089c88e5c73bdef6ca85d6bdb00cdfd655fb59f9cb2b1011557ce7533
 PYTHON_TPM2_PYTSS_SETUP_TYPE = setuptools
 PYTHON_TPM2_PYTSS_LICENSE = BSD-2-Clause
 PYTHON_TPM2_PYTSS_LICENSE_FILES = LICENSE
@@ -17,6 +17,7 @@ PYTHON_TPM2_PYTSS_DEPENDENCIES = host-pkgconf \
 	host-python-cryptography \
 	host-python-pkgconfig \
 	host-python-pycparser \
+	host-python-setuptools-scm \
 	tpm2-tss
 
 $(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
