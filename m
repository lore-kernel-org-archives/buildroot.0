Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5655DD0BB44
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 22:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE53640327;
	Wed, 23 Oct 2024 22:27:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pjbhwcFe2zRf; Wed, 23 Oct 2024 22:27:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFAE34031E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFAE34031E;
	Wed, 23 Oct 2024 22:27:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3825D972
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18B804031E
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JxIpnQEqatbw for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 22:27:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9ED164030A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ED164030A
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9ED164030A
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:27:09 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-83ab21c269eso9332339f.2
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 15:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729722428; x=1730327228;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YIC706HPMQ1e3JD6ozT1WVEdDHrrcMf0uxht+zM1qLY=;
 b=N9nfG41V6WeV4NfU3D83yIln5xzfFiEpCzNjK07ZncStDGQinHdvWTg5T7patUOA6K
 dFOEdB0QMIWgQzhxS8asKjuVxQjHIfqFLObrurkb6FELoIoSrom/0CxRQUfT04nJyP2i
 SA9fROk4m0xQXrSfvOl73u5e928Ak71Th8RgXxidV4Js5mq6hyZR6WI7V7NVMiNGJDKS
 o3LB0YxBPGYtLPF+DwoOd+M/p2FEz5MTCK5WyQEfToHLNKMuEQYG6wcVHW/PuiFj/O4n
 sw05Caua8qBD2ZZTo9up7OUaaN0KN8aB5gsyB+/MXu30ryQAecxp9aWDUOkQ6zhRjSRF
 JoSw==
X-Gm-Message-State: AOJu0Ywwwaut6ngvC60JY1hFmI6z7f3dYcm3HTy9QTp3CBTtFIExljC/
 T4JN0isQaNtCljG+npvsv13+wuZ9KlEaz5hNUXdaaxXQooZOuVFsx7nLwQ==
X-Google-Smtp-Source: AGHT+IHpNAtjMctnX4dXLbHqq8MUXfViag5O0Mz1aBUGgSEE+a4QddzfUt6WED0XNjWdoYseVrY1Mw==
X-Received: by 2002:a05:6e02:1649:b0:3a3:97b6:74fe with SMTP id
 e9e14a558f8ab-3a4d597b734mr42678095ab.11.1729722428369; 
 Wed, 23 Oct 2024 15:27:08 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc2a5880d4sm2433701173.80.2024.10.23.15.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 15:27:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 16:27:06 -0600
Message-Id: <20241023222706.3347120-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729722428; x=1730327228; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YIC706HPMQ1e3JD6ozT1WVEdDHrrcMf0uxht+zM1qLY=;
 b=DolgT0eTTR939CdoPVNPZd/LH9+dKbS3Tj7O9gfKHFlD5dPRT5uTZVxpHA4FhyBY7G
 CM0FKM1B24a2QrVkjj3FQ+vgGaJ5AoxnqWx5+lUc+9HeieHylEfJR8GHw6Xtg3oYf7EI
 qCN2Tj03i3ySWlNutYK1LGwCaXAgTRSucNtjYyMGctScmLVETJdvRtWXjebzU9rPLEdp
 94nKV1vRk7DGknYGLbG/3f+BVuPtLYlKNwtBE8+uhNcc/xj/5H1ceFN/jTqqcYWRccPC
 LNVcuGC/sRCnTazfOdtl8hRWJGQVIRaWt5ns92/YsPSm2ML73FxUoreAlrcIiH7bOCs8
 Rw0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DolgT0eT
Subject: [Buildroot] [PATCH 1/1] package/python-jsonschema: use hatch setup
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
 package/python-jsonschema/python-jsonschema.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/python-jsonschema/python-jsonschema.mk b/package/python-jsonschema/python-jsonschema.mk
index 21e4adab48..9f99628b5d 100644
--- a/package/python-jsonschema/python-jsonschema.mk
+++ b/package/python-jsonschema/python-jsonschema.mk
@@ -7,16 +7,14 @@
 PYTHON_JSONSCHEMA_VERSION = 4.23.0
 PYTHON_JSONSCHEMA_SOURCE = jsonschema-$(PYTHON_JSONSCHEMA_VERSION).tar.gz
 PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/38/2e/03362ee4034a4c917f697890ccd4aec0800ccf9ded7f511971c75451deec
-PYTHON_JSONSCHEMA_SETUP_TYPE = pep517
+PYTHON_JSONSCHEMA_SETUP_TYPE = hatch
 PYTHON_JSONSCHEMA_LICENSE = MIT
 PYTHON_JSONSCHEMA_LICENSE_FILES = COPYING json/LICENSE
 PYTHON_JSONSCHEMA_DEPENDENCIES = \
-	host-python-hatchling \
 	host-python-hatch-fancy-pypi-readme \
 	host-python-hatch-vcs
 
 HOST_PYTHON_JSONSCHEMA_DEPENDENCIES = \
-	host-python-hatchling \
 	host-python-hatch-fancy-pypi-readme \
 	host-python-hatch-vcs
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
