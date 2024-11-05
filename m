Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA82D31769
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 17:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 139DF8118F;
	Tue,  5 Nov 2024 17:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uwwp5XTloTNI; Tue,  5 Nov 2024 17:21:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FE4B81193
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FE4B81193;
	Tue,  5 Nov 2024 17:21:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FDD6723
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C2F8406EE
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8g95cKyunrDv for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 17:21:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 43B4F406EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43B4F406EC
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43B4F406EC
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:21:07 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-83ab21c269eso213974939f.2
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 09:21:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730827267; x=1731432067;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+WZXAb1v22Uir2A2EXo4d6W65V/bHNweIeIslaK+cow=;
 b=ce/4+RZIeLgTbxYaOXX9sxXjnOCpB8PJ4NjWUV9Zzigz5MdLBtsreyFJ9qADhmxIw4
 /84CmenObqyUd70jkmn6VPNyAwAv0O90q4MKPKYjUP5ZkpYGWAR/6YKYM9MgZbB5HDo7
 YDDm88CfSr/I052FhFF62BKBf1+HzztCsx547Q0ObWjiaSUcVvTvsr1SMwx0RvgdPrI+
 csNqrITMAGhM45Kg0FnNt4oGJ4JAmg42SLuFsAlNLe9AnusYxdChLIXbB2KKZcKNWEwV
 lRw9npG8+vQB09O9RQajGmsPLzbjVZz7sWcgrcHpn0ExK9Ca+BN0qPsnNc2LZ2SGcQX3
 MoyA==
X-Gm-Message-State: AOJu0YztIq2sy5JYASve6tVVSgpAuOgwHLjDtVpOASh/vYPKSbLfeNKD
 MV29p9WU7WrOZIjUReNjGXptxwQ0nWZme8MAMRnPgplov57UGj6UVNDY8A==
X-Google-Smtp-Source: AGHT+IFWRbK1A3KH8y08eBifvPRGFiL9Svzr9coilNZ7u8dUXA0LK2AFJqXxvxr3yiLbmxV893L1hw==
X-Received: by 2002:a05:6602:168e:b0:837:7f1a:40af with SMTP id
 ca18e2360f4ac-83b719edb9bmr1798386339f.14.1730827266922; 
 Tue, 05 Nov 2024 09:21:06 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de04977869sm2485708173.118.2024.11.05.09.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 09:21:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 10:21:04 -0700
Message-Id: <20241105172104.1388308-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730827267; x=1731432067; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+WZXAb1v22Uir2A2EXo4d6W65V/bHNweIeIslaK+cow=;
 b=BndRgLd/GED0Q4iT/wZaIgDsgnKEcMuJ/8oo3Hs6B8qNkkj+5u/5QMp1/tsraowvkW
 kDOv1YpRS7v9CplaiPITy4RXd9nkmRVeT1P8uGRFJoBDEflN9ZCNwsWtKpGgqfOFRUBq
 zPALIS3W6LzqX6Od079OFMx66ZjivIvC49rGLYbDDx/XWo5gTS9QdShjJFjcC5k4CW5s
 bA37OSwCSMsaPxvLFAd6/AIDHgy6vG1fpmTw65X5/50POt0WOR740HAyYADTR43adH+T
 9yAR23c+d1L7RN/Ut8l88pY0CEIvNKqIyglY7cDu8D6qbYjmISaCqQ3YLT3eThAgWosO
 1llQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BndRgLd/
Subject: [Buildroot] [PATCH 1/1] package/python-iso8601: use poetry setup
 type
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

Use the new poetry setup type which automatically pulls in the
host-python-poetry-core dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-iso8601/python-iso8601.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-iso8601/python-iso8601.mk b/package/python-iso8601/python-iso8601.mk
index 080daa4693..3676e9e93e 100644
--- a/package/python-iso8601/python-iso8601.mk
+++ b/package/python-iso8601/python-iso8601.mk
@@ -7,9 +7,8 @@
 PYTHON_ISO8601_VERSION = 2.1.0
 PYTHON_ISO8601_SOURCE = iso8601-$(PYTHON_ISO8601_VERSION).tar.gz
 PYTHON_ISO8601_SITE = https://files.pythonhosted.org/packages/b9/f3/ef59cee614d5e0accf6fd0cbba025b93b272e626ca89fb70a3e9187c5d15
-PYTHON_ISO8601_SETUP_TYPE = pep517
+PYTHON_ISO8601_SETUP_TYPE = poetry
 PYTHON_ISO8601_LICENSE = MIT
 PYTHON_ISO8601_LICENSE_FILES = LICENSE
-PYTHON_ISO8601_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
