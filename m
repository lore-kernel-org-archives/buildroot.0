Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D86CCD5BB1
	for <buildroot@archiver.kernel.org>; Mon, 25 May 2026 16:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BEB881EAE;
	Mon, 25 May 2026 16:21:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Un-CyATZAZk; Mon, 25 May 2026 16:20:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C47EF81E6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779726058;
	bh=vQ5B3XYPw8mOqlq6XYhqYlrPx8yt8JskJrPqK6veb+I=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fmIlE7RAiL9qFSFlgFVeMkICjgfBOqLnmcK9GXfes+0L+rVrUxl988t1YY2AHMtcQ
	 H7KR8NXtm0+jSaEAuNa/W+f6Yyn1zOGrCD4u1n6RMDjttuG39EGL6GtapEfpRxRtwt
	 3ec5tFoqqYsmVaCtyTAztHhZQKkCX+EOAZkT1rCS/AFwMVDWcOa1ZoP6KVjlAfj3aD
	 iuNfPBFBUhpGSAnvAU9c/FmdQAi8HJ5UjSoZgnECwATT5xAMh7ixnkBYpAkJKJFhIC
	 ZJNY+/6nLAzH/rtjo08QYa1eKyMcLIdy/pSDoS2YCGxKyfzLqhxD7YVel52L3iAAEk
	 0lXRSzUqUEPiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C47EF81E6D;
	Mon, 25 May 2026 16:20:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D8C521F
 for <buildroot@buildroot.org>; Mon, 25 May 2026 16:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5382C606F7
 for <buildroot@buildroot.org>; Mon, 25 May 2026 16:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o8w7iCXz4HhC for <buildroot@buildroot.org>;
 Mon, 25 May 2026 16:20:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0B5D1606B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B5D1606B1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B5D1606B1
 for <buildroot@buildroot.org>; Mon, 25 May 2026 16:20:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c0c6.dip0.t-ipconnect.de [79.214.192.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 489A4A4C08DD;
 Mon, 25 May 2026 18:20:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45098)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wRY2v-000000001Un-2D5O;
 Mon, 25 May 2026 16:20:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 25 May 2026 18:20:53 +0200
Message-ID: <20260525162053.1455403-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779726054;
 bh=Wxl98F/nW76JNQIV/A+6HijjjpK0IeIWf4ah0yuTywE=;
 h=From:To:Cc:Subject:Date:From;
 b=uWzNVij36gXgtTHNQB2hTqy587HBE/PDf/orSmoS19Z567yhQkkL3Zp8wOh3ckL1o
 zGbR8dsXhGGveY+jPFO7NvL8PLpPvWn+4qT062oCqkkYakZWhZP6d/Mwwzmy6JhTtI
 HZrAG4wEi5/M9BTgyrsLDEwz+FeIGPEkj9bmXWEsrhFPktgafg0A4+dcnDD3RPynfM
 bhGpiOTy2+UA8hBSAktZbWuuaYf61Tv4J/2jnz1SfxPGhCTt3Nr7zHWEnLsdLcolZP
 m4b7v/6Uz1Jc+DFlcmY2oB2ItMP7l1IxXZ9Q+3SZKAcNEZn5ZWa0lups3hYMUmOprF
 DMSaMFr5RNYNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=uWzNVij3
Subject: [Buildroot] [PATCH/next 1/1] package/snmppp: bump version to 3.6.5
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

https://www.agentpp.com/download/changes_snmp++v3.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/snmppp/snmppp.hash | 2 +-
 package/snmppp/snmppp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snmppp/snmppp.hash b/package/snmppp/snmppp.hash
index e81bd8886f..450d24821a 100644
--- a/package/snmppp/snmppp.hash
+++ b/package/snmppp/snmppp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  52c038426d6e13d627832aadb905549ee32b5ca4b707ac446bedac05abdfd1bf  snmp++-3.6.3.tar.gz
+sha256  6c1a383085105805302b52ed922e35be00b1fe36981bdf7c34b35ffc635043ac  snmp++-3.6.5.tar.gz
 sha256  61337e799c8274e596e5783b22607beea8073ee296c6b27fc5c7487296e56851  src/v3.cpp
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 9a84d74f95..10d1b6f8d0 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNMPPP_VERSION = 3.6.3
+SNMPPP_VERSION = 3.6.5
 SNMPPP_SOURCE = snmp++-$(SNMPPP_VERSION).tar.gz
 SNMPPP_SITE = http://www.agentpp.com/download
 SNMPPP_DEPENDENCIES = host-pkgconf
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
