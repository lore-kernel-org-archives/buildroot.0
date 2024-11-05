Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE5AD31778
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 18:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A90D880BD7;
	Tue,  5 Nov 2024 18:05:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KHvJJwvFM_BX; Tue,  5 Nov 2024 18:05:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B70E380C2D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B70E380C2D;
	Tue,  5 Nov 2024 18:05:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A02C83B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FDB84069D
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:05:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NWmvp3y-4nEj for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 18:05:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 743A640699
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 743A640699
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 743A640699
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:05:13 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-83ac05206c9so201478839f.3
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 10:05:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730829912; x=1731434712;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9748x+NKjegSBAj+rurz3UeljyaaGwPfEAreQ4ZioME=;
 b=K8jlff1wOp3b5Zm6py9oplxAhEjkfaGLb4zRd0uu8e0zkt/jsGLezE/BCpKzRll6tu
 Azk6a1KjEAWykARFSV/aF7dNAJ49F2ppCy4C3sud8q2VZdmFB1ordMiaKhooDEALpu9K
 JnwJBgs9Dne3BlFx0B4H7pZZ5IkrfyGahJaW6YkSs/ZZfCLaiPB74xLCSUWOR8eOkIVz
 ff7xqWDgKpL4hZ9DFyVjH8OM8Kh2mLBVdHkCizoN2d7HP74QBa4YIApP/9TzmznSZjxn
 5Z37r9yuspRtIn5muyZUHOXsXS7wHkgqIC76qzP4t0ob0egqrgTIR0V8Zfv7J6T9s83c
 h1Gw==
X-Gm-Message-State: AOJu0Yw9iG84H4BdP2lUmcGRvLtkfpYSc4UAhU/O9rNQu6JiX1HJrame
 c7K7XwGwOGMazCVisPCU2o5+6iSLVonYg4x4Ypnv/8C1fTaFKN9hlmTyeg==
X-Google-Smtp-Source: AGHT+IHs4+txx19QR1nTSX5SSck9Pq0hsVOWKe1px2SiBufq6IafkHOKG0/NkybtUyer3V7TDOi+6A==
X-Received: by 2002:a05:6e02:160b:b0:3a4:d94f:5b53 with SMTP id
 e9e14a558f8ab-3a6b0384ea3mr179832985ab.19.1730829911873; 
 Tue, 05 Nov 2024 10:05:11 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6a9a50478sm29985065ab.78.2024.11.05.10.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 10:05:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 11:05:09 -0700
Message-Id: <20241105180509.1408489-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730829912; x=1731434712; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9748x+NKjegSBAj+rurz3UeljyaaGwPfEAreQ4ZioME=;
 b=NjVpD0XyY++evxijZ9cRq8V1u6nBGoUKZzfjWtapTPfnu4r5IMW9TbyT0viB3laAQP
 TAEGybuSOuDam6r+wnvqZDUtZahT25eFBLdVDKX+CRLtmkzYl8X8XRBi5A16LJpbKRIH
 tZNZC7OKUfJTMHNPt2YakPdKaP9ziySii+ewt/uiP+lOjkejVtOW095Wyxm8nyBE+aSS
 BjGyAGeYTKD7QlwpBLQNYS1XkoGKPAhCSrbEUsGynMtMORGwv4IgEJ8g+h9BPNad9b7W
 wfYLff4hSa15l6oyXEqZ0xBkuT5LzLPGGsukCKtobmY6KWLOyNGViYIAmWdRnfCNAzXF
 xpUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NjVpD0Xy
Subject: [Buildroot] [PATCH 1/1] package/python-tortoise-orm: use poetry
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
 package/python-tortoise-orm/python-tortoise-orm.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
index 423e87b46b..0a8f173c86 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.mk
+++ b/package/python-tortoise-orm/python-tortoise-orm.mk
@@ -7,9 +7,8 @@
 PYTHON_TORTOISE_ORM_VERSION = 0.21.7
 PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
 PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/e8/0e/ad8e7554b0259072887d602617a67ef21055e1d8aa061936e381ecc1a9a5
-PYTHON_TORTOISE_ORM_SETUP_TYPE = pep517
+PYTHON_TORTOISE_ORM_SETUP_TYPE = poetry
 PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
 PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
-PYTHON_TORTOISE_ORM_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
