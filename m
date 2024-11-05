Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05DFD3176B
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 17:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B49A0811A8;
	Tue,  5 Nov 2024 17:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HZOmTfS1kP9o; Tue,  5 Nov 2024 17:23:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7E55811B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7E55811B3;
	Tue,  5 Nov 2024 17:23:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A8A1B723
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88F6040704
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:23:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VDcEZn3MvbI8 for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 17:23:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8FBBE40702
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FBBE40702
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FBBE40702
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:23:17 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3a3f8543f5eso76515ab.0
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 09:23:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730827396; x=1731432196;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1kmWHiCXNtX2TgEV42JISo3W3teVCTpotRt81X70444=;
 b=OdU5ukIABMQxBGc3lKoxY8ZGY84YIc/UGPEI+R4hCUZR1Jz+cMl45LO/v5YS3Nve7+
 WrEm+e1/fblL5+SpG1r022sZgtgmZh1b+a7AQwBO7yM+ZF9SyXyyyAwawO5CNqeqBu3B
 OwnMo97c09W7mGgAokxn5OfSwBh/Ip1LnQ9yDj9C7W4YsbW6bQ1tLsbksgkfkHbNlJlv
 cIbF4ElJGs2Gl7ChgBp18Uy/vaoG0pwIgmbpu1Aq4f0og5vhYm/KFlzfedCA8VT/Kg8Q
 Y6imRwH3gCTyMiEA/eaRQkXSFFNTRfJJGH0zAQritWpkinTvCj6lWm4eJ0vzu8INoWQs
 npvw==
X-Gm-Message-State: AOJu0Yx9GDJf4gj1tJ4XcZirP3ajhHmxOfga/UBjfD2HB+DuiyvpSBQA
 zzxOWAbwUeTLiqQ9NbjrZZELqEoFUz/drZzANVGP6WQNTAAxWaTSBMalsw==
X-Google-Smtp-Source: AGHT+IEQHN8UDb/EJtOAbsmy0O1FTW5IpkzdsSSWmPj82fczXIX0BOZq/klfwK54aemzG/VBTzqUww==
X-Received: by 2002:a92:d10e:0:b0:3a6:bafd:5650 with SMTP id
 e9e14a558f8ab-3a6bafd5803mr114322545ab.10.1730827396393; 
 Tue, 05 Nov 2024 09:23:16 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de049a446fsm2510254173.144.2024.11.05.09.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 09:23:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 10:22:51 -0700
Message-Id: <20241105172251.1389497-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730827396; x=1731432196; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1kmWHiCXNtX2TgEV42JISo3W3teVCTpotRt81X70444=;
 b=XBLVVlLjFjNXTQOxOj1dywlbXSjNzDfROxI/SZv5QCPJG/YFqdIoTK74i3YNRFcDds
 bMJEYJ8njK8k+l8AqWqyymdFGBWZjAr5I0rsUKBvJmHQwsGT/bH/Orq4DHaBcgW3TdJS
 6zsknyXehvghhSQhJ70ZWzrUBKqzDCGrS38ageIWnMogAO1czlYkEPHetIw+bdnddeYo
 sb7slTGLAYnwCgVX6ND/37xI6Ubx/JnD2uSWlL0LI49F9uoRADfPzN4+EdWvLA963bRN
 WQBV/uFElLYmg9tYAbcU6M4RGkdkij5A0zhU3lrgaQ3dn0Sq6qzqpLeMMdZxOGgulnph
 1pjA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XBLVVlLj
Subject: [Buildroot] [PATCH 1/1] package/python-immutabledict: use poetry
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new poetry setup type which automatically pulls in the
host-python-poetry-core dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-immutabledict/python-immutabledict.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-immutabledict/python-immutabledict.mk b/package/python-immutabledict/python-immutabledict.mk
index 4d782aace6..99089f0d6a 100644
--- a/package/python-immutabledict/python-immutabledict.mk
+++ b/package/python-immutabledict/python-immutabledict.mk
@@ -7,9 +7,8 @@
 PYTHON_IMMUTABLEDICT_VERSION = 4.2.0
 PYTHON_IMMUTABLEDICT_SOURCE = immutabledict-$(PYTHON_IMMUTABLEDICT_VERSION).tar.gz
 PYTHON_IMMUTABLEDICT_SITE = https://files.pythonhosted.org/packages/55/f4/710c84db4d77767176342913ac6b25f43aaed6d0a0bdb9168a8d2936d9c7
-PYTHON_IMMUTABLEDICT_SETUP_TYPE = pep517
+PYTHON_IMMUTABLEDICT_SETUP_TYPE = poetry
 PYTHON_IMMUTABLEDICT_LICENSE = MIT
 PYTHON_IMMUTABLEDICT_LICENSE_FILES = LICENSE
-PYTHON_IMMUTABLEDICT_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
