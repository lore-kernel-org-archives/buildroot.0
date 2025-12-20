Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAF9E668BC
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF33460E26;
	Sat, 20 Dec 2025 21:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tdI_t8E3MyPs; Sat, 20 Dec 2025 21:41:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CC6A60E27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766266880;
	bh=ay4PDtisGfElhHLWgNmY4P7NOGOphP+m3TiiSDGFllQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bjoc5IKIVYtyyuZYNgZW6P7QpYVm8C/O0pCRlkjgr8JgNY8HubDSHNKURb8WYMrXw
	 MK/0mK/1l35rtTXEKi5YDiKWZJwii9Uv3xIV68dpziGHOgCP9raOQlMJZ6zNOoZElN
	 hj5SOxRSxP/PTVqwEGgjZAfyHEUbE65kpD8dj5yarbMoE0wf+9Bonq5uYId7R/LAX6
	 l/jfUFmWEhrHgqEzh5mFwn++CsduAW1Wv+ubC/JjxLhDrOt8GBsy3JgNBtWWTOjIjr
	 HR82Xy61AKD4YC4jTXOXcjbbD5bOF+yLcp5EjVXuqxYgsMjh5nkP7AQaBO/7QUVHje
	 YYB6YIbH53gtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CC6A60E27;
	Sat, 20 Dec 2025 21:41:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 956B1119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 881DF40197
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kFGHWeaItLFh for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:41:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D0EB40855
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D0EB40855
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D0EB40855
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:41:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 20330A4C4D7A;
 Sat, 20 Dec 2025 22:39:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57228)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4fz-000000001mj-1JhU;
 Sat, 20 Dec 2025 21:39:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:39:41 +0100
Message-ID: <20251220213946.1088820-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220213946.1088820-1-bernd@kuhls.net>
References: <20251220213946.1088820-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266796;
 bh=LaM2srKBWOXXJOor5oiXSnJoAA7oT8mDO1f0q6jH0EE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=V6Bp6VjGRdkofYJ0omOldEf+riwWe6qtBfXYShMoWCze4FWoAb0hgcfVhun5Oxawe
 GJiW6CJVA2e+t9YvJVrWBlSgpyOxGjvOxFgemUnBagJxVSRIfjhVf0vuvuqE6cgC65
 zOul6NuK/MRA6vodj11wmuodPpy9ogkrxtjAoKK/M/A2fQZU3UfDWLpfwe5eHm9omj
 6mbORoxjqjG2roBWz9aKrizh4KdsyiSBKUoSevqa2kHbCvqtsQ0ZfmgxJ5+CPw2M/q
 m/hO1X+acakeZrn/aOY0Num1L2KJA1UG9+Cg19jtdNoytJ/W88EmWiev9EFhaoABxr
 t8GKY230cp6vA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=V6Bp6VjG
Subject: [Buildroot] [PATCH 10/15] package/python-iowait: update tarball URL
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-iowait/python-iowait.hash | 3 ++-
 package/python-iowait/python-iowait.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python-iowait/python-iowait.hash b/package/python-iowait/python-iowait.hash
index fc10e180f3..35ad91cb69 100644
--- a/package/python-iowait/python-iowait.hash
+++ b/package/python-iowait/python-iowait.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/iowait/json, sha256 locally computed
+# md5, sha256 from https://pypi.org/pypi/iowait/json
 md5  f49ca7766fe4a67e03a731e575614f87  iowait-0.2.tar.gz
 sha256  ab1bc2eb84c22ccf61f17a0024f9fb6df781b39f1852764a66a7769d5adfb299  iowait-0.2.tar.gz
+# Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSER
diff --git a/package/python-iowait/python-iowait.mk b/package/python-iowait/python-iowait.mk
index 028001d7f3..d7738c7eb4 100644
--- a/package/python-iowait/python-iowait.mk
+++ b/package/python-iowait/python-iowait.mk
@@ -6,7 +6,7 @@
 
 PYTHON_IOWAIT_VERSION = 0.2
 PYTHON_IOWAIT_SOURCE = iowait-$(PYTHON_IOWAIT_VERSION).tar.gz
-PYTHON_IOWAIT_SITE = https://pypi.python.org/packages/65/30/e953673fe9619938e9c74408401cf865f37716da89f61f6e5d9328c0f71e
+PYTHON_IOWAIT_SITE = https://files.pythonhosted.org/packages/65/30/e953673fe9619938e9c74408401cf865f37716da89f61f6e5d9328c0f71e
 PYTHON_IOWAIT_SETUP_TYPE = setuptools
 PYTHON_IOWAIT_LICENSE = LGPL-3.0+
 PYTHON_IOWAIT_LICENSE_FILES = COPYING.LESSER
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
