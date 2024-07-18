Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC8FC3DA61
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 20:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF39460ED5;
	Thu, 18 Jul 2024 20:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y88tV7ZKwUdJ; Thu, 18 Jul 2024 20:54:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58DC060ED2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58DC060ED2;
	Thu, 18 Jul 2024 20:54:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B50B41BF3F9
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D219860612
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H6j6pDpDLaE1 for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 20:54:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE74C6062E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE74C6062E
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:54:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD64B86E0A; Thu, 18 Jul 2024 20:54:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Jul 2024 22:49:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a549a1bad51f1ef0ede2666a52e8f389babbc22
X-Git-Newrev: c1d9e4b9f74e840f6bb805743f3872310369506e
X-Patchwork-Hint: ignore
Message-Id: <20240718205421.BD64B86E0A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aerich: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c1d9e4b9f74e840f6bb805743f3872310369506e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to backport a patch so that the correct poetry build backend
is used.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/Config.in                                  |  1 +
 ...ry-build-backend-to-support-editable-inst.patch | 29 ++++++++++++++++++++++
 package/python-aerich/Config.in                    | 12 +++++++++
 package/python-aerich/python-aerich.hash           |  5 ++++
 package/python-aerich/python-aerich.mk             | 15 +++++++++++
 5 files changed, 62 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 017c6f21e6..c6e9611ca9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -963,6 +963,7 @@ endif
 if BR2_PACKAGE_PYTHON3
 menu "External python modules"
 	source "package/python-aenum/Config.in"
+	source "package/python-aerich/Config.in"
 	source "package/python-aexpect/Config.in"
 	source "package/python-aioblescan/Config.in"
 	source "package/python-aiocoap/Config.in"
diff --git a/package/python-aerich/0001-update-poetry-build-backend-to-support-editable-inst.patch b/package/python-aerich/0001-update-poetry-build-backend-to-support-editable-inst.patch
new file mode 100644
index 0000000000..67d7c45bfb
--- /dev/null
+++ b/package/python-aerich/0001-update-poetry-build-backend-to-support-editable-inst.patch
@@ -0,0 +1,29 @@
+From e729bb9b602ba74dea7ccc978dac709283a0934a Mon Sep 17 00:00:00 2001
+From: strayge <strayge@gmail.com>
+Date: Fri, 18 Aug 2023 15:03:38 +0400
+Subject: [PATCH] update poetry build-backend to support editable install
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/tortoise/aerich/commit/e729bb9b602ba74dea7ccc978dac709283a0934a
+---
+ pyproject.toml | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index b9390e1..7673d70 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -45,8 +45,8 @@ location = "./migrations"
+ src_folder = "./."
+ 
+ [build-system]
+-requires = ["poetry>=0.12"]
+-build-backend = "poetry.masonry.api"
++requires = ["poetry-core>=1.0.0"]
++build-backend = "poetry.core.masonry.api"
+ 
+ [tool.poetry.scripts]
+ aerich = "aerich.cli:main"
+-- 
+2.34.1
+
diff --git a/package/python-aerich/Config.in b/package/python-aerich/Config.in
new file mode 100644
index 0000000000..3aa39e176d
--- /dev/null
+++ b/package/python-aerich/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_AERICH
+	bool "python-aerich"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
+	select BR2_PACKAGE_PYTHON_CLICK # runtime
+	select BR2_PACKAGE_PYTHON_DICTDIFFER # runtime
+	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
+	select BR2_PACKAGE_PYTHON_TOMLKIT # runtime
+	select BR2_PACKAGE_PYTHON_TORTOISE_ORM # runtime
+	help
+	  A database migrations tool for Tortoise ORM.
+
+	  https://github.com/tortoise/aerich
diff --git a/package/python-aerich/python-aerich.hash b/package/python-aerich/python-aerich.hash
new file mode 100644
index 0000000000..c104c3d58e
--- /dev/null
+++ b/package/python-aerich/python-aerich.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aerich/json
+md5  26a99a2c6c604a370b228b74e12c7981  aerich-0.7.2.tar.gz
+sha256  31d67de7b96184636b89de99062e059e5e6204b6251d24c33eb21fc9cf982e09  aerich-0.7.2.tar.gz
+# Locally computed sha256 checksums
+sha256  4cc00f0e33ac8e089b37d8a1474be441b26311bdc16fe035c75b51201515f617  LICENSE
diff --git a/package/python-aerich/python-aerich.mk b/package/python-aerich/python-aerich.mk
new file mode 100644
index 0000000000..63343e0b96
--- /dev/null
+++ b/package/python-aerich/python-aerich.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-aerich
+#
+################################################################################
+
+PYTHON_AERICH_VERSION = 0.7.2
+PYTHON_AERICH_SOURCE = aerich-$(PYTHON_AERICH_VERSION).tar.gz
+PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/ca/cd/ae9c60ffc21e2d41e22c62cbf24a60dfad937222d880489703842d179746
+PYTHON_AERICH_SETUP_TYPE = pep517
+PYTHON_AERICH_LICENSE = Apache-2.0
+PYTHON_AERICH_LICENSE_FILES = LICENSE
+PYTHON_AERICH_DEPENDENCIES = host-python-poetry-core
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
