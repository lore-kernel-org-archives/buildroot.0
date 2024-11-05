Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6AED31769
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 17:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E794401E3;
	Tue,  5 Nov 2024 17:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DOHpAVc4k5Le; Tue,  5 Nov 2024 17:52:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DBBB40230
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DBBB40230;
	Tue,  5 Nov 2024 17:52:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D1743B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87FEB401E3
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6sZSXzhq6e41 for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 17:52:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 735B7401D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 735B7401D3
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 735B7401D3
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:52:18 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-83aac75fcceso193093139f.0
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 09:52:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730829137; x=1731433937;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2GLWsOQHG7OXvcaBGdjGI1opHbd++4hiDcBeEGfmeEc=;
 b=RGD4aXCbah09GlLcd9mQdx66cnqcFBkhf54gGJkQJvMUP87PkvJ2fVtEo0vq/ArmPa
 9OVR/OJkrjhVfr5jLOBG6JUZ43Acx0K1bxkj7yjFVyeUnXqsyYHqJGMo5o9G5Q64iKZ7
 H4JDqk0slpYzkxNTlfagKlbGLMNm093MKgVeZWKbOnr/M9U2odFy4viYpu2+pTNm4ILB
 GV42ddzgpG6xxPgc6Xdgx77IF+zHB4WiWsn9nFxFwHx1xMPzJEUdW9JgIK6oywiNfeAI
 Lx9dhAZoGDz9sjpC7V8n6VGVl6GlvQS3uTjfS44NTUcxJ9UL47FWAqGlU60N7P4G+Vrc
 Qj3g==
X-Gm-Message-State: AOJu0YyuCg5ukUxU+aKQOfTYjpYfquVBlOc8ikAanBDS/DYfvsM2H0gh
 h6ZgSUCuBx1UmoWRJrPDPCHMSOb2Jl/xd28EI7BIGh89cLvT4rJ/y/Ihlg==
X-Google-Smtp-Source: AGHT+IHdlom4P0JWl9xGTwZpVzPnNZPRLFQaFDmGt23agIuBewKASXWAlY2vjAPWY4mMZNJWu/oQzQ==
X-Received: by 2002:a05:6e02:216e:b0:3a6:aa59:fffa with SMTP id
 e9e14a558f8ab-3a6b02b808amr151270945ab.11.1730829137253; 
 Tue, 05 Nov 2024 09:52:17 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6a97cf50asm29669615ab.31.2024.11.05.09.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 09:52:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 10:52:15 -0700
Message-Id: <20241105175215.1402819-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730829137; x=1731433937; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2GLWsOQHG7OXvcaBGdjGI1opHbd++4hiDcBeEGfmeEc=;
 b=HZJ+QxNGZt/BDdfjvpmq4MknBm9MCebgj0I5u/mRJqubs5owD9kYQhrl6GECw1+RRT
 vShm8gYFyEoO6I+zxeL4/mIFzxMPmhOi5luyWPeVCQZM1IDq9PcrWgFP+jm8uIrJ2pGR
 zPqiDvWFIj3tnGpADYqbb+rpeJ6IBIkMdySMVR1KZxDWBXXu1Icm/uV68iqvumy8kiEw
 B6pQBAhDZMoZPiDC/HtapsBoLly6G6un7ezvwPybjmjEphUHj85li3/2nff5RwpEeD0k
 tg/v3ea7/8rnlMEHwLnhLntuDKQeKdfN3+myg+XtkqG5VcCY5liIQYp/i8Z2GQliRypt
 4W0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HZJ+QxNG
Subject: [Buildroot] [PATCH 1/1] package/python-dunamai: use poetry setup
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
 package/python-dunamai/python-dunamai.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/python-dunamai/python-dunamai.mk b/package/python-dunamai/python-dunamai.mk
index c3ab45fd6e..bd6c71fd6a 100644
--- a/package/python-dunamai/python-dunamai.mk
+++ b/package/python-dunamai/python-dunamai.mk
@@ -7,10 +7,9 @@
 PYTHON_DUNAMAI_VERSION = 1.22.0
 PYTHON_DUNAMAI_SOURCE = dunamai-$(PYTHON_DUNAMAI_VERSION).tar.gz
 PYTHON_DUNAMAI_SITE = https://files.pythonhosted.org/packages/a0/fe/aee602f08765de4dd753d2e5d6cbd480857182e345f161f7a19ad1979e4d
-PYTHON_DUNAMAI_SETUP_TYPE = pep517
+PYTHON_DUNAMAI_SETUP_TYPE = poetry
 PYTHON_DUNAMAI_LICENSE = MIT
 PYTHON_DUNAMAI_LICENSE_FILES = LICENSE
-HOST_PYTHON_DUNAMAI_DEPENDENCIES = host-python-poetry-core \
-	host-python-packaging
+HOST_PYTHON_DUNAMAI_DEPENDENCIES = host-python-packaging
 
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
