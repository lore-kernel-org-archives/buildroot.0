Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31314D2ECE9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 21:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F33B1841FE;
	Mon, 19 Jan 2026 21:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nUEH6_0b1Lvu; Mon, 19 Jan 2026 21:06:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11701841F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768856765;
	bh=zQzH2Ec6D983cmQPr0nJIwRpqZxIGiPQYJGgeoawbdU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=XNVQ6N3UHN8rRkfe3jZSR5/xyxg5Seml98wPKMjxlt+IuUplKWevzVPNdDPIuYPRO
	 5I5nRVuG4nJFYrUoeWJqhqodancYg5m4RUvMpHiUmiZkYF3dORKEMt7zcjIZoUfRGQ
	 r0pncW0JpPP+599qoZ4rayIpgcjC+beHPh1YEIfpUbt8Sdd+rtYNi6qMnCJSfWMumg
	 g+ZF/vPrFPZ+ufwimmizZ5TparHfLukTj4ciQ+kMlpAOtbHDlyh0lpCNqgAZMeiptf
	 rsPq/2T1BIUIViN0UmTIhPVZwHvKeMUGWmNlmfQzYZsMnOra78ukx9oml4jy7ceGa2
	 jvaVRs2ABtUjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11701841F4;
	Mon, 19 Jan 2026 21:06:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F1916160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 21:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D31DF841F3
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 21:06:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zFjDjju_bMYl for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 21:06:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9DC1B841E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DC1B841E9
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DC1B841E9
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 21:06:02 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8493219F576;
 Mon, 19 Jan 2026 22:05:59 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon, 19 Jan 2026 22:05:54 +0100
Message-ID: <20260119210554.1508535-1-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768856760;
 bh=vO3/mTsFe4BCbWB8i96DAFSIRl1QYYOvFdcmPsy70vM=;
 h=From:To:Cc:Subject:Date:From;
 b=tvxtovNWZ8t5cKh3Rr4sB0vVN9UHuNhmTZAd9I0J41MH6CDCP2O2xmwgZdNnHUmK3
 Ym6Uv0ATIsxh/roU7uv7ZXm+Oq9bR0wmiVct4++8484LyVlKSEY3oDrHDX0f7iIttA
 +O1oSv5DrfWL3XTqZIsZ+d0iB52DYMX4z0/IOBvZA5mAukvElyvw1vafydzrgbelyd
 U4p0qYv2895OLBLFZliEZYZqgdOmha6SmkeJ9T35voPHt8FKj8RCXzfkm+bbD3Gato
 00Sf0zHihISegAwv0my+WoMIldGuLKKilbpaMyS9vl8+dcBGL9pqVkhJxRD/SWfxq8
 pwAO4bjFLrkkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tvxtovNW
Subject: [Buildroot] [PATCH 1/1] package/fwts: bump to version 25.11.00
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See release announce:
https://lists.ubuntu.com/archives/fwts-devel/2025-November/014113.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/12771511806
---
 package/fwts/fwts.hash | 2 +-
 package/fwts/fwts.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
index 3f04288fb8..6725c9492d 100644
--- a/package/fwts/fwts.hash
+++ b/package/fwts/fwts.hash
@@ -1,5 +1,5 @@
 # Hash from: https://fwts.ubuntu.com/release/SHA256SUMS
-sha256  ecba21d367b1c7aea41b378ad8fd3d43706c0fa4033cc31b59f8152c9cc0d69e  fwts-V25.09.00.tar.gz
+sha256  77d71524feb310236ccdb8b39dd39c6ca73acce5944f3cd54fc05d85a23d6d44  fwts-V25.11.00.tar.gz
 
 # Hash for license file
 sha256  77a5f0ea48e53ee8d67aecc7759cf468bcd340c1caca711ed4307b477a93fb47  debian/copyright
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index f8537fbcf5..cdbf1c0366 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FWTS_VERSION = 25.09.00
+FWTS_VERSION = 25.11.00
 FWTS_SOURCE = fwts-V$(FWTS_VERSION).tar.gz
 FWTS_SITE = https://fwts.ubuntu.com/release
 FWTS_LICENSE = GPL-2.0, LGPL-2.1, Custom
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
