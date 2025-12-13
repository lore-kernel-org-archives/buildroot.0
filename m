Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FBFD59F76
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 14:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0268540D84;
	Sat, 13 Dec 2025 14:08:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ws41UIYdtZef; Sat, 13 Dec 2025 14:08:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56B0F40D3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765634893;
	bh=PmOzg+gzDhb+EhLA1ij2/c6y7NArrU6gYj6va0Ld4Wc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=T0SD39SpxX4xnS2bDuv1ou+RJGMK1QFbm6bMN008oNr/HI/nBYbCe1m0VBD90+OzS
	 PbuIn3F22fRsXPGpu/Ju1a5dtldPksX/IYb3RmZOE5VGPzmCTHB144sCri/m/4QGI8
	 0V0fM1sRsbOxViLIiemQ7yWnElbSrKhHssJGsL92eSo/tJbFV2uuh9u9GPUWTx3zFA
	 rVzTRFq2f07RJc+Opcn9+rlSMoX3CP6+cWQ5t6SR4gT3OQImpOwG7VYvLp5Fd5KPkA
	 XAq0+BU4jT2zS2gJ84/7GufWQLHoPvHO6kflBMKL4xcxVj96ZmpSTpbcZRlbsT1Fbo
	 MdAdfIc6xwqdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56B0F40D3A;
	Sat, 13 Dec 2025 14:08:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E09B413D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2E4583218
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:08:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OvSrshrYCUPI for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 14:08:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BBE8A831FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBE8A831FB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBE8A831FB
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:08:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4459AA4C408C;
 Sat, 13 Dec 2025 15:05:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49778)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUQFO-000000004dt-2zXc;
 Sat, 13 Dec 2025 14:05:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 15:05:14 +0100
Message-ID: <20251213140522.1322763-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213140522.1322763-1-bernd@kuhls.net>
References: <20251213140522.1322763-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765634730;
 bh=+P1Ys8AZ03X7e5lEDL/1okOFjW9PtewClfWuB/CtxuQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=CFMnD2rEM+mhW8jObmn0dxOM0u09CU+Qe245rSW3L3IQWNbAeSWZ6HW5tv2YsHPc8
 EVJF1Ah1duSARZ8BNkWqE4KvXJW112D6FOphGSMOpua4ED8ZqhgNeg9g1SpQy+rVhG
 b1tpcVL5eHbx0RRMHBBbGKsI+t0z27EqX6rpcVhcvpyjVN5+1RQxoxrQudR2Qr9Bcs
 zmHXcHWk6mEejc2jd92uVMGFy1JDKgEwhj12hEwK0KfnAT/POWfDAmADqVMMxa4ux+
 X9oqJOohqHAm5ya+VMJWpYYPQqGV1a6IRu2BJgGM6bmFTKX+4wfenthS2OQ9Otyjcn
 BrWcB4I8TNoBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=CFMnD2rE
Subject: [Buildroot] [PATCH 06/14] package/python-marshmallow-sqlalchemy:
 bump version to 1.4.2
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/marshmallow-code/marshmallow-sqlalchemy/blob/1.4.2/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../python-marshmallow-sqlalchemy.hash                        | 4 ++--
 .../python-marshmallow-sqlalchemy.mk                          | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
index d91dca88b5..138b09170d 100644
--- a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow-sqlalchemy/json
-md5  a037666fa3558f984dcc4b2b443378df  marshmallow_sqlalchemy-1.4.0.tar.gz
-sha256  ca169a26171077af8afa25789e9781680de0e9187563c422f1f67d0a0133433a  marshmallow_sqlalchemy-1.4.0.tar.gz
+md5  6bb2860c9acfd128b562f92f72d00e69  marshmallow_sqlalchemy-1.4.2.tar.gz
+sha256  6410304bf98ec26ea35f3f9d3cee82e51fd093c434612add32a0bdcdb5668f7c  marshmallow_sqlalchemy-1.4.2.tar.gz
 # Locally computed sha256 checksums
 sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
index 6ce354a252..4f9bd1887f 100644
--- a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION = 1.4.0
+PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION = 1.4.2
 PYTHON_MARSHMALLOW_SQLALCHEMY_SOURCE = marshmallow_sqlalchemy-$(PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/6d/0c/89544d2b3aeae4af61ecd9df347d61d36768a67563e47b98423a853e8470
+PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/1d/8c/861ed468b99773866d59e315a73a02538f503c99167d24b3b3f1c8e0242c
 PYTHON_MARSHMALLOW_SQLALCHEMY_SETUP_TYPE = flit
 PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE = MIT
 PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
