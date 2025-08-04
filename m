Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A4EC87FCF
	for <buildroot@archiver.kernel.org>; Mon,  4 Aug 2025 18:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 515D6816E3;
	Mon,  4 Aug 2025 18:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1M4-XGzsXSBK; Mon,  4 Aug 2025 18:50:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 724C381991
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 724C381991;
	Mon,  4 Aug 2025 18:50:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F1682118
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 18:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D859D4089D
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 18:50:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jCLoVbDjQf2Z for <buildroot@buildroot.org>;
 Mon,  4 Aug 2025 18:50:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E964140D2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E964140D2E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E964140D2E
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 18:50:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bf8c.dip0.t-ipconnect.de [84.161.191.140])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 11F1EA4C2EF8;
 Mon,  4 Aug 2025 20:50:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52098)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uj0G2-000000000fs-1E6w;
 Mon, 04 Aug 2025 18:50:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon,  4 Aug 2025 20:50:02 +0200
Message-Id: <20250804185002.3337860-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1754333403;
 bh=4dWfTxoMCOKfpG6AKO/l8Hz6it1tBvnD1xVb+kBNwqA=;
 h=From:To:Cc:Subject:Date:From;
 b=ANJaFmhuE4XIDJ8XWH3w/JqfXLMsolwjTkA+OFJLJ0Us4W2kvq46FsLwi2R76YGMf
 sYX6dwYWLNv75+vKXgPZ1vwtaCSDQHxmQ66ZtbLcdjDSClMb1wOt269cRbiKBGuvjX
 nvwXe/m5deYBKpQniR/yLMeu8BsoIVNp4Qu90nFApHcuGb5767U025ICX5SEiTcm+R
 yDEZkRKBVOdfV33w1dC2imlC8lZd0hamF9Q36FGCnZ8ICcL2ZXH/oGH76Ij45BI7CO
 RxNYIdFrTtft4jLWc166Tl/B6ZoVeF8QfROvFyfZ/MLyI2UwaYYZqRo61C+FtMNW+J
 CyI/VCNIo0yyQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=ANJaFmhu
Subject: [Buildroot] [PATCH 1/1] package/meson: bump version to 1.8.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 40340fb932..c83daae6c9 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/1.8.2/meson-1.8.2.tar.gz.asc
-sha256  c105816d8158c76b72adcb9ff60297719096da7d07f6b1f000fd8c013cd387af  meson-1.8.2.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/1.8.3/meson-1.8.3.tar.gz.asc
+sha256  f118aa910fc0a137cc2dd0122232dbf82153d9a12fb5b0f5bb64896f6a157abf  meson-1.8.3.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index e23c851d2e..0c460eca6f 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 1.8.2
+MESON_VERSION = 1.8.3
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
