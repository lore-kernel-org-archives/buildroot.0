Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268C5CCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F413C42820;
	Fri,  1 May 2026 12:41:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xiF2HcdHpkpG; Fri,  1 May 2026 12:41:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DB3B42826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639310;
	bh=I3S8kfGIt0aJpN573QqF6jDhvqvRRBAUhPm9sKHVFAU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Yz42LIRYPIPCIPLYYlecdhoMosMst9EeZmSDxwUlcG34VJ7sApHZFI/AANMOLlqf8
	 dgC2TUpCB4nfecBlcd3rqOCFI5DYEWK4byj/pKYK+y9M5VmzZsPPN/aj8HvArGDemh
	 rPnHHG7VYkj+rLjXk9Ik3MWXZVRGK6NRnfHojm7vJ3OjQ3B0vBb6rzLGmVChgh4S5v
	 4oAQ+tNJZbYyf4fgMmBq8Oo2k1epNIvP7h3tfxH5Ig5Lt6yVYJpwxiefZNEyGh3w5n
	 xvKKIvW0jqQPIIa/CcSG5W+mIHj3bmpTzBEUdhjm6c84Xye+hNsAmRrjnJjSYZ4ZEm
	 Hj+C6BQM1JEyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DB3B42826;
	Fri,  1 May 2026 12:41:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 73546293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 650CF403DA
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:41:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aKvyw_GX-HcJ for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:41:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4FE15401CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FE15401CA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FE15401CA
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:41:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F34A2A4C2F0C;
 Fri,  1 May 2026 14:31:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1N-000000008NC-1x4r;
 Fri, 01 May 2026 12:31:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:40 +0200
Message-ID: <20260501123100.1918951-55-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638669;
 bh=J6aH+AjSfmIvIY+eYprwjNjZ4beiABxP5zImkjXtJ14=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=n2BTpi4XX3P9Fej9z3ZXzGrJvnyQVg2I7R1z+l649sAhJDR55x6aCKt1oQ5iOeGbg
 /OKuW779m0vupy53B8ajSxRUw5GH5w+qIERWeVh375r4hGAeFnlkFLrSI4S2NukLnG
 W00uJWT96ZvEWdhsvj7u6AyM+xb7zGCaC3izqqzB3ORVH6dSWyTAKhTYliQhJDAnw0
 UlagHoyUSKtcwl4HZB8nJQiZJIJ+f0TnSZnLtywlmGGu8xn0tF65ZjFH7DUuPohtIe
 A2boS7W9MIwmnvDsGJuWlkIMlHFxIVx8nJsIavBNsRmbwASf/Tr1QYduPzCKGYWAQu
 ZcAOhU4l53khA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=n2BTpi4X
Subject: [Buildroot] [PATCH 55/75] package/python-setuptools-rust: bump
 version to 1.12.1
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
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/PyO3/setuptools-rust/blob/v1.12.1/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-setuptools-rust/python-setuptools-rust.hash | 4 ++--
 package/python-setuptools-rust/python-setuptools-rust.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-rust/python-setuptools-rust.hash b/package/python-setuptools-rust/python-setuptools-rust.hash
index ac254fdf76..4cd068103d 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.hash
+++ b/package/python-setuptools-rust/python-setuptools-rust.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-rust/json
-md5  6ecee3d9f3ac646a52d60155022fd0d0  setuptools_rust-1.12.0.tar.gz
-sha256  d94a93f0c97751c17014565f07bdc324bee45d396cd1bba83d8e7af92b945f0c  setuptools_rust-1.12.0.tar.gz
+md5  90ce501aabce2a859e19a213985288ea  setuptools_rust-1.12.1.tar.gz
+sha256  85ae70989d96c9cfeb5ef79cf3bac2d5200bc5564f720a06edceedbdf6664640  setuptools_rust-1.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b20668c1590582b3882854050ccfbdb7aee1f71a1ffe9eacc4c5aeb08a14161b  LICENSE
diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
index 862b1c853a..05951260b2 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.mk
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_RUST_VERSION = 1.12.0
+PYTHON_SETUPTOOLS_RUST_VERSION = 1.12.1
 PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools_rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
-PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/bc/c4/8d3d282cee60d3ea0369fa15ce27387810040360adb4133e31990a7a2aba
+PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/0c/11/736cfe4ec795dbce001ebdcef5cab03de1727041c805c3a45c1bda9f54a1
 PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
 PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
