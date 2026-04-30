Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8480CD13D3
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 18:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 814276F4C3;
	Thu, 30 Apr 2026 18:36:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DuwrpBhGH_LA; Thu, 30 Apr 2026 18:36:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D17E6F4A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777574163;
	bh=a+mmxjZHG42VNi1XZtIKVhq1FGxy19/1iU1tBFfNJjY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gUASSrBGSDd6olFO7BLHrLWoIAYSHZPlLWTIrBpOOzEk+4a4cdE90mr1Jy1FvZx1h
	 vxVPCYPXmPs7FfAbLxpV6Qp28intv1priJPSMgvhxpVq+8nAExJy1cvBlsNlGRKw40
	 fYQKTPrbFoFnK9c+hjLkustMoufHSNH3gNZd3cSihzfnYzcmkMmUqCI8w5qAscQJQj
	 /tGpFsUZEIeRVPOfrxURNPrc0TxOOZUTXwtp6ScvyYZ3U/ePSEWKK4n7B1WfPh7Niy
	 wVXcvPhsEPWMTofqkQ2jFHjDB73C7WkBtdZ9kuM/ul5vLPKL6LuRk5cfYX9/9Y71s1
	 Yz09ijROlLHmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D17E6F4A9;
	Thu, 30 Apr 2026 18:36:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AF4E9127
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 18:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91A4641C5B
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 18:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UggKOfwLMPRH for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 18:36:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 35BDE41079
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35BDE41079
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35BDE41079
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 18:36:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B865CA4C2CFD;
 Thu, 30 Apr 2026 20:35:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38918)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIWEi-0000000036J-3gYR;
 Thu, 30 Apr 2026 18:35:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 30 Apr 2026 20:35:44 +0200
Message-ID: <20260430183544.2362642-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430183544.2362642-1-bernd@kuhls.net>
References: <20260430183544.2362642-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777574144;
 bh=WJUXkR/20Byp/65uHEOLRRnID4bAjE3giopmv6IfrHE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=JVJRnM7L9qhdMk+bYp60XD7pgsmLbT2zZwnX0JY3wbX6APf2Tn4jPh+lEIvrRDuoP
 Y8lZ5O4DCOPtW1MDv3GeSRDg5mvKvwEhSQbED8ut9q1GmCY84Ejr02CbD2UPi+mwzu
 6KSLa2F3iJBlfWHcX/BWj/KVZWL8Cdq2rMI6eayGiCggIxxLV2y7J/dVs4nZ1bkEfx
 kztnfjB+VvahRoE45q51dDKT2ctaLagkvuu7T9jqWUsymLWnL5klXapSDWnBAsyD6U
 NsaLLaa0axeXxSBNZgc8+6w5rgB7EEzELxJwLkxszxxDksMblHYEnN2PleZ0BR3JY3
 HyzBEkTdXm2MQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=JVJRnM7L
Subject: [Buildroot] [PATCH 2/2] package/libpjsip: security bump version to
 2.17
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

https://github.com/pjsip/pjproject/releases/tag/2.17

Fixes the following CVEs:

CVE-2026-25994, CVE-2026-26203, CVE-2026-26967, CVE-2026-29068,
CVE-2026-28799, CVE-2026-32942, CVE-2026-32945, CVE-2026-33069,
CVE-2026-34235, CVE-2026-40614, CVE-2026-40892, CVE-2026-41416,
CVE-2026-41415, CVE-2026-42225.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libpjsip/libpjsip.hash | 2 +-
 package/libpjsip/libpjsip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
index 65f52bf3b1..5f8e4b0eda 100644
--- a/package/libpjsip/libpjsip.hash
+++ b/package/libpjsip/libpjsip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3af2e481d51aaa095897820fa2ee26c30e530590c6ca56d23e4133bbdad369eb  pjproject-2.16.tar.gz
+sha256  065fe06c06788d97c35f563796d59f00ce52fe9558a52d7b490a042a966facce  pjproject-2.17.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 38adeff626..449e44586d 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPJSIP_VERSION = 2.16
+LIBPJSIP_VERSION = 2.17
 LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.gz
 LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
