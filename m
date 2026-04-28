Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB7EFF885A
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 07:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3941681238;
	Tue, 28 Apr 2026 07:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81KZNP7c2NK1; Tue, 28 Apr 2026 07:36:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B7458124B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777361797;
	bh=BpkwVL6IxcVc1U5tpByQct7mEq9VxTnagZqFShJHaps=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sOTtWhQ2HUv4cU26S/4Murx2Th2HfjtTesBjWe8Dyy5Y+y9oqtdcDTg3OaA5wn1S0
	 ctjwexg02ZoRb/nuF2X2XwrgPjCfr4Pu9CMkyhSjtwioAI+/W8YyQr/uVT1qAIu7qH
	 SqnpfylFR46ZjTOkn5FIyYiWqAD7X3urMHPYuQN0o3hU6x+roKsKAf9TTjIWCh60g9
	 td4N58YwOq8qeW/WhgTTLB40BonGZYJ/ZJziwlQZcPSXmqabzhb5xye+1cI3+qiMn8
	 Y7IRxIjpEnNjb0w3mUBifaqR1DIa7Glp7nKDsGMIWI2u6ZzTTHiBH/iiwBvAHiRl3H
	 6NwJ5wfkScNug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B7458124B;
	Tue, 28 Apr 2026 07:36:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 619451B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 07:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43E6A4060E
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 07:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q0QVEfh6HlTc for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 07:36:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.10.208.50;
 helo=mout-b-105.mailbox.org; envelope-from=manuel.diener@oss.othermo.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E55AC405F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E55AC405F0
Received: from mout-b-105.mailbox.org (mout-b-105.mailbox.org [195.10.208.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E55AC405F0
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 07:36:34 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-105.mailbox.org (Postfix) with ESMTPS id 4g4XLM1rM7z9xxv;
 Tue, 28 Apr 2026 09:36:27 +0200 (CEST)
From: Manuel Diener <manuel.diener@oss.othermo.de>
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 09:35:40 +0200
Message-ID: <20260428073542.1027653-2-manuel.diener@oss.othermo.de>
In-Reply-To: <20260428073542.1027653-1-manuel.diener@oss.othermo.de>
References: <20260428073542.1027653-1-manuel.diener@oss.othermo.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4g4XLM1rM7z9xxv
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.othermo.de; s=MBO0001; t=1777361787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eLOliqxcBAKGhAq2trTXflQoqercJYKDAWIXOWaxCuY=;
 b=PqKG+2sFw6ieqAqh3z7OXYm3xlJnmdAl9TitpPIdNSpWvm64QiPZ9HMOruSschAiYzthZV
 1/j6t57uNKTTe3XinCxCqfE6rn1xD75vtVxgh8vPyftDbmYoxonuSA4TJzLnC7gZhu4s43
 h0KkUH6QX4BUyyoQhS0As0wQu2xSc16zB3hOU9nFOYHLTJNmc0vgVk7QTqjPUo9gi4EOi6
 6INmZjBnqIJnH5YGJCbyFJoHsE7a/neiuKu2MW03Ntr6YUJ29zDUU/l4nppqBNuoaiZUJt
 o1qI8bfwojXh818mL+TMrCESKkEFELhyoT0K2vIBporQHhOZt2evdKueIJ2kGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=PqKG+2sF
X-Mailman-Original-Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of manuel.diener@oss.othermo.de designates
 2001:67c:2050:b231:465::2 as permitted sender)
 smtp.mailfrom=manuel.diener@oss.othermo.de
Subject: [Buildroot] [PATCH 2/3] package/python-pydantic-core: bump to
 version 2.46.3
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

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
---
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index 61775e5522..c1a77fdb47 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  cc643029337df7a2e90799cedbd75fef0636c6a467e74d22f4dfec4c1959359e  python-pydantic-core-2.41.5-cargo5.tar.gz
+sha256  0b4e5e3e499cbc2d23ab37206fffd0d3ce2f935e7f005e1fa8ef934ade26704a  python-pydantic-core-2.46.3-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index 7394e947ec..333c73a21a 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -6,10 +6,10 @@
 
 # python-pydantic pins an exact version of pydantic-core in pyproject.toml,
 # make sure to sync pydantic-core to this version when updating pydantic
-PYTHON_PYDANTIC_CORE_VERSION = 2.41.5
+PYTHON_PYDANTIC_CORE_VERSION = 2.46.3
 PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
 PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
-PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/71/70/23b021c950c2addd24ec408e9ab05d59b035b39d97cdc1130e1bce647bb6
+PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/2a/ef/f7abb56c49382a246fd2ce9c799691e3c3e7175ec74b14d99e798bcddb1a
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
 PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
