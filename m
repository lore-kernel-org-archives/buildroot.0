Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCD7C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 22:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FACC4202B;
	Tue,  6 Feb 2024 22:22:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AChqvf8BRQUK; Tue,  6 Feb 2024 22:22:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95BC8420A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95BC8420A2;
	Tue,  6 Feb 2024 22:22:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF36C1BF976
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA95B612EC
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:22:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HHIdaOqbHdem for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 22:22:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8820E612E8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8820E612E8
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 22:22:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74FDF87485; Tue,  6 Feb 2024 22:22:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 23:21:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dcf0c3612dff3445d2de5862d34246ab18a43b8d
X-Git-Newrev: 09de823cbc7bd50a40e25f4166b4e42be94b0c7b
X-Patchwork-Hint: ignore
Message-Id: <20240206222231.74FDF87485@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-python.mk: remove distutils
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=09de823cbc7bd50a40e25f4166b4e42be94b0c7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All Python packages have been migrated to a different setup type, and
we're about to bump to Python 3.12 which no longer supports distutils,
so let's drop support for distutils in our python-package
infrastructure.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[Thomas: also update the Buildroot manual]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-directory.adoc |  4 +--
 docs/manual/adding-packages-python.adoc    | 46 ++++++++++++++----------------
 package/pkg-python.mk                      | 38 ++----------------------
 3 files changed, 26 insertions(+), 62 deletions(-)

diff --git a/docs/manual/adding-packages-directory.adoc b/docs/manual/adding-packages-directory.adoc
index 5a0f298eb1..e994b7e1f6 100644
--- a/docs/manual/adding-packages-directory.adoc
+++ b/docs/manual/adding-packages-directory.adoc
@@ -429,8 +429,8 @@ different way, using different infrastructures:
    and xref:cmake-package-reference[reference].
 
 * *Makefiles for Python modules*: We have a dedicated infrastructure
-   for Python modules that use the +distutils+, +flit+, +pep517+ or
-   +setuptools+ mechanisms. We cover them through a
+   for Python modules that use the +flit+, +pep517+ or +setuptools+
+   mechanisms. We cover them through a
    xref:python-package-tutorial[tutorial] and a
    xref:python-package-reference[reference].
 
diff --git a/docs/manual/adding-packages-python.adoc b/docs/manual/adding-packages-python.adoc
index 33dbfc30a5..44fd77fd1d 100644
--- a/docs/manual/adding-packages-python.adoc
+++ b/docs/manual/adding-packages-python.adoc
@@ -29,7 +29,7 @@ with an example :
 11: PYTHON_FOO_LICENSE_FILES = LICENSE
 12: PYTHON_FOO_ENV = SOME_VAR=1
 13: PYTHON_FOO_DEPENDENCIES = libmad
-14: PYTHON_FOO_SETUP_TYPE = distutils
+14: PYTHON_FOO_SETUP_TYPE = setuptools
 15:
 16: $(eval $(python-package))
 ------------------------
@@ -51,8 +51,8 @@ On line 13, we declare our dependencies, so that they are built
 before the build process of our package starts.
 
 On line 14, we declare the specific Python build system being used. In
-this case the +distutils+ Python build system is used. The four
-supported ones are +distutils+, +flit+, +pep517+ and +setuptools+.
+this case the +setuptools+ Python build system is used. The three
+supported ones are +flit+, +pep517+ and +setuptools+.
 
 Finally, on line 16, we invoke the +python-package+ macro that
 generates all the Makefile rules that actually allow the package to be
@@ -98,13 +98,13 @@ Note that:
 One variable specific to the Python infrastructure is mandatory:
 
 * +PYTHON_FOO_SETUP_TYPE+, to define which Python build system is used
-  by the package. The four supported values are +distutils+, +flit+,
-  +pep517+ and +setuptools+. If you don't know which one is used in
-  your package, look at the +setup.py+ or +pyproject.toml+ file in your
-  package source code, and see whether it imports things from the
-  +distutils+, +flit+ module or the +setuptools+ module. If the package
-  is using a +pyproject.toml+ file without any build-system requires
-  and with a local in-tree backend-path one should use +pep517+.
+  by the package. The three supported values are +flit+, +pep517+ and
+  +setuptools+. If you don't know which one is used in your package,
+  look at the +setup.py+ or +pyproject.toml+ file in your package
+  source code, and see whether it imports things from the +flit+
+  module or the +setuptools+ module. If the package is using a
+  +pyproject.toml+ file without any build-system requires and with a
+  local in-tree backend-path one should use +pep517+.
 
 A few additional variables, specific to the Python infrastructure, can
 optionally be defined, depending on the package's needs. Many of them
@@ -119,27 +119,25 @@ therefore only use a few of them, or none.
   +PYTHON_FOO_SUBDIR+.
 
 * +PYTHON_FOO_ENV+, to specify additional environment variables to
