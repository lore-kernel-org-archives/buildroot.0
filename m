Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A52EE645E
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 18:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B63C60891;
	Wed, 31 Dec 2025 18:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KjCFRidXlnhF; Wed, 31 Dec 2025 18:45:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A577960893
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767206712;
	bh=/O5d5F2kPOiOlFk+hMUFkSYockkB8oOTggNseV78+eQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=SwU2qp0sJhFCojvjQ7zZDAM3tLcL/9zQ/n8qptktBP+34x98as1oEkaCyX6ejsL8a
	 RzUyqzgYKxZtM2e+bOCU0Nm510FM/uvS4k926yBJwGH/JUM01QT+HYrFw5JOak7+Uj
	 oBHqhRx3uLA+NwFawn6EfzXUz3ppkmTjgWl9Jc6GomjDnGVlC/d8eMIdS96RiJfWyI
	 Z5Y+QUag7xZNDOdtjr5DjKXcMeoGvMy+7mKlVV6quaTVuD/z8fzqJ7RIGNZJNU/3mj
	 nZ36A8RGDuhkNZhU/MRPRDq3dbJPkhdUZuSNz9x33KcQJQ3tCM4FqqIbwK1IYN2w6k
	 RITxOCohsNqQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A577960893;
	Wed, 31 Dec 2025 18:45:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9566CD8
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 18:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C3DF80F0D
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 18:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n1iP-zRqrix7 for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 18:45:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9F7E980EE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F7E980EE5
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F7E980EE5
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 18:45:09 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-65ec86c5e70so3160297eaf.3
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 10:45:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767206708; x=1767811508;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wSF53CGQION5TsT+HrBpUbFI2Tr4/jci1jOIe+aGvCw=;
 b=uhZRECAeFlNn7/2vPLgat7WkJqXLjnjwN7qQZ6clgKuMYX9OG4cEi7ZeuGWC7lKEiX
 C4dizmUGu5udUQ/riCuGFMPbW06J02X7T1kJjIgi0zFnBM7hwew+/5XnXNHlN9zQlVnn
 3TbEVPlBWqL6g7bf33N49j/rT/O71tTaVC2X/bbVrvoge4/vhc8U9BUHs6MhO3dQMy/6
 8pol9IYNmzDtqV7lvzPfwhqelQHA4P4hMeqCnYRc8CWpLJpMcrpO16hmbnyeOZgsCM3U
 CQkK6E64DZzpiQ/ZWCiKN15ZbYAK2rQN98F7OdMGGI7w8szbDo26fL1Sw5KgBl+8SxAO
 aK5A==
X-Gm-Message-State: AOJu0Yz7CI0d1+gRvZ3XaJ6QuPmG+i3DkU2a1dajMprrpCJc4qWVaHQ6
 ta42BGPixd9r1ac4CQTWIFKoKyAXBVEbkE4R4zBlJZ3SiMvGRK52/YOHbKzPKp5DBFs=
X-Gm-Gg: AY/fxX5B6HliiTrwUVqjDfnbJuIUAAV92St3ASMBt0+XAnKT6FHxGfUriyrjV1XGlk+
 o+NMUazINhI60Enc9GPECwXdsXZXlzaWdxteuSI801X8m1lRlzHBSEczS1YdhY3zlt7AcSIzzPZ
 0Mw4yo+Y8FsdmTp8ZBhtIriBJg+cVlWn/V3kw/AOVfu0TjOSN9prP0gLttKKhpxjZ81fQz6Nps7
 bxkvML6N4cEZfU2QQSvvlaonoANlyrmpyLr1eViDAWF2hshzI1KhieiL/kgMPeR7sonsMK3BfM2
 SybDnbGYnXtVeew36M9QzTYQOSenGnziRBJ8lTy9MmcX0C7QvySQ4m3dlqHZ3/TeEwcMZXLH2UV
 8aRLSamKt64OhOjyZuPUIN0HUG//MuH9kEV7yA6ByRp8lD7ktcTTqBepD96mUZW7C5MIR6ml0kf
 L6/cBlMODrjiVcEIAA3s3K/gt2RclwJsR5k+PEnqdv62y9PV4iwdeoVaiXmOYJ7oLzjQGpbefD/
 A4a3rDmxdaHtDOHcGCe1cPf65n/VD9p6sfR3y3/KwIyXBvDn/K1fFFlpI7LtvRQuA==
