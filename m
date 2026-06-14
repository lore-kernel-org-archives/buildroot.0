Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3DACD98C5
	for <buildroot@archiver.kernel.org>; Sun, 14 Jun 2026 15:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D27B983B0A;
	Sun, 14 Jun 2026 15:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3qRY1w8QVhno; Sun, 14 Jun 2026 15:54:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C35683AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781452448;
	bh=n1mV386fEt6ODdr6uMyXpcujGO5Dke/GAyLlgqCi28w=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Wk4IKLHunKUgMxL4tTFZTe7SZttXleFq0YMyks5tHcOuTk72AR/uKwlSe2CydQdER
	 T/OXUiZhS9pc5aCbdtXhQWaicP5UhSQTzOTKd51i/FK/9TZEwYnpv0PaMIVVMH9d5t
	 PEJCcW6zoI2T0lGS92xF6xVMQcx/euBsqJyJrUh+PHbPE3EDyeFMWFIQjZ/igdAz3n
	 FdcdzI8J1XYSwzQX6YiXTyMLAXdrxlJF7HMlpmjWKP0L+x6YuLEyWSgpQ+fSnOC1U2
	 v99jsuTzahFxn1PYf/B4sT3q7SxhpOCvKy7nC+JlJrRrORypR7FfHFgLeLCenGo0kj
	 1MmxN0kxbvGwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C35683AEA;
	Sun, 14 Jun 2026 15:54:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ACFA1DE
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 15:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9319840680
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 15:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id btFF6V6S0PKx for <buildroot@buildroot.org>;
 Sun, 14 Jun 2026 15:54:06 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2DE904039C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DE904039C
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DE904039C
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 15:54:06 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5aa63628d26so2285782e87.0
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 08:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781452444; x=1782057244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gJPS7hDtENVU9YJxWlU90jX1G1+QNvNj4YEld9/1iQw=;
 b=qdbzD2aYykhOAWhKb+p/w0xoeaUivrCbM4qDrr13bX6MAScNaBj7FRJQwGAz16mFx3
 9kinS3ZTY2BOvoQ1Qm6GK/YJ1SzVDB/jsgxpPj6y0UwgNgqaev9t6dZnoNak5/27E8It
 Wpf7t3yIEJv02Rif+UTj2FV8k9+TTZaZGPZAH2w9Q+MF9hsblRN2EM89yNXLdnIybE5a
 qDRFtN3hJZgcze9NbZTz2ZeUCLxA+a8WDd6KuT1cpgSrpJ19j6D+Nq2952eVn5UwksbK
 UZgr4umO+OgS95z0j6XRJdS94W9tgN6whA7riEATALsfsD0eI+FHDb1LD3OWaJEgVOJL
 D72w==
X-Gm-Message-State: AOJu0YwrdkW5z7siV84ORwvawhEPYq0jG0RnSvgVFmamUsExN4brN8qU
 VIJy5Dl32gpr78GG4+Dk8Jhi2/J4iKDCj0X46svaYYEyY/1ai3i0XaAHu12aG9AaKEGm0AYsx5T
 GTOYmXOtyeg==
X-Gm-Gg: Acq92OG606ff+x7odlhJD8PiKEOfYFRlInRBUEpnue9UjG6iEnB4ecOD69rg0AExse0
 4K6ADP7QQULZFeFtZ3yIyjM8kH4t3Uq5XkILSufO9zHVmSydnLbJAUBLgKl5ajajnT7FKBmiy6a
 BHenXkl0hQXRLypqjAjjKWWOlF8wKhk3LNpkpJ+4GyGwEJMEYHQzkkWJw8JZ3Mr6kAS/ec+IPTp
 XVjIUaighlnnXKnDYU211znHrzBy03Bx43lRSMbyHNFzhxvCjdqBCKAkAiKkiNd4sYEd0WOwbT8
 m/DbDgYkcPo7pd/1l/7u0iy8CPCeZzWSWeNGG4sELEuSFOz3sWw63oug3Pa+DwuIkUpbna/nzhw
 Re6izYQONGZ2N3hxyaX35Y3aqYR+5d0ZDvnyLVGHJUkEt0odlBKAm15SZeMSPzCL0688TXiBZe3
 yhur9XSdxk7wWlhh2leys+iASW9ZUStRCwfAubqzOJry759a6UpAPzBQ==
