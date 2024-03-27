Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BEBC47DD9
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 22:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54AEF820C8;
	Wed, 27 Mar 2024 22:02:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 26WAiLtI6qNR; Wed, 27 Mar 2024 22:02:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A0DF82102
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A0DF82102;
	Wed, 27 Mar 2024 22:02:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE4881BF980
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA09E6065F
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XvdAhhtcteja for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 22:01:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FEF960BD2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FEF960BD2
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 22:01:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E681E8438F; Wed, 27 Mar 2024 22:01:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Mar 2024 22:57:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72c08122c051044628bc6391458b8ba980b32153
X-Git-Newrev: 0722978efbc9966c5595ebb60bf9667072af0cbe
X-Patchwork-Hint: ignore
Message-Id: <20240327220143.E681E8438F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bleak: use correct pep517
 build backend
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

commit: https://git.buildroot.net/buildroot/commit/?id=0722978efbc9966c5595ebb60bf9667072af0cbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to migrate python-bleak to the pep517 poetry-core backend
as setuptools is not supported when building with a pep517 frontend.

This package currently builds using setuptools as we do not yet
use setuptools with a pep517 build frontend. The package contains
a setuptools fallback which only can be used when using setuptools
without a pep517 frontend as the pep517 frontend will only use the
build backend specified in the package pyproject.toml which is
poetry-core and not setuptools.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-bleak/python-bleak.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
index ed3c3f2f93..716b6327ed 100644
--- a/package/python-bleak/python-bleak.mk
+++ b/package/python-bleak/python-bleak.mk
@@ -7,8 +7,9 @@
 PYTHON_BLEAK_VERSION = 0.21.1
 PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
 PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/6a/c0/3aca655fa43b8ff5340d99fac4e67061f53f42f092fc847bdd0559d67846
-PYTHON_BLEAK_SETUP_TYPE = setuptools
+PYTHON_BLEAK_SETUP_TYPE = pep517
 PYTHON_BLEAK_LICENSE = MIT
 PYTHON_BLEAK_LICENSE_FILES = LICENSE
+PYTHON_BLEAK_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
