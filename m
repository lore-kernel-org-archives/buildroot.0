Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3992ECD128A
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 20:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3208815CE;
	Mon,  1 Apr 2024 20:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ezgpxasLh5xy; Mon,  1 Apr 2024 20:18:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1EEA81EEF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1EEA81EEF;
	Mon,  1 Apr 2024 20:18:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17F3C1BF3BF
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 20:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DADAC81E88
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 20:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UHBzUD8d3IxW for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 20:18:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8DE781E75
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8DE781E75
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 20:18:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1FEA83741; Mon,  1 Apr 2024 20:18:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Apr 2024 22:12:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 360c065a4d7c6168e2e78607a51fc01026533f7a
X-Git-Newrev: 9e938f2c0d7bb4b3745dc9ce7c4370c8492b7f94
X-Patchwork-Hint: ignore
Message-Id: <20240401201822.B1FEA83741@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pylibftdi: migrate to
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e938f2c0d7bb4b3745dc9ce7c4370c8492b7f94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to migrate python-pylibftdi to the pep517 poetry-core
backend as setuptools is not supported when building with a pep517
frontend.

This package currently builds using setuptools as we do not yet
use setuptools with a pep517 build frontend. The package contains
a setuptools fallback which only can be used when using setuptools
without a pep517 frontend as the pep517 frontend will only use the
build backend specified in the package pyproject.toml which is
poetry-core and not setuptools.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-pylibftdi/python-pylibftdi.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/python-pylibftdi/python-pylibftdi.mk b/package/python-pylibftdi/python-pylibftdi.mk
index 7dca37e416..7607c90d4a 100644
--- a/package/python-pylibftdi/python-pylibftdi.mk
+++ b/package/python-pylibftdi/python-pylibftdi.mk
@@ -9,7 +9,9 @@ PYTHON_PYLIBFTDI_SOURCE = pylibftdi-$(PYTHON_PYLIBFTDI_VERSION).tar.gz
 PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/d2/ce/ff3e83f3a14eb5b7950ff3657f07cdc3033dd0ded5c8ed093db515e1de33
 PYTHON_PYLIBFTDI_LICENSE = MIT
 PYTHON_PYLIBFTDI_LICENSE_FILES = LICENSE.txt
-PYTHON_PYLIBFTDI_DEPENDENCIES = libftdi
-PYTHON_PYLIBFTDI_SETUP_TYPE = setuptools
+PYTHON_PYLIBFTDI_SETUP_TYPE = pep517
+PYTHON_PYLIBFTDI_DEPENDENCIES = \
+	host-python-poetry-core \
+	libftdi
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
