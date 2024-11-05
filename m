Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EF3D3176B
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 17:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1364040561;
	Tue,  5 Nov 2024 17:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uJITA4h0Bdnd; Tue,  5 Nov 2024 17:36:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C27844055E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C27844055E;
	Tue,  5 Nov 2024 17:36:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E8E4B3B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9E6560871
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:36:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eP5Lwzpdw7SU for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 17:36:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D4B7D60844
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4B7D60844
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4B7D60844
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:36:06 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-83aad4a05eeso236501739f.1
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 09:36:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730828166; x=1731432966;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0bMhP3s6P6jDuxwEMB021IWysIiikFzdHy8S9uCunKQ=;
 b=INq1x8bR85fM3BXPwRAkY6mBssJUj7XNj0AiwJi3//Yvpz3Dz2GzPYrmRdmuuJXX3l
 Iv48uYunkqB4CFQqa7o426l1UjJyPKYzTvbL9BmuhjYScuQEb/rS4X6qCXgoh+T6IMt+
 7UYrilFpXcFIJXBbl5dXTHc7E/bEFe5aDPn7OqM6YyqzH1AmKrpJGTo8Fe+PstSN/G99
 rEdzep+RUK0sujJaLKeCzWk0Nt88J/LDPiGcItIGpKcgEHBRrkUzs4Z2pq7qxPGehsS0
 vBTuRDN5ZRG0n+xsGsOhMd0UdLbzjx+8Sd5TPhBOcjqI7qs9wcKAMYlQNhr7iwK0aFPt
 tCog==
X-Gm-Message-State: AOJu0Yys8h+B3iQQdn2+w9TCxyoeoheIB8WaUuXdJno42Cvk/LWD3yPs
 O9c/3uUkCZ9iMOTUJLJHwVWXmlNFPTO63knatWqoXGKJt/qwZl662f/r+w==
X-Google-Smtp-Source: AGHT+IFJardUdDjyUmyE8tBbN84R/WG/inl1dk6NC/NnqT6RJf+oBIi54fS5yrH8Ofq7/kU5I27xSQ==
X-Received: by 2002:a05:6602:3d3:b0:83a:b2c1:8b40 with SMTP id
 ca18e2360f4ac-83b567990c5mr2607812839f.13.1730828165700; 
 Tue, 05 Nov 2024 09:36:05 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de049c7e92sm2468900173.158.2024.11.05.09.36.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 09:36:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 10:36:04 -0700
Message-Id: <20241105173604.1394229-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730828166; x=1731432966; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0bMhP3s6P6jDuxwEMB021IWysIiikFzdHy8S9uCunKQ=;
 b=njU5vV1kc5j9u6dWq4Z2BPc0yCBjpaEUksl4Tkh8OAY3fi7ppeAXkZnhqkxRPgvdmN
 ScsTCfABy0FwGGgEo+twSlOaoMzx+q5cq3NBin+qSRgaZb0Pbd5P6xIawQw45pNmA/Cf
 I9r7HqlT0LP8061zRaAzmLuQHjaSNQfLTrqdAfcJXd3xjVR4fuiOHaaHgC2m3SJklunp
 WmJATGzFz5z/Zdp+mZ1ysPrBeeaHsnhSf/XxwSer+t5RkjjyK4lSe8umK6DXn5/ZFo8m
 2dvt5s8gDv1syIvP2xdXcBFC1tLXC0ejOLe2EN1mwXARm6bjfdt9KRcBD9sl9BzHX815
 32dA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=njU5vV1k
Subject: [Buildroot] [PATCH 1/1] package/python-qrcode: use poetry setup type
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new poetry setup type which automatically pulls in the
host-python-poetry-core dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-qrcode/python-qrcode.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-qrcode/python-qrcode.mk b/package/python-qrcode/python-qrcode.mk
index 770befc9f2..8222ceac8e 100644
--- a/package/python-qrcode/python-qrcode.mk
+++ b/package/python-qrcode/python-qrcode.mk
@@ -7,9 +7,8 @@
 PYTHON_QRCODE_VERSION = 8.0
 PYTHON_QRCODE_SOURCE = qrcode-$(PYTHON_QRCODE_VERSION).tar.gz
 PYTHON_QRCODE_SITE = https://files.pythonhosted.org/packages/d7/db/6fc9631cac1327f609d2c8ae3680ecd987a2e97472437f2de7ead1235156
-PYTHON_QRCODE_SETUP_TYPE = pep517
+PYTHON_QRCODE_SETUP_TYPE = poetry
 PYTHON_QRCODE_LICENSE = BSD-3-Clause
 PYTHON_QRCODE_LICENSE_FILES = LICENSE
-PYTHON_QRCODE_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
