Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7769AC433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 22:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33D25403C2;
	Fri, 13 May 2022 22:15:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cusohoT4gz1l; Fri, 13 May 2022 22:15:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D8D84093B;
	Fri, 13 May 2022 22:15:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D8C231BF868
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1C9940980
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HpJsDE0apK-g for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 22:11:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A55E54098C
 for <buildroot@buildroot.org>; Fri, 13 May 2022 22:11:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7BC5185E25; Fri, 13 May 2022 22:00:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 23:54:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8fb909b74f7310dd9a47e65c19e3c5c8a4e64f2d
X-Git-Newrev: 4686fb32a053753f502e24c5cd980db5b71f6a2c
X-Patchwork-Hint: ignore
Message-Id: <20220513220045.7BC5185E25@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-python: add setup.cfg-only
 setuptools project support
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

commit: https://git.buildroot.net/buildroot/commit/?id=4686fb32a053753f502e24c5cd980db5b71f6a2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some projects have been removing their setup.py shims under the
assumption that they are not needed due to setuptools being usable
via pep517, however this is not actually the case as it is not
possible to bootstrap setuptools without setup.py style builds as
setuptools has a dependency on wheel when being used via pep517
which is itself not installable via pep517 as that would create a
dependency cycle between wheel and setuptools(which means wheel
itself must use a legacy setup.py build/installation for itself).

In addition our pep517 toolchain itself requires setuptools for
building/installing dependencies, although it would appear these
dependencies will eventually move to flit. Until this is resolved
we must use setup.py style builds for setuptools packages.

Since it is not yet possible to convert setup.py based setuptools
builds to pep517 based setuptools builds we simply need to execute
the setuptools shim code directly if the setup.py file is missing.

See:
https://setuptools.pypa.io/en/latest/setuptools.html#setup-cfg-only-projects

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Tested-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-python.mk | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 452fa0d3ea..5794e3a195 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -86,6 +86,9 @@ PKG_PYTHON_SETUPTOOLS_ENV = \
 	$(PKG_PYTHON_ENV) \
 	SETUPTOOLS_USE_DISTUTILS=stdlib
 
+PKG_PYTHON_SETUPTOOLS_CMD = \
+	$(if $(wildcard $($(PKG)_BUILDDIR)/setup.py),setup.py,-c 'from setuptools import setup;setup()')
+
 PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--prefix=/usr \
@@ -180,13 +183,13 @@ endif
 else ifeq ($$($(2)_SETUP_TYPE),setuptools)
 ifeq ($(4),target)
 $(2)_BASE_ENV = $$(PKG_PYTHON_SETUPTOOLS_ENV)
-$(2)_BASE_BUILD_CMD = setup.py build
-$(2)_BASE_INSTALL_TARGET_CMD = setup.py install --no-compile $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
-$(2)_BASE_INSTALL_STAGING_CMD = setup.py install $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
+$(2)_BASE_BUILD_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) build
+$(2)_BASE_INSTALL_TARGET_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install --no-compile $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
+$(2)_BASE_INSTALL_STAGING_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
 else
 $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
-$(2)_BASE_BUILD_CMD = setup.py build
-$(2)_BASE_INSTALL_CMD = setup.py install $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
+$(2)_BASE_BUILD_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) build
+$(2)_BASE_INSTALL_CMD = $$(PKG_PYTHON_SETUPTOOLS_CMD) install $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
 endif
 else ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
 ifeq ($(4),target)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
