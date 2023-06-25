Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01D5EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 14:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9634B81D46;
	Sun, 25 Jun 2023 14:09:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9634B81D46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hBFer1LFHRue; Sun, 25 Jun 2023 14:09:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDB8C8177C;
	Sun, 25 Jun 2023 14:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDB8C8177C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FFFB1BF909
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 14:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A2A360B45
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 14:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A2A360B45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vxpzAPyNZbQh for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 14:08:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA63260B83
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 14:08:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA63260B83
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C8D8584AC2; Sun, 25 Jun 2023 14:08:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 15:58:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0ae89957ecdb262eb4928a8a86c218436f61406
X-Git-Newrev: 15886f2761e358a884d6a70bc30889bc69742c5f
X-Patchwork-Hint: ignore
Message-Id: <20230625140857.C8D8584AC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools: migrate to
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

commit: https://git.buildroot.net/buildroot/commit/?id=15886f2761e358a884d6a70bc30889bc69742c5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that all dependencies of host-python-setuptools no longer
use setuptools as a build backend we can now migrate setuptools
itself to the pep517 build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-python.mk                          | 2 +-
 package/python-setuptools/python-setuptools.mk | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index fcb8fa0a99..85374ae8bb 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -233,7 +233,7 @@ endif # ($(4),target)
 # interpreter (both host and target).
 #
 ifeq ($$($(2)_SETUP_TYPE),setuptools)
-$(2)_DEPENDENCIES += $$(if $$(filter host-python-setuptools,$(1)),,host-python-setuptools)
+$(2)_DEPENDENCIES += host-python-setuptools
 else ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
 $(2)_DEPENDENCIES += host-python-pypa-build host-python-installer
 ifeq ($$($(2)_SETUP_TYPE),flit)
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 2674947162..d957930455 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -11,7 +11,8 @@ PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
 PYTHON_SETUPTOOLS_CPE_ID_PRODUCT = setuptools
-PYTHON_SETUPTOOLS_SETUP_TYPE = setuptools
+PYTHON_SETUPTOOLS_SETUP_TYPE = pep517
+HOST_PYTHON_SETUPTOOLS_DEPENDENCIES = host-python-wheel
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
