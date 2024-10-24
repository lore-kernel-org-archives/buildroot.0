Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF3FD0BB5F
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 05:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DEE481142;
	Thu, 24 Oct 2024 05:14:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4o7OW6dHPcqY; Thu, 24 Oct 2024 05:14:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 544248125A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 544248125A;
	Thu, 24 Oct 2024 05:14:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3455B2073
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F42540764
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:14:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qGQ3_m3GuPOq for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 05:14:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1E1B84005A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E1B84005A
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E1B84005A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:14:03 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-83abe4524ccso21413939f.1
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729746843; x=1730351643;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TPME92hLeGyg5OLKX0iIgAjpdwBmniSGvfPhNQgCB/c=;
 b=djfF1h/fVb07UtfyLIWgEJS2z9L4MZfQQ1qD4FMKVj43Am/tOGqHS9Gkfixk3l61rD
 ub3ysXQbZaP7IiU6EKSd+LpsmFcCzJ7w0tzeRmssO7Q9g8JJi8z7Jv7t4EDajb04v9ZI
 jZG2agwtqSzPNaHB7u7nkIkrW07qyb4KcNnH1e9qCQ8uSkcIl9uS57utsnBdv8uu9vJr
 6DOLxZ40M6aNovJUABm6OkcxYibIDZQTp7HrB4SnkJvOwZ5UcTa7qJRGvfVnxNn+Cw6q
 IiZ+YHjmbR9NRoZ5eTfm/rBKupv2WCpnyaNP0sAwjuzkshJShLV8LgxA//YhvfZL8tnO
 +Bhg==
X-Gm-Message-State: AOJu0YwwLopFv8WeIA1NC0NLi6kn5yeCSQXC736IwgN1cmop9INnuT8h
 z69CiN/6E2M7B39Prm0/mjrqb3G5kZV8IAVVvcQ6j0hXYHbGCjSJ5Z+Q8A==
X-Google-Smtp-Source: AGHT+IHrI8q9fisgpoDFU+lrJOQqOh/oQ7o9VBpBuw4jiN45uo8JCTdFFRo87wYH2gKqOfbdhAWx5Q==
X-Received: by 2002:a05:6602:641e:b0:837:7f8e:dfe2 with SMTP id
 ca18e2360f4ac-83af6145fddmr515274039f.2.1729746842816; 
 Wed, 23 Oct 2024 22:14:02 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83ad1dced87sm265357539f.44.2024.10.23.22.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 22:14:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 23:14:00 -0600
Message-Id: <20241024051400.3392255-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729746843; x=1730351643; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TPME92hLeGyg5OLKX0iIgAjpdwBmniSGvfPhNQgCB/c=;
 b=RjCB5Jkl6wkkNYIq5iOTM5IoNpw+DRAM+hT1w9qsYMy5vYzQ2fgqtiRamfEzEoOrlY
 XNFBRVm/+Enrnm3QvQBt+STra0wONKsHV/nOfkqZ9VtknOrD9SLRIYuk5yMRTw2OC7UC
 I2JHSH/FpaLa2yFf47ztYkoKZdNQYW1qlfs1Yus9cZpQvV5uaklh6RajBZqpXzNI9GCm
 0ntH/DWRTx+d696HjsVGYMLe9hW+D3UgHh+ZthKZB74MAPITOsfvzHjuUgHaJn6G/qoJ
 1y8+OzLK+9zosyIiEcJb8jo+caD01i8c8bOTFbDad0gOsTtYuXrM4ar+g5Ab+AOKNuRX
 Nm/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RjCB5Jkl
Subject: [Buildroot] [PATCH 1/1] package/python-flask-wtf: use hatch setup
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

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-flask-wtf/python-flask-wtf.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-flask-wtf/python-flask-wtf.mk b/package/python-flask-wtf/python-flask-wtf.mk
index bb32d55e25..ffc27079e5 100644
--- a/package/python-flask-wtf/python-flask-wtf.mk
+++ b/package/python-flask-wtf/python-flask-wtf.mk
@@ -9,7 +9,6 @@ PYTHON_FLASK_WTF_SOURCE = flask_wtf-$(PYTHON_FLASK_WTF_VERSION).tar.gz
 PYTHON_FLASK_WTF_SITE = https://files.pythonhosted.org/packages/9b/ef/b6ec35e02f479f6e76e02ede14594c9cfa5e6dcbab6ea0e82fa413993a2a
 PYTHON_FLASK_WTF_LICENSE = BSD-3-Clause
 PYTHON_FLASK_WTF_LICENSE_FILES = LICENSE.rst
-PYTHON_FLASK_WTF_SETUP_TYPE = pep517
-PYTHON_FLASK_WTF_DEPENDENCIES = host-python-hatchling
+PYTHON_FLASK_WTF_SETUP_TYPE = hatch
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
