Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0249FCCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 20:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD84D608F6;
	Sun, 12 Oct 2025 20:24:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TK72SFa7Y207; Sun, 12 Oct 2025 20:24:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01D5E60A7D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01D5E60A7D;
	Sun, 12 Oct 2025 20:24:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CC76D12B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB67460A7D
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HROEtR2vSv1i for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 20:24:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BD2E2608F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD2E2608F6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD2E2608F6
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:24:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 45DD2A4C673D;
 Sun, 12 Oct 2025 22:20:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39868)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v82Y0-000000004zD-2bz4;
 Sun, 12 Oct 2025 20:20:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 22:20:02 +0200
Message-ID: <20251012202002.178080-23-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012202002.178080-1-bernd@kuhls.net>
References: <20251012202002.178080-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760300405;
 bh=iAJIPJByWPwQWKKyo8wJWb99DO5g6teG/r76KQnYGSk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=VYqh5/YuPpJpamCvHyjrzIUh52EfwEXL24no68To+94Jvm6jGhToyzgDaaNQlEml4
 fNKeNv4TEnlBJsitWOzoDqGdIO9MIQelt1a6ww18qf8rBPPCVzxu2vAP3w1n6Fw6ND
 EVnD0dYYR/k1r2JLnkOCZTdN8SM/Lp+eS078iC1oRTzr6UQ9mQFLu6AhDmqeaEutPe
 HyUFDeiZ5i+/aPkof4jnyiVSzL/NPRL+vagS3F+ZGjWEaxt4qUSv7RCVvyBDjdw8+l
 UFTe6irfFyF7hZKePj42rxJ7D8GGPWGnxbfRuWvuWTUaQ/V4zmleb15Xns7BHLS40z
 EtfY6OELMJbyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=VYqh5/Yu
Subject: [Buildroot] [PATCH 23/23] package/python-networkx: bump version to
 3.5
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
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/networkx/networkx/releases/tag/networkx-3.5

Updated license hash due to copyright year bump:
https://github.com/networkx/networkx/commit/c22ad5579d1916a662b00bcf00acca9fc3da9e50

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-networkx/python-networkx.hash | 6 +++---
 package/python-networkx/python-networkx.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-networkx/python-networkx.hash b/package/python-networkx/python-networkx.hash
index 5433192a73..bd8326f104 100644
--- a/package/python-networkx/python-networkx.hash
+++ b/package/python-networkx/python-networkx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/networkx/json
-md5  b6cde64de26aca58aa8431c0b232512f  networkx-3.4.2.tar.gz
-sha256  307c3669428c5362aab27c8a1260aa8f47c4e91d3891f48be0141738d8d053e1  networkx-3.4.2.tar.gz
+md5  9d5221bbc2eca0190663e887b91e75c6  networkx-3.5.tar.gz
+sha256  d4c6f9cf81f52d69230866796b82afbccdec3db7ae4fbd1b65ea750feed50037  networkx-3.5.tar.gz
 # Locally computed sha256 checksums
-sha256  5b433b90f755eb9bbd06feff1d1a4f5f232c5208a185694199e45fa95d762792  LICENSE.txt
+sha256  3cf7c3a179d817b23b8b8568211769fefdf93797d207d984b8b2fa24d0220b33  LICENSE.txt
diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
index 37780ef36a..41d33f1560 100644
--- a/package/python-networkx/python-networkx.mk
+++ b/package/python-networkx/python-networkx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_NETWORKX_VERSION = 3.4.2
+PYTHON_NETWORKX_VERSION = 3.5
 PYTHON_NETWORKX_SOURCE = networkx-$(PYTHON_NETWORKX_VERSION).tar.gz
-PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/fd/1d/06475e1cd5264c0b870ea2cc6fdb3e37177c1e565c43f56ff17a10e3937f
+PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/6c/4f/ccdb8ad3a38e583f214547fd2f7ff1fc160c43a75af88e6aec213404b96a
 PYTHON_NETWORKX_LICENSE = BSD-3-Clause
 PYTHON_NETWORKX_LICENSE_FILES = LICENSE.txt
 PYTHON_NETWORKX_CPE_ID_VENDOR = python
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
