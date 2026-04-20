Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3A3F5A8A6
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 17:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A92C82B51;
	Mon, 20 Apr 2026 17:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3J8W_GxmPgbf; Mon, 20 Apr 2026 17:58:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2697B82BA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776707924;
	bh=KmealRXW6pq9lncVK9Rpne0lMO2uJtgOf286d9NuJTk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KTmF5B2DjaCOXktJdtLQaHfVoQji78H2pViGb//K0GM5JuKA45liTAU2hbmrJcV+9
	 NVHtPYKjN3ZkyYpRQPE0751VlcGyRZJrRV8mqA9iNJOwRdZFXC4TnAoerlckiZ0WE3
	 VoLVuAUj8O5j0Lm4FHuMeLMmPBH8kPYAcU/XFz5TThj+QH332APxIESt5JHyj81Sh5
	 SAW4at+pL5dk2vX5VbNbDSRjH9p7LTvAd7nbwukNevkz7sb8kjOLKePEDsy5MhNwix
	 mwlKx12LaIh9EMBqSJXHbUj/9lhOk/eDffmihCmZhfpHbSWCM5bl3U/qEEUYtfM0VL
	 Wiervo880y87w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2697B82BA1;
	Mon, 20 Apr 2026 17:58:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BE0F24D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AEB141113
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:58:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dyYY3D5PciC9 for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 17:58:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4CB6D41111
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CB6D41111
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CB6D41111
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:58:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cdab.dip0.t-ipconnect.de [79.214.205.171])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CB76AA4C0D6A;
 Mon, 20 Apr 2026 19:58:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45326)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wEstL-000000000Aj-22DB;
 Mon, 20 Apr 2026 17:58:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 20 Apr 2026 19:58:39 +0200
Message-ID: <20260420175839.3705382-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776707919;
 bh=cAUQ5nORHrPyUsjsL3P2mw+5DINW5vVBWCZ3R3Mdd0k=;
 h=From:To:Cc:Subject:Date:From;
 b=MdRnihayr0BDAjhgMNlx7Nhzs7O01MFnp9wMEqI+XjhER32jnLNDt0kzy7Ha8HGP+
 IH6yHLb8aWhjKMRzDCB9Uup2+YpVjbmzmjSwRN59FzSBNp0eGtqwdccSbdEYss7Fw1
 s9xxZulwhXJsoE1GPLmGrqoB1dpojSFIMqNaBJaB6/jj/whmpErvG4gKR2nJ6yvXmv
 k4BGciAXyuuAQXfFZHyEnslxGw9e01SIhDvFyCmbLncm5f6djrUIkoLSt02hpsz3DB
 X9mMSjgS3+0W2+W1iGIJEGiS4mcKzhYcm/lf68gkNbZEWmvEkljXUyEjULM78nVPCx
 MwRP2UNZe2EGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=MdRnihay
Subject: [Buildroot] [PATCH 1/1] package/libpjsip: security bump version to
 2.16
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

https://github.com/pjsip/pjproject/releases/tag/2.16

Fixes CVE-2025-65102:
https://github.com/pjsip/pjproject/security/advisories/GHSA-w5vr-39x7-h8g5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libpjsip/libpjsip.hash | 2 +-
 package/libpjsip/libpjsip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
index e85d1f47b4..65f52bf3b1 100644
--- a/package/libpjsip/libpjsip.hash
+++ b/package/libpjsip/libpjsip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8f3bd99caf003f96ed8038b8a36031eb9d8cd9eaea1eaff7e01c2eef6bd55706  pjproject-2.15.1.tar.gz
+sha256  3af2e481d51aaa095897820fa2ee26c30e530590c6ca56d23e4133bbdad369eb  pjproject-2.16.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 69b3c1cffc..8cea8e3abc 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPJSIP_VERSION = 2.15.1
+LIBPJSIP_VERSION = 2.16
 LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.gz
 LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
