Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B499FD0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84D214103A;
	Wed,  7 Jan 2026 17:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MNe1KiLifCiG; Wed,  7 Jan 2026 17:54:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91B874103B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808497;
	bh=H4yRfrscb2T6PXXlTEoxF7b9f7XeVOfdn5JBvmN+9GY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jpLohb/MRer98GOdVVZM7jm6aEfJGNjN0v/IMVpkgIb8dykmDIvccrw4BZoWWDyMC
	 EmU3iOGahDdPeUwYF+ITgZd+2QzK0eDkVda13OPb1pihO4/UFzy44POdKB/G6t/6qz
	 fQF4tTKh245Rv9ziTHvEnypuGdL8Ll0LHCB5eSbxsmzQrNGC2K9nDXncT/r60dF0/o
	 QLhXTgMlSj7bjvfwD4csJCHF1JymxdzXrwe6Nh3r7Pz+cLY+n3RTdlXSeQMiZxv+zW
	 yZqUZg58bz1/U+ZfER5/XQ7kS4acBJ6wu0K0nTEZQcTbu+LluzfYaXyOBYDC9UyEDB
	 FUS162bo7V70A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91B874103B;
	Wed,  7 Jan 2026 17:54:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6119E9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3FD541025
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:54:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qWLAz-4VR37n for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:54:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A8C374102E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8C374102E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8C374102E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:54:53 +0000 (UTC)
Received: from postman.. (unknown [IPv6:2a01:e0a:2af:22b0:1db5:e71:2517:bbf7])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C23F413F8B9;
 Wed,  7 Jan 2026 18:54:49 +0100 (CET)
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Wed,  7 Jan 2026 18:54:45 +0100
Message-ID: <20260107175446.2470125-2-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107175446.2470125-1-vjardin@free.fr>
References: <20260107175446.2470125-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767808492;
 bh=0QvgY5U8hyQi0mwT6CwO7LirCI7PocWQEJGKrIW47Jk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fT5rBwdd/HJ1D351FHMBxDVljzFrtgQcja7okyBOW4PHxInZz2s31T13tgbeHw9he
 mG9KwL8CnvoQD96GuYlNFz5a8t7WJa2mbgGTMXa5HRRoawuFP0+xH55+mm5ePuvFVe
 dZXXbM+hy0IhWFk/emo0ewft6ZNGNOGSD5kwVt2ZDF+rzTOwzO7xpTvUP6e+F56x0s
 ikiYAx+d0HWH0IBJS4uVQXEgzqFn9b0ZOrTimwBhj/0VW9l46o5SnYxjxH1QEkymr3
 CO4Mgu4KYfNCtEv4AfzU+8lUb5BQ3+0cNJhcQCI3GJU2kxu9yfOGDqu1jBojfqFCnp
 G8b1O1UKNIdCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fT5rBwdd
Subject: [Buildroot] [PATCH v1 1/2] package/python-libyang: new package
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Python CFFI bindings for the libyang YANG library. This package
provides the 'libyang' Python module used by higher-level tooling
such as python-sysrepo.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 DEVELOPERS                                 |  2 ++
 package/Config.in                          |  2 ++
 package/python-libyang/Config.in           | 23 ++++++++++++++++++++++
 package/python-libyang/python-libyang.hash |  5 +++++
 package/python-libyang/python-libyang.mk   | 21 ++++++++++++++++++++
 5 files changed, 53 insertions(+)
 create mode 100644 package/python-libyang/Config.in
 create mode 100644 package/python-libyang/python-libyang.hash
 create mode 100644 package/python-libyang/python-libyang.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f982e3123a..5585e8b353 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3359,6 +3359,8 @@ F:	package/bfscripts/
 F:	package/dpdk/
 F:	package/libecoli/
 F:	package/libyang-cpp/
+F:	package/python-libyang/
+F:	package/python-sysrepo/
 F:	package/sysrepo-cpp/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index def3db0e50..19d32c16ea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1205,6 +1205,7 @@ menu "External python modules"
 	source "package/python-libconfig/Config.in"
 	source "package/python-libevdev/Config.in"
 	source "package/python-libusb1/Config.in"
+	source "package/python-libyang/Config.in"
 	source "package/python-lmdb/Config.in"
 	source "package/python-lockfile/Config.in"
 	source "package/python-log-rate-limit/Config.in"
@@ -1434,6 +1435,7 @@ menu "External python modules"
 	source "package/python-stack-data/Config.in"
 	source "package/python-starlette/Config.in"
 	source "package/python-sympy/Config.in"
+	source "package/python-sysrepo/Config.in"
 	source "package/python-systemd/Config.in"
 	source "package/python-tabledata/Config.in"
 	source "package/python-tcolorpy/Config.in"
diff --git a/package/python-libyang/Config.in b/package/python-libyang/Config.in
new file mode 100644
index 0000000000..793bf7e3c5
--- /dev/null
+++ b/package/python-libyang/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_PYTHON_LIBYANG
+	bool "python-libyang"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_LIBYANG
+	# Python3 doesn't work with uClibc and kernel headers < 5.1
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
+	select BR2_PACKAGE_PYTHON_CFFI
+	help
+	  Python CFFI bindings for the libyang YANG library.
+
+	  This package provides the 'libyang' Python module, used by
+	  higher-level tooling such as python-sysrepo.
+
+	  https://github.com/CESNET/libyang-python
+
+comment "python-libyang needs python3, uClibc needs kernel headers >= 5.1"
+	depends on !BR2_PACKAGE_PYTHON3 || \
+		(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1)
+
+comment "python-libyang needs libyang"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
+	depends on !BR2_PACKAGE_LIBYANG
diff --git a/package/python-libyang/python-libyang.hash b/package/python-libyang/python-libyang.hash
new file mode 100644
index 0000000000..077d97cdd8
--- /dev/null
+++ b/package/python-libyang/python-libyang.hash
@@ -0,0 +1,5 @@
+# From https://pypi.org/pypi/libyang/3.3.0/json
+sha256  97da2c908a8a3607ac834f2acec224ea53a4b9e9770c13e5598513641decf637  libyang-3.3.0.tar.gz
+
+# Locally computed
+sha256  c8d554f918d32b1467f35829e1cfb753764dd683c6edcecc877a4d7e9f05b2a7  LICENSE
diff --git a/package/python-libyang/python-libyang.mk b/package/python-libyang/python-libyang.mk
new file mode 100644
index 0000000000..2e4d1f3b90
--- /dev/null
+++ b/package/python-libyang/python-libyang.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# python-libyang
+#
+################################################################################
+
+PYTHON_LIBYANG_VERSION = 3.3.0
+PYTHON_LIBYANG_SOURCE = libyang-$(PYTHON_LIBYANG_VERSION).tar.gz
+PYTHON_LIBYANG_SITE = https://files.pythonhosted.org/packages/source/l/libyang
+
+PYTHON_LIBYANG_LICENSE = MIT
+PYTHON_LIBYANG_LICENSE_FILES = LICENSE
+
+# pyproject.toml (PEP517)
+PYTHON_LIBYANG_SETUP_TYPE = pep517
+
+PYTHON_LIBYANG_DEPENDENCIES = \
+	libyang \
+	host-python-cffi
+
+$(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
