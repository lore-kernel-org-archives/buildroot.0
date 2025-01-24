Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B60C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 21:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7138608FE;
	Fri, 24 Jan 2025 21:16:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id avQx62FR43_K; Fri, 24 Jan 2025 21:16:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7C0A60903
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7C0A60903;
	Fri, 24 Jan 2025 21:16:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12235941
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3EE182023
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:16:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQW-smI-L5QN for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 21:16:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 10C2C81FCF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10C2C81FCF
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10C2C81FCF
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:16:18 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3cfc79a8a95so4009735ab.2
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 13:16:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737753378; x=1738358178;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iNpJ4PCJRR6S/G6HIaKuEbtzb6Wh1AxC8vqh8SQmp2s=;
 b=ZTSl/MPPLA5yFGnHvFUpV+MrLrriIh7ARiKArGiUiV4MGgkXp3+zSqlVVxVtACQr3a
 BkELT6GVleUMCqBXmSlvFniXOlaNjOFZQy3AuN9QqbhnpEeKOp5IiX3WwK2/7i7JD6wA
 tLuO+XnQtYsD5vowpP44Ou1opZJQ6bJYf5wFcQZaE5JQu1PWzSMY7jOypxP92Qji99uc
 3pGnDBuTO6WCoHmtznryxm5PK21YwMSU+pLVvZkd6GG1J761w0z5bxo57GumoYGwbqvo
 IE+5Q/FhDzd11xLBXw8+FI9ko6SZEfbIWPGeKo3oX+/bQlVyFI4PWj88vl9m0HTG214Z
 U+Mw==
X-Gm-Message-State: AOJu0YxuIHWOjeSjQzEaA0QMonNj2uE5oKWhxV3zJe53dhzRG7NfOQce
 WEYvFpap5D7x2UU7D19HY/XDJOwQ+bHwbgUFR0PkKWdD82aMXT6R6ruvN1zS
X-Gm-Gg: ASbGncsAjcZ9yeoSMLsvP6zZ3P//ox7Ot7YUvO2F+jxphIyCQDjIDt0U/lgFgbdHfiv
 zu91mAkP00+gmaLe4HABl8pwaBAHjKXBszl3ueZ7NjGFhN0eoOI3himbmoyALKUtxTN/5YBJMET
 fOl2ZbhSsep9TdAdTy0oluCH/jPbE8q6s9whQVVgqJqpqMYxmn9b0zhFIcRxXhb/HZ1uQ31Ge3k
 BFFBV5Bou9HF4egqp1m49HPXCqmtqcqDxwGb+Rp0rqfkEECBt6eJ0gGDqyslgT/H4EcHKlcL6q6
 gJWa0fcCPj7vg7Z/nOoL3v5KBFyOVQXbzds0f4/vQBHBPNjGUM25cto=
X-Google-Smtp-Source: AGHT+IFJdXHlkEmqkr+OoSSDhRwXUOX+YCKyFQra3+WdXxqI/ekPMDdHYA0nJGnjU6y79EXUfeL+jQ==
X-Received: by 2002:a05:6e02:fc4:b0:3cf:c5c4:1e37 with SMTP id
 e9e14a558f8ab-3cfc5c41eb3mr35667305ab.4.1737753377721; 
 Fri, 24 Jan 2025 13:16:17 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3cfc7506d29sm9064885ab.65.2025.01.24.13.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 13:16:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 14:16:15 -0700
Message-Id: <20250124211615.3874684-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737753378; x=1738358178; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iNpJ4PCJRR6S/G6HIaKuEbtzb6Wh1AxC8vqh8SQmp2s=;
 b=BOgTJXRobw9NvB+2H7XGra661D0jnafcBvpiZVjJyThmjYpmA+9t6TvNvxczcyDQXG
 kUgrmKxn+u2Sujvmm2gLJEcjABtf0eRGl40xzr9odpvhU4zK0QhRAVLE4mWC+CvqPrFb
 kSwMMIfczNPLeznvUVgauJ2tnVAC0viY+JiNK3SiPPYg3ZMmLSAQziINYmVXx29iqifa
 QMsNiCzIjZO5fbiwNZ/kTTKXvxnTqDdpLxYmMgODZePEc0IwqGgkuhSkfgUv1T2gZj5a
 hkWT7ZxIabqLh9GACWb6xdSDgmxr496QLLcOX0o0vU4Hgqc1gZZl4LZlhefvmaW5jbDB
 PKjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BOgTJXRo
Subject: [Buildroot] [PATCH 1/1] package/python-websockets: bump to version
 14.2
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-websockets/python-websockets.hash | 4 ++--
 package/python-websockets/python-websockets.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-websockets/python-websockets.hash b/package/python-websockets/python-websockets.hash
index 4ecc4868ad..3e762c5029 100644
--- a/package/python-websockets/python-websockets.hash
+++ b/package/python-websockets/python-websockets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websockets/json
-md5  eaef5161b6d36f8f66a1328c7e3bde7f  websockets-14.1.tar.gz
-sha256  398b10c77d471c0aab20a845e7a60076b6390bfdaac7a6d2edb0d2c59d75e8d8  websockets-14.1.tar.gz
+md5  26d1dc6e53395f537667d66ba1832ea7  websockets-14.2.tar.gz
+sha256  5059ed9c54945efb321f097084b4c7e52c246f2c869815876a69d1efc4ad6eb5  websockets-14.2.tar.gz
 # Locally computed sha256 checksums
 sha256  3d6a0c050d8bec52fabad502e45fb25bd02bcadbd70dea34d447b6a0ff4e6da8  LICENSE
diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
index f918bba383..2de0b32d58 100644
--- a/package/python-websockets/python-websockets.mk
+++ b/package/python-websockets/python-websockets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKETS_VERSION = 14.1
+PYTHON_WEBSOCKETS_VERSION = 14.2
 PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
-PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/f4/1b/380b883ce05bb5f45a905b61790319a28958a9ab1e4b6b95ff5464b60ca1
+PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/94/54/8359678c726243d19fae38ca14a334e740782336c9f19700858c4eb64a1e
 PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
 PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
