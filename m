Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE78D31765
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 16:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AA1B607FB;
	Tue,  5 Nov 2024 16:52:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ALH9eVnuUpgG; Tue,  5 Nov 2024 16:52:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CF68606E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CF68606E3;
	Tue,  5 Nov 2024 16:52:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B0943B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 16:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C64580BA4
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 16:52:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zF2oU2-RO_jD for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 16:52:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 156B880B97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 156B880B97
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 156B880B97
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 16:52:37 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-83aba237c03so225325139f.3
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 08:52:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730825557; x=1731430357;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z8uNVQPrYXV+kBXi7OK8fZEC7T+7juegFeme5mmNqtc=;
 b=rbAMtaS88zM860m8tBSPq1G9BNfRNjZ7SUdNBGgT7VcxJsiuUC5RZWlzObKeCXu9aj
 WmEM7C5qt6MmUWcz2vwWvjy1gRlAi0EO9uXxFQfpoqZdza0qYbdmL3PMgXR+aXZ9SWeV
 GipmRV5Emn84bSq4kPlV3h9VTpHzuy25vCS3F9twz7Ie9MJmp2A2k7SSoclmpFM/m6xj
 SSBK6tWRQkhZsL7Vcf0/xsPhU1B2/cG/mWJCusVVWOEhCnGkRc/09pdJxYr0czQd+yF9
 9QSkZTUtKq2eZiVu2DkKgm9yqGYKzKtv/ix0///iOY1cVXzp4nrIBp0fkEbqwCmr0JJw
 L2SQ==
X-Gm-Message-State: AOJu0Yz+pfSQtB9KbgFbGEn4YWdh24dN0/dQWv6V5PIRzsipivW4ygjq
 yfQuKiFg13Zp92oZIAi69I53/0HRvoEKcylIQSYbOgtMfnmpwmkrceuuJg==
X-Google-Smtp-Source: AGHT+IGrgKTRR2Vcp7aQ/56bUB162xzod8QcIyozUEkiPRfbID8voBu4h296IDT38SUARiQ1ntZIqA==
X-Received: by 2002:a05:6602:1589:b0:83a:a8c6:21ad with SMTP id
 ca18e2360f4ac-83b64fc3438mr1670107639f.7.1730825556729; 
 Tue, 05 Nov 2024 08:52:36 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de04977b30sm2471219173.116.2024.11.05.08.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 08:52:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 09:52:35 -0700
Message-Id: <20241105165235.1384246-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730825557; x=1731430357; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z8uNVQPrYXV+kBXi7OK8fZEC7T+7juegFeme5mmNqtc=;
 b=lCOjsupedw9aymoIgo/jLBNL0dbK3zFvBIkbNd0ae95TP/UU8xJY3CPgjppjZ80Zx0
 deM1Sn8Qlk4CJIQlkPavznbw5LOFWNfkzyOLewcI0r6ar5NnFgEOCWUpptBHgYLOzM9y
 5SvAmVfOyNoSvpAdYDPm+BuBrLYMKtfKZCqbKF5qKn+qcFnIULf2wH0SuCjkPTA5kAZX
 Nb3xLeUZezCZxOCybJz5wZ9oQPv8KjZgemqsPaIYw4Q+Pryh58RXY+hjrJxGoVbIsSIJ
 YqX1Stcf6DvBa5GaJbCglEIjN5vSPLwGcWxrwpDXVnt++Jx2mzFEkunZ68EwK/Wch3X6
 VukQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lCOjsupe
Subject: [Buildroot] [PATCH 1/1] package/python-flask-babel: use poetry
 setup type
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
 Lionel Flandrin <lionel@svkt.org>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new poetry setup type which automatically pulls in the
host-python-poetry-core dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-flask-babel/python-flask-babel.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-flask-babel/python-flask-babel.mk b/package/python-flask-babel/python-flask-babel.mk
index 3970a14db1..33444c71e0 100644
--- a/package/python-flask-babel/python-flask-babel.mk
+++ b/package/python-flask-babel/python-flask-babel.mk
@@ -8,8 +8,7 @@ PYTHON_FLASK_BABEL_VERSION = 4.0.0
 PYTHON_FLASK_BABEL_SOURCE = flask_babel-$(PYTHON_FLASK_BABEL_VERSION).tar.gz
 PYTHON_FLASK_BABEL_SITE = https://files.pythonhosted.org/packages/58/1a/4c65e3b90bda699a637bfb7fb96818b0a9bbff7636ea91aade67f6020a31
 PYTHON_FLASK_BABEL_LICENSE = BSD-3-Clause
-PYTHON_FLASK_BABEL_SETUP_TYPE = pep517
+PYTHON_FLASK_BABEL_SETUP_TYPE = poetry
 PYTHON_FLASK_BABEL_LICENSE_FILES = LICENSE
-PYTHON_FLASK_BABEL_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
