Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C06BEE645A
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 20:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B72B080E77;
	Wed, 31 Dec 2025 20:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OW8jK9qAJUWE; Wed, 31 Dec 2025 20:05:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D920E80E87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767211507;
	bh=3uglfg0sX8iRWP59X73DBcG37f2fCwogUd9JmXY3uGA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=fZAQiMxyS5NQ4djnKAeDjnqOjJYIetAhqwh0tW5rfJaQ2+mkm0D8v90cQSi8nIxXM
	 kdAvfeZUGa0JlgeLwsKBzBUhNwnXqphrpr/5Q016eBnMiG9vgqfld91s8oGbQJL9gj
	 Dyfesp5UhMGqvbVRMOgm+6rq1GhzX6NHX+fEwuaFK+8xnbr2ZLuNdkecwz+LlYzWCb
	 lOrtjfE+cctqo08dO7aFJR/gIA6ede3SgfohQLvAj5dzbcGgVVXF2J58/5SsCoDdYC
	 hz5JWlEqASkFcJAoFv+JNE1eifWcYbydC+xD4BADrvJcthS/nCdncvK8Pbz2KaRVdw
	 PElQ5122JfhiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D920E80E87;
	Wed, 31 Dec 2025 20:05:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EF4C177
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 20:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40F5E405E9
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 20:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2KJKcdTNum1E for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 20:05:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2e; helo=mail-oa1-x2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 584B4402E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 584B4402E7
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 584B4402E7
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 20:05:05 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-3f5aaa0c8d7so7907841fac.3
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 12:05:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767211504; x=1767816304;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uIoNcvsRBdmNlU/SZ8pO4DXVIHN49Bku83T4ucPEpKs=;
 b=KcXi+/1EzusD0SyQlJu1XGsvP6uyRgkRphXY/g8NajJtQSAjDqgzRhbfzKu1Nj54NG
 g/dRN0TXzkkxHzc3/WbgrQ6f1p7YjexP9QsOuV5kTBEjtB7lLxekgtYFYNLFFwLZM8MG
 87aU48o2KqPmmYubP1pCVnKfb1d6Mzc+AX9xkW+loStGeNryGOohgwyTsaEZYs5wTKak
 Oa8ZnOGi+utSnH7htzyHvs5sMN6rcUQUfbNtzqarTlpP6u9vuIg7a8myqiiDXLRZH4CD
 7/Sd0MLCxV+2vMhJoCTUKKkmQ6vqCVSGYh6eQIl2bhIBM/yEcySle5xkJ+wANaF3KVrT
 iLzg==
X-Gm-Message-State: AOJu0Yzo/cL2IBeaTKSUyqRJlcDFWNc7YIeowUMPMi3A3Rq76f3hfbEe
 TtPh/f8BH3pV0o8IeN4AiPARzjWk23vLAtd0oDaVLMjEctfYt/P6FdfMCo84fsmemk4=
X-Gm-Gg: AY/fxX689soWmPGVeuucvNyac1Fwp3FTI3hxxnXoAmjkEeW+lIaweY0AHlLi9MXK0fI
 sAhNsmdV4IkC9PYaHuSNswA8AnfmKZG1crCrCfGvwnFjuI2sRrmqrj7mCNFxiCnLfWbcNQjUJdY
 /ddDrpDCKLcCQjy1Cx3Ckea+7UktDd23bBkwjhyaRWsQW8NRCnrGcBtSIfzEURlISNNH5HzFys+
 IUoXmzMCF9P5lxNunxXNwUyAaJeh7H5js5VZG5TvXk/lnG9fXHHc+8lgjt3/wvdXUJ1qYYyWnTg
 22BNaGEwtWXPNbnieRbwE+H9igga15Piv2vTPJmelcRiLdUu5GCi4Fx6ir73c9utBvEztWkSqW2
 tkdecjP1bpPDtwBRk91hboBPDX1pU50NQbGYPI2OwATUh0KlDvhFf4iOB3huCctEAJPDC1hEfdX
 U3F1o5UCirJ77MD7pVoyvHvF9I0K8B9VNeoBrVeCnT7CbiK76np8/xE6q+AaykNdrx74DJyFmsv
 n0ix6/HXvUhLwCVccukdj8VABz4fLTWh9KkmHBNkIqTjFOkR0AtYK3NyDakJk5U6A==
