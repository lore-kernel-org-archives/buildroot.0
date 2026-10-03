Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1029BCA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60F538162F;
	Sat,  3 Oct 2026 13:57:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cFb4j0m4B5nQ; Sat,  3 Oct 2026 13:57:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 662C5815DF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035858;
	b=OJnl4BwmOIMDUzSHejR7Qd+YK/s3d9//Y82JNlnzgVRwRsGvUii+671BNAX4YtdGlpcw
	 JhUmJzAJLGOHt458+ZnfdBsNlJRr9iDWCJhfn7DaiNuJyZMx40l8UnZ+pM2oONl1V9ZW0
	 g6aeNsvgi7qx7mlYPldVWRHUo/cGggbc4Zp7FaDsPa/UUETIL4Q+eImEJhbMo1Ve3/Lr0
	 kJmysOLMGftPmWsWCRnzjE1Lx/W+4o5WoZMdfwBHi5pBtea5wGIDH62l/ZQn6Gz2dRL1k
	 C3VlhlA5LfXAHUuQIeglZUMRhacJjBnnPv+JzVJBH5mFJKRFvxtUFQfOeJ8r74o8vIg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035858;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Bo3D+dgbV3nBdWpJsB7Y+Sb47nnE++dU2uFqp7NYCUI=;
	b=RwrBVk9icKNvkp+Zt67tyawLoxcIbFXX/k5AIOCHdOP5M2AspFHlcGKwuBEH9TGykIcx
	 tvCPIIg/+sVo8M2yLaa+nOMSV6Uwtgv4OZ8QWK8CTvJmcxtEfHwhxxalXz6/9wKV5kllF
	 s/0VfyjN3Qm0XxIcpVi2FV0se3cCh9EsXdMVjTLFIi4ill+mPtsHwFd7ycQNXSUtMPdbv
	 Ineg5dROu8Bq13R7IUD7BSZJ/VZkqg2Qq5+ZTWre0O5EJqwuEAiud9YOTY3nd9eRLwhEq
	 bJMDGnMIOfgVQ4BqwnRHUXgTOewIEAw0e489YZ9ghT4GMtRCDxyGJ6kaSCy6Y+xaUQA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035858;
	bh=Bo3D+dgbV3nBdWpJsB7Y+Sb47nnE++dU2uFqp7NYCUI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hWwW3HOlozs0tpjxpJvd+aV4Iwxm9rRq1PGM9k2BXkZbBgj102YEq6VPKmJvDfoLP
	 Qa/6C65drhvikqPRZt/OP9jFfleByb1Cxg8inCcc39x1MqvtXlw3eamSdGmdjZ9cTx
	 Em7obnXr7Yck2DsO3jY5dY+PQLLbAuqdw3pIiFY/D3m2QSlm39djPxYUJfVrrVi7eI
	 K6XsWa3bKiE6z7Gome0ys2/P5zvGvoz/fF+ZuYPPa+2SqfS4UNsUThH7IDEFO4sMEL
	 3pTFDUecONRfzvH+pl5rCr2gQhOBaC8exvqMpYzx0s5J9J3sdKztpqZWvMnCdZluG5
	 JMM6QnJM4KYHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 662C5815DF;
	Sat,  3 Oct 2026 13:57:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 159C69DF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B41BC414E9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mBAvqGl1S3BB for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2D8F9414ED
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035816;
 b=Whu+70PYJfn2p55NLG1B7LEWqn2W+QhmS3Vmey7XGuvWQhKKUSjnrFZbA8v5tJF/+2IW
 XkmThKfx1I/fTB+qq+SeVEpQVbiNlY+oyDBq8iRrcnnAYj0n8GqtYL6tGQhK+6w2r5tJW
 MaUhTNWwu95/0rTOKf2veeAB7DguVssiUMu/0k5GoH4l+ZWRon9Y6zZhZmSN7ltwIrmLR
 55vhOuMg4ylYF9J1Y+M4ZgNWtPfwQGrmDe32HInxdUqjIE1//LSz6HSS+FUbzz40fnEE2
 K5fBgn5W1/qlGuDIB06nFgYPwSVTKrfQmZhAOhZ1uOOsO4YaWf++G2uSSpSlTAdUF9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035816;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=jYd2zs2qPIdQFs3fMKwmFOgOh2ogJz/RIkNHfq/TpLA=;
 b=NmxiwLONIzAavY4CFdlJpiWAZFQo18f4IWE0ZHWRCN0/AQ2cXelGbCrtdaGsCerqAzC+
 DWpg9rFKZtanq0+BgJpYahOuv11P6MnV97Zt/x0BSNWje7zpL9n8KVIbJ5lL8c2zMEM9E
 NmxidU5QEosUx/Nk4nYA/5vJuzkd4OlXygICcOib8DO9cuI5lhzKih2t+os6Qo56ScQ9I
 UW0Je1jcUgEUFlMxpaFgdmmWT7KiHPk0wGcmabkJ++m6C2hz9y+NTKnI9hEf6drRtqSio
 r5RDvmV7p6x81CosthadpH+AAaPTdw0QCwEnCDA2H5EFlohzmB8PG2HvDSsfEmugOdg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D8F9414ED
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 793C08A318; Sat,  3 Oct 2026 13:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed36bce744d66b6392adfed64f8e01c03b95ff48
X-Git-Newrev: 16eae3c371499b2679388ba97fff9b4a9b44b0a7
X-Patchwork-Hint: ignore
Message-Id: <20261003135541.793C08A318@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools-rust: bump to
 version 1.13.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/16eae3c371499b2679388ba97fff9b4a9b44b0a7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-setuptools-rust/python-setuptools-rust.hash | 4 ++--
 package/python-setuptools-rust/python-setuptools-rust.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-rust/python-setuptools-rust.hash b/package/python-setuptools-rust/python-setuptools-rust.hash
index 4cd068103d..37b1407d62 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.hash
+++ b/package/python-setuptools-rust/python-setuptools-rust.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-rust/json
-md5  90ce501aabce2a859e19a213985288ea  setuptools_rust-1.12.1.tar.gz
-sha256  85ae70989d96c9cfeb5ef79cf3bac2d5200bc5564f720a06edceedbdf6664640  setuptools_rust-1.12.1.tar.gz
+md5  bf3129915879286bfe6dbf3dba9c8b8f  setuptools_rust-1.13.0.tar.gz
+sha256  f2afcf4baeee689910ce49cfa8aad4e08cce72f417449bcc32891b8664fdc726  setuptools_rust-1.13.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b20668c1590582b3882854050ccfbdb7aee1f71a1ffe9eacc4c5aeb08a14161b  LICENSE
diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
index 05951260b2..7ac9fbbf67 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.mk
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_RUST_VERSION = 1.12.1
+PYTHON_SETUPTOOLS_RUST_VERSION = 1.13.0
 PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools_rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
-PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/0c/11/736cfe4ec795dbce001ebdcef5cab03de1727041c805c3a45c1bda9f54a1
+PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/68/ba/b31781d61bf9ee3c232a1d1160db11c11cdeae1d44e06c90723b25a8279f
 PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
 PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
