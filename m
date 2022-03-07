Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054E0C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 19:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E649E408DA;
	Mon,  7 Mar 2022 19:39:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ijWu5gVFRYyX; Mon,  7 Mar 2022 19:39:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A70C940A7E;
	Mon,  7 Mar 2022 19:39:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 269F91BF36D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1489540A8B
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:39:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2C-1np1HpUfP for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 19:39:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB444404AB
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 19:39:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 47D9C82A9F; Mon,  7 Mar 2022 19:31:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 20:38:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4eebf191c781a3ea6b5eb1811cc17ae92ea2fb2
X-Git-Newrev: 4386bbdf0895dbb35e02c25f42603bae9af64451
X-Patchwork-Hint: ignore
Message-Id: <20220307193103.47D9C82A9F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-python: use
 SETUPTOOLS_USE_DISTUTILS=stdlib
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

commit: https://git.buildroot.net/buildroot/commit/?id=4386bbdf0895dbb35e02c25f42603bae9af64451
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 # ipython -c 'import math; math.floor(12.3)'
-sh: ipython: not found

ipython use a wrong shebang on the target:

 # head -n 1 /usr/bin/ipython
 #!/home/kubu/buildroot/testsuite-master/TestIPythonPy3/host/bin/python

The issue come from python3-setuptools 60.0.0 that changed
SETUPTOOLS_USE_DISTUTILS default value from stdlib to local [1] to use
its local copy of distutils. This is actually a "breaking" change [2].

We have to override SETUPTOOLS_USE_DISTUTILS to the previous value
"stdlib" to fixes the issue.

While at it, use distutils from stdlib for the host.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2088684091

[1] https://github.com/pypa/setuptools/commit/b6fcbbd00cb6d5607c9272dec452a50457bdb292
[2] https://github.com/pypa/setuptools/blob/v60.0.0/CHANGES.rst#breaking-changes

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-python.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index b8dc9cd9e5..e81a1a3102 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -40,6 +40,7 @@ PKG_PYTHON_DISTUTILS_ENV = \
 	LDSHARED="$(TARGET_CROSS)gcc -shared" \
 	PYTHONPATH="$(PYTHON3_PATH)" \
 	PYTHONNOUSERSITE=1 \
+	SETUPTOOLS_USE_DISTUTILS=stdlib \
 	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
 	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
 	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
@@ -62,6 +63,7 @@ PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS = \
 HOST_PKG_PYTHON_DISTUTILS_ENV = \
 	PATH=$(BR_PATH) \
 	PYTHONNOUSERSITE=1 \
+	SETUPTOOLS_USE_DISTUTILS=stdlib \
 	$(HOST_CONFIGURE_OPTS)
 
 HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
@@ -76,6 +78,7 @@ PKG_PYTHON_SETUPTOOLS_ENV = \
 	$(TARGET_CONFIGURE_OPTS) \
 	PYTHONPATH="$(PYTHON3_PATH)" \
 	PYTHONNOUSERSITE=1 \
+	SETUPTOOLS_USE_DISTUTILS=stdlib \
 	_python_sysroot=$(STAGING_DIR) \
 	_python_prefix=/usr \
 	_python_exec_prefix=/usr
@@ -96,6 +99,7 @@ PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS = \
 HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
 	PATH=$(BR_PATH) \
 	PYTHONNOUSERSITE=1 \
+	SETUPTOOLS_USE_DISTUTILS=stdlib \
 	$(HOST_CONFIGURE_OPTS)
 
 HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
