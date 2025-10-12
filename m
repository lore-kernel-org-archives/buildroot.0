Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DFDCCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 18:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FC5F811E7;
	Sun, 12 Oct 2025 18:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jtp26X3xx4gF; Sun, 12 Oct 2025 18:20:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFFE8811E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFFE8811E9;
	Sun, 12 Oct 2025 18:20:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 366CB12B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2851E811E7
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ya9BZZ-F_LW8 for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 18:20:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 299E0811CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 299E0811CD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 299E0811CD
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:20:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 85EF3A4C6705;
 Sun, 12 Oct 2025 20:20:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45202)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v80g4-000000000yp-3N62;
 Sun, 12 Oct 2025 18:20:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 20:19:57 +0200
Message-ID: <20251012182016.2711834-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012182016.2711834-1-bernd@kuhls.net>
References: <20251012182016.2711834-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760293217;
 bh=ZGd5uEXdSoaiSO3+c54qSLCArrnRQRLIkCMMXUrpgcU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=chjBVkus/hB1Rop8EMSDTdd+h+eqiuK5+Was0aNP01zEn4tR8xoe7YIcIA54mInRe
 jym/T3zwDDYxPP0w4mGmCUYXfdHzWs2F+ju4QWbxdHAZxiQ1EteLnMQp3mdxnPyXH8
 /bFhz3ggh4UHlH8LrSMYZDJf0ypLw/uuq+XwjEmUsouT1CdDVe6IgIsjJp+xYmICjS
 WpQ9zH2wn30FhtqlWZ5OEd+mkZsmUIzRRARd3GKf5QJDTirZ73qJdwAD6Y8dkddbd4
 hfBEr/bL1NGxd/1PxzDp6sPn5YK2tgxGskxqMYveSOyjXpY+ZIl/LWiWJJPxeGJdfl
 UlD/wX9cr10Tg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=chjBVkus
Subject: [Buildroot] [PATCH 02/21] package/python-async-lru: bump version to
 2.0.5
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
Cc: Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Grzegorz Blach <grzegorz@blach.pl>,
 James Hilliard <james.hilliard1@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-async-lru/python-async-lru.hash | 4 ++--
 package/python-async-lru/python-async-lru.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-async-lru/python-async-lru.hash b/package/python-async-lru/python-async-lru.hash
index 0a7cd03be9..8f296ce1ee 100644
--- a/package/python-async-lru/python-async-lru.hash
+++ b/package/python-async-lru/python-async-lru.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/async-lru/json
-md5  cd57e4d7f51bcbe2b940c523a5851b40  async-lru-2.0.4.tar.gz
-sha256  b8a59a5df60805ff63220b2a0c5b5393da5521b113cd5465a44eb037d81a5627  async-lru-2.0.4.tar.gz
+md5  c972e8755626506ca019085e0620e192  async_lru-2.0.5.tar.gz
+sha256  481d52ccdd27275f42c43a928b4a50c3bfb2d67af4e78b170e3e0bb39c66e5bb  async_lru-2.0.5.tar.gz
 # Locally computed sha256 checksums
 sha256  ea65975679bc2093be925d520358e41096bd96fddedee3e929160a5faadcf573  LICENSE
diff --git a/package/python-async-lru/python-async-lru.mk b/package/python-async-lru/python-async-lru.mk
index 16c6a32ffd..d80a8dfb6c 100644
--- a/package/python-async-lru/python-async-lru.mk
+++ b/package/python-async-lru/python-async-lru.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNC_LRU_VERSION = 2.0.4
-PYTHON_ASYNC_LRU_SOURCE = async-lru-$(PYTHON_ASYNC_LRU_VERSION).tar.gz
-PYTHON_ASYNC_LRU_SITE = https://files.pythonhosted.org/packages/80/e2/2b4651eff771f6fd900d233e175ddc5e2be502c7eb62c0c42f975c6d36cd
+PYTHON_ASYNC_LRU_VERSION = 2.0.5
+PYTHON_ASYNC_LRU_SOURCE = async_lru-$(PYTHON_ASYNC_LRU_VERSION).tar.gz
+PYTHON_ASYNC_LRU_SITE = https://files.pythonhosted.org/packages/b2/4d/71ec4d3939dc755264f680f6c2b4906423a304c3d18e96853f0a595dfe97
 PYTHON_ASYNC_LRU_SETUP_TYPE = setuptools
 PYTHON_ASYNC_LRU_LICENSE = MIT
 PYTHON_ASYNC_LRU_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
