Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56F0CF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 08:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AEAC405E3;
	Sun, 22 Sep 2024 08:51:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vHU-UGUvLu3d; Sun, 22 Sep 2024 08:51:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 349CE405E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 349CE405E5;
	Sun, 22 Sep 2024 08:51:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3CBEC1BF57C
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 08:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B329405E5
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 08:51:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id waTf682Tn2S1 for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 08:51:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 09F95405E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09F95405E3
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09F95405E3
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 08:51:04 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3a0c8b81b4eso10566855ab.0
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 01:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726995063; x=1727599863;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9+YMjmMvvyM5y+/J6VJQagILnenjFATKlGnS+HxiNEI=;
 b=h2qUUcYW9c6IrC4kKxCwdNJgqra0XsHhpZ1x3Qw4D8G1Ox92pk+ISsBSkvDP0sx6LY
 6WEhlKzZE7nfzE+xMuAu8J2xWfbWl6z1MuqgMdwR2Lw6ar7BraQASqISL0AdlIcZYgDB
 kxXmH/hZL3hpGwn3wmCfUlFz01yScoaKlf7Fpf2O67f7rSGUttxND1oVFSv9XO64EiJb
 JeF4qO9tIweCplmG2/n5pZiS+bG1OYvgHxq0boOSjvNXwhoRs/SRf2ew2QvrGB2fd3Et
 mgLdkA92mA3JjKjROZul+N8/yL3QD6u3CkCv/viBxOhQ8fzHHgAiGKXoxaaLiLC9jPEo
 OGQg==
X-Gm-Message-State: AOJu0Yz5offsyGS+hgrcu6yK21sbyOylyT7bwtGPcPtyWLM7uzMrIAl0
 QNQKtMGGN28NSGEf4BI6rb9P7JsW2B63PV66kvO5OgWP7m0lkvwEDV7NCQ==
X-Google-Smtp-Source: AGHT+IFUDYUmsjQ39cNnj/jq0qGbRbFebdQxDU58hlsGzW4IObQWw6EsG7LzS50PfwZuwU1d4wDfGQ==
X-Received: by 2002:a05:6e02:216f:b0:3a0:9fd8:f70b with SMTP id
 e9e14a558f8ab-3a0c8c9d861mr75182095ab.6.1726995063153; 
 Sun, 22 Sep 2024 01:51:03 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed1abd0sm4557810173.104.2024.09.22.01.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 01:51:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 02:51:01 -0600
Message-Id: <20240922085101.1017002-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726995063; x=1727599863; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9+YMjmMvvyM5y+/J6VJQagILnenjFATKlGnS+HxiNEI=;
 b=hqtG4NHRGUTgsipeBJRUXtH8g+ztoWl//df4YxePCkPgIjCOGZcbxQmu36rtfXpxMt
 mgneJvKLcYs7KtTpxXuvHXj9MRc3elPbHvTbcdFRIAoC1TIa6t4ai+NBF+2tWnWKXuh7
 3QQXHFgN7Hdh+Q6INJVgYR/L3oAFyJxxkL+hwBD7dCnR6eDUhYdrMmAsVp0h+G5xES/2
 bk/NX4WiTm3b1UllmBjPUdgbi0eyyYoe0LypELLomE14ABxaLhNUoCNkBnJ/Q6gD3z1X
 kfc53p49PaOsTjDDEQttvH7wpZuvOITMNBGRzSYwg7C/iCWTQ3/1R5aYNowfwT4+Wfy2
 1yLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hqtG4NHR
Subject: [Buildroot] [PATCH 1/1] package/python-filelock: bump to version
 3.16.1
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
index d4f2bdc6e3..c81d016f8e 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  b630d3af1f7347fde354f82e0f190411  filelock-3.16.0.tar.gz
-sha256  81de9eb8453c769b63369f87f11131a7ab04e367f8d97ad39dc230daa07e3bec  filelock-3.16.0.tar.gz
+md5  4c66a5abfc4004cbb0cc30d22e472031  filelock-3.16.1.tar.gz
+sha256  c249fbfcd5db47e5e2d6d62198e565475ee65e4831e2561c8e313fa7eb961435  filelock-3.16.1.tar.gz
 # Locally computed sha256 checksums
 sha256  88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 1f0f601d6f..e9c2eeb14e 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 3.16.0
+PYTHON_FILELOCK_VERSION = 3.16.1
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/e6/76/3981447fd369539aba35797db99a8e2ff7ed01d9aa63e9344a31658b8d81
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/9d/db/3ef5bb276dae18d6ec2124224403d1d67bccdbefc17af4cc8f553e341ab1
 PYTHON_FILELOCK_SETUP_TYPE = pep517
 PYTHON_FILELOCK_LICENSE = Public Domain
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
