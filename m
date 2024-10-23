Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10126D0BB42
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 22:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C78E7401B0;
	Wed, 23 Oct 2024 22:18:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FtFJLlUH5AqY; Wed, 23 Oct 2024 22:18:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8090A401B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8090A401B1;
	Wed, 23 Oct 2024 22:18:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F01882073
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6E65810BB
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FA-Jvz2Dk_J8 for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 22:18:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F40DF80F43
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F40DF80F43
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F40DF80F43
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:18:21 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3a3bd42955bso1408575ab.1
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 15:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729721900; x=1730326700;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SrvW5ZNHFPFoCZtpsbQB+U3Nl7DwjQVqjj1//7SKzMM=;
 b=D6HusGoOaQdaW+0JVHBQrNrfrpaYoCQy81YBjeKwzt6ZZf0rF4G45v90dijcwtF/Ty
 nn7VzOlekpNHPi/iFBgG4V0vDN+zfopcXBCQjzULxeMMEvJbiWXLy5wyfEJDu03B5QaC
 +6n+CNwDoPGKBfPzw6pBdaD3SBTgmXhOqNNs+7ktRR+mTAV9OiKCPz4iazwPbaE7jq6Y
 Mb7wWIdfp4aZCOIrO9S/UfsUvXjaUCw5v+TcIgHZCdJQkJtdVra685P/LdBlnvXJyX6N
 H7xUERg3z2rieFKrn45YD04HeSi7BTyDpQ5/if4hH5tDEPIOPGsdBk75tQuWN9Fzx9vs
 cZfQ==
X-Gm-Message-State: AOJu0Yxc/BaYY13YPISJwCcWZ5fCetPyLjqNz0hqikXHVG6lC0UHpqdv
 KdW1TY5SAvdbB+n1RFwP7IweGATqA5ohEDdIh79KLvhnkbSfgtgs95IKhQ==
X-Google-Smtp-Source: AGHT+IGQTf3TNMpECpJOKXVVZ359LaXAk5CZ3IvVH6aTj4exh99YUJS1TAxsr2k8MleSYEMrTxnfNg==
X-Received: by 2002:a92:c248:0:b0:3a0:9952:5fcb with SMTP id
 e9e14a558f8ab-3a4d59da1b3mr42345395ab.17.1729721898991; 
 Wed, 23 Oct 2024 15:18:18 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a400aa0cc5sm27337045ab.29.2024.10.23.15.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 15:18:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 16:18:17 -0600
Message-Id: <20241023221817.3330107-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729721900; x=1730326700; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SrvW5ZNHFPFoCZtpsbQB+U3Nl7DwjQVqjj1//7SKzMM=;
 b=g+nFt2r75giUPCllwpfteHtLYrzw0+lg+SZQkRJQZn4xAUj3HDhKbkjA/PobS2QPvj
 6Ho3ehVq+z0kIoK5pqQmFTO7HDQ/Q6KnUmp4cOWYgGYkT6oILQ8RmYCl0J0qXg7++6uw
 D0PVXD8RxixgBqwgCjaWN3lj3igigpX2Jcyw98kHB1eNIugICUq8kwOxmBm2E0zN5NxN
 iti0jsQGH8a971b+jpHhDqtaVhhDOv9WeJ/sZuKRf/CflIFfy6NmEgEdZ3KQUFBv5mvb
 C9AVoytnMygx65kPW1eGTWl8tZwDBD4+TUmh8XHP8VlG8HUflRKzYWAB5DlCfrpp/ni8
 vxoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g+nFt2r7
Subject: [Buildroot] [PATCH 1/1] package/python-filelock: use hatch setup
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
 package/python-filelock/python-filelock.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index e9c2eeb14e..f26030a9e4 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -7,9 +7,9 @@
 PYTHON_FILELOCK_VERSION = 3.16.1
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
 PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/9d/db/3ef5bb276dae18d6ec2124224403d1d67bccdbefc17af4cc8f553e341ab1
-PYTHON_FILELOCK_SETUP_TYPE = pep517
+PYTHON_FILELOCK_SETUP_TYPE = hatch
 PYTHON_FILELOCK_LICENSE = Public Domain
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
-PYTHON_FILELOCK_DEPENDENCIES = host-python-hatchling host-python-hatch-vcs
+PYTHON_FILELOCK_DEPENDENCIES = host-python-hatch-vcs
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
