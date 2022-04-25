Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B3EC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 21:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DDDE82B8C;
	Mon, 25 Apr 2022 21:25:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n94cqsjX4PEY; Mon, 25 Apr 2022 21:25:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8A3682B49;
	Mon, 25 Apr 2022 21:25:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 47E761BF982
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 21:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4495F402C2
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 21:25:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2lKm9OQMBKTG for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 21:25:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 481A84027A
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 21:25:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E66A1844C2; Mon, 25 Apr 2022 21:15:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 23:21:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03d19696c752939aa46ac826df34ad9c2e4e6258
X-Git-Newrev: 37439adf81d0245d2bcb778ff4ff1c5e9ee49d8c
X-Patchwork-Hint: ignore
Message-Id: <20220425211512.E66A1844C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flit-core: migrate setup
 type to flit-bootstrap
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

commit: https://git.buildroot.net/buildroot/commit/?id=37439adf81d0245d2bcb778ff4ff1c5e9ee49d8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package needs to use flit-bootstrap since it is a dependency
of host-python-pypa-build. It cannot use the normal install command
because that relies on host-python-installer, and host-python-installer
itself will depend on host-python-flit-core once it is bumped and
migrated to flit-bootstrap setup type. Therefore, use the special
bootstrap_install module.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-flit-core/python-flit-core.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
index 0e058a1f17..2dc67bd517 100644
--- a/package/python-flit-core/python-flit-core.mk
+++ b/package/python-flit-core/python-flit-core.mk
@@ -8,6 +8,11 @@ PYTHON_FLIT_CORE_VERSION = 3.7.1
 PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
 PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/15/d1/d8798b83e953fd6f86ca9b50f93eec464a9305b0661469c8234e61095481
 PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
-PYTHON_FLIT_CORE_SETUP_TYPE = pep517
+PYTHON_FLIT_CORE_SETUP_TYPE = flit-bootstrap
+
+# Use flit built in bootstrap_install for installing host-python-flit-core.
+# This is due to host-python-installer depending on host-python-flit-core.
+#
+HOST_PYTHON_FLIT_CORE_BASE_INSTALL_CMD = -m bootstrap_install dist/* $(HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS)
 
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
