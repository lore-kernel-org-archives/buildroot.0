Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FCAF55101
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 16:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5138384143;
	Sat,  7 Mar 2026 16:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Jd4FBxdoTCe; Sat,  7 Mar 2026 16:45:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 521DE8413C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772901948;
	bh=rkJ7yL2sbIoOkGaeHzeqQF3ATWlo6f4cG/GsdRWzZJ0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QpgEVhsI/fuMwNz0ynf5j/Th9qO3mUkTWD8Pd3AaB4DOfzcLoWdIxluBUKZ5/LU70
	 dTR6lBa1szdadsYDEObGt6Wvg+rVR5MVA4RM9ppxVQenf3QXTrGxhAxWqZjaVVE8Jp
	 B3X3WZy4oVRsY9Y9TXNofYmXf3W88C10oMk63z3AklkbVl4usgYmIQ1xHys6jIJk1i
	 TskF1M86jjqKzDj8Mv2k3ZycU2ENjEbwVrC83ZCgPuaisyrstOfVvWEX3oA9zx0ELV
	 6k6cqN74ORmxAjK60kzoT0ty7Gc/r6N3my/PwAEby81mP/gTv0e2rnHkOb2CKj3fyJ
	 1VCqZu9IDqJyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 521DE8413C;
	Sat,  7 Mar 2026 16:45:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ED636223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 16:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFA3C41ABD
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 16:45:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BU8_HaBb2f8 for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 16:45:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D8B45419D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8B45419D9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8B45419D9
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 16:45:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DE82EA4C3225;
 Sat,  7 Mar 2026 17:45:43 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49466)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vyumd-000000002xY-2Iwr;
 Sat, 07 Mar 2026 16:45:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  7 Mar 2026 17:45:42 +0100
Message-ID: <20260307164543.1076496-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772901943;
 bh=ORSZ5a0U4rypqlV3BS4u0QE9JoNZnpM5u1gcdzfYwkA=;
 h=From:To:Cc:Subject:Date:From;
 b=IERIFuEoBHOmkzGSoFshmJZaO403NEj4wz/MyDHQxMQAlQGvxl6YPUjifvuxiGSOv
 kQTeZ4eQp1Cj9a7Cyplf/R6r4h0gH/x2IpBDyNauKYw+JJpS7grvx7cX0s1deIW8O8
 OCG2GMOdUV0d5HeMvURJmk9bX7i1A1dHSxo04tgV383K9CmMLRylssqIiujLNtvOYJ
 7wYYx9EtRXrowdah7gyEHvUfELkxqCZbB7nrEtB43zpnsnIXfhFfr9nYg4pgOEwbzD
 RshYDmX7AdhJ5J9lcdWBeZlV4b8qnw2TKqRHIXoME04qyVa8K2YWn2LDByN3EL1hlv
 z+yo2k69tHEkg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=IERIFuEo
Subject: [Buildroot] [PATCH 1/2] package/minizip-zlib: bump version to 1.3.2
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

https://github.com/madler/zlib/releases/tag/v1.3.2
https://github.com/madler/zlib/blob/v1.3.2/ChangeLog

Added upstream patch which adds ints.h as installed header to prevent
build errors which would be caused by this bump.

Updated license hash due to copyright year bumps:
https://github.com/madler/zlib/commit/570720b0c24f9686c33f35a1b3165c1f568b96be
https://github.com/madler/zlib/commit/9e35567064baded660f61732b247ef5abc809014

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ncy-to-ints.h-in-minizip-Makefile.am.patch | 26 +++++++++++++++++++
 package/minizip-zlib/minizip-zlib.hash        |  4 +--
 package/minizip-zlib/minizip-zlib.mk          |  4 +--
 3 files changed, 30 insertions(+), 4 deletions(-)
 create mode 100644 package/minizip-zlib/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch

diff --git a/package/minizip-zlib/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch b/package/minizip-zlib/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch
new file mode 100644
index 0000000000..98e16251d8
--- /dev/null
+++ b/package/minizip-zlib/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch
@@ -0,0 +1,26 @@
+From cb14dc9ade3759352417a300e6c2ed73268f1d97 Mon Sep 17 00:00:00 2001
+From: Rui Chen <rui@chenrui.dev>
+Date: Tue, 17 Feb 2026 10:48:39 -0500
+Subject: [PATCH] Add dependency to ints.h in minizip Makefile.am.
+
+So that ints.h is part of the installation.
+
+Upstream: https://github.com/madler/zlib/commit/cb14dc9ade3759352417a300e6c2ed73268f1d97
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ contrib/minizip/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/contrib/minizip/Makefile.am b/contrib/minizip/Makefile.am
+index d343011eb..b7dea4f7e 100644
+--- a/contrib/minizip/Makefile.am
++++ b/contrib/minizip/Makefile.am
+@@ -27,6 +27,7 @@ libminizip_la_LDFLAGS = $(AM_LDFLAGS) -version-info 1:0:0 -lz
+ minizip_includedir = $(includedir)/minizip
+ minizip_include_HEADERS = \
+ 	crypt.h \
++	ints.h \
+ 	ioapi.h \
+ 	mztools.h \
+ 	unzip.h \
diff --git a/package/minizip-zlib/minizip-zlib.hash b/package/minizip-zlib/minizip-zlib.hash
index cbd9313870..bc8b046426 100644
--- a/package/minizip-zlib/minizip-zlib.hash
+++ b/package/minizip-zlib/minizip-zlib.hash
@@ -1,4 +1,4 @@
 # From http://www.zlib.net/
-sha256  38ef96b8dfe510d42707d9c781877914792541133e1870841463bfa73f883e32  zlib-1.3.1.tar.xz
+sha256  d7a0654783a4da529d1bb793b7ad9c3318020af77667bcae35f95d0e42a792f3  zlib-1.3.2.tar.xz
 # License files, locally calculated
-sha256  845efc77857d485d91fb3e0b884aaa929368c717ae8186b66fe1ed2495753243  LICENSE
+sha256  e32ff4e00d9d94930537635291da39e7e612703334bf6fde8c7f1686fe8a45a2  LICENSE
diff --git a/package/minizip-zlib/minizip-zlib.mk b/package/minizip-zlib/minizip-zlib.mk
index 6d4a2d2e20..32af7ff0eb 100644
--- a/package/minizip-zlib/minizip-zlib.mk
+++ b/package/minizip-zlib/minizip-zlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-MINIZIP_ZLIB_VERSION = 1.3.1
+MINIZIP_ZLIB_VERSION = 1.3.2
 MINIZIP_ZLIB_SOURCE = zlib-$(MINIZIP_ZLIB_VERSION).tar.xz
-MINIZIP_ZLIB_SITE = http://www.zlib.net
+MINIZIP_ZLIB_SITE = https://www.zlib.net
 MINIZIP_ZLIB_LICENSE = Zlib
 MINIZIP_ZLIB_LICENSE_FILES = LICENSE
 MINIZIP_ZLIB_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
