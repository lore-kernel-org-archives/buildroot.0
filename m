Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDD5C3ABC3
	for <buildroot@archiver.kernel.org>; Sat, 10 May 2025 22:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A87BD40750;
	Sat, 10 May 2025 22:12:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I7grVV-G7yjW; Sat, 10 May 2025 22:12:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D107E40773
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D107E40773;
	Sat, 10 May 2025 22:12:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B7F5154
 for <buildroot@buildroot.org>; Sat, 10 May 2025 22:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CA3C60634
 for <buildroot@buildroot.org>; Sat, 10 May 2025 22:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6HlZOGkutcMF for <buildroot@buildroot.org>;
 Sat, 10 May 2025 22:12:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0836E60602
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0836E60602
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0836E60602
 for <buildroot@buildroot.org>; Sat, 10 May 2025 22:12:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a07c5.dip0.t-ipconnect.de [91.58.7.197])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DE5EDA4C0935
 for <buildroot@buildroot.org>; Sun, 11 May 2025 00:12:33 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60650)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uDsQr-000000003zt-1Sid
 for buildroot@buildroot.org; Sat, 10 May 2025 22:12:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 May 2025 00:12:32 +0200
Message-Id: <20250510221233.2416832-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1746915153;
 bh=tzhD4GzO32+DpnAG2DwNw7bjuhGxCqTvGh5ZpVaOHns=;
 h=From:To:Subject:Date:From;
 b=bIv6/tz1R3rKHymUNW47iKoJKry6qEx0TwO9cbprTO69CEqFm3aXwN+fLk3+pSiTP
 KINHRNCORXVz+qTAkeu06B7IVcN1umwgGDZGznroq2bWo7jgOl9SSGeXdGMN/ct+fN
 JLstBMq+Jcs3ERLUjjPqwDiK3/GNpmTqMTED+W5Uz5OyIgAzdsPWED1pYGliaUyIB9
 3VAKeqpEnIObHpSvn7QKx+KpQGzawce5mRudTgG0L3cHp0lIxWtMs3tCQvdkGfYw3/
 lPtCLMlkshDPny7LOOOiMjS342gOkaVCJTdvNEUcJyTT6Vd6JYH4aPCNPumSe/22mC
 3DkJAA89GwlQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=bIv6/tz1
Subject: [Buildroot] [PATCH 1/2] package/kodi-inputstream-adaptive: bump
 version to 21.5.13-Omega
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index 92814e8da2..98e3416f03 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  1db831ebb0acbda2576e684f8af089c524025c6a410eefb7a015cbbb505aa04d  kodi-inputstream-adaptive-21.5.9-Omega.tar.gz
+sha256  2cde7954b0a73d353edc2af14306e4e42e6bf9e7f26100a54b937cb80c1309a8  kodi-inputstream-adaptive-21.5.13-Omega.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index ed33c7bdf6..4cdb7fe2af 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.9-Omega
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.13-Omega
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
