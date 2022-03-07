Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95773C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D8FD60EF9;
	Mon,  7 Mar 2022 21:46:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wwoB3nSlpRL5; Mon,  7 Mar 2022 21:46:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C47760EFD;
	Mon,  7 Mar 2022 21:46:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C66C1BF2C3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5961382BD6
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pD1MzgkBuxjZ for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:46:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3BEB8283D
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:46:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E2C8482941; Mon,  7 Mar 2022 21:38:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 22:39:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c05b5e1007681f8a1d15a6194f84051e7569d04
X-Git-Newrev: 37cc5aecf57493e037769f444fdc4f7d8ac8782f
X-Patchwork-Hint: ignore
Message-Id: <20220307213817.E2C8482941@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-python: fix headers install
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

commit: https://git.buildroot.net/buildroot/commit/?id=37cc5aecf57493e037769f444fdc4f7d8ac8782f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For an unknown reason, installation of headers is broken since commit
7c1bb5c2bfdc9d726c41a66b30b7aa8e759c6596 which sets _PYTHON_PROJECT_BASE

As _PYTHON_PROJECT_BASE value seems correct and fix its own build
failures, use --install-headers to set install path for headers and
avoid the following build failure with python-greenlet or python-pygame:

python-greenlet: installs files in /home/peko/autobuild/instance-0/output-1/target//home/peko/autobuild/instance-0/output-1

python-pygame: installs files in /home/peko/autobuild/instance-1/output-1/target//home/peko/autobuild/instance-1/output-1

Fixes:
 - http://autobuild.buildroot.org/results/f5b52dee7e72f0a1f72b9f87723bc585743c7b31
 - http://autobuild.buildroot.org/results/9eb2685d32756864000e1b38f8a183b57f6ea528

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-python.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index e81a1a3102..38455e40fb 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -52,10 +52,12 @@ PKG_PYTHON_DISTUTILS_BUILD_OPTS = \
 	--executable=/usr/bin/python
 
 PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS = \
+	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--prefix=/usr \
 	--root=$(TARGET_DIR)
 
 PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS = \
+	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--prefix=/usr \
 	--root=$(STAGING_DIR)
 
@@ -84,12 +86,14 @@ PKG_PYTHON_SETUPTOOLS_ENV = \
 	_python_exec_prefix=/usr
 
 PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS = \
+	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--prefix=/usr \
 	--executable=/usr/bin/python \
 	--single-version-externally-managed \
 	--root=$(TARGET_DIR)
 
 PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS = \
+	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--prefix=/usr \
 	--executable=/usr/bin/python \
 	--single-version-externally-managed \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
