Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24588D637A1
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 19:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E31361037;
	Tue, 16 Dec 2025 19:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aGNnbEpsnYRa; Tue, 16 Dec 2025 19:41:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4293607C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765914085;
	bh=9k6aQrA1h6EKky10uS9gv248JFHKNK2lxHE8QacffO4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=DU4IzCmIxoHvg4W/7nLLd8F0rpczzeTB0p5jXyHtI5foAyPyi/JsqtREFdOxqbiwI
	 uiZCTYGhj4QbvhJMHykcDSMnvw+HXNqlVD1gn9uV9VtIRr16u5CHaNsa0g0S1889dw
	 abZjSZyti54kclAOIZz2M8q37aT6FqM0BKDSvKCp+S6fQg9npmSAqF0Yu73CVJFhqW
	 sgoU37UGS0UAms596bdtwtiaFSsuEoIBRKum2BSw1UVIXO8/yOl/5AJOXoREWhcRJt
	 zjMPgjRx1UDdGJU1AtOuJWhK5563N080OYex8deXjN3eO7uWh7tgREGbXic2AhHXZh
	 dgo8c8t+PIGHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4293607C4;
	Tue, 16 Dec 2025 19:41:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ED716372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF72480DF8
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PqmXODLoHWgp for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 19:41:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3814480DC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3814480DC7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3814480DC7
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:41:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 94656A4C3B99;
 Tue, 16 Dec 2025 20:41:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVav8-000000000Bj-447n;
 Tue, 16 Dec 2025 19:41:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 20:40:54 +0100
Message-ID: <20251216194119.3020421-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765914079;
 bh=yQwhOMeqNBpQbFSnFpH4j/xCaRw2a3vmhzQQ0bpP8XY=;
 h=From:To:Cc:Subject:Date:From;
 b=rGfN03w7/XEAh4zLOBAotQitHhKjkXtpGPg2Gcc5I40iAxj2OkkjmJlq9JVOZaKOv
 w63qgsjVloWdR5A+S8FTjFtdhmXh/lI9MKuAmSwtrP2euFNMGwr7zS8PtrRnhG2J2M
 IDQLeDo+7t4Kj8HkiLhlEcf7O+29FuG1KyUCeJ4cuTBt1tTrtoV6zV8N0Y8oamna4Y
 WB99NKSc1KuwKjjGkYsaSz2XnomtAyTSJpN9JGYsgwCR++z+p3uLRoTeoV60HlaDtS
 1OPV8AIPgNAqs1VNuasTx6K3WrayDoFFeWMg5ECUZ+2no/HWzda1ImAMR1L5nr+DNR
 JjhmqxKXfCdYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=rGfN03w7
Subject: [Buildroot] [PATCH 01/26] package/python-setuptools-rust: bump
 version to 1.12.0
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
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/PyO3/setuptools-rust/blob/v1.12.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-setuptools-rust/python-setuptools-rust.hash | 4 ++--
 package/python-setuptools-rust/python-setuptools-rust.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-rust/python-setuptools-rust.hash b/package/python-setuptools-rust/python-setuptools-rust.hash
index daba4fb28e..ac254fdf76 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.hash
+++ b/package/python-setuptools-rust/python-setuptools-rust.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-rust/json
-md5  cc5c2cf6828af473951295d9f33bcf33  setuptools_rust-1.11.1.tar.gz
-sha256  7dabc4392252ced314b8050d63276e05fdc5d32398fc7d3cce1f6a6ac35b76c0  setuptools_rust-1.11.1.tar.gz
+md5  6ecee3d9f3ac646a52d60155022fd0d0  setuptools_rust-1.12.0.tar.gz
+sha256  d94a93f0c97751c17014565f07bdc324bee45d396cd1bba83d8e7af92b945f0c  setuptools_rust-1.12.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b20668c1590582b3882854050ccfbdb7aee1f71a1ffe9eacc4c5aeb08a14161b  LICENSE
diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
index 01cd04867a..862b1c853a 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.mk
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_RUST_VERSION = 1.11.1
+PYTHON_SETUPTOOLS_RUST_VERSION = 1.12.0
 PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools_rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
-PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/e0/92/bf8589b1a2b6107cf9ec8daa9954c0b7620643fe1f37d31d75e572d995f5
+PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/bc/c4/8d3d282cee60d3ea0369fa15ce27387810040360adb4133e31990a7a2aba
 PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
 PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