X-Received: by 2002:a05:6512:4846:b0:5ad:abf:1e1c with SMTP id
 2adb3069b0e04-5ad30d99643mr1477655e87.3.1781452443807; 
 Sun, 14 Jun 2026 08:54:03 -0700 (PDT)
Received: from localhost (81-226-112-165-no2360.tbcn.telia.com.
 [81.226.112.165]) by smtp.gmail.com with UTF8SMTPSA id
 2adb3069b0e04-5ad2e1adf09sm2076607e87.58.2026.06.14.08.54.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jun 2026 08:54:02 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Date: Sun, 14 Jun 2026 17:53:28 +0200
Message-ID: <20260614155328.304282-9-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614155328.304282-1-j@j-ernberg.se>
References: <20260614155328.304282-1-j@j-ernberg.se>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1781452444; x=1782057244;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gJPS7hDtENVU9YJxWlU90jX1G1+QNvNj4YEld9/1iQw=;
 b=y798Czitrv+jrQO1RgegmZp0CmNrgFpCxg0BfOwzL8Z8oIS3EvQIw4KMPbHMMT8YD9
 DJQFTRoLZoRugvmVAfYL4wGUQZXQNZ5bfHNifgIM1VjojQ2u7QELnChCNyHl4yxHlwic
 6qmIF4O48ygJDzaxhx1Zld6ll5pyV54SMdzIKKIvlbJEPvOGMZeyQjLanpKhnd2B4VOH
 zNOoXyTSvraI6knCUbqQM/bHVMTvqXnq3geasfaCujc5NrqSBkPZamSIkRNJV3rv9/RB
 uP8rzzO+lMiGuZRaOWYCYtuPgCTPMTKr6j/9qhUsIg7u8UCRVFoQZg06WX21k2Zx17Ij
 1hLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=y798Czit
Subject: [Buildroot] [PATCH v2 8/8] package/python-html5lib: Drop the package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, John Ernberg <j@j-ernberg.se>,
 John Ernberg <john.ernberg@actia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream has not seen any activity since early 2024 [1], and hasn't made a
release since 2020. [2]

The package will no longer build with setuptools >= 82. [3]

Link: https://github.com/html5lib/html5lib-python/commits/master/ [1]
Link: https://github.com/html5lib/html5lib-python/tags [2]
Link: https://autobuild.buildroot.org/results/994ce8ace0b6704404c3b3df4538f38334c16593/ [3]
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: John Ernberg <j@j-ernberg.se>

---

v2:
 - No changes
---
 Config.in.legacy                              |  7 ++++
 package/Config.in                             |  1 -
 ...y-fix-version-parsing-on-Python-3.14.patch | 42 -------------------
 package/python-html5lib/Config.in             |  8 ----
 package/python-html5lib/python-html5lib.hash  |  5 ---
 package/python-html5lib/python-html5lib.mk    | 16 -------
 6 files changed, 7 insertions(+), 72 deletions(-)
 delete mode 100644 package/python-html5lib/0001-setup.py-fix-version-parsing-on-Python-3.14.patch
 delete mode 100644 package/python-html5lib/Config.in
 delete mode 100644 package/python-html5lib/python-html5lib.hash
 delete mode 100644 package/python-html5lib/python-html5lib.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 8992315454..8134e8ac6a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.08"
 
+config BR2_PACKAGE_PYTHON_HTML5LIB
+	bool "python-html5lib removed"
+	select BR2_LEGACY
+	help
+	  Upstream is no longer maintained, and the package does not
+	  build with setuptools >= 82.
+
 config BR2_PACKAGE_PYTHON_XLIB
 	bool "python-xlib removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 73522de358..ee02d38ba5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1152,7 +1152,6 @@ menu "External python modules"
 	source "package/python-hiredis/Config.in"
 	source "package/python-hkdf/Config.in"
 	source "package/python-hpack/Config.in"
-	source "package/python-html5lib/Config.in"
 	source "package/python-httpcore/Config.in"
 	source "package/python-httplib2/Config.in"
 	source "package/python-httpx/Config.in"
