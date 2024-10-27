Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822F5D13588
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 20:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7468C4056D;
	Sun, 27 Oct 2024 20:56:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9cdM6vOrqf5T; Sun, 27 Oct 2024 20:56:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30B5840585
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30B5840585;
	Sun, 27 Oct 2024 20:56:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62A01112A
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 20:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5149C80C41
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 20:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oA27mRskVZpY for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 20:56:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 540AC80C2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 540AC80C2F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 540AC80C2F
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 20:56:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02c6.dip0.t-ipconnect.de [91.58.2.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 72A85A4C0CC4
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 21:56:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44230)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t5AIz-000000003Lv-36dh
 for buildroot@buildroot.org; Sun, 27 Oct 2024 20:56:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 21:56:09 +0100
Message-Id: <20241027205610.3445994-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730062570;
 bh=QMAQwClsylNCe0uVoW8hu2ISFQD5b6/Sj8v64i2SEYE=;
 h=From:To:Subject:Date:From;
 b=MDEpGfS8AH/phUhPDdxlruVIcufQOotjUqrxPiW+RN/KOw++3yPDrZbpsCFimHhY+
 J6Jnf62ISjyts3/iGKnjgTZ+WmMNuVd/eWOPcXSwHOjQsRXrslMLHWzR6iVAX40en9
 3F0AKss0iurhEj27oVqu73KHwGJwWGKMmZ7EXreVK5EXF9H0i9ljnhF3+0HpMYFqJs
 ExQO6Mbt1iTH9kjieVyxuL20KKYjUNpTZIyjKU/OzB706OP9u1eXci0uybn5uBIbBl
 zQVKueFpM1NQ0vZ8vetZ+/uU8tuh2vulJQ02eYzn1McxROjRg1SR/wmItw91qUBxEO
 f7A55ssiG1UuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=MDEpGfS8
Subject: [Buildroot] [PATCH 1/2] package/ell: bump to version 0.69
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

Changelog:
https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog?h=0.69

Needed for bump of iwd to 3.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index 1bf764b621..4f67cbae21 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
-sha256  ddcbf381d758f61a02954bf5d2907c8900462abb7b2dcf45589874978bc10125  ell-0.68.tar.xz
+sha256  6cfc0888edc94de9f0623798609587b2cc11b92b892945f317e8d199afe7b12e  ell-0.69.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index 4fe5fa7c56..6d4e8a5ae7 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.68
+ELL_VERSION = 0.69
 ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
 ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
