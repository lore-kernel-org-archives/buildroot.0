Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124B3D0BB5E
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 04:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDEB5402A3;
	Thu, 24 Oct 2024 04:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4m4QreItIlC4; Thu, 24 Oct 2024 04:56:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7669402AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7669402AF;
	Thu, 24 Oct 2024 04:56:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EC88972
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 752AC80DBB
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZk_iwwh9ps9 for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 04:56:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 86B5F80DB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86B5F80DB6
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86B5F80DB6
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:56:45 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-83aa3ced341so21192639f.0
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729745804; x=1730350604;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8StTfn4sZZ0sn0pTfldPvGcxeWGqKjMWy7GnIqA5Dh4=;
 b=s1jmd1oVmbmJkNwqaJawtcRqnS3NOrI1zJUuzUsdmmPIuicqz9TQXjsiq7Vq25CCwt
 wFcnVD91CNDhMmxoNxK01cmKqCGFoZ0gVFZXuHItSs0rE5+VhKJBoZNvAZrgRydZoX3y
 QyWN1Y2UiflPnSmKwGtGuR5kVYtQJ42vOl+gYS8gbbIgwtCfvVUlJu03fxYuLIxQ+JDr
 M0kgGPlql2732/I6JrKbp28ISB4nuHW2heXGzBAbSM7xVO06QK3P9MiCDnfZsmtIAPmb
 3/1BWv9Ejj3BqHv4Jy/GbVnmbRksZf9shEH5KkmQxSer0V1UAOj2VR+Z0n+0Fuz+Ihs0
 +Qcw==
X-Gm-Message-State: AOJu0Ywtgu793G0ufCQcADAr3VuKBkC+ZWDM9HrPmLAD7hC3C5hTj3hM
 D6dxXB1SzHmpKcYV/28NYSk0N6YZ7Zvi69NyhOup1wjnbZpNvbNlHM7JnA==
X-Google-Smtp-Source: AGHT+IHRG7nX4P1FafcERtMfHPd5sSpDmGLFkxvP8JmIeiWyM0qr7tXeZX+6sIgQOnJHKy2WKU32yg==
X-Received: by 2002:a05:6602:6d06:b0:83a:b7c8:a3dc with SMTP id
 ca18e2360f4ac-83af6155cccmr450790639f.1.1729745804145; 
 Wed, 23 Oct 2024 21:56:44 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83ad1c6471esm259885039f.22.2024.10.23.21.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 21:56:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 22:56:40 -0600
Message-Id: <20241024045640.3381427-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729745804; x=1730350604; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8StTfn4sZZ0sn0pTfldPvGcxeWGqKjMWy7GnIqA5Dh4=;
 b=GBLyrFJG4mWWNnmXYngto7MhDvqQ+2izSsXcnTp9rOtM6uuuvayeCzyjwqpw2+V989
 I+isjdRomOqUaTczGDoRcJmmQyyGnnAeKRwqWtPwUErnue2sadiGg2wQHkklsh7t+weg
 AoEozZGSZcN8pvHH7mh5/TYXP+4D1e4jgcVIKQk2zo4Uc6KNol5yW0HCY/G3TgCOKFwT
 oEi23WFzsLFz5MowFuMQ6l+629j5EM5IEZMp7kwv30p5ImyNr1uF4MjwqA82+EtU53Jv
 yT+O88o/d2bnBPs/8/WKVLWTBK5REr45bbhAoCyfDMexh3sgQQYzDEHsbYaqrtxxUJ1H
 yZJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GBLyrFJG
Subject: [Buildroot] [PATCH 1/1] package/python-uvicorn: use hatch setup type
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-uvicorn/python-uvicorn.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index a80927643b..35eb6f42c0 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -7,11 +7,10 @@
 PYTHON_UVICORN_VERSION = 0.32.0
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
 PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/e0/fc/1d785078eefd6945f3e5bab5c076e4230698046231eb0f3747bc5c8fa992
-PYTHON_UVICORN_SETUP_TYPE = pep517
+PYTHON_UVICORN_SETUP_TYPE = hatch
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
 PYTHON_UVICORN_CPE_ID_VENDOR = encode
 PYTHON_UVICORN_CPE_ID_PRODUCT = uvicorn
-PYTHON_UVICORN_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
