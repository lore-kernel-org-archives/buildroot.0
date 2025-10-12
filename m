Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E3BCCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 08:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E31F81E0D;
	Sun, 12 Oct 2025 08:58:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6r16dxWUfV9C; Sun, 12 Oct 2025 08:58:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68E6C81E05
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68E6C81E05;
	Sun, 12 Oct 2025 08:58:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D5B7A2A8
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 08:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBB2F4009D
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 08:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i0-rHsrNLjDz for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 08:58:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 047264000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 047264000B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 047264000B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 08:58:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 179A7A4C661F
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 10:58:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49508)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v7rty-000000000dm-0gZp
 for buildroot@buildroot.org; Sun, 12 Oct 2025 08:58:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 10:58:02 +0200
Message-ID: <20251012085802.3442610-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760259483;
 bh=zMTgk3LMLuZ+0b+IA5Hk9VuGnIYgjGheMsuJMtix/aY=;
 h=From:To:Subject:Date:From;
 b=0tOqkDSVCGUWcPRAaGSI2wqOrs2m0YA3XfiOcYbsbAm1psD/cDcZr3VTt5OGL3wn9
 nE4CjN01G/iOjS0BSx0sR4vW7HVXgAPef0rd/SE/ZzAEhoxOgGT/XTvFIJTcO05vNf
 Ov9foSOqM5xRGHxnPtBFSlXbOE4rKBNZaE/L2o8+E7KS7q5wiUxf4XzqX3Q85VIjLa
 H9p1oYcDtIReeCAYEVzut5nAbvjQoyB/D3qyLdPKb5Ww5juxQdWqzyxMpm8pY/4A7s
 LD3eY4zuP/dEmLkvjPNRN4e2H5ffPPplZ/bQjCS/Gwd00MyBidlKfr5tkb9HhuOuUo
 NcrJi/PY0tDCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=0tOqkDSV
Subject: [Buildroot] [PATCH 1/1] package/libgpg-error: bump version to 1.56
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

Release notes:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=blob;f=NEWS;hb=b3b68bde07b02dd2b6d78356ac90baa652a309fa

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libgpg-error/libgpg-error.hash | 4 ++--
 package/libgpg-error/libgpg-error.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index 957f96edcf..d02983d1ca 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  0a9386ff70a5d1f771771bf0b8db2b956e292f13  libgpg-error-1.51.tar.bz2
-sha256  be0f1b2db6b93eed55369cdf79f19f72750c8c7c39fc20b577e724545427e6b2  libgpg-error-1.51.tar.bz2
+sha1  6db7c51778e424c928993e1d49ccf6ad6866b185  libgpg-error-1.56.tar.bz2
+sha256  82c3d2deb4ad96ad3925d6f9f124fe7205716055ab50e291116ef27975d169c0  libgpg-error-1.56.tar.bz2
 
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 3f327e3054..1fb1076ef3 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.51
+LIBGPG_ERROR_VERSION = 1.56
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
