Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F331BE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 19:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB1DA83C92;
	Sat, 11 Jan 2025 19:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1vf3RhNdoRfd; Sat, 11 Jan 2025 19:11:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EEEF83C8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EEEF83C8C;
	Sat, 11 Jan 2025 19:11:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C20D950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 19:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D63C40204
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 19:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rqvinu2531Uw for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 19:11:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 81A7240271
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81A7240271
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81A7240271
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 19:11:04 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3cdce23f3e7so22505965ab.0
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 11:11:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736622664; x=1737227464;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V2yqayJ/HJWaGoPFWRdNrlYkpyY6Xu84/kvRWQTXe/c=;
 b=OVSTMKSOmZr/18rs7McojpyGn2EMIAdFK2wYPHZTcSRiPrTb/VAGeMxyKrRSI1T8IA
 ZhcwAHrYj6Ehalr4ouKHJM0Bq3YScW6/8Ow5biTbfmsP/VLqZjlSTtwLUy1FLjdgx2Y7
 ++lUS/7KKOb5pwSbY8dWbJxme1Gy48G9ZxVmM+Tc4ddM9PnNuK3BDVEdej+YrZTuI8dw
 +Ee053bZE8OHl7ni45QSPrECEpblMc+EnP040Or2+eORhkdSFw6dksOIFUXvHDhw8b0w
 b7W3sGnNJ4uV0p5Bhstha/pJMLqrgQE+pF5Au9zldCW/hIToUHL0ruwAEMLg5yFP3g/I
 ZHwQ==
X-Gm-Message-State: AOJu0Ywmx1/bvHy8fxLHdsfnuOpvX39xSQXpZhx7RA4zeogK/fBknqHd
 Sw7fRvlCE+eSdOjvbV+mjZ5d/AZ+HCAYy0Zp8/ZeeSlPolnvIgXs83V0tPkWAr0=
X-Gm-Gg: ASbGncvrbtoKRPMELw2s/0aATHz9sEtwtugE/vy5hp63SEUqvdCokktlavJSmC09teU
 0Ca5f1y2xKcP2d1QhVPQMIuwTDlx1DSwLivwqHyJAK90zj6HsvcNYVoCU42k6KMEhznjrLbxgoH
 5FAvOfcQLLnf4bCGdRMtodVRpY1vC+GsCIdeHg4jw5dd3aZOeYZu1mEfydO7UI1NsIW1n7vaF74
 4SCX9Z/nILA3JgIMSjizLS7YJQYZbEbpSHxZa7ZgK9yyoCXfwGKcXWCGg5otkp95rkexgryvYoK
 /MRRZssZbVNMr2VbfT0QyK65N69MzA4=
X-Google-Smtp-Source: AGHT+IHlRRewg/Uzc34EGxYqIAMkEKtxgS702T2MGZpdRY6vH4QE7qD9itDSF5q7PohyW2hc/x0iCQ==
X-Received: by 2002:a05:6e02:1445:b0:3a7:c072:c69a with SMTP id
 e9e14a558f8ab-3ce3a9a4ad1mr129557575ab.3.1736622663867; 
 Sat, 11 Jan 2025 11:11:03 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b5f8eb6sm1699112173.1.2025.01.11.11.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 11:11:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 12:11:02 -0700
Message-Id: <20250111191102.2965266-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736622664; x=1737227464; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V2yqayJ/HJWaGoPFWRdNrlYkpyY6Xu84/kvRWQTXe/c=;
 b=f7Kl05+xlPEk+TZwoFxM7lWDJuzvxkFajZNlf9MkQ3wGBcGme4Buz1SPAubbU74+C/
 F2kRJ1gGOIeC9TFbtHca3uhq1Cp7/KyzCr6AZj9of5IFQwT6U4FgGCU/fmh1R6nPZktq
 eS64EQ1wX92H/J/K5kfaBzSO/35Mvn45/IdFJVWz4gENtNNECPgk6WT/Iu+CSFl3te42
 tdyKvJ5Ps0yxoP5GHzle5Eo1nK0luCh4IxsRnC/TFHF2qKw8kEPTmM+zEUjb3ScK33iG
 KOf5MLkiVzBH3Zcdn+PVZFpg34or6GCol95yHixG4JI1awS0paxn0DnJgyhyCC5DWnON
 hrIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=f7Kl05+x
Subject: [Buildroot] [PATCH 1/1] package/python-ws4py: bump to version 0.6.0
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

Drop patch which is no longer required.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...1-Adjust-ws4py-for-Python-3.7-syntax.patch | 55 -------------------
 package/python-ws4py/python-ws4py.hash        |  4 +-
 package/python-ws4py/python-ws4py.mk          |  4 +-
 4 files changed, 4 insertions(+), 60 deletions(-)
 delete mode 100644 package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 84b1e7ae00..ee89f7e4bf 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1023,7 +1023,6 @@ package/python-scipy/0001-build-sh4-FE.patch lib_patch.Upstream
 package/python-setuptools/0001-add-executable.patch lib_patch.Upstream
 package/python-sip/0001-remove-join-from-sip-h-files-string.patch lib_patch.Upstream
 package/python-web2py/S51web2py Shellcheck lib_sysv.Variables
