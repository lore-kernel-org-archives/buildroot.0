Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B086BC35FE5
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 05:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5886340611;
	Sun, 15 Sep 2024 05:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ql6ZqWN-G5rP; Sun, 15 Sep 2024 05:58:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02D0740613
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02D0740613;
	Sun, 15 Sep 2024 05:58:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2743B1BF293
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 05:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1602A40198
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 05:58:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VWWTgZw7X3Fx for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 05:58:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DCFB9401AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCFB9401AD
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DCFB9401AD
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 05:58:13 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-39f526fd19bso7483795ab.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 22:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726379892; x=1726984692;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2DXKtwrEKWIqiODyRltIG3mTijeAu8M6Y7b8Ba8irqA=;
 b=eVvGcT2xy4D59MjxaRotWI1krWxmC1vqiEJ85GPClz9C02Xqs3IYq03lqqbE03KkHH
 aF/vghPAGlLcTBxyndy6atYm+ZeKAgRGLvRDbNow4dcPQQXxsAL6Y71qZ7N4yIFbmqRK
 canQ3tKO6rvqrsDevhJLbyKMxiu0jdq3apdmvIEU42x9GJODI/B23mqjRiNYsAmOLE8Z
 6OqEQBuXr+OlCnKnZKjryncNGgICGAQdyLGqTpDljpc/5QG6RPTW6BngOOIjcX6A9LGx
 ezhbW74zvEFoM6crrL+u4ahI9XQ3tV9+gunszi1ZJPUYb77f0HFU8O4eE8YV97dEK2F+
 lcug==
X-Gm-Message-State: AOJu0Yw36zCi5ouZTREoYh/kNP/uAScK3jGH1Yya3caaiY+4FN7YW4DZ
 c3odKChd1ERv6yi2BhDu0TWPAy8HUchIjVoAdZlGGuvrVOcSfiB6wFza4Q==
X-Google-Smtp-Source: AGHT+IFjvdraLnkGVriJQtOApcWb3T3/4CVbIk4gfAPlfV5fuXD9cpV2zpLTkl3J/A2aIhK72hSRWA==
X-Received: by 2002:a92:c567:0:b0:39d:25d8:43a9 with SMTP id
 e9e14a558f8ab-3a08b65fec5mr73943515ab.0.1726379891824; 
 Sat, 14 Sep 2024 22:58:11 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed1af33sm769427173.95.2024.09.14.22.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 22:58:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 23:58:01 -0600
Message-Id: <20240915055801.1428588-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726379892; x=1726984692; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2DXKtwrEKWIqiODyRltIG3mTijeAu8M6Y7b8Ba8irqA=;
 b=cGMJgkNEvD8jARc3B1cWRiEp1iUOCgY3C+jBZWrYkCjellAW3CO0GbKNvuJXrl7OFq
 TpzSXuz1zbR3qYKawk/3N37uVQq5+yB6KRXMqfR6dLT5097HjuUiKES7NqpweAi8+Dgo
 4guYYDzE3gMla0P0usetCKxkc6PmlesSnpojAakVukBDsjiXehIu8VDdIbl6vUR+V7KL
 PRgw5WDOYJWczU0f6bnuVEFSnsd6T8I0e1P6y/ECtfW32PZwQGKEkBxAxDr1YsDxPjee
 rTiadGrHFuU2BA/aPqKHcQ4PZzQTO0Ka30McDr05Fq/hD1QdqeFJOWWlUNvUS7UU7Itg
 6zsA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cGMJgkNE
Subject: [Buildroot] [PATCH 1/1] package/python-filelock: bump to version
 3.16.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index 3013cb6789..d4f2bdc6e3 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  368d00d1946b89c910d4bf1da68b5a66  filelock-3.13.1.tar.gz
-sha256  521f5f56c50f8426f5e03ad3b281b490a87ef15bc6c526f168290f0c7148d44e  filelock-3.13.1.tar.gz
+md5  b630d3af1f7347fde354f82e0f190411  filelock-3.16.0.tar.gz
+sha256  81de9eb8453c769b63369f87f11131a7ab04e367f8d97ad39dc230daa07e3bec  filelock-3.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index a32517b1ad..1f0f601d6f 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 3.13.1
+PYTHON_FILELOCK_VERSION = 3.16.0
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/70/70/41905c80dcfe71b22fb06827b8eae65781783d4a14194bce79d16a013263
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/e6/76/3981447fd369539aba35797db99a8e2ff7ed01d9aa63e9344a31658b8d81
 PYTHON_FILELOCK_SETUP_TYPE = pep517
 PYTHON_FILELOCK_LICENSE = Public Domain
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
