Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19ADC3ABCB
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 02:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7101640E97;
	Tue, 17 Sep 2024 02:13:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOR-iyEmSiwD; Tue, 17 Sep 2024 02:13:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58D1D40F90
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58D1D40F90;
	Tue, 17 Sep 2024 02:13:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C22EE1BF3D2
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 02:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1A9A8176C
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 02:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T4uWwyK6RJLh for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 02:13:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7668E8176B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7668E8176B
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7668E8176B
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 02:13:45 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-82aa7c3b3dbso220582139f.2
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 19:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726539224; x=1727144024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fsQ2O4ZupyNUVnYbgsBaOZ8N6/5TAx6BiorbeeroqbM=;
 b=ieIJhA2ndxQeFYnmZ7cLOXEmt29T/oD923HhzI7iy/5p2aXlJCpToiGmwx3PVNFMwX
 cTX4n2gM42guu5AE7gZY79YGpBYeMsdzZHIuqyengPjt9BUCN8gtTPPSwp3xGaGhejWE
 I8PgOkIIAL4MUL7t4WXLY320AfxcuqoPTdRtsdqnkuW2xKR+Ygz0n2ZHSQNxAnvQyET8
 jLosOOpPeI1uPQk0tu/kWGyJslgN5Q8bmvIjBMtHNsSQFs1MCgyZEr0EbeiVR933nea0
 CZk7+rML4NgHH8T7xqH6cosS+KTLhtk5PQaTSybpVDyAIVzPsNsPXUa/WTsCE+NWmHgz
 5zGA==
X-Gm-Message-State: AOJu0Yw9tioTzOYPmuotKcH2p0N9kxD6OZsyvBn7vws0om1WevacpIav
 FEcpz9oWPwyPvZ46R5ZmhEec7mtOTQRBc+drZo3SFwjRPiAjrN/0PxqXzQ==
X-Google-Smtp-Source: AGHT+IEWV2sennrfi3F5nJGniWtJvKpj8C9zcV2YNHvgK8LZtlXFseKMbtfh3iYrV3B37w91mbXQTg==
X-Received: by 2002:a05:6602:134d:b0:82a:3588:994b with SMTP id
 ca18e2360f4ac-82d1fa8d687mr1555147639f.15.1726539223880; 
 Mon, 16 Sep 2024 19:13:43 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed34fb4sm1811265173.149.2024.09.16.19.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 19:13:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 20:13:31 -0600
Message-Id: <20240917021332.3838579-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240917021332.3838579-1-james.hilliard1@gmail.com>
References: <20240917021332.3838579-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726539224; x=1727144024; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fsQ2O4ZupyNUVnYbgsBaOZ8N6/5TAx6BiorbeeroqbM=;
 b=D6ntCcbB+GNvUwMvpnu3OKWa9XpGYeHKZ7/JgMGA6ySYc9uYdtKEO6tDYADbViy8WN
 Od5VF6OoVvXeFiKjD9zOu1HCpmfgm63tye2axxxiqhWH9XuaF//X89GAij4hCelXQKEK
 QgSVF1NkvSjjuyvUyFtRj5n5X6jt8P5kDy2D3AM0QMSO38jhytimzJYrYvn3z3VuOIDN
 kGS9/R44vutahs840QSls56NXIhhM/1UIEhv70m3AfFCjxbKEM23rPoGR83xHLnYt8bC
 VJtyziVmxke228hDEdVszdSP9ZZGn6ecSHNa8isaLLd6ri+TGT7erq0JZMHHaPqA/izz
 NPqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=D6ntCcbB
Subject: [Buildroot] [PATCH v5 2/3] package/python-scipy: bump to version
 1.12.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to date update:
https://github.com/scipy/scipy/commit/0ace7295322148d74932bee32b0647e29c38fc8a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-scipy/python-scipy.hash | 6 +++---
 package/python-scipy/python-scipy.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
index bee5d698a0..5b8cac8055 100644
--- a/package/python-scipy/python-scipy.hash
+++ b/package/python-scipy/python-scipy.hash
@@ -1,8 +1,8 @@
 # md5, sha256 from https://pypi.org/pypi/scipy/json
-md5  0e8eea0f7c4fe7d8102366230c96d66d  scipy-1.11.4.tar.gz
-sha256  90a2b78e7f5733b9de748f589f09225013685f9b218275257f8a8168ededaeaa  scipy-1.11.4.tar.gz
+md5  22683fcf9a411f0a5254b7509bea0a6b  scipy-1.12.0.tar.gz
+sha256  4bf5abab8a36d20193c698b0f1fc282c1d083c94723902c447e5d2f1780936a3  scipy-1.12.0.tar.gz
 # Locally computed sha256 checksums
-sha256  5517022426a56179540ee6eace15fd723ef8fdb83b2900fed2152dd2e2f972a2  LICENSE.txt
+sha256  c29fb8e5936f33237a8b15256b4c6e93037f05bbf58c3d7b5755aede4c200173  LICENSE.txt
 sha256  606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
 sha256  3df9207af2fdb861af0ae3b22026f163b9bcfab4e525dc4943afe2ffa3f77624  scipy/optimize/tnc/LICENSE
 sha256  f0cedf52503b2d42b83411a0a16e6fefac346dfad8fddc66f50050150123470c  scipy/sparse/linalg/_dsolve/SuperLU/License.txt
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
index 6626826e33..9110a5b847 100644
--- a/package/python-scipy/python-scipy.mk
+++ b/package/python-scipy/python-scipy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCIPY_VERSION = 1.11.4
+PYTHON_SCIPY_VERSION = 1.12.0
 PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
-PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/6e/1f/91144ba78dccea567a6466262922786ffc97be1e9b06ed9574ef0edc11e1
+PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/30/85/cdbf2c3c460fe5aae812917866392068a88d02f07de0fe31ce738734c477
 PYTHON_SCIPY_LICENSE = \
 	BSD-3-Clause, \
 	BSD-2-Clause, \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
