Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8592AC83F27
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 22:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F44683C60;
	Tue, 15 Jul 2025 22:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hf3qyCZDzCcl; Tue, 15 Jul 2025 22:22:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DAF683C2E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DAF683C2E;
	Tue, 15 Jul 2025 22:22:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33FBCDF
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 22:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1976841048
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 22:22:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GgKSZorrcfZc for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 22:22:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3A51241040
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A51241040
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A51241040
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 22:22:16 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-86d0c598433so180342139f.3
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 15:22:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752618135; x=1753222935;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vFHSW7XQmZqCcH86bM4EAQ82vPYD1VXxRPVpPKH/wX0=;
 b=Lwwz61I49n0d6CHduuVTf0Pgd9WaQqwZYnV9hlV9rvPoQO20En5mN89vBeI7UW0uiy
 Gg/uZqMQA6ZuVRZV8TyDPJF3EUfj+OiHC9PxYdfWtFfDX33PghmjUl3Ydth/gWMrUAg3
 MLhYneRe1oKNIgiUuVORY8N+790GoLA04M1fDo7stA0d112njtedmLMk4esLevkiQgiC
 o38aJLyZUitiqpq8LqoItXkqHiUdUPxdvZbqnXDJDXWum8x50Nl9JxEz1SAgTTdgS4ag
 cFHmHhcaO8HtZTK/Depe6Lhb4LVCG6nIF90T4v+wC7RmLWwW2QYsmPDZMIPL49cslAqd
 vP/g==
X-Gm-Message-State: AOJu0Yz1I92OtRNAtjQdRAuFWgmCTk7tbaR7/u35GtXs+nT26ffutzWw
 sAmpbYnraAlN1hQU7fgC3nAk8uoGSZor/aKZXYSgvHwaZxKPDuh1HO7O/6S7oZJstLE=
X-Gm-Gg: ASbGncuVrGfrHId06+KQT02u3Hy0VKjsdUd+pcTr7tRwko3iDRU2jYrJgobrDRoIbMu
 ue1047KwKqH0joQdePJ5jNao5WDKdS5/d9JYWvAgiAllA4vgzOgNMLQeaW8aCQYQocozY/VJKZC
 BR8vHIasFV0jhpNQN7hMQ0K2wsGs42uFdVo2D/KaNkGq9JgEBfFizdzks4QI6/Dos8TKf52kxLG
 OdIlnN9/t9h895uDOS0ujKKrlG0xMDiFSikkBn0MvJwBtQao2p21UppdTMJC7Ny+4htl4JSJT7z
 jWfD7zclkvMUuHk+nrjFavSjldWRvvKhLPw9r5gqjYOerz8GpNvkFWOiLqkQL7V+NXF+eLGBiRK
 up9k8QviWR8dsD50aV65rjtn2wYvuIpDY55M9KPTG3hPuItTyjO7LxsiXe+QSmNv76MndD00n27
 P9czWJtaw=
X-Google-Smtp-Source: AGHT+IE5Fdpnqml23pmch4tvV42y3JuVicKMQhhX1VfCD3NlHtPNBeqB/nBZqwJ1s5LtM+CLvOFnhw==
X-Received: by 2002:a05:6602:29d1:b0:86c:f3aa:8199 with SMTP id
 ca18e2360f4ac-879c2940871mr21384539f.11.1752618134928; 
 Tue, 15 Jul 2025 15:22:14 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-236-108.hlrn.qwest.net.
 [71.218.236.108]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8796bc14948sm338189839f.26.2025.07.15.15.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 15:22:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 16:22:13 -0600
Message-Id: <20250715222213.733224-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752618135; x=1753222935; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vFHSW7XQmZqCcH86bM4EAQ82vPYD1VXxRPVpPKH/wX0=;
 b=j3cgf8OdbxTBEpz+3DZo8NaEnuURAUamtWLynIJRz5QkH8IycDdYDWRdTpMLoKxgIG
 KOMKSi+V/hpvvwv9xeNLtFOgqawYnHi3eVar27CFSZltbchgTw++CR0LiycfG2yyZfqD
 Kv4zpz9XOfqT/7vh5/9P4+pA7d1iQTj5bxnsZLVGIf8riQLT94roMm/fY+5ApYxr+yvn
 wCU4gJLN6jcQHpNsOKyOC72qbWZkmc1ZW8cpbREMEwHLVN41IRYQmOIfmw8QuRQbv/1i
 g6oQtrmCTsxnZ/AH8Ty6BXxwyxU9EOxKfLGZrAK6Bh8v2crJxJ4LyM7uw+qKafMgUA54
 FkpQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=j3cgf8Od
Subject: [Buildroot] [PATCH 1/1] package/python-tortoise-orm: bump to
 version 0.25.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tortoise-orm/python-tortoise-orm.hash | 4 ++--
 package/python-tortoise-orm/python-tortoise-orm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tortoise-orm/python-tortoise-orm.hash b/package/python-tortoise-orm/python-tortoise-orm.hash
index 7538056cd0..8e99e815df 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.hash
+++ b/package/python-tortoise-orm/python-tortoise-orm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tortoise-orm/json
-md5  4ae41f379c4ede60df7705d1c7fe71b5  tortoise_orm-0.25.0.tar.gz
-sha256  7d0aaf31c33a25a9efad8f94b44ee50febae15889f4da119cf184ffe98002673  tortoise_orm-0.25.0.tar.gz
+md5  ef8df163a207f40230c618efa18ca32b  tortoise_orm-0.25.1.tar.gz
+sha256  4d5bfd13d5750935ffe636a6b25597c5c8f51c47e5b72d7509d712eda1a239fe  tortoise_orm-0.25.1.tar.gz
 # Locally computed sha256 checksums
 sha256  f955d347b975d5867ee364f978476b3012878a706d468571b9758cac74de6041  LICENSE.txt
diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
index bf250007ce..32327bae38 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.mk
+++ b/package/python-tortoise-orm/python-tortoise-orm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORTOISE_ORM_VERSION = 0.25.0
+PYTHON_TORTOISE_ORM_VERSION = 0.25.1
 PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
-PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/d8/02/89777797d2c74386e21fca4a879d15eef6a0a789e4b9564355e94c367e6e
+PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/d7/9b/de966810021fa773fead258efd8deea2bb73bb12479e27f288bd8ceb8763
 PYTHON_TORTOISE_ORM_SETUP_TYPE = poetry
 PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
 PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
