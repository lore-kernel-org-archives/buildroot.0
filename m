Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE287C433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 19:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78A9D41944;
	Wed,  4 May 2022 19:59:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MwOvAOsP0YNh; Wed,  4 May 2022 19:59:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6CE941938;
	Wed,  4 May 2022 19:59:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 18EBE1BF215
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 19:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0619340BBD
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 19:59:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gxPAglp6kHO7 for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 19:59:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7C2640BB7
 for <buildroot@buildroot.org>; Wed,  4 May 2022 19:59:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2D99D8578A; Wed,  4 May 2022 19:49:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 4 May 2022 21:47:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 24a2dc45cb7b4ab3f5af91c441c31b7fab58b60e
X-Git-Newrev: d4723bb9bd050729f7830bfb9da5695c343cfded
X-Patchwork-Hint: ignore
Message-Id: <20220504194914.2D99D8578A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: document flit/pep517 python
 package infrastructure
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4723bb9bd050729f7830bfb9da5695c343cfded
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note that the flit-bootstrap SETUP_TYPE is deliberately not
documented as it is used only for bootstrapping the host pep517
toolchain and should not be used anywhere else.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/adding-packages-directory.txt |  4 +-
 docs/manual/adding-packages-python.txt    | 74 ++++++++++++++++++-------------
 2 files changed, 46 insertions(+), 32 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 749e2d43b9..04f5241d05 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -429,8 +429,8 @@ different way, using different infrastructures:
    and xref:cmake-package-reference[reference].
 
 * *Makefiles for Python modules*: We have a dedicated infrastructure
-   for Python modules that use either the +distutils+ or the
-   +setuptools+ mechanism. We cover them through a
+   for Python modules that use the +distutils+, +flit+, +pep517+ or
+   +setuptools+ mechanisms. We cover them through a
    xref:python-package-tutorial[tutorial] and a
    xref:python-package-reference[reference].
 
diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
index 0141fea85b..500967f235 100644
--- a/docs/manual/adding-packages-python.txt
+++ b/docs/manual/adding-packages-python.txt
@@ -4,8 +4,9 @@
 === Infrastructure for Python packages
 
 This infrastructure applies to Python packages that use the standard
-Python setuptools mechanism as their build system, generally
-recognizable by the usage of a +setup.py+ script.
+Python setuptools or pep517 mechanisms as their build system, generally
+recognizable by the usage of a +setup.py+ script or +pyproject.toml+
+file.
 
 [[python-package-tutorial]]
 
@@ -50,8 +51,8 @@ On line 13, we declare our dependencies, so that they are built
 before the build process of our package starts.
 
 On line 14, we declare the specific Python build system being used. In
-this case the +distutils+ Python build system is used. The two
-supported ones are +distutils+ and +setuptools+.
+this case the +distutils+ Python build system is used. The four
+supported ones are +distutils+, +flit+, +pep517+ and +setuptools+.
 
 Finally, on line 16, we invoke the +python-package+ macro that
 generates all the Makefile rules that actually allow the package to be
@@ -97,11 +98,13 @@ Note that:
 One variable specific to the Python infrastructure is mandatory:
 
 * +PYTHON_FOO_SETUP_TYPE+, to define which Python build system is used
-  by the package. The two supported values are +distutils+ and
-  +setuptools+. If you don't know which one is used in your package,
-  look at the +setup.py+ file in your package source code, and see
-  whether it imports things from the +distutils+ module or the
-  +setuptools+ module.
+  by the package. The four supported values are +distutils+, +flit+,
+  +pep517+ and +setuptools+. If you don't know which one is used in
+  your package, look at the +setup.py+ or +pyproject.toml+ file in your
+  package source code, and see whether it imports things from the
+  +distutils+, +flit+ module or the +setuptools+ module. If the package
+  is using a +pyproject.toml+ file without any build-system requires
+  and with a local in-tree backend-path one should use +pep517+.
 
 A few additional variables, specific to the Python infrastructure, can
 optionally be defined, depending on the package's needs. Many of them
@@ -109,37 +112,48 @@ are only useful in very specific cases, typical packages will
 therefore only use a few of them, or none.
 
 * +PYTHON_FOO_SUBDIR+ may contain the name of a subdirectory inside the
