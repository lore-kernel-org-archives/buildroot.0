Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72895C4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 17:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 229FD40527;
	Sun, 11 Feb 2024 17:28:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h6obf5Jfru0p; Sun, 11 Feb 2024 17:28:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 591EA404C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 591EA404C3;
	Sun, 11 Feb 2024 17:28:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A89F31BF4D5
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A30D26066F
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:28:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tP15x4200UD2 for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 17:28:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 67CC160668
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67CC160668
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67CC160668
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 17:28:09 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5116063585aso2998062e87.1
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 09:28:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707672486; x=1708277286;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dAIpAWh3K3RdoeYtDbv1tc3m0DHQWS1D7vPoHpCGymI=;
 b=whsM6BYcPB6hkYHukr/Cf6EXmf/I0pNbROY4fNAOm/1mxF/+DBR6Syi34QnUutpT8k
 rIIC7eSXfK2Vs4IcjScg7t65zQGydQC479sYjRbTlZ0aen7BckbMJpHN6jVEu6HAjAtI
 aeIEYs3UId91jCm/b60Go6SmWfv0P/qE0WMD8m6XOjum18J35YyOL7qfEkHxF+gYMo9i
 0EcSfunFTBm6n+cYv0nnHrIf3VUBUM1GX7kCE0dZ5oJrkON+5b6RuYG8cgyb8CV0khKP
 3/MT0gOVs5zWJd+rgonDjcah2ryP7d1rw4F/rw893seoTazdfdk0baqUei/uD1dPGBkA
 mEgw==
X-Gm-Message-State: AOJu0YwpiDCcY04Mw3hRzValbEMLM3UhiKZQvSPsoNZrHVc0jkC3+tgI
 muQIZbBDCjS+T4gz5oZQSWbeGuHTnFFVy+IL+XcJid3eb4UltRTGM0Bv2167GXo=
X-Google-Smtp-Source: AGHT+IGhDogRc+48Xt83151kBTY85MrTu5/02Xp7OusxMOaohnfRx9rhxbwlBuRZfHVEOmuONGFGuQ==
X-Received: by 2002:a05:6512:2151:b0:511:4eb4:c4ed with SMTP id
 s17-20020a056512215100b005114eb4c4edmr2937264lfr.45.1707672486172; 
 Sun, 11 Feb 2024 09:28:06 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXZB/Xw88Eh+O5jSMrwKL71/HNj6OS0f7ZmpQpJerswbzGngpaRpd9tRFF4T38tZ4nh3gTm+7unHYZL58udg9TiZRY0gOWasce0+A==
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 fl18-20020a05600c0b9200b00410d59b7773sm559583wmb.22.2024.02.11.09.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Feb 2024 09:28:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 18:27:56 +0100
Message-ID: <20240211172756.704681-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707672486; x=1708277286; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dAIpAWh3K3RdoeYtDbv1tc3m0DHQWS1D7vPoHpCGymI=;
 b=KDKREdpjJuwKM7ys1mDW2R+5Ufs1G7vgVWS+3WLYgjTBs06NRAQtL8iUa/ybx8v936
 VQtJJNxRzMPPlz/kepuUokf1BtGyfqdU/Yu1ivs9vGzX7g9RwUj1qtleZeQUDJWmWnAI
 CIcXrcuiqLSyznQtOqejOZz4ZZkOExQgc0KZ4XryLj/rz1coaOdZiznzc/ASORiA/hda
 uKcRK7sKqLgj3QCVFgjOpHeJqmXFrlMnm1hHhSWI+u1hgGBUTGH1kzbK3xlPfDAIhArH
 TvApU9UY1wMd8gT9Y3OcLb/La8EvAINlyeK6mKZI/nWYNuUSrvjz1lo80Ym15xCjeLLH
 nogw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KDKREdpj
Subject: [Buildroot] [PATCH 1/1] package/libpwquality: fix build with python
 3.12
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch from distutils to setuptools to avoid the following build failure
raised since bump of python to version 3.12.1 in commit
36e635d2d5c0166476858aa239ccbe78e8f2af14:

Traceback (most recent call last):
  File "/home/fabrice/buildroot/output/build/libpwquality-1.4.5/python/setup.py", line 9, in <module>
    from distutils.core import setup, Extension
ModuleNotFoundError: No module named 'distutils'

Fixes: 36e635d2d5c0166476858aa239ccbe78e8f2af14
No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-Use-setuptools-instead-of-distutils.patch | 78 +++++++++++++++++++
 package/libpwquality/libpwquality.mk          |  6 +-
 2 files changed, 82 insertions(+), 2 deletions(-)
 create mode 100644 package/libpwquality/0001-Use-setuptools-instead-of-distutils.patch

