Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F97AFF885A
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 07:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 110206065A;
	Tue, 28 Apr 2026 07:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b9w6cF8ZKBSW; Tue, 28 Apr 2026 07:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E6AA6065D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777361789;
	bh=slJA/tRpzPnBnlve3Za/OdzMjzJ8zwOTemTK4bEN3po=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=IZtrfdpmTsAxPauyj1cQziY4bANmFeL+pMsJq9CxBy8UwS93GP20phgpE3AwEMz58
	 c2L96l/OSe61ARmrpjQN7JNrULMymWSMsUDuZyRE3aGjpksXct7BVCJ9dz6lDWq+VS
	 TXoIpYl85AuzXAYkavjnnCAphOO3ub6AH4aZ7xTdLE/sQomfH8frYBMz7uPpr8rVtZ
	 DbluhQRPw23M+xgmsu8For/nP94INBOs7d1sdMpFuUevHMT/CmcvG9+uqJAFExc5+s
	 8SXtqmzPvTlyGm7gRZfuJn/VC+vbiyr1/krS019Uvftu0G7Ya+T9p/QsykQk1ARIBW
	 Cf/ID1+T5uTyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E6AA6065D;
	Tue, 28 Apr 2026 07:36:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CBE8231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 07:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F13058124B
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 07:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qAPS2vJFgRyp for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 07:36:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.10.208.51;
 helo=mout-b-206.mailbox.org; envelope-from=manuel.diener@oss.othermo.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C4E0C81238
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4E0C81238
Received: from mout-b-206.mailbox.org (mout-b-206.mailbox.org [195.10.208.51])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C4E0C81238
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 07:36:26 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-206.mailbox.org (Postfix) with ESMTPS id 4g4XLD4TyYz9xmx;
 Tue, 28 Apr 2026 09:36:20 +0200 (CEST)
From: Manuel Diener <manuel.diener@oss.othermo.de>
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 09:35:39 +0200
Message-ID: <20260428073542.1027653-1-manuel.diener@oss.othermo.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4g4XLD4TyYz9xmx
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.othermo.de; s=MBO0001; t=1777361780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=dAz7Zo4Co2l86OAhcVsbKcQoTiyBkHrbw1aufJfquRY=;
 b=PAVwDWNc4V3zbcz/VqMadbMMYeYbBVrCVMLxqNnTDJWX6Ub08DPLxbpYr937FuYMkE30XB
 CI1WQGNLXDPQPeFFBdRnDknsIArWlfhr/IQ/nJ1BDtlSkDXMOTL1gFgdvf3Zv41YXCNoEH
 d9ISbCyxqSK3UW3A5cUUOE56A1pt1saONm1pMALFq8edzjLReRwFgcxJp95MDvkRmP/HYz
 +PvBjOiJvCDvzjxkjpNUhC8sKomsjLkJj5aPBNkId2BrLvDP1Gh7Ypg/3tfuQ9D49wMOUu
 Fts4lvXdAuVNlA4D9sPvLOA5ONG11JkoNNWRvGjwiBTWEkqpNSrvtbUKS/DK3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=PAVwDWNc
X-Mailman-Original-Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of manuel.diener@oss.othermo.de designates
 2001:67c:2050:b231:465::2 as permitted sender)
 smtp.mailfrom=manuel.diener@oss.othermo.de
Subject: [Buildroot] [PATCH 1/3] package/python-pydantic: bump to version
 2.13.3
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

This patch also included the versions with the corresponding changelogs:
v2.13.0b1: https://github.com/pydantic/pydantic/releases/tag/v2.13.0b1
v2.13.0b2: https://github.com/pydantic/pydantic/releases/tag/v2.13.0b2
v2.13.0b3: https://github.com/pydantic/pydantic/releases/tag/v2.13.0b3
v2.13.0: https://github.com/pydantic/pydantic/releases/tag/v2.13.0
v2.13.1: https://github.com/pydantic/pydantic/releases/tag/v2.13.1
v2.13.2: https://github.com/pydantic/pydantic/releases/tag/v2.13.2
v2.13.3: https://github.com/pydantic/pydantic/releases/tag/v2.13.3

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
---
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index 85fe1c998b..ded810cefd 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  beb5176b58bf266a874ab4d085cdb766  pydantic-2.12.5.tar.gz
-sha256  4d351024c75c0f085a9febbb665ce8c0c6ec5d30e903bdb6394b7ede26aebb49  pydantic-2.12.5.tar.gz
+md5  a6b8098934bfca79f0d99334f975c22a  pydantic-2.13.3.tar.gz
+sha256  af09e9d1d09f4e7fe37145c1f577e1d61ceb9a41924bf0094a36506285d0a84d  pydantic-2.13.3.tar.gz
 # Locally computed sha256 checksums
 sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index dfa30f7a56..71652bed0b 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 2.12.5
+PYTHON_PYDANTIC_VERSION = 2.13.3
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/69/44/36f1a6e523abc58ae5f928898e4aca2e0ea509b5aa6f6f392a5d882be928
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/d9/e4/40d09941a2cebcb20609b86a559817d5b9291c49dd6f8c87e5feffbe703a
 PYTHON_PYDANTIC_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
