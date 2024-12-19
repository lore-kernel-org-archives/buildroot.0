Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4318CE77188
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 01:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07EAB60826;
	Thu, 19 Dec 2024 01:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zz85wftcGiku; Thu, 19 Dec 2024 01:36:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17B276072D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17B276072D;
	Thu, 19 Dec 2024 01:36:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 45E55C0
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 01:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 186586072D
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 01:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K_F12sSaPMIb for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 01:36:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 08D62606E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08D62606E2
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08D62606E2
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 01:36:34 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3a81324bbdcso1836395ab.1
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 17:36:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734572193; x=1735176993;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g3nrpvUcVZxW0OmaC5rf0SuQhh0dYSjUpQ9OK8mE5Q4=;
 b=GSOQwc5i7XXZxgSalFr+GtU/Sz6v/7LXH4rq1djIYZCcned7fx0GLYTCM81kWhux6H
 64rKYhBlvX1jnwmi00jV0jyChZHBp+0XnvYa2eRYhDg2pkC5eWTVl1LM8tk+h2+oOCXJ
 frX2U4+kUpqKAesaAEnSf9D3YQCyO4UfNAUNiCvwrDqx7HQndfGp144RaNW5CBtRu3iI
 n874T0Ua/GLQYdVSDaPZN6fZNK7xXT+9KPmiY/F1c5NiuqMlmVXyJF9DwfB54sExOT31
 pugE4UipylG1Zf4A9cDV/kQv+x5BoQ9+VFZdTQDuW0H6DUMidf01mm9r0+3e9oGiQ3Xo
 uRkQ==
X-Gm-Message-State: AOJu0YyUC3i8XL4Ia0ZCuBkKRlOcuJHEFOOjaryB/Gs0dlEPSRMjdliN
 mfnXYQpsu7M/iXlKkBQZFe+d7fq9+73o5WpUWknEO10uC7hR8yHD1mbc1i4nwPw=
X-Gm-Gg: ASbGncuWxU2MovwMSRsshmhbvr82/5xORqMBJCdvpa+NKXg/OVtOrWdZjQzQS+qua5k
 F7wvJtMjpi8zk+daNslgh6tnhUFbLvVMzYXN8q/0gE5NvAdUiaK0R5wSVmDZUZaBJf0sSI9A3ah
 +qyYAtzybLfBfJndGXHj5l6xZ6uaq7prBuNYb0/W3lRj77SDTTISn0hUEqH0ekr/tcVSgYaD+c2
 /GxLOEepCarzc69eKvmkEXF+mag9t3soVCvFhUJ4qdMubAEzRaTijFrgcekCD51cKY/wH5qvvz5
 NvPm8ADfB1TzRcPAHV9GNNgrdcRdacDzmw==
X-Google-Smtp-Source: AGHT+IE+SVOuAKGGTZGVjc2rz19PWIMQxHTp0ZVUCl7G2gLJNcf7Ug4eu7dNWLoFQjeC4In9tEyc5w==
X-Received: by 2002:a92:c248:0:b0:3a7:70a4:6872 with SMTP id
 e9e14a558f8ab-3c01129fadamr17643385ab.9.1734572193579; 
 Wed, 18 Dec 2024 17:36:33 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68c21951dsm36804173.143.2024.12.18.17.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 17:36:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 18:36:31 -0700
Message-Id: <20241219013631.258264-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734572193; x=1735176993; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g3nrpvUcVZxW0OmaC5rf0SuQhh0dYSjUpQ9OK8mE5Q4=;
 b=CdgqxkRNwIMM65eVcQT5iHPBgZs6o4JupatbvZQbzpdCxhApcyaDF5lQToKlp/nMp3
 mUniV9RLkR4nqmBz1Hic+x+9VFlvb7kgJASlTUwxqylj+BshpDF6jo5VfnBqqTgJ9ok3
 7rrt3pWd4kxur9BZp/y7PZEF2IQ5ofkmENE9Isxe86tYxSdSM7Sox92bgawY7/820QIQ
 phWLFe91JkEs2HswDsRDyfxlyOfqezdwPwLqk8fMRgWKEQAf4Wz1hek9T8SPQ3Dbkq6X
 mJN71ic4EhtFHpH6N9C3RVCnl85Mv7qznhu0Jlb3iDhZRMISdSFk7XIdZjhzeeGzzn3e
 ATUA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CdgqxkRN
Subject: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 44.0.0
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
 package/python-cryptography/python-cryptography.hash | 2 +-
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 61d9ca598e..aa7e16a043 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  72c5686ee70cf37075e2fdea332066e4e2351fab8beaa4a22268983f092bca4e  python-cryptography-43.0.3-cargo2.tar.gz
+sha256  09a765af8da172785de52631fe6c626508fdc8e451b7fb01d52f58b7841a813b  python-cryptography-44.0.0-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 7feb4076cd..9ae1fdbd83 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 43.0.3
+PYTHON_CRYPTOGRAPHY_VERSION = 44.0.0
 PYTHON_CRYPTOGRAPHY_SOURCE_PYPI = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/0d/05/07b55d1fa21ac18c3a8c79f764e2514e6f6a9698f1be44994f5adf0d29db
+PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/91/4c/45dfa6829acffa344e3967d6006ee4ae8be57af746ae2eba1c431949b32c
 PYTHON_CRYPTOGRAPHY_SITE = $(PYTHON_CRYPTOGRAPHY_SITE_PYPI)/$(PYTHON_CRYPTOGRAPHY_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = maturin
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
