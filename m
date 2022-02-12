Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D84FC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 12:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7DD082C04;
	Sat, 12 Feb 2022 12:19:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VVehH5zn2fXy; Sat, 12 Feb 2022 12:19:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFAC481BF4;
	Sat, 12 Feb 2022 12:19:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E27E1BF954
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 12:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39E1940278
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 12:19:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CUbgCfKbtDt6 for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 12:19:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40D2640272
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 12:19:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 582E382578; Sat, 12 Feb 2022 12:12:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 13:13:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a778def2ac28eb7a993a33e51ab305b0c833d713
X-Git-Newrev: 59d3a1a9994c337207cd0bfdfbd79f01ff8739e6
X-Patchwork-Hint: ignore
Message-Id: <20220212121212.582E382578@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-python: fix get_platform for
 target builds
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

commit: https://git.buildroot.net/buildroot/commit/?id=59d3a1a9994c337207cd0bfdfbd79f01ff8739e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replicate the logic used to set _PYTHON_HOST_PLATFORM in configure.ac:
https://github.com/python/cpython/blob/v3.10.2/configure.ac#L441-L446

This should correctly set the sysconfig platform for cross builds:
https://github.com/python/cpython/blob/v3.10.2/Lib/sysconfig.py#L704-L706

Not setting this appears to cause distutils/setuptools to use the
wrong build directory names for c extensions, however this doesn't
seem to cause build or runtime errors as the installation paths still
appear to be correct for staging/target installs.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-python.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index bf0649fc9c..02df061a19 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -20,6 +20,13 @@
 #
 ################################################################################
 
+ifeq ($(BR2_arm)$(BR2_armeb),y)
+PKG_PYTHON_ARCH = arm
+else
+PKG_PYTHON_ARCH = $(ARCH)
+endif
+PKG_PYTHON_HOST_PLATFORM = linux-$(PKG_PYTHON_ARCH)
+
 # basename does not evaluate if a file exists, so we must check to ensure
 # the _sysconfigdata__linux_*.py file exists. The "|| true" is added to return
 # an empty string if the file does not exist.
@@ -33,6 +40,7 @@ PKG_PYTHON_DISTUTILS_ENV = \
 	LDSHARED="$(TARGET_CROSS)gcc -shared" \
 	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
 	PYTHONNOUSERSITE=1 \
+	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
 	_PYTHON_PROJECT_BASE="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_DIR),$(PYTHON_DIR))" \
 	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
 	_python_sysroot=$(STAGING_DIR) \
@@ -61,6 +69,7 @@ HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 
 # Target setuptools-based packages
 PKG_PYTHON_SETUPTOOLS_ENV = \
+	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
 	_PYTHON_PROJECT_BASE="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_DIR),$(PYTHON_DIR))" \
 	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
 	PATH=$(BR_PATH) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
