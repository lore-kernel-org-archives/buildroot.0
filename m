Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3545BD5B866
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A130807DE;
	Mon, 15 Dec 2025 19:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id seKqWWN63Eiw; Mon, 15 Dec 2025 19:18:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C4CE8082A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765826288;
	bh=HLaJPDowlOuaHQWqxoYnHtwwGL1o0uwccxkURc3CdxQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IKgMoTnMNvT5HcW5X1pgMPvCpf0iGqEus3JmZw6JvxEQaDOwNfShuoDwoHWfg0QYJ
	 dcT2XVZTyUe2ItUbOhwu7LRYVAgF1zVavW9RyKQ5sGMeQB08MPnN54BX+1OkDhhVs7
	 F2PGlhsVOgtccy0NEp991I7jtkgiOW/fjHy9gfcsaIkwaBe/u6CTa2YXJzNk5HaTSe
	 MO0AlzmJckiH6jwdkFuAcrCWzYvSrOLi6Wty6Wg9AGQUVmq7gUdSZj7fezNh3fGVyn
	 UU6hCsl8Zcw9VEvZmvsllT8SBwfBx4zuZ1pO0W0vukk679gEBjqgRBL3LQZGQFDVCe
	 v6L2a0oyrtJ1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C4CE8082A;
	Mon, 15 Dec 2025 19:18:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D6B59255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD5AC407FE
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jz-SW9fzZj3j for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:18:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B0EF34046A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0EF34046A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0EF34046A
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:18:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CB38DA4C4359;
 Mon, 15 Dec 2025 20:14:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40828)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVE1R-000000005ED-2mp2;
 Mon, 15 Dec 2025 19:14:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:14:07 +0100
Message-ID: <20251215191416.421755-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215191416.421755-1-bernd@kuhls.net>
References: <20251215191416.421755-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765826069;
 bh=nLAeizJddJ1WfpN2TeguixFqkuTXRcxWWknF3UYdHWc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Xbgb7Id77R6DyEHSv3X3zTLm3YpYmh3c4PdWrkWt0t7XC5oysEw6HlPhDdvYm1SWW
 F8+3XnAc/rApRysjmRG4ZdXWuUM798BOqPo61iXdUx4gXjO4eD39ERNDqfnFGW33pf
 44uAwUq1mJFl7x1NQyQixUK8kQqRgHypnVszSY0O4pCV7oK673m7dpkeyiVdXcjMgP
 HUgpDABBOrCV7oc5f3mmcCloqnK+hgwr6CfE5xoxgw/B5t9M/i06eHIFmGYEUHxXnp
 4Ykcw+uAa1CaTPTIGv7ZKIYSf/UshjCYDWXpFb/aL017QH+12KVxvQ6PRj8nl+2/Kj
 tfUXJBuMUjiVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Xbgb7Id7
Subject: [Buildroot] [PATCH 18/27] package/python-pytest: bump version to
 9.0.2
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Witold Lipieta <witold.lipieta@thaumatec.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Steve Calfee <stevecalfee@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/pytest-dev/pytest/blob/9.0.2/doc/en/changelog.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pytest/python-pytest.hash | 4 ++--
 package/python-pytest/python-pytest.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest/python-pytest.hash b/package/python-pytest/python-pytest.hash
index 4e400947ce..09644dbdba 100644
--- a/package/python-pytest/python-pytest.hash
+++ b/package/python-pytest/python-pytest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest/json
-md5  a1b847e1f079dfc5d26a63bc02f47fb7  pytest-8.4.2.tar.gz
-sha256  86c0d0b93306b961d58d62a4db4879f27fe25513d4b969df351abdddb3c30e01  pytest-8.4.2.tar.gz
+md5  ce26088b3b97ab8fed58c8883de23241  pytest-9.0.2.tar.gz
+sha256  75186651a92bd89611d1d9fc20f0b4345fd827c41ccd5c299a868a05d70edf11  pytest-9.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  ca836a5f9ecca3b2f350230faa20a48fb8b145653b5568d784862df864706b9b  LICENSE
diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
index 8007036575..427936c69e 100644
--- a/package/python-pytest/python-pytest.mk
+++ b/package/python-pytest/python-pytest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_VERSION = 8.4.2
+PYTHON_PYTEST_VERSION = 9.0.2
 PYTHON_PYTEST_SOURCE = pytest-$(PYTHON_PYTEST_VERSION).tar.gz
-PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/a3/5c/00a0e072241553e1a7496d638deababa67c5058571567b92a7eaa258397c
+PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/d1/db/7ef3487e0fb0049ddb5ce41d3a49c235bf9ad299b6a25d5780a89f19230f
 PYTHON_PYTEST_SETUP_TYPE = setuptools
 PYTHON_PYTEST_LICENSE = MIT
 PYTHON_PYTEST_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
