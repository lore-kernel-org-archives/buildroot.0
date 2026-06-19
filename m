Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E376CD98F2
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 18:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E97E760E05;
	Fri, 19 Jun 2026 18:13:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ndGu3UskuNCB; Fri, 19 Jun 2026 18:13:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F41D60ECB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781892805;
	bh=azJY4NUCw43Uq62BUBYVv43kqmRVshMccBAQXaP3eH4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ey+tuQ7AE6NimhuPsaE12Cjl8odvWHjrLWU5nsEBD/hIigr4e9ZzwgYop4pUHCV4k
	 lQSCy1uBl2Re2qSdmnlYDnhnrvvM3G1z/xL9v2HBPN37CiHM6skzspjoqQZAvpdk/Z
	 k0kH1LTTCSoHDN67jzhBXhd9UL6/5AZ/NGA66SPW57YtVXlbgpsSxLIsbj/sIoF1DK
	 wwxhH96pxytYdtbW5BaRfoLiRYriphOG83aLrkdn8RRVyg4ieS/sGy6SsljBmmwlrx
	 m9PXMcWxzXmskQsDOm7hQeibH1qr6quib7pAyHSpAScUejkop/XgSg2ig+x1NgRUYB
	 rQ/6UC4ObpEFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F41D60ECB;
	Fri, 19 Jun 2026 18:13:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9397A279
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 18:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 795B445452
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 18:13:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m3tL943NSLAi for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 18:13:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 84EA145315
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84EA145315
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84EA145315
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 18:13:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a031f.dip0.t-ipconnect.de [91.58.3.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9D39EA4C03E4
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 20:13:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57820)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wadiS-0000000078l-49BQ
 for buildroot@buildroot.org; Fri, 19 Jun 2026 18:13:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 20:13:21 +0200
Message-ID: <20260619181321.3345513-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781892801;
 bh=d/UJQR3rp10JvAqGNLIXrR0mWS3pONUO7kPSH5GIQF8=;
 h=From:To:Subject:Date:From;
 b=gMW4IHSLkabwYxNaPHo9fUWodeBjNVqgJa7F39VU2rDHt8UZjLDri5R9Cm0mGHF7A
 GyBlcJod282PjoxCNA3+naPDjjqWsyx5NLn3jDrYGIJD1t6KC70VQRXK8FxQJ1z5KC
 OZ7rrcMdfkt4PUaB1ziHs2DepmFSkbar3gl0EH+m4UiTKp4IY+y6DjeNivV3VipaO0
 0NIbwjcu/UpEH8AwDUNvVr+Gsc26IdX8XE8LXdrRmmV/WoF+K2z2TdiyYrRGv7Trsp
 CR1P6T40jM1CltVI6G2j996zPJLvB6gSz7ynd1dHHyby+cqja19BsbLc3oaUQlbhzx
 WN/zEvtFFfX+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=gMW4IHSL
Subject: [Buildroot] [PATCH 1/1] package/libgsasl: security bump version to
 2.2.4
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

2.2.3: https://lists.gnu.org/archive/html/help-gsasl/2026-05/msg00001.html
       Fixes CVE-2026-48829: https://www.cvedetails.com/cve/CVE-2026-48829/

2.2.4: https://lists.gnu.org/archive/html/help-gsasl/2026-06/msg00001.html
       https://lists.gnu.org/archive/html/help-gsasl/2026-06/msg00002.html
       "GNU SASL Security Advisory: NTLM client use-of-uninitialized-value"

Upstream does not provide sha1/sha256 hashes anymore.

Updated license hash due to copyright year bump:
https://gitlab.com/gsasl/gsasl/-/commit/ec96bad53988cb79060964cf1f1568da4e301fd6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/cacbb2a74a1a47440ad8e193de23bc645f99817d

 package/libgsasl/libgsasl.hash | 8 ++------
 package/libgsasl/libgsasl.mk   | 2 +-
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/libgsasl/libgsasl.hash b/package/libgsasl/libgsasl.hash
index de24d73c2d..4995ffe823 100644
--- a/package/libgsasl/libgsasl.hash
+++ b/package/libgsasl/libgsasl.hash
@@ -1,11 +1,7 @@
-# From https://lists.gnu.org/archive/html/help-gsasl/2025-03/msg00000.html
-sha1  8a845b7ec78e5f27bf69438074ad23867c00d4fe  gsasl-2.2.2.tar.gz
-sha256  d45b562e13bd13b9fc20b372f4b53269740cf6279f836f09ce11b9d32bcee075  gsasl-2.2.1.tar.gz
-
 # Locally calculated after checking pgp signature
-sha256  41e8e442648eccaf6459d9ad93d4b18530b96c8eaf50e3f342532ef275eff3ba  gsasl-2.2.2.tar.gz
+sha256  d32be15efd3a04cb19b232f721bdca02cc6ad7ab415df7d79fb2dd2c0da3e0be  gsasl-2.2.4.tar.gz
 
 # Hash for license files:
-sha256  e3d1b8a82b97dc6083b2600a6beb0396bbefbe384fc1cd39d0e8cb04bbf2bd33  README
+sha256  16a8258f525326a71cba997365505ad32089be4be7a7100f64f308ed01419a11  README
 sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LESSER
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/libgsasl/libgsasl.mk b/package/libgsasl/libgsasl.mk
index 8670f43b6f..db3b64e282 100644
--- a/package/libgsasl/libgsasl.mk
+++ b/package/libgsasl/libgsasl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGSASL_VERSION = 2.2.2
+LIBGSASL_VERSION = 2.2.4
 LIBGSASL_SOURCE = gsasl-$(LIBGSASL_VERSION).tar.gz
 LIBGSASL_SITE = $(BR2_GNU_MIRROR)/gsasl
 LIBGSASL_LICENSE = LGPL-2.1+ (library), GPL-3.0+ (programs)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