diff --git a/package/libpwquality/0001-Use-setuptools-instead-of-distutils.patch b/package/libpwquality/0001-Use-setuptools-instead-of-distutils.patch
new file mode 100644
index 0000000000..4d4e4c8f54
--- /dev/null
+++ b/package/libpwquality/0001-Use-setuptools-instead-of-distutils.patch
@@ -0,0 +1,78 @@
+From 7b5e0f0097faebdcc6a8b783237bbba7a983147a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Miro=20Hron=C4=8Dok?= <miro@hroncok.cz>
+Date: Fri, 31 Mar 2023 14:52:19 +0200
+Subject: [PATCH] Use setuptools instead of distutils
+
+distutils is removed from Python 3.12+:
+https://peps.python.org/pep-0632/
+
+Upstream: https://github.com/libpwquality/libpwquality/commit/7b5e0f0097faebdcc6a8b783237bbba7a983147a
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libpwquality.spec.in | 11 ++---------
+ python/Makefile.am   |  2 +-
+ python/setup.py.in   |  6 +++---
+ 3 files changed, 6 insertions(+), 13 deletions(-)
+
+diff --git a/libpwquality.spec.in b/libpwquality.spec.in
+index 70a6f53..0809126 100644
+--- a/libpwquality.spec.in
++++ b/libpwquality.spec.in
+@@ -33,9 +33,11 @@ BuildRequires: gettext
+ BuildRequires: pam-devel
+ %if %{with python2}
+ BuildRequires: python2-devel
++BuildRequires: python2-setuptools
+ %endif
+ %if %{with python3}
+ BuildRequires: python3-devel
++BuildRequires: python3-setuptools
+ %endif
+ 
+ URL: https://github.com/libpwquality/libpwquality/
+@@ -103,15 +105,6 @@ cp -a . %{py3dir}
+ pushd %{py3dir}
+ %endif
+ %if %{with python3}
+-# setuptools >= 60 changes the environment to use its bundled copy of distutils
+-# by default, not the Python-bundled one. To run the Python's standard library
+-# distutils, the environment variable must be set.
+-# Although technically setuptools is not needed for this package, if it's
+-# pulled by another package, it changes the environment and consequently,
+-# the build fails. This was reported in:
+-# https://github.com/pypa/setuptools/issues/3143
+-export SETUPTOOLS_USE_DISTUTILS=stdlib
+-
+ %configure \
+ 	--with-securedir=%{_moduledir} \
+ 	--with-pythonsitedir=%{python3_sitearch} \
+diff --git a/python/Makefile.am b/python/Makefile.am
+index 1d00c0c..6e51744 100644
+--- a/python/Makefile.am
++++ b/python/Makefile.am
+@@ -14,7 +14,7 @@ all-local:
+ 	CFLAGS="${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build --build-base py$(PYTHONREV)
+ 
+ install-exec-local:
+-	CFLAGS="${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build --build-base py$(PYTHONREV) install --prefix=${DESTDIR}${prefix}
++	CFLAGS="${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build --build-base py$(PYTHONREV) install --root ${DESTDIR} --prefix=${prefix}
+ 
+ clean-local:
+ 	rm -rf py$(PYTHONREV)
+diff --git a/python/setup.py.in b/python/setup.py.in
+index a741b91..f934c50 100755
+--- a/python/setup.py.in
++++ b/python/setup.py.in
+@@ -6,9 +6,9 @@
+ 
+ import os
+ 
+-from distutils.core import setup, Extension
+-from distutils.command.build_ext import build_ext as _build_ext
+-from distutils.command.sdist import sdist as _sdist
++from setuptools import setup, Extension
++from setuptools.command.build_ext import build_ext as _build_ext
++from setuptools.command.sdist import sdist as _sdist
+ 
+ def genconstants(headerfile, outputfile):
+     hf = open(headerfile, 'r')
diff --git a/package/libpwquality/libpwquality.mk b/package/libpwquality/libpwquality.mk
index ae6babbcae..f12e583b2d 100644
--- a/package/libpwquality/libpwquality.mk
+++ b/package/libpwquality/libpwquality.mk
@@ -11,11 +11,13 @@ LIBPWQUALITY_LICENSE = BSD-3-Clause or GPL-2.0+
 LIBPWQUALITY_INSTALL_STAGING = YES
 LIBPWQUALITY_DEPENDENCIES = cracklib
 LIBPWQUALITY_LICENSE_FILES = COPYING
+# We're patching python/Makefile.am
+LIBPWQUALITY_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 LIBPWQUALITY_CONF_OPTS += --enable-python-bindings
-LIBPWQUALITY_DEPENDENCIES += python3
-LIBPWQUALITY_MAKE_ENV += $(PKG_PYTHON_DISTUTILS_ENV)
+LIBPWQUALITY_DEPENDENCIES += python3 host-python-setuptools
+LIBPWQUALITY_MAKE_ENV += $(PKG_PYTHON_SETUPTOOLS_ENV)
 else
 LIBPWQUALITY_CONF_OPTS += --disable-python-bindings
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
