Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC14CD98C7
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 20:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2143B81BB2;
	Thu, 11 Jun 2026 20:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xCTslUsZA9Mi; Thu, 11 Jun 2026 20:35:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA3E481AF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781210155;
	bh=9vqnIszC/QUB7yKOtxH9SixZmBf6hBHZRTCdkNOr+ZY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=K0fzzHKKTR+H45B2fu+PGRw1rP9vAt6n2OzugXDMBRoZaYrWdOjbpdcdTGQ92V0EZ
	 p/GL+r2Vrqiit87nsPpateA03Aoho2/Z2+46B6tEuDYdt/sS4bLvn5EzcTYJ7HFmX8
	 bC2yRrIpboBvbYYtj8/s5gAuuj+HHyJWY7RE4ctMwFgYFVuU1BQtHYD0z9tKh4OCRy
	 KsKvc6bFEioG5DIBHoybgs7PbYtSPp2sJN9Mq5Bcnjcl8Vg0legVKHjelhQ/5Re/HF
	 9smiKzgeQCD4YT71xyOC0KLPAIUZdJKDxutqvYP48ixbxChahTg/LCgC6SsBYXVEn0
	 2Qsd/HQiijQUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA3E481AF3;
	Thu, 11 Jun 2026 20:35:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 487A012F
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 20:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3857840E09
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 20:35:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 51mE1NUp5qbZ for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 20:35:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 305C640D6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 305C640D6D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 305C640D6D
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 20:35:51 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 30DC160129;
 Thu, 11 Jun 2026 22:35:47 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
	Julien Olivain <ju.o@free.fr>
Date: Thu, 11 Jun 2026 22:35:34 +0200
Message-ID: <20260611203534.282013-1-ju.o@free.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781210149;
 bh=W0i1vRS53Q74rjUZvMWXKrbXBUvcrTZ6XyY2APjxp2E=;
 h=From:To:Cc:Subject:Date:From;
 b=qwfDHEe1t88c/I4+/qnSor9wF6KjRKs1WLo7CAm+isRk0ymzkbN5JaKGojS7AI1HQ
 wjpO3X8PAFbW6IN34a9XS6EpOcWrTzPWUaEeKc6L8m58HOI7BkzY8yK7+GN1+Luw/O
 2OxI2f46AtP1zb09Aq65Ele/FWnHr0yxMeqwVr84lgRPLzAwv9dS9XRzRduXtYdw9n
 LUwXdJvnYMVl9Mha3BDEcTasWgc4FEPiGHFlQgSKDDvZ9RvOWX+sX+4SdjU40aUfTE
 Bc3dAj2BhYByniWx+5F6hRhaz0af0WjgZJ6uQ6FCCLYEZ33TapvQPxdBuuy4td+DiA
 hVgbY5DO4e8QQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qwfDHEe1
Subject: [Buildroot] [PATCH 1/1] package/genimage: bump version to 20
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

For change log, see:
https://github.com/pengutronix/genimage/releases/tag/v20

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/genimage/genimage.hash | 4 ++--
 package/genimage/genimage.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/genimage/genimage.hash b/package/genimage/genimage.hash
index 5c55467737..1502b5258e 100644
--- a/package/genimage/genimage.hash
+++ b/package/genimage/genimage.hash
@@ -1,4 +1,4 @@
-# From https://github.com/pengutronix/genimage/releases/tag/v19
-sha256  7ec4fcb865662a8b2ff20284819044ffa84137bf3ca16fb749701291bc01f108  genimage-19.tar.xz
+# From https://github.com/pengutronix/genimage/releases/tag/v20
+sha256  397545be2fa52d482c5fba9a11897c61324bfc559ea0efb700b9edba7a807b55  genimage-20.tar.xz
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index 5fa34d8eb9..cdb1e64f32 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENIMAGE_VERSION = 19
+GENIMAGE_VERSION = 20
 GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
 GENIMAGE_SITE = https://github.com/pengutronix/genimage/releases/download/v$(GENIMAGE_VERSION)
 HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