X-Google-Smtp-Source: AGHT+IGZOyqaxkeghE6/5VaYfzM7OIdFRrJ8ujHKr76jYFIjKZOg5PbU36vcmhBkCGVBQ5Wr3IYW4A==
X-Received: by 2002:a05:6820:1689:b0:659:9a49:8fc4 with SMTP id
 006d021491bc7-65d0eb937bcmr14646070eaf.61.1767211503838; 
 Wed, 31 Dec 2025 12:05:03 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-65d0f3f9d15sm23512684eaf.4.2025.12.31.12.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 12:05:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 13:05:01 -0700
Message-ID: <20251231200501.4067983-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767211504; x=1767816304; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uIoNcvsRBdmNlU/SZ8pO4DXVIHN49Bku83T4ucPEpKs=;
 b=RLk2ghRoPtPCugeWMsbnBDArnkmXdw07NnAnhURUoMKDNw+MATL7PFi3qyWEd9R9xo
 BpAzsUoUzXwUCNp6ixtqVDPXLMFwCaE4gKekj6LYrAkp+6rY0Pq8qmlY9vdld548e7sw
 OIxRxyJXUlmVDTpittiR6U3fvzi+gXLwzcfLlr8fC6r9OHsGwt36yy7pp5ut55QBsyUZ
 vWS54/OFnQ1uttcQRoH5HU7cEwSPcfBkx8MiEenXgPeojZEyqI4AdqAW96YjIaxLWV3A
 KvkfXb77+wUuVLKzXbKuB4YsE74Rz5Jug6tAQ9VwduJkostDfjZGtR2RSfmXcTRKDV/B
 NxnQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RLk2ghRo
Subject: [Buildroot] [PATCH 1/1] package/python-smbus2: bump to version 0.6.0
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
 package/python-smbus2/python-smbus2.hash | 4 ++--
 package/python-smbus2/python-smbus2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-smbus2/python-smbus2.hash b/package/python-smbus2/python-smbus2.hash
index 65f9eefaf6..b0c9802204 100644
--- a/package/python-smbus2/python-smbus2.hash
+++ b/package/python-smbus2/python-smbus2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/smbus2/json
-md5  5708a6cbf052f45a3ad6dd83c00902a6  smbus2-0.5.0.tar.gz
-sha256  4a5946fd82277870c2878befdb1a29bb28d15cda14ea4d8d2d54cf3d4bdcb035  smbus2-0.5.0.tar.gz
+md5  d832ad65cbf7f58685c0e5647ecc6494  smbus2-0.6.0.tar.gz
+sha256  9b5ff1e998e114730f9dfe0c4babbef06c92468cfb61eaa684e30f225661b95b  smbus2-0.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6ee9cf18c3a75dd76fb549a4b607ae34eedc31a796c48157895e2ad28d66ce79  LICENSE
diff --git a/package/python-smbus2/python-smbus2.mk b/package/python-smbus2/python-smbus2.mk
index c416a55005..fb1d4fc02c 100644
--- a/package/python-smbus2/python-smbus2.mk
+++ b/package/python-smbus2/python-smbus2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SMBUS2_VERSION = 0.5.0
+PYTHON_SMBUS2_VERSION = 0.6.0
 PYTHON_SMBUS2_SOURCE = smbus2-$(PYTHON_SMBUS2_VERSION).tar.gz
-PYTHON_SMBUS2_SITE = https://files.pythonhosted.org/packages/10/c9/6d85aa809e107adf85303010a59b340be109c8f815cbedc5c08c73bcffef
+PYTHON_SMBUS2_SITE = https://files.pythonhosted.org/packages/4e/36/afafd43770caae69f04e21402552a8f94a072def46a002fab9357f4852ce
 PYTHON_SMBUS2_SETUP_TYPE = setuptools
 PYTHON_SMBUS2_LICENSE = MIT
 PYTHON_SMBUS2_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
