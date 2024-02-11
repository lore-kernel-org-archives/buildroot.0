Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB02C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FF6F841F1;
	Sun, 11 Feb 2024 21:34:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QFmLvfwRnMiG; Sun, 11 Feb 2024 21:34:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 241C384082
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 241C384082;
	Sun, 11 Feb 2024 21:34:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D4FB81BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2710605EA
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:34:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YMY9BTgaA8gA for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:34:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B41B4605AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B41B4605AA
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:34:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9EF6A87797; Sun, 11 Feb 2024 21:34:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 22:34:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 632d8f25b7a36708cddf9628dfaa92d84acc5151
X-Git-Newrev: b1662a165c6d9762c4e77743ea930dcfa3ffd4cb
X-Patchwork-Hint: ignore
Message-Id: <20240211213440.9EF6A87797@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpwquality: fix build with
 python 3.12
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b1662a165c6d9762c4e77743ea930dcfa3ffd4cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Use-setuptools-instead-of-distutils.patch | 78 ++++++++++++++++++++++
 package/libpwquality/libpwquality.mk               |  6 +-
 2 files changed, 82 insertions(+), 2 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
