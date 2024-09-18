Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFC3CDD55C
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 20:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D79040096;
	Wed, 18 Sep 2024 20:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lkVNr94XMadH; Wed, 18 Sep 2024 20:38:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7F92401F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7F92401F6;
	Wed, 18 Sep 2024 20:38:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C7FF1BF30C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A7B44279D
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3C6aCRxfm6kN for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 20:38:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0CB8E42791
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CB8E42791
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CB8E42791
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 20:38:24 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3a09cdeab8eso505485ab.0
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 13:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726691903; x=1727296703;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W+dYu9U0HeXC7cyuQBYi6GjZDtIebcwU/FbmFteL+40=;
 b=VSp0t42uJFix6+3pcAH/hAGDBbhoS7eYHrXwyeW9qpXjlV5+kFeTus/Tw+gnhR5zfc
 IKl4g8i/U6zCj/acspP9lAfeOOy8YaKOya0rYwk6IzvYgbRNo/wZZeB27bVpXum22T0D
 PkncW2tL1JhJ4/ZjNF9oZ8tp0675AlUPTe7m08Gb7hOCt7GvB07maS574GTXbm4pFRB5
 0g6Ojo8KE15lUs6XuOcQKHumPB1U8a+GTrdlsze95fKfhKm7JIKgPqH/KRDMzslGd1DD
 hdRR3AK6T1jSXmYVlhg5RTZfoT13ZPzrxF7m0e3Ix42NQ8Sy+4H+LIW0uurY1J4uof8p
 4M1w==
X-Gm-Message-State: AOJu0YwhfZezXxJgEXm+xKhseDoK4V/Oh278Ca/b/d2H5TmIlqPNfQOJ
 paPD1wAb25meUtcrgEzUOBeTIBTrhRK3bT0iBxWaWUxL5aFqmo9H3Dv2YKYP
X-Google-Smtp-Source: AGHT+IFquiKWp+30FHtJz//9cPxjc7cw0ztYvo92qf0BiTE4evWeEIkxDobs2XIXYXDRMn0pAaYi9Q==
X-Received: by 2002:a05:6e02:1b0d:b0:3a0:4db0:ddbf with SMTP id
 e9e14a558f8ab-3a08b711bf1mr209642035ab.8.1726691903422; 
 Wed, 18 Sep 2024 13:38:23 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec206c2sm2703974173.63.2024.09.18.13.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 13:38:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 14:38:21 -0600
Message-Id: <20240918203821.428603-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726691903; x=1727296703; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W+dYu9U0HeXC7cyuQBYi6GjZDtIebcwU/FbmFteL+40=;
 b=OF6zr6rAdEqBjv2IU2nuVYHXJrYmW8XJeCpC58z+qy/1L2dcsha62UecznzwjvXtcx
 7P2SyT0ntHMS41NmAmRTfhYc8hLo8gUL++NrJLfAAnAWQwctMZUkGr1BW8eDzVJJrCs+
 Xxyy+i5qt7MLZcUS1LNKfBjqONxStZ0gxqiNUcwXfSj0d3cQXYezf67ZK7H9m/45ywrP
 mw4w5O5E3ehSMfjVxn/z0eAQq/eI/peDkCeZg7m4D+uMstp/1Vuhz2OnD3KSzsX6JKMz
 pMOvwF5C2aCWnIVwojf0HcWtqhza30eWsgjnOUv/HRTw6glISN3PA+2x0eyQoTvg4+cR
 fDDQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OF6zr6rA
Subject: [Buildroot] [PATCH 1/1] package/python-pytest-asyncio: bump to
 version 0.24.0
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
 package/python-pytest-asyncio/python-pytest-asyncio.hash | 4 ++--
 package/python-pytest-asyncio/python-pytest-asyncio.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.hash b/package/python-pytest-asyncio/python-pytest-asyncio.hash
index 53bf62340c..a88d1c5841 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.hash
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest-asyncio/json
-md5  e419d6fbc626b366814b7b698fa79236  pytest-asyncio-0.23.6.tar.gz
-sha256  ffe523a89c1c222598c76856e76852b787504ddb72dd5d9b6617ffa8aa2cde5f  pytest-asyncio-0.23.6.tar.gz
+md5  510ca6136236bba0f0581aa46060ae03  pytest_asyncio-0.24.0.tar.gz
+sha256  d081d828e576d85f875399194281e92bf8a68d60d72d1a2faf2feddb6c46b276  pytest_asyncio-0.24.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a8ad31b1c3f40dca5a84119351b8fa8ddc868edd77fad8a8ebf6d8f2d16fa4ae  LICENSE
diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.mk b/package/python-pytest-asyncio/python-pytest-asyncio.mk
index 88f93d83e0..ae0934e00f 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.mk
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_ASYNCIO_VERSION = 0.23.6
-PYTHON_PYTEST_ASYNCIO_SOURCE = pytest-asyncio-$(PYTHON_PYTEST_ASYNCIO_VERSION).tar.gz
-PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/cd/ef/80107b9e939875ad613c705d99d91e4510dcf5fed29613ac9aecbcba0a8d
+PYTHON_PYTEST_ASYNCIO_VERSION = 0.24.0
+PYTHON_PYTEST_ASYNCIO_SOURCE = pytest_asyncio-$(PYTHON_PYTEST_ASYNCIO_VERSION).tar.gz
+PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/52/6d/c6cf50ce320cf8611df7a1254d86233b3df7cc07f9b5f5cbcb82e08aa534
 PYTHON_PYTEST_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_PYTEST_ASYNCIO_LICENSE = Apache-2.0
 PYTHON_PYTEST_ASYNCIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
