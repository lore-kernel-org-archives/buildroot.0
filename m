Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0FDFC9EF5
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 11:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3689742038;
	Sat,  7 Mar 2026 11:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gCK9XTvk49y7; Sat,  7 Mar 2026 11:21:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 468834209C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772882489;
	bh=nbywzfNFp2339hciHdAT55oTsjQrZhKoWgJsOVQNcTI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Po9hwv4Rwb9Ab3vXOTgeHWGOwhtXLTMJzsRdg89MU0OzTQ2QodBAA8McUhfAoaDFe
	 AW+QhFd3FmwWd80ThHGTYnuIsqIS5DEbmyLoAN3XIDLbUj6jYJ3SaokQqpk7a6cses
	 6OLoHS8riRdHRSi4Wvh4xbmwN8Q9RoBqDsG2O6jDou3cRdvujS7CLFF8sLU6lW4qjE
	 zaNUXvmN5qxrjLOKglcBjueRczPT0gSpgITsnePGkHZUi7HOZ6nfdGAc5oUGd9W+AB
	 mJVnAH7lX1S4w3eEdcHIjQKz/8lkwD0vUR1yFGoQ8dINmG04JAt+KlIpYnPrKV9Bnb
	 wfEpL7bxKaoCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 468834209C;
	Sat,  7 Mar 2026 11:21:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A907725B
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 11:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AFF44209C
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 11:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KsBEZOPVIndW for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 11:21:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8CBF842038
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CBF842038
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8CBF842038
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 11:21:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E48AFA4C38EF;
 Sat,  7 Mar 2026 12:20:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51228)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vypiN-000000004DY-2Lai;
 Sat, 07 Mar 2026 11:20:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Sat,  7 Mar 2026 12:20:56 +0100
Message-ID: <20260307112057.31154-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260307112057.31154-1-bernd@kuhls.net>
References: <20260307112057.31154-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772882459;
 bh=P3etXEVK2HxTawq26KY8nG6LuqjxyjxgvJjdeAJ8JYw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=eXX3OQz+SKkZcaGe9OP/H03EWBevJF+X0/Hifrqx0OdzSaZg0UunLKXXs+UUOYU9K
 XVEH/ODzoJV/gRq56SSD8vJ1BwOsFi5za+tMXleQf3zHnnA0cnWDlBaVeUc3bfq6br
 63XeBT6bp9JeB4lGgBmWmBShUAVTnEd7maL/YZU7WbzmFwavNQuf67GgRfLVpxxoyr
 4dPOBEK8bfOX/YznSdSvj/fl3WALZdrDMZopy5WqXLohI51OgZQyzR5YoApFVKpRk0
 GUT2e7cox4ZHoddDLMV6k0Vwblv06asnBVb1ZtIYYeG7Gb9p5EtmQz7PJumVUkJE0O
 lfg537pXmCnCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=eXX3OQz+
Subject: [Buildroot] [PATCH 3/4] package/sphinxbase: remove package
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

The upstream github repo https://github.com/cmusphinx/sphinxbase
"was archived by the owner on Jun 9, 2022."

Remove an unmaintained package which also causes build errors due to
changes to a released tarball.

Jonathan Ben-Avraham answered by email, which maybe is still sitting in
a queue on the buildroot mailinglist, on Feb, 21st, 2026:
"I was the package submitter. Please remove the package."

Fixes:
https://autobuild.buildroot.net/results/b45/b45eebbcc86f33741053bb6f9b89e16c7041c470/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Jonathan Ben Avraham <yba@tkos.co.il>
---
 Config.in.legacy                   |  7 +++++++
 DEVELOPERS                         |  1 -
 package/Config.in                  |  1 -
 package/sphinxbase/Config.in       | 13 -------------
 package/sphinxbase/sphinxbase.hash |  3 ---
 package/sphinxbase/sphinxbase.mk   | 19 -------------------
 6 files changed, 7 insertions(+), 37 deletions(-)
 delete mode 100644 package/sphinxbase/Config.in
 delete mode 100644 package/sphinxbase/sphinxbase.hash
 delete mode 100644 package/sphinxbase/sphinxbase.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 17eca307e9..2950a3153a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_PACKAGE_SPHINXBASE
+	bool "sphinxbase removed"
+	select BR2_LEGACY
+	help
+	  sphinxbase was no longer maintained upstream, so it has
+	  been dropped.
+
 config BR2_PACKAGE_OPENSWAN
 	bool "openswan removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 835be1f6a3..f0c4cd24c4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1732,7 +1732,6 @@ F:	package/dawgdic/
 F:	package/libphidget/
 F:	package/phidgetwebservice/
 F:	package/rapidxml/
-F:	package/sphinxbase/
 
 N:	Joris Offouga <offougajoris@gmail.com>
 F:	package/python-colorlog/
diff --git a/package/Config.in b/package/Config.in
index 4ad7c1e22b..9c64ea5b9f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2269,7 +2269,6 @@ endif
 	source "package/ruy/Config.in"
 	source "package/shapelib/Config.in"
 	source "package/skalibs/Config.in"
-	source "package/sphinxbase/Config.in"
 	source "package/startup-notification/Config.in"
 	source "package/tbb/Config.in"
 	source "package/tensorflow-lite/Config.in"
diff --git a/package/sphinxbase/Config.in b/package/sphinxbase/Config.in
deleted file mode 100644
index 00a19f6178..0000000000
--- a/package/sphinxbase/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_SPHINXBASE
-	bool "sphinxbase"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	help
-	  CMUSphinx toolkit is a leading speech recognition toolkit
-	  with various tools used to build speech applications. CMU
-	  Sphinx toolkit has a number of packages for different tasks
-	  and applications.
-
-	  http://cmusphinx.sourceforge.net/
-
-comment "sphinxbase needs a toolchain with threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/sphinxbase/sphinxbase.hash b/package/sphinxbase/sphinxbase.hash
deleted file mode 100644
index 433fba685d..0000000000
--- a/package/sphinxbase/sphinxbase.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  06971dbe272d2f73bde0ef7b3538c0c8f8ea885cb171fd6b17a5975bced66e64  sphinxbase-5prealpha.tar.gz
-sha256  26f12e0152a5d58c69904e439761a1b2fbb9267b5f04674dbf93667e3e6dd043  src/libsphinxbase/util/bio.c
diff --git a/package/sphinxbase/sphinxbase.mk b/package/sphinxbase/sphinxbase.mk
deleted file mode 100644
index 86f9089b48..0000000000
--- a/package/sphinxbase/sphinxbase.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# sphinxbase
-#
-################################################################################
-
-SPHINXBASE_VERSION = 5prealpha
-SPHINXBASE_SITE = http://downloads.sourceforge.net/project/cmusphinx/sphinxbase/5prealpha
-SPHINXBASE_LICENSE = BSD-2-Clause
-# Note http://sourceforge.net/p/cmusphinx/bugs/441/ "LICENSE file missing in"
-# 5prealpha tarballs". The license is contained in the copyright notice at the
-# top of each source file. For example:
-SPHINXBASE_LICENSE_FILES = src/libsphinxbase/util/bio.c
-
-SPHINXBASE_DEPENDENCIES = host-bison
-
-SPHINXBASE_CONF_OPTS = --without-python --without-lapack
-
-$(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