X-Google-Smtp-Source: AGHT+IF/G2TKuFwpRhSJ2sMVX0319kI9gzTJqsdv7c3WNzjGnBLe2ndDOC9nWBjAfqffqFhfSEM4ew==
X-Received: by 2002:a05:6820:f029:b0:654:faee:1065 with SMTP id
 006d021491bc7-65d0e9f30a2mr21997959eaf.5.1767206708228; 
 Wed, 31 Dec 2025 10:45:08 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-65d0f6e9131sm21001100eaf.13.2025.12.31.10.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 10:45:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 11:45:06 -0700
Message-ID: <20251231184506.3945592-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767206708; x=1767811508; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wSF53CGQION5TsT+HrBpUbFI2Tr4/jci1jOIe+aGvCw=;
 b=fqibOXEUZGugTdRwo6uo3uogyINaLRFp7G3AdFXwKSAPMrPdqG1qa7ZmhP3rquL+c3
 Mnc0X+/obAvILCy4/ByOhISTWjtngVfGKb2rx6Epw/eQqT+teZDumuFzC2emkkar04OA
 HCjcJR2Giem4s7P51DNJNeilCIZgo776i2HH3X1s0z1tTFg4KflYJ/qidbuidcsZqvb8
 azTjr7Frs6Y3viOkLehEsCsjHkiKa7TnCnc3F8e/dYiT20o5OTnYQEkZTNzxrjKP3J7+
 zwR/KwlYfKnw/vH/xfiZ65A5ETQ2F/DMC1LZJIT9VI8HSHPHjm77HHGYp4BCKmiU1cDG
 1JZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fqibOXEU
Subject: [Buildroot] [PATCH 1/1] package/python-types-psutil: bump to
 version 7.2.1.20251231
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
 package/python-types-psutil/python-types-psutil.hash | 4 ++--
 package/python-types-psutil/python-types-psutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-psutil/python-types-psutil.hash b/package/python-types-psutil/python-types-psutil.hash
index b301237599..ac43dcce97 100644
--- a/package/python-types-psutil/python-types-psutil.hash
+++ b/package/python-types-psutil/python-types-psutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-psutil/json
-md5  4a65c910d089e87ab722151b4ff11792  types_psutil-7.1.3.20251211.tar.gz
-sha256  2c25f8fd3a1a4aebdffb861b97755c9a2d5d8019dd6ec1a2f2a77ec796652c89  types_psutil-7.1.3.20251211.tar.gz
+md5  4c6196cba53b8b8218bc829681e82a67  types_psutil-7.2.1.20251231.tar.gz
+sha256  dbf9df530b1130e131e4211ed8cea62c08007bfa69faf2883d296bd241d30e4a  types_psutil-7.2.1.20251231.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-psutil/python-types-psutil.mk b/package/python-types-psutil/python-types-psutil.mk
index 8c0d681c72..f935b28ae0 100644
--- a/package/python-types-psutil/python-types-psutil.mk
+++ b/package/python-types-psutil/python-types-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_PSUTIL_VERSION = 7.1.3.20251211
+PYTHON_TYPES_PSUTIL_VERSION = 7.2.1.20251231
 PYTHON_TYPES_PSUTIL_SOURCE = types_psutil-$(PYTHON_TYPES_PSUTIL_VERSION).tar.gz
-PYTHON_TYPES_PSUTIL_SITE = https://files.pythonhosted.org/packages/d2/d5/85165865b060fed80b5991574c2ae0ddfd4786398dc8bceddfe0a8960b74
+PYTHON_TYPES_PSUTIL_SITE = https://files.pythonhosted.org/packages/09/e0/f4881668da3fcc9473b3fb4b3dc028840cf57374d72b798c0912a183163a
 PYTHON_TYPES_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PSUTIL_LICENSE = Apache-2.0
 PYTHON_TYPES_PSUTIL_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
