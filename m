Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18606E7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 16:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5D838193E;
	Mon, 23 Dec 2024 16:28:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_MsR5y__okA; Mon, 23 Dec 2024 16:28:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D02918195C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D02918195C;
	Mon, 23 Dec 2024 16:28:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E434ED8
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB8CC60BAE
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfOuBECXiNEp for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 16:28:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CCBBB60B96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCBBB60B96
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCBBB60B96
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:28:26 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3a78b39034dso13142725ab.3
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 08:28:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734971305; x=1735576105;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QuX91jo612OFyf+9uxGAriM8IbPdgEr1GQtOeF08dQM=;
 b=HrLWQ0qb0nU8tUa6591qQChUBUAHSvqVBOeS9+w9/kb1L6qsq4z3wJFrpi6H1f5T+l
 2qiH3KmxqHh/Y2PHo+pwZphl21b4zHhKVvW6ebrnwSdKhh2g7u6vUngqGXoFz+aTemHc
 ybZCtM0nsenBV/Vk9Agv0EZFI11/YeKDG5n3eiibpAwvOo/are8xI6CVUKsCEsd7kqrY
 vNV56JmVxvB8S8LSqAXUUmaSx2QMsef8Kz6GUFlRbmtzzFZZDkRUsY9XMX3O+dDEZ+zo
 7hX3pJjG9CQgxWBKDxjcFUjUoqzV1DHTWEpwSmHcesJkRyngT+AzhXsEpEDASZSrTWcL
 grBg==
X-Gm-Message-State: AOJu0Yw9TkO5eddZGpu/43U2KfbAqtS5Zkurm106xLpZZALgJXEUx0WI
 6s9rpkvI5XmH8Kc+jS66cFQZ0NWgZJ4EhzGgzECcNErlqm6iSRFnz06f/jsqFh8=
X-Gm-Gg: ASbGncsmbUvgJ5jN9En37LZ2OrQ+4GnWN0obyswYNFe1Q4eFoQbvynwv58RrmAQLdl9
 ZWyOqDyEet9WqsgdOr/Tg735+9GTX+NEUbvMngdie03r7A0PBFPK7jPOGiNcJG/Ul8rlddFrQ5B
 rM5N0DnccEsJmtz9bTIPdLlE96Qrc5d7B8KcjTcI8/KDR8/+XNzuXDuim9QIGiX/+pysnt7q86W
 p6YLkw4owseMDqPJ+qyFWSLQ0+kK9ypQt22wPYlaxwApTeEP2bzkbeYUtoD6O6MvS8Re3g/ttvS
 QvwKq5d/+gsUwdnSfR1kNiH6G4Y8SFp2qA==
X-Google-Smtp-Source: AGHT+IHd0dhl1u3GyMzXjMa3Ue0X5lniNEbVccVPbNik8b94D9gVgQcfpuDkwOn0fblRZfQdoOu/jQ==
X-Received: by 2002:a05:6e02:522:b0:3a7:e0a5:aa98 with SMTP id
 e9e14a558f8ab-3c2d2d509b6mr88721785ab.13.1734971305599; 
 Mon, 23 Dec 2024 08:28:25 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68bf684cesm2284268173.55.2024.12.23.08.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 08:28:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 09:28:23 -0700
Message-Id: <20241223162823.1867770-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734971305; x=1735576105; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QuX91jo612OFyf+9uxGAriM8IbPdgEr1GQtOeF08dQM=;
 b=ONboni1t+3zU4bNFA3EXH8sADl6cAzb3jkgCZETMg0UdNEoN94xWy9LK6/vvVAPu0F
 d/+8ROWsAFuC4QdMmJJh8HlwB1fYbmVh3MVRmLOPrFCLKLcMk2yjHr4HOqAk7vymsq0H
 C5NBrxyr9XuH89PXdDfMj+iAnAzHiPE38G6m0BZT5wvzAUXS0gL1Skip8Hgve3dXGLhi
 y3UzASNomkkGVGnNwhRx4zebVXsRlpp1hFlmBBVgcacHUGUE+mUtyXMeWqj85DlIcmWk
 6tCbb//8ktUj1IZ3FsPPqrZQ7vNbtePyBCAuOfrkOtS1Z+iQUHCIL8jLTkKY54cFJULG
 uuGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ONboni1t
Subject: [Buildroot] [PATCH 1/1] package/python-cppy: bump to version 1.3.0
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
 package/python-cppy/python-cppy.hash | 4 ++--
 package/python-cppy/python-cppy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cppy/python-cppy.hash b/package/python-cppy/python-cppy.hash
index 45b78eab8e..73049c6df1 100644
--- a/package/python-cppy/python-cppy.hash
+++ b/package/python-cppy/python-cppy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cppy/json
-md5  7c1f825c43dd66454440932a35b9969c  cppy-1.2.1.tar.gz
-sha256  83b43bf17b1085ac15c5debdb42154f138b928234b21447358981f69d0d6fe1b  cppy-1.2.1.tar.gz
+md5  522447d934d18484cd4cfe90c1872628  cppy-1.3.0.tar.gz
+sha256  da7413a286d5d31626ba35ed2c70ddfb033520cc81310088ba5a57d34039f604  cppy-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  db7a008bff1e63ccec397cfa033109740c4dc6cb12070a70d0cfe69aba27c4df  LICENSE
diff --git a/package/python-cppy/python-cppy.mk b/package/python-cppy/python-cppy.mk
index 5bfd5a0f16..3253956672 100644
--- a/package/python-cppy/python-cppy.mk
+++ b/package/python-cppy/python-cppy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CPPY_VERSION = 1.2.1
+PYTHON_CPPY_VERSION = 1.3.0
 PYTHON_CPPY_SOURCE = cppy-$(PYTHON_CPPY_VERSION).tar.gz
-PYTHON_CPPY_SITE = https://files.pythonhosted.org/packages/c5/7e/6cc5acd93752ee52d2f0423046072a2ce3ae16dfcd44373b9fe2a0222204
+PYTHON_CPPY_SITE = https://files.pythonhosted.org/packages/1e/84/62a09daa04e732a5763ec22dbc11b988e5140a77b418ea70bba9ab1a77a5
 PYTHON_CPPY_LICENSE = BSD-3-Clause
 PYTHON_CPPY_LICENSE_FILES = LICENSE
 PYTHON_CPPY_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
