Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94F4CAC592
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 00:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92A1540AAB;
	Tue, 16 Sep 2025 00:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MqgrILwy8BFS; Tue, 16 Sep 2025 00:25:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC73440AAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC73440AAE;
	Tue, 16 Sep 2025 00:25:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 88372199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6688340595
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FStj-CwBG4wG for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 00:25:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C79F40547
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C79F40547
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C79F40547
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:25:18 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-42403719c73so20913565ab.0
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 17:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757982317; x=1758587117;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V32si9xMgzhk8wv3XrtT99dj4i1YqFic0VA7zbr2/Ts=;
 b=wDsP1FBPJsZsym8tImkfSS5tWJ7krLI7Dm3z8fm3VdJgz8ROhZ79QOH43ApoJavPm6
 fnib60zjjF+H2bKZcNGGNvobE+oYTOIBkyiWLO8ytaDXVFe1FxME8LftBWKcA9T4YQSp
 fl3g4vy66eQp1+g1aCN0nu7GsftOOUyluZzMAM/YumkZnQ1YHKY46/gapTQfUx88SIYx
 AhHjWGBo/GVKk4qgGy77GfmPdYvWAL1TxKwaZYiCKrapylIomLNbNryvQ+ffJIMqDCwc
 c6BuJu3s9KR1jpP+fLb8V7aVV++YXoiv35Hht55jGCates9DawEt7UBlKk4HQx6uR9dI
 v+qg==
X-Gm-Message-State: AOJu0YxYBtecgMBW2t4q8kqKnCX+YcvCMRJ8k00oymyqup2CznKvQtQP
 hMufw0I+Ftej83ER29b/KQDXroW07yIpoz81SvWmkrthqbmPEPzZq8kQDs/l8w==
X-Gm-Gg: ASbGncvSfnGikdpxQjpu0XwJzrG0LKfiMU6Emt/EiIvIr5sou6udpsp6bDDvQpG26dZ
 aBAw1hbnikzTvAEM3yrXCl/XjzkiWctb8XW+cnDyCCOwmhS34hj9iqHIBv1Tf4qFTxryS8bm4en
 NdABLO7YliAWqT8n/wOiSwciadjekZLqC11y2KTImrNdJxFI5XbF+n6+DosLvvVr3Mlhz2XzLAA
 xQ+OsUAD3FuuzuWax8hMe3JH/87xPRN534xsvflvZrbQIA49L8UZP02ECL+Qs1H4uZNuuoxCjdn
 zFYoevpOwFZ5pJnn+5LFSqZ8/VJ0/onEuZ4z3hIIXolRU5RjRvkpLaX9r0fb+rZW6kc5PGYkVc2
 uT2v1xxSkNaWqSZ2NAdXu+MJop86dCdbPYWurXuz1G7ojrjQn2nG6plIAVzwOY0bDdTbSdDP4ol
 15uTJOWvI97pM=
X-Google-Smtp-Source: AGHT+IFQDR1xTAuSQ2ujiF1xjA/I9MaWdKuL0qBL9qRzchsXA1UY8OQjAHFutP95gcm7NDC0nKdQ1w==
X-Received: by 2002:a05:6e02:17cb:b0:423:fb44:e8c9 with SMTP id
 e9e14a558f8ab-423fb44eb67mr77514355ab.11.1757982317431; 
 Mon, 15 Sep 2025 17:25:17 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-41dfb14c032sm62095355ab.40.2025.09.15.17.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 17:25:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 18:25:15 -0600
Message-ID: <20250916002515.2488746-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757982317; x=1758587117; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V32si9xMgzhk8wv3XrtT99dj4i1YqFic0VA7zbr2/Ts=;
 b=WyzAwEr7n2e7JAIiHz1wl0Q0lZ8DTEnISYza1zqI0DtuI9VwvmkcyzNYPZ7AU1RTFg
 o4+h85PFhbicGpv0fosm7mYKeOlEZi7YmhleBXf0PVXcECuB1DMPtSh/+35pZR8ntLB1
 2M3c9ZwNLImnjptjx5BOpOkmOlMSbWXiVWyeUHpZ5bWRYHYVV2GASojac8lY5PEWengS
 /uJDXJXCkjRD6KkfeGiuZa8ErU9de+yqwPp2Snh5KBVn3/a35FtYftUZKU7z6x9HHO3V
 cEhvBFfVSObTqhOxA7pzsZGzGkn2R/8WPp+WF1TBWDETwqvJtqY5/oIUDGN+zFiNpjy5
 M9nQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WyzAwEr7
Subject: [Buildroot] [PATCH 1/1] package/python-pycparser: bump to version
 2.23
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
 package/python-pycparser/python-pycparser.hash | 4 ++--
 package/python-pycparser/python-pycparser.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycparser/python-pycparser.hash b/package/python-pycparser/python-pycparser.hash
index 3ec1862b75..b93c6ac906 100644
--- a/package/python-pycparser/python-pycparser.hash
+++ b/package/python-pycparser/python-pycparser.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycparser/json
-md5  8922b0b1b53b419e3a38fba4aa43a348  pycparser-2.22.tar.gz
-sha256  491c8be9c040f5390f5bf44a5b07752bd07f56edf992381b05c701439eec10f6  pycparser-2.22.tar.gz
+md5  bb4946a7b0d83569f5d29f566a55180a  pycparser-2.23.tar.gz
+sha256  78816d4f24add8f10a06d6f05b4d424ad9e96cfebf68a4ddc99c65c0720d00c2  pycparser-2.23.tar.gz
 # Locally computed sha256 checksums
 sha256  0c846399369ea76ddd7b5c44fe6d16497415fcf015f5cbb508c24bf98b81c5b1  LICENSE
diff --git a/package/python-pycparser/python-pycparser.mk b/package/python-pycparser/python-pycparser.mk
index 6d01844fb3..7194347e78 100644
--- a/package/python-pycparser/python-pycparser.mk
+++ b/package/python-pycparser/python-pycparser.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCPARSER_VERSION = 2.22
+PYTHON_PYCPARSER_VERSION = 2.23
 PYTHON_PYCPARSER_SOURCE = pycparser-$(PYTHON_PYCPARSER_VERSION).tar.gz
-PYTHON_PYCPARSER_SITE = https://files.pythonhosted.org/packages/1d/b2/31537cf4b1ca988837256c910a668b553fceb8f069bedc4b1c826024b52c
+PYTHON_PYCPARSER_SITE = https://files.pythonhosted.org/packages/fe/cf/d2d3b9f5699fb1e4615c8e32ff220203e43b248e1dfcc6736ad9057731ca
 PYTHON_PYCPARSER_SETUP_TYPE = setuptools
 PYTHON_PYCPARSER_LICENSE = BSD-3-Clause
 PYTHON_PYCPARSER_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