-  pass to the Python +setup.py+ script (for distutils/setuptools
-  packages) or the +support/scripts/pyinstaller.py+ script (for
-  flit/pep517 packages) for both the build and install steps. Note
-  that the infrastructure is automatically passing several standard
-  variables, defined in +PKG_PYTHON_DISTUTILS_ENV+ (for distutils
-  target packages), +HOST_PKG_PYTHON_DISTUTILS_ENV+ (for distutils
-  host packages), +PKG_PYTHON_SETUPTOOLS_ENV+ (for setuptools target
+  pass to the Python +setup.py+ script (for setuptools packages) or
+  the +support/scripts/pyinstaller.py+ script (for flit/pep517
+  packages) for both the build and install steps. Note that the
+  infrastructure is automatically passing several standard variables,
+  defined in +PKG_PYTHON_SETUPTOOLS_ENV+ (for setuptools target
   packages), +HOST_PKG_PYTHON_SETUPTOOLS_ENV+ (for setuptools host
   packages), +PKG_PYTHON_PEP517_ENV+ (for flit/pep517 target packages)
   and +HOST_PKG_PYTHON_PEP517_ENV+ (for flit/pep517 host packages).
 
-* +PYTHON_FOO_BUILD_OPTS+, to specify additional options to pass to the
-  Python +setup.py+ script during the build step, this generally only
-  makes sense to use for distutils/setuptools based packages as
-  flit/pep517 based packages do not pass these options to a +setup.py+
-  script but instead pass them to +support/scripts/pyinstaller.py+.
+* +PYTHON_FOO_BUILD_OPTS+, to specify additional options to pass to
+  the Python +setup.py+ script during the build step, this generally
+  only makes sense to use for setuptools based packages as flit/pep517
+  based packages do not pass these options to a +setup.py+ script but
+  instead pass them to +support/scripts/pyinstaller.py+.
 
 * +PYTHON_FOO_INSTALL_TARGET_OPTS+, +PYTHON_FOO_INSTALL_STAGING_OPTS+,
   +HOST_PYTHON_FOO_INSTALL_OPTS+ to specify additional options to pass
-  to the Python +setup.py+ script (for distutils/setuptools packages)
-  or +support/scripts/pyinstaller.py+ (for flit/pep517 packages) during
+  to the Python +setup.py+ script (for setuptools packages) or
+  +support/scripts/pyinstaller.py+ (for flit/pep517 packages) during
   the target installation step, the staging installation step or the
   host installation, respectively.
 
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 4bed5a1835..94f28ff841 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -52,40 +52,6 @@ HOST_PKG_PYTHON_ENV = \
 	PYTHONNOUSERSITE=1 \
 	$(HOST_CONFIGURE_OPTS)
 
-# Target distutils-based packages
-PKG_PYTHON_DISTUTILS_ENV = \
-	$(PKG_PYTHON_ENV) \
-	LDSHARED="$(TARGET_CROSS)gcc -shared"
-
-PKG_PYTHON_DISTUTILS_BUILD_CMD = \
-	setup.py build \
-	--executable=/usr/bin/python
-
-PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
-	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
-	--prefix=/usr
-
-PKG_PYTHON_DISTUTILS_INSTALL_TARGET_CMD = \
-	setup.py install --no-compile \
-	$(PKG_PYTHON_DISTUTILS_INSTALL_OPTS) \
-	--root=$(TARGET_DIR)
-
-PKG_PYTHON_DISTUTILS_INSTALL_STAGING_CMD = \
-	setup.py install \
-	$(PKG_PYTHON_DISTUTILS_INSTALL_OPTS) \
-	--root=$(STAGING_DIR)
-
-# Host distutils-based packages
-HOST_PKG_PYTHON_DISTUTILS_ENV = \
-	$(HOST_PKG_PYTHON_ENV)
-
-HOST_PKG_PYTHON_DISTUTILS_BUILD_CMD = \
-	setup.py build \
-
-HOST_PKG_PYTHON_DISTUTILS_INSTALL_CMD = \
-	setup.py install \
-	--prefix=$(HOST_DIR)
-
 # Target setuptools-based packages
 PKG_PYTHON_SETUPTOOLS_ENV = \
 	$(PKG_PYTHON_ENV)
@@ -287,8 +253,8 @@ endif
 
 $(2)_SETUP_TYPE_UPPER = $$(call UPPERCASE,$$($(2)_SETUP_TYPE))
 
-ifneq ($$(filter-out distutils setuptools setuptools-rust pep517 flit flit-bootstrap maturin,$$($(2)_SETUP_TYPE)),)
-$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'maturin', 'setuptools', 'setuptools-rust', 'pep517' or 'flit'.")
+ifneq ($$(filter-out setuptools setuptools-rust pep517 flit flit-bootstrap maturin,$$($(2)_SETUP_TYPE)),)
+$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'maturin', 'setuptools', 'setuptools-rust', 'pep517' or 'flit'.")
 endif
 ifeq ($(4)-$$($(2)_SETUP_TYPE),target-flit-bootstrap)
 $$(error flit-bootstrap setup type only supported for host packages)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
