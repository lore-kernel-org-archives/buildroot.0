Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC2ECCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 20:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52AAF600C4;
	Sun, 12 Oct 2025 20:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1a-XTH8Y4oOn; Sun, 12 Oct 2025 20:23:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AB8B60AE4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AB8B60AE4;
	Sun, 12 Oct 2025 20:23:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 20E06BC
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0744F80EEC
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7e3HguEQp7d1 for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 20:23:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0799A80EEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0799A80EEA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0799A80EEA
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:23:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DDF18A4C6722;
 Sun, 12 Oct 2025 22:20:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39868)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v82Y0-000000004zD-0eYR;
 Sun, 12 Oct 2025 20:20:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 22:19:56 +0200
Message-ID: <20251012202002.178080-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012202002.178080-1-bernd@kuhls.net>
References: <20251012202002.178080-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760300404;
 bh=wdaouv4GLN00YxzV07oIxEFRxmUqgyKhmcCKA8GjYKo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=czkxBkqy1qr9eZ3JghZNZWC57qG9e3c6K4SvxJyMXeMP/UFbFLCOwmjYXtyVIYRHg
 pbXsQ9VABy4OKk373SXAa2jzb28fhUL0ANuCyvQMG+qzY2GrjucCpy5HJtF4YEmKso
 zP93Q6TQlCipiS8r1iutQjl/gAE7P8dG2XbQe1c1kRZ6yT5E9lOWvsozl9TEBl+22R
 oTexgMZgD9hiBy8aL+QQBMppdcFqWGfVOlJ+zQrL5KEmeJ2v2I8HmUMAV55cGpTKiF
 eP4DsEbUBa3Jl7K3T66t2r+SZvtFzRkGdEgdls/NRlRFO5UThs0X/7uvc7i7RxNsVl
 lqTn4yZhBXoTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=czkxBkqy
Subject: [Buildroot] [PATCH 17/23] package/python-lmdb: bump version to 1.7.3
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-lmdb/python-lmdb.hash | 4 ++--
 package/python-lmdb/python-lmdb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-lmdb/python-lmdb.hash b/package/python-lmdb/python-lmdb.hash
index f729c197f8..b9812e8996 100644
--- a/package/python-lmdb/python-lmdb.hash
+++ b/package/python-lmdb/python-lmdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lmdb/json
-md5  f9d67b42a6d708ec1cfc860f67e20387  lmdb-1.6.2.tar.gz
-sha256  d28e3fa59935ff688858760ec52f202ecb8c1089a3f68d1f162ea3078d151e73  lmdb-1.6.2.tar.gz
+md5  82026a4a05f5add80fa70462a26851d1  lmdb-1.7.3.tar.gz
+sha256  d4a27b7af4fe38f3409d9fbfbf47b617b3d94dee98a00bc8c2a8336ccd3f9b15  lmdb-1.7.3.tar.gz
 # Locally computed sha256 checksums
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
index 1648ed7054..8005b5f8a1 100644
--- a/package/python-lmdb/python-lmdb.mk
+++ b/package/python-lmdb/python-lmdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LMDB_VERSION = 1.6.2
+PYTHON_LMDB_VERSION = 1.7.3
 PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
-PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/71/54/fb1d5918406a72fcf46fbfaece7c0349d88cd8685f5443a142ddd7dac05b
+PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/5e/87/b6f8bccab1ec1fe58866108c0da648715bc1488627edf9702dae6380613a
 PYTHON_LMDB_LICENSE = OLDAP-2.8
 PYTHON_LMDB_LICENSE_FILES = LICENSE
 PYTHON_LMDB_CPE_ID_VENDOR = py-lmdb_project
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
