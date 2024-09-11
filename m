Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D441AEE57CF
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 20:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E07C4014E;
	Wed, 11 Sep 2024 20:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OAsG0eOQkiXG; Wed, 11 Sep 2024 20:28:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 470E840240
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 470E840240;
	Wed, 11 Sep 2024 20:28:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 86B181BF423
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 20:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81EF140240
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 20:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fywog-Yd9bvO for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 20:28:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 346E64014E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 346E64014E
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 346E64014E
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 20:28:25 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-82a238e0a9cso9991139f.3
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 13:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726086504; x=1726691304;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FDLIsIiIGE6IihEua8/d53zBDIixRifDs3jxVU0Yvn0=;
 b=VyqlMHH8bP3TjKA4SL0+ZBYuAhIB+6sUNHABtWWfwc+y6K7TapOs/CuIuROaskcj4+
 xg0IQtALH+p4CROXlJf5B291oUB2Rftglsn+uGwcCvnnHxzFkQ86NoD7a3nFmcgSDg0K
 q1kqwHygISdpLaOXvj9zew/ipXZTtHttN4okJgS0qo1fWZwLwlAWSGaNL3Y2LzU6DbCm
 UBl20V0LLCjQL1isNZqKUroadcDOq8q26a5mPQd1Rxh89FfKu5NuGTVPLvb8gJGJsuvN
 BV3/Nutbs5fux+jFsMIyfrf5jL5sAn72zTU2sC9TKJuMc/KUSUv1CHN3vorj3pwHDp4/
 78kA==
X-Gm-Message-State: AOJu0Yw8YA8kKgrfqAqb7f9kCkE9BcSfIvXcsT1IfFgFoSo/x1LDVtOI
 +6uyCKi5XbMdufOHkpOqAGuBpQZqmYg2Ugmbo2rhS3gLMvKt/OXZzEuxtw==
X-Google-Smtp-Source: AGHT+IGIo9Zp2SpkqdFmpIImCGx4gtW9UCsA//QowirT4l2N8ygFeS4QFtgdQcwdfFYC6HVztT5G/g==
X-Received: by 2002:a05:6e02:1a09:b0:3a0:4e2b:9ac0 with SMTP id
 e9e14a558f8ab-3a0848c91ddmr5839605ab.6.1726086503776; 
 Wed, 11 Sep 2024 13:28:23 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d35e256aa6sm189152173.0.2024.09.11.13.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 13:28:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 14:28:22 -0600
Message-Id: <20240911202822.739096-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726086504; x=1726691304; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FDLIsIiIGE6IihEua8/d53zBDIixRifDs3jxVU0Yvn0=;
 b=HGnUPyfjFEzf4BXDsqkW4Nw8TSP3Q17mmnbB0xCXiwPUp0FZoOk6X1GDSrmNFRE2Ld
 XBiVXp7eekttcpAYesjKKaWOfr5NC4Q74OBbdjdbfnWeXQzKVoBs6tNIwrNCF8ppyi5x
 Khkbo5DPfrhwn2fjPQKh6cPC3zGnCn2+Xz6P5h8h8AodK+agxiTYasGHYROxV3FR4x05
 kWS/QNCkNo6hw78lgyuTRXSHvHPlvOS4+VJS0sDbnExAD7AKMYYHXZqcjvEy/QgT8Bqw
 MtIko69HdB857F4YAbufGlc5x2IavdeS78zRfnHZqaDXU3IHiXoaLG/RqEfPmRnNGZ3E
 EAnA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HGnUPyfj
Subject: [Buildroot] [PATCH 1/1] package/python-aioconsole: bump to version
 0.8.0
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
 package/python-aioconsole/python-aioconsole.hash | 4 ++--
 package/python-aioconsole/python-aioconsole.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aioconsole/python-aioconsole.hash b/package/python-aioconsole/python-aioconsole.hash
index b52140cca5..34ab684400 100644
--- a/package/python-aioconsole/python-aioconsole.hash
+++ b/package/python-aioconsole/python-aioconsole.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioconsole/json
-md5  e8cb2e4dc434e20a3e75acb54d89bdf3  aioconsole-0.7.0.tar.gz
-sha256  c702d24406378d37d9873f91e03ce71520bac503d5ab03f81d8b563ff010bd54  aioconsole-0.7.0.tar.gz
+md5  a644cd04d15488d61fc18c1d3b9816c5  aioconsole-0.8.0.tar.gz
+sha256  64c93c17ef878fc68b4b379b9ed7fbb96c6fbc1b4e9a8378f9f899299ebdd37f  aioconsole-0.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  e1c0ad728983d8a57335e52cf1064f1affd1d454173d8cebd3ed8b4a72b48704  LICENSE
diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
index b109d8e358..0a23557b6a 100644
--- a/package/python-aioconsole/python-aioconsole.mk
+++ b/package/python-aioconsole/python-aioconsole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCONSOLE_VERSION = 0.7.0
+PYTHON_AIOCONSOLE_VERSION = 0.8.0
 PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
-PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/85/da/6a238a72274fa338b2ff20007f026944a6721245fa65d3bd4adeb83be419
+PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/89/dc/523222a45a83e69319724362db1664185970bca20c7d643c9261cfcddfb1
 PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
 PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
 PYTHON_AIOCONSOLE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
