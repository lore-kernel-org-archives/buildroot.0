Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D8DCAC595
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 18:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 970BF614B1;
	Tue, 17 Sep 2024 18:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iFwNHyLZ1H4g; Tue, 17 Sep 2024 18:22:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE92260E3C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE92260E3C;
	Tue, 17 Sep 2024 18:22:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 68D0A1BF310
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 558A180D88
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C2HmmqTUPPf8 for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 18:22:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4512B80C84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4512B80C84
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4512B80C84
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 18:22:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0e02.dip0.t-ipconnect.de [91.58.14.2])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9E875A4C1FCF;
 Tue, 17 Sep 2024 20:21:53 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52062)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sqcpl-000000000nL-2vu1;
 Tue, 17 Sep 2024 18:21:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 20:21:52 +0200
Message-Id: <20240917182153.3009755-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1726597313;
 bh=KOsepbAkEFA+uCWi+YRZDYQ6KkJs1n/dfIhnC6Uin4w=;
 h=From:To:Cc:Subject:Date:From;
 b=bsPYgjJC+Wm19pn5NJHHMwHK1S6CsV/VpvugTuDeF0/2Am+Ln88vn6yEQsNcq9xAj
 E9u38hlXJ/LOhU6XuQNF5zD+/iL12mXWOSvPB0tuBYY/O56f6KbIzOUVQCT2wzUoYR
 z345fL09meEgPlo+gLcsMCZSMco0YRUC/Q2It/FsKbK7fI2y8ZTK+n4JQ5EfmA1p+V
 xuWlnHknAOl0dghUn5DjoQCLiCxQUy3mWjuUjckkGXjVpe75avRFzNIM/6yT04Yoab
 3FV/oxNgT5XZRSWYQS5I8vuF3dJU5o86qQugIwvv+BLOOIR+FB0ZlDWb9QgElNgk6c
 k/T+D1BRkbeSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=bsPYgjJC
Subject: [Buildroot] [PATCH 1/2] package/expat: security bump version to
 2.6.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/libexpat/libexpat/blob/R_2_6_3/expat/Changes

Fixes CVE-2024-45490, CVE-2024-45491 & CVE-2024-45492.

Follow upstream switch of project repository to github:
https://sourceforge.net/p/expat/news/2022/01/project-moved-to-github/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/expat/Config.in  | 2 +-
 package/expat/expat.hash | 6 +-----
 package/expat/expat.mk   | 4 ++--
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/expat/Config.in b/package/expat/Config.in
index 758fb7d516..c227912b03 100644
--- a/package/expat/Config.in
+++ b/package/expat/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_EXPAT
 	help
 	  The Expat XML Parser.
 
-	  http://expat.sourceforge.net
+	  https://libexpat.github.io/
diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 63890b54df..e40b250ba0 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,3 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.6.2/
-md5  0cb75c8feb842c0794ba89666b762a2d  expat-2.6.1.tar.xz
-sha1  d9e5f953dcacda3c9e69b4886382c3d8847b81bd  expat-2.6.1.tar.xz
-
 # Locally calculated
-sha256  ee14b4c5d8908b1bec37ad937607eab183d4d9806a08adee472c3c3121d27364  expat-2.6.2.tar.xz
+sha256  274db254a6979bde5aad404763a704956940e465843f2a9bd9ed7af22e2c0efc  expat-2.6.3.tar.xz
 sha256  122f2c27000472a201d337b9b31f7eb2b52d091b02857061a8880371612d9534  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index c6b7fc8b44..f5c6175f28 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.6.2
-EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
+EXPAT_VERSION = 2.6.3
+EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
 EXPAT_LICENSE = MIT
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