diff --git a/package/python-html5lib/0001-setup.py-fix-version-parsing-on-Python-3.14.patch b/package/python-html5lib/0001-setup.py-fix-version-parsing-on-Python-3.14.patch
deleted file mode 100644
index 0147aa1418..0000000000
--- a/package/python-html5lib/0001-setup.py-fix-version-parsing-on-Python-3.14.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From b90dafff1bf342d34d539098013d0b9f318c7641 Mon Sep 17 00:00:00 2001
-From: Andrew Sukach <andrew@sukach.org>
-Date: Fri, 12 Sep 2025 21:53:31 -0700
-Subject: [PATCH] `setup.py`: fix version parsing on Python 3.14 (ast.Str
- removed)
-
-Python 3.14 removes the ast.Str node type. String literals now appear
-as ast.Constant(value=str).
-Update the AST check to accept both ast.Str (for older Pythons) and
-ast.Constant with a string value (for Python 3.8+), allowing html5lib to
-build successfully on Python 3.14 while remaining compatible with older
-version.
-
-Upstream: https://github.com/html5lib/html5lib-python/pull/589
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- setup.py | 11 ++++++++---
- 1 file changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 30ee0575..42ab6f67 100644
---- a/setup.py
-+++ b/setup.py
-@@ -92,9 +92,14 @@ def default_environment():
-     for a in assignments:
-         if (len(a.targets) == 1 and
-                 isinstance(a.targets[0], ast.Name) and
--                a.targets[0].id == "__version__" and
--                isinstance(a.value, ast.Str)):
--            version = a.value.s
-+                a.targets[0].id == "__version__"):
-+            if hasattr(ast, "Str") and isinstance(a.value, ast.Str):
-+                version = a.value.s
-+            elif (hasattr(ast, "Constant")
-+                  and isinstance(a.value, ast.Constant)
-+                  and isinstance(a.value.value, str)):
-+                version = a.value.value
-+assert version is not None
- 
- setup(name='html5lib',
-       version=version,
diff --git a/package/python-html5lib/Config.in b/package/python-html5lib/Config.in
deleted file mode 100644
index 34e22049ad..0000000000
--- a/package/python-html5lib/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_PYTHON_HTML5LIB
-	bool "python-html5lib"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
-	select BR2_PACKAGE_PYTHON_WEBENCODINGS # runtime
-	help
-	  HTML parser based on the WHATWG HTML specification.
-
-	  https://github.com/html5lib/html5lib-python
diff --git a/package/python-html5lib/python-html5lib.hash b/package/python-html5lib/python-html5lib.hash
deleted file mode 100644
index 5023f5ab66..0000000000
--- a/package/python-html5lib/python-html5lib.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/html5lib/json
-md5  6748742e2ec4cb99287a6bc82bcfe2b0  html5lib-1.1.tar.gz
-sha256  b2e5b40261e20f354d198eae92afc10d750afb487ed5e50f9c4eaf07c184146f  html5lib-1.1.tar.gz
-# Locally computed sha256 checksums
-sha256  16a39991619e92f18680932da2a9199fdf7d95df3ecaedc52ea06218aabafd6f  LICENSE
diff --git a/package/python-html5lib/python-html5lib.mk b/package/python-html5lib/python-html5lib.mk
deleted file mode 100644
index 320ef01c7a..0000000000
--- a/package/python-html5lib/python-html5lib.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# python-html5lib
-#
-################################################################################
-
-PYTHON_HTML5LIB_VERSION = 1.1
-PYTHON_HTML5LIB_SOURCE = html5lib-$(PYTHON_HTML5LIB_VERSION).tar.gz
-PYTHON_HTML5LIB_SITE = https://files.pythonhosted.org/packages/ac/b6/b55c3f49042f1df3dcd422b7f224f939892ee94f22abcf503a9b7339eaf2
-PYTHON_HTML5LIB_LICENSE = MIT
-PYTHON_HTML5LIB_LICENSE_FILES = LICENSE
-PYTHON_HTML5LIB_SETUP_TYPE = setuptools
-PYTHON_HTML5LIB_CPE_ID_VENDOR = html5lib
-PYTHON_HTML5LIB_CPE_ID_PRODUCT = html5lib
-
-$(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
