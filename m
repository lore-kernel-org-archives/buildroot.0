Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433A4E6F085
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 19:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECFB980E32;
	Fri,  1 Nov 2024 19:38:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VHs8yEIYIbjf; Fri,  1 Nov 2024 19:38:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8C4180E2D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8C4180E2D;
	Fri,  1 Nov 2024 19:38:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FF7B979
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 19:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F5DC4054D
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 19:38:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1fuftL7pbE-0 for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 19:38:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4B0AD40548
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B0AD40548
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B0AD40548
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 19:38:37 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-83aad8586d3so94487339f.1
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 12:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730489916; x=1731094716;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1bUkIG4cwXxIsERf3Iu/IHa+fsKeFnCv/ENmanHerDA=;
 b=PajsRpLZCRhMkJEH2K1cu8FC6eFAq4d1NdJbDqYsvdLIuhSAjGZtCGuuxGE6AL4XGl
 7mPziuBpL4OW3YgYe4wDRHPFaO7uDq0xmAuuXuO9zx9yzdBRGpARdG48/rsmMi9YRW8U
 jqXJloe7VteJsaVxNccJESud8p+G7yAmvXq419cr+x9/Cvqnf49zIzef68wYcRPgqFxK
 iHpo6AdZjR4aqtKsWo3GBW+Ffa9ww4Hg+MwWXxodsaZHFLoQrb8mWljN5pJvEMNAqz4I
 zJXAFOnnqw6baewuh8bOE/Phh74eB5sldPM7gO6lV0Ky3LNT6oFRKKmRdng/N1afeoml
 NAcw==
X-Gm-Message-State: AOJu0YyuREzqMyXwJo7nm4ag23kMiOz3F7YR3Gby/bqZgOLFvqeRWQ0d
 e6HKREU4fg5qtmH/MYcKVqYb7bxAfdVQocYC5sWCPnW7lPuLy/pfbonFxA==
X-Google-Smtp-Source: AGHT+IE+v9vaLh5IPtFEIfqoF+ALfMXxPHEvLgyiTnrVwKDB1/GaS/oaDV2ge2NGtOuTfEfPa/92Yg==
X-Received: by 2002:a05:6602:15ca:b0:83a:d3cc:779a with SMTP id
 ca18e2360f4ac-83b719f04a6mr537821939f.11.1730489915930; 
 Fri, 01 Nov 2024 12:38:35 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de048c025dsm871114173.69.2024.11.01.12.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 12:38:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 13:38:34 -0600
Message-Id: <20241101193834.1074990-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730489916; x=1731094716; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1bUkIG4cwXxIsERf3Iu/IHa+fsKeFnCv/ENmanHerDA=;
 b=ZNQhXyfg4zq3ccwtg50oEqrrbYoakCqxEIr0HrQYnUnUSwIkkBIIh7sqrUOQx+h1Se
 ke4UVw+ozerhk2/zxHA8qqHxe4EkjOS2/NyVIIwx59EX4garGsvFnClChXbrVaSHP1J2
 G5qGE+MJR+YBgy5bOZwOXARxiAZxi+unpV8yUu2UChWgffI62uIHXY/nBc5mYp0TiLTR
 gQ0W9kR++30w7amEO3vsuedAQcj7Ch0/Y2y6Fe8eFaGPaB0AyfqhJcTAuUHKMYPM6UO8
 06rWDUEioahijDXYgZAgF0HoUaA1b78/KWIz67PQJU8WzdjDtxFmkufW3lMVeHqwEv/u
 1ANg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZNQhXyfg
Subject: [Buildroot] [PATCH 1/1] package/python-pythran: bump to version
 0.17.0
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
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pythran/python-pythran.hash | 4 ++--
 package/python-pythran/python-pythran.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pythran/python-pythran.hash b/package/python-pythran/python-pythran.hash
index 06f3b3839c..b72acfbe47 100644
--- a/package/python-pythran/python-pythran.hash
+++ b/package/python-pythran/python-pythran.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pythran/json
-md5  106497787546f3538db7bb1a9e48d88a  pythran-0.16.1.tar.gz
-sha256  861748c0f9c7d422b32724b114b3817d818ed4eab86c09781aa0a3f7ceabb7f9  pythran-0.16.1.tar.gz
+md5  b754bc4c5cf37c4f0c4a3ae38009e799  pythran-0.17.0.tar.gz
+sha256  3b77d6d970a6cf5b448facc7d4f6229c3e73909ac27ea2480c843afdadbad0fb  pythran-0.17.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0be9f14c66a9a3cb66d5263a6495437862ce0c9cdf60d4a6c36d1e51b1244c6e  LICENSE
 sha256  e1c0ed0a99e4462016d79d835f1f479b78c4d4a07fe66598e97f449503ffd178  docs/LICENSE.rst
diff --git a/package/python-pythran/python-pythran.mk b/package/python-pythran/python-pythran.mk
index 4af281eb9a..b9b1faee85 100644
--- a/package/python-pythran/python-pythran.mk
+++ b/package/python-pythran/python-pythran.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTHRAN_VERSION = 0.16.1
+PYTHON_PYTHRAN_VERSION = 0.17.0
 PYTHON_PYTHRAN_SOURCE = pythran-$(PYTHON_PYTHRAN_VERSION).tar.gz
-PYTHON_PYTHRAN_SITE = https://files.pythonhosted.org/packages/73/32/f892675c5009cd4c1895ded3d6153476bf00adb5ad1634d03635620881f5
+PYTHON_PYTHRAN_SITE = https://files.pythonhosted.org/packages/34/2d/4ac363a2eecd68c372b058d1b95a5f262c70776e107619cdcb5a4b68e1a3
 PYTHON_PYTHRAN_SETUP_TYPE = setuptools
 PYTHON_PYTHRAN_LICENSE = BSD-3-Clause
 PYTHON_PYTHRAN_LICENSE_FILES = LICENSE docs/LICENSE.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