-  package that contains the main +setup.py+ file. This is useful,
-  if for example, the main +setup.py+ file is not at the root of
-  the tree extracted by the tarball. If +HOST_PYTHON_FOO_SUBDIR+ is not
-  specified, it defaults to +PYTHON_FOO_SUBDIR+.
+  package that contains the main +setup.py+ or +pyproject.toml+ file.
+  This is useful, if for example, the main +setup.py+ or +pyproject.toml+
+  file is not at the root of the tree extracted by the tarball. If
+  +HOST_PYTHON_FOO_SUBDIR+ is not specified, it defaults to
+  +PYTHON_FOO_SUBDIR+.
 
 * +PYTHON_FOO_ENV+, to specify additional environment variables to
-  pass to the Python +setup.py+ script (for both the build and install
-  steps). Note that the infrastructure is automatically passing
-  several standard variables, defined in +PKG_PYTHON_DISTUTILS_ENV+
-  (for distutils target packages), +HOST_PKG_PYTHON_DISTUTILS_ENV+
-  (for distutils host packages), +PKG_PYTHON_SETUPTOOLS_ENV+ (for
-  setuptools target packages) and +HOST_PKG_PYTHON_SETUPTOOLS_ENV+
-  (for setuptools host packages).
+  pass to the Python +setup.py+ script (for distutils/setuptools
+  packages) or the +support/scripts/pyinstaller.py+ script (for
+  flit/pep517 packages) for both the build and install steps. Note
+  that the infrastructure is automatically passing several standard
+  variables, defined in +PKG_PYTHON_DISTUTILS_ENV+ (for distutils
+  target packages), +HOST_PKG_PYTHON_DISTUTILS_ENV+ (for distutils
+  host packages), +PKG_PYTHON_SETUPTOOLS_ENV+ (for setuptools target
+  packages), +HOST_PKG_PYTHON_SETUPTOOLS_ENV+ (for setuptools host
+  packages), +PKG_PYTHON_PEP517_ENV+ (for flit/pep517 target packages)
+  and +HOST_PKG_PYTHON_PEP517_ENV+ (for flit/pep517 host packages).
 
 * +PYTHON_FOO_BUILD_OPTS+, to specify additional options to pass to the
-  Python +setup.py+ script during the build step. For target distutils
-  packages, the +PKG_PYTHON_DISTUTILS_BUILD_OPTS+ options are already
-  passed automatically by the infrastructure.
+  Python +setup.py+ script during the build step, this generally only
+  makes sense to use for distutils/setuptools based packages as
+  flit/pep517 based packages do not pass these options to a +setup.py+
+  script but instead pass them to +support/scripts/pyinstaller.py+.
+  For target distutils packages, the +PKG_PYTHON_DISTUTILS_BUILD_OPTS+
+  options are already passed automatically by the infrastructure.
 
 * +PYTHON_FOO_INSTALL_TARGET_OPTS+, +PYTHON_FOO_INSTALL_STAGING_OPTS+,
   +HOST_PYTHON_FOO_INSTALL_OPTS+ to specify additional options to pass
-  to the Python +setup.py+ script during the target installation step,
-  the staging installation step or the host installation,
-  respectively. Note that the infrastructure is automatically passing
-  some options, defined in +PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS+
-  or +PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS+ (for target distutils
+  to the Python +setup.py+ script (for distutils/setuptools packages)
+  or +support/scripts/pyinstaller.py+ (for flit/pep517 packages) during
+  the target installation step, the staging installation step or the
+  host installation, respectively. Note that the infrastructure is
+  automatically passing some options, defined in
+  +PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS+ or
+  +PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS+ (for target distutils
   packages), +HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS+ (for host
   distutils packages), +PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS+ or
   +PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS+ (for target setuptools
-  packages) and +HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS+ (for host
-  setuptools packages).
+  packages), +HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS+ (for host
+  setuptools packages) and +PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS+ or
+  +PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS+ (for target flit/pep517
+  packages).
 
 With the Python infrastructure, all the steps required to build and
 install the packages are already defined, and they generally work well
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
