Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EB3EA3F09
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 07:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EFA34036A;
	Tue, 10 Feb 2026 07:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D9QraiSvVp4J; Tue, 10 Feb 2026 07:01:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CE1C40372
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770706898;
	bh=i/RBxDtQjqThrj4Fy20N4hSAlzFVMM5SZpQP/BYZkjE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h/qofHA/VS4jIQLvrMK0pigZ3FzRZhhda0VjECsh0puQtCWNleedNgTg72Ok/1a0V
	 mThLIbW2Igv2xoiM5OwlABrmH+6Qgm9HQc5r/L9xYaezOpTIypyMdRyuCD6xSM/mY+
	 iqbcaZRbAcl1cryRr/Nq5v1/QviGKsD6ZnIQzH8rkS7o9w4pmW24YJz+5Y0xAoiVVk
	 zqDA889HEd8TIhZ6t8KYVITAl2dIPLtnEKtt0lngllG+XqbT3q+z4JFnQrPQDcb/Ai
	 MywlAjv0QacSb6jLoFFFImIoYdSJznIBUUj14jVNZMZI8sGeTqv19SqHNDuXe7Q3EC
	 TyNmT6zYo2SxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CE1C40372;
	Tue, 10 Feb 2026 07:01:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E397F2
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 07:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BF5C402C2
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 07:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZlV7wTLE_8D3 for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 07:01:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D7CB9402BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7CB9402BB
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7CB9402BB
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 07:01:35 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 578475165; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 10 Feb 2026 07:01:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vphkZ-00000002AUu-2E4Q;
 Tue, 10 Feb 2026 08:01:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Feb 2026 08:01:27 +0100
Message-ID: <20260210070129.516990-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ReZR3o4aNgWCcEFVL0NKermVEBx5toUGLUTCUhjn+0w2Gd0YydM3qzwKNMmBRnseUbTgFOGOVxh8dUg8E1kGIlg79XnIxwZh+8uveaBp2ybxqJ/8bQvd+uRRbjjsDaSC4T0oXRdWtGmDbB+K00D+u1c58LJ9oqqNv6xtKW4BisH63PRY4I5mZUqcqrAL2EHSDfgNmjAd82ZDz0WZVbjDkpGMqdfbme0yYctYzqq7r+RJaIPM6uaDaGZiX1zyEV8FNwaOQERwkBz4cRWgv5JGiLzAw5dgawYcToRR2MP/rV2QWRgyxQtm2Cm6JTVACfXazT23xjX6Nkc5BKXkcM5Zwg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=G4BXFw2SSsOpHZemVJ4x7hBHjQqFR8AxiFH6oFRvjKQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=ReZR3o4a
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/libtasn1: security bump to version
 4.21.0
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

Fixes the following security vulnerability:

CVE-2025-13151: Stack-based buffer overflow in asn1_expand_octet_string
function
https://lists.gnu.org/archive/html/help-libtasn1/2026-01/msg00001.html

Release notes:
https://lists.gnu.org/archive/html/help-libtasn1/2026-01/msg00000.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtasn1/libtasn1.hash | 4 ++--
 package/libtasn1/libtasn1.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libtasn1/libtasn1.hash b/package/libtasn1/libtasn1.hash
index b9c9dad131..f099b7bfd6 100644
--- a/package/libtasn1/libtasn1.hash
+++ b/package/libtasn1/libtasn1.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.20.0.tar.gz.sig
-sha256  92e0e3bd4c02d4aeee76036b2ddd83f0c732ba4cda5cb71d583272b23587a76c  libtasn1-4.20.0.tar.gz
+# https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.21.0.tar.gz.sig
+sha256  1d8a444a223cc5464240777346e125de51d8e6abf0b8bac742ac84609167dc87  libtasn1-4.21.0.tar.gz
 # Locally calculated
 sha256  990ef6a87f29a9d3db33698b94ea026a5d0f81bbf9806333d73699a250b7e5d6  README.md
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index 3154e500f1..9a853e2312 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTASN1_VERSION = 4.20.0
+LIBTASN1_VERSION = 4.21.0
 LIBTASN1_SITE = $(BR2_GNU_MIRROR)/libtasn1
 LIBTASN1_DEPENDENCIES = host-bison host-pkgconf
 LIBTASN1_LICENSE = GPL-3.0+ (tests, tools), LGPL-2.1+ (library)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
