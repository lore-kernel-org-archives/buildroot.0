Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9370C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 19:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E86AA60B15;
	Mon,  1 Jul 2024 19:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xl2Pp5ElINEH; Mon,  1 Jul 2024 19:58:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE7FD60AD6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE7FD60AD6;
	Mon,  1 Jul 2024 19:58:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0768D1BF346
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 19:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E937F81357
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 19:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CXUJXstbu1ga for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 19:58:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C8F3281112
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8F3281112
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8F3281112
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 19:58:12 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-379c1f83db7so13216485ab.0
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 12:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719863891; x=1720468691;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L9Qcq15D2QBEEpQzx6qtVJ5Pwcl+szzfCKgapCNwYBQ=;
 b=ijFypDiifNDDHgOLdtFUBLHcpnCJ7QHPpLGUvYni7kUfVe2HNz+69jrXatZVhq/6RD
 Ee1/SvLhovV18E0IDX5jiKqqMsaLG+5Ez+WX+jiqJJhWdsbOQBY167jyjLwICa7RcBFR
 2/zz6C+IY52gbDTvnQw+gY8HEBNeTRrxjxywHbDlc8mmDdiRXn+5Dvk1CuAaUXDJooe/
 hTLiqtYoKBhR+HFuY9AyVKa282fq7m5waCb2w9Bqa0a6OepZkipBh0+dXWGuhtQni+wY
 HHTW19j/+wFWl4sbP+2/Iw/FFxDrctUE0nWRwqZYzczRsp/fABjacmlkxt9o+KRvlLIn
 JyWw==
X-Gm-Message-State: AOJu0YzopHkkHdHJC6Gpl6s5aEecd+CBNPN4W3r7DnIbsogV9mXGj2Dy
 86IlKhRYTUVj4VPFP+S/eXdkWJkhQ1MdY3FewhYuaegR1F6+q657ol1NNg==
X-Google-Smtp-Source: AGHT+IHkdbDP+f5+frdgXqeRhVJwoHR2eoMPEm8oZAdhNdXph4uOhTBVX5dcbOWIGjrgq1TsjjigVA==
X-Received: by 2002:a05:6e02:170a:b0:376:2246:3b43 with SMTP id
 e9e14a558f8ab-37cbadfc204mr33445335ab.1.1719863891398; 
 Mon, 01 Jul 2024 12:58:11 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-37ad4370ca6sm20215085ab.59.2024.07.01.12.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 12:58:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 13:58:09 -0600
Message-Id: <20240701195809.1795573-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719863891; x=1720468691; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L9Qcq15D2QBEEpQzx6qtVJ5Pwcl+szzfCKgapCNwYBQ=;
 b=RzM5YxLaT9vVJbtXfdcyYYooQsxGcu71YYsE+1Nuzp32pONNWS6T+FrZ/GYRJiqBBJ
 pCs24+vF+15PCnUGSH/WZHdgrLL386VZoKzg0/z4FMT+oeiAlkvlc4+vvPhdhEcgygFI
 aI5KtoYYSQkO7baMbMykJ3C6h/mZMNJbDHA8Uz7cJkp3ydvZ233A158RwBS9bQ5OLAut
 1cJ5qZ2ZO61jK7ct4XEIyfosZtBLGK3GQs4QbRyP6C/2agpaXziwnz0ZdAa4TbJRVMU/
 ez4jVSXJyGyQOpXubZ+CFXmgJXQdNnKqO7qYFKTaSpo1QcNbFcvxNTJhiecu1jDUOAFb
 0g6A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RzM5YxLa
Subject: [Buildroot] [PATCH 1/1] package/python-typing-extensions: bump to
 version 4.12.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-typing-extensions/python-typing-extensions.hash    | 4 ++--
 package/python-typing-extensions/python-typing-extensions.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typing-extensions/python-typing-extensions.hash b/package/python-typing-extensions/python-typing-extensions.hash
index 778b2d5771..8e2c405929 100644
--- a/package/python-typing-extensions/python-typing-extensions.hash
+++ b/package/python-typing-extensions/python-typing-extensions.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing-extensions/json
-md5  2bcafbd6817cb0d7a29ed7a7f1bb1e5d  typing_extensions-4.9.0.tar.gz
-sha256  23478f88c37f27d76ac8aee6c905017a143b0b1b886c3c9f66bc2fd94f9f5783  typing_extensions-4.9.0.tar.gz
+md5  cf64c2313f5fa5eb04c1deb3fc93abe9  typing_extensions-4.12.2.tar.gz
+sha256  1a7ead55c7e559dd4dee8856e3a88b41225abfe1ce8df57b7c13915fe121ffb8  typing_extensions-4.12.2.tar.gz
 # Locally computed sha256 checksums
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python-typing-extensions/python-typing-extensions.mk b/package/python-typing-extensions/python-typing-extensions.mk
index 89ed75bda7..66f8872bf5 100644
--- a/package/python-typing-extensions/python-typing-extensions.mk
+++ b/package/python-typing-extensions/python-typing-extensions.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_EXTENSIONS_VERSION = 4.9.0
+PYTHON_TYPING_EXTENSIONS_VERSION = 4.12.2
 PYTHON_TYPING_EXTENSIONS_SOURCE = typing_extensions-$(PYTHON_TYPING_EXTENSIONS_VERSION).tar.gz
-PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/0c/1d/eb26f5e75100d531d7399ae800814b069bc2ed2a7410834d57374d010d96
+PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/df/db/f35a00659bc03fec321ba8bce9420de607a1d37f8342eee1863174c69557
 PYTHON_TYPING_EXTENSIONS_SETUP_TYPE = flit
 PYTHON_TYPING_EXTENSIONS_LICENSE = Python-2.0
 PYTHON_TYPING_EXTENSIONS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
