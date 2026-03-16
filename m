Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C74F53D69
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 16:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B94F40E6E;
	Mon, 16 Mar 2026 16:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JojMyBE0g1qD; Mon, 16 Mar 2026 16:14:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DF0D40EE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773677672;
	bh=vBcV8BL2u9362F23zLQKFfpkgGx930ejQHJUNjA3Q4g=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=cdVVI9sOgOnomquWognJ05dCKqOL3/+ANpSenk6noFOg++bwAQXuP27pstwSVXMnx
	 ic1Y8eQwyX6Haf4lWKvd8P0XMIn313Zq24+HsZtaJrS7pmnMT0dOCeNqSyVfmm/uZl
	 hYQcRi9DlxsBLS3bh3SVh6q9lqiqp0gmG4vPfvWPN/O2pkWfgOStX2ZiqeAs5x9Xm8
	 8Dutx8ph804pVoD3/Vg+B/hSOufmqvHeBINxXaQ+eVHe9qnWEwnMAud8yj78Fycrxl
	 ItQnhibvrDQ0aePP1JpfLBrrpF2/YJmAhz++DY4zjlZXe/jiAziNUsKKyE9AdU2Buv
	 6RRb5AdM9bqLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DF0D40EE1;
	Mon, 16 Mar 2026 16:14:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31B7C3BE
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 16:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2375440127
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 16:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eMS5lGnVOqdB for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 16:14:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.90.104.147;
 helo=esa2.hc555-34.eu.iphmx.com; envelope-from=jimmy.wesolowski@mobileye.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 07076401E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07076401E3
Received: from esa2.hc555-34.eu.iphmx.com (esa2.hc555-34.eu.iphmx.com
 [23.90.104.147])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07076401E3
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 16:14:28 +0000 (UTC)
X-CSE-ConnectionGUID: SN62/0GuTUO8PPO1SKLiGQ==
X-CSE-MsgGUID: ZDQmHSNYSbK2l5q05YhHRw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
 by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 18:14:27 +0200
X-CSE-ConnectionGUID: GXCLTSeUQZOzGTbfLMXeHg==
X-CSE-MsgGUID: la9208oOR5SfTTJkw/lCVg==
Received: from unknown (HELO epgd074.me-corp.lan) ([10.154.54.2])
 by ces03_data.me-corp.lan with SMTP; 16 Mar 2026 18:17:26 +0200
Received: by epgd074.me-corp.lan (sSMTP sendmail emulation);
 Mon, 16 Mar 2026 18:14:26 +0200
To: buildroot@buildroot.org
Date: Mon, 16 Mar 2026 18:13:57 +0200
Message-ID: <20260316161402.1994225-3-jimmy.wesolowski@mobileye.com>
In-Reply-To: <20260316161402.1994225-1-jimmy.wesolowski@mobileye.com>
References: <20260316161402.1994225-1-jimmy.wesolowski@mobileye.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
 t=1773677669; x=1805213669;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fpm4ty5WkfiTzmAcIRUcbIgpqmLWz7qbqj9a2iGKUxM=;
 b=jgnoEXnT+TOpiwL16gz4eRmBjR6UmqkXD9F5y/8TKCv94ZeKQ9pS+hQb
 qYhHquPtt0gl8z3ZTfuHTUMuZz+dGtahuf3vT8SBokdhBD3aOhhLhl6Qd
 coRIFRlTATCddSis8m0p8Fw+69YifTWt65MJdDUOhn0Z+PVsYxqZYGu4p
 WRpms2Vc3FHNtzoIZ6kbXmwAcWRVyN0MfuMW1+ybbmK5V7qzgrBJO3A2d
 uApN2FS5MhLGZZg66D27vzvBaQOReA9fh3enx10W+l7aw8dBFRrczG2/g
 Z7nrhiVoaeomi+XYIyMJwMZNsNrDbOubKOS4Su21u4OGcMi5L9AN2feKI
 w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
Subject: [Buildroot] [PATCH 3/5] package/libopenssl: bump version to 3.5.2
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
From: Jimmy Durand Wesolowski via buildroot <buildroot@buildroot.org>
Reply-To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Cc: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>,
 guenther.harrasser@mobileye.com, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Peter Korsgaard <peter@korsgaard.com>

Bugfix release:

- Miscellaneous minor bug fixes.

- The FIPS provider now performs a PCT on key import for RSA, EC and ECX.
  This is mandated by FIPS 140-3 IG 10.3.A additional comment 1.

https://github.com/openssl/openssl/releases/tag/openssl-3.5.2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7e5a3c98452c6db8422b0fa6455390d138ad07df)
Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 1675d72fb2..7f3795e1ac 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.5.1/openssl-3.5.1.tar.gz.sha256
-sha256  529043b15cffa5f36077a4d0af83f3de399807181d607441d734196d889b641f  openssl-3.5.1.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.5.2/openssl-3.5.2.tar.gz.sha256
+sha256  c53a47e5e441c930c3928cf7bf6fb00e5d129b630e0aa873b08258656e7345ec  openssl-3.5.2.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index f3521b3cf3..38d04ea924 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.5.1
+LIBOPENSSL_VERSION = 3.5.2
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
