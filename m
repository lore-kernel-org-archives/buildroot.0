Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73A3C7EE2E
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 07:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D80F408A3;
	Mon,  5 Jun 2023 07:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D80F408A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zJG2adD1M1yZ; Mon,  5 Jun 2023 07:03:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 041584087A;
	Mon,  5 Jun 2023 07:03:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 041584087A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B17D1BF59C
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64116813A1
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:03:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64116813A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xshVW9Gq8ErJ for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 07:03:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1022281391
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1022281391
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 07:03:37 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-33b0bfb76cfso19470315ab.2
 for <buildroot@buildroot.org>; Mon, 05 Jun 2023 00:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685948617; x=1688540617;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JHkk637oZJws5cTmgxMv+lNmA9kX3SHlsSriw6yaO0Q=;
 b=ekfHpBvh0liz7pw4k7h2aZEueW4D/oNbhyE1OrvXtjmSCyju8YCava5ENriOtNEUJj
 TfuevBFHN2Jn+uirscEfBfz0qXAEOLtSLndVefvESV0FnY1KQ6y8ftTcTZtdkcIKxUB6
 5jL45U+v5YIkV3mhCkPTEVjncZut3am60ZkwKvt4jxlZypGCHMJvvePZ2W1dOrdbKsc4
 cDl5bPBfOrakwPFZ/2+fazAYpMWiXYQIA93Gu/JCn/Xp3PavhQ0dzW3SFf/q3Wmn5aR3
 lh71Xyq0BzBFi0SFzIOy2/67EY3mfkKWmATd4QRU+C5WP3wLkpC6GxI26u3lYXC/fVYh
 /s0g==
X-Gm-Message-State: AC+VfDycVIAzEUNdM+4vB27Er7lD9g7T65It09+DU+856UtDyT+Z8ciH
 aP8sCg+8o58MEjGYU37FrQIFdQIMfbRbnA==
X-Google-Smtp-Source: ACHHUZ5tG7YDKEXZ/puxL2e+FylOkjQ9B5oWPwY0KV/2j2zhXiDzyMuXa8rDABh1Q1yKDm1sQq3vsA==
X-Received: by 2002:a92:d405:0:b0:333:8923:6860 with SMTP id
 q5-20020a92d405000000b0033389236860mr11822140ilm.5.1685948616797; 
 Mon, 05 Jun 2023 00:03:36 -0700 (PDT)
Received: from james-x399.localdomain (71-33-129-69.hlrn.qwest.net.
 [71.33.129.69]) by smtp.gmail.com with ESMTPSA id
 o2-20020a92d4c2000000b0033de04ecf74sm42522ilm.75.2023.06.05.00.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 00:03:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jun 2023 01:03:34 -0600
Message-Id: <20230605070334.1873522-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685948617; x=1688540617;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JHkk637oZJws5cTmgxMv+lNmA9kX3SHlsSriw6yaO0Q=;
 b=gsUtlF6JfA3+5qi/LHEPiNZ6+OqEg4SAyOPUgiV7s153e8Cmdbx/pUKb4ptxj/L1MI
 Es1H++jm8641OcAs7xKd1Z97q+InA2JoW2h40MQWqN79Lz7AdHoQltAbWuvllv7scLwS
 bQbqUUDNyKUSy18LVx5XF12EK+BNiWOg7YEgaBfJZAmzkNbrUhWiAp/jsCdDhVNCb6Ey
 EL2QdIg4MHKrCkU3KBin+qkAFianc/qMo8R8CQMayb/oe5W5/RgK1IylqFfwateYZ6P3
 +Ezqfqe8oNHMv9L6TP9gLb2mKGbFqdLdzONArvRkxMqF5eQeJwaeVdUdSyfEy7IwZYOI
 0NXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=gsUtlF6J
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools-rust: bump to
 version 1.6.0
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

Drop no longer required host-python-setuptools-scm and
host-python-toml dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setuptools-rust/python-setuptools-rust.hash | 4 ++--
 package/python-setuptools-rust/python-setuptools-rust.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-setuptools-rust/python-setuptools-rust.hash b/package/python-setuptools-rust/python-setuptools-rust.hash
index ff1b9a127f..f8282277a1 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.hash
+++ b/package/python-setuptools-rust/python-setuptools-rust.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-rust/json
-md5  fd3412ca77ffd6e06e2e83d0e9636084  setuptools-rust-1.5.2.tar.gz
-sha256  d8daccb14dc0eae1b6b6eb3ecef79675bd37b4065369f79c35393dd5c55652c7  setuptools-rust-1.5.2.tar.gz
+md5  f7a1602f3c34e9a5bb82603d4d80c9e3  setuptools-rust-1.6.0.tar.gz
+sha256  c86e734deac330597998bfbc08da45187e6b27837e23bd91eadb320732392262  setuptools-rust-1.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b20668c1590582b3882854050ccfbdb7aee1f71a1ffe9eacc4c5aeb08a14161b  LICENSE
diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
index 7f19ece1a3..a3e4d7a9d3 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.mk
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_RUST_VERSION = 1.5.2
+PYTHON_SETUPTOOLS_RUST_VERSION = 1.6.0
 PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools-rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
-PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/99/db/e4ecb483ffa194d632ed44bda32cb740e564789fed7e56c2be8e2a0e2aa6
+PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/0e/c9/6f9de9f7a8404416d5d22484ccdeb138f469cc1e11bbd62a2bd26d5c1385
 PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
 PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
-HOST_PYTHON_SETUPTOOLS_RUST_DEPENDENCIES = host-rustc host-python-setuptools-scm host-python-toml host-python-semantic-version host-python-typing-extensions
+HOST_PYTHON_SETUPTOOLS_RUST_DEPENDENCIES = host-rustc host-python-semantic-version host-python-typing-extensions
 
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