-package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch lib_patch.Upstream
 package/python3/0001-Make-the-build-of-pyc-files-conditional.patch lib_patch.Upstream
 package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch lib_patch.Upstream
 package/python3/0003-Add-an-option-to-disable-pydoc.patch lib_patch.Upstream
diff --git a/package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch b/package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch
deleted file mode 100644
index 12dac30db8..0000000000
--- a/package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From dfe6f65b7078315c32cebb727e9c47ead7603475 Mon Sep 17 00:00:00 2001
-From: Asaf Kahlon <asafka7@gmail.com>
-Date: Sun, 13 Oct 2019 16:44:44 +0300
-Subject: [PATCH] Adjust ws4py for Python 3.7 syntax
-
-Since Python 3.7, "async" has become a keyword and cannot be used.
-Thus, instead of asyncio.async we will use asyncio.ensure_future.
-
-There's also a pull request with this change:
-https://github.com/Lawouach/WebSocket-for-Python/pull/245
-
-Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
----
- ws4py/async_websocket.py    | 4 ++--
- ws4py/server/tulipserver.py | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/ws4py/async_websocket.py b/ws4py/async_websocket.py
-index 9e2a4c7..ea296b4 100644
---- a/ws4py/async_websocket.py
-+++ b/ws4py/async_websocket.py
-@@ -84,7 +84,7 @@ class WebSocket(_WebSocket):
-         def closeit():
-             yield from self.proto.writer.drain()
-             self.proto.writer.close()
--        asyncio.async(closeit())
-+        asyncio.ensure_future(closeit())
- 
-     def _write(self, data):
-         """
-@@ -94,7 +94,7 @@ class WebSocket(_WebSocket):
-         def sendit(data):
-             self.proto.writer.write(data)
-             yield from self.proto.writer.drain()
--        asyncio.async(sendit(data))
-+        asyncio.ensure_future(sendit(data))
- 
-     @asyncio.coroutine
-     def run(self):
-diff --git a/ws4py/server/tulipserver.py b/ws4py/server/tulipserver.py
-index 2786c16..85312a2 100644
---- a/ws4py/server/tulipserver.py
-+++ b/ws4py/server/tulipserver.py
-@@ -40,7 +40,7 @@ class WebSocketProtocol(asyncio.StreamReaderProtocol):
-         #self.stream.set_transport(transport)
-         asyncio.StreamReaderProtocol.connection_made(self, transport)
-         # Let make it concurrent for others to tag along
--        f = asyncio.async(self.handle_initial_handshake())
-+        f = asyncio.ensure_future(self.handle_initial_handshake())
-         f.add_done_callback(self.terminated)
- 
-     @property
--- 
-2.20.1
-
diff --git a/package/python-ws4py/python-ws4py.hash b/package/python-ws4py/python-ws4py.hash
index 1e809fee0a..fc14748b8d 100644
--- a/package/python-ws4py/python-ws4py.hash
+++ b/package/python-ws4py/python-ws4py.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ws4py/json
-md5  68e0cfae9659dd059ff7e7a8218af548  ws4py-0.5.1.tar.gz
-sha256  29d073d7f2e006373e6a848b1d00951a1107eb81f3742952be905429dc5a5483  ws4py-0.5.1.tar.gz
+md5  373750c014b6a5e225aad4cf5b0a5721  ws4py-0.6.0.tar.gz
+sha256  9f87b19b773f0a0744a38f3afa36a803286dd3197f0bb35d9b75293ec7002d19  ws4py-0.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3c98d9e820de01b1ae3be846419700ab9cefa22b09aa0ef441b3bfd5613c3ba1  LICENSE
diff --git a/package/python-ws4py/python-ws4py.mk b/package/python-ws4py/python-ws4py.mk
index edfd5d0df1..c76c636d8b 100644
--- a/package/python-ws4py/python-ws4py.mk
+++ b/package/python-ws4py/python-ws4py.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WS4PY_VERSION = 0.5.1
+PYTHON_WS4PY_VERSION = 0.6.0
 PYTHON_WS4PY_SOURCE = ws4py-$(PYTHON_WS4PY_VERSION).tar.gz
-PYTHON_WS4PY_SITE = https://files.pythonhosted.org/packages/53/20/4019a739b2eefe9282d3822ef6a225250af964b117356971bd55e274193c
+PYTHON_WS4PY_SITE = https://files.pythonhosted.org/packages/cb/55/dd8a5e1f975d1549494fe8692fc272602f17e475fe70de910cdd53aec902
 PYTHON_WS4PY_SETUP_TYPE = setuptools
 PYTHON_WS4PY_LICENSE = BSD-3-Clause
 PYTHON_WS4PY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
