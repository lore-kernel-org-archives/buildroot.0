Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B397AE77188
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 02:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 708434265D;
	Thu, 19 Dec 2024 02:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ID763htwtnRV; Thu, 19 Dec 2024 02:29:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FD364266A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FD364266A;
	Thu, 19 Dec 2024 02:29:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BE17BE9
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB9184265F
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oElb_86mbmBO for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 02:29:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 914714265D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 914714265D
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 914714265D
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:29:23 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-844e55a981dso11579639f.3
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 18:29:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734575362; x=1735180162;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7//0jLQH2I8V7ipZX0jyoQ0tm8nw7ZEQyPsVwMH8ZZU=;
 b=gwuPa/Vmu4tvdvVjg0TSw2mgTcysS+sz5j8e5Cjmlg5Y/CExjRog02C8GgpmR0jym3
 W2eraP7FJWPyDBVtAFD/f5Y9OpFQN1UH8cY7GiUKReuWspg3Xmz3/scED+X3CJHoIsFy
 YfaqA3ZSJrtPYZ7JUncd87jHqQ5WFojI8vhNmMYStAxiERTFT7mnUD9q0jWsHFmcoqfx
 5BxJSZdCFhuLInJQj3KwAaq3mqbKrXU+XgtIIL9CTKGtosLynz5xT4cSwHKVZP1rpYJo
 eykxnASPLpC1APhbkXvvcYSKDI4Tne/xkCv1UHRH8sMzr/NukLpa6+VOLRbJ3LYBg3h7
 c97g==
X-Gm-Message-State: AOJu0Yw3hv66rZT7n2WjX75b7R30qrVecRLFxysm/lEP9d7t65Xjgglf
 FnL1DPoAybtkhGE/rPySlMfwoHcxj5yBf+1pevon41EqKoRcyIguWIKdoyym2k4=
X-Gm-Gg: ASbGnctgy5enTCbrSlV4UXDHWCauEtAL4qy09w0BQD8PaV0q+ek4f9w7zDn1B5jRPrH
 Cn9qXSUJpWi3M9Goz0YqN08QyM+m1C5tAZbKc/AGmZ/5xPNU5JnUcPYxzRJa9Vm1Eo55oo74JwX
 uPihxR1DyKYRWRCiJO/6NaSii/B9G+RhFFgRvrO1lQwbWfMd3k2nU5yt6v99Ou1JW7bo8XadQSB
 BVGPyQ0LtgTL1wIbB5YtjiVOO5utL6QMIRI3Q3GTZXHv4FYg/dNV4s7lqaT17oZZGWv7l8QxNeI
 w+L4KhgBDEZw35S9/UdSoJe0e4wNifkDAg==
X-Google-Smtp-Source: AGHT+IGqXvG8rMWOk/xTN9gN4+JefQDZg0HLUB1gwulQ1KaFgJPtdUlY8VdZkyg6gpDxRVZI3SvcFQ==
X-Received: by 2002:a05:6e02:168d:b0:3a7:635e:d365 with SMTP id
 e9e14a558f8ab-3bdc0ad2ba1mr53039555ab.6.1734575362278; 
 Wed, 18 Dec 2024 18:29:22 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3c0e411e85dsm692195ab.60.2024.12.18.18.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 18:29:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 19:29:20 -0700
Message-Id: <20241219022920.284880-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734575362; x=1735180162; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7//0jLQH2I8V7ipZX0jyoQ0tm8nw7ZEQyPsVwMH8ZZU=;
 b=O7j7oLoUywtFfpU2dwFPdJOwKdkAYcRR0sgQ3ysnhhmjWkhLREtz8NV/Tw0xFSSRuU
 MyWwdPoloc2wHapN0ToQa/t+59XYK01bQfgo5htyCL5w2ajP6DBD1U6TaNZP8Yesn0y+
 +DM3/MWJU9x2ykcKWXqi8ULUtA7I7TznEA7jh6c/TP2EXtT34rbcpBvmmIuuRoSLHNGv
 MPOQBSNf8gdsag8bzQsvajhBqhc/7Is8lPZlFpSGqWla7d7QzCmIoJYNuPRp7OdAvwHs
 8Rqt47tT5hTdVibSca1GjaHpclyHJ2I4Prc8hlghBoVkn3HZbdDkHu37C3v00qqqka0X
 C6lA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=O7j7oLoU
Subject: [Buildroot] [PATCH 1/1] package/python-pypika-tortoise: bump to
 version 0.3.2
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
 package/python-pypika-tortoise/python-pypika-tortoise.hash | 4 ++--
 package/python-pypika-tortoise/python-pypika-tortoise.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.hash b/package/python-pypika-tortoise/python-pypika-tortoise.hash
index 5c78509af2..a353fc3b33 100644
--- a/package/python-pypika-tortoise/python-pypika-tortoise.hash
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pypika-tortoise/json
-md5  69e74ea7ee7236de921c662a3b0940bc  pypika_tortoise-0.2.1.tar.gz
-sha256  979bbb9d60fe9f6e4129a25c44ee008aab4a4e97b296350be9983dcaa2766354  pypika_tortoise-0.2.1.tar.gz
+md5  356b9c058d7e6f52256057158d71a67d  pypika_tortoise-0.3.2.tar.gz
+sha256  f5d508e2ef00255e52ec6ac79ef889e10dbab328f218c55cd134c4d02ff9f6f4  pypika_tortoise-0.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.mk b/package/python-pypika-tortoise/python-pypika-tortoise.mk
index ba4845e100..2b10e40861 100644
--- a/package/python-pypika-tortoise/python-pypika-tortoise.mk
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPIKA_TORTOISE_VERSION = 0.2.1
+PYTHON_PYPIKA_TORTOISE_VERSION = 0.3.2
 PYTHON_PYPIKA_TORTOISE_SOURCE = pypika_tortoise-$(PYTHON_PYPIKA_TORTOISE_VERSION).tar.gz
-PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/30/af/b4a6035611cf6f3990879385cf6d077013c1bdf7ea294d6ceebfa14c8d08
+PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/f2/6f/d7bfc44f9d8d68e33866688f7ce9ba0785b485e4dec1590ae0a6ba73b5e2
 PYTHON_PYPIKA_TORTOISE_SETUP_TYPE = poetry
 PYTHON_PYPIKA_TORTOISE_LICENSE = Apache-2.0
 PYTHON_PYPIKA_TORTOISE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
