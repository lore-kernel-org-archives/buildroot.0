Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0E3D31769
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 17:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D39A540691;
	Tue,  5 Nov 2024 17:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jeYrAqBFhFeC; Tue,  5 Nov 2024 17:19:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A04BE40692
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A04BE40692;
	Tue,  5 Nov 2024 17:19:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E15A723
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49028608C5
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:19:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7jXB5ZRh4w-9 for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 17:19:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 64AA7608C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64AA7608C1
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64AA7608C1
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:19:12 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3a3f8543f5eso61145ab.0
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 09:19:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730827151; x=1731431951;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tibc9z1vca4pQsn7KN4ZyHMm61hbyXJW8hndDT2VrWA=;
 b=etxsq9kxhF47vrk6E0cHna0Sieyq3BBgdhq0Mhg4aV0+hHEPGnC4l3gWIi3f0LM5Sm
 90TSBHinh/P5qh8BNUS98CMVwNCraRKVLpNph9QLxKkW3Aubyg4eHi9ifF6T1823bkTq
 v6Jzwclbksnogx9EbY780U2MsOcuMeaUea745TO/SzBmvuu5LWLE1agIJh0kDgFTeamy
 uVlzLJK8JP0TEm6pvIsKyzhyUISnothTpwiJ3CnVPBpM1rHuzF3Qybw5bnkdRsgcAhC9
 w3UooFlQtrcWxKV0BRRCzossxegn9PobQQsuHDlYDA2zgYcN0fJQoEOg0vCKHm7F5G2G
 dmTQ==
X-Gm-Message-State: AOJu0Yz5ZoRIBe938NLAUmCWzjsDIjrm/oIW8VaeUuFc9tPl+ZM4hIlt
 jRiDMTkjSl0KZe5AGG8xeOFaR9ceKgNgbTXbcFf5jqXmN5nSQytqsy143Q==
X-Google-Smtp-Source: AGHT+IHP6DjklPLmmFMzuHb8r1LovF1vN0I7h5B+XZQjsg0qNSY95zQCXYuwsMwnFLDaoFFCP3uwBw==
X-Received: by 2002:a05:6e02:1fc6:b0:3a6:abb0:59a0 with SMTP id
 e9e14a558f8ab-3a6abb05ca3mr158264455ab.0.1730827151105; 
 Tue, 05 Nov 2024 09:19:11 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6bd2da409sm20820675ab.57.2024.11.05.09.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 09:19:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 10:19:02 -0700
Message-Id: <20241105171902.1387084-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730827151; x=1731431951; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tibc9z1vca4pQsn7KN4ZyHMm61hbyXJW8hndDT2VrWA=;
 b=d9L4ic/hJQPFaM0PzMwZpjj4qFELyUZ2MpCsWftMufp4wb4fr/qFypPCX5dBj62H0y
 HPCL782hsWctgOZdiMqXyQ3DgMP7HzbCerxBdMzklfzxhh3+bZqd+67ny1QSaemiqClr
 eaxKmQqRKfcxtLvvhGD49u+e1fnsRVpuMYdxkdXwQb86j/tu5iL2/owAbAyodag/1soL
 FMrN9d1BloryyvIKxQ6MJHlDMd4f+htc4j0KEhp3avTsrFdGCqA8zjDdXAlc8yVz9G1M
 VkxQpzrXw/jciVQqacllrtY/n2CZSHksdsCGRbpq7KjqSZtocuZdDjZofyhycLI6p90M
 ieeQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=d9L4ic/h
Subject: [Buildroot] [PATCH 1/1] package/python-bleak: use poetry setup type
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
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new poetry setup type which automatically pulls in the
host-python-poetry-core dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bleak/python-bleak.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
index 5cb42aa2a5..f47440388e 100644
--- a/package/python-bleak/python-bleak.mk
+++ b/package/python-bleak/python-bleak.mk
@@ -7,9 +7,8 @@
 PYTHON_BLEAK_VERSION = 0.22.3
 PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
 PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/fb/96/15750b50c0018338e2cce30de939130971ebfdf4f9d6d56c960f5657daad
-PYTHON_BLEAK_SETUP_TYPE = pep517
+PYTHON_BLEAK_SETUP_TYPE = poetry
 PYTHON_BLEAK_LICENSE = MIT
 PYTHON_BLEAK_LICENSE_FILES = LICENSE
-PYTHON_BLEAK_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
