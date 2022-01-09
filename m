Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3ABC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 13:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FDA48190B;
	Sun,  9 Jan 2022 13:09:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uASNLFKnHOXT; Sun,  9 Jan 2022 13:09:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF27281750;
	Sun,  9 Jan 2022 13:09:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1562A1BF4D7
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 054B6402BF
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:09:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IVWLZARK4t4B for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 13:09:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 882F940495
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 13:09:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F2AC282B94; Sun,  9 Jan 2022 13:03:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 14:09:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92297637d7e408be927c6ca5994751549eba7bf7
X-Git-Newrev: 31848ba595bfd77e5471601edc35cf587de4ce34
X-Patchwork-Hint: ignore
Message-Id: <20220109130308.F2AC282B94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools-scm: needs
 python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=31848ba595bfd77e5471601edc35cf587de4ce34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-setuptools-scm dropped python 2 support since
https://github.com/pypa/setuptools_scm/commit/f0be71fbcf150bfc68e4169226399d6ae4da8f1b
resulting in the following build failure since bump to version 6.3.2 in
commit 12e3527fd97df9ae1b60b892c61d10ce291b7a00:

/buildroot/autobuild/instance-2/output-1/host/lib" INTLTOOL_PERL=/usr/bin/perl  /home/buildroot/autobuild/instance-2/output-1/host/bin/python setup.py build  )
  File "setup.py", line 22
    f"{type(self).__name__} is forbidden, "
                                          ^

Fixes:
 - http://autobuild.buildroot.org/results/2f6125993de364b4a44d259f16806e6dfd792402

With python 2 support dropped, python-backports-functools-lru-cache can no
longer be built, so drop it.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                          |  7 +++++++
 package/Config.in                                         |  1 -
 package/python-backports-functools-lru-cache/Config.in    |  7 -------
 .../python-backports-functools-lru-cache.hash             |  5 -----
 .../python-backports-functools-lru-cache.mk               | 15 ---------------
 package/python-crontab/Config.in                          |  1 +
 package/python-dateutil/Config.in                         |  1 +
 package/python-jaraco-classes/Config.in                   |  1 +
 package/python-jsonmodels/Config.in                       |  1 +
 package/python-py/Config.in                               |  1 +
 .../python-setuptools-scm-git-archive.mk                  |  1 +
 package/python-setuptools-scm/python-setuptools-scm.mk    |  1 +
 package/python-xlib/Config.in                             |  1 +
 13 files changed, 15 insertions(+), 28 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a9e95d6f58..5a3e9b5cc7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE
+	bool "python-backports-functools-lru-cache package removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed as python-setuptools-scm
+	  dropped support of python 2 since version 6.0.0.
+
 config BR2_PACKAGE_SYSTEMD_TMPFILES
 	bool "systemd tmpfiles support always enabled"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 2d3ca6a3b6..85193f7802 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -939,7 +939,6 @@ menu "External python modules"
 	source "package/python-babel/Config.in"
 	source "package/python-backcall/Config.in"
 	source "package/python-backports-abc/Config.in"
-	source "package/python-backports-functools-lru-cache/Config.in"
 	source "package/python-backports-shutil-get-terminal-size/Config.in"
 	source "package/python-backports-ssl-match-hostname/Config.in"
 	source "package/python-bcrypt/Config.in"
