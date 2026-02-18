Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C19E9A047
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 13:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82A5E60754;
	Wed, 18 Feb 2026 13:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gx3JEdjnUC7S; Wed, 18 Feb 2026 13:35:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00F7B606E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771421759;
	bh=tYjvxltKP3hE+cxvH+uJQ3QXHyHG3AaSchu+mzmkyzM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=oCY2TMuo1i1+fm66CK+4Ti1hFa9xoOJad/LMojUbHbpm33EW8LfJgLsjQPa1BX7Bb
	 A7B/r1UPsnK0o+ZvAFLIFNGRUu78pC2J4HIwWRL18drUwohxTVVvdwZGmh/5ref1Af
	 1IHQTVNQvqXG17ntTRbwOUG7S7059LnaI3dPnrq69W8MyPPfFCH1/Qz5QarSdNF0Ke
	 Srxviva14s6Z8j/mhTEDr4JwmcwmJ4y/cFpgwuh3qNcqppIaczsELA0VAwhmxIzFGF
	 jQ3zfC2QPSscecgJKdlunWAcZcLVXvyMwoD155CUphh4F6Bkzgc4Lwx3mwj3Pj4Ue9
	 bldOOwn0lGviw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00F7B606E5;
	Wed, 18 Feb 2026 13:35:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D20B335B
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 13:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C359A80CBD
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 13:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6PoV6S1nTB9p for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 13:35:56 +0000 (UTC)
X-Greylist: delayed 396 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 18 Feb 2026 13:35:55 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8C58F80C8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C58F80C8B
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:67c:2050:102:465::206; helo=mout-b-206.mailbox.org;
 envelope-from=manuel.diener@oss.othermo.de; receiver=<UNKNOWN> 
Received: from mout-b-206.mailbox.org (mout-b-206.mailbox.org
 [IPv6:2001:67c:2050:102:465::206])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C58F80C8B
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 13:35:55 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-206.mailbox.org (Postfix) with ESMTPS id 4fGHRF2f1Lz9wpN;
 Wed, 18 Feb 2026 14:29:13 +0100 (CET)
From: Manuel Diener <manuel.diener@oss.othermo.de>
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 14:28:45 +0100
Message-ID: <20260218132845.3113245-1-manuel.diener@oss.othermo.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4fGHRF2f1Lz9wpN
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.othermo.de; s=MBO0001; t=1771421353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=CSdcKrj9VwlNDcuQrb9AGcb+GUcTrfRD+lL1d7neUY4=;
 b=D0wTEaGpodQG0F1AW0Pck+ZeaZkvAXl9KnDS9xzivztrkaQOz7lWve4yI6ccxFsryyjINt
 P08nj3VzkqVj191evQ4Gu39swjdkcjc3H6BWXZK6HVy66dVsgVrMu//xuNLe/7z5dllhk5
 O9MJclwxSnkxMpMOwqSG54UMWDRm8JMYblxwAve2MD6OF9J8CUq1P/iek/Z5QY7IMkmWSp
 b+7s0DnRHMu3k9wZNNE1aI8WUl8hPLjjJG+jYpvroiMme6pc1pelzbv3s9tDHiso0oU50w
 A37j6In/KJ8Tg5wpFfJHPMD9DkVLKof2MiTOdOpyfzdfVHn/2g3dmfnKwG/TWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=D0wTEaGp
X-Mailman-Original-Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of manuel.diener@oss.othermo.de designates
 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=manuel.diener@oss.othermo.de
Subject: [Buildroot] [PATCH] package/python-anyio: bump to version v4.12.1
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
 Manuel Diener <manuel.diener@oss.othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes here:
https://anyio.readthedocs.io/en/stable/versionhistory.html

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
---
 package/python-anyio/python-anyio.hash | 4 ++--
 package/python-anyio/python-anyio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-anyio/python-anyio.hash b/package/python-anyio/python-anyio.hash
index 2a02bc9d37..d25c1a2bad 100644
--- a/package/python-anyio/python-anyio.hash
+++ b/package/python-anyio/python-anyio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/anyio/json
-md5  a026af4a3b485699718761b1b44ad1df  anyio-4.12.0.tar.gz
-sha256  73c693b567b0c55130c104d0b43a9baf3aa6a31fc6110116509f27bf75e21ec0  anyio-4.12.0.tar.gz
+md5  10e3ba7d02402b6605d834a1e4881a1d  anyio-4.12.1.tar.gz
+sha256  41cfcc3a4c85d3f05c932da7c26d0201ac36f72abd4435ba90d0464a3ffed703  anyio-4.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  5361ac9dc58f2ef5fd2e9b09c68297c17f04950909bbc8023bdb82eacf22c2b0  LICENSE
diff --git a/package/python-anyio/python-anyio.mk b/package/python-anyio/python-anyio.mk
index 035e2298e8..32b4a84ef1 100644
--- a/package/python-anyio/python-anyio.mk
+++ b/package/python-anyio/python-anyio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ANYIO_VERSION = 4.12.0
+PYTHON_ANYIO_VERSION = 4.12.1
 PYTHON_ANYIO_SOURCE = anyio-$(PYTHON_ANYIO_VERSION).tar.gz
-PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/16/ce/8a777047513153587e5434fd752e89334ac33e379aa3497db860eeb60377
+PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/96/f0/5eb65b2bb0d09ac6776f2eb54adee6abe8228ea05b20a5ad0e4945de8aac
 PYTHON_ANYIO_SETUP_TYPE = setuptools
 PYTHON_ANYIO_LICENSE = MIT
 PYTHON_ANYIO_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
