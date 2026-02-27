Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA9CFEFB77
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 18:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0509260B8C;
	Fri, 27 Feb 2026 18:51:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wf7GRquhp4x2; Fri, 27 Feb 2026 18:51:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 095BC60B83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772218299;
	bh=hxTGDfSM98zWTVKlXMRbysymL0Fbz90sHQx66sXKo80=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UD1XKJwHDqkQke0MpFrrDysP5NZlQzzXGrj/skFeCOqwlPNbjNE+ByHba6dKgSxY+
	 DeBVW5D8NHhZ5XBNlSc7tfhsnWFoxDHMWCLEguBDZM7FJn+5iY65s+OiDSDuUYDpRi
	 jXMADVCJaP8BjVtVMEHrTgCVN9JseMJU8AzcpFtb2xfjriy74GbE/RojpdZx1zuFop
	 gL1ns8z/H+2GcY1wZPNPccQB1PsbIGlBesQAUcA7/OAtdbjoYnGoTS0OfQMeBBATJD
	 64EN40+TYl1gai7BVqoaP631cA8YCeV7cOK8rRE9AQskpBv6F+l8gVfY8ffKNIzjTL
	 SLH+djJDvMbTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 095BC60B83;
	Fri, 27 Feb 2026 18:51:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AC9BA1F3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 18:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA0CD40CD1
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 18:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0rbUAR90vMT0 for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 18:51:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F50C40CBF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F50C40CBF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F50C40CBF
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 18:51:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 87A25A4C316B;
 Fri, 27 Feb 2026 19:51:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45260)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vw2w2-0000000073s-1lys;
 Fri, 27 Feb 2026 18:51:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Fri, 27 Feb 2026 19:51:30 +0100
Message-ID: <20260227185130.1790878-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772218294;
 bh=jdNMATiSUwNirvjT4acq1M7jwJNJkbypAfGYcU/JLt0=;
 h=From:To:Cc:Subject:Date:From;
 b=pW2QFo6x03DC5kxzxugprmMmmGuNu9fghzvmu0DGJtNMmUwle7HSbn1ha4VXQO2nT
 Lyj9CIzpMcKyE7BXdotPC0CQ2uQPEJhxdRyALe4UgDdJ0pb5VkBn9HMrdYU+WOuGJt
 FZnwQEfPahcDcs7BXGQD8uXDZUYmIvcu/lmOkJsEMX6aAbvN47W3aKYZ5ZVtmlJRfh
 heHghYfz8wAHjzXXgBr+aMBNLwDL1/2RKCIkdbMK5NcZg65uyGDYcXGLSEZQwZG9iz
 SDBvNRWAY/mJHO5o4EDY+nQHwXZYggGTXRKFBleCVgPTmH4oeP1k1Gz03IAr0B0suF
 nqx7ao2QaFBoQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=pW2QFo6x
Subject: [Buildroot] [PATCH 1/1] package/sphinxbase: remove package
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
index a2a7b06a6d..1c4fb38390 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_SPHINXBASE
+	bool "sphinxbase removed"
+	select BR2_LEGACY
+	help
+	  sphinxbase was no longer maintained upstream, so it has
+	  been dropped.
+
 config BR2_PACKAGE_QEMU_TARGET_CRIS
 	bool "qemu cris support has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 9e983ae113..f1833bf42e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1730,7 +1730,6 @@ F:	package/dawgdic/
 F:	package/libphidget/
 F:	package/phidgetwebservice/
 F:	package/rapidxml/
-F:	package/sphinxbase/
 
 N:	Joris Offouga <offougajoris@gmail.com>
 F:	package/python-colorlog/
diff --git a/package/Config.in b/package/Config.in
index 371a1c33e1..fac47c3388 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2270,7 +2270,6 @@ endif
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
