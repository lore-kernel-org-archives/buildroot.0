Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4B8D31765
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 16:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A681606D3;
	Tue,  5 Nov 2024 16:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQLGcCL1pZWj; Tue,  5 Nov 2024 16:43:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27E44606CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27E44606CA;
	Tue,  5 Nov 2024 16:43:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 98A7B3B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 16:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7911660634
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 16:43:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c4iDpQcfqgVz for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 16:43:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9162B60658
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9162B60658
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9162B60658
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 16:43:53 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3a3c00f2c75so20113775ab.2
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 08:43:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730825032; x=1731429832;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3b/CDwX0nWLOY0k2jxmSR/sxUBJJs4a7Wnvzu5jFkt4=;
 b=VBmTTNGRLas2yskofD2TBdjPHwPORW6yAPL0toRb5NOS0om7wq/QLaEXV2RynIXNOJ
 aRacQkH/Qb3kIMTg5bSy0nUlQQMaQDJN5irBfDMJjfQ97D1xhIaQHqcRhCOpR98wdPyx
 xbkXBEg2PKHOaHg3lJw0fV98GzZ0WVTowyneuehWJVb1YPeRUJ4OfhxUTy2wl64IXgqh
 qwqg2Ue4dFA8Zi8oDztFi3Mjjbw63ZymdrVL3lLYFzbYDemaJgzeI7QXPP3xyTYBzeKF
 fKJKBTmZ76AjZCShrHmsnXFJpbSDy8riesnK3IixPP4bKyG5flwZaAB+gKkct8Q1GM0N
 qakg==
X-Gm-Message-State: AOJu0Yw5OHiQWdlQp7Ae1Cs3Pp532JKOByyjDr0uD19BPdjR00IymNV+
 msQ+bq6OUboJvct5E0BoKL9JJYNhUSSjKBBsBRsj4iF5Wvg98qJaJ4yhIQ==
X-Google-Smtp-Source: AGHT+IFw9RPyK19k9tgY4XyCwtFeQfco19y6P/ZZEs82a9oGLTIZtMBGE/ScMKT1VA8oITky9TPhSg==
X-Received: by 2002:a05:6e02:1c82:b0:3a3:94c5:e178 with SMTP id
 e9e14a558f8ab-3a6b03cc3b1mr171295895ab.26.1730825032258; 
 Tue, 05 Nov 2024 08:43:52 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de04977a8bsm2511089173.103.2024.11.05.08.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 08:43:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 09:43:50 -0700
Message-Id: <20241105164350.1380330-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730825032; x=1731429832; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3b/CDwX0nWLOY0k2jxmSR/sxUBJJs4a7Wnvzu5jFkt4=;
 b=Tmpz6hXNFF1iyN1b0EY1m32/wujdVGm2TGe1jeG/62myBPn830W/qlHvlbI6rFCdNc
 2FYR0O5zWYJ5Pg97agPNgV7KZ/rVEP7MtrHyJvs+RfHaTuAV7b/7N69JIn8Z2sotS3Ff
 7M2xcPF8cDzXTrhnVmsB2vyl9VCJZlLAIaHiA0J2KJMpg4A7JljWeOzGcUjNsdxxdy3F
 VoClTHN2r8nrhzjmsOh6bpRo1Hiws0gQFD7KJqAFsFmUp4Qm9/+x+I7gBzcuLZz54b+R
 JBRPZC2V4HWNyzrD2E8znIdZhIjJI5ksnSl8rkuY0HJlMkERT7cPRDnmz4llY0C5EtRw
 idFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Tmpz6hXN
Subject: [Buildroot] [PATCH 1/1] package/python-poetry-dynamic-versioning:
 use poetry setup type
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
 Fiona Klute <fiona.klute@gmx.de>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new poetry setup type which automatically pulls in the
host-python-poetry-core dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-poetry-dynamic-versioning.mk                       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk b/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk
index 31567380ef..e159e80324 100644
--- a/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk
+++ b/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk
@@ -7,10 +7,10 @@
 PYTHON_POETRY_DYNAMIC_VERSIONING_VERSION = 1.4.1
 PYTHON_POETRY_DYNAMIC_VERSIONING_SOURCE = poetry_dynamic_versioning-$(PYTHON_POETRY_DYNAMIC_VERSIONING_VERSION).tar.gz
 PYTHON_POETRY_DYNAMIC_VERSIONING_SITE = https://files.pythonhosted.org/packages/dd/70/1138211a6e5051d28596922ed39acf20b42819db5ae1f93e465b9a903c28
-PYTHON_POETRY_DYNAMIC_VERSIONING_SETUP_TYPE = pep517
+PYTHON_POETRY_DYNAMIC_VERSIONING_SETUP_TYPE = poetry
 PYTHON_POETRY_DYNAMIC_VERSIONING_LICENSE = MIT
 PYTHON_POETRY_DYNAMIC_VERSIONING_LICENSE_FILES = LICENSE
-HOST_PYTHON_POETRY_DYNAMIC_VERSIONING_DEPENDENCIES = host-python-poetry-core \
+HOST_PYTHON_POETRY_DYNAMIC_VERSIONING_DEPENDENCIES = \
 	host-python-dunamai \
 	host-python-jinja2 \
 	host-python-tomlkit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
