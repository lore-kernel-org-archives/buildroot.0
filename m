Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D4FCD128D
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 20:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E0F181EC0;
	Mon,  1 Apr 2024 20:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hI-zuPKNHMD2; Mon,  1 Apr 2024 20:18:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8294E81ED3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8294E81ED3;
	Mon,  1 Apr 2024 20:18:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B3351BF966
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 20:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E516640079
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 20:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7wHRFZrNaik3 for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 20:18:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC2854008E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC2854008E
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 20:18:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3AD2C845D0; Mon,  1 Apr 2024 20:18:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Apr 2024 22:12:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9307fca067cab5ecea124f1a40e5dd8127d24ebc
X-Git-Newrev: bc0e7c275f6041a1c97cf14391e41504b97dcaa5
X-Patchwork-Hint: ignore
Message-Id: <20240401201822.3AD2C845D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dnspython: migrate to
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc0e7c275f6041a1c97cf14391e41504b97dcaa5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to migrate python-dnspython to the pep517 poetry-core backend
as setuptools is not supported when building with a pep517 frontend.

This package currently builds using setuptools as we do not yet
use setuptools with a pep517 build frontend. The package contains
a setuptools fallback which only can be used when using setuptools
without a pep517 frontend as the pep517 frontend will only use the
build backend specified in the package pyproject.toml which is
poetry-core and not setuptools.

setuptools-scm is not mentioned in pyproject.toml (only in setup.cfg),
so not needed as a dependency when using poetry-core.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-dnspython/python-dnspython.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-dnspython/python-dnspython.mk b/package/python-dnspython/python-dnspython.mk
index 1459ec8881..f0df733143 100644
--- a/package/python-dnspython/python-dnspython.mk
+++ b/package/python-dnspython/python-dnspython.mk
@@ -9,9 +9,9 @@ PYTHON_DNSPYTHON_SOURCE = dnspython-$(PYTHON_DNSPYTHON_VERSION).tar.gz
 PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/65/2d/372a20e52a87b2ba0160997575809806111a72e18aa92738daccceb8d2b9
 PYTHON_DNSPYTHON_LICENSE = ISC
 PYTHON_DNSPYTHON_LICENSE_FILES = LICENSE
-PYTHON_DNSPYTHON_SETUP_TYPE = setuptools
-PYTHON_DNSPYTHON_DEPENDENCIES = host-python-setuptools-scm
-HOST_PYTHON_DNSPYTHON_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_DNSPYTHON_SETUP_TYPE = pep517
+PYTHON_DNSPYTHON_DEPENDENCIES = host-python-poetry-core
+HOST_PYTHON_DNSPYTHON_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
