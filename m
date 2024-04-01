Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CD9CD128A
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 20:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D266081F5E;
	Mon,  1 Apr 2024 20:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2rFxLgsgnp2n; Mon,  1 Apr 2024 20:19:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D602181F62
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D602181F62;
	Mon,  1 Apr 2024 20:19:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 093F71BF3BF
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 20:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A55281E7F
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 20:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQrY_GNPCHCU for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 20:18:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03F5E81E81
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03F5E81E81
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 20:18:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3F6783741; Mon,  1 Apr 2024 20:18:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Apr 2024 22:12:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d02877f044b5132b6173f4d7b2b0a036b7d83d9f
X-Git-Newrev: 96c6f20de65b0cad79a53cae2b2df297ba65db12
X-Patchwork-Hint: ignore
Message-Id: <20240401201822.F3F6783741@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-simplelogging: migrate to
 poetry core pep517 build backend
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

commit: https://git.buildroot.net/buildroot/commit/?id=96c6f20de65b0cad79a53cae2b2df297ba65db12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to migrate package/python-simplelogging to the pep517
poetry-core backend as setuptools is not supported when building
with a pep517 frontend.

This package currently builds using setuptools as we do not yet
use setuptools with a pep517 build frontend. The package contains
a setuptools fallback which only can be used when using setuptools
without a pep517 frontend as the pep517 frontend will only use the
build backend specified in the package pyproject.toml which is
poetry-core and not setuptools.

We also need to add a patch which switches from poetry to poetry
core as we do not support the full poetry package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../0001-Switch-build-backend-to-poetry-core.patch | 31 ++++++++++++++++++++++
 .../python-simplelogging/python-simplelogging.mk   |  3 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/package/python-simplelogging/0001-Switch-build-backend-to-poetry-core.patch b/package/python-simplelogging/0001-Switch-build-backend-to-poetry-core.patch
new file mode 100644
index 0000000000..2c345fe268
--- /dev/null
+++ b/package/python-simplelogging/0001-Switch-build-backend-to-poetry-core.patch
@@ -0,0 +1,31 @@
+From 76c1c545bad28f592405ca1e5bcf6081051c946a Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 13 Feb 2024 13:37:00 -0700
+Subject: [PATCH] Switch build-backend to poetry-core
+
+poetry-core is the lightweight counterpart of poetry that is intended
+to be used as a build-backend. Unlike poetry, it does not require
+installing all the dependencies of the package manager, making
+the builds much faster. The generated artifacts are the same.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/vpoulailleau/simplelogging/pull/230
+---
+ pyproject.toml | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index a89ab64..79403cb 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -55,5 +55,5 @@ commands =
+ """
+ 
+ [build-system]
+-requires = ["poetry>=0.12"]
+-build-backend = "poetry.masonry.api"
++requires = ["poetry-core>=1.0.0"]
++build-backend = "poetry.core.masonry.api"
+-- 
+2.34.1
+
diff --git a/package/python-simplelogging/python-simplelogging.mk b/package/python-simplelogging/python-simplelogging.mk
index 556628613b..dbd9ce3ae3 100644
--- a/package/python-simplelogging/python-simplelogging.mk
+++ b/package/python-simplelogging/python-simplelogging.mk
@@ -7,8 +7,9 @@
 PYTHON_SIMPLELOGGING_VERSION = 0.11.0
 PYTHON_SIMPLELOGGING_SOURCE = simplelogging-$(PYTHON_SIMPLELOGGING_VERSION).tar.gz
 PYTHON_SIMPLELOGGING_SITE = https://files.pythonhosted.org/packages/73/d6/4c06aa7f2c3b9fc09429a1196fd357357cc555de5e16c09b2d12e9db1ebb
-PYTHON_SIMPLELOGGING_SETUP_TYPE = setuptools
+PYTHON_SIMPLELOGGING_SETUP_TYPE = pep517
 PYTHON_SIMPLELOGGING_LICENSE = BSD-3-Clause
 PYTHON_SIMPLELOGGING_LICENSE_FILES = LICENSE
+PYTHON_SIMPLELOGGING_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
