Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8127BC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 13:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DD3260FF8;
	Thu,  9 May 2024 13:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NFHytb3aBOdY; Thu,  9 May 2024 13:40:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B41BF60FEC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B41BF60FEC;
	Thu,  9 May 2024 13:40:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF1151BF3EE
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 13:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAEB540382
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 13:40:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DmZzacSTzci4 for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 13:40:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ECEC402AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6ECEC402AE
 for <buildroot@buildroot.org>; Thu,  9 May 2024 13:40:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A727C86B5D; Thu,  9 May 2024 13:40:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 May 2024 18:40:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 121c5f7b422bf393f51e0e873e7ceaef55b0d3d3
X-Git-Newrev: dcab89785156b655735ac2fb02c41a18a002c253
X-Patchwork-Hint: ignore
Message-Id: <20240509134004.A727C86B5D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] packge/pkg-python: drop custom environment
 variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=dcab89785156b655735ac2fb02c41a18a002c253
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Many moons ago, in the dark ages of Python, cross compiles were largely
unsupported. In these before-times, a patchset used by PtxDist [0] [1]
was adapted to help make cross compiles work.

The patchset did a number of things but mainly:
 1) used a build-machine compatible python interpreter for certain
    stages of the target Python build process
 2) made adjustments to certain files to make decisions based on values
    set in environment variables instead of the path of the executing
    Python interpreter.

Since the path of the interpreter that was build machine compatible was
outside of the target build directory, the code that made assumptions
about the location of headers and library paths being relative to the
interpreter path needed to be adjusted, hence them being driven via
environment variables.

The patchset worked by replacing the executable path to be the sysroot
which included the python headers and libraries.

A number of issues regarding cross compilation [2] [3] [4] have since
been closed since the introduction of this patchset and cross builds
became much better supported starting in Python v3.3.1.

New logic primarily uses the _PYTHON_PROJECT_BASE env variable [5] [6].

When set properly, this drives a few things:
  * flags a cross compile environment
  * sysconfig.is_python_build = True which triggers:
    * altered paths for finding the Makefile and config.h
    * altered sysconfig.get_config_var("srcdir")

When migrating to Python 3.4, PtxDist reworked their patchset to use
the standard environment variables for their cross compiles [7].

The distutils module was a primary consumer of the custom variables from
the previous patchset, however, that module is deprecated and packages
cannot target it as of 09de823c.

Package builds and unit tests seem to work without using these variables
being set, implying they can likely be dropped. Packages that still use
distutils should be updated to reflect its removal in 3.12.

Once these custom variables are removed, the following Python3 patches
which leverage them can be dropped:
  0004-Adjust-library-header-paths-for-cross-compilation
  0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros

[0]: https://gitlab.vahanus.net/ptxdist/ptxdist/-/commit/eef994411c20653cde95b35266000e3a8754e3b3
[1]: https://gitlab.vahanus.net/ptxdist/ptxdist/-/commit/6c79cb5ac373b1cccf531e8be3ed1b9722ed1622
[2]: https://github.com/python/cpython/issues/48004
[3]: https://github.com/python/cpython/issues/58538
[4]: https://github.com/python/cpython/issues/59689
[5]: https://github.com/python/cpython/commit/7e6c2e2cc49fa109662d3f04f4c3553596d31937
[6]: https://github.com/python/cpython/commit/9731330d6f4d63d6d57c8e99c8d11ef1def42858
[7]: https://gitlab.vahanus.net/ptxdist/ptxdist/-/commit/638a024500c214c1d8283bce8cec864fb95deacf

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-python.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 839f728e2f..88fadecd54 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -41,10 +41,7 @@ PKG_PYTHON_ENV = \
 	PATH=$(BR_PATH) \
 	$(TARGET_CONFIGURE_OPTS) \
 	PYTHONPATH="$(PYTHON3_PATH)" \
-	PYTHONNOUSERSITE=1 \
-	_python_sysroot=$(STAGING_DIR) \
-	_python_prefix=/usr \
-	_python_exec_prefix=/usr
+	PYTHONNOUSERSITE=1
 
 # Host python packages
 HOST_PKG_PYTHON_ENV = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
