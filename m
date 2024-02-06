Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D739CC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 19:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9220981A15;
	Tue,  6 Feb 2024 19:30:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 43yR4D0TBe0b; Tue,  6 Feb 2024 19:30:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B03B081A92
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B03B081A92;
	Tue,  6 Feb 2024 19:30:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D31961BF2FB
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 19:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C01CB408D1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 19:30:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2TfPCss_-xEh for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 19:30:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 61141408CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61141408CC
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61141408CC
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 19:30:51 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-363b5ce4260so14980025ab.0
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 11:30:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707247850; x=1707852650;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=it8r0lFCBLfv9vTApvWyESZcmh9E4I7kjjx1sHjF6TE=;
 b=CRP/IQh5mRQf6hnh3HMNdu9/0s64xvtDUnHvcwRRoAKBhjcAXeWzimshgBrVvWrTV7
 3GLjaBd8UdzNAF1zvY/UEHcS40X4dT5lFg4Ws0tX+HkNLVjSXryOYWq3mk/U9Z8Q+8ih
 7MuE/E37eDp+9h71YLMd3x1FZue+mEsxcq77IUgddlf7+tsMb3uNnj4jKFb+z4Z3PRKP
 DfS+t3ebrMdjKKK2sVaf2GOm/gPHwtEyBTPny8OZZ6AGXDkDIFvFp69BR+v2ZBHhjRQ4
 KaFOjqzkzBIA3kD4IdQHI/ga/F3pwTLtZfPpH9g2QRFZZmh7JSVPmBZOlZWbyu9egPaX
 JKGw==
X-Gm-Message-State: AOJu0YyyaKbzffQBSDjWfxzFCGTwnoTOvTEG1iV0WzzJQ5hfegfeW077
 wpfed/K9M1ph2LNXnAXV9HayUQCefFwi3Mc1eOy34NKCfd+ZTGrJK/lLslRN9mg=
X-Google-Smtp-Source: AGHT+IFor5VCyrs0Ukq43q8TvdNbvJsVZJ4tcBCUgi/m4UaHLN0oCB/SYFZT9TATyr/HgjgMgFSODQ==
X-Received: by 2002:a05:6e02:318b:b0:363:9f50:9715 with SMTP id
 cb11-20020a056e02318b00b003639f509715mr4695432ilb.31.1707247849905; 
 Tue, 06 Feb 2024 11:30:49 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVEiL9txumGN3slEeCUb7o95JODVe5SFeDJpketctrMgS77cTXdeN0etpGE9gOTG2CXLlhkjPhxJPAW7aY9ufIV6qHmdUjmqf0gKjyFngWbk8su3nqixMIN2eVxFsHjnCgeUniUj2KUW5U6kgmSpV3FcnaI11wEw2I=
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 gk5-20020a0566386a8500b004712ffda5ecsm658717jab.60.2024.02.06.11.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 11:30:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 12:30:46 -0700
Message-Id: <20240206193048.658003-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707247850; x=1707852650; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=it8r0lFCBLfv9vTApvWyESZcmh9E4I7kjjx1sHjF6TE=;
 b=Sn82ge9mpyxpE1jabR24twrrvOF1Nwa/DKfpbU8BM7NKjWuuNfTxixbcI38NNRZfvP
 LP1tZ7HyCAG15XjvAxipK2FncpNfiYkNYO1PRzTKoh61SNtb9rNm2Wip+zT0fmLksadi
 ZH0h3MWG7+kx6TGE0gNMxJrpEIZfjqvf3qP5yEI3gEBLayrsoqt5Mbh6BkeLLMtW40s1
 /O2zJOVzhiSF39XzpQVtGh+smX5fGiTrNki6+5C0CBWMbxB/ybktDmVkyytpC9n+0+lB
 +YX2aWlDyVOgiEgEVoYDmBb4gJhVW0ybDOs7TQD/GBot6tpelGHYeizDWHVxZUL551fo
 2cGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Sn82ge9m
Subject: [Buildroot] [PATCH v3 1/3] package/python-poetry-core: new host
 package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - add vendored licenses
  - bump to version 1.9.0
---
 .../python-poetry-core.hash                   |  9 +++++++
 .../python-poetry-core/python-poetry-core.mk  | 24 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 package/python-poetry-core/python-poetry-core.hash
 create mode 100644 package/python-poetry-core/python-poetry-core.mk

diff --git a/package/python-poetry-core/python-poetry-core.hash b/package/python-poetry-core/python-poetry-core.hash
new file mode 100644
index 0000000000..0d908be0f4
--- /dev/null
+++ b/package/python-poetry-core/python-poetry-core.hash
@@ -0,0 +1,9 @@
+# md5, sha256 from https://pypi.org/pypi/poetry-core/json
+md5  eb8730e30aec5f644754b29587b47122  poetry_core-1.9.0.tar.gz
+sha256  fa7a4001eae8aa572ee84f35feb510b321bd652e5cf9293249d62853e1f935a2  poetry_core-1.9.0.tar.gz
+# Locally computed sha256 checksums
+sha256  f1978133782b90f4733bc308ddb19267c3fe04797c88d9ed3bc219032495a982  LICENSE
+sha256  8263e5652d07cecb3adadf05140b65e70cfa169ecec5f520fe1671479ce12a83  src/poetry/core/_vendor/lark/LICENSE
+sha256  cad1ef5bd340d73e074ba614d26f7deaca5c7940c3d8c34852e65c4909686c48  src/poetry/core/_vendor/packaging/LICENSE
+sha256  b80816b0d530b8accb4c2211783790984a6e3b61922c2b5ee92f3372ab2742fe  src/poetry/core/_vendor/tomli/LICENSE
+sha256  9ccddf69eb3998a60148debe85b94c5afed53691b6474692e78abcc0a0e544f1  src/poetry/core/_vendor/fastjsonschema/LICENSE
diff --git a/package/python-poetry-core/python-poetry-core.mk b/package/python-poetry-core/python-poetry-core.mk
new file mode 100644
index 0000000000..676a0c9a52
--- /dev/null
+++ b/package/python-poetry-core/python-poetry-core.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# python-poetry-core
+#
+################################################################################
+
+PYTHON_POETRY_CORE_VERSION = 1.9.0
+PYTHON_POETRY_CORE_SOURCE = poetry_core-$(PYTHON_POETRY_CORE_VERSION).tar.gz
+PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/f2/db/20a9f9cae3f3c213a8c406deb4395698459fd96962cea8f2ccb230b1943c
+PYTHON_POETRY_CORE_SETUP_TYPE = pep517
+PYTHON_POETRY_CORE_LICENSE = \
+	Apache-2.0 or BSD-2-Clause (packaging), \
+	BSD-3-Clause (fastjsonschema), \
+	GPL-2.0-or-later (lark), \
+	MIT (lark, poetry-core, tomli), \
+	MPL-2.0 (lark)
+PYTHON_POETRY_CORE_LICENSE_FILES = \
+	LICENSE \
+	src/poetry/core/_vendor/lark/LICENSE \
+	src/poetry/core/_vendor/packaging/LICENSE \
+	src/poetry/core/_vendor/tomli/LICENSE \
+	src/poetry/core/_vendor/fastjsonschema/LICENSE
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
