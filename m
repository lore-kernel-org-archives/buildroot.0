Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6889FA3741
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 14:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A41D40638;
	Fri,  2 Jan 2026 14:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6iuTPff36wzS; Fri,  2 Jan 2026 14:12:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D508140629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767363150;
	bh=eEKenGvH4ujO5VFsf60FlfU28IC1oQaHEbSPZXHpXp4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YAO4F9cC8oyK7z4C2j4r/giVv//mY9jBr0djoTno2qHspREXNFvQLrPJFbBSI8rYS
	 vGkZiLjK3rRS2qNg2gyrDidwbnDlGlq5mqsNiCWIdwgXUf97XnbEq67xaKymTWcOlG
	 l3XvLXaKOeh1wN3dVn9C2Ydk8N1W5TsSb4+dhDgpuc+lzd+hYI6nWMoBjMVY3MumUr
	 yR6wtWicUXlbuJoQ+HDWCXYVnu4TICXrvHFRMvFKP5OAqSxB5ZzQiiO82kA7/gAaAA
	 VMnhdNz1VP4d2AX25lynksoOokHwBBGQ2wFCjRXPlTKePzC2QKMAOELCD9TSbv1A3d
	 wWj0FNmQSvVvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D508140629;
	Fri,  2 Jan 2026 14:12:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 63487D7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 14:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49DDC6083A
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 14:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KETZmPx2-1fO for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 14:12:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4203E60828
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4203E60828
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4203E60828
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 14:12:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5CC05A4C2A6E
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:12:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50106)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbftC-000000007dT-0GzC
 for buildroot@buildroot.org; Fri, 02 Jan 2026 14:12:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 15:12:25 +0100
Message-ID: <20260102141225.167269-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767363146;
 bh=Y66H9hOjt7/VqEx+rRt2K++z+nORjyoJLlvJdALIi/k=;
 h=From:To:Subject:Date:From;
 b=okpG7nVYzwcBj31W2852IFPpaIAz1135ZuxkL21HSihK6JocxIP3ZbAFTodv7BSoz
 PGwr81RY5DG9VuEukZk3CSAZxrJtQySFxeHJBftrO0paIkocHVq6NFoJrJ2vWLBAHk
 CWpejyNVItd0pOzVkmOzUv8sDDC/fFaZyJhw0VZZ2xW8H1rnKflDOOimdloHL5hCIB
 yj268BznaKVoYZcHBJ2sgfHUovfUFTg5mEqtVxINy6SP58ahf063Drh5R86XYcyYJ2
 0q9GZbQ8TDLDeTxGMFNArtPiO+LYbVNezNjH072jF/pikjoPky7RjNZaW2zlO6sZCV
 Re/+M69DALZiw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=okpG7nVY
Subject: [Buildroot] [PATCH 1/1] package/libheif: security bump version to
 1.21.1
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

https://github.com/strukturag/libheif/releases/tag/v1.21.0
https://github.com/strukturag/libheif/releases/tag/v1.21.1

Fixes CVE-2025-68431.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libheif/libheif.hash | 2 +-
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index da2516a583..3da82e3e27 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  68ac9084243004e0ef3633f184eeae85d615fe7e4444373a0a21cebccae9d12a  libheif-1.20.2.tar.gz
+sha256  9799b4b1c19006f052bcf399c761cc147e279762683cefaf16871dbb9b4ea2a1  libheif-1.21.1.tar.gz
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index d82ec6a0ec..acd302d847 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.20.2
+LIBHEIF_VERSION = 1.21.1
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
