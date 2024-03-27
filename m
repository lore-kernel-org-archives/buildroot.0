Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0F0C54E67
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 22:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C3E7820F1;
	Wed, 27 Mar 2024 22:01:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OSCg4B8k9ke2; Wed, 27 Mar 2024 22:01:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C261820FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C261820FD;
	Wed, 27 Mar 2024 22:01:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D045C1BF300
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B054840597
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWFLOWchN-Dt for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 22:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2AAF415DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2AAF415DC
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 22:01:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C43A8438E; Wed, 27 Mar 2024 22:01:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Mar 2024 22:39:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d92841d5ae919957b9494bad3d186330a808d84
X-Git-Newrev: 830eda38e1590f449bd479ca89e08108aa1ade81
X-Patchwork-Hint: ignore
Message-Id: <20240327220143.9C43A8438E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-terminaltables: use correct
 pep517 build backend
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

commit: https://git.buildroot.net/buildroot/commit/?id=830eda38e1590f449bd479ca89e08108aa1ade81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to migrate python-terminaltables to the pep517 poetry-core
backend as setuptools is not supported when building with a pep517
frontend.

This package currently builds using setuptools as we do not yet
use setuptools with a pep517 build frontend. The package contains
a setuptools fallback which only can be used when using setuptools
without a pep517 frontend as the pep517 frontend will only use the
build backend specified in the package pyproject.toml which is
poetry-core and not setuptools. Thus, specifying setuptools as the build
backend is simply wrong.

The current release of python-terminaltables still uses poetry rather
than poetry-core as a build backend. poetry is much more heavyweight, it
would need to pull in a large number of build dependencies. Therefore,
include an upstream patch to switch from poetry to poetry-core.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Arnout: use a patch instead of sed]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../0001-switch-build-backend-to-poetry-core.patch | 28 ++++++++++++++++++++++
 .../python-terminaltables/python-terminaltables.mk |  3 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/package/python-terminaltables/0001-switch-build-backend-to-poetry-core.patch b/package/python-terminaltables/0001-switch-build-backend-to-poetry-core.patch
new file mode 100644
index 0000000000..2906dd740d
--- /dev/null
+++ b/package/python-terminaltables/0001-switch-build-backend-to-poetry-core.patch
@@ -0,0 +1,28 @@
+From 9e3dda0efb54fee6934c744a13a7336d24c6e9e9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Micha=C5=82=20G=C3=B3rny?= <mgorny@gentoo.org>
+Date: Thu, 27 Jan 2022 10:33:08 +0100
+Subject: [PATCH] Switch build-backend to poetry-core
+
+poetry-core is the lightweight counterpart of poetry that is intended
+to be used as a build-backend.  Unlike poetry, it does not require
+installing all the dependencies of the package manager, making
+the builds much faster.  The generated artifacts are the same.
+
+Upstream: https://github.com/matthewdeanmartin/terminaltables/commit/9e3dda0efb54fee6934c744a13a7336d24c6e9e9
+Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
+---
+ pyproject.toml     | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index a861add..ff4b190 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -62,5 +62,5 @@ python = ">=2.6 || >=3.0"
+ pytest = "==6.0.1"
+ 
+ [build-system]
+-requires = ["poetry>=0.12"]
+-build-backend = "poetry.masonry.api"
++requires = ["poetry-core>=1.0.0"]
++build-backend = "poetry.core.masonry.api"
diff --git a/package/python-terminaltables/python-terminaltables.mk b/package/python-terminaltables/python-terminaltables.mk
index b31ed332b6..062643adee 100644
--- a/package/python-terminaltables/python-terminaltables.mk
+++ b/package/python-terminaltables/python-terminaltables.mk
@@ -7,8 +7,9 @@
 PYTHON_TERMINALTABLES_VERSION = 3.1.10
 PYTHON_TERMINALTABLES_SOURCE = terminaltables-$(PYTHON_TERMINALTABLES_VERSION).tar.gz
 PYTHON_TERMINALTABLES_SITE = https://files.pythonhosted.org/packages/f5/fc/0b73d782f5ab7feba8d007573a3773c58255f223c5940a7b7085f02153c3
-PYTHON_TERMINALTABLES_SETUP_TYPE = setuptools
+PYTHON_TERMINALTABLES_SETUP_TYPE = pep517
 PYTHON_TERMINALTABLES_LICENSE = MIT
 PYTHON_TERMINALTABLES_LICENSE_FILES = LICENSE
+PYTHON_TERMINALTABLES_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