diff --git a/package/python-backports-functools-lru-cache/Config.in b/package/python-backports-functools-lru-cache/Config.in
deleted file mode 100644
index a5b7771e4d..0000000000
--- a/package/python-backports-functools-lru-cache/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE
-	bool "python-backports-functools-lru-cache"
-	depends on BR2_PACKAGE_PYTHON
-	help
-	  Backport of functools.lru_cache from Python 3.3
-
-	  https://github.com/jaraco/backports.functools_lru_cache
diff --git a/package/python-backports-functools-lru-cache/python-backports-functools-lru-cache.hash b/package/python-backports-functools-lru-cache/python-backports-functools-lru-cache.hash
deleted file mode 100644
index 3db4aec1fb..0000000000
--- a/package/python-backports-functools-lru-cache/python-backports-functools-lru-cache.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/backports.functools_lru_cache/json
-md5	20f53f54cd3f04b3346ce75a54959754  backports.functools_lru_cache-1.5.tar.gz
-sha256	9d98697f088eb1b0fa451391f91afb5e3ebde16bbdb272819fd091151fda4f1a  backports.functools_lru_cache-1.5.tar.gz
-# Localy computed sha256 checksumms
-sha256	a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
diff --git a/package/python-backports-functools-lru-cache/python-backports-functools-lru-cache.mk b/package/python-backports-functools-lru-cache/python-backports-functools-lru-cache.mk
deleted file mode 100644
index 334d6d8c49..0000000000
--- a/package/python-backports-functools-lru-cache/python-backports-functools-lru-cache.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# python-backports-functools-lru-cache
-#
-################################################################################
-
-PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE_VERSION = 1.5
-PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE_SOURCE = backports.functools_lru_cache-$(PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE_VERSION).tar.gz
-PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE_SITE = https://files.pythonhosted.org/packages/57/d4/156eb5fbb08d2e85ab0a632e2bebdad355798dece07d4752f66a8d02d1ea
-PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE_SETUP_TYPE = setuptools
-PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE_DEPENDENCIES = host-python-setuptools-scm
-PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE_LICENSE = MIT
-PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE_LICENSE_FILES = LICENSE
-
-$(eval $(python-package))
diff --git a/package/python-crontab/Config.in b/package/python-crontab/Config.in
index 102dbbdb6b..7514a3866b 100644
--- a/package/python-crontab/Config.in
+++ b/package/python-crontab/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_CRONTAB
 	bool "python-crontab"
+	depends on BR2_PACKAGE_PYTHON3 # python-dateutil -> host-python-setuptools-scm
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
 	help
 	  Crontab module for reading and writing crontab files and
diff --git a/package/python-dateutil/Config.in b/package/python-dateutil/Config.in
index 1a36a150b1..bbf61f6813 100644
--- a/package/python-dateutil/Config.in
+++ b/package/python-dateutil/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_DATEUTIL
 	bool "python-dateutil"
+	depends on BR2_PACKAGE_PYTHON3 # host-python-setuptools-scm
 	select BR2_PACKAGE_PYTHON_SIX
 	help
 	  Extensions to the standard Python datetime module.
diff --git a/package/python-jaraco-classes/Config.in b/package/python-jaraco-classes/Config.in
index 05c11237ab..271e085c6f 100644
--- a/package/python-jaraco-classes/Config.in
+++ b/package/python-jaraco-classes/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_JARACO_CLASSES
 	bool "python-jaraco-classes"
+	depends on BR2_PACKAGE_PYTHON3 # host-python-setuptools-scm
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Utility functions for Python class constructs.
diff --git a/package/python-jsonmodels/Config.in b/package/python-jsonmodels/Config.in
index f66982874a..84a269f171 100644
--- a/package/python-jsonmodels/Config.in
+++ b/package/python-jsonmodels/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_JSONMODELS
 	bool "python-jsonmodels"
+	depends on BR2_PACKAGE_PYTHON3 # python-dateutil -> host-python-setuptools-scm
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
diff --git a/package/python-py/Config.in b/package/python-py/Config.in
index 354372f5b4..0e3c3390a0 100644
--- a/package/python-py/Config.in
+++ b/package/python-py/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PY
 	bool "python-py"
+	depends on BR2_PACKAGE_PYTHON3 # host-python-setuptools-scm
 	help
 	  library with cross-python path, ini-parsing, io, code, log
 	  facilities.
diff --git a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
index 032e2d3fc9..48ca9c89ae 100644
--- a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
+++ b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
@@ -11,5 +11,6 @@ PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_LICENSE_FILES = LICENSE
 HOST_PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_DEPENDENCIES = host-python-setuptools-scm
+HOST_PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_NEEDS_HOST_PYTHON = python3
 
 $(eval $(host-python-package))
diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
index f7f4e3ef27..b2990a56cb 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.mk
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -11,5 +11,6 @@ PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = setuptools
 HOST_PYTHON_SETUPTOOLS_SCM_DEPENDENCIES = host-python-packaging host-python-tomli
+HOST_PYTHON_SETUPTOOLS_SCM_NEEDS_HOST_PYTHON = python3
 
 $(eval $(host-python-package))
diff --git a/package/python-xlib/Config.in b/package/python-xlib/Config.in
index 081af6a2fc..20e585db9a 100644
--- a/package/python-xlib/Config.in
+++ b/package/python-xlib/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_XLIB
 	bool "python-xlib"
+	depends on BR2_PACKAGE_PYTHON3 # host-python-setuptools-scm
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  XLib in pure Python (Py2/Py3 compatible)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
