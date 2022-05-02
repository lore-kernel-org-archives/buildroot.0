Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112D7C433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 22:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC38360FA3;
	Mon,  2 May 2022 22:00:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HJoPDOQZebuI; Mon,  2 May 2022 22:00:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1FDA60E2A;
	Mon,  2 May 2022 22:00:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 034131BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5187360F90
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:59:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DvSF7QKfMcVc for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:59:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D481060E2A
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:59:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9991484EC9; Mon,  2 May 2022 21:48:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 2 May 2022 23:35:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 985e9f733c02b01a5beb88dad383e9a1fc4f60ea
X-Git-Newrev: f355fab421d728c262f93d4a44317cb5f850b725
X-Patchwork-Hint: ignore
Message-Id: <20220502214850.9991484EC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-installer: migrate setup
 type to flit
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

commit: https://git.buildroot.net/buildroot/commit/?id=f355fab421d728c262f93d4a44317cb5f850b725
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is moving to flit and will soon be dropping distutils
compatibility support.

We need to use flit-bootstrap as opposed to the normal flit setup
type since host-python-pypa-build depends on host-python-installer.

We need to add the src directory to the PYTHONPATH so that installer
can run from the src directory when installing itself.

We need to explicitly add host-python-flit-core to the dependencies -
only host-python-installer is automatically added to the depenedencies
for flit-bootstrap packages, and this would create a circular dependency
so is explicitly excluded in the infra.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-installer/python-installer.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/python-installer/python-installer.mk b/package/python-installer/python-installer.mk
index 862a251415..08f17499dd 100644
--- a/package/python-installer/python-installer.mk
+++ b/package/python-installer/python-installer.mk
@@ -9,6 +9,8 @@ PYTHON_INSTALLER_SOURCE = installer-$(PYTHON_INSTALLER_VERSION).tar.gz
 PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/74/b7/9187323cd732840f1cddd6a9f05961406636b50c799eef37c920b63110c0
 PYTHON_INSTALLER_LICENSE = MIT
 PYTHON_INSTALLER_LICENSE_FILES = LICENSE
-PYTHON_INSTALLER_SETUP_TYPE = distutils
+PYTHON_INSTALLER_SETUP_TYPE = flit-bootstrap
+HOST_PYTHON_INSTALLER_DEPENDENCIES = host-python-flit-core
+HOST_PYTHON_INSTALLER_ENV = PYTHONPATH="$(@D)/src"
 
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
