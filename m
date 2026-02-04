Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C816CEA7942
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 19:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E2498113B;
	Wed,  4 Feb 2026 19:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6pUq8wA7JKL7; Wed,  4 Feb 2026 19:12:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9D1B81145
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770232346;
	bh=LgikaoXxUdwaDSbq71brU3ssYaxO83yVef5T8GujOoU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=lzYdELqoNM9D4vEP6+HheB+GKLLDb6dd3yGJugEd4d1LunTyHfNY9GHHHrIbNUwLt
	 lxsJo2AoxPMPFveq1TrYy8xnrCoMnvwUHoZOCVkqcW8Nt6vN1TQs77GdZLXs/kKyqN
	 ZfhDz8NgB7hJMYYTzOWL97RJIwAHHPGn/shYgUz8KG6bFVOcif4RGYfMf8ntzUFXB+
	 qSVr9WuAXRAVC8rqoxERRXqLYAsrtAg0GbQ9UT33Q6zZM618P6C2/2axlyREqUwNlM
	 aRghXKd4WnSFrVYQwKMwEqWEVIWuSIB0BfMHWoBALPyBEM/DfhpIGdjMsrcDoLiQwj
	 culFDuGiqe5cQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9D1B81145;
	Wed,  4 Feb 2026 19:12:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BB8DF17A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A12404010F
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:12:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Q-84SiZvIif for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 19:12:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4A3C040012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A3C040012
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A3C040012
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:12:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 89FC1A4C00F5;
 Wed,  4 Feb 2026 19:58:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47736)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vni4t-000000004do-3Hsb;
 Wed, 04 Feb 2026 18:58:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 19:58:15 +0100
Message-ID: <20260204185815.1073311-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770231496;
 bh=85W6vaDexarMj8B1VwcrGkg8RA1YpIxS3lxnMGM49zc=;
 h=From:To:Cc:Subject:Date:From;
 b=q8sIWfu1DZabH2xY2qhWXrr2udjQu4qmGQjVXM41YsxucFuqyc0HMlUmmCAYuTuvf
 FoTwWVp3ghA3OafVpByEIiRGUwO8Bu7ri3VUwGlw110gGg+N5S/Fm06sJ7dAhQyKQS
 gwuUrLSU9ihhfjo6b/Eb4x+2lgATYjOyFmf4DRRhEZ5eB8WNT88dFP/HPruO+ZZnAw
 s5Oz236DcY5JKPDnpqkc41APVPUYMv0X7av2qMgjxIf3OQ99XTBpgUK3/vJOm2Sbsr
 qd+OcIacmQmxRujnl6bfe5f3ht8FmNFY/qeuVpg6Av22t7KyPPmVZODDsGxbDTXIZK
 i9NAkgHSb/MDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=q8sIWfu1
Subject: [Buildroot] [PATCH 1/1] package/python3: bump version to 3.14.3
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.python.org/downloads/release/python-3143/

Used sha256 tarball hash provided by upstream, upstream does not provide
a md5 hash anymore.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python3/python3.hash | 5 ++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

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
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
