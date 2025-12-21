Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469A3E67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C5278127C;
	Sun, 21 Dec 2025 22:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qfo0tqGpqJgX; Sun, 21 Dec 2025 22:30:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B20F81589
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356231;
	bh=kTI2+Fs+FdtySDaNM7XwGHBaJyH/9bLExR2WRR/TWVI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZwbW4Xa36MDPPbGDLdqbMGpG5a7WWZhoaU4o+1Y2q+t0RcVaAEIYAoyzoRi90snK2
	 SsSrhTajGEp6ztNqzrMwVuY5apHWfpXIxO72775p4f7v1HfJOcfom+QdttH6JudY58
	 Z5L6BCbNlb7G0h4zsjjANpX2mHRWnudBTxuRk4UyOwCRxfWoglkd18ozf2edEJncml
	 HCA+MzMrGNP6fjCht0uqyz6tFVG02kCxgpYjY5fm+lnqf+blpZ8D8MgF1rcYOe5PB0
	 8tk+jOTlU0Jfn/TzCZP5ta6KWJqI12cjtnyTbJiWAT0O/fqtgEqEv3dY3XhSwE8f6H
	 +1zaYqjoS/PfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B20F81589;
	Sun, 21 Dec 2025 22:30:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AA61119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D3A481589
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:30:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J77LiJQvh0JH for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:30:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1BE608127C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BE608127C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BE608127C
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:30:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6E336A4C4DF1;
 Sun, 21 Dec 2025 23:30:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46252)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXRw8-000000004xC-3ll2;
 Sun, 21 Dec 2025 22:30:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:29:56 +0100
Message-ID: <20251221223000.184312-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223000.184312-1-bernd@kuhls.net>
References: <20251221223000.184312-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356201;
 bh=6RRweH+Lt8LQ10JjnT6jReZe9Tfu8+ZXE59MnH5aSVY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=NzJuMMqXWNTmPHo6qbvALwbTF8NxPKWcXRszCngOJXmfc8UPS0Z1bcbFL3DmpLR4Q
 fWgIv/66C2rHS+3wQKOaNtHJcI9fxXSd/O4daPQzA5GtuLnosOHhS8qI//rS06WZkb
 yZGPtzuZU7EwVLBqiIWJTHmk7VOhPZN2VeJgvDED9MNqXdm9FRy39u9znysIn0ZoVe
 NlngrF91jgNemn8ymMAx61X9BSICcmHxNLyKFf0uTPlw8M/cSKbS5WzTBd9oSKvnx7
 iPDHdxmDMlzydy6vmKnJ35ZqsEh3ajqhO8rRzqTrfi67Q6KbYjfMkSl/SESbpt2HOD
 M10hAQt/VkIsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=NzJuMMqX
Subject: [Buildroot] [PATCH 3/7] package/python-poetry-core: bump version to
 2.2.1
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
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/python-poetry/poetry-core/blob/2.2.1/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-poetry-core/python-poetry-core.hash | 4 ++--
 package/python-poetry-core/python-poetry-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-poetry-core/python-poetry-core.hash b/package/python-poetry-core/python-poetry-core.hash
index 888f220e96..9defacc37f 100644
--- a/package/python-poetry-core/python-poetry-core.hash
+++ b/package/python-poetry-core/python-poetry-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/poetry-core/json
-md5  dd09886c53c482680536e8ce8ffd483e  poetry_core-2.2.0.tar.gz
-sha256  b4033b71b99717a942030e074fec7e3082e5fde7a8ed10f02cd2413bdf940b1f  poetry_core-2.2.0.tar.gz
+md5  a025abe2dd8d096480a87941f30d95ec  poetry_core-2.2.1.tar.gz
+sha256  97e50d8593c8729d3f49364b428583e044087ee3def1e010c6496db76bd65ac5  poetry_core-2.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  f1978133782b90f4733bc308ddb19267c3fe04797c88d9ed3bc219032495a982  LICENSE
diff --git a/package/python-poetry-core/python-poetry-core.mk b/package/python-poetry-core/python-poetry-core.mk
index eac7f75a9f..d3f39706dc 100644
--- a/package/python-poetry-core/python-poetry-core.mk
+++ b/package/python-poetry-core/python-poetry-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_POETRY_CORE_VERSION = 2.2.0
+PYTHON_POETRY_CORE_VERSION = 2.2.1
 PYTHON_POETRY_CORE_SOURCE = poetry_core-$(PYTHON_POETRY_CORE_VERSION).tar.gz
-PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/6c/73/8cc4cdc3992d9e03a749dd0ef7438093042a1ed197df8fcfc9dc9502ef0b
+PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/54/ef/a16c11de95b638341961765e072dfdd4c9a0be51d6b22d594c5f3255e4bb
 PYTHON_POETRY_CORE_SETUP_TYPE = pep517
 PYTHON_POETRY_CORE_LICENSE = MIT
 PYTHON_POETRY_CORE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
