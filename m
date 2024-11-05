Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB97D31778
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 18:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EDD94060F;
	Tue,  5 Nov 2024 18:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKa6rXvZ83Oa; Tue,  5 Nov 2024 18:07:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F028A4061D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F028A4061D;
	Tue,  5 Nov 2024 18:07:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D162723
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEE9E80B47
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MIl876_TpbFj for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 18:07:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2A0DF80D08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A0DF80D08
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A0DF80D08
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:07:02 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-83abcfb9fd4so215217639f.3
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 10:07:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730830021; x=1731434821;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ljLh5wCsZB4cw0RIJVvrWFPOT8MOpsq8IKThatFMAZM=;
 b=wlEk8OyM6wAE2cGUH6bQ97r5HuS9MjrtBcofx7TkbfrXep5gE0OWyvxbtwN2qS0vUp
 XEBdyD+h6e6kWPqnm8AYAS8A4rTYNCASK1/VtTRYry5ByOBKU4SI/gqXpumUXFTt6Yig
 r0mD8bQ7YFdzbG6Jue6PNgg5EbSiYDXgml26tT3s2Htoa3gdAx9p3BEgAQ2N02GtMx0h
 lK/BZjP6V9FKTvsc7E6MlWcdd0sHOtvojwP6+uQ11hg08LV14VEbtBOxYmR8MF5O5AFX
 wKZjJtXt91iZicYo9OrrnnnChvrdXGVVOqRUH201fl1o8Z3u6vM3xcQUmVOtFXVeJOEF
 YYOw==
X-Gm-Message-State: AOJu0Yw1ZLcSB2hLk9Lfjx8VLZoDZXFgCXm2TrD6/9G4UadMZs0gZ+77
 DN4hCiHL/AQsjdwvOBIUxPygcMgOSA8qUN6aIiKOk7r0Vfj4f/GKTvVb8Q==
X-Google-Smtp-Source: AGHT+IFcSTW216PVLzdg5LojzqURYhP0OA4dYPa3vAYRVNoUq6pIGKimJjshs2+jgBh2eLPFtLjOAA==
X-Received: by 2002:a05:6602:6015:b0:83a:b33a:5e0a with SMTP id
 ca18e2360f4ac-83b71947e2emr1654731639f.4.1730830020818; 
 Tue, 05 Nov 2024 10:07:00 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de04887f94sm2479478173.31.2024.11.05.10.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 10:07:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 11:06:59 -0700
Message-Id: <20241105180659.1409805-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730830021; x=1731434821; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ljLh5wCsZB4cw0RIJVvrWFPOT8MOpsq8IKThatFMAZM=;
 b=a8FHZLE4oOyLUHI9NWapn1gif0TQuAb8GKQicRxfSjRegxyyJWnlmQ2J9HdZQzCr3Y
 Zca2MOa0ygOp9BSMLOEDeq1kRoKr7aZ9Jk9gDewlbbViWR36k25f0jCKk2/NNcBya8Oo
 FhNo7z/+h71cfIeHphpf87lSiX0e58tgxqW4ePMi94UTPPcBOEy7c5m/orE/AaiDkF7z
 i7QfT64Uvm3Ex+bEQYUMmSBNhnoDzLF5PaHRih3sFbQ6GIhD4YRZunZ5OmZ35syJL3fd
 G3kEABMgfrxPRf77FF5eoyOMPn8gf9oIxX74eDAd7EwuJRsUjTxYhbYutDX0UAeLmUR9
 l25A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a8FHZLE4
Subject: [Buildroot] [PATCH 1/1] package/python-pypika-tortoise: use poetry
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new poetry setup type which automatically pulls in the
host-python-poetry-core dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pypika-tortoise/python-pypika-tortoise.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.mk b/package/python-pypika-tortoise/python-pypika-tortoise.mk
index 751c7ad6da..ba4845e100 100644
--- a/package/python-pypika-tortoise/python-pypika-tortoise.mk
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.mk
@@ -7,9 +7,8 @@
 PYTHON_PYPIKA_TORTOISE_VERSION = 0.2.1
 PYTHON_PYPIKA_TORTOISE_SOURCE = pypika_tortoise-$(PYTHON_PYPIKA_TORTOISE_VERSION).tar.gz
 PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/30/af/b4a6035611cf6f3990879385cf6d077013c1bdf7ea294d6ceebfa14c8d08
-PYTHON_PYPIKA_TORTOISE_SETUP_TYPE = pep517
+PYTHON_PYPIKA_TORTOISE_SETUP_TYPE = poetry
 PYTHON_PYPIKA_TORTOISE_LICENSE = Apache-2.0
 PYTHON_PYPIKA_TORTOISE_LICENSE_FILES = LICENSE
-PYTHON_PYPIKA_TORTOISE_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
