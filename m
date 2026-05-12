Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A20ECD4851
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 14:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1818760DB8;
	Tue, 12 May 2026 14:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rF-fLZew3nq9; Tue, 12 May 2026 14:52:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 352CD60DBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778597522;
	bh=2Xz3W8sEByRbBF5t8hOVxWFFB1vRm2/OlhFnsgUln+w=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OBYVSdLpp9qek5D4QslDYElzl98VkdeBYfJfyYM4qftMlbUF12oNu7dR7pFriH2Qb
	 k+GYKr3Slded9AkQ9/9BTD1s35usPhhZEy39SN3UosgAnl5oeajsDl9aHHfcyjhtEK
	 TiYc/m1PkPBQnmRh7FrXAyRAjTxojbNb/AjsVpjn3PtYDxmdy8Mw1LcOqi+CfhMTbD
	 mNbKngAT0WcmDzVQAn7LkMpY3LwaErw29QhGJpCbtdT3BzMMDya2umHZuXol2y2lrn
	 Jsopzeox42sugEDihNu27RHCWyD7xyKDxcbSNFQTuqPDafXJb+QaWD3libx9KoxeBx
	 LS7UzizQt2PLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 352CD60DBB;
	Tue, 12 May 2026 14:52:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 389F8223
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A4238226A
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:52:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f8RBDqz-A61t for <buildroot@buildroot.org>;
 Tue, 12 May 2026 14:52:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DD031821FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD031821FE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD031821FE
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:51:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b10b.dip0.t-ipconnect.de [84.161.177.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6C0BAA4C00C3;
 Tue, 12 May 2026 16:51:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45106)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMoSj-000000004ON-03bt;
 Tue, 12 May 2026 14:51:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 12 May 2026 16:51:49 +0200
Message-ID: <20260512145156.320992-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778597517;
 bh=RR/CrsQ4MEaEkTuuieP7649lzQ0NuZT7quWwFzZvKeA=;
 h=From:To:Cc:Subject:Date:From;
 b=u7UveLjD8yTDC4ZeTQpD0da97E8zcKcON2d7qCzK6fljRxaC+S5QVd2dIXdd3pSgL
 ZxBZeMIK3dNgNPisb5fzu10t+PBprzLPAb4Ce40N0F1XY/TQMKrg5EJYqitf0zlGjF
 BApZ//o19lfVepKOVh4dotRGPjPtr+frrv4EN4qH2py+1HNM6GeADiNXdJV8t9Lvi4
 vil7QZRqHJwFwajd1itmbW0GOvlOGwSOOFN8sxwAa0J35nGauOjnerzGrEErqrfqN6
 5DLmqAesHBYdc5iVba3NuRVWT6iMSHrHuLBYAARAfv2qHnqCWqHeSu9+i5LwuJ37fL
 VsjRuQAhdXkMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=u7UveLjD
Subject: [Buildroot] [PATCH/next 1/8] package/libselinux: bump version to
 3.10
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

https://github.com/SELinuxProject/selinux/releases/tag/3.10

Rebased patch 0001 due to inclusion of patch 0003 in this release.
Removed patch 0003 which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...T-and-rely-on-the-installed-file-nam.patch |  4 +-
 ...akefile-build-python-module-without-.patch | 51 -------------------
 package/libselinux/libselinux.hash            |  2 +-
 package/libselinux/libselinux.mk              |  2 +-
 4 files changed, 5 insertions(+), 54 deletions(-)
 delete mode 100644 package/libselinux/0003-libselinux-src-Makefile-build-python-module-without-.patch

diff --git a/package/libselinux/0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch b/package/libselinux/0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
index 0d6db785ec..c2b6480af1 100644
--- a/package/libselinux/0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
+++ b/package/libselinux/0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
@@ -20,6 +20,8 @@ Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 [Refreshed for 3.5]
 Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+[Refreshed for 3.10]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  src/Makefile | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
@@ -38,7 +40,7 @@ index 190016e2af34..7ee22fd35da3 100644
  RUBYINSTALL ?= $(shell $(RUBY) -e 'puts RbConfig::CONFIG["vendorarchdir"]')
 @@ -195,7 +194,7 @@ install: all
  install-pywrap: pywrap
- 	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
+ 	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --no-build-isolation --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
  	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
 -	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux$(PYCEXT) $(DESTDIR)$(PYTHONLIBDIR)/_selinux$(PYCEXT)
 +	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux*.so $(DESTDIR)$(PYTHONLIBDIR)/
diff --git a/package/libselinux/0003-libselinux-src-Makefile-build-python-module-without-.patch b/package/libselinux/0003-libselinux-src-Makefile-build-python-module-without-.patch
deleted file mode 100644
index 7f4a76515b..0000000000
--- a/package/libselinux/0003-libselinux-src-Makefile-build-python-module-without-.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 8cfe4535f23a7768ee5efa615d11563a8404777c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
-Date: Mon, 27 Oct 2025 22:40:59 +0100
-Subject: [PATCH] libselinux/src/Makefile: build python module without
- isolation
-
-The "pip install" logic in libselinux/src/Makefile tries to get
-setuptools from the network, which is not correct as during the
-build/installation, there shouldn't be any network access, or
-downloading of arbitrary resources from the network.
-
-This causes build issues in Debian:
-
-  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1121121
-
-And in Buildroot:
-
-  https://autobuild.buildroot.net/results/0e9/0e9de0c0d8b6ec57eea9f8834f02076b296ba4f1/build-end.log
-
-To fix this, we use the --no-build-isolation pip install argument so
-that pip install is allowed to use the system-provided setuptools,
-instead of wanting to download this one.
-
-This patch is derived from
-https://sources.debian.org/src/libselinux/3.9-4/debian/patches/Build-python-module-without-isolation-Closes-1119155.patch,
-with the change that --no-build-isolation is passed unconditionally,
-regardless of whether $(DESTDIR) is empty or not.
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: https://lore.kernel.org/selinux/20251227143911.1630813-1-thomas.petazzoni@bootlin.com/
----
- libselinux/src/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libselinux/src/Makefile b/libselinux/src/Makefile
-index e9141bb9..9bc10606 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -197,7 +197,7 @@ ifneq ($(DISABLE_SHARED),y)
- endif
- 
- install-pywrap: pywrap
--	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
-+	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --no-build-isolation --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
- 	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
- 	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux*.so $(DESTDIR)$(PYTHONLIBDIR)/
- 
--- 
-2.52.0
-
diff --git a/package/libselinux/libselinux.hash b/package/libselinux/libselinux.hash
index 2f897e1287..f346297894 100644
--- a/package/libselinux/libselinux.hash
+++ b/package/libselinux/libselinux.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  e7ee2c01dba64a0c35c9d7c9c0e06209d8186b325b0638a0d83f915cc3c101e8  libselinux-3.9.tar.gz
+sha256  1ef216c5b56fb7e0a51cd2909787a175a17ee391e0467894807873539ebe766b  libselinux-3.10.tar.gz
 
 # Hash for license file
 sha256  86657b4c0fe868d7cbd977cb04c63b6c667e08fa51595a7bc846ad4bed8fc364  LICENSE
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index a77ee7659a..bcd130ac72 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSELINUX_VERSION = 3.9
+LIBSELINUX_VERSION = 3.10
 LIBSELINUX_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSELINUX_VERSION)
 LIBSELINUX_LICENSE = Public Domain
 LIBSELINUX_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
