Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66B0CEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 21:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5571983BBC;
	Mon, 17 Nov 2025 21:42:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id euKgDb84cv_e; Mon, 17 Nov 2025 21:42:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AB3C8349A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AB3C8349A;
	Mon, 17 Nov 2025 21:42:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A4CD51BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9635740AFF
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ySnYx_qF0ckd for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 21:42:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8EBDB40ADB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EBDB40ADB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8EBDB40ADB
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:42:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6C569A4C6E45;
 Mon, 17 Nov 2025 22:42:35 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51058)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vL6za-000000002du-49eS;
 Mon, 17 Nov 2025 21:42:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 17 Nov 2025 22:42:33 +0100
Message-ID: <20251117214234.1115937-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763415755;
 bh=DLqV1FvNNiu+n7xVS62FlhTUGug3wNTLA5rEO5NgLA8=;
 h=From:To:Cc:Subject:Date:From;
 b=L5WiofYZhqkU/DzDB6JJ3YUgA0vwVld2e0eLPzD2ui7Ii3+ulBJyU/cKV5MdD4SYs
 KKLwETYlPk8thncJCxiMF7E5MOgFaovq5H7vxhXgO7YJzLdfIgDszJBw7dAH2ELh/9
 ZoXjzbZ32i5xzs9oBBmtPkRvEslHN7kIJo+jbKRaEdwyWrzoTUqgPRYuc3T94RVN+Z
 t0MbUdiseU2Neh6GZx/ZmRYFXdJhSOM2PluGwy3TWOriq9sehHx3/ZBUaySgG4zdJ6
 hw6WtJ0Vey/uuYxBuNptLOxW4MJIW4/QG+532eRYoMfRAoUGqhv25xdp5FgINhSK2c
 DCilIGtj3RSpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=L5WiofYZ
Subject: [Buildroot] [PATCH 1/2] package/timescaledb: bump version to 2.23.1
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 James Hilliard <james.hilliard1@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, Nathaniel Roach <nroach44@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/timescale/timescaledb/blob/2.23.1/CHANGELOG.md

This bump adds support for PostgreSQL 18.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index 75396c9164..a2ccc28e29 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  09496504e78a9896eaf7689929f4fa0ab40dde90d202259aa4dcf6ec32fe528f  timescaledb-2.21.4.tar.gz
+sha256  26575fa9e287a6107a6bf162bacab4932b0df19bee38d28c132f9a2d6591d647  timescaledb-2.23.1.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 234420c105..80c2b385aa 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.21.4
+TIMESCALEDB_VERSION = 2.23.1
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
