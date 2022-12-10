Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A6EC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 18:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68ED5408C1;
	Sat, 10 Dec 2022 18:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68ED5408C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FJquvB3PQQx4; Sat, 10 Dec 2022 18:42:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42C7E408C8;
	Sat, 10 Dec 2022 18:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42C7E408C8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 57E701BF2E4
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32F7040376
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:42:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32F7040376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7IaNZaCCnZ1B for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 18:42:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3259F40239
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3259F40239
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 18:42:42 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id d14so1481794ilq.11
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 10:42:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CzYCKqoT7tnSnZBoJJ6voNu0aQDo+fi3LqG+30WvsO8=;
 b=3ZPnZ7NeNtrvPLpaNmZjo39Y5jKdfTjSczY/IbWY7AjAb4Mp1SPApMO3A+TEiu6elG
 Z1bT7zhuMllPYgPIyupjTPZy9Xvuy6ffZheVvXNwHBCCh5GyhSpSLZJzurhmXS4fb0cE
 rzk8q4OCqZZ48GSQnyt+MpnHPgm1NE9GrpE/tNvSowS096jwEBdhWCHoSAlEJDK8isu3
 lGOi18FgP2zRaySAQT9OpUHqu+3TInRaGOJTrEQmZNv8pKrEr89mvvpFo05CnALuOi+O
 RKgnwYAtpeVBvGn23++WGaO/OskHrh3fycN5dBCF56BGMjSW7NApQW34F17UE2XmXmI0
 CTtA==
X-Gm-Message-State: ANoB5pmFnLwtPx/ZK12WgbY/eLL/w2Z2iKLDFnpzjks0G8sKDymyhCG5
 S6BnapTZPGVjyQ/+CIJQA+5kZpVRBN+vCg==
X-Google-Smtp-Source: AA0mqf5eR/mF098tJi0yUCj+cAwTJmy4lU3LR0fKL1xIJaYgo0Mgst/APdlY1IVYltq9aARqWyxZvA==
X-Received: by 2002:a92:b301:0:b0:302:a5a4:4b76 with SMTP id
 p1-20020a92b301000000b00302a5a44b76mr5671306ilh.28.1670697760961; 
 Sat, 10 Dec 2022 10:42:40 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 p25-20020a02b019000000b00363a4fcd3a8sm1589139jah.5.2022.12.10.10.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 10:42:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 11:42:38 -0700
Message-Id: <20221210184238.2935799-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CzYCKqoT7tnSnZBoJJ6voNu0aQDo+fi3LqG+30WvsO8=;
 b=YVHAYE3pu52xS6irmVkIkqPiY4Dvu7TDGnpj7DtYrnC3y+kCJm7V+NpPIpB/+8Taww
 kl3FUMcluehvLbaGipWAnIBvsqreY/MMB9NCAdaRfutTY0/5BWGKVNpHAu6G9Ox7Qim0
 6IyCyuU9mmgQqfrgc6o/8NHf8pwNmvd5h+Y5TIFaLZc45UFaCIID+JUd3N0+cbth/KV8
 DxPlAqMKtr4uz4VfphhBOiCqXTL8EAvd3ax5gKR/pUEu+OHIfjpx0SKi572E23f8lf98
 cZomWDGGpor9FqbwuJTzvYbQym3SvtZFR62Vl1z4eW6u+wtcBUSqpeM2/9Pmaq2vNrgC
 IRzA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YVHAYE3p
Subject: [Buildroot] [PATCH 1/1] package/python-multidict: bump to version
 6.0.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-multidict/python-multidict.hash | 4 ++--
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index 999c8867d0..eae60af37c 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5  f8230905ad1f50c87e8d9cc6b0bb7ca2  multidict-6.0.2.tar.gz
-sha256  5ff3bd75f38e4c43f1f470f2df7a4d430b821c4ce22be384e1459cb57d6bb013  multidict-6.0.2.tar.gz
+md5  b5875cf0a0578956dcfffc123d8344ca  multidict-6.0.3.tar.gz
+sha256  2523a29006c034687eccd3ee70093a697129a3ffe8732535d3b2df6a4ecc279d  multidict-6.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  06a240ea10ba868fda2de58df859886961df873aa74bbab1e0f13eaf99f92b7b  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index 1a9aec7ba7..bfffb84709 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 6.0.2
+PYTHON_MULTIDICT_VERSION = 6.0.3
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/fa/a7/71c253cdb8a1528802bac7503bf82fe674367e4055b09c28846fdfa4ab90
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/b5/5b/1dd3b9cf73c474ea1d0f0b1f8b7b712b0f13817493fd93101256ec856b59
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
