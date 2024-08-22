Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F55FC3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 13:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F34D9400A4;
	Thu, 22 Aug 2024 13:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OCB7dA-H_soE; Thu, 22 Aug 2024 13:41:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8B6D40120
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8B6D40120;
	Thu, 22 Aug 2024 13:41:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A114C1BF333
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 13:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E5DC60B5A
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 13:41:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MPI8wbck3NLF for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 13:41:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 76F9460B14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76F9460B14
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76F9460B14
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 13:41:24 +0000 (UTC)
Received: from localhost.localdomain (unknown [213.36.7.13])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 83B0E2003CC;
 Thu, 22 Aug 2024 15:41:19 +0200 (CEST)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 15:41:12 +0200
Message-ID: <20240822134112.32868-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724334081;
 bh=HSfJtSNENyCW73b5jCkk1zNvahCMxHO0Db4NZbHAU34=;
 h=From:To:Cc:Subject:Date:From;
 b=fHdNHQ6dbKDhhALN+pIAam7jhKbEycBrnwstFUoi9hL7jG5bawhytBYLYprTF8sqc
 A6Bfwf0SmFRTy5bjP03pHvOAZWDYzrkd49szfreVBye6GH/iU9pRXSmp6CIZNs12uk
 dFPoja8qzD+S9QmAANyOiI+Qxla/wyJwUlZiNcz4CGRWaz+EtUjmTencP0DSPvFTMO
 Vn5SVrZTebtJZ5XquqNr2n/t4jnKTISbM/2fiuNZyTEhbfDOcooq0bhABN390vibF9
 eTKChCLWDaszEURebcM10cGp/Pj5tdyRbo4uFs+nXub4e7AlK9mD2WOh0fH1AWz8vr
 lWDRC3Rzvxo8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fHdNHQ6d
Subject: [Buildroot] [PATCH 1/1] package/frr: update to 9.1.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Vincent Jardin <vjardin@free.fr>, Vadim Kochan <vadim4j@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to the latest 9.x version.
Protobuf becomes mandatory.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 package/frr/Config.in | 1 +
 package/frr/frr.hash  | 1 +
 package/frr/frr.mk    | 3 ++-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/frr/Config.in b/package/frr/Config.in
index 0afd8c61a2..462c58f0da 100644
--- a/package/frr/Config.in
+++ b/package/frr/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_FRR
 	select BR2_PACKAGE_LIBYANG
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_PROTOBUF_C
 	help
 	  The FRRouting Protocol Suite.
 
diff --git a/package/frr/frr.hash b/package/frr/frr.hash
index 4a61084bae..ea32b2c16f 100644
--- a/package/frr/frr.hash
+++ b/package/frr/frr.hash
@@ -1,3 +1,4 @@
 # Locally calculated
 sha256  7ae9d8bafc65bb5d0f21061ac61dbc6cf93b2b05a5dae9e5eec72ed42388551e  frr-8.5.4.tar.gz
+sha256  6eb254c72dca867fefffd5ded80a6c2d5ce8df223ce93263302db4b8bfbb19c4  frr-9.1.1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 1b7d66fc68..725487dfe4 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FRR_VERSION = 8.5.4
+FRR_VERSION = 9.1.1
 FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
 FRR_LICENSE = GPL-2.0
 FRR_LICENSE_FILES = COPYING
@@ -13,6 +13,7 @@ FRR_CPE_ID_PRODUCT = free_range_routing
 FRR_AUTORECONF = YES
 
 FRR_DEPENDENCIES = host-frr readline json-c libyang \
+	protobuf-c \
 	$(if $(BR2_PACKAGE_C_ARES),c-ares) \
 	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt)
 
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
