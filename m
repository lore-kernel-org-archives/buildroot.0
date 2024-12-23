Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269C1E7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 14:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D283480899;
	Mon, 23 Dec 2024 14:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RnVKtsdZjtDO; Mon, 23 Dec 2024 14:57:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D10EB8089A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D10EB8089A;
	Mon, 23 Dec 2024 14:57:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DD1ED757
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 14:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B121880899
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 14:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCWOMkUP6IJs for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 14:57:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C0CA080895
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0CA080895
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0CA080895
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 14:57:22 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-844c9993c56so377817339f.2
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 06:57:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734965841; x=1735570641;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q229zhL2l3k5hqGySVpyckPCmZnLH/Zao2qObJhAQ1I=;
 b=aclNYUWkaO+8UOjzQPaD0tFRBRuVJrK4kr3qSdFT/nmd8PfYpnEeRAJPKCZJqs40lm
 OH7FaqiPulEsmEOGdYNVMM9NcwlQ4cxf8iOrc/2ud/vOv5+fpjqypm7aFTZiM4fLIONA
 7A8E8hKZO/Zr9YJmG71usFARtTAfT2VVFbzL1ix7myLfleLSQCr6wTysP5C/ITWZMCpO
 V27PBwQpJ1j5I8ibDW3ZOaXxygtR9a41Mnyop09FrRh3v8N4OPo3wsJn5J8tmgH+0m8B
 QGM/yjrvArxSQfpsKMkYTBVxYI0KyeByn6X3jz8zqiwg5mATihvkgBA6yt/ykAFQ6j/0
 AO5g==
X-Gm-Message-State: AOJu0YzXAq617ppq+3XwN3XlNVaKZSKsgmmljpRXutd50MlzuCqVbOm2
 ebL2ZgKcpDx9G2VRLZltN0z0A2yZhAdq3+aKFSRnqXHSm24dWbCoSwQtGaOMQ2I=
X-Gm-Gg: ASbGncvv+LOqIIcwvmJTjk+0JglgtJMHZYOglg7EtQTa8U9r30yn8dB8+UD5DGsHnXB
 PDag2lkhsFa9rNly4OukXqps6K7LT6kwm6i1ugLpbS//rgah5IaKcaFH97XjaNusjEwTNMh1fJa
 xJE8j0YPR1Zl6kgdlY0snNQnIw8mSzFR95RNoTpTt7aD6I6Eerca7v5Zr9E/E9C0YDewR8Dd6pn
 cATSOEuc+ZMFRJKdM/w+Lsp18RE1zQQQdFe0Kq6XpqhntaiDespSe9d2gsOhzcoOUzyKTvTjjmZ
 x5zsdp+vjD+iTvdS0Ed69PcSTKnXR9QSWA==
X-Google-Smtp-Source: AGHT+IH0qhC3dGvcRWOZHTcHtc8iWjmXOTjQf6iaJxi0MIEheJ4um29mQ3qCHjDeLb49XM1xzLCnsw==
X-Received: by 2002:a05:6e02:3203:b0:3a7:3760:7314 with SMTP id
 e9e14a558f8ab-3c2d5b37841mr138796785ab.20.1734965841428; 
 Mon, 23 Dec 2024 06:57:21 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3c0de0545c8sm24127325ab.10.2024.12.23.06.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 06:57:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 07:57:16 -0700
Message-Id: <20241223145716.1722689-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734965841; x=1735570641; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q229zhL2l3k5hqGySVpyckPCmZnLH/Zao2qObJhAQ1I=;
 b=LsYT7Tgm+iE6EtIJl0zl66wrUOuVqRkrx6zutA1BZ0hvn3qpcePlDHCKccq4V4vGUu
 NWWiTu3UkRz00BCNpNo8HYvgRA1erB6/T1CwjsN/j7OdsKskcdgJQ+FaP3NznzLxxBlw
 lcMiADeCcAEL/KBynD6InGKXBMcG3Kd4gqixiAiEt+zaPOyawPPKtMm+TDCCFrb8FKvW
 T5SzQu96s+Y17Paco9d4/xCGfOHyfW7xh31uTN5mvEx0AAvmXXXTKHBalg9xvuMHYkhA
 94a8LqFs/jOYKzSYHAxybUYZ7f0sgGHHUCB0EoYafBUUq1bHXoOxAr5/2mSKkaOsGh+H
 8VMw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LsYT7Tgm
Subject: [Buildroot] [PATCH 1/1] package/python-aiosignal: bump to version
 1.3.2
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
 package/python-aiosignal/python-aiosignal.hash | 4 ++--
 package/python-aiosignal/python-aiosignal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiosignal/python-aiosignal.hash b/package/python-aiosignal/python-aiosignal.hash
index 061816a66e..53c7bbf51d 100644
--- a/package/python-aiosignal/python-aiosignal.hash
+++ b/package/python-aiosignal/python-aiosignal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiosignal/json
-md5  2a15f4008b899377590cef4773020902  aiosignal-1.3.1.tar.gz
-sha256  54cd96e15e1649b75d6c87526a6ff0b6c1b0dd3459f43d9ca11d48c339b68cfc  aiosignal-1.3.1.tar.gz
+md5  b40f0e0d5d442b6c1bc79e4e4c8eb7a6  aiosignal-1.3.2.tar.gz
+sha256  a8c255c66fafb1e499c9351d0bf32ff2d8a0321595ebac3b93713656d2436f54  aiosignal-1.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE
diff --git a/package/python-aiosignal/python-aiosignal.mk b/package/python-aiosignal/python-aiosignal.mk
index ffd581cfba..9e8597f504 100644
--- a/package/python-aiosignal/python-aiosignal.mk
+++ b/package/python-aiosignal/python-aiosignal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOSIGNAL_VERSION = 1.3.1
+PYTHON_AIOSIGNAL_VERSION = 1.3.2
 PYTHON_AIOSIGNAL_SOURCE = aiosignal-$(PYTHON_AIOSIGNAL_VERSION).tar.gz
-PYTHON_AIOSIGNAL_SITE = https://files.pythonhosted.org/packages/ae/67/0952ed97a9793b4958e5736f6d2b346b414a2cd63e82d05940032f45b32f
+PYTHON_AIOSIGNAL_SITE = https://files.pythonhosted.org/packages/ba/b5/6d55e80f6d8a08ce22b982eafa278d823b541c925f11ee774b0b9c43473d
 PYTHON_AIOSIGNAL_SETUP_TYPE = setuptools
 PYTHON_AIOSIGNAL_LICENSE = Apache-2.0
 PYTHON_AIOSIGNAL_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
