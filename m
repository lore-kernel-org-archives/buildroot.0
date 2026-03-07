Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1544EF55104
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 16:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6823F83F6E;
	Sat,  7 Mar 2026 16:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ylc6ckg1Xizq; Sat,  7 Mar 2026 16:52:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04CFD83F69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772902366;
	bh=Z7sfTjolrOJaRv+mLzOy7hoVnoDyJnOFkW2R4THcZe0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YCurQnz+E6qSamFdYe24/VTmZmt/d1RATIyMb1TyUack9nVK/eaCDvrIIZvkpxhkp
	 mPM015IElXyf1qCBEdVVO5Si2WUt1rbo3vJloJDCBAaKf5Iny19Q1U5d8FadjeDKdD
	 eXRG5+gk0d1h/cyawsefsg9OBKY/EefWDMzq9S30GflHwARP9i02armCprFr1xNTIu
	 UPmpI+Efqpjb6sKR6PccCcofRuYQhg+J/27rhqM+y82KgIXYbqeOBMrsXNRt8zef++
	 EbflFwySD8+e+quXRspNyIxwqT0jDFTMMKo6ObfQ/PJh0XujnqG515EARVLWU/W7Gd
	 J13pyTZiDtAeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04CFD83F69;
	Sat,  7 Mar 2026 16:52:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AD24A223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 16:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E95A41BC3
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 16:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PAMrjVXshpAX for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 16:52:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2211F41B74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2211F41B74
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2211F41B74
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 16:52:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9592BA4C3225
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 17:52:40 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52184)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vyutM-000000004Bn-1BqR
 for buildroot@buildroot.org; Sat, 07 Mar 2026 16:52:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  7 Mar 2026 17:52:40 +0100
Message-ID: <20260307165240.1215719-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772902360;
 bh=MlJdfgOLLFNGne1/4EkNfnozbO3i4ZiD+5ihX65oLto=;
 h=From:To:Subject:Date:From;
 b=M4PlT4odSnKs83zz1K+j/BNEmlELEKKZkZmzafPDvrFT0AOu/O3VcAlYFkIlwaAuz
 7KYWTOAWGXs6ZWlkVFEcb+JBrSxPrMUlpvzq6izwoi/JvCElMRYT+QBqYFGFNIEUks
 YoAwJgTHOU6kpCqH1huf4O4KVNMY6k+2Wex7gL/DaWi3uqNYVGQcVnUjLOgUInNKvB
 RJt2aSYaCyFr051spzjuQTa3fBBpL6cXZTFr39TbOIjkFe6Z6x7h+HUfA+X61qigvm
 WBTfFsoDhfYkQAVBIC3kipodwd7C2WMVYwQAi4h7Q/PQqcUKAesjJps829pAEiBzPP
 0kuSbpq/7hHig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=M4PlT4od
Subject: [Buildroot] [PATCH 1/1] package/taglib: bump version to 2.2.1
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

https://github.com/taglib/taglib/blob/v2.2.1/CHANGELOG.md

Used sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/taglib/taglib.hash | 3 ++-
 package/taglib/taglib.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/taglib/taglib.hash b/package/taglib/taglib.hash
index f3fc31beea..0db3cfa8d6 100644
--- a/package/taglib/taglib.hash
+++ b/package/taglib/taglib.hash
@@ -1,4 +1,5 @@
+# From https://github.com/taglib/taglib/releases/tag/v2.2.1
+sha256  7e76b5299dcef427c486bffe455098470c8da91cf3ccb9ea804893df57389b5e  taglib-2.2.1.tar.gz
 # Locally calculated
-sha256  3716d31f7c83cbf17b67c8cf44dd82b2a2f17e6780472287a16823e70305ddba  taglib-2.1.1.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256  53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f  COPYING.MPL
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index 60ca045886..cac9f924fc 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAGLIB_VERSION = 2.1.1
+TAGLIB_VERSION = 2.2.1
 TAGLIB_SITE = https://taglib.org/releases
 TAGLIB_INSTALL_STAGING = YES
 TAGLIB_DEPENDENCIES = utfcpp
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
