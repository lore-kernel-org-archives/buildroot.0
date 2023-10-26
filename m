Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4461EC25B6B
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 09:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB382417A1;
	Thu, 26 Oct 2023 09:31:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB382417A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mqVoE5XqFGu8; Thu, 26 Oct 2023 09:31:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A057417E6;
	Thu, 26 Oct 2023 09:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A057417E6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 970D41BF2B8
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FBEE6124C
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FBEE6124C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TfXlq9ckcwEk for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 09:27:23 +0000 (UTC)
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8BD916124D
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 09:27:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BD916124D
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-9c603e2354fso135273466b.1
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 02:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698312441; x=1698917241;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=za/Bx7mDU113OmIs/fc3ObpTh2nSKTbT1sWXFa+8qVQ=;
 b=Fz1dbZGN73P7fAxnmy0j6tlZyVpn9lHG6qE5pU2qEwALVT/j60+GEPc77PX3BoRprN
 1YBnBf9Goqn4Sudpeqaz7hApUR3LGd02/nvu8GYJHMVkunmSz69fD91/B92yvtERH6hq
 I7hl3utXjBYwJ//H9vHZwuQzl8mlGIx6JnXW5fMzZvPOyPE5TGmOOFKtk+BRwHP4MLJg
 CCMXaPbxPBDNV2HyYsdLJNORcIrk3BBeJ6d10gROwvygeQa2AhpV6SJJiRia+CAoaUpz
 BPge53RhQk1sqDhE4XbnLU8TH72IsZmUxvyU8cIT+nKG/qmViEBbZXpxHDwgGh2rIFPb
 YLCg==
X-Gm-Message-State: AOJu0YxCYbCRtmUZJo6JbyZwCZfPXflC+Er1o3peV2n5gIlOPQ6oYr6p
 Znx3b8CXtiqU0G+Yc2fK3FUqI0/Znm5PmrLjXogH3i2byCyIoOp/
X-Google-Smtp-Source: AGHT+IH6ZuOgEBQFFDxKatbIOM29cDksiaWZrajMyFJX60DOkc4F5jf7TK/zXHjL4YGwUhgj6jvpqw==
X-Received: by 2002:a17:907:1ca4:b0:9aa:206d:b052 with SMTP id
 nb36-20020a1709071ca400b009aa206db052mr2202500ejc.27.1698312441433; 
 Thu, 26 Oct 2023 02:27:21 -0700 (PDT)
Received: from fedora.. ([77.241.232.0]) by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b009b947f81c4asm11268438ejb.155.2023.10.26.02.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:27:20 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 11:26:49 +0200
Message-ID: <20231026092701.12345-19-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698312441; x=1698917241;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=za/Bx7mDU113OmIs/fc3ObpTh2nSKTbT1sWXFa+8qVQ=;
 b=oRYjCTUcgH6s5y6tUJVDhHsMYrHQD8D1mnnvW69s+6o8vtXuvfa1ITON0LX43npI1f
 l+F7NrkZfuC/Z15baR/lggquz8Pyb0Q0ROeXyvL04PjcK53kQmPTVBTTCMs8VvMgkFBc
 obB6a/XANKU2kX+3Fqdsqf3+w+RXFhtlVDt6w=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=oRYjCTUc
Subject: [Buildroot] [PATCH 18/30] package/python-iptables: bump version to
 1.0.1
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/python-iptables/python-iptables.hash | 4 ++--
 package/python-iptables/python-iptables.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-iptables/python-iptables.hash b/package/python-iptables/python-iptables.hash
index ee5f765fba..1b7c9e9324 100644
--- a/package/python-iptables/python-iptables.hash
+++ b/package/python-iptables/python-iptables.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/python-iptables/json
-md5  3fb27da1107bdb62196850fa70e8b0d4  python-iptables-1.0.0.tar.gz
-sha256  480470adb5f29bf84269b4e53dbad9623af91c79aa666cc0274dec199a555bc5  python-iptables-1.0.0.tar.gz
+md5  bd6950c1ed9c6b48b7d552ff8e6766c5  python-iptables-1.0.1.tar.gz
+sha256  1989f2b48598392c3574052a95f456985cb06fb4287b61bf8794e93ebc37eddb  python-iptables-1.0.1.tar.gz
 
 # Locally calculated
 sha256  b827789c74144d9bb92595ed3bc568aef767a7e8d930fba61c2cdd9f6ec27599  NOTICE
diff --git a/package/python-iptables/python-iptables.mk b/package/python-iptables/python-iptables.mk
index 9cb4285ec3..d01545d8b2 100644
--- a/package/python-iptables/python-iptables.mk
+++ b/package/python-iptables/python-iptables.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_IPTABLES_VERSION = 1.0.0
-PYTHON_IPTABLES_SITE = https://files.pythonhosted.org/packages/ca/6e/cba9c6f4b5a1963b7f5b015f5ed5e2eec7a94ac460570e3474177c4004d6
+PYTHON_IPTABLES_VERSION = 1.0.1
+PYTHON_IPTABLES_SITE = https://files.pythonhosted.org/packages/35/e4/33e639b9e153c2d798d73342a96715a4edca6f46431d763b275a34b3aeca
 PYTHON_IPTABLES_SETUP_TYPE = setuptools
 PYTHON_IPTABLES_LICENSE = Apache-2.0
 PYTHON_IPTABLES_LICENSE_FILES = NOTICE
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
