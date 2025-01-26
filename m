Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A12EC02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 14:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 611D880EF5;
	Sun, 26 Jan 2025 14:29:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZWfIR89TVL2F; Sun, 26 Jan 2025 14:29:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75F3A812DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75F3A812DD;
	Sun, 26 Jan 2025 14:29:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19320941
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 14:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE56F4004A
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 14:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id THoM3ffAFx6T for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 14:29:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9C6DE400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C6DE400FE
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C6DE400FE
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 14:29:32 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-844cd85f5ebso256017539f.3
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 06:29:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737901771; x=1738506571;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=62iUNZBPculWh99XT3HSvataZKjo8pap+9DsxmWZUNs=;
 b=jU4yyNIv46EnxXz+f7OQAZJ7BxCtqrfVgWZwigWmb3KzqMD0rQnIau8SJvClqDxLP1
 ACNLDIYwWE6FYWnjIlG5qT0lX7+6YS9s6VnixQsc9IHZ4HT1nTS5FJKudoOuMqvw3hBS
 EuwIbEM2kaJDLBtGECLNoFYxmCCAkTeSH/miQXBr5jk+4c1Zc98Dxh0YuUtpttf6XrvY
 R7yGMxdndZTEoB1cx5pWo5JtkkjvqWhHCyE85zNohCemNN1VyXfrHbAscXdhWwXqYxuP
 x8Vi3EDcvc0oEUAKl3N6DtJbfTyWrEcd4ZDwGopNNJnJDACNfdKzxN4ERoTrd6jvZED0
 X1Ow==
X-Gm-Message-State: AOJu0Yzn37jlQNOc/4syvTd7y/b65u/ZDtom0jfONmIfnw0qT57VDeq5
 /QZRkEX0bbOpYWCyAjy7wYsBfrLt7wfIMJohHu39SkoN6cL9Ok9ggf6Ks6bn
X-Gm-Gg: ASbGncsmxA8/FysUXKhQbuoCIiQT6eZeuLp/op/MBcaLGbIby2s84X2uYuYuTNHPBT+
 W4EO6JWsrf9DOJsi8xbjuEF407Vk+jOX51jLk4L2MiRXO6xfpRjgzJ9xZeEuW5YqzDVTu+pptps
 OXPUTaF5R6h35bodgCPwLz8eytiE18101HjdoSUpE1z5qROwuFK6C6It3RlFcPHCrTNqrp7ngXO
 feXk0uGLv90oQR2cB68fcaaq11+sQYV8xueVOyLPsr3d+4zyAHnYCRggGsTtLNH65aDCw4OjvH9
 C5VKJOIorT5U0sRpyJSj17ucg20cpWavgLby8F0AMlRhLiSH3J12/dI=
X-Google-Smtp-Source: AGHT+IEPnB5Ilgaqcy4sge50apjxzv3nxXnZCEfrqDqSGEamAxLlUSPdBHl/zClzgomc6VbxzIMhnA==
X-Received: by 2002:a05:6602:3cc:b0:841:95b5:8953 with SMTP id
 ca18e2360f4ac-851b652cec6mr3894595139f.14.1737901771278; 
 Sun, 26 Jan 2025 06:29:31 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da2c8f9sm2024889173.40.2025.01.26.06.29.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 06:29:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jan 2025 07:29:29 -0700
Message-Id: <20250126142929.245887-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737901771; x=1738506571; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=62iUNZBPculWh99XT3HSvataZKjo8pap+9DsxmWZUNs=;
 b=VcwI5KGrY99tUdcYYwZyFeAMcQesbq7puTdG7NN3siwSfDaWMcQ7H1XcQkxXkERWZ/
 eDj87yTXbMG1LE6cFU7YrWEOGGWympt2QWMenjwkH9hiRwUOSguv3qp5fx+gsWkUuGfm
 e62o3KbQsqDYy+wRlwuClx4guKd+lu4nx1+5u1AE1BbYvSQN5QzO/X7NMwiAH+EZUysr
 D1a4UbG5uTx/Ar9P7lVE0DAIhuCLS+ap74J0in+HBIav4nF7IVfP9IFvwM3M7q11mkad
 Whn1bRnpYtyH0PF3Yy0Wis9ieB9oGv3mld6ben1brZ8d1+OOooxpDh1sugY2XyYi5OAH
 5w0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VcwI5KGr
Subject: [Buildroot] [PATCH 1/1] package/python-referencing: bump to version
 0.36.2
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
 package/python-referencing/python-referencing.hash | 4 ++--
 package/python-referencing/python-referencing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-referencing/python-referencing.hash b/package/python-referencing/python-referencing.hash
index ebf7208ad3..9cbd5e60a5 100644
--- a/package/python-referencing/python-referencing.hash
+++ b/package/python-referencing/python-referencing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/referencing/json
-md5  f76e7b565b6e25c83bc5815c870735b7  referencing-0.36.1.tar.gz
-sha256  ca2e6492769e3602957e9b831b94211599d2aade9477f5d44110d2530cf9aade  referencing-0.36.1.tar.gz
+md5  9d116186b2c5225c4e55254b94b2cd8e  referencing-0.36.2.tar.gz
+sha256  df2e89862cd09deabbdba16944cc3f10feb6b3e6f18e902f7cc25609a34775aa  referencing-0.36.2.tar.gz
 # Locally computed sha256 checksums
 sha256  42dcd63495f87b4eb7c7757afa379bb55a53f94afd7a5f657d9adf57236e515c  COPYING
diff --git a/package/python-referencing/python-referencing.mk b/package/python-referencing/python-referencing.mk
index dc70152beb..cabc9afa23 100644
--- a/package/python-referencing/python-referencing.mk
+++ b/package/python-referencing/python-referencing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REFERENCING_VERSION = 0.36.1
+PYTHON_REFERENCING_VERSION = 0.36.2
 PYTHON_REFERENCING_SOURCE = referencing-$(PYTHON_REFERENCING_VERSION).tar.gz
-PYTHON_REFERENCING_SITE = https://files.pythonhosted.org/packages/27/32/fd98246df7a0f309b58cae68b10b6b219ef2eb66747f00dfb34422687087
+PYTHON_REFERENCING_SITE = https://files.pythonhosted.org/packages/2f/db/98b5c277be99dd18bfd91dd04e1b759cad18d1a338188c936e92f921c7e2
 PYTHON_REFERENCING_SETUP_TYPE = pep517
 PYTHON_REFERENCING_LICENSE = MIT
 PYTHON_REFERENCING_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
