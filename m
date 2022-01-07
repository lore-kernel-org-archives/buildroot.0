Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D70C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 21:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C333424BD;
	Fri,  7 Jan 2022 21:27:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BvqhhoDliXfS; Fri,  7 Jan 2022 21:26:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07BF3424B7;
	Fri,  7 Jan 2022 21:26:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF4511BF35A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E92D3424BD
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:26:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DKnrgyDQqwEu for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 21:26:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3447440010
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 21:26:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5F31F8349E; Fri,  7 Jan 2022 21:20:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 22:26:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e518c47dd6a16d0dee66b208d365728453cc655
X-Git-Newrev: a19b822239c36cb40a632899bb5c3e848a5fc81e
X-Patchwork-Hint: ignore
Message-Id: <20220107212044.5F31F8349E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pybind: switch to cmake
 package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a19b822239c36cb40a632899bb5c3e848a5fc81e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pybind11 is not really a Python module; it is actually a set of headers
that is used to wrap Python objects in C++.

Since pybind version 2.6.1, it uses CMake internally. This causes a
number of build issues for Buildroot because either no cmake is present
or it is too old.

pybind in fact has three parts: the C++ headers, a python module
pybind11, and the tests. The python package's only purpose is to serve
as a configure script for users of pybind. CMake is mainly used to build
and run the tests, which use the (mock-installed) pybind11 module to
find the (mock-installed) C++ headers. CMake is also used to install the
headers.

The setup.py script calls into CMake to install the headers and CMake
support files to a temporary directory, then copies that together with
the pybind11 module into the Python directory. The pybind11 module then
returns the include and cmake paths relative to its install location
(using __file__ to determine the install location).

This is not at all compatible with how Buildroot expects things to be
organised.
- The include and CMake files are installed somewhere within the Python
  directories, where nobody will find them.
- The Python module is installed for the target, but at build time
  Python modules are read from the host directory only. Therefore, a
  user of pybind can't actually load the module.

To solve this, several options are possible:
- Treat pybind as a host package. This causes users of pybind to build
  with an include path pointing into the host directory. This happens to
  work because pybind is a header-only library and because it is
  installed in a specific location which is not contaminated by other
  headers. However, it is philosophically wrong - a build for the target
  should never have an include path pointing to the host directory.
- Install pybind in the usual way into staging, and add a stub module to
  the host directory that returns paths to the staging directory. This
  leaves a useless pybind11 module in the staging directory, and puts
  the headers and cmake files in an unusual location. In addition it
  is not so simple - we need to jump through hoops to make sure that
  cmake is called correctly when it goes through python-package.
- Install the headers and cmake files using CMake, and add a (stub)
  python module in the host directory that points users to the staging
  directory. This puts the headers in the usual place
  (STAGING_DIR/usr/include) and still makes it possible to find them
  from a python package at build time.

We choose the latter solution.

First of all, convert to cmake-package. This installs just the headers
and the cmake support files. We need to pass PYBIND11_NOPYTHON=ON
because there is a cmake module that tries to find the python binary. It
sometimes finds the system python, sometimes the host python. In either
case, it checks whether this python's bitness and endianness correspond
to that of the compiler - which generally it doesn't in
cross-compilation. PYBIND_NOPYTHON bypasses this check.

Install in staging and not in target. Before, it was installed to target
but the python module would point to the target directory so it worked
anyway; now, however, we can properly use the staging directory.

Since it is no longer a python-package, the python module is not
installed automatically. Install them manually in a post-staging-install
hook. Since the python module is supposed to be used at build time,
install it in the host directory rather than in staging.

The python module normally looks in its current directory to find the
include and cmake paths, but for cross-compilation this is wrong. Add a
non-upstreamable patch that checks for STAGING_DIR in the environment.
If it is set (which is the case in Buildroot), use that instead of the
current directory.

Add an explicit dependency on python3. The headers include Python.h, so
any user of pybind needs to implicitly depend on python3. While we're at
it, change it to support python3 only - even though pybind currently
still supports python2, adding support for it in Buildroot is a little
bit complicated and python2 will be removed soon anyway.

Cc: Esben Haabendal <esben@geanix.com>
Cc: Andreas Naumann <dev@andin.de>
Co-Developed-by: Jagan Teki <jagan@amarulasolutions.com>
Co-Developed-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...-pybind11-commands.py-support-STAGING_DIR.patch | 36 ++++++++++++++++++++++
 package/python-pybind/Config.in                    |  1 +
 package/python-pybind/python-pybind.mk             | 19 ++++++++++--
 3 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch b/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch
new file mode 100644
index 0000000000..981a387be4
--- /dev/null
+++ b/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch
@@ -0,0 +1,36 @@
+From 9feaba4792c1d0a28e560ae941fa9ebabbbe4013 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Fri, 7 Jan 2022 19:32:18 +0100
+Subject: [PATCH] pybind11/commands.py: support STAGING_DIR
+
+In Buildroot, we install build-time python scripts in the host directory
+(otherwise they can't be run with host python), but when running
+pybind11 --includes it should return the staging directory.
+
+Patch commands.py to use the STAGING_DIR environment variable instead of
+the current directory, if it is set.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+Upstream-Status: N/A, Buildroot specific
+---
+ pybind11/commands.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pybind11/commands.py b/pybind11/commands.py
+index 34dbaf8..8c4876d 100644
+--- a/pybind11/commands.py
++++ b/pybind11/commands.py
+@@ -1,8 +1,8 @@
+ # -*- coding: utf-8 -*-
+ import os
+ 
+-
+-DIR = os.path.abspath(os.path.dirname(__file__))
++DIR = os.environ.get('STAGING_DIR') or \
++    os.path.abspath(os.path.dirname(__file__))
+ 
+ 
+ def get_include(user=False):
+-- 
+2.31.1
+
diff --git a/package/python-pybind/Config.in b/package/python-pybind/Config.in
index 604cb9ee67..27bc196e32 100644
--- a/package/python-pybind/Config.in
+++ b/package/python-pybind/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYBIND
 	bool "python-pybind"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  PyBind is a lightweight header-only library that exposes C++
 	  types in Python and vice versa, mainly to create Python
diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index a6a1bdb976..4dd52003ad 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -8,6 +8,21 @@ PYTHON_PYBIND_VERSION = 2.6.1
 PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
 PYTHON_PYBIND_LICENSE = BSD-3-Clause
 PYTHON_PYBIND_LICENSE_FILES = LICENSE
-PYTHON_PYBIND_SETUP_TYPE = setuptools
+PYTHON_PYBIND_INSTALL_STAGING = YES
+PYTHON_PYBIND_INSTALL_TARGET = NO # Header-only library
+PYTHON_PYBIND_DEPENDENCIES = python3
 
-$(eval $(python-package))
+PYTHON_PYBIND_CONF_OPTS = \
+	-DPYBIND11_INSTALL=ON \
+	-DPYBIND11_TEST=OFF \
+	-DPYBIND11_NOPYTHON=ON
+
+PYTHON_PYBIND_INSTALL_PATH = $(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/pybind11
+
+define PYTHON_PYBIND_INSTALL_MODULE
+	mkdir -p $(PYTHON_PYBIND_INSTALL_PATH)
+	cp -dpf $(@D)/pybind11/*.py $(PYTHON_PYBIND_INSTALL_PATH)
+endef
+PYTHON_PYBIND_POST_INSTALL_STAGING_HOOKS += PYTHON_PYBIND_INSTALL_MODULE
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
