Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4A4EC1E98
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 10:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BB9860C2E;
	Thu,  5 Feb 2026 10:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bn9VCdJDUQQz; Thu,  5 Feb 2026 10:35:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39DAA60AEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770287705;
	bh=xWMJZnDyzw5Wjn9cRoDIyO9R+vIPRliUZL8wAaNmSQo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=marhf9S2KCk5mUmAI3lroejNiws28UcYm/TPvv0b1XhFcf6oWg4A5scvAjdB6aOBy
	 pP+SqZB4qPCcTQ9667JTqYPe44wd4tnkCTov3T4FTfOSKgwX30hNT5IBLfy1wWaDNY
	 fFdmALvr0C82rnN7IC5QEqK0yoEf1pGuM7Js9iwzhy62Ay96VaUjBYuwLPT+t9kvJD
	 o1PW0hNf6eLWlu8ZgNaLzrnuEjoxVT7Sj+KRA3g/RfBrHMJV9L0m4p0nshTkAHobDq
	 SbvhhA1ciuImtu4ZI4MjqC0czz5wvk5HHpazDlkbCLnDMXJGLQWbU8d1UYKWNNS6GD
	 oN24KgLm/srVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39DAA60AEF;
	Thu,  5 Feb 2026 10:35:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1896517A
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 10:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09B9640166
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 10:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kvDbkN0arODo for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 10:35:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=162.248.234.2;
 helo=mail.xes-mad.com; envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0948E4006A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0948E4006A
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0948E4006A
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 10:35:02 +0000 (UTC)
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
 by mail.xes-mad.com (Postfix) with ESMTP id 1172B203B6;
 Thu,  5 Feb 2026 04:35:02 -0600 (CST)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Thu,  5 Feb 2026 04:35:00 -0600
Message-ID: <20260205103500.169542-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1770287702; bh=c8f8FR4vPVYV0kPq43kMPokNqv3ZfuqWcufaEHFiuT4=;
 h=From:To:Cc:Subject:Date:From;
 b=IWT7TxhC5rbrKwQeyhCD1lc66kABK6Fj4SbWGGyXc7PRvC1VZgGa9TJRZ8Tdji6vY
 ndIVsvMbAbbzb8v8ENvy8xYtEbgT9cf39cYevfrx51b67f+vSwO5sHlrmKz/G1JI0J
 UXHhJ69wzYWCPnEVGuV/pfqqc8WUU8yTMs1XtIr0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=IWT7TxhC
Subject: [Buildroot] [PATCH v3 1/1] package/python3: bump to version 3.14.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Vincent Fazio <vfazio@xes-inc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.python.org/downloads/release/python-3143/
https://docs.python.org/release/3.14.3/whatsnew/changelog.html

Update the hash file to use the sha256 hash provided by upstream.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
v3 changes:
* fix cut line typo

v2 changes:
* fix release URL
* drop md5 hash since the sha256 hash is provided by upstream
---
 ...h-139275-Fix-compilation-of-Modules-_remote_debuggi.patch | 3 ++-
 package/python3/python3.hash                                 | 5 ++---
 package/python3/python3.mk                                   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch b/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
index 7a72ebb16c..716d9d3e8a 100644
--- a/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
+++ b/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
@@ -8,6 +8,7 @@ Subject: [PATCH] gh-139275: Fix compilation of
 Upstream: https://github.com/python/cpython/commit/1963e701001839389cfb1b11d803b0743f4705d7
 
 [ Bernd Kuhls: ported to Python 3.14.2]
+[ Vincent Fazio: update to apply cleanly to 3.14.3 ]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  .../2025-09-24-17-32-52.gh-issue-139275.novrqf.rst              | 2 ++
@@ -41,7 +42,7 @@ diff --git a/Python/remote_debug.h b/Python/remote_debug.h
 index 8f9b6cd4c49..b7d17a0f345 100644
 --- a/Python/remote_debug.h
 +++ b/Python/remote_debug.h
-@@ -881,7 +881,7 @@ _Py_RemoteDebug_GetPyRuntimeAddress(proc_handle_t* handle)
+@@ -886,7 +886,7 @@ _Py_RemoteDebug_GetPyRuntimeAddress(proc_handle_t* handle)
              handle->pid);
          _PyErr_ChainExceptions1(exc);
      }
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index b71f6e7deb..b674b589bd 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,4 @@
-# From https://www.python.org/downloads/release/python-3142/
-md5  19a31b2838db3b53f9f2db8782bf8773  Python-3.14.2.tar.xz
+# From https://www.python.org/downloads/release/python-3143/
+sha256  a97d5549e9ad81fe17159ed02c68774ad5d266c72f8d9a0b5a9c371fe85d902b  Python-3.14.3.tar.xz
 # Locally computed
-sha256  ce543ab854bc256b61b71e9b27f831ffd1bfd60a479d639f8be7f9757cf573e9  Python-3.14.2.tar.xz
 sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 8195f4fd83..a240349d3e 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.14
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).3
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
