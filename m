Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D33FECD99B
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 19:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E949961117;
	Thu,  5 Feb 2026 19:53:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWZBvEdtjb9L; Thu,  5 Feb 2026 19:53:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63A6B60B6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770321184;
	bh=fnq5zE2yY31ELwRQoJF7DhWTgIIEYR1I6mtdbBLrotA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iKBt3b2/qIltubefz/6D0iNqcwtyYaa1rtHqZlTQRwt/lLD5K5o/n3OK2jhlwGaYa
	 ItfZ1zJPaUUjn1kSTCa41psZCzmoGQOVP+AUXLXMwV4HQkLwKoRVPoZywco1dSka6N
	 7nNjr7R/lBt6ZBQm7W1IVc1lNqYIE6hLnKOHLRqDpOUWqMT0RemHsu18WWtiuKe+Fl
	 VOjxQ5n6U02G1e6X5Vw0WEfg2H7Hi4JhBhe+gWPwvOQPTVqHGjT1sq2gRkuNYPRynN
	 gXYlyvL6cyXIs4dBHyNdUYXzKn0md4I8GPetPojHZcz1/4rtSlzPUycRJVrKL/K4jJ
	 J4ZR4Igd/b/Rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63A6B60B6B;
	Thu,  5 Feb 2026 19:53:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10E7D173
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 19:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFA444118A
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 19:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6EdivPfU6pnT for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 19:53:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F1881405BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1881405BA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1881405BA
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 19:53:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 663D2A4C3C40;
 Thu,  5 Feb 2026 20:52:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57288)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vo5PP-000000006Rf-1Jw9;
 Thu, 05 Feb 2026 19:52:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Guillaume Chaye <guillaume.chaye@zeetim.com>
Date: Thu,  5 Feb 2026 20:52:58 +0100
Message-ID: <20260205195259.2348677-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260205195259.2348677-1-bernd@kuhls.net>
References: <20260205195259.2348677-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770321179;
 bh=EZud77RXkQyaetEOdbVMJcRSk9jp3oaFce6y5gSAhOY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=VOyuc5Du1ixcPXgT+IJl2/k+Riem0WjGbThEojNw9vPtk77N9GRgytBDfyhu9qem+
 pxdyaJXmBxYOs7CSS/N8TdFoMdn79+D/ncCh7fWSHy5ef1nRst2Rt+t16lY6cTHzlH
 9qxn+7szx1pFb76GGghLcVTu+gaPTHs7RhHaIQFXfILOt5yJlYwE42Ld+5Pdf+D93e
 PTjNsL7LZ2IocXza/aE+Vn1WcCZ1iEbyK15T77Y7ZsWM/nx/Lbg2h40k5yn37QmUn/
 3wXgEjCYWvy73ykYeZxQ2tdK2m6jjTLjbZGq2ZZoh32WkPhvZn58m513dY3DEdpTBX
 d4z4WWxGXKdww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=VOyuc5Du
Subject: [Buildroot] [PATCH 2/2] package/sane-airscan: bump version to
 0.99.36
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

https://github.com/alexpevzner/sane-airscan/commits/0.99.36/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sane-airscan/sane-airscan.hash | 2 +-
 package/sane-airscan/sane-airscan.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sane-airscan/sane-airscan.hash b/package/sane-airscan/sane-airscan.hash
index 40fb84e32d..affd7031d5 100644
--- a/package/sane-airscan/sane-airscan.hash
+++ b/package/sane-airscan/sane-airscan.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  647f41f84f9bce743c796ca84c1fda67e519968fab407490c28fd0cc6d7ac485  sane-airscan-0.99.33.tar.gz
+sha256  43d3436c0199496ee18aca4f875fe3926a40a0fae781bc280cdb96f7b5068ac0  sane-airscan-0.99.36.tar.gz
 sha256  a2631c1b81992bd6f66db6be8b009ed7e3e998d1e2db4de497fa82d65011d373  LICENSE
diff --git a/package/sane-airscan/sane-airscan.mk b/package/sane-airscan/sane-airscan.mk
index 168430e3e3..46948ab547 100644
--- a/package/sane-airscan/sane-airscan.mk
+++ b/package/sane-airscan/sane-airscan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SANE_AIRSCAN_VERSION = 0.99.33
+SANE_AIRSCAN_VERSION = 0.99.36
 SANE_AIRSCAN_SITE = $(call github,alexpevzner,sane-airscan,$(SANE_AIRSCAN_VERSION))
 SANE_AIRSCAN_DEPENDENCIES = avahi gnutls jpeg libpng libxml2 sane-backends tiff
 SANE_AIRSCAN_LICENSE = GPL-2.0+-with-exception
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
