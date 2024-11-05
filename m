Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D49AD3176B
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 17:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BE8740284;
	Tue,  5 Nov 2024 17:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3_HMteRmbfpf; Tue,  5 Nov 2024 17:46:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2067D40294
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2067D40294;
	Tue,  5 Nov 2024 17:46:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C0EB3B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 499A540224
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ITJmtit6V2m4 for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 17:46:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1B06A40042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B06A40042
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B06A40042
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:46:44 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-83abc039b25so225939739f.0
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 09:46:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730828804; x=1731433604;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dJ71W/OWlEx6/HJJ+yxZZrSqNwBQp6PY/GS7+Wy40/8=;
 b=BP++u7KGA20NHNl9Y6IXuY17jQFEFTdXEX+OwOCpt8T7RFeT8ap52f6DrAQElNQHJI
 mmlxf7MbYXcbxEdrg5REl8DZIW6XZJGpF9NOGhqH/AgjEllXUrU8Tlx6+YA4zBvkwzej
 SpNCQLW0sc4PBv5CoaPf7FidRyDLbd24zKpzeHwVv2uJPPlVbo2geXb2IFkc+B7Kql4H
 9bM9X7mLWbooJrG51Pc4gA6K1eN4PAh8g4gzpjGaNMMpioO2Pisv/YOKX04bzj1MmTP6
 3JD03t5RJGHway42AjqvaB6WoXms4ndAfta/fOXxre2MJl1z0+7zmUzApMwJvI8DIpQI
 uHlg==
X-Gm-Message-State: AOJu0YwP1v9BrKU+GA590JVMC6D6tkPX0G46pvUbizhFL5N9rbFtyZ4o
 OeZDf7ogb/wYZF7o3a0RTIZhWZB62igoFZSUMghR9pV42iyx6ELsrGRo3g==
X-Google-Smtp-Source: AGHT+IHA9mz8RJdt7mk/CvxlDp7AltCZwSkmjSTNi+OTcbMOzHbThdTvm+BR3px+5fFtE+81zmnIzA==
X-Received: by 2002:a05:6602:3fd5:b0:82a:9cab:9be1 with SMTP id
 ca18e2360f4ac-83b719f080amr1513458139f.12.1730828803897; 
 Tue, 05 Nov 2024 09:46:43 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de04977a96sm2453051173.110.2024.11.05.09.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 09:46:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 10:46:42 -0700
Message-Id: <20241105174642.1398998-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730828804; x=1731433604; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dJ71W/OWlEx6/HJJ+yxZZrSqNwBQp6PY/GS7+Wy40/8=;
 b=iCDGWk+v1dxo7OWyGDP1nOfwVjh7lMj45SCwJyIlDw8zcmBNb1MYyLXpVofSHhZi0F
 xGnnZFVq3KYoQFWOHvdh98JJKshqgIGIbEmpIS4jn8UJxuO0SCA3xTeBmDglFP3SLoT7
 N8+s7IMN10aKuzesnLcc8JWPUWUouap6jGY1EykUyc/LjFLLoTzzzCR9+wzaM6ii9I1T
 /qVyTT23gxZNEy2NYckCb9qFKXbQK1Fo/D1U9mT4v3rtm2gWzJAWi8ODyDpJpqzPyUIB
 xqsPpKYz1vPBqyXLIysu6GvhrMg+WzjBBWyr0QyLb8jDGlPu9LLCFyQu+U/TqoEXO8D1
 k7qg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iCDGWk+v
Subject: [Buildroot] [PATCH 1/1] package/python-terminaltables: use poetry
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
 package/python-terminaltables/python-terminaltables.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-terminaltables/python-terminaltables.mk b/package/python-terminaltables/python-terminaltables.mk
index 062643adee..900a577f36 100644
--- a/package/python-terminaltables/python-terminaltables.mk
+++ b/package/python-terminaltables/python-terminaltables.mk
@@ -7,9 +7,8 @@
 PYTHON_TERMINALTABLES_VERSION = 3.1.10
 PYTHON_TERMINALTABLES_SOURCE = terminaltables-$(PYTHON_TERMINALTABLES_VERSION).tar.gz
 PYTHON_TERMINALTABLES_SITE = https://files.pythonhosted.org/packages/f5/fc/0b73d782f5ab7feba8d007573a3773c58255f223c5940a7b7085f02153c3
-PYTHON_TERMINALTABLES_SETUP_TYPE = pep517
+PYTHON_TERMINALTABLES_SETUP_TYPE = poetry
 PYTHON_TERMINALTABLES_LICENSE = MIT
 PYTHON_TERMINALTABLES_LICENSE_FILES = LICENSE
-PYTHON_TERMINALTABLES_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
